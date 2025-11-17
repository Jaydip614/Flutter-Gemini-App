import 'package:flutter/material.dart';
import 'package:gemini_app/views/screens/gemini_live.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(offset: Offset(0, 5), blurRadius: 16, color: Colors.grey),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextField(
                cursorColor: Colors.blueAccent.withValues(alpha: 0.75),
                decoration: InputDecoration(
                  hintText: "Ask Gemini",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    _plusOptionsBottomSheet(context);
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  icon: Icon(Icons.style_outlined),
                ),
                Spacer(),
                _buildActionButton(
                  isIcon: false,
                  child: Text(
                    "2.5 Flash",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    _showListOfModelsBottomSheet(context);
                  },
                ),
                _buildActionButton(
                  isIcon: true,
                  child: Icon(Icons.mic, color: Colors.white70, size: 24,),
                  onTap: () {},
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GeminiLiveScreen(),));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(Icons.graphic_eq, color: Colors.white70, size: 24,)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required Widget child,
    required bool isIcon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: isIcon ? 8 : 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white12),
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
        ),
        child: child,
      ),
    );
  }

  void _showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(bottom: 16),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library_outlined, color: Colors.white70),
                title: Text('🍌 Create Image', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                onTap: () => {
                  // Handle 'Create Image' tap
                  Navigator.pop(context)
                },
              ),
              ListTile(
                leading: Icon(Icons.travel_explore, color: Colors.white70),
                title: Text('Deep Research', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () => {
                  // Handle 'Deep Research' tap
                  Navigator.pop(context)
                },
              ),
              ListTile(
                leading: Icon(Icons.palette, color: Colors.white70),
                title: Text('Canvas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () => {
                  // Handle 'Canvas' tap
                  Navigator.pop(context)
                },
              ),
              ListTile(
                leading: Icon(Icons.menu_book, color: Colors.white70),
                title: Text('Guided Learning', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () => {
                  // Handle 'Guided Learning' tap
                  Navigator.pop(context)
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showListOfModelsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  'Choose your model',
                  style: TextStyle(
                    color: Colors.white70, fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                title: Text('Fast all-round help', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                subtitle: Text('2.5 Flash', style: TextStyle(color: Colors.white70)),
                trailing: Icon(Icons.check_circle_rounded, color: Colors.lightBlueAccent.withValues(alpha: 0.75)),
                onTap: () {
                  // Handle 2.5 Flash selection
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Reasoning, maths and code', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                subtitle: Text('2.5 Pro', style: TextStyle(color: Colors.white70)),
                onTap: () {
                  // Handle 2.5 Pro selection
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Upgrade to Google AI Pro', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                subtitle: Text('Get our most capable models and features', style: TextStyle(color: Colors.white70)),
                trailing: FilledButton(
                  onPressed: () {
                    // Handle upgrade tap
                    Navigator.pop(context);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Upgrade', style: TextStyle(color: Colors.blueAccent)),
                ),
                onTap: () {
                  // Handle upgrade tap for the whole tile
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _plusOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(bottom: 16, top: 8, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAttachmentOption(Icons.camera_alt_outlined, "Camera", () { Navigator.pop(context); }),
              _buildAttachmentOption(Icons.photo_library_outlined, "Gallery", () { Navigator.pop(context); }),
              _buildAttachmentOption(Icons.attach_file, "Files", () { Navigator.pop(context); }),
              _buildAttachmentOption(Icons.add_to_drive, "Drive", () { Navigator.pop(context); }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAttachmentOption(IconData icon, String text, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: onTap,
            icon: Icon(icon, color: Colors.white, size: 25),
          ),
        ),
        SizedBox(height: 8),
        Text(text, style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

}
