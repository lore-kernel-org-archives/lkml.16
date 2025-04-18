Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA820767A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968684; cv=none; b=PiMZJH1RvXiQoxVOvI0z57M8ET4VjPvVhiEHH1VXffZ9mfMjWqkBDOj1sACMu+Hsp0VuQJYEOQTeC33vLGrpdKys7vZDiCSF/HkEw+MhjYmYR/27TWEHKAhTSAFP2ERmutopJvvFAJoeZGg59LG79YeKM37eaw12/WMcaGDW6B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968684; c=relaxed/simple;
	bh=l+WljZ0LGkGY9pZ4SVmav7N6ZTsbRQhbYlws62pX6Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLXmsSLcMLlcXBplvGw4gpjVd9jRI7TyeWisagstctKjx5lyCKQIl0w25BqiUTyjSZmimGbhiYZ4hE6kRK6iXUUus09p1EzwjCmYDYsIS4Z8npgS8uT+Q9pDW+/RorczZMzfFrJVBfcSq7MPIO9XJN4CjCcrbCEhhFSiEM/YW6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bi+vMDoy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bi+vMDoy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1135158f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744968681; x=1745573481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px4/dWG/1BChOQoCLuKfo67Qup2FH4WwdOjfR/Zid4k=;
        b=bi+vMDoywj1FrJ2XuE71IVR/yqIapQFzFVx73ohDWt3oL6/Dj+EsiLiPBfIhHTGKhx
         zF4yU8VHLFNYAXdS5jcwyrEZAFamUfAivr/6aY2p+NnAJ4XELPsMl5WDB4nGQBImOcub
         YaiHNBgs9l3gOafTBqEEpkAScf61jot5i1OLv+vMWjihJkc/trQDzjdyZDjHOL9YAjOC
         ji/Q+Zxk3T+hGTvkn0abQXeMxcA5y/nYTtrZOKOIIOPpo63cduXY6QNCd7C56mYz6F5F
         AvlOUy8/raXZEn09qwUYPk9CIaKUaZqCWsTdy0evF8rKZ/Nkkj+TOTxNzSgPtPx7wdps
         HDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744968681; x=1745573481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Px4/dWG/1BChOQoCLuKfo67Qup2FH4WwdOjfR/Zid4k=;
        b=Iur9xtOKvboGQJLymAI4vMoQcV47pn869z/o0grltFaV8sbcH4V1qjRtzfTyaP8YgR
         VVe51qyZgBFxFd6WIKMBjqYddUMF6pffrFyh13XFMES2TJNx2xal+uMXVHcOnSr1cW3F
         wiARbJ749wxnW9EMEKDR1hShS0yoYam+PdStCdOaEsK+ecRd1X4JEBd1BPTfoAN5QLOS
         8EWMwmUnYo7aR4n3swAN1Ek2LnHd9qjzvrS4MgvM68UGvYtu7mRSyjBqXchvK1cnyJW5
         4gknr6AosAp7wsYcW2BMS1IbzW4EFdwwh9kzXjz231qM6S7d88BZXPmgp08gkVDJXBgT
         Cz1w==
X-Forwarded-Encrypted: i=1; AJvYcCX3gd/F7NMPWAKnoNPrXEhUsogfW25aceoKAeGuhtwG4T2/iFdmywU4CB745gf/N+LB2H1dyefz/dIZKd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWNlRT4XG9EWCGbXXhTKBzKe/Co6KpAV2lqaj9DnUVRRPJ7xCg
	8VbG9DDg8kG3TFhAZ2mG/3qflIumY8WFSZm3sV+J4L6nJ/MsNLXo
X-Gm-Gg: ASbGncsBShZe9NJWQMAwpJRb2RdYQaCDlNeaSjmysJxoKpCq6fPWNjARQ2MwhZeVGQ5
	T3tkTtmwTNYzEnjHCn5h0sDZtn1u3EX+MFPZAGdno5HguNRdHq8mKGou08fKRZ282N8/xQjHU/a
	cdp3hMqQq7iJQa1mUedc9VeVrl4KiRCPeiTNnQne9X5P+Dqq3HoVy7f7WbL3Dna62zYNBvEb4UK
	mLPWJKvREuB3vs1rM4BMFbYvfW7JTyWJeMaQEvnoK4i02hrX3QMjBi4KjLHLYNDMX6UDJl8Yxtv
	DDpBwiVTtMyvVpsXVcES3c2fgEI3lus15bGVpJ3EojeZ1zl1dqCGeG2JezO86emJmnDeytpjQvz
	VU9SN2Df2nHw=
