Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6961A4E70;
	Sun,  4 May 2025 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746354303; cv=none; b=gKWfYk3+JRQm5GEIRDDEWrgyuBP2ToQBu8TqdNztYNpkJTfyOssZ0bNVYbr03hy3b+GNFC6v/mzZVai2fqfRjvVeltx60Gz/R+4OMN9a+f5CrhZ415HLu3NqiLse3zLD4rt7xcX2HPlgF0FK3SsSKYPV6CATXqEq8q03ZAFwesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746354303; c=relaxed/simple;
	bh=0/Mb1ah1rEUvHAqsuoDKRCUnTh0Gomg1mKYpqfwdvic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ssXPcp8H+HQhUmpcDwuwqUcL8Hr8w3dj7alHUoAGz2WIHGZvcrUKDcgy3xmo5NZ7rgmD6TrcTzbLh1rnewNoCfMf81eGCANOM8zJdcWGCkKmxWN8CASvGCZryzX7imZcl+OnkcmgWg7u5WTbWoEXBeOTmYHqNVGY/MCCkSrwhWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grhfGltd; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grhfGltd"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c559b3eb0bso217294385a.1;
        Sun, 04 May 2025 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746354301; x=1746959101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIL4aNRUdWRX+MJw2hpcNbVT2cq828UqZbzjcrK230s=;
        b=grhfGltdogNhJPWqcCDHNKvlNDXPn6xNu40bQUQ2oFugulsfLGK6JvuRrW6pKu39Q+
         rFQN0aMuRjbRQjALfARruIF/ac8zyJeSuc3Jb0+5jlfPK1OJV+V+CHm7HZbhROVV6DLW
         Z6RmRjxBygCdlRue6YoySavFBeaUVN1a9q8Fav05NRaHQtvcb2euSIS0aOc+Q49gdEqr
         BRm5KGckgjcj1L1/Pk95m8EY1SHUREd3CUD07oVLo/sdhcGaX9rrQeEtkF1EJmiY4+XK
         AxkJ+q1FQyE3ZWYOinK85yBEJmM6wbViwVXmVwjxVng5MmLFWHA2hIQDKwd6MY25F3mg
         6yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746354301; x=1746959101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIL4aNRUdWRX+MJw2hpcNbVT2cq828UqZbzjcrK230s=;
        b=D7yjUYJFEGr17IeR6LRl1K1J/NFAT/6t/pwMN7A1USLleMMCfeS0impNFHA+pA31AF
         xqVrtlvBoYOazcRJQ8wyD5HxeaSgSiMlfxckATlPhe6n3MjuRBK6y5fe1Q/7qJvXQKIC
         qOYEQiIFMrOQbeUs1dYw+8JJo+LdlPAXK60oYcZUd/OEuWaOy+E07XwO3dyqWffqGqYO
         v3/0D/u+DT5cPaW6nq7WKe5gXXMyQmcKI/Kys4Apsko4gj/Pv0vosYWTnLrxAgNlL1Wy
         bOGYe7b/Qd5bzG6jxQWI2eGMBWu7w59HbWyy1sGj9t/ne7W2c8UrhKsIP2YRRHFwTBW1
         kczw==
X-Forwarded-Encrypted: i=1; AJvYcCWDVtrAm10/pEiv7NOnAsmJGKbABja9HxJ+Q4MPp/I0cq8D857cblyQzOx6gFvsVWUrzbT0EdfqFc7Ky6qU@vger.kernel.org, AJvYcCXYPPE2RN8UU1q+gVkWcPt2BqeRuhPIKhAg9roYMzdHHL4RjksvHqCpUhZ6dodUA95FeWFcSnqB5uY3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/uLRoxJAQXYXMwXyx+2YCn9ugr5hLxHvtNXnTrjfsGg+4IYb
	KwJrF8F51eh7qlYyIDZQf20bny/Zlwvq7Yw0SW4XWe60jOX43Dhk
X-Gm-Gg: ASbGncvnO3Bds3G2jXIjF3nkoMjjrNMZlSOSFLhFu0uJFr67eb80WYQY8klMMfzwiYd
	d+FU/qztjziCtthe0Yo0EOKsVhp9Qfe0Rtvlj5WiSfFbMWffwHntUTK8GLtf5Ti8dWfMFxkyUMt
	gmNiGVNg8sHwPpId2fL7vkIcWbQ1/kCjfELeYObLz8RxP4FH70EY9x8YUysnzHEbM35gI7qTcWP
	jJnoelSh0cNDtdmKmuzsj4R/1VDEbuyVWu3X4HEOt1nvpJ6tNY/q7zFrFN0pagYmHCv713KGkce
	y8+EsZ6zg8ADUAcxM5OyuTijeaHeGi/sHFlHTDRJ6+0U7hsu/PiJ
X-Google-Smtp-Source: AGHT+IG1pLSmqs1TxI/sdiS6KwXQllq1uirYId4wzEbTV+gWXE5VbZZ64wBC5wE4MWD8ZRKMeuJDug==
X-Received: by 2002:a05:620a:400c:b0:7c5:4278:d151 with SMTP id af79cd13be357-7cae3aeaaa7mr454274885a.43.1746354301080;
        Sun, 04 May 2025 03:25:01 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48d6sm429222285a.32.2025.05.04.03.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:25:00 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	inindev@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Date: Sun,  4 May 2025 06:24:45 -0400
Message-Id: <20250504102447.153551-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250504102447.153551-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
produces development boards like the Luckfox Omni3576.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..9391e0c31bb8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -892,6 +892,8 @@ patternProperties:
     description: Liebherr-Werk Nenzing GmbH
   "^lxa,.*":
     description: Linux Automation GmbH
+  "^luckfox,.*":
+    description: Shenzhen Luckfox Technology Co., Ltd.
   "^m5stack,.*":
     description: M5Stack
   "^macnica,.*":
-- 
2.39.5

