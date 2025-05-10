Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA7621B9E2
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746872498; cv=none; b=bFlLIryL0QwmPzpGUQQvRagpDp5+VMUilg6AUig1xTxOCn4TpHz+/cX1/6LTOiTmyYp05epP1SmYY/x2oj4a+m0ebeA0/b6THVjz1tWtFq8t8ElWMyB3jju2s6MGA8Cc3Abr3S/tK6Ko8nmsrC3cyBhEu7rYMWQd0wxT9C936ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746872498; c=relaxed/simple;
	bh=wvyfyP5GNb7dYAUO9N524DiOE/hrns350VPRomjD9R0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0kDVbqTRL6zdQ0gokeQDHOAi6xJGjCdW5HVlg648qdKK7AUfyOexL76/P769cHodVd70luaQQVIkSdt3EE6EhmlS0yZnSV2RtHCwPGOdNHMsGdL65OChU8pEp8ur1lICcjpAPTCcD/j5/y3+ZabQOKSburvgBxGRygg3E8728g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeGORnBt; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeGORnBt"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7423fb98cb1so1264000b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872496; x=1747477296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5uq+Zst8YwtPGpsQlMHD4aGLCy+mUn3+jss35jpDE/s=;
        b=NeGORnBtIR0rahPird2feB5CPO9/+LrPo6HDEvGG3wHpaa88y4b1aOYH1iwppHgOHJ
         Ed2hlHkcvgB9HJ2exgzBsS4m8+AKHgHeMhm9VPakUsQMz786Cn8U/BKNI3ttfbdtnxSz
         dBW+v7x5Cbfnjr50l9r9TT/+pTNKnuhEWQAqhUAxPHQiWso58USZ3AI0tTqDdsUwCHJ0
         4Hkxfkpaz86Q4lThn/ZfO9e8u1s4uBSgmJp3Z6tg/ClaqJSYyEvaJvkEMkrihPlXxovs
         6WXUb/fQOvjYKnmr2v3eizD/ozX9oUR+zQzs9skGjwYMKnG1ZtJ9UTd0HT41etTgfoqT
         QtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872496; x=1747477296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uq+Zst8YwtPGpsQlMHD4aGLCy+mUn3+jss35jpDE/s=;
        b=BAcijFX7Qy4K1bzw6nypzyxg12HymNadhGmo1vT+YiqMknvVkq4LnHOS2SgUAHkFE7
         S2moipTfsjYTikXOvuhBZnm8sfdXMpWJ6BW7KjCWNKCHjvlFLCv8SDzoxLzSUVkLoxaG
         qenA3ZvqAatIKui+ksrkO6SQ56yoe7Or7K0uzaVLktoJ3Sc/DmrHmHQKogbTUg9ZOj3a
         L6k+7eI5r3mfhGDyOLi4r9cUjfKqmHFRTsci2obpebNg8o1mPkjKLYnQ8xUHrUmT/Wrw
         kxxuCmXM/wv8IFIM36RaHSOFClPkQU0x0Y/ImizM+9Q7bQXPWaiaerS6UBp70YnPJYcv
         UmoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyuvBMF+r3v/92shYLDRFpI3cCxPXsSte8cI349aEiY3lMEmyVKqr1vBrGRZ47O0CT4BbLjt8H2uPQExI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1nDG/mp8hzVsmIvqXGTj4xWngJtvdgVXa970MNSc9TKHYbs99
	SrL/agRw4TtBFZENlBGxFjIRbOcb3/r1826h9/xd9Vh676rxK2a/
X-Gm-Gg: ASbGncu9zJYQmtPeme406sVxfljnPS52COUilK+mAO1CBlXUSuVQ73Nx7TK3CHU0uIs
	GRmN+L3GM7gggFgeeh3BqblTWv2RPKOhPBYM/X3lVbUtL1C3zTFvui4i8HVRVxq2ajI4IyD7xah
	bDwnnRmodO9cBl2kAWtalMiK+DR9lo4vipkSrOZ3oZf4/PipfNoeoVjGofe1Ja/oAi3CkEOd7cz
	HuoGSx6dnjKdU1wDvj+qxDt5K7CyLw6b8Jk8DyW5X3gd++NuLdk0MLGKaUlDO//tnMV3Fe9uQnV
	0jixjQL/fMmJiLkJ5Hnu8tNZKL54M0009yzMIpccRyZXQiNUGL0sFnvj
X-Google-Smtp-Source: AGHT+IGTyFC3y3txfPtKS8vmVFwlrXN1ldd56g5XK0RMzSCg6bJ2N10vkSvR4w29AgSFP+E0lUB6TQ==
X-Received: by 2002:a05:6a00:2d08:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-7423bfb9282mr8688337b3a.14.1746872496113;
        Sat, 10 May 2025 03:21:36 -0700 (PDT)
Received: from ilya.linux.jp ([240b:10:c301:9100:7db1:c9cc:c837:2394])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8efa2sm2978554b3a.165.2025.05.10.03.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:21:35 -0700 (PDT)
From: ilya guterman <amfernusus@gmail.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ilya Guterman <amfernusus@gmail.com>
Subject: [PATCH] drivers/nvme: Add quirks for device 025e:f1ac
Date: Sat, 10 May 2025 19:21:30 +0900
Message-ID: <20250510102130.14710-1-amfernusus@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ilya Guterman <amfernusus@gmail.com>

This commit adds NVME_QUIRK_NO_DEEPEST_PS for
device [126f:2262], which belongs to device SOLIDIGM P44 Pro SSDPFKKW020X7

The device frequently have trouble exiting the deepest power state (5),
resulting in the entire disk unresponsive.

Verified by setting nvme_core.default_ps_max_latency_us=10000 and observing them behaving normally.
Also by running with the patch couldn't reproduce the issue after multiple wake up from sleeps.
Running without the patch again reprodcued the issue on the first wake from sleep.
---
 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index d49b69565d04..d62fef76cc07 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3734,6 +3734,8 @@ static const struct pci_device_id nvme_id_table[] = {
 		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
 	{ PCI_DEVICE(0x1e49, 0x0041),   /* ZHITAI TiPro7000 NVMe SSD */
 		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
+	{ PCI_DEVICE(0x025e, 0xf1ac),   /* SOLIDIGM  P44 pro SSDPFKKW020X7  */
+		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
 	{ PCI_DEVICE(0xc0a9, 0x540a),   /* Crucial P2 */
 		.driver_data = NVME_QUIRK_BOGUS_NID, },
 	{ PCI_DEVICE(0x1d97, 0x2263), /* Lexar NM610 */
-- 
2.49.0

