Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46363C17
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 01:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746669406; cv=none; b=B9uTy18a0xEJEFCVD5WJbJ22xAT/4G4ECsmJr+VY2a1OJ846JOGRagRlLq6RkEvnD1WcrsLCEDpGCRL75eN5v6qANKEG43DJKBpTqeaO8YLUX1NQ54toiOIUdkHBu3Wla/rRRsgun1ZUBI7c5q3Jmkyf3ppPEhWT0kVT2YpUMic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746669406; c=relaxed/simple;
	bh=WBXa/Ye/zLlnzrQ4CHT8UO61bn51am/3m3eV3ceaDJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R+aq3fFIMTp0q8xHfYJEadaDLrwoUYgNTJ7CfQ3t45en7eW0J7WnJTiiBU3aaGWZXhk8qldf1YIy8MLmpjQ12NsE6YKdZloV2enfVqT3vlE0twBPixYY8DMzSQapFtbNJottBAB26HMZgaThxeDjGf+jriGK3JFEs6D1LvJp8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RQHJWjSc; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RQHJWjSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=shiMd
	LT84fFwKU1ne2krV4nFPcgrNqkX8Bo7YL0kJcs=; b=RQHJWjScre8Na6h8csRMR
	b2drtxp0YiU/MzljqN+xGYl3Gr+BskYH/ERb0X1SLtoPKVR1OjJmywSTNBObubrp
	2YjbOaJDeBj9TXakjA7UX9bx3nXnf/c0J8ibc8z6gk9Yv+inBsSbBQdpD/BAPuGt
	kD2FXq1eVH/P1xxbS7EEE0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAXCpUmDxxolLbgCA--.57679S2;
	Thu, 08 May 2025 09:55:52 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	ribalda@chromium.org
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v8] media: uvcvideo: Fix bandwidth issue for Alcor camera.
Date: Thu,  8 May 2025 09:55:42 +0800
Message-Id: <20250508015542.148301-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgAXCpUmDxxolLbgCA--.57679S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDKry5WFWfKF1xAr4UCFg_yoW8Ar1Dpa
	1ruayFyryUJrWFganrJa1Fga15Janaka1fKFW3u34kZr45JryxZFy3K340q34qy3Z3C343
	tryqqr9F93yvvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joZXOUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiTQNG3mgbTL69awABsA

From: chenchangcheng <chenchangcheng@kylinos.cn>

Some broken device return wrong dwMaxPayloadTransferSize fields
as follows:
    [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
    [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.

When dwMaxPayloadTransferSize is greater than maxpsize,
it will prevent the camera from starting.
So use the bandwidth of maxpsize.

Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505072016.LlOxF8BG-lkp@intel.com/
---
 drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..0d5c17509ceb 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (stream->intf->num_altsetting > 1 &&
+	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+		dev_warn_ratelimited(&stream->intf->dev,
+				   "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
+				   ctrl->dwMaxPayloadTransferSize,
+				   stream->maxpsize);
+		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)

base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.25.1

