Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960A425F7B7;
	Wed, 21 May 2025 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824593; cv=none; b=csChInlRdtLJp/LKlDxW4UQchC6wqLOtuQVHinF7jTCHfkfQAHFIPe6U8cX5Oml0h140h0xNQ5/nACJjoQhodH9Q9Og0M2nhx2EnEVmD81whJl68yW+7XVbww8VuV+BZc3eRqc3toE4uoLFhB3B0mtfCEZqpjAWZk/BvXMZ1l5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824593; c=relaxed/simple;
	bh=K6OSHOvN8xKXv1PQv/W3lpylYIuNyEiiSXA3YxNEO1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdNiCar7Y/okvcTS+hiL79WcByg7HXYh/NaPLvICmhkBQIRiyQvjR4vd3EvOLt1oZ6A5Gzo/hO9UMz6URSP1cOmgA2CO2qLqgdKYmlCMUeZtjb6bhUgkOPV6aRMKnfus+KRVr+DU7lc/SUWMMssU4S4mqRPNEYjc10fn/7wSwFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiIQegOR; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiIQegOR"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26f67f10ddso3709553a12.3;
        Wed, 21 May 2025 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747824591; x=1748429391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DhMvQPsr7BqEJ8gDSGi5LI70uKf+QgEr+Y8tLGpjGRs=;
        b=XiIQegOR34t4XecuhWCJlN1K2n6VU+xIYKnZhaUFQNVBhs6F4pl479zquYeui0alIl
         BgKfp81FaaOsLNhkUMkuZjZmo7ijW3sYPE2DcPkfXFxclz1n6DOsxDYnus0Ixkgjkw9N
         CmKoHha1AUOEACHQoE3+5Rnk6CK9Au5jdLwhVeEKFEOX2dj6LxECLIMLYJfjPDghZlC7
         kbZLYbPOgaV0RWAmL7eiZj+ZRBvJlhCdTziYm4/5T9qRMR9yRgrePsaip/HWGlBnpWDl
         OWRPoJ6dTvxTXWiWyVxjDHcBN8r4aOIzF/ki1aqHDi/dmBvBXWuM1VXga9GTFqSj5fll
         GjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824591; x=1748429391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhMvQPsr7BqEJ8gDSGi5LI70uKf+QgEr+Y8tLGpjGRs=;
        b=ZlONoo5hp0gLWsQrm1P8hXowR6QK9zONphvvAGCOYOxtlEEUWxiSwaVMpTfd+wWzbH
         9RLANJnWtxNQ4DAO9DVx9VZFNc6hSylnxbPBK8XWus//RJjQAi/n5fIw7RVxRaw7W9xJ
         ewtR48NdCzLphW6qX2FgmOifFfGUE7663O+9Q1dXIyWuLxanXd7giB+gWH75aK6vezzq
         hYZiis5crTdbAGgjLtAUvYguCjJXRzmZxSWqiFDEURh9dDdHCeaPG65r55SSZw3zHzXp
         eBO/sclpxXOYGnzObcOJy1jFMP63m+Zqz07zm84+gO4nC84YGRuktMoiu8wMp5M9+JRW
         ahqg==
X-Forwarded-Encrypted: i=1; AJvYcCXIgrXZh2fBQOJYOXkm6DvXlzz5KGh7IqcpniGwOar2k07XbeWhoz8laR7ngzczqKf7CdfYZmb/qEsnGKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPkcCmBB0cgRwmXhBbAGuvP6QOEX+TyQnTTmqKNaahTyC6lhsA
	AAwPC+P4/9+iW02Tk9YKFa8Sxu4CbStIBBoxOIsv5ZbOZte6i4aVC+5I
