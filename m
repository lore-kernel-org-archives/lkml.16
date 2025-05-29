Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F521F7075;
	Thu, 29 May 2025 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518803; cv=none; b=LXdlzNSKY/DJ0Wh1rzcbpXIBbsB0iYIdynAftTPVHr06vvOQ1kmnQZJNAUm/GI7GHXGmsnPKuliQfpg+1nKpsA35op3RKg8NOaLbMAqih3j7666woGRgjFG84/RDC7Fwhd87TkVOIeucwauhzMuhtWfHq6Os3vY7LJh4L4t91CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518803; c=relaxed/simple;
	bh=Pwx2fvfVuST5jQFNBNpRxios2r+c4w/jFunmwqAE8/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oTj0NgVeIJE7l3ZXrEnWps2hAMUrjcrH2AV9VF9NsZIB8/gWD4Y4GzT3U+A3JdjxeaiNfQuoBR5RrwhxlC1PTpwLHsijWvNmA+RQ7lim7Bs4z7oVigtyzZq+VFVU8L9SMbuW1980R1NlQ/FHHFjA2BJ0aEqPewlQahQrdp9uGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mon1oWsQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mon1oWsQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c46611b6so899767b3a.1;
        Thu, 29 May 2025 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748518801; x=1749123601; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oPJPluA2yPOrdl3Xx9YilnLVqcTIWj8u7ZCyZ4fkpT8=;
        b=Mon1oWsQ11o8NWVxbU5LL1w71dT6FNSzxzkv35FZQvV9zyqSdPK4DiDtVCkYq6qXhf
         4w+y/07Hgta/liAAUXRzrq/79g2CFNuTJYc2AjbZlDAaSyOuMUNLbR5eHBDsy8GHI75a
         Kz+LyK1vcd1e667ex9/svB55b+DG5lUSs9hBfPrnPT+piwcudR0iXP6kEP/eC3/8Grmt
         U4/1AvIMcIY+JFZrhVe0xX+GS8fRTuIe7WNeP5Syp9OQRBlh6Rn9drlnZ8GVdZTJGjDC
         SkBCAsyUqtUjcQoPT/Bx1KIW5LxIJGvfpF+gvxc7143b1vGwHnuQeth/NFEOs0FWD9qT
         +zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518801; x=1749123601;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPJPluA2yPOrdl3Xx9YilnLVqcTIWj8u7ZCyZ4fkpT8=;
        b=vyU8WJJJeXxn6ATuLcjz8qK7gjjZcQwReaktRFtHG+gy6Or0kxt8I1wgI7F1Agdf2K
         hSrd9yAcQt5793NcMaJDnFi/zEx8szXtfggI+MhuS9OmEaoFvPqWDz55I1YviWS7o1T9
         FUIEweSmp2MEXGJ/rAePIp5uzc2vVuaEKrNGNYOOs3j05cMOBkqLBe/aTdrGqrXMbvp0
         /JIcTRxYt29HSZQhH8ETXrs5mZp4MSzEwe5xZIsy3Hc6IdgrTtxhnvxoBuy8UyM2b47t
         Rb+zPsy8KLrMB72M88Tx/6emVkYCjww1pI8dcx22syWC6uFWHNwTI0Idy/zw1tbwdgXW
         KJKw==
X-Forwarded-Encrypted: i=1; AJvYcCVdl70nXxHSgCBy8Qc1HL5+cfS/u3kjxNn09WhEPizqDW+CBCGtl4cAFTQxQjHr/LlftUGnoEViyzaFPa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznt+9XxJefo19N/f73cTkyJtOnUgJr858Q4C52CXmlAXn3I9Fn
	Jlrp7n+RsAJr3ESUssE4Vn05DZA9ZxF6zyuj7mMbJfN5vm8L8C3GxOMX6B2v2GUS
X-Gm-Gg: ASbGnctPA+jKDRKmQtaKp8Lsf0loR5xbK+i8gOwoR2O4/WKl1FpjW0+7XYbg5S7Ws7R
	gJWfcf8VpVu53LCL2QJZXu6lQRwSFcmg//8MZ35tMupKczLsy4ZM/DKr7AtAwESzgo7Ii44X0WM
	B6BOK0/zAnQK/1iUXkZXlOCZEJPd4/N5z91vc1QVfLTrT6Hw3D2rU2r2Mu1wyosJeUeyzEONURc
	Rdc7QvV4IDCFDdYVHl1JPOoaoXlFKhYQfbvG+V6Wp1P7zAFX7GFg0WVLy09G1TYuoluflnqZHJs
	Ev1eTv5nwdeSoDu+1gbLEtQhrbZ2q1bl+zRPql7FjZqaaO+o9HbXS2yy4wh1oA==
X-Google-Smtp-Source: AGHT+IHsY236gxnL8+RzCtR1lcYX0dN2OvDWa0uStfgSddoIhXY7ZKQytFP78FPhrjNUwn+k17a6Hg==
X-Received: by 2002:a05:6a00:3cc1:b0:73e:235a:1fca with SMTP id d2e1a72fcca58-745fe06fccdmr31439493b3a.20.1748518800934;
        Thu, 29 May 2025 04:40:00 -0700 (PDT)
Received: from [127.0.1.1] ([2405:201:4042:d128:985:242f:9e00:e9db])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-747affafad4sm1137055b3a.116.2025.05.29.04.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:40:00 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
Date: Thu, 29 May 2025 17:09:38 +0530
Subject: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHlHOGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNL3ZzEvEqgOJBOyknVTcus0DVINTZLSjNJNklLsVQC6isoSgUKg82
 Mjq2tBQCSvO3XYwAAAA==
X-Change-ID: 20250529-lanyang-lable-fix-0e36bf4c4fd9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ankit Chauhan <ankitchauhan2065@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748518785; l=1318;
 i=ankitchauhan2065@gmail.com; s=20250528; h=from:subject:message-id;
 bh=Pwx2fvfVuST5jQFNBNpRxios2r+c4w/jFunmwqAE8/8=;
 b=d2y3CSmsLFYARBUorhoa9UHNPHRgs1SOt+vaL0kiIzgUeRyL7d4SFTeJhA36lr0Dj7eCeapP7
 DhfUivnA5bwDarDO1DXOIoyLCyQs2t1CB4NaFSBRPc1KtiwWpufV1Od
X-Developer-Key: i=ankitchauhan2065@gmail.com; a=ed25519;
 pk=6qbMcLtF/2YGH1xAgdxEABYLcPtWnesHOBiHaoZEZrA=

Fix an obvious spelling error in the dts file for Lanyang BMC.
This was reported by bugzilla a few years ago but never got fixed.

Reported by: Jens Schleusener <Jens.Schleusener@fossies.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=205891

Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
index 370738572a55b2498fff31a4aabf336cc41e1eac..8b9d382241ff11329fcbaca5a469aebb11fd3460 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,12 @@ hdd_fault {
 			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
 		};
 		bmc_err {
-			lable = "BMC_fault";
+			label = "BMC_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
 		};
 
 		sys_err {
-			lable = "Sys_fault";
+			label = "Sys_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250529-lanyang-lable-fix-0e36bf4c4fd9

Best regards,
-- 
Ankit Chauhan <ankitchauhan2065@gmail.com>

