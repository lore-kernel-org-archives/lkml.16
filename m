Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F471E3DFC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178360; cv=none; b=Cz6juMV1hqmpLgPmw/LrT3Ky6agk3Z/pUptUUxIsdLzXH7Rto9O1D2nmtGwpNvQ+bamS5wEPDT9kUnA53fyHN/yErxEK2RIFxzD1EXoMiQ5gCbmt61TkKc3lCnjBDJKXLa4m7ciqv19az15cCUfw0iGMaSom3GqezLYngpaCOVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178360; c=relaxed/simple;
	bh=7aUo0KhKx/lj9hQdUFehzcFFLyGs18webMfQ6kgeJlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKxrekeqgLo6pa2xBVKPBrMY38WlCUDmfCmRtc5vm5nCUoojjMSa98oACwaNqovmiS2FGCf/kMJQsO1yVktEmSjmdbp/OMUSatozzQPk5+sIaCvxP7o09EKplpkDDQE3sRiEJcOmRD3wZQ/dWr1jm5ieyja5zJZPQJJcE127FCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Jucs/wLX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Jucs/wLX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso3663275ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178358; x=1744783158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RareA3N57SvH7MDKApFVFMHTInpOTvcT8TY3C4zHwbU=;
        b=Jucs/wLXjlA68voqN+wXJerngG9iymEzPBp/4CnXzEhA3QDm988/RKpJstd5YmnzL9
         vQcHXXgaDBWuNuQJRL97Wtv6MH5/KPEniCiuJrOW0OijQvdPV4sWslsmMWptl3HLLW7s
         zfsOzLSqe9rQXgDjbG9ECaK/S1JuD9pkLa2PHx26TD+yeHRlNG6kUP8k00YxwNGgYBRN
         Af7KqEaZ0Da85Qce13Rq8QZydb9QpRhVncJrEU6NNNEREz17O4/mDSJxGoRio1TdPQ0q
         7z9BfxbcXxc55QQX+qvzdQOIh6+tY0kO754kMFeDOBla4lCD6PArKkiJxxs9JCHlkcDf
         e3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178358; x=1744783158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RareA3N57SvH7MDKApFVFMHTInpOTvcT8TY3C4zHwbU=;
        b=BB06mY6kNx4qJUzLo6DkzFndg+Ewm20DKzRqPhDpFUga6raUaaD+lgoXMZVuWMUfSV
         OdbDyfbG1SCEc87uKNYc7+Z4aNghaigy/nU/rbwqZ1U9y2ncqGnwevwuPUDIJ3+obAEu
         m55rqhqh9klfO7PcoWX7xd8ooNl+JOuufZeP5AOzqAjHMEQGNY/IonMIp5rz5J7ElUhI
         fiCE3ybsJgHELpCaQ6/Kbto3P3GdyCFjT+RcT6Otp47Gjsm/gDLoUHbXyW9ankOlYqV1
         0G1HNc1am2ll3tp6C/rWQtQUr0wZ6yH+W4Jxi1HKyerkuA0PdZ2yUuV7o6ifBQpRBjXn
         rzMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWkyuGNqdJOzrxpl6dvp2NFnixjR5Q4JmHXKBpn8qboiDPkNaK3cV3OfVFCnWTOGKyaHwcuVluiU7VMxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8R1wTmipN/YTmT340Yg1wVsIbDmbBa0sEhVrWUQrFdjZfdzqL
	oqwCW76nGqura4WcDEMSktKk2R2R9lSMU9s3eJGGAOgx5fRpWnQ4vcg96LPhBwtYLmuqyS4DhV0
	=
X-Gm-Gg: ASbGncuYYQmrubWNurOYdp3/3l4tvaujzP6iwzmm72fNqW9webskusMNwo/k85hj4Y2
	9ApjiLUC/ZOd1k4rdE9fEhkNq7XpF39w8AePBamotZ7xogu8IGF0YG7Txli3p7NbykI9WWtsWtj
	7UgNhlIP3bov/ogYO6V+k5O4RkgpcEjCNXL1xTL0peyJJupAVVRvjxPl2vcFQH4qLB3HtvIOnx4
	ztvnRkr4FOdEGbWdlgRZv64+Ipfr0x3bX08HjR3hz+kxyXLd28XFiT54SWRqVsR5mlsy6Hd6caV
	qRPqidntS+DvByk9HXHjP9sfN2vm6jIH/giwKNGqGuJL7SkJOCnSUjn9w0MgOoA+q+29eVZyCX1
	SYwLmVw==
X-Google-Smtp-Source: AGHT+IEdhTpQH/+n1RLDXKwfyEPqdPj9JmJb0P3ZdJfY61MukXtzqaTMbOo+jvqDBDEbouUoZPu3Tw==
X-Received: by 2002:a17:903:3c6b:b0:215:44fe:163d with SMTP id d9443c01a7336-22ac32b61c6mr27344485ad.17.1744178358276;
        Tue, 08 Apr 2025 22:59:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93addsm3361865ad.152.2025.04.08.22.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 10/21] staging: gpib: Using struct gpib_board_info_ioctl
Date: Wed,  9 Apr 2025 05:58:52 +0000
Message-ID: <20250409055903.321438-11-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_board_info_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 79806cc51749..ce2184c5de03 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1762,7 +1762,7 @@ static int query_board_rsv_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int board_info_ioctl(const struct gpib_board *board, unsigned long arg)
 {
-	board_info_ioctl_t info;
+	struct gpib_board_info_ioctl info;
 	int retval;
 
 	info.pad = board->pad;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index e3d167edfd69..041b0a1593e9 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -70,7 +70,7 @@ struct gpib_spoll_bytes_ioctl {
 	int sad;
 };
 
-typedef struct {
+struct gpib_board_info_ioctl {
 	unsigned int pad;
 	int sad;
 	int parallel_poll_configuration;
@@ -79,7 +79,7 @@ typedef struct {
 	unsigned int t1_delay;
 	unsigned ist : 1;
 	unsigned no_7_bit_eos : 1;
-} board_info_ioctl_t;
+};
 
 typedef struct {
 	int pci_bus;
@@ -148,7 +148,7 @@ enum gpib_ioctl {
 	IBMUTEX = _IOW(GPIB_CODE, 26, int),
 	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, struct gpib_spoll_bytes_ioctl),
 	IBPPC = _IOW(GPIB_CODE, 28, ppoll_config_ioctl_t),
-	IBBOARD_INFO = _IOR(GPIB_CODE, 29, board_info_ioctl_t),
+	IBBOARD_INFO = _IOR(GPIB_CODE, 29, struct gpib_board_info_ioctl),
 
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, select_pci_ioctl_t),
-- 
2.43.0

