Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6562A1FC0EA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 04:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096542; cv=none; b=CEGgSMjLGDSkBbhlbeqqslg3T6uzZXi74kI66ge7K/ojDIWLkI0YTbfV/fYq0D5FeT1GpFVzAQZ6KpuuuAJyPvIS8dRIlAiyy/PSo3T1Bd/AfGgB37OlGUGDBD2PdyYSIVUDu8/Lhn2wz3Ud7Ds3wyctfBttdqGwsjQYykD4X94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096542; c=relaxed/simple;
	bh=a9vspmwOZwaz+AyzjgcDWgvZX8fCbnDmm62t4KkqheY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Eld4YbE8R3O/vli8KmQ/omyObGbb87AY0Ez0nYpZBSGojVodmUiBiSolPKU1VvY8OxN/mjDSeQsyb13LlEPdk2I5mRT82elI+EkP9wwDgMrZMYjHPWy5P2jCySuj5Vya94JfYdU7xWvf8RJF0qevKLptYQW5sl/AzbDvDOYP6RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=MbUqVah+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="MbUqVah+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so517527b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749096539; x=1749701339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjfsNmetPpQZcvk0DXM+9sLzYuAqIccObvN/JpO0d60=;
        b=MbUqVah+lK7MXo5D9b75EAAiO3RxL25XvgKnX3d2tfAGIJWU9X2cgZ6cOnYP+btdeL
         sxX1RWPDTiRC681CL/0yGaH6mernQu9ZansHs5yxLVfoKVHb2bySvLiZzN23Lmma8OrA
         B3LaElePpWuXrPxc7gV6jxXsfA/H1dYrqO3YfBD/KGBbeVURtNkWQzg22zzh0iPDiG53
         o74ARzsneQFNAYCyRpyOBaIOP2T6FfbBZ30p4MwKaGJA6fpoaTqz3b7FIAFPE9vdDiy7
         10rN3EUD5rrLZKZfwlsD6Z66sltmLKSWwsFcDl54dTfBfKSVc99p6EUOs+67awo27PXV
         hAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749096539; x=1749701339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjfsNmetPpQZcvk0DXM+9sLzYuAqIccObvN/JpO0d60=;
        b=BcKamFUj0HVx2QjdUu39mXkZjVZNFLXMAHHBJ7MD+YdTYV5aZEPwZYYKg9CelraW5V
         jHvjttQiNL06uUbIaDBiqngi92cA+p/kkDHiN/wie8OVXHACuA0has2iWQvDQNQDi1HX
         9KrMlBAxfidNMFA6R7FiTEYaavY8f8oblm7f1UjaehYPlWvE/gPCLWSN0exJQZOd+rf4
         Qde11QYeB1LuAMWn6Asjx2tBBEPPVa1P9NbDQK1OBQ/dK6qlnzQNA2evTcCxETiMDyl6
         2zctLx45825+cy03jdTEElcHJva86JELf1IhvRwu7lC5fdxqZ+2PURlH6kk7ZDjdfwu5
         ypyA==
X-Forwarded-Encrypted: i=1; AJvYcCXSk86EOkFXP1SLIYjkl8ClhTCIRWwExFKv4jbZlA+qk9t2Vp8kBeF9jrOTPqLOYd2gM684e0LAxZI7mPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6sQEqr2+jcN/sZ6Yt4hdnAT5U7Ft6JIDhGSS4qGJhXQqnrjFN
	Hhb8l1VoZ0Ic7vhXF1TTybpQsfZx6CzFcV76KHSM4bom1K1t8yc+4zyEDDNUDYLRwA0=
X-Gm-Gg: ASbGncuCfiiUvgaSrdNUtdk/KGUTjX3SDqCTWidFIOIYiCXjREIqCg5XEyRLaPzYERo
	Hl2p3g1X+BZKtQjcVO3N9C28r2YQJfw7ocsbz9iZHUB+kwwFH5AK2/zZd7fcRmXVkB3iTpqwd+l
	Iki+g5tUr9iWtjE60aC+Dc1eH8xfGp3OogDdG/BOKsWZHZSb7KRC1bxuTGCqTWTS/0hrrGQ4eTe
	CO9qHg86o/9ozQuxo3XQbGorGxhod5ktF5ye41cfv6+bUOd4PSKRLsDuRZLfzfhGqT5BHxCsTHT
	BGyparidL01+ALRFmn+AJLYuTelYbuvq7jB9BDT9YsZQF8YAeo/Ms8lnLrMZ9muAL2FGrGMF+pB
	zyTZC42o/8sVB2FO3VxaUx/Amkp9zuA==
X-Google-Smtp-Source: AGHT+IEirjuNisMSQ5l3eLZXrOk0WC7VdmxBT7nUZIwftQy8n8ayiAsp8QGY4W1u4FXoCgiVkkh9VQ==
X-Received: by 2002:a05:6a20:12c6:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-21d22c0e03emr7290700637.10.1749096539440;
        Wed, 04 Jun 2025 21:08:59 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb029fbsm9480924a12.13.2025.06.04.21.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 21:08:58 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
Date: Thu,  5 Jun 2025 12:01:33 +0800
Message-Id: <20250605040134.4012199-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250605040134.4012199-1-chiang.brian@inventec.com>
References: <20250605040134.4012199-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for raa229621

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v4 -> v5:
- No code changed, included Acked-by tag
- Link to v4: https://lore.kernel.org/all/20250602050415.848112-2-chiang.brian@inventec.com/

v1 -> v4:
- Correct the subject and commit message
- Patch kept in sync with series version
- Link to v1: https://lore.kernel.org/all/20250314032055.3125534-1-chiang.brian@inventec.com/

 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index bac5f8e352aa..3dc7f15484d2 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,7 @@ properties:
       - renesas,raa228228
       - renesas,raa229001
       - renesas,raa229004
+      - renesas,raa229621
 
   reg:
     maxItems: 1
-- 
2.25.1

