Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EFE185935
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850742; cv=none; b=Ht5ucsNFuP2bjn/L06Hp9s7onTnWw1sR9QpBy8EzIXxBjnST5ZBmlj4uX2qwlMuuVTB9ycf3mh1wPPIrIjs2A1GIdiU3GWW1NO5zcMsqk7gBAD9kIfArG11K/BddOebXr4RvuqB+0z14cj7FePBCpCVbeEqkKN9nhJtxydPbb9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850742; c=relaxed/simple;
	bh=rObqEDHrBe/jAWMZ0h4xesD6j8eo5/oyrdSAY1bb5QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFkcpS+InU8vUNSht9S/QmgTQEYhfx8XwvydSYx06rxUSr4mprSiGK0WSMSOnb7htirxVbvEvSt17tZdu6lZgO2sxR3zXi+gj+FgHDBtQ4flnnutd1z20+rf/U0pU1ALN5/jggRqBCbd1RdSM3W3pSCUNBF7u8/8Kx+acqA1Kxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=NgDTsFJ3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="NgDTsFJ3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224171d6826so3845225ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850740; x=1745455540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xbx6JupUwv+LRM3RBwYRlbHNbCFfGcJo2p6nMmB6hME=;
        b=NgDTsFJ3y/aFaupGDFnDommEPyIdalDd+fPV4GGciU5mSxtvSVm0qfuYhJl+7anb0T
         17Dz1OnJnZR3SmnmMKyC7belTvzUGZGAsUrvM1R5VXuHSUrG9LEcFWLPf7MrpM1SjhUz
         zHh596M+s+i+P9ml7wN2fhRTEHmZDA/w1Ja12GTdOqmASbAs7tbW3nGbj6CAc4QAeLfN
         p5yOO0EVANwgeNXNoZFoG4GWG1R5nhfN1CLb535ofmhQHkOJQbYPGqE3eohO7NGbAKKs
         bpXvJgiA+NZTzEJjVkIQxiKoutcvQKkAn9KZbcQ+gXpy25mqvGM+ou965qyvNwRD+wR/
         f2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850740; x=1745455540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xbx6JupUwv+LRM3RBwYRlbHNbCFfGcJo2p6nMmB6hME=;
        b=ShrsAfkiQTFGux+4Oi0DONWN0mAFE/hYGu77MfzdpYLS8FwX4OlCDP0KnOdEHOMHhc
         311eRpgRNKdSdFVAxB/wloSDQxOxVQMhZRNakym9MqBQIspmZdT/aqRTq+B1oUUTn0SY
         8dH5IXGeMlO2Mh2PJ265EVklaHNVEo6U48RaxC/JXj0/n3rvzcucbKtBJdNbrULumnXs
         OQ4RmcNhpsJ8fNcLKk11lATGj3+UERGPu9qH9HUtF6TZw9Yn4UFk+YCAlJtf6hDvS3Td
         q+coHjSrdZkCRrYY5JwU3ooMNSvxhquurtikwCWVGzUcySWETM0QMuIYbFuTTkUECU9a
         EARw==
X-Forwarded-Encrypted: i=1; AJvYcCWRgwlXNBgQ+wwapZn1zPce6L/evv5IiKLN0R4dV/Uo7xoJ+WryvXa8cGRJo2iZpKKbq7L0mwBCqALrppw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mhdHqTytw5vW6uAR6GOqX2UjdTUCN1voR157KXbmJ8qFXwPa
	y3vWZANC6V7VLsD853ohFAS9350Kb2q6c5HrzCzeqLCcevh2OufPCOF1nJ9tWg==
X-Gm-Gg: ASbGncufSLS0rK2Z5I270Kx8sQ/jRZtsBMYkB5QaxfGFReq69cQFeU12i3y7lJT6ea6
	HERgJeraqdWNtZsa6RGZkPiXLydfeB/aYmoCQxfOCv+U6X6sgv62YUk548xw+m/hV+J3w1Pld9F
	LIdHxiD8sO3u6R373k0c/FI7f60Vt9byWoEgHCSGt0CnvYsrGO0Dpn+NdzE/T7YAaN3fFIrqMZ8
	hxA+GFy1NaRBfAditT5uWw42rpvuZTNkLbgn2sInI4u1G71y0qpINGlM0LherA83/cto1xIxv2n
	ppmHwTXHBLTSJb3y9Iz1xgwurNdezpYIhXDCjtRqtmNQsF0wrwQqidRwH4WwRmqTcS3FkmpeOYq
	fWBV5XQ==
X-Google-Smtp-Source: AGHT+IF0YXGqSmFJvRIqGI65Tnqvm7pmkcoFE5ShlFAH+CCj95TpqtmaCBWbFEaDM18PVqURmIb43w==
X-Received: by 2002:a17:902:cecf:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22c35917410mr54024025ad.30.1744850740114;
        Wed, 16 Apr 2025 17:45:40 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcc04dsm20952405ad.200.2025.04.16.17.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:39 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 02/14] staging: gpib: gpib_user: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:21 +0000
Message-ID: <20250417004533.86765-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
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

