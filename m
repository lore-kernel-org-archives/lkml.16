Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251552D323E;
	Mon, 23 Jun 2025 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701425; cv=none; b=KmjRZiBztKFvRNS8KVLJ5f0eVU23CWFI8XLwvrrWej0finA6Jn/Yw9L9iPLqV5oQggFLR0HOePjvfveQONbvaBwJ094C/RE9Tw8Cf1I4dcpUT+n13fKhvPazVREqS6DNiVN/Ru+A9s2DEzbnGQSatNoOoH2r3OIo0zCBn5ScEYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701425; c=relaxed/simple;
	bh=D9hK6aCg1zp32zCrrbFTJLWW5r7AZGwUreSAc0MrHXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GpZcEk+db7H0vFa4LRvWYUdFtuW6vE9PEdGaqaYDXWR/2ndu3ZXZ3XJbJTR07qs7cVsVO07a57KltugOOpkFPp7BeXjVGkpQoH0cm7cr8/1M4EAUX7HpG3Gihuf5ArFEUkcbiVU+5IRvSkYvh2/hZdrEFIpMZE5+neewwJWCOrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBJRBwqc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBJRBwqc"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade58ef47c0so911642366b.1;
        Mon, 23 Jun 2025 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701422; x=1751306222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=DBJRBwqcfZERd/rmqbN86ncLhPdfh9S3NJGKnev8VAuLsNok/2MtzOqaqXQCwqKy37
         eUBIeSsr5JyZ5jkUzootbLEhqH4WdGa0TdLTANFI+NuBJXV+bW4ObnbK2cw5bW8qPLUY
         8CRUWxWg+iJvBaE6dkCEEBy+25vYa/aRmmE2Pje9YnTY6dgzT5u+FPFGP9ahveM47YgQ
         lSBTo+9JqFKhelz8PYYRzN9sfZn57aBsiZ+bSbaesg8LHql0wqMivm7ViraPyUir1S0v
         sgTcIlchnHgFuGp5uMrwgPRPC4ntqlYT4lZ8aY7q8Rbg3FmHZsa+b31iu4llkdaNF0QZ
         l3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701422; x=1751306222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=Y+XXV/WypLYA41gAVfp+Bt9gJz2mdjZSG9JEo/8wFrwzBwpnV615OkP0vBFqBlosl2
         ky7Nxf49qf6xZ4ngbl5YiKIH/z53CpUJr6zcRLFkd3wx+f/CFTRA7EhB/WZD+bC63zb+
         w9XfL6JcV4lF2LT7RogSiwm9DagLUscUxGi92xg5Bnmof8jxrx4St1oD+ZGgxg+K7kMX
         t/yCoFZllH7KB/bdRLi/Sua/PDN68ECU8LycXOUbxeXQykNqj8XbMM/M/YPST0Qb5Uqt
         isLJlXWt+FDeo7z/glroeDi+huuJH7ApSffUWoVcJ+U7e9ti0hcbuSxFMnTI4BKpA+JF
         2tBw==
X-Forwarded-Encrypted: i=1; AJvYcCW+Sb7KTACfWxUsdII87h/NJSXPPWXjbFIV0j4/pFz0YmRvQgOpSi8POjyNXqN3DZeiDZ0Z9l1XZU2U@vger.kernel.org, AJvYcCW9SvM/sjZrxogdbWTsfLrd4INHeicnPh9iqfgRY6mQ/5WTaTbF8OPYV8fvqMEDmC/zT4OQTdEQ5paPArp2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8328RvwPjxbozvJEdtlWoyq1D6kjinr8qIexj4pVyYjRYrgQV
	1jSSAtpnokbZyikkh8Xo1rTLI8zeEq0ujllvdgL1eeNhMJ4U2vcsBBYN
X-Gm-Gg: ASbGncsDBT4DsrfGYx+Oksh8ThdIthbrQ19/n7GiA5lkbPOjzVl7NzRzGoa6DdfRWE1
	J7BALnj4XsrQ7PQHqBMBFgGM0GWi5HF7Ic9kYqmMARO4NfSEqnvW3N1jMJiW81mr23b3M2ta4WV
	5OJmAb0niw2bmVA3TkpRQZjydi8gvrgx4yssFLeSAeKGduwSvr2vz3DBa+Q7vOGhiZCBi0rU08n
	ojbnb4TUaPn8zapBDhUpPPRS1AaFp4R5nxIjgFq8ibbvlfXQpz7+ZxAp/jedjXSiXwXc0wCwb0F
	df54kcJLqoKpeiSqhRJH3RZY88m4Sc/N+i9s3cLwHH16Vs+mzhF0+e3Dql6ydQ75/Q==
X-Google-Smtp-Source: AGHT+IGuAcG+GXrfdigNkDxStpd+S8OA8ZKWEze3cbtEMBDblwvHmNJAD3Ekbk37wTL6q0w5F0fZFg==
X-Received: by 2002:a17:907:9558:b0:ad5:9ff3:c6ce with SMTP id a640c23a62f3a-ae0a715dcd7mr43147766b.4.1750701422257;
        Mon, 23 Jun 2025 10:57:02 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:57:01 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
Date: Mon, 23 Jun 2025 19:56:51 +0200
Message-ID: <20250623175654.844281-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623175654.844281-1-goran.radni@gmail.com>
References: <20250623175654.844281-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.

This board is manufactured by Ultratronik GmbH and uses the compatible
string "ux,imx8mp-ultra-mach-sbc".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..9cf2ab3b12db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
 
-- 
2.43.0

