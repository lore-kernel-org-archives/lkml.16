Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15731E5B60;
	Wed, 18 Jun 2025 05:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750225904; cv=none; b=nd6O8863ARN4P+y2ZsHh0PJmNX6HOMPeL8Ma1MJ5hqfzWQ5iU32PrmJHKZQUF8QDxXhsRXhpUKpg7x6aoHGH3Hrcczx0XIII/MuTggnEgcPYTPvRWG6h2lJWqTQXUtqauXgAzAzpmxkNUytXNx1a17wG7hHNB/mOhs0BiMB1kKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750225904; c=relaxed/simple;
	bh=2xyOVvq1JWwubLx2N4PQv+4xr+CIeNVHXgasbtLWbH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SiRHzXv+/MIeFqt5HYmOYlXRbYgyaot3y974A0IikDI1YY+aNIVlaCrfAAMT3dBfEbnm3WOuZ8Is9RpiVR/LeaKGpEG3Di4djz9G0r8ZyIBAMVMasg/wYcboAGpXXx2nI5eisBr+wIKhcywAwQANKwVgIOSAQF3wK7Rin9mLgro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23636167b30so58503635ad.1;
        Tue, 17 Jun 2025 22:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750225901; x=1750830701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPtIhKj+67MKXvsdqiR5TldExHdcv6/Kt+rfIgkMSeM=;
        b=nFfUcDpLkE7q6S3qNP4BKxlawDz7SraPqZY8JGlssw2Yrc5B5A0HBWBRA35Evh6rch
         gFR3PX7BtTNMyei//RyQBdMAIsVKNGlq4lT8tqpmBmXqlkJ4UQKXWOq1zNjUxxUNny3X
         4PW4UrI+0yoDrpifeUGhRDmP4JTsDUSighm/ySr9S29q42DRw0pRfCRYfk2q7xWIF/Gx
         9KfzJBykM2yKhFenj2tLeH9SXBDqxMG2BpIfdKaZ7eL2t4SEIv26tzOQGeJouJYVcsMa
         rBUZ+Xfh55+oGUA/1UGOy8Ftt2tNDm10M+qldEFK/fGcuDvkEj2pETog7HOAwWwl7/fr
         UU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXB1zdi2OgVia9OQGdVWuyIk0TkiXVhFTyBrjJRVEel0RwrfzXkTxIt687VcG2T2FZyFJpJvNpj+/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEyrT5U9GL74EhTkKuNFXmxcaxlGWY4AEaLPT4UsXEuAjbPfNX
	HKcEqI1Tjcod0md+jQJMJxM38Ti4cnGAeCQEW8F1bPCXqQLbEIP55hhVYUYZC91a
X-Gm-Gg: ASbGncsr817Mq2+w9RAhKHRZDrqIRvLNrEgpQDhXGQjBQqWwHbSVK79+alVI+pkhgMp
	wpL5S79sqTEerr1Vm+1oKR5lEdlP9ONyqpDquphjJ/cOMqABz7bVyETpY+WTSXpWkBcoWRWxyNl
	hfURfPo2ZKnILremQ4D1aO+TMuCwMqPmYxNKxzb3Xfs6+53O46eUE79nqAQ2b8DW12j6uuHOSeV
	r/w2bJ1XNY5LlzKbAUkJoLq7EOJWveict1Zvnmjvsw2p4u0Th/9o9X+lrA+6MzrUxIu+wyzo8wT
	7LKpMX0uwmtLNBilSeSmm1wbYPi18H6MmwbKxILNEDQmdQqflIGxxNuHJntGwwjrxRGl/Ex1RUj
	97Ow=
X-Google-Smtp-Source: AGHT+IFUy22ub/r8aKY00hTcYEgVpeG/IueXtowQ0b6l02Zhp7g1ZBDcHI09gKOz+n6sFAvuCoKyZw==
X-Received: by 2002:a17:902:d58d:b0:235:6f7:b918 with SMTP id d9443c01a7336-2366b3c5bdamr278928005ad.28.1750225901260;
        Tue, 17 Jun 2025 22:51:41 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d0b12sm91243645ad.253.2025.06.17.22.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:51:40 -0700 (PDT)
From: xiehongyu1@kylinos.cn
To: mathias.nyman@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v1] xhci: Disable stream for xHC controller with XHCI_BROKEN_STREAMS
Date: Wed, 18 Jun 2025 13:51:33 +0800
Message-Id: <20250618055133.62638-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

Disable stream for platform xHC controller with broken stream.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/host/xhci-plat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6dab142e72789..c79d5ed48a08b 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -328,7 +328,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 	}
 
 	usb3_hcd = xhci_get_usb3_hcd(xhci);
-	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
+	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
+	    !(xhci->quirks & XHCI_BROKEN_STREAMS))
 		usb3_hcd->can_do_streams = 1;
 
 	if (xhci->shared_hcd) {
-- 
2.25.1

