Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1F21B9D8;
	Tue, 15 Apr 2025 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737740; cv=none; b=RpGxojyQFuoJqjkZqxHC2xA8XaTZEHzW/YvNJM17Gs/2xRibL83Q41WmoWEwY2EcQxRPF+wOqu6m0blkr59wo9EsSrD7tjQZDU3pxXlrniNUI+naCG8ovascjhVBbeJzMbllBOuYTlBk6sRuUy/TLZ3U1mVETV/ljwSmi5SXbPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737740; c=relaxed/simple;
	bh=VyZNJRydtqRP4tIJFtKk5xpXTG5rj7MnfC8y7oF8ZiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pFtAOz8vjznjVaL9oVWbZav4oU4U60HCAUcwVHOHrANw96Qlrz+tDcKZNABIoMnpBGLmjW/BTFP7lpFAWP7XbEdg28Y6mhRL7Eqg9xLo3CSe+VCR3hSA8ywFKThGwYLjPUVIf8zMczdCwAoxqdptYxLduwYR3aAj9D2yW9J5CR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2pxtO5L; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2pxtO5L"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227914acd20so54703585ad.1;
        Tue, 15 Apr 2025 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737738; x=1745342538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwKXjChYz6Is/rS9aNK0pEeqdCKV3joL7n7XCoKDlvE=;
        b=a2pxtO5LdRb5todPF/Xchy4m9qLC9a4LL6QHrj08iHIdDtLHK7Hab60aVW1h6yZIja
         ZDsGlPrtC8Ti8h1fE3ErzbR0Qncn+UutDLpfoLF5ePUQXKa/6HuO9wo8qFouQLgpVYEx
         KXSnEHyCTjVh+40P8POQdcDcvsfbksQ42qvS4NhCh9GA4lwtJGargpByZq37SqwMTAcB
         nSXGnCVm6tCYkxnNsVS0faewloapDSkBrul+boF/WyDOYW5BSe8brtCZSFq7UitffWtM
         vxaU/A5v2S4x39rllRLtH/dDWvkdOlxKwDf3RpjdKFXIJ5EPWG5TtkRkFJkIfypucQ8F
         OlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737738; x=1745342538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwKXjChYz6Is/rS9aNK0pEeqdCKV3joL7n7XCoKDlvE=;
        b=nkxZObNA6vKkGJ0N7BJv2bH4Vm50AEGQTBaxi8SYRT15j3tsf1tie3N/X3BN7nmYR3
         dt2KHwZYs+7S/D03duOerb6c+KFm6uhfdJ7u5qWUx/qkOoX68rbJR1Ryf6IXX6NT3WXT
         AvcgZbX2MK7qoL3U24+IGSdSQxArZhtxI4ygos363AMW/VYAK8nz+RCqLOnLRX1CcejG
         dumD4SPAdOWMGqFnJAk+EA5gXYl8IjOhj/Ct9ZWfIvvfZUla2p7dafJzrM0qf0yPDINB
         IR5zTVqkHhcm94SqwxW+HC7++FqlP/r3hZvDz3URgjWIGpwsIH0RW07htDQPtzSiHCWj
         6HPw==
X-Forwarded-Encrypted: i=1; AJvYcCVyLzKu1Kq7nYsm3CAza/1hQeo9J6GczB+meyZOC5Ji8dcejkBH9pGRxnnhxR9CqHRiVecMQfN+J4yeYno=@vger.kernel.org, AJvYcCXHulnq5eNRkFWEQcLSpKtdaTZf5mAFWTi8Ge9P7BthbrOB8f2VtbpX+qD18WnNRiU8mNUWeS820KUK@vger.kernel.org
X-Gm-Message-State: AOJu0YzCAjqt/ClJUB6vDr+RqH5rU3lKR5Zf+0vsEaLPx1HxL9icVIpJ
	TIwSZjF3ThT5uPktHqAseUkmWRONp+uNe2t21CHkf7Zo3oJ1MfstZyzih5jT
X-Gm-Gg: ASbGncuX2U5FSmDUwiiCex6Pco6m29oy+gQUrj+nUEq41Y699b8Dm9sUGM20aLkC6Vg
	3+GFKi+tBZgPzCimuQoL9y0txmmXjXWghPok9SxKqFPsajJRt/qwFGTsSqSWZeFgZVbYkuxP4Y3
	oag/vTVjT6S5dmM13FM+69rIBRwZVY8eu9BqZOqtBd0Kz+6ft+Rll2Te7LbVhSws2raF8dyol+U
	gxlgQJeVj3/KRJs8Yuvw+I4oa4WRjI0zknr0fnGpT/ST3ceTc0sOyAwBkWuvXzver8nEgKViRkn
	XTACSxFKxVGGEm277eNFfyqzkoXeK5lPIEUE5GI=
X-Google-Smtp-Source: AGHT+IFVOpubUVLLQVtvo7qirvjW9oD1wrN9HqH+MmwM72PBdc70iqYfMbJISwhSYp/zGkEAR1mu2Q==
X-Received: by 2002:a17:903:1b2f:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22c24a142a9mr64747355ad.16.1744737737795;
        Tue, 15 Apr 2025 10:22:17 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm120493215ad.217.2025.04.15.10.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:22:17 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: huawei_gaokun: add error checking
Date: Wed, 16 Apr 2025 01:20:05 +0800
Message-ID: <20250415172006.126740-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'cci' may be uninitialized, adding error checking to fix it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/Z_44zoTyLLdXNkKT@stanley.mountain
Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 344aa7aeaf..7b5222081b 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -359,6 +359,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
 			      unsigned long action, void *data)
 {
 	u32 cci;
+	int ret;
 	struct gaokun_ucsi *uec = container_of(nb, struct gaokun_ucsi, nb);
 
 	switch (action) {
@@ -368,7 +369,10 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
 		return NOTIFY_OK;
 
 	case EC_EVENT_UCSI:
-		gaokun_ucsi_read_cci(uec->ucsi, &cci);
+		ret = gaokun_ucsi_read_cci(uec->ucsi, &cci);
+		if (ret)
+			return NOTIFY_DONE;
+
 		ucsi_notify_common(uec->ucsi, cci);
 		if (UCSI_CCI_CONNECTOR(cci))
 			gaokun_ucsi_handle_no_usb_event(uec, UCSI_CCI_CONNECTOR(cci) - 1);
-- 
2.49.0

