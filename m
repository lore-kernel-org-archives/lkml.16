Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DB4BA49
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744773566; cv=none; b=A/eh50Ms8pkOMwQMONWFS7iVKOiySymhv05RS+9ICQsENJzrH1c02sHeXo49uSWb871PD3Rb0nufNvIRNjrUs2PMmkhfju62Tllr0RB4O1R0cYuVuMHjBeJXC0dq9ys/EcYSyqTs3eM2HuVf4ERHdd2SebYfY6mcQ1VX1juYpWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744773566; c=relaxed/simple;
	bh=Uzmnhpdcrd9Puf0yi9dhnQyqgEDH12k5dAXkPj3g2/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GDzt/Ijg2HlaFk5uXQJVOfNXQ+2Tu0mdrRiTjMPvgGsW31QnIxrgjg5stT7b4YW7epco8SaWJswe8TpSCPQtCkHnSOOUq3dAe1twpBvP/lChIVOPn9HuZzO40biRJuHjEXFFn4VLzl2tKMwm2Z8aWBdRzTwby/w3f/gghhgj+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=h4Og2aKV; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="h4Og2aKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+wt5v
	UURw/DJFACEu90b7DaEI9UOLsDCNGeNcQkfaso=; b=h4Og2aKVvvye/QijPGoPF
	qRAuh31T+X/0a9xnYCk00o03Q/4p520avaT7t2Ql/WTJJ1OKuTBPMs7a/8tg/GHd
	qLU9sQjZeW/zmXhTBXJSx6KhWDgthFXDgFfuS+1e+WpjTQ1BhGOv/yToU6NjKVDM
	o6pyAjFGW7h/aDop539HS4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXLQ+PIf9nqs2SAA--.2509S2;
	Wed, 16 Apr 2025 11:18:40 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	ribalda@chromium.org
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH v7] media: uvcvideo: Fix bandwidth issue
Date: Wed, 16 Apr 2025 11:18:38 +0800
Message-Id: <20250416031838.254061-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXLQ+PIf9nqs2SAA--.2509S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDKry5WFWfKF1xAr4UCFg_yoW8Xw1rpa
	1ruayFyry7JrWFganrJa1rKa1rJanakw4fKFW3u34qvr15JryxZFy3G340q34qyan3Aw1a
	vF1qqrnF939Yvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmhF3UUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiwgkx3mf-H9pArgAAsX

From: chenchangcheng <chenchangcheng@kylinos.cn>

Some broken device return wrong dwMaxPayloadTransferSize fields
as follows:
    [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
    [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.

When dwMaxPayloadTransferSize is greater than maxpsize,
it will prevent the camera from starting.
So use the bandwidth of maxpsize.

Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..9b7e34e38b61 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (stream->intf->num_altsetting > 1 &&
+	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+		dev_warn_ratelimit(&stream->intf->dev,
+				   "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
+				   ctrl->dwMaxPayloadTransferSize,
+				   stream->maxpsize);
+		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)

base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.25.1

