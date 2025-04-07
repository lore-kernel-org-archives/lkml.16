Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38BE21D3D1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010225; cv=none; b=B9pEblTnhVfUCuEMg9ukn+VXBnq34m7lVHw2CINVUx3ikVstm2tAHqlUReFX7ABMDQrR3wPqWyFmS/KGoxuieDnkBCCH5emwO/NEmgHj4dG/BqPAemkDL3jNaqmFc812euVt2rkA4VNHPUotz0L4pnmKfAyMuzw5cEppKqFJppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010225; c=relaxed/simple;
	bh=B9j3F74Q7ecV+6Khp4MhK5nezhNLnQ5WD2k7mfOwRYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fk48Jcwl3t/WYa0whi/b5H47fJwqAhQEyKV510slTUEqNOlC/lLQjze5v6E7gMS9FHZpZf74KP4DD0OhMJRhyA3bRuD5yVlsLY6D/QVKab8OwRIqUH2MDJdLzlP1Z7tCPphcK43J5dFHcTcIhdG1kKWp5IqnXES8diC1HPzKkPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowABXAAHfe_NnCWDSBg--.45177S2;
	Mon, 07 Apr 2025 15:16:49 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: hamza.mahfooz@amd.com,
	chiahsuan.chung@amd.com,
	sunil.khatri@amd.com,
	alex.hung@amd.com,
	aurabindo.pillai@amd.com,
	hersenxs.wu@amd.com,
	mario.limonciello@amd.com,
	mwen@igalia.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/amd/display: Add error check for avi and vendor infoframe setup function
Date: Mon,  7 Apr 2025 15:16:27 +0800
Message-ID: <20250407071627.1666-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABXAAHfe_NnCWDSBg--.45177S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4UAr47KFW8CF47Jw1rtFb_yoW8Gw4Upw
	48Ja4qvrWkWFZFyryUAF1ruFWYk3srJFW7Kr45Aw15W345CrZ8Ja1rJwn5t347uFWrA3ya
	y3WDZ3yxXF1vkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRCnmRDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwFA2fzOj3udQACsG

The function fill_stream_properties_from_drm_display_mode() calls the
function drm_hdmi_avi_infoframe_from_display_mode() and the
function drm_hdmi_vendor_infoframe_from_display_mode(), but does
not check its return value. Log the error messages to prevent silent
failure if either function fails.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0396429a64be..d6feafb8fa3d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6152,8 +6152,8 @@ static void fill_stream_properties_from_drm_display_mode(
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		err = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame, (struct drm_connector *)connector, mode_in);
-                if (err < 0)
-                        dev_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
+		if (err < 0)
+			dev_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
 		timing_out->vic = avi_frame.video_code;
 		err = drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame, (struct drm_connector *)connector, mode_in);
 		if (err < 0)
-- 
2.42.0.windows.2