X-Google-Smtp-Source: AGHT+IGvT2L6R4gKC8SQZl2Q7Ui3G/sarkbp8axY6Tt74sRDgzk+GXwJP4+oDoqieWz49mouZJzTkQ==
X-Received: by 2002:a05:6000:1448:b0:391:952:c74a with SMTP id ffacd0b85a97d-39ef8ba59b9mr2610225f8f.8.1744968680694;
        Fri, 18 Apr 2025 02:31:20 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9df6sm15599595e9.1.2025.04.18.02.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:31:20 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/2] staging: gpib: Remove unused enums from common include file
Date: Fri, 18 Apr 2025 11:31:10 +0200
Message-ID: <20250418093111.8820-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418093111.8820-1-dpenkler@gmail.com>
References: <20250418093111.8820-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error code and timeout code enums are not used by any
of the gpib kernel code.  This patch removes them.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib_user.h | 42 ---------------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 1cb6b6219e67..4ca3cc9e0cd7 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -53,48 +53,6 @@ enum ibsta_bits {
 		EVENT | LOK | REM | CIC | ATN | TACS | LACS | DTAS | DCAS | SRQI,
 };
 
-/* IBERR error codes */
-enum iberr_code {
-	EDVR = 0,		/* system error */
-	ECIC = 1,		/* not CIC */
-	ENOL = 2,		/* no listeners */
-	EADR = 3,		/* CIC and not addressed before I/O */
-	EARG = 4,		/* bad argument to function call */
-	ESAC = 5,		/* not SAC */
-	EABO = 6,		/* I/O operation was aborted */
-	ENEB = 7,		/* non-existent board (GPIB interface offline) */
-	EDMA = 8,		/* DMA hardware error detected */
-	EOIP = 10,		/* new I/O attempted with old I/O in progress  */
-	ECAP = 11,		/* no capability for intended opeation */
-	EFSO = 12,		/* file system operation error */
-	EBUS = 14,		/* bus error */
-	ESTB = 15,		/* lost serial poll bytes */
-	ESRQ = 16,		/* SRQ stuck on */
-	ETAB = 20	       /* Table Overflow */
-};
-
-/* Timeout values and meanings */
-enum gpib_timeout {
-	TNONE = 0,		/* Infinite timeout (disabled)	   */
-	T10us = 1,		/* Timeout of 10 usec (ideal)	   */
-	T30us = 2,		/* Timeout of 30 usec (ideal)	   */
-	T100us = 3,		/* Timeout of 100 usec (ideal)	   */
-	T300us = 4,		/* Timeout of 300 usec (ideal)	   */
-	T1ms = 5,		/* Timeout of 1 msec (ideal)	   */
-	T3ms = 6,		/* Timeout of 3 msec (ideal)	   */
-	T10ms = 7,		/* Timeout of 10 msec (ideal)	   */
-	T30ms = 8,		/* Timeout of 30 msec (ideal)	   */
-	T100ms = 9,		/* Timeout of 100 msec (ideal)	   */
-	T300ms = 10,	/* Timeout of 300 msec (ideal)	   */
-	T1s = 11,		/* Timeout of 1 sec (ideal)	   */
-	T3s = 12,		/* Timeout of 3 sec (ideal)	   */
-	T10s = 13,		/* Timeout of 10 sec (ideal)	   */
-	T30s = 14,		/* Timeout of 30 sec (ideal)	   */
-	T100s = 15,		/* Timeout of 100 sec (ideal)	   */
-	T300s = 16,		/* Timeout of 300 sec (ideal)	   */
-	T1000s = 17		/* Timeout of 1000 sec (maximum)   */
-};
-
 /* End-of-string (EOS) modes for use with ibeos */
 
 enum eos_flags {
-- 
2.49.0

