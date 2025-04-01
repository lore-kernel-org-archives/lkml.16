Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE183C2ED;
	Tue,  1 Apr 2025 02:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743474670; cv=none; b=pM/Ana3tic/VMQTo3WXBuLL4g+fnuRkebTPmmvWzFlqhO/metTq0My9PrLsjjS5pLUtdGzyRQxbmBsPAL2UrS58E0iAzmHxI57wFh6ES9Huo52qNeDSYIjL6NpYT+LopcPD1iiu3U/sJbclMMuWWOwGpDqwxA33pu03dzXNu4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743474670; c=relaxed/simple;
	bh=4MYpM8jnr/X1wA3ZJOyYKyFQrCEJfGH3h3VkCqnbT6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZIt8ApLyaRAuxdDDjJwEfduG75nDdFO5BAoCUQs0/abElSVz+nM1nowKSCYiQeHkoeiYv9C17Y7I4C/UMQy8MguJq1mHRZo2bh2x5kdlDoo/39gcjse1vsGD0Kh51PNn3lR1bQVW1KPx3C/yxZyTAEwVSOCFyM3tIa3xcOn1nbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ckz3va9S; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ckz3va9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZDN6N
	BtOaJ5NgefmbSoc75r2LxpCFClFNBh8uIuOEGQ=; b=ckz3va9SxR/N+V2EL50vl
	SBT0t09ErUhHCl57MhIAY2idov3dRfHPllubCh1yNnVLHeC7B9j9+jOQEdPGWA2D
	wvf8LM1fFY1p8QLosqGuYIajP9waXxzDxBNcxRltp2c5sttBWD/2AF71+Ew9Wnh5
	JjgIWswuxRTomhh8jdIhDI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXYaTWT+tnqHd2DQ--.1943S2;
	Tue, 01 Apr 2025 10:30:48 +0800 (CST)
From: Miao Li <limiao870622@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	limiao870622@163.com,
	Miao Li <limiao@kylinos.cn>
Subject: [PATCH] usb: quirks: add DELAY_INIT quirk for Silicon Motion Flash Drive
Date: Tue,  1 Apr 2025 10:30:27 +0800
Message-Id: <20250401023027.44894-1-limiao870622@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXYaTWT+tnqHd2DQ--.1943S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry7Xw45GF15GF1UCr1xZrb_yoWDJrc_Cr
	1DWan3u3W8CF9xtrn2va1fZrW0kay0vryvgFyqqry3JFW7uwn5Jw47GFW0vw1UGFykJFsx
	tw4Du3Z8Zrn3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRitCz5UUUUU==
X-CM-SenderInfo: 5olpxtbryxiliss6il2tof0z/1tbiShYizWfrTOx3iAAAsg

From: Miao Li <limiao@kylinos.cn>

Silicon Motion Flash Drive connects to Huawei hisi platforms and
performs a system reboot test for two thousand circles, it will
randomly work incorrectly on boot, set DELAY_INIT quirk can workaround
this issue.

Signed-off-by: Miao Li <limiao@kylinos.cn>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 8efbacc5bc34..61583a1b7ac6 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -383,6 +383,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x0904, 0x6103), .driver_info =
 			USB_QUIRK_LINEAR_FRAME_INTR_BINTERVAL },
 
+	/* Silicon Motion Flash Drive */
+	{ USB_DEVICE(0x090c, 0x1000), .driver_info = USB_QUIRK_DELAY_INIT },
+
 	/* Sound Devices USBPre2 */
 	{ USB_DEVICE(0x0926, 0x0202), .driver_info =
 			USB_QUIRK_ENDPOINT_IGNORE },
-- 
2.25.1

