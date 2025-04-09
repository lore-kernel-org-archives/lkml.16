Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D79D20FA83
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178370; cv=none; b=T3RW5BKovdm6s6iLyQSZmv6sVzM2nXtzVf8CN/TXYkekVswaAKp2A/g9gpRVVU9qBcyIv1O2kEYS7ehTz91vdkOhugYJ47RR1r9q5PrOE6T8GP8WTxJiGf9/i3CLmu2eABoXxjrU3Cf1LccAuCi7LSA0PCNmvfM5nM2LRjZPCps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178370; c=relaxed/simple;
	bh=bnOEpAgszHqV183TiTZpNDLiDy5SjR9NqKMUBuyXQPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mA6HexfHT8eqAIkg8o2LDBibfgshrr/BdxA6pC5k4EmLC3Y03QNu4glpOMryaCEot/0d5rutYsxMV5b62Eb527hw6dYiWkGkoszkHEx6IuLMsjxYXDFChDk9OTBDlX5GrJg+PsSF9NHGaC4KjE9gae6PXWkejNwRb7WMwqqkDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=kBLULcdR; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="kBLULcdR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so5092670a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178368; x=1744783168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYW2NNA+2M0Vl0ws9Jg30Dh88lZBV/bMfWO6aX463XQ=;
        b=kBLULcdRuGY9W9Mqm08HxNFciVzEnqNQUibQ4It0Hs0KuEbkSQyFif4PphhEMqociN
         +iyD6xudWjCYRcBXv6mpyMRyHdaPboq9b2uK/Nt7Bu2mRUA6278oyCCo7hLcY8Q9Amsr
         oGstf5s6pZwfBaVyyKbs4zjnsPrr/LTV0HUAcb0iVbFFp1rQfjAE7/n8PwHu03wGZUQ7
         djLaljKPhDpVbPiNKqEW8u4TOlpiVivyouTKgry8Dv13wJ0Z5gZcSmiFIXpj1Ap5zm6c
         uvS38a+peIfm051O/jmKCTkIFGMfMhQTSba5F9/EUI8YYz9J/4P7ILyqD3RxvEIoBSdg
         L72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178368; x=1744783168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYW2NNA+2M0Vl0ws9Jg30Dh88lZBV/bMfWO6aX463XQ=;
        b=qM2k15ZOsLbyBeU4K+TUPCGuFhxoZOOdf9V8miD9TqwMVjf5xM8MPoqGD7MjBz2s6t
         cRLyj/IBTY5et7DH9gDruG72y64NyylDkR97cv99pKbISa8X5EKE7Z9wX90bFsxbyNY3
         C+C5fSOM7Z0xr8IXzNipSdqWh78rHi5kn5tUemEMfPsMAPvqzO1bwjfCiTTbvBHzI0yM
         KGPLjKl3lhNSQJbeu3o9oQFWU0D3WdHJLzJ0q4i7bJbmYcMmUAgBTtnSOFFGn/5J4Puf
         dDnJi9Np4bOloBl8UmMy2yPv4ZpoHO4WY1SHaG+/xj/lG26V9JG83zNjm9RTNfpWFpNm
         kvRw==
X-Forwarded-Encrypted: i=1; AJvYcCV3JC9eluvRPMZ4hQ4uR0NBba0pmgb2Y1WM6Jiq1bNNceKrqitUqeXIc0tkuQXc+Q1IdYx7QFCS1uFKmIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvDEiX89gqzsk0nAeOnro8hkPR0caxaozi/uy6GIBRxg17Mo0s
	DrxFOu545TwQ+fX05oJ6hjwFBTe26PZvHLB1ZUW/uNh/umUTmieoJS0DXYNS9g==
X-Gm-Gg: ASbGncsm41nS1UPxJQRHWoCS8GCxQQrww+y+1AiA/P8a+sFaMz59xAMHsgCSes0tDX3
	3+eAvduE9J0PaO5WkU6HOthUtIIRXeeXoHqJiycyP6kUzmmdg+lRLCW7UrhdOI+J9aTaKXeRz/x
	yCerU7vhaI7jVaeOWcgIrKa2enY/27F7avEexvh0TZvvGnp1jcTQMfvyWH54u9rX4xgwlibjMWl
	CISLxRyz1ZIgy8P/RLuLS9JORVv3sEF5/hg/euEDX6j8F9WR6Q4CDlP+Zjp5XXJn4n3GBZSk52l
	oxrNoq58T4IHyKbPdz/Cf+a0Aa2q1ZVees/intgCSVJnMGRCBq1tSF3vrcdKMtYgJxczT32hpSu
	0CFm46ZwFctF1FqJy
X-Google-Smtp-Source: AGHT+IH5y8Af0uSTY1F5xbiHQYDz87apb78KZQCQ9yxl1j2FzAb0ftWhM1s5X6lHV87g+rmitKGgBA==
X-Received: by 2002:a17:90b:5344:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-306dbc3e090mr2359719a91.30.1744178367850;
        Tue, 08 Apr 2025 22:59:27 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b599sm661785a91.23.2025.04.08.22.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:27 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 18/21] staging: gpib: rsc_ioctl_t now int
Date: Wed,  9 Apr 2025 05:59:00 +0000
Message-ID: <20250409055903.321438-19-matchstick@neverthere.org>
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

Using Linux code style to replace typedef rsc_ioctl_t with type int.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 72a9b660f124..6a2ceb7b0b59 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1970,7 +1970,7 @@ static int event_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int request_system_control_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	rsc_ioctl_t request_control;
+	int request_control;
 	int retval;
 
 	retval = copy_from_user(&request_control, (void __user *)arg, sizeof(request_control));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index e9baa6724fb4..c3d82b627210 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,7 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef int rsc_ioctl_t;
 typedef unsigned int t1_delay_ioctl_t;
 typedef short autospoll_ioctl_t;
 typedef short local_ppoll_mode_ioctl_t;
@@ -152,7 +151,7 @@ enum gpib_ioctl {
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
 	IBEVENT = _IOR(GPIB_CODE, 33, short),
-	IBRSC = _IOW(GPIB_CODE, 34, rsc_ioctl_t),
+	IBRSC = _IOW(GPIB_CODE, 34, int),
 	IB_T1_DELAY = _IOW(GPIB_CODE, 35, t1_delay_ioctl_t),
 	IBLOC = _IO(GPIB_CODE, 36),
 
-- 
2.43.0

