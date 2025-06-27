Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BEA2E336F;
	Fri, 27 Jun 2025 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034439; cv=none; b=AjGcL2KtEe5TZCPCyPs6HoMdJhU4gOCQ4zRP8e3qFyDX9leJbhyiudWqHTwJhV1Fi7KAV4saY0JOceLLEg8kZIDsi00jAU6t09kQoGp5ZInc0+Zc0H8qHm7o+0eJn2FT20GWP9el/4z7tr89WPiPOr6B2OhR0aQS3SVPQMntxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034439; c=relaxed/simple;
	bh=UUD2v7sWedyU2gnLxtaB2m34SShvvw+yP0HmJhuO/WE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZnYm9d03S7vhqgiduQEefZauMtpvy+YnRfCdm2zrzlvYqFk2cu7eypuYrJM8wXyo4k87ih1Ht81i4PuZIbeKlU4hDqqfH7dR1QM6NSQ4kdK1uNft0C8Wk3EHPQ9Re5PPy2H1CzDMRT8w+LN3aRUBGVLGF7iCKLbY8NwzSDLds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaMfeAvs; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaMfeAvs"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade5a0442dfso413287766b.1;
        Fri, 27 Jun 2025 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034436; x=1751639236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcSBhyw9Yhzx7r6sZ8IGYEHAbj7bfuO5frJAgYAC6fc=;
        b=TaMfeAvsz2sekmBJNixBiaOox9AGYUvlkLfmZLx4ZwdehF/NjnEZulJS3Tlwkay5Nv
         4Q6gvJMKbSVVOxuuJ81zJEq+i75/cq2SOeTaKjuiqItWGDe3UreHZLDwNRNC9IbIZsW2
         DKRAxhm/3MpgKkCnigdMPc7yi16emN5ArxlsfT3feMaG5L9ScbLBmMDAgx1aJFgQ8+0+
         hLlrnHr6l+AP8y72KYSxPeUxlGgGnSK10zBju77akGmB9+s/ZKN3tzbR6DiXKUOpXElZ
         Qa0rn7QZHvUNFydlSGp13VIdF75AuxsZ9bQpOvDQDuL/JRuU2impZyUsc+7IzhkNMFh/
         d8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034436; x=1751639236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcSBhyw9Yhzx7r6sZ8IGYEHAbj7bfuO5frJAgYAC6fc=;
        b=wz3e9f1y9Y8nnLRUz84qRiRpLK5MLqBzAQkKETbuWNeA610QobipbudcSZJZLUUw0I
         CQDXUeZiV7Vje9aGhVfG4g4EpLRNseWyFXAoqJ/P9QlkMquF8h1fCJnQFTxrguXg30np
         Kj98LJ8ZAFBXHBvZ5iMHfImVSLhRA0zztDI7QHGG0Pn3TpkVGDZ6HALiPs+yhZAXhCah
         Zo6ukvwqNpnC5ScNOzsE4gGpw3JILHQkOwSPdPHVLzuUkDLwPDhf8DSWq3ap2B3GkOLy
         cs2YXYZbdFsjQJ/ARUJGwYUpne2cIDBlcy96qQcVpJYuAs4IaooveZ3wncSXKkVW861s
         Q3TA==
X-Forwarded-Encrypted: i=1; AJvYcCXZOQ0vNGR+imWekGb0ub9sI0J7EMS0cystwAGsZNvRU1gNgbs6LOL5q/m++DG5ILJZZ/giOMPlP7ixbUZL@vger.kernel.org, AJvYcCXszHvcGJwJQ737KpBT79I45T3zPHATyOTR1BlsmB8bQaTtGBeC2h0Ni9RdAMUNjcNaSadfyaFRlbiP@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYQKHCtSgDy26QijbGdtYOpeN7w67YUVhSVSMIOJzfYU+4ryE
	r7OrXmnslHSIxwEe1nGAgqVJzKEkmL6QjRFByUvNV6blrFFsV+agXVd0
X-Gm-Gg: ASbGncuEFm/ZXdD8226g2eLtZ1nZrN0Je3oWpC8qUhI7cakX1i5mOEgLjusqQKDilgn
	nSeSW30TPOp28PaySIbqUxnPsNpZs+SsiNP1qsipRnJP511i2dA/5CC17hwuLXH5iSu0a6Ete1w
	W7t1JH1ol/kjH14Cfm47PwA02IleKSMAD3tGiHQ5otyvXSIbs6fz783l9nwaiu+i08Qwz2bFGG+
	/RtAI0lEBi0K9D1vhRm8gjbooXvqY1N4nt1NZSkeIybmRMcYb5SFA/j7SFE6OIXmepNAv9VrbDv
	vOuAhLiIbG48YTR6dScKUOopYbEBgdc5K3Zy9zmwPmYymxmubqfq9ArpQ4H5AhGRdhC2XIdNT8c
	UNMPYQ3WG7f6YjZ+deZtMswE=
X-Google-Smtp-Source: AGHT+IG0h3kcfUrRnkezRjAYnSPlB8QkmdyUPOhCB89bzaJlmd0l883sazC5bhUvRYXEgDVePtMgsA==
X-Received: by 2002:a17:907:7e95:b0:adb:469d:2246 with SMTP id a640c23a62f3a-ae34fd89929mr296454566b.17.1751034435962;
        Fri, 27 Jun 2025 07:27:15 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:15 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Date: Fri, 27 Jun 2025 10:26:43 -0400
Message-Id: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for the i.MX8ULP EVK9 board by introducing a new DTS and
a new compatible string.

---
Changes in v2:
* introduced a new compatible string for the board.
* aligned the pin configurations to the same column.
* link to v1: https://lore.kernel.org/lkml/20250623150146.1398044-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
  arm64: dts: imx: add dts for the imx8ulp evk9 board

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

-- 
2.34.1

