Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F8F1E4106
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266260; cv=none; b=lthCuh7udBtwLczsX0U7NFNHRzj1ROV/qpAK7G4y+Njbbfrocs+zd0+6MWk0uuIvYlfn63P3TRlnjshBcmLzpzes5Q1mzQuPmFL9h73/0MGKDPpiK22aT5N7CIZpE2gfQPIA/nt6KTlVP3XiaZtuJz1it2V4jnMP/po1pa8nh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266260; c=relaxed/simple;
	bh=yHR7fmZ2/v4fPjI6lJk75oX1K0Ixzxl2HWQK1pCqNbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rqo9ZaP1YMeLLph2BdFt+yCvJizyySP4G8kUTmEqWmyaFi88WD5zi8wQjom/YZAjstyukywKPFluNIHKiHOswtrN+v/zTYb/MIVnSEk6MMOgy4c5EY0Rmvi0tW7WTu9T93u3t993zVxdJZlcMDqTtAxEKuvoX1S+39lCirCkM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bnRyVbHw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bnRyVbHw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a823036so12592035e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739266256; x=1739871056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yExLMLYCeWgfPAg8dv/C3ycaxjv+o/aMZg2SZJq4U/c=;
        b=bnRyVbHwVOkTyOrrx9/86MX5gbpUdsS9WoXKWqV9O/Jri40ReZkIRcFB/gjHCTqRXU
         N8ptfmyJpUj9gWAD1bgBeHS9MEajbnlvGs+Vdeh84pcj05O6+f5jUfPlHCbbqKMXW1+Q
         ophOz8b8A5Xc7RspEG3y5B501fuyExfxMY75F2fbSpJ4KywgqCt2IR23NB+VvmNcGCoc
         w5vx5buNW86efpohEJYm/XqA5U1Rx4aeRhv9+nrTO4GKK9GfEyl8+z8AVuKgKlx0lLhJ
         n9VR8vaYIH798CEEgFrGCRX0NyC4CVGSaHzfCFO0PrFOmmBUcEQx56yf0jt9Zn9tKQAe
         msCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266256; x=1739871056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yExLMLYCeWgfPAg8dv/C3ycaxjv+o/aMZg2SZJq4U/c=;
        b=Ga+HST6qdRNI4FJWx3tv/XdLVWoxs/DdxEvhdjYUBAPPehUHNLDjNc3qnSoVFw4NSI
         l9wOUkPyYsXEaO9CRH7l8MvyAfx/i95gg8QGM8mhw7ZsMSCKRQQ4d/12kbAeih4cdn63
         be/s4UER+tjpl84xWQl8+BihGdoADg0t8nJ2mH6K2Z/VEIEXki9b/4i5r43QfQ4MiMFO
         We3T/orDM7b8qOpg+csxxxPiTR5sky41SeNEiTEeHkGCX40YLkrmaal3AOB19pSJLqZY
         0WegIJSTIDgU0zqApejkTtqXabFHLXlveV/+8+ZStOncIW975OdH2t5u9nVbOQSN9jey
         H6mg==
X-Forwarded-Encrypted: i=1; AJvYcCUhVzGT28PaQ25r6732SRkAocmO8OvL0ouLxlHUO5CYD8C+kbgnVEAn3iQ/Y8Ulj8V/Cn/2Qxt+Rxjytg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1wOgxpZZ58hCUdyh5OmaE+ndCDpj2YsILbAidqJyxnUobb+oz
	TbWMRr6jHKHGcpuDF0roAOdo5J+jL16pA1tIlB9h5zdrCjsxtZM5Zq3DbnjCiak=
X-Gm-Gg: ASbGnct5XThjjN3D5dt3o820ELWpvyOViOknqVEFUyJUWdSq/fCZruLGCfL9convTaw
	YQ4b+ZAx9UZY3EXMIfQYBvKMslH2nsJPKdJDNRa+b+d6E48UBERsa5L1cfQVn2XGKYNxhFbvn0r
	+1EwGHSi2hRg2mYMEMuwemufRIC1I5xSDugs8CjXI1IvFp66bOIFUNGHyBnkDy0k9Tq0mZ7j5TE
	RvdkQbYrsUAkvFeOVWsCefhI1ZN0sxfD4aGVkTU4uMXWC+juoWdiQYz4pQ3sYqV8uFDtDXFtc0K
	Tt+TmWuFatjBzdUMT+rCj1B5KZ9KuEMsq4IvwuR4uG/hjmK0RcTq3fxM59KJsWuESd7nui8=
X-Google-Smtp-Source: AGHT+IGnPHCTuUJLNxNW+8FrO/x/ilNOPLhSCK9CbmM8yRSZ+1JxBJpmZu1Hul9+oawgshMY1YBAVA==
X-Received: by 2002:a5d:47a6:0:b0:38d:d6cc:a6e1 with SMTP id ffacd0b85a97d-38dd6ccae82mr9537099f8f.28.1739266256526;
        Tue, 11 Feb 2025 01:30:56 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm12591296f8f.79.2025.02.11.01.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:30:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 11 Feb 2025 09:30:53 +0000
Subject: [PATCH 1/2] mtd: spi-nor: sort headers alphabetically
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-spi-nor-guard-mutex-v1-1-05ed77a484d9@linaro.org>
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739266254; l=819;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=yHR7fmZ2/v4fPjI6lJk75oX1K0Ixzxl2HWQK1pCqNbs=;
 b=jRD2FuvxlKXrQY2PB6zLOHVnD7bkUrVQk6+dxMacV2L7fyr3pJ5CDh56ppe6qZw39nYoSxGuU
 B/oagtN2SJQBw2LdBeBzYRUbvHEw7kAGJ1smKNeFa9YSax+xqeXCFKp
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sorting headers alphabetically helps locating duplicates,
and makes it easier to figure out where to insert new headers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 19eb98bd6821..1bb4a500be6e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -7,10 +7,10 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
-#include <linux/err.h>
-#include <linux/errno.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>

-- 
2.48.1.502.g6dc24dfdaf-goog

