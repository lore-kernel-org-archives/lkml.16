Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B827429C339;
	Thu, 12 Jun 2025 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749315; cv=none; b=NWj6aB3WUQS4pHQhuada4ZgqhFrwmchtl9wddKE5fdtIAUWySJw/kRu4E54LfkpmXJiBUsndfp7sQruTnz+rblpmc9irb2+knVQkDsO6vEWPg/k4teyLMo9medzxq+8sarHMxXCQz/3qfr8S3pdvXrTY2kFVdXE/8RQ5NNn1Kg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749315; c=relaxed/simple;
	bh=PH8QKM2zIfjbs2XiWW6oY3idX+GiqDPjFhwl34h04vU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=juyhDxrr9qs3DYlwp5YXl4r0QYDF5ESbSgnnMyXWS429bqgSChrkAxDRaljQflNjtH0Qs6UgOnGv1Jr51KoJjPPLJdmdS6ZpGF2nc/8sYip9MPLOU+M/qBPP6j7nkFeAv5Zuo5O0+r/bNi/zjOhaILDpySCtV4rd0veoAPHFaEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGhmqAoz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGhmqAoz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2349f096605so16311285ad.3;
        Thu, 12 Jun 2025 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749749313; x=1750354113; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Z1CAnDtsn56h094ipnFC5TjpsgKkprOu65PkgheDX4=;
        b=RGhmqAozMiW1opD0dGXVtV4JWy6r0KxsewBFkiiWNWeNTUOgqgYazOoOCGi7JtFEgK
         uULTg3NnfDBLn2+x1lPTpbjgiLFybH/gZL4pgd6BMim56FDn5kCHpbZslXaOgclSbRRR
         +czxw0Cwun+K7UZygmydUqQ9PbGnN2qHjjmpQxStkRLt4+OA9SBYJ1BP4L/w3e9oJupG
         PZvnA8PI/yJGfjy/ai0vyiz9nKwRqaNXUDIe37LPDJDYVAm0lMnXQa4FeXJt1GxVMYjY
         82hDTRZkB3kwE6TXn9rTakZEnJUrUIFMfcWvtB6ReFnTOiSwAHfY2V/W2k+KZGiRVUtc
         owAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749313; x=1750354113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z1CAnDtsn56h094ipnFC5TjpsgKkprOu65PkgheDX4=;
        b=JD11mBrQwpc4GKSQf0od/qdUFDxHCyFZr/MiTF2rQZFLcOaV5PFZ+Rht+h4TEDfxNL
         jq3ftcAN+rzUhosuvL9a/Ym54uBD7bAHjQQpDcNhFCj1DevVe6FGO6S7kkYs68F9kUEK
         2mr9GuGRq/xeZhmynqSOHJLqDPHDvq6Kz7zkuJS0qQtyZCO97KAujWMV3LYbhHWOMS+g
         K/ybh6ocaj3WXS/BtbOkQQIaFvVXnKsMpRWCf0kL3RyX+mtHqDRK76WEQ4rbIba7zDAu
         TEvskNEtFfR9tDWnxJH2vgDqfVGEleHWKH/FjuJ1y1taOt1ZpP2u8X+OxfRAHRQtktZV
         gWGA==
X-Forwarded-Encrypted: i=1; AJvYcCVQZFbpIumPAk+QqGjdBuJ4OupQGmHVFq6e5cRw4nO05tRytzmWq8cq3jdTcdQRBt5F3Rgs+hKn37K5Rkad@vger.kernel.org, AJvYcCXye6UtevbqAnRAi3TK7CDoeWh2kHDO+BpW21YB7NIuv+YO5Tti+VONaZwkfv5BAG/aX6BtOhIdb8yJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyujPraqScwX5v4bFH3nj8CE6hJ7hbY0pGk950gJwdBHSAPAMiy
	MVNhRX6LLRbf0olLSOF7ngzf4me2AQ6zqKSVB9dMXnm1k72600VG/Hdv
