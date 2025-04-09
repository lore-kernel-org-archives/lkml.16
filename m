Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B201D211474
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178371; cv=none; b=WfwuH7bamtUA2D+2VcbcEq7igY2i8FwGBcSYTQ3yZNwkmqjE3JO0Ta3rOJ3lA6mQrDRNjf12EjPLFElEsArmJqTSPaKqjR8LyLN6brMS7f6W1lyB0lN99+ydet3Wq/JQPlPQQj1mOzvqNTTaXZ1mGCqoMeEX4QmVVtbkWC8yXdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178371; c=relaxed/simple;
	bh=6f9bCFgv3OgziEcu2USnaorTdNY1Gp/dioA6Ikmn/zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3cD3OUz/pLh3VYhXXX5/PIf2kKr+pVMy10amH6g8NqSv0Xv3x5T3f/i33Ke4tVLOqa8h1+DOGHDZWQ2pfI/1m7z4kulvXo2lAT9JyMdkETLSGOJtyLZUu/15UaX0rPe8pKHk8uyToC7W+PLahTVirS6RunqtSf4kIYO3/cwkYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mZXzloY/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mZXzloY/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227aaa82fafso54708115ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178369; x=1744783169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rp1Mnr/Ppbq5hd9yNv+1/H1q/VZaXkXrpCMjU4yauo4=;
        b=mZXzloY/0arKsKUTLKvO/rn2NfvZ7EdyA4o/c7GkQfg0eUCQqFUjXFh486rYdQ4MKf
         Jt+eBP/NTn/ir0bJxp4XAVHxtrJ2WqqlJCFDdWV84wkrrmOnD6YwipCyb512l90qzn4k
         4HB5t1xznpTDH3ez6jPq6h/zgQkgltKQpYcTiIAPYP8n4GsEiswR4WKbpNmKQDpUp8Kt
         K8WoJsDIyKdnLqI6C11570N/WycqUW2B0VlIJu6xotbCVzr3qgFUTr6NW0BnGhmP4c0l
         KjEuKWDwtq92nIIbwoqixC3oeSTD15JKun+tJ9Aq1ALI5mnYiJXpU7ZMFU3uKQdFs6F/
         xJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178369; x=1744783169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rp1Mnr/Ppbq5hd9yNv+1/H1q/VZaXkXrpCMjU4yauo4=;
        b=ZcH3uPbYCJ71/B6qXfDB0Mc2XqWmj22Q0T3/ZQZ3AqWDwN21edY6WalbsBYyQoF06S
         3EZ5Fc71Jf1Uoqe2WJleoLw5ql+mE8Cd0OZTrEpvc0qgNQshPgSYUPHFQomzoY0n2swo
         VRsPf0ZGaEo3a9SLMtt60EOZ6OC8HyqCbdrnoTHQ6KhYhRPIIXnTCm/zzcPB3U9Q+rMz
         3Fb6Bj2JhU2v5be61mcRZOn9rz9atlMIHRGKh6Az1pUOwNhMDGhl4dsHT+VEnnDTulIJ
         k0L/dm/1RZCxL5P5O5/gZyc4bEQ1tLnoC+dij/LypXhW780EcG/IGu9FjryZUJ5e5MeE
         uk+g==
X-Forwarded-Encrypted: i=1; AJvYcCWxVv9tY93VlyiGybxFpGDkeMdJ42133y+BnTL3jLcq/ZbWy95aI9FKzQ0jYYq3NxTdSNF7NR5A56zkKDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVX3scwQ32vhV1SGJIRlvVHK5dv9fUlyf1nzrH/ZLWC4oUfQaU
	CgxG1QWgU6eqdJGfdMx74OkYzmnbG/8PXH7G9dw6nlafTO1fFlRkLqjQHDSxnQ==
X-Gm-Gg: ASbGncsG5kd/RCMIlp2SPqFX4UZljXyTx24HMmnwVhvZBwX4QxbSIrlytuJCTjt+mmB
	YfuG+abqoYlnmUCT+REZPH0rVC2HuubjLL8XlZi5HANh+I+xD2Dsi+DozCIZqd7Pbl7KDssi6FD
	F4fsqiw3EcWtrapLr/z6eK3HyDEIepNGwHTZQvveJnVPjj9yMG4C+MIKcHeyVTZi5I+8sfOLnZx
	lXXBTyF20aamTdDIbFpnlycfWD+G9LSocPFfuMOawWhI4nW2S8ALjLs6oQ9TAVRLVmxdkMJ8ncr
	PY09qTBHC3NSsyVfdh+QIeybW4WhjS3E/8jlKCglqsDnooHHSxF0MZsGfj6/0rrH4ZKGV9VJ1E3
	XzytHVQ==
X-Google-Smtp-Source: AGHT+IE/ChE6ZmnKHJDN/gdBW7rtlyY8iE7c889RlAKDvJomQgnBVhLKQ9OiwQiY0oUYePyahmH/IQ==
X-Received: by 2002:a17:902:ccc8:b0:227:e7c7:d451 with SMTP id d9443c01a7336-22ac3f9a8fcmr25005435ad.29.1744178369126;
        Tue, 08 Apr 2025 22:59:29 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm488012a91.47.2025.04.08.22.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:28 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 19/21] staging: gpib: t1_delay_ioctl_t now unsigned int
Date: Wed,  9 Apr 2025 05:59:01 +0000
Message-ID: <20250409055903.321438-20-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style to replace typedef t1_delay_ioctl_t with type
unsigned int.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 6a2ceb7b0b59..d32f39ddea28 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1984,7 +1984,7 @@ static int request_system_control_ioctl(struct gpib_board *board, unsigned long
 
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	t1_delay_ioctl_t cmd;
+	unsigned int cmd;
 	unsigned int delay;
 	int retval;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index c3d82b627210..0403e285eed4 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,7 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef unsigned int t1_delay_ioctl_t;
 typedef short autospoll_ioctl_t;
 typedef short local_ppoll_mode_ioctl_t;
 
@@ -152,7 +151,7 @@ enum gpib_ioctl {
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
 	IBEVENT = _IOR(GPIB_CODE, 33, short),
 	IBRSC = _IOW(GPIB_CODE, 34, int),
-	IB_T1_DELAY = _IOW(GPIB_CODE, 35, t1_delay_ioctl_t),
+	IB_T1_DELAY = _IOW(GPIB_CODE, 35, unsigned int),
 	IBLOC = _IO(GPIB_CODE, 36),
 
 	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, autospoll_ioctl_t),
-- 
2.43.0

