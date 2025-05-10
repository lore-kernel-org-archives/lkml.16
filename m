Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C401E51E0;
	Sat, 10 May 2025 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746911548; cv=none; b=NAZ7YD6CXIwvJSb5Jd9JtzaQVpF1Z6t4A+KrXv1GOyd2umEFQAK/9vIaH29I6nsBkNU7h+SOz63gmJVF0ledhCPXppcDEUqY09+aCagqBYZMk/hLKVY85XwJhUWd4Yf+iKUKJyMWPz91HV1DiHGdz1cxKnMPFKvKjKuQLB5D4Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746911548; c=relaxed/simple;
	bh=99tvlAZWEuT3qwX1J52V8Qi3RGLC7ca/kMNaFkuTT1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CY0mKEz80rKijBa3/qPtfAbgu6qtKp735BOlBxaodOtsfhkdcPC0JVtjMY9eXS9tBNEGLVMaqJUUZN+4Gxw9Z4/lxecWkcvlACvDU1XnoigOZ8ppt3tiAN8w1PnjSsTHxHEY/yvnhKF7D+8ihhPas4S49vERa7wUft43MFmY66g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUp/H4+8; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUp/H4+8"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2301ac32320so644645ad.1;
        Sat, 10 May 2025 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746911546; x=1747516346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IcysVuRM01e8zLhgHgz9JyDQtk813RWNIBugP/k/rrI=;
        b=TUp/H4+8/bKXbFIXL38oKLDQB287VQy3qbDl/OTrRqpQ99aw4u4k/y+/7LRogrKlsD
         1a6Ba7Sp9Byxofqu9c2rYCMW4kmyVXDYurSGGdRg1Ke+OvarB3rhg7JoVacaAJY5Pso9
         Z398CEnHtbEai8QMUDgV+M2o0hJOR8rtgeRX58qecGT3rkCDRIyl5UmcK2K/O/rYH5xW
         cVOFOEGnWSeRl0qQle02eSa0Yg+sn/IjmIYRsDir/w6+7IDbbNNwNsQ/5S4f/TmU94au
         0S3HpTHXkwc/01DGkQwVWfIEmOwPZ1Wqm0At1d6Dw1zWMHgntl60QAcAMHRolT3bhdvq
         i/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746911546; x=1747516346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcysVuRM01e8zLhgHgz9JyDQtk813RWNIBugP/k/rrI=;
        b=ZlTCc5kN3LVh22cFpZYut5CH4guqNbcVT5Jy41F//Xw7Ko4c7qfjnQEwKFDHJ5PWwQ
         uG1VlDu8LIwYwkpbo0VwMB4vwL+ct5459B0UU+4CYv73UfoZwAUwAOQCoJzUtUPmKa+7
         XSR8NE0d9zsRJ+gQLco9tJhXtj8Ph0QWlKxWrTzuCjwrIqHZuD2Dl2qA7onHAJQ9JPOj
         bzv0rmMwDZfrG2UMOTv33G8V6aWuIfAGvL1aETYb0vhX2UVGk2ZpQGuE7m2QoLYkQuen
         2fZ3bveSILXT5tybmpse5BFYD5yVjdoMnBT13v+AuyhpnNB0vZIF7EN+a9Jk+2Qvg70g
         XXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgMkOsE7c61sa5FjCs3Wl8oR40u8S4dR8z0kQua03aRVOMbWelEINqOeXzd0bAUdE5dKWtHMaUI/1u@vger.kernel.org, AJvYcCVXnTR55tWh2eoqR3QXZ7YfKLJDSzUPm1mL6Q0hLFaUTxHW0Kbl7PCzbr6ub0kqpGk6jPVLAzyDTfGbj0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvFLCJ/6uvNgkABo3oqLKGRXYcgUCveVOrA7Ec20rX7YGU/1gx
	yIVt0V5x3OiM+t7Bkt8+yaFZm7vVRlmy18sG85v1HiXcXWoKECtg
X-Gm-Gg: ASbGnctScAJR0AB7e5/zZ0OfkxUa+U0qDIlGSwoTye3EwNvYpd7TTBrElKhAG6Kwm+G
	Xc7cmXx3KpcFMAUoELwdepqQTw7stgyyDWyuhFPhUYK2di6h/8TEP8N7K5O4A7H1EXEUPPyEVO1
	BXWfb2s79NCHQoRchRS+we2yVPLGRek3OTVojt3RIFEbZOECt5aaZo/E+7AdRMytvPvINfN+yL3
	355n7BZ7nPVn5NFSyGLXaqw9wpR5s3Rj6lLs8v/adHZopM0CwanCfBLH1q4FiT8mFWjwls2lXAe
	R/L66Z5dB/UxOBiy9qCOpKVZumZPqqE8DDUKBSh5ct4thGkU75kDRlZJYB1jQdLx+DQM/uQ=
X-Google-Smtp-Source: AGHT+IHOkDeF1qvme6IAJ3xVM8B8PTX/iO9Ye9cjAxNd5RLB1/qjzyJoFZ8xI71aesB3lePs9KM48g==
X-Received: by 2002:a17:902:f652:b0:223:42ca:10ef with SMTP id d9443c01a7336-22fc91aca36mr134170545ad.43.1746911546065;
        Sat, 10 May 2025 14:12:26 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.231.111])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b23495122e7sm2815557a12.4.2025.05.10.14.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 14:12:25 -0700 (PDT)
From: Siddarth Gundu <siddarthsgml@gmail.com>
To: b-liu@ti.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	Siddarth Gundu <siddarthsgml@gmail.com>
Subject: [PATCH] usb: musb: Fix signed integer overflow
Date: Sun, 11 May 2025 02:42:17 +0530
Message-ID: <20250510211217.122790-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shifting 1 << 31 on a 32-bit int causes signed integer overflow, which
leads to undefined behavior.

Cast 1 to u32 before performing the shift, eliminating the
undefined behavior.

Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
---
 drivers/usb/musb/cppi_dma.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/cppi_dma.h b/drivers/usb/musb/cppi_dma.h
index 3606be897cb2..33bf5f83f08d 100644
--- a/drivers/usb/musb/cppi_dma.h
+++ b/drivers/usb/musb/cppi_dma.h
@@ -38,7 +38,7 @@ struct cppi_rx_stateram {
 };
 
 /* hw_options bits in CPPI buffer descriptors */
-#define CPPI_SOP_SET	((u32)(1 << 31))
+#define CPPI_SOP_SET	((u32)1 << 31)
 #define CPPI_EOP_SET	((u32)(1 << 30))
 #define CPPI_OWN_SET	((u32)(1 << 29))	/* owned by cppi */
 #define CPPI_EOQ_MASK	((u32)(1 << 28))
@@ -48,7 +48,7 @@ struct cppi_rx_stateram {
 #define CPPI_RECV_PKTLEN_MASK 0xFFFF
 #define CPPI_BUFFER_LEN_MASK 0xFFFF
 
-#define CPPI_TEAR_READY ((u32)(1 << 31))
+#define CPPI_TEAR_READY ((u32)1 << 31)
 
 /* CPPI data structure definitions */
 
-- 
2.43.0