X-Gm-Gg: ASbGncvDclw0k3KxpDpeIfhcmnd13vQ11wc6Evq8BScPXJi9NCMwE2V5+V1fb2hd1ik
	8r5h+PR0ghsUL54yZvQDyDyMWi4nOlR2SSZGrAiVmuTL9BFmh0m3YS/UbnXBlgjUFcrrnO2HS2j
	sU0Nl90ReHyMvYJv/5eQNfjOT8p+yYchCbFV7QidJjrdxdnRln1gw/chIbWXaJE+efRvDhDWLST
	bMt5FljBQoXSPKVvEDsgWGm1jQfrdlO/VezGj8Ac6ugGp6MhlLKjtcBZfWtIYAF43m4FoZglNmf
	7ZFgKKe2iiryWyKI46pAxsN2gv+y9bln+lYbjMBhrxLtKVM+Hcf7M6fJL/zUqZwRZc3ciQb1uFg
	LZQ+SU6lQ13EpNJKpGJQO
X-Google-Smtp-Source: AGHT+IFIVXOyOM5DFIT9gmbEUNOHuQMUX2pMymqDTVsNqy3aJEAFqXUop0eA4qDVx2/oR9mypI1WqA==
X-Received: by 2002:a17:902:d485:b0:234:e655:a632 with SMTP id d9443c01a7336-2365c576d27mr4057365ad.51.1749749313056;
        Thu, 12 Jun 2025 10:28:33 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd6362e28sm1665891a12.66.2025.06.12.10.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:28:32 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject: [PATCH v3 0/3] hwmon: (amc6821) Add cooling device support
Date: Thu, 12 Jun 2025 14:28:07 -0300
Message-Id: <20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACgOS2gC/42Nyw6CMBBFf4V07Zja8mhd+R+GRZlWmERo0yLBE
 P7dSuLe5bnJPWdjyUVyiV2LjUW3UCI/ZZCnguFgpt4B2cxMcFHxmgvoSjAj1kpcAL1/0tSDzT9
 0kF4h+DgDctlxo7SWVcOyJ0T3oPVo3NvMA6XZx/eRXMR3/dnlH/ZFAIem1KVEpbQR9pZlxrr1j
 H5k7b7vH2wpd3nUAAAA
X-Change-ID: 20250602-b4-amc6821-cooling-device-support-c03b0a899357
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

Add support for using the AMC6821 as a cooling device. The AMC6821
registers with the thermal framework only if the `cooling-levels`
property is present in the fan device tree child node. If this property
is present, the driver assumes the fan will operate in open-loop, and
the kernel will control it directly. In this case, the driver will
change the AMC6821 mode to manual (software DCY) and set the initial PWM
duty cycle to the maximum fan cooling state level as defined in the DT.
It is worth mentioning that the cooling device is registered on the
child fan node, not on the fan controller node. Existing behavior is
unchanged, so the AMC6821 can still be used without the thermal
framework (hwmon only).

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v3:
- Fix using fan node after of_node_put() with scope based free
- Add setting the pwm duty cycle to max fan cooling state level on
  initialization
v2: https://lore.kernel.org/lkml/20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com/
- Remove devm_action on release and call of_node_put() manually
- Change of_pwm_polarity to store resulting pwm polarity on driver
  private data
v1: https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/

---
João Paulo Gonçalves (3):
      dt-bindings: hwmon: amc6821: Add cooling levels
      hwmon: (amc6821) Move reading fan data from OF to a function
      hwmon: (amc6821) Add cooling device support

 .../devicetree/bindings/hwmon/ti,amc6821.yaml      |   6 +
 drivers/hwmon/amc6821.c                            | 130 +++++++++++++++++++--
 2 files changed, 127 insertions(+), 9 deletions(-)
---
base-commit: b43674a549ed17319cb08ede9e0909ff6198ea70
change-id: 20250602-b4-amc6821-cooling-device-support-c03b0a899357

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

