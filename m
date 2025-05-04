Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3AD1EB5C9
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746381420; cv=none; b=MAnmhewV6e4eCSgW0ncTG1fGaxK17mzdDZ/nwAUlPcA1x7lAXx7LVKB42lrbjdsYR0fDCYhU4RXdpf+7ZHj1Y0Y14ktX8b4BzEv9bBLwE83ciQM4rDgnUyTQbN6l4a1rmSD6S5+LBN5Gb0cVP31pdFmImVsN0+hl+p+1DDqgfeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746381420; c=relaxed/simple;
	bh=J+5W1i7tI4MKm1/n+7tRc/58wyZXquyd1jaLBZuEn4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K5W6wyf+2JnnPKCmUx13A/W5/SBgUh8o44+tA9KTgLk+RcrkdRIcVjjbjnOnjemBYQtgJwVogVZ3c2r9TgOS+Yb44axHrpGIzRQ6Qc672v+t3pZ+Yk70k9XQbeAfBtwJcj4+qCrTbUgvDvdgKbKijwbpEX66Knys7qmSGLipKno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V16x4dDz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V16x4dDz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87996C4CEE7;
	Sun,  4 May 2025 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746381419;
	bh=J+5W1i7tI4MKm1/n+7tRc/58wyZXquyd1jaLBZuEn4Q=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=V16x4dDzPGl+AILQOKL+i3WLTvu+2z9IW6s6kh+2ElMcBXGMpBG0VNlK+ZJALhu6r
	 DdGY2tF+ZG3HpkAf2UjkHlgY3qjpU9NRu8gqgG7KNLBW5KUL9s4r21XKQ5dVAEgKKD
	 CUyc34UhEYwT0kC8CuuqTAx2ZZdoc5Pcc6uLuxCKs8CtM23nKPHejcWq8Nhn3SjMyH
	 Wf/mBuwbtwup3LThIsmECGn7n2SBa+CBfrQC40T38UV+E/DgicISPud1Eyod1tO1pz
	 D2rJAlCUya1MznKcmmn30MVwYJK0Uk+jnTl6Ozcgo6ibhSk19tf8RZBJeksiwPY2or
	 8tqCh1x+E2nZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747F0C369DC;
	Sun,  4 May 2025 17:56:59 +0000 (UTC)
From: Mark Dietzer via B4 Relay <devnull+git.doridian.net@kernel.org>
Date: Sun, 04 May 2025 10:54:52 -0700
Subject: [PATCH] Add GPD Pocket 2 04/17/2020 BIOS to drm_orientation_quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-gpd_pocket2_biosver-v1-1-7e2506ea723f@doridian.net>
X-B4-Tracking: v=1; b=H4sIAOupF2gC/x3MQQqAIBBA0avErBNs0IKuEhFlow1BikYE4t2Tl
 m/xf4ZEkSnB2GSI9HBif1V0bQPmWC9HgvdqQIlaaqmEC/sSvDnpxmVjnx6Kou/REio5aG2hliG
 S5fe/TnMpH9GxRTtlAAAA
X-Change-ID: 20250504-gpd_pocket2_biosver-662fe240755f
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mark Dietzer <git@doridian.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746381419; l=1794;
 i=git@doridian.net; s=20250228; h=from:subject:message-id;
 bh=qciSeWWt/KY5XJWHB5Z6wuF+QWqEbYgWc54AWkioEmA=;
 b=4FpyCa8WlZkfO2LABvQC2VkZUqoA4A8W4lNk+VU7GoRvA7U974YvF3Ogua5cDTtwOdxChU6IY
 BtL8JQrhZjtAUxg8xOS45hL/Qsrq7HHO+TUmPrznJ0d0i1QhL6aIPMa
X-Developer-Key: i=git@doridian.net; a=ed25519;
 pk=XY9bZ7EBhoLNoRt6zd2/vutpAXC3tsX6OytpZHjbUsQ=
X-Endpoint-Received: by B4 Relay for git@doridian.net/20250228 with
 auth_id=353
X-Original-From: Mark Dietzer <git@doridian.net>
Reply-To: git@doridian.net

From: Mark Dietzer <git@doridian.net>

Add missing BIOS version to drm_orientation_quirks for the
GPD Pocket 2

---
This seems to be the latest available offical BIOS for this machine.
I can no longer find it hosted by GPD themselves, but did find it
at least archived (on archive.org) here:
https://archive.org/download/gpd-pocket-2-drivers-and-os/driver-and-bios/

Testing and confirmed working on my own GPD Pocket 2.

Below is the output of "dmideocde", specifically the BIOS section

Handle 0x0000, DMI type 0, 24 bytes
BIOS Information
        Vendor: American Megatrends Inc.
        Version: 0.27
        Release Date: 04/17/2020
        Address: 0xF0000
        Runtime Size: 64 kB
        ROM Size: 16 MB
        Characteristics:
                [left out for clarity]
        BIOS Revision: 0.27
        Firmware Revision: 0.18

Signed-off-by: Mark Dietzer <git@doridian.net>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c554ad8f246b65a1d20237d6d52c699c8afd2329..a90ada0c7adf4f25bc58c335d1920ccd5e690a71 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -58,7 +58,7 @@ static const struct drm_dmi_panel_orientation_data gpd_pocket2 = {
 	.width = 1200,
 	.height = 1920,
 	.bios_dates = (const char * const []){ "06/28/2018", "08/28/2018",
-		"12/07/2018", NULL },
+		"12/07/2018", "04/17/2020", NULL },
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 

---
base-commit: 593bde4ca9b1991e81ccf98b0baf8499cab6cab9
change-id: 20250504-gpd_pocket2_biosver-662fe240755f

Best regards,
-- 
Mark Dietzer <git@doridian.net>


