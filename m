Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601124418F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150860; cv=none; b=cg/rsUYWHu6HH6iD/sjWenVOuCn5mddv7xx5LUFF38ZAdb1Kmzajx4Zs6Ug+YJdqOJeXDMJacQ/xXA3d61cNO+lDiBfQzqC4jy4Dzu3J/bqra5jRscqtnr/BR5LXVuOIfiv7Qh/9MPebBMxME9WWTEEYjNnxI8xS+gUFh9hJ4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150860; c=relaxed/simple;
	bh=2wf7c7LIBzRB8hZAmqsGJOJRMaXIRHLWvAJXOmvSAzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwIjk17g/ztrUD7yJjRMyluKa/8KwtPTUOyYHkwildI47BlQnRbPiYayU2iu581Vi35OFAQA06CFsjosn+ALibCAux0M4mHbOFIXW3Azo5N7mJYl245ANN9hodI7UJg1PvpvfjpxqkVlBOWhtMuzm5eJpl6ByLGplLONq31tD8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=LUgalg9z; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="LUgalg9z"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22401f4d35aso69848185ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150859; x=1744755659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtdVHJyH0NltQn/jp3Ss8N//KtRoFStN3nMWlkLRCK4=;
        b=LUgalg9zn+wYpaBlIqHlX7kaCrdgpQ8Fe5+i4QuAllO9MF0uBLzql25EBQNQzzFoQr
         c1xS6KsOv4+Q7J5rkFYyD9ZCcSwXNq+wwJkAepV2qX2pv9t3kjS4v7nYpz9jR7wmQLVt
         Y+8U7VJm1MmR/ybRzivhYNjo35q4M69IFTCX/u1yof4S6Z+3q14lgC27EYlDLsH8fyp4
         0WcchopR+RBAPvVWUn+Rd2Dc9ETA/1FtGcNEw00NxeeTzNFkC7rSX9LjCf82BQVjpOGq
         nnwxVDsYZqXAK2lWER1hIbVY74huKMgdAGS1lJkscI6TYQnYz2x3q8VN/UyabADq/ehI
         35jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150859; x=1744755659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtdVHJyH0NltQn/jp3Ss8N//KtRoFStN3nMWlkLRCK4=;
        b=Btu25NNFasFdfn8Y8XCSc/iE1NT+LjCwv3HPyzqcOdC1X0xBOQP5LX8P2JbymQDwrc
         6j+iq77bCg+tdO8uw/rcQZGKZna23Lab+FK4nXK7qiTZrrUIkdEjtOKfmWVzzNx9UGZj
         s8UAuvm9SSnb5gIqZmvTQKcSWSjAf411QIfkHXk+e18FzkLiJyJRhq5S8ulGVgXAyLT8
         GWnLZRWO+KMwkLfDHnLRhZ/18HVsf5i0dJBek9bsHm7ci2DFffC9/XdrvLlZ13GJrbxC
         2MHLdYJeC+9T9pOMUp7dbG12ZsqgScpuLm8x7UogvpozIQZ5Zs8oU6GzacUdgks4Uuo6
         FPLA==
X-Forwarded-Encrypted: i=1; AJvYcCWkytk3WhLYq+NEaMSODRizEDZBTBkXWJ3REJQ+ABUcds0uWHBMifopRxUu6YpuYo/SK8/gl0PGgQQdKN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsgs88ifKqtTTv8Zf9+gfn2ZRKAs0HoFHdLh6QoAMlTechsEdm
	9AhH7Eu7af3JWq3HYpWCou1R9zyenQCkNMGsC5qYqQCJcf7PUdRYAzMK/c0sfQ==
X-Gm-Gg: ASbGnctlQJVAHtZAW+sZNOttStI3JuTTPLMcEPodxbkd7SbxEtNKLdukNdxru1PQWvJ
	Zgv250Wx/EQxJjeygrBTUwW0m3hSIayTni7U1E9EFgGWfmw2h2L1oHp6bvab/Gn9Hh0bs/8e0qr
	RH7bti/dUIGMjooq4sVSF+OovEroLg8EJT5NAKn4LGlakHkmESy78+DZ5aa2sf4byxUItS94Y5X
	s4ERKT8WxpSMYP+6YFJpmYcaixYM78pExKl2lYZEthEfCsNauTgqEJj6vLtdKDVuHCZjkjfLcr/
	qQZrTdhcRlCJNyeMhEoxrMfHdUXxsHVBcjg880dtn8H3mQ0poKKhKT5vxhJNskSeVUaAX0Kt+/G
	YLz33b8IOKg==
X-Google-Smtp-Source: AGHT+IHYkZurTfVVRX44HRgPhAugK6vNpTPduXaQU/6BuW0VyqSvT9F4d4SJ8m5K6rM6TCF+LQPqZQ==
X-Received: by 2002:a17:902:ea04:b0:227:e82b:b585 with SMTP id d9443c01a7336-22ac29a7834mr8637105ad.20.1744150858811;
        Tue, 08 Apr 2025 15:20:58 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785adc3fsm106036675ad.51.2025.04.08.15.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:58 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 12/14] staging: gpib: uapi: Fix CamelCase and IB_STB
Date: Tue,  8 Apr 2025 22:20:38 +0000
Message-ID: <20250408222040.186881-13-matchstick@neverthere.org>
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

Correct CamelCase for IB_STB enums

Adhere to Linux kernel coding style.

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 7f343256c110..301083f287ad 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -340,9 +340,9 @@ enum gpib_events {
 };
 
 enum gpib_stb {
-	IbStbRQS = 0x40, /* IEEE 488.1 & 2  */
-	IbStbESB = 0x20, /* IEEE 488.2 only */
-	IbStbMAV = 0x10	 /* IEEE 488.2 only */
+	IB_STB_RQS = 0x40, /* IEEE 488.1 & 2  */
+	IB_STB_ESB = 0x20, /* IEEE 488.2 only */
+	IB_STB_MAV = 0x10	 /* IEEE 488.2 only */
 };
 
 #endif	/* _GPIB_USER_H */
-- 
2.43.0