X-Gm-Gg: ASbGnct4ijwZ3MGBgsGFuptXajgtAKZqSFOAXMF47EbFDgY3LYGI8qorEA9bt8Ry0Ig
	by8lIyNd/gxqxOWbKT0m0GzhoONDEjb9qGeauSc6/4R3FuDN7MrwcgtXm14hR24uRzNSNnBzESa
	4m2QobUYamXCVxJvHmDmXzEzBI6BQAA27p385YVVkYiiZ4928YshrZrvobfNOnsLv4JX5IHHtFl
	FQBTaOPq9YEkff40lTIunnr2fOSyqrazVPJz4FBSNWJkED/V6B1sySNauexj21taRPamfnljQ/e
	0rpIl47TaQkxqeZkOYn17PEQ7W49Dx2cBcDc3pvbbGtOCP75bJeU5R7PGv9J47s3vaha10Sp+7W
	2WEzve1dUzl0iEenQjKYguoSkcMNNQMrKSDXyZg6D1htX
X-Google-Smtp-Source: AGHT+IEcmvFcK/Uyyico+0ngdPnG6xEbSk1Q+QMKRfKMGjA56rbH6wvvzZ4PB7cYUmlfM/jH4TyVcw==
X-Received: by 2002:a17:903:41c7:b0:22e:37b8:7972 with SMTP id d9443c01a7336-231de3514dcmr283226995ad.10.1747824590715;
        Wed, 21 May 2025 03:49:50 -0700 (PDT)
Received: from localhost.localdomain (123-194-189-72.dynamic.kbronet.com.tw. [123.194.189.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9588sm90457315ad.24.2025.05.21.03.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:49:50 -0700 (PDT)
From: Jay Chen <shawn2000100@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jay.chen@siemens.com,
	Jay Chen <shawn2000100@gmail.com>
Subject: [PATCH v4] usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
Date: Wed, 21 May 2025 18:48:34 +0800
Message-ID: <20250521104838.15215-1-shawn2000100@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a subtle contradiction between sections of the xHCI 1.2 spec
regarding the initialization of Input Endpoint Context fields. Section
4.8.2 ("Endpoint Context Initialization") states that all fields should
be initialized to 0. However, Section 6.2.3 ("Endpoint Context", p.453)
specifies that the Average TRB Length (avg_trb_len) field shall be
greater than 0, and explicitly notes (p.454): "Software shall set
Average TRB Length to '8' for control endpoints."

Strictly setting all fields to 0 during initialization conflicts with
the specific recommendation for control endpoints. In practice, setting
avg_trb_len = 0 is not meaningful for the hardware/firmware, as the
value is used for bandwidth calculation.

Motivation: Our company is developing a custom Virtual xHC hardware
platform that strictly follows the xHCI spec and its recommendations.
During validation, we observed that enumeration fails and a parameter
error (TRB Completion Code = 5) is reported if avg_trb_len for EP0 is
not set to 8 as recommended by Section 6.2.3. This demonstrates the
importance of assigning a meaningful, non-zero value to avg_trb_len,
even in virtualized or emulated environments.

This patch explicitly sets avg_trb_len to 8 for EP0 in
xhci_setup_addressable_virt_dev(), as recommended in Section 6.2.3, to
prevent potential issues with xHCI host controllers that enforce the
spec strictly.

v4:
- Clarify relevant spec sections and document their conflict.
- Remove language about "ensuring compliance with the spec" per reviewer
  suggestion.
- Update assignment to use '=' instead of '|='.

v3:
- Corrected author name in commit metadata and added changelog.

v2:
- Fixed malformed patch formatting issue.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
Signed-off-by: Jay Chen <shawn2000100@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d698095fc88d..26d0ab37bd5b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1166,6 +1166,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	ep0_ctx->deq = cpu_to_le64(dev->eps[0].ring->first_seg->dma |
 				   dev->eps[0].ring->cycle_state);
 
+	ep0_ctx->tx_info = cpu_to_le32(EP_AVG_TRB_LENGTH(8));
+
 	trace_xhci_setup_addressable_virt_device(dev);
 
 	/* Steps 7 and 8 were done in xhci_alloc_virt_device() */
-- 
2.43.5

