Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A5279352
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222211; cv=none; b=LGXsQVs2hI4+EoLqUmmhhJvbdw9cXkZftnFJ0YuMglPPH8iLqwWOXzaQKZk9gySSaTneChKkL/pvV4RoXZWbwIhQ7nTbRzawm52JswJWWdblsyKIFFT0+vuPNUtbpBAkrN0F62eo0fe+j60XpyIVTGeODqKmsj6CYkuryhgZ4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222211; c=relaxed/simple;
	bh=rObqEDHrBe/jAWMZ0h4xesD6j8eo5/oyrdSAY1bb5QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kI61dYn8V6xhOfNpXYB+LmasMzMni1GSSD4l517Cj3+1ZFKOj1t99fH0BbGukrlTUAzZ0RihXHTwgGu+mRylDIHwA8ucG57Ca894k6K2TInmISmXEEzQyFlRhVQW26RCEXpoAaxDwtYKOrJhxYMnt3gFXlOXvIj6U7U8HYRnOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=maITQPUa; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="maITQPUa"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736ee709c11so5990852b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222209; x=1744827009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xbx6JupUwv+LRM3RBwYRlbHNbCFfGcJo2p6nMmB6hME=;
        b=maITQPUaqzPxJye4yfEiIBX/HVqufa8qJk4bq6Ofy82l8nUvie0cKBUVUTW2NyqvP6
         oWc1ClShjTKubnq+7S36I7rVIECAfb7S6X/MLTI7aLnPUuRINnpiIjdzbvYxdtJk11Aw
         PDYH1OYPNZlgUS/fZGVMwyl38Vr/fSvAZWVoqLnUmxaiBp2WhddsKfEDP1mYl0AfF/os
         YTz933xfWF/x7zzNfdD3Gzoh2EB/FTHpRPgUBVn9uVAWgKL138LRyk8jiMBJKWgcKwnh
         rzyLrqYN9luIJq6fsQ2cjzDJbNeN9w/bWyObbENd1JWXFeKLoE/9B1RFNs/SFJ5mvP8J
         gj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222209; x=1744827009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xbx6JupUwv+LRM3RBwYRlbHNbCFfGcJo2p6nMmB6hME=;
        b=pv77OVqilVG1Mc4LMB/M3w9GHfepx+fZKoQCRVE0H7LgEDtBYAKzTdPZllxz+1Xl+9
         xr49j0K+Aj7m+oBc1lQnSfHvk63r1tlPRgHWQnhxe1KTRF+rEF6uIef2sJnBJRqTvRBC
         Mm9YZD8eZSLIJMIhH6g0MY+AtHI+oeRf/pQO2npsJTS1wdcvO5apDxNJmuu6KORxXkkN
         rnD94TXy7i9L5OAVl1m+3G2S0aD/xkPRFnUIRhPFK2UrdQFnAvckBK1iasIz4MLMfv8T
         tdY+OC+mBeolMrm5+OYjW5wMxgsBzsv/cN7IvWO+xFoHa6Glp33/KtsZy3zaZ+BJJ5x8
         7lyA==
X-Forwarded-Encrypted: i=1; AJvYcCXwcSnHSQzcs3/Pj4Pn0wFYBrDRsIj/4toYURzpiWgaO8SdnIcobx/Nrn7feYg8R6DP6nFWkPEeg2TOjaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJAvLgYd5QE6V330NkTHYyw1uFjmw637OXAUVIEd/anmHnrXI2
	e1894k4+THsVtUgSzl2RzwGyO/8FFB3LipjGo/yzvLMmPNDcwGjgKi6jomd5tQ==
X-Gm-Gg: ASbGncti1BwgGwYxZ04WEcxdw9WjgXYgUg95lxqKAA++0VsnByAYU0ZxvXxsgPoic51
	CL0laCKN7FocL2HKWYELiqpCze+luZ4dPJtLXiYe+EYD1dg1oao0NAgPPSvM51IOLSfo/KxskMW
	9z28cWyxf7jLryI6Sas9eHrEF2ISA1AnGDug6AtFibwcNvK2vPnw4owzAPWBvssKbY+0YKxeStA
	cuuUz7mv4jCYRD7UYZF1A+w9ORRDTzvG1knfBUm73h6+uenyWQhFfiHTMN+y3BHjcHz91lMhcog
	5KvuDa66nvqT4gRyHWtispJxLt+KlhbLU8PfcI0BmOp12hhSVZFf0wFf+1VUzrzLS7gy6OIH7+A
	Fwypwlg==
X-Google-Smtp-Source: AGHT+IEKZasBI5vpxbu2TDwqOl54klj67UqWsbaRuqQlyNvx+nls6nMxYeJQJTpgnS3/yC95hhkG2A==
X-Received: by 2002:a05:6a00:1411:b0:736:3954:d78c with SMTP id d2e1a72fcca58-73bae4b3fc4mr4794814b3a.6.1744222208811;
        Wed, 09 Apr 2025 11:10:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69b3fsm1717479b3a.176.2025.04.09.11.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 11/23] staging: gpib: gpib_user: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:41 +0000
Message-ID: <20250409180953.398686-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 58b996a8bd7f..eaf7399a164a 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -166,24 +166,24 @@ static inline unsigned int gpib_address_restrict(unsigned int addr)
 	return addr;
 }
 
-static inline uint8_t MLA(unsigned int addr)
+static inline __u8 MLA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | LAD;
 }
 
-static inline uint8_t MTA(unsigned int addr)
+static inline __u8 MTA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | TAD;
 }
 
-static inline uint8_t MSA(unsigned int addr)
+static inline __u8 MSA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | SAD;
 }
 
-static inline uint8_t PPE_byte(unsigned int dio_line, int sense)
+static inline __u8 PPE_byte(unsigned int dio_line, int sense)
 {
-	uint8_t cmd;
+	__u8 cmd;
 
 	cmd = PPE;
 	if (sense)
@@ -192,7 +192,7 @@ static inline uint8_t PPE_byte(unsigned int dio_line, int sense)
 	return cmd;
 }
 
-static inline uint8_t CFGn(unsigned int meters)
+static inline __u8 CFGn(unsigned int meters)
 {
 	return 0x6 | (meters & 0xf);
 }
@@ -202,37 +202,37 @@ enum {
 	gpib_command_mask = 0x7f,
 };
 
-static inline int is_PPE(uint8_t command)
+static inline int is_PPE(__u8 command)
 {
 	return (command & 0x70) == 0x60;
 }
 
-static inline int is_PPD(uint8_t command)
+static inline int is_PPD(__u8 command)
 {
 	return (command & 0x70) == 0x70;
 }
 
-static inline int in_addressed_command_group(uint8_t command)
+static inline int in_addressed_command_group(__u8 command)
 {
 	return (command & 0x70) == 0x0;
 }
 
-static inline int in_universal_command_group(uint8_t command)
+static inline int in_universal_command_group(__u8 command)
 {
 	return (command & 0x70) == 0x10;
 }
 
-static inline int in_listen_address_group(uint8_t command)
+static inline int in_listen_address_group(__u8 command)
 {
 	return (command & 0x60) == 0x20;
 }
 
-static inline int in_talk_address_group(uint8_t command)
+static inline int in_talk_address_group(__u8 command)
 {
 	return (command & 0x60) == 0x40;
 }
 
-static inline int in_primary_command_group(uint8_t command)
+static inline int in_primary_command_group(__u8 command)
 {
 	return in_addressed_command_group(command) ||
 		in_universal_command_group(command) ||
-- 
2.43.0

