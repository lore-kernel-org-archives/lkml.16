Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82177245024
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150850; cv=none; b=LemBHVAtNNSHAeu4jTC3xRIGJ1rfziQbeoKw033NcFWeY3y+hb5VSkMyAQemFcQLaomsDqxhhdo1q0MXKsKMtSIXd8mSwi+5rMjija+2ldh3TEMTPaZlvXjOomp/kERJljJ/dMSDACmsrVoYiBy/A26/ERNND/nHRxpqEgHlaKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150850; c=relaxed/simple;
	bh=q/m6gZRHsznamriWOYHZIp/SmlWy0pox+sQ+sNqkijI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7gDmnT1XuoE3Hkw6BgwzDlfnrF1HvMURwHlNnhGysnQNA//Yeuph7vzQEUbUhQ80Stjnj+pVUGIpmA4MhVJ2+CZ5BSVbzOevBUj3i59bvH0TD1SXwmmmU9Nl3h20d9uWRFo+bQxEKyp5q/WA+dejTb+NiJIZ2bY3Og6BPi8RWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=dUhGmMeD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="dUhGmMeD"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2254e0b4b79so76131475ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150847; x=1744755647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6zT4gLPellA5q5nyTFopWbDsYdsaDENjf5O1U73EvY=;
        b=dUhGmMeDb+wjnig1GeMU6v4gA+T3ikbdKy2XhLtn1U4svUHbYfH50e3c8caaRFaUlX
         dfAFlm9bemeNqQqB9dn/eMCq/wS8iwT5P0Efu+WR2hks8xP+o/E6FkOaZJ5Cdx9k4M0Q
         ERC7GecvQu6cB2K0frxKJjuHe+yV9O550BTVSARlDTk2R0EWF+uv9pY120m+yboH8kEE
         WJnGX+qIxU28tsByYbXbgX5mPSPdfvH/fEzBV9VOnrAxf7kOyJ310HffyJkEkNRn4h7J
         0Vow1SGLUn+YJXF3f0fWxkVJGsjp7KLBq/gI6887KGzoQDXobLPWZkc7UeMXNreAwwT+
         THMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150847; x=1744755647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6zT4gLPellA5q5nyTFopWbDsYdsaDENjf5O1U73EvY=;
        b=Wfiods67ogNjEPMYuH4+QnS9TkaK+k7/i+rhrFSOXv5TsPugFtZk5FDPVG7o85omhr
         b6j0RhVkXZqJHkXE9oG3OqJHTnPHpvJEiQ8lc9gBSJvzN/ptj4KX4zS1abWAeK3/vhYt
         AoZfHJ/9fG0hXIM2i8ZUjy5hwIprQ/C12w2Tt0GBXFeqeILIoWgKeidJG0Zaww1Oqwad
         0YTm3JSE3IA87UvQPuIQeK1ZWgKWRF44Ao0XJLOv9GtWjVRtqY9cVoal7K8d+J2LUeuU
         AtUCCZu6XM8iYMbinaqtFF5NDf0JcDQOFgdG0as8Wvkel3dtxb3ohomDVp8uVOmNwDgo
         v2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCW90I9vSsf9YunqW9BRFc19p9i/0DkWeVdtbdiUDdngXOTdhb7zZxW8SZ+3goNS6/oG0eetnXE55P6cYD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJR7A/hiowII+ot5sN40sIPIPQ3CVXsRKHpwQ9kw/NC/UERE7N
	LhFDQ2NKGAPLzJ//wyd96aIxrzUsJwb5pC8zWOcrrj0DxG0Zb4f5iA+BNf+r+Q==
X-Gm-Gg: ASbGncvtPyZ2HoJgDMsj0ifDN4TK5PAvlfCTz1TV8IjzH3eYy5cziJD9hvK/pKB/RCa
	Phn/w4mWFFIp+I1xxiNGBKYBB/WHTc1CimASCo3/O1X1n3rrxl3vkK9ChisT/48VNaSGrSlYpEF
	7wjmcvXwf7nQz5vbxuo0xzbK2NkaiIXWtj1X1X6OU4yZZAPJR3T+nR8eHFA9fP9EpvVuk2WTVfW
	/UDo4QQHLXPPqAUb0eWCERXkcbY5/DukEnG1czP1/NUKZ+Ri5RHTOTwaMCwya5LrYonPJEPQ8/t
	1bneJKG0MxCGkjIJMnp/KZcZaxWVqlrbfHngbaXOBTJ3ERcWTiLMai/2oeHegMdVR+cRvNxWVDK
	hpREGUayQjpRI4Ed8DSrh
X-Google-Smtp-Source: AGHT+IHTrnupNNjrWEHGiG08ITTUNsoI/7cUK+piGm3EAUOr2hZ4ZCM9nE1suE7+kBQPj3LuLOkFrg==
X-Received: by 2002:a17:903:1b25:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22ac29a9883mr15086195ad.24.1744150846782;
        Tue, 08 Apr 2025 15:20:46 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe40sm106214205ad.72.2025.04.08.15.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:46 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 02/14] staging: gpib: Correct CamelCase for PPConfig
Date: Tue,  8 Apr 2025 22:20:28 +0000
Message-ID: <20250408222040.186881-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch

CHECK: Avoid CamelCase: <PPConfig>

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/tms9914/tms9914.c | 4 ++--
 drivers/staging/gpib/uapi/gpib_user.h  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index f7ad0b47ebb8..5f167c518c7b 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -736,7 +736,7 @@ irqreturn_t tms9914_interrupt_have_status(struct gpib_board *board, struct tms99
 		unsigned short command_byte = read_byte(priv, CPTR) & gpib_command_mask;
 
 		switch (command_byte) {
-		case PPConfig:
+		case PP_CONFIG:
 			priv->ppoll_configure_state = 1;
 			/* AUX_PTS generates another UNC interrupt on the next command byte
 			 * if it is in the secondary address group (such as PPE and PPD).
@@ -764,7 +764,7 @@ irqreturn_t tms9914_interrupt_have_status(struct gpib_board *board, struct tms99
 			break;
 		}
 
-		if (in_primary_command_group(command_byte) && command_byte != PPConfig)
+		if (in_primary_command_group(command_byte) && command_byte != PP_CONFIG)
 			priv->ppoll_configure_state = 0;
 	}
 
diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index b0c131196a00..ff5a257f9a01 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -130,9 +130,9 @@ enum bus_control_line {
 enum cmd_byte {
 	GTL = 0x1,	/* go to local			*/
 	SDC = 0x4,	/* selected device clear	*/
-	PPConfig = 0x5,
+	PP_CONFIG = 0x5,
 #ifndef PPC
-	PPC = PPConfig,	/* parallel poll configure	*/
+	PPC = PP_CONFIG, /* parallel poll configure	*/
 #endif
 	GET = 0x8,	/* group execute trigger	*/
 	TCT = 0x9,	/* take control			*/
-- 
2.43.0

