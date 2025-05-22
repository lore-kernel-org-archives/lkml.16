Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5647D28D854
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925418; cv=none; b=Q9+Pe0osrN0v4XPr3xDXOPrN0FKvoDQYxnuE6Ci+hBzRBMq9+mE9FRjkmoi+OZIzpBU3d6rcQ7Z1obQgOVS5a3fLuE8ZMGJpW/yDK0E7OqJKzbC4aEo8TWeUgR28vVhliT2fJd6dZWM0tHExQohK2QH1xQX5CJftBjF0SLbJ1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925418; c=relaxed/simple;
	bh=Afxwdef0Jf2HSBiCXGtNVmL7wJWM8CS0UaEkxk3+CTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=put6u3YKji0diqVnRd1s+bfyB65Qep2pscxjXTrRoJyVpy+iSDEc8CPzneNm0hS9kvUs6tQXbnNAqe/OMfRuaFHo5JnzWpu7Ebk9DWXmTedRMSgx4FDOaflB6JgEtAfFXwGAjTE8izO8z6jtoRkNBre0EHP/f4Hk/5jNX9S7Uzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cH7Q5Zmz; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cH7Q5Zmz"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3f6dccdcadaso6176757b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747925415; x=1748530215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp00wL1Y5X4So9ecfuqEeP+KnSz3366qtgJ3q9p0wb0=;
        b=cH7Q5ZmzO2xYzDimGDjeSnbsmyL9HpUKR3C7FvwjX0GOaVnaA4y66VY5brWxAs/vSD
         Z5IC9U7VM9/ddV7SCFk9HxWuz8TUyBXpM1ynA8dPc12hWLx3sTMZ/YP9idV5mPEOyJUH
         v4Em01TIWD2Lku6CtKKdf5B5TiF854M3Y9rlPdBnRrtkzmaYng4RE1mbCqwjEhka6ozf
         N/bjOZoB/NPhpuIaaZKM/4vCMlXNXQ5ZaeqgebrBVyYhPj4b/TwE3aUodOzJbcaRL3/0
         bVM2KMNUD91PWjw2PSJONq+yfoDS50kYUsjR4EkMEGQhIC6W588GsqrhqCIm0jEfVRYO
         H8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925415; x=1748530215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp00wL1Y5X4So9ecfuqEeP+KnSz3366qtgJ3q9p0wb0=;
        b=Juxr5Dm9B2eczQCqtdv4CCgaZ6pAC5q2JZ1/9mopUDLEjKN817/XsRgbC7esL16CaK
         /mZagXOuGTpTqsdbTsVczWcpeJNvYJeePKpgGfDnvZBEJKBw/9Z6x+fUQLeEHZZMIky3
         EmlbKDnWgFWsSNpieTZuTg5NVOiwycMiaL1kZtn0DH98bxNRlGRfwgSCZjWhkZgOFEEF
         ZSgXo0Hn7MW6Y4sLYn+/3ATCVy7006sf5qe1+oEGlWEE7/52C7RcL3rqLR9EehYK9Qqn
         0nWdlzwXRHFsSlstjIfa4Quew3TPbUaFrMFQTxMfsQQbxNhz492KS2pa0MGuKtLRLkIm
         jQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCU00KZujXGcMCBRaD2LNwKaUsj3TTAeYfiBoOQlHkj7yev02hCpChIuIDEONOV2ee1b72hVSAuwjDPl+G8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXkcyoHoe38lr76OUXPAmgL57voS7sOA8SsX0xI5KU7x1Kd8W
	puxkiYz2XrEAdt8EX89yDsHIGmnkwYTe3bQSXSpm2c4eMtB9OsQu/AtpIftv0oEmm9Y=
X-Gm-Gg: ASbGncsmufn+pcMj8Sm/Oh7WKe1vjyP0eJYu9UDoWgHZW/ko1GyvNAXzuCizVD5J/1g
	8p2Njj6Z4VQn6UHk+Q1q3xp3CMXhuMLshTk2hbBU6rnnd1wrOWaOxW+3n0Z2XpNsxW+O7JUYMYJ
	xj7agJlz16lcKUOfwUIUrGxIQL2Nhv8A58OHeHgUF8tSV3FQWERTyC9nvTSC8xJQgZVRbEtXiFw
	n/hATz1gacyrGjBeUZu217zEPu8O/yr1QiIu3EDzx1aV9tcf03GZgY017VHrm7gOxOnkBllucvW
	mmLY8nkGAWtsgHdPvpIK+STFvKVY5qMZo1xABf5lR28YPnCMRw8rTCCwog==
X-Google-Smtp-Source: AGHT+IE99qI2igLnDsriHnE/Vd3dM43WKl4zvPdqjymh1RvawHuJ/12e90L8OcmZmHyThgr1FJfBDw==
X-Received: by 2002:a05:6808:80c5:b0:404:e2fe:eea4 with SMTP id 5614622812f47-404e2fef060mr16898305b6e.8.1747925415387;
        Thu, 22 May 2025 07:50:15 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3407:53d5:68cd:400d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404e303ffcasm2228234b6e.4.2025.05.22.07.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:50:14 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 22 May 2025 09:49:39 -0500
Subject: [PATCH v2 1/3] dt-bindings: pwm: adi,axi-pwmgen: update
 documentation link
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pwm-axi-pwmgen-add-external-clock-v2-1-086ea9e6ecf0@baylibre.com>
References: <20250522-pwm-axi-pwmgen-add-external-clock-v2-0-086ea9e6ecf0@baylibre.com>
In-Reply-To: <20250522-pwm-axi-pwmgen-add-external-clock-v2-0-086ea9e6ecf0@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Afxwdef0Jf2HSBiCXGtNVmL7wJWM8CS0UaEkxk3+CTk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoLzmNrUCJifl1QcSZ+gTDF2zxU55qVnomA5y6m
 tDYQUBK0S6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaC85jQAKCRDCzCAB/wGP
 wHM2B/9JRNMQwTLu4nuDNL9qVkt/WIOCiYtI7/wLlaTumz0jd8ffR2Ear1PGMwhCgztoIKsQYyj
 1ckmmt2NJYsI7DyufiVL9eVHFOL59b5wACwAwSLbDDFTssMq7bTgJxWqj4qUzzX43AuG1rg2F1x
 W42/gMK5fh0VM5YM9TJdy6DbsUfezLHVHGxB4XYiqT9BKsVBJFtZ2j3zc7jSH/FMEvd4wD1TCIh
 wBUxLB72L6qEwObGLZg7znRgQQCnpDVkG+Ir6LKlJWCg3xnKswipsiGJ9sgK2KtA/wqRaRQIMT3
 Dy6kmHYabFAbjJCjjavBAUHJEUuaM90IR4XBngFbk6GW6UtE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Change the documentation link to point to the location with the most
up-to-date information.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
index 45e112d0efb4663bc7fbb3a25a12d66aa8b7492d..bc44381692054f647a160a6573dae4cff2ee3f31 100644
--- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
+++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
@@ -14,7 +14,7 @@ description:
   The Analog Devices AXI PWM generator can generate PWM signals
   with variable pulse width and period.
 
-  https://wiki.analog.com/resources/fpga/docs/axi_pwm_gen
+  https://analogdevicesinc.github.io/hdl/library/axi_pwm_gen/index.html
 
 allOf:
   - $ref: pwm.yaml#

-- 
2.43.0

