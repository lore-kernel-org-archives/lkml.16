Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C9C21B19D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749796682; cv=none; b=nwz0A08eS/yW58MOlR3SL3pZ+KTIBD15kJfiDE70sMXtYHQBD42goCKvLrji4rdKyBegow3rN0RlneefkzfDlEkG1tv3L4NM49cIvmwP54vvHiLma4IgFf1IcNa9sqLmZsVRAVbJZoE5odjd3y9OVxkzvjLwicJcXXbQzzfTeIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749796682; c=relaxed/simple;
	bh=niW1Z5/2R05MmPnD4eCTnKvr4c0P3IfHZsdwsFaDST0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jt/2c0rDwTMgdsgTjig230X3JPq41NH6waA9s8VR8CYT8+9cpCWOtWJb0mvzY5qLh84kzeYi4YQp5HrTZdJFvzxCJdLYHHNSf3/4N44CsHu+e4KE9IkBz+ay6k4t9Y4vW4WLRyarj01Hr0BzZCUB8GC2fNsTZnml79Wyl3mf1HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SL9wuNi9; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SL9wuNi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4Z
	4Zk6gFMiiiZCc+KOTwsC9S+QK7pJWpmIYxo8X11Ys=; b=SL9wuNi92DVR4EZZg1
	AcrmdZhnTbCzkePXev9RZ2c9A4mBcPkVyZR1r5Sd5MfJTFIPW6EX4VxC2qGqCgQ9
	RfeqOC/NB3B0M5+S9bc7pgO5LMBRTMM7sNgfOzVP4G91LJOuOwrgi142L1QFaBgt
	Vaad342x3Z0IHqsY5D11Yb1zo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCXdSQGx0togsW6Bg--.7897S2;
	Fri, 13 Jun 2025 14:36:55 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the KTMicro sound card
Date: Fri, 13 Jun 2025 14:36:36 +0800
Message-Id: <20250613063636.239683-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCXdSQGx0togsW6Bg--.7897S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr45AryrAF1UtrWfXr4fXwb_yoWkAwb_Ja
	1Y9FW7AF15GFy3AFy7KF1ava4vyay7uasFgF98tryDta4Dtw1UAr42yF1kZFyqgrZ3JFy3
	J3WDtr1S9a47JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbl_MDUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1S2mRwBrT2hLxekfZwAAsU

From: wangdicheng <wangdicheng@kylinos.cn>

PCM1 not in Pulseaudio's control list;standardize control to "Speaker"and"Headphone"

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/usb/mixer_maps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 0e9b5431a47f..faac7df1fbcf 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -383,6 +383,13 @@ static const struct usbmix_name_map ms_usb_link_map[] = {
 	{ 0 }   /* terminator */
 };
 
+/* KTMicro USB */
+static struct usbmix_name_map s31b2_0022_map[] = {
+	{ 23, "Speaker Playback" },
+	{ 18, "Headphone Playback" },
+	{ 0 }
+};
+
 /* ASUS ROG Zenith II with Realtek ALC1220-VB */
 static const struct usbmix_name_map asus_zenith_ii_map[] = {
 	{ 19, NULL, 12 }, /* FU, Input Gain Pad - broken response, disabled */
@@ -692,6 +699,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x045e, 0x083c),
 		.map = ms_usb_link_map,
 	},
+	{
+		/* KTMicro USB */
+		.id = USB_ID(0X31b2, 0x0022),
+		.map = s31b2_0022_map,
+	},
 	{ 0 } /* terminator */
 };
 
-- 
2.25.1

