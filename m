Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2252DC789;
	Sat,  3 May 2025 19:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746299119; cv=none; b=NZpbrGPXJy8JibtxgCn4nw7bgqHa7+b2sxb2oi4TABrbA3ieaSX5kuXS0uLg2OJM+3IcVVX4ksYXdjy1V+jBEru0eVUe9wZP4JuirAzNzIG/8aAqDVFngdxgo+xzIvGZ4dQWSxv2iwPj9G3PmELPsiIOqPPp2tchP6H/GHMbyAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746299119; c=relaxed/simple;
	bh=tr+YPjJXjPoj3o9dY995qlT2B0azd5JGRRRMV8X1HGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AVq46DQRij3X1pMo/R/ByeuQuTG8QQ/FjstknG42ik4vQtN8TX+c1CBfqzHwM0za+4KEDwY7YAPuNaZ2wuhplLWyMAqQ60xbRbbm0aSmmzGz5KXyo4Eygdslf/nB7fNpshoVwL3XQ5AuCQrrvVOAOp9/oj0cIVYMKuKSIteaG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEMEcdOt; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEMEcdOt"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so991687a12.1;
        Sat, 03 May 2025 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746299117; x=1746903917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H1SOPVK3jq+ETNPgBzdZyyatrwVeYL4czc8WtcGbAVo=;
        b=MEMEcdOtjJzt0crofWe4fWY3sogn6XnzQmTur7rLRKBDiR7hpZxZnaNMG1jlEi5AxZ
         SJELVy8473fLnZ5PAU8/ZhEHkitDLa+xPC6V/aRCRzeqllezX//QGpe3p9g0P8lsIM7b
         v2v7Thmh8cyjYliWWWsW1RswSDLrf8YwtmELO3js1s9+w6r++LnXleUYzP8QVZrlmNmF
         Se/+GqMgLGSsS4dZJE4D4kRNMLMI9FoOBtXcmkNUiqJEa74gz5GA5d1adTPS4VOpmlJb
         f0ZV31BN2oz2HxDcnV5I93JRrujJ7FGKc4tQlxrNoF/EuY1C+XwEMx3DubjFOO9NFGLA
         54mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746299117; x=1746903917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1SOPVK3jq+ETNPgBzdZyyatrwVeYL4czc8WtcGbAVo=;
        b=JH8IFNV21i48cBajrfQP5PWoicHVrax6WwcjW35rqusdHjBLnwwDzWFnOKpBWvAHcl
         MLb5JZblAFbfr4Q2WxLlYl4U+Qxp8laabVX0ArcAFEMxd+2F7+y69Inb4UMPtUTUq5KV
         xBrHvszE0729uaxtZF7uDTjoE+LyvvxtdXucOz6rtiWbVySZtHyLeUGBuyf/mS+H6Mgw
         C7htf1GwqQJcb7mwhrJIWrjtggJyspxTY/IrwPcfS6iF8ghndtgyBhKc03I8iFhT6Cmr
         HWIwakt6Ia0LxZUZ3XdQsGVZXa3zp750hFf6icFwjUkH9UpCFeg4SmXjTpaLI7ajP9SC
         +f7A==
X-Forwarded-Encrypted: i=1; AJvYcCWRQ8gTYKtkPek6sKnBfK8gClhnzAMteVj7yoIYeyzV6mHo18LWEz6Rq8uWWtW1Japa9HfDBTgqI0Ft@vger.kernel.org, AJvYcCX9M02iThSfbdIGAWRZSFgUo+hY1WrD8ugSy8ngzIrezmX/WsGUUuL+NE5HikL8Zjgw9oPXXvgFal+QY8CL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3dzNjcFg3vbRcurZNjEDBjDnhKqY1RW7QPqp9zH8z+smUO6dA
	c13c1BA8gKCygs9gM5+FDuhd1FyYPqVd/J2e5qqrp7A1yb2liObT
X-Gm-Gg: ASbGnctNk335otBqJKf0THrQIAT/8Qe4Rk8B+ZD9v97HR31FmnTt15qwQ5asrzdi3Qi
	nPJO+bwkRaMAuRRfY8+nkSwWyJqEzWd29Pik5e91wJPX6iicX7NLDNFiMXmAS/Ck2pmoMrnkOpt
	6AbLbD9WjUx5Z5Afzbad4ITCFoNOP47wMztlJzMy8RIoi9jFFG+UJM7CeFLPclDLVMKtzH6a6jn
	woGzoBj8CeaFoxx0J5sSV0GCDt4hF6Qfe9VL5X/X4Ifs2ILApFOWI2ujfjxUA2XhjUb41NlCgHv
	kV+KZmdTPi9yL5AKB0jN1y4cXpdAMT20toDNxH3aJzzLZhBRCtoj/e0AHM1xbbvFR+HzOrx3OA=
	=
X-Google-Smtp-Source: AGHT+IF4jkwmghllC6ERa1DqhXDhKdCb/g4YWS9LuRHAjY7lPeV7SUV64TcGNhOaHX/kw4fd8aSMHw==
X-Received: by 2002:a17:90b:548b:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-30a6196eedbmr3237028a91.7.1746299116709;
        Sat, 03 May 2025 12:05:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:4ff:1626:32b1:712a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a348266ccsm8184622a91.42.2025.05.03.12.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 12:05:16 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: trivial-devices: Add Maxim max30208
Date: Sat,  3 May 2025 16:01:01 -0300
Message-ID: <20250503190509.33074-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The temperature sensor for maxim is a simple i2c driver,
it's eligible to trivial devices.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Inspecting the code of max30208.c digital temperature sensor (i2c), 
I can see that the probe method does not support additional properties
and only does a few things related to the IIO subsystem. 
Also, since was added in the tree, there is no binding file. 
I'm suggesting a change to add that compatible to the trivial-devices file.
Tks and regards.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 8da408107e55..377722af6c00 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -173,6 +173,8 @@ properties:
           - maxim,ds3502
             # Temperature Sensor, I2C interface
           - maxim,max1619
+            # Digital temperature sensor with 0.1°C accuracy
+          - maxim,max30208
             # 3-Channel Remote Temperature Sensor
           - maxim,max31730
             # 10-bit 10 kOhm linear programmable voltage divider
-- 
2.47.0

