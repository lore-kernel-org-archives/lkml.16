Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35EF1E9B12
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321131; cv=none; b=OnJuhJCzizhtwrea7e91xLGl+YqNVT1QAxok9qlIJwa0GrhzNweh1ysYE4I4eFvIkqg2hR4Ff1NIdnq66Z4V72z///xE88GoDkpmqhClvNgV63zEg8s5OY4lKfpeQN/pzAVk5zXf5N0JaTzsyPOOTM/GbGhxhBOtNpjaQOSBgg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321131; c=relaxed/simple;
	bh=R9I9i/Zujv3k56HbqAZj1mwgzRySnfxVZYpxCOHucxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ODNyVlkNR6xbM50Cj+7B513QGUQh763QSzDAQRkCGgH/1uyYUD2Ni5MwocZXQC2fRbxMcWluRS32OCxmHf+YVc2WehBMHLvAM6PSOljjU6mwcoARGjnB4zaNpXkqhevqd7ztsifjmO5KsoXGUcqZJ1E8GQcgRoQfhV7ma2da+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=cIstcjUN; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="cIstcjUN"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zhfzh556kz9snt;
	Tue, 22 Apr 2025 13:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1745321120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KGNyJeJF+IUDJSrb3/6OYClcKxuunuMKQjpVySTNflg=;
	b=cIstcjUNoZngeQy9Sw36XC2gUOnH06hV4ygmnKplXL4u2Fd3HvnhRfCLSmcl4QWRTu3DhI
	EsUqVFfQMtHZew66ejvdhqTvfjdNzHbh3kndFQd481CY+NMsJVjapk1YGxKQhSGTt9IkgF
	ti8s9Lz+K5R7NNxnu0m1iQah6XW1o7TtU0lwIEZqsf6jWjGqNoNRDkJETdafxH4xiEj0Sn
	YGweOxB1zGdsEWQ9TZp/4+42cJ4Br2bXxK64PDop9sscFlm1/k6oTmeMehCJpVj1hynpAv
	NHF1BFs9PhTl8NSQaZ9qBOs3R7HZMcHmBDcRgM98fmtRORro65g19pFEECQTbA==
From: Lode Willems <me@lodewillems.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Lode Willems <me@lodewillems.com>
Subject: [PATCH] Input: xpad: Add support for 8BitDo Ultimate 2 Wireless Controller
Date: Tue, 22 Apr 2025 13:24:27 +0200
Message-ID: <20250422112457.6728-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for the 8BitDo Ultimate 2 Wireless Controller.
Tested using the wireless dongle and plugged in.

Signed-off-by: Lode Willems <me@lodewillems.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c33e6f33265b..c933e47173bd 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -387,6 +387,7 @@ static const struct xpad_device {
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x310b, "8BitDo Ultimate 2 Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x6001, "8BitDo SN30 Pro", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x2e24, 0x1688, "Hyperkin X91 X-Box One pad", 0, XTYPE_XBOXONE },
-- 
2.49.0

