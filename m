Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4035D2BD1B;
	Fri,  6 Jun 2025 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749178507; cv=none; b=G2U96EfwgRSAhfPZlzY1z0A2Mds1FwTQUDRurlOzY82vpSLBWPYd7KH2qoHO4x5J3jy4raWgKTjE//Xo8ZhJLeCydDkcerjV2IsjPGg/Yao8IBgJXx46DwFigbaSxueeN42FuD3YtgqH3euJQcIVKytjjzZpUlCsPTXDaMb48yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749178507; c=relaxed/simple;
	bh=Kg2Dqv8Gp9rbmDyGUgj7Cn9GftU4OphnkDWvbzje/ec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LbVxRSHTpPHriJpj0qD9sYnkqecYS85f7PFwQqcn4Blmo5G27BgkflA4rWUgt1AsJYDeL13VkP5vnNjy2tRh2N3CANBIKqAU37bBJ+OyVav+nRDy0O0pMqL/Xur+2pEem3dxT8vWsO1QzyCQzI13JvIei+A4NvQaIzLr05sbMRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBxvH5FI; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBxvH5FI"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso1476590a12.1;
        Thu, 05 Jun 2025 19:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749178505; x=1749783305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcPYXlqUwGtYWC7gObxdrCELcx0WWyaHPv/mohqNC1Y=;
        b=XBxvH5FIDsr48jlj75sqkRg6pDnHeTlWoQt9ZfWLezEHRcCuJHAN5AOxoyjhPGc27n
         7PR9HPRfa3Kfk9THzB0f+79Bqe0vqao0mqeBBN3uUVkIF9LGdDqAfarDUrnIllFxuLML
         b5RwmNcq1hSs/yY+N1GY80OQbfhIij8ofm6A5Xe0TrgPxfnb/IsQXsh0bgx5LJj5TWdA
         Phd/5FVXEPchKcgODFa+jaE9/fY4+gKNvb6L5xVvamMKDt9Gz2ehq+ZGXFOJIf2s6x8b
         zNDPyG6UFbpku1rc0QIr72fk1NHaJAbAv2mDtmA11K7DQEtSjEkbfr5BQxhw8ljJ7vpb
         cy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749178505; x=1749783305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcPYXlqUwGtYWC7gObxdrCELcx0WWyaHPv/mohqNC1Y=;
        b=n0xnaX2/do+Kqq+O1e9ySs2fBKgopvPw31SPgt9N/R9hspJ5IWNzpHVGEkVyPytAJ1
         EHhVyjCTuAtO/XD9aEPtreNxTDRaP6rRuxA/oJVu4bRrCIDuqtCwOl40gxRJdyTVSDgr
         ABqvO1LavPATtMyQzKJ4p0bisYV+NhYK/OOfHoZcY4wOIA/Pvnaa363bYPmTfJpPfFLD
         7tnDsh/QRDzOGSDYy7s6T966iLZGmVM5rouOwDUhHB5JZcdO4qdNp7PGIEa4MVELQpzY
         KqRI4Rw/ejcZSPkh6PSnd991xW2z6Sd0B+vXsgQK7H8Z94kpPffHEE9FhSb8wZ7ZJ1XD
         5miQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkLSuZhGfXcbiyERg4w1HzXDDFdjTCzlqNRGJhZErloFRJEGNUYo+XC3a/3uXxyxGcm4A5fsPEFSWM@vger.kernel.org, AJvYcCWw6xUaXA0+/QXq2CZn6P9GZZL2YcEAzGbszzSiuxBzlIFjFbSdrKkOn7GEp0HOlWcnh2MZOSEJHnLy2QIr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7lkE86axMXt8VQXkw+pDkX5xIotmsLw6pz2PP6P6frkMN64sW
	3TQEIIjypUPeBZ6RfnE+HRt5Z8q0aewSJpPM0h2xcQVlRxrFGh7aTNQp
X-Gm-Gg: ASbGncvpJTBUkkrQ+dmLsUOr7mbFfbLKQ0xMaA4V+e0lhGOqLaSuxb3f7wCcNqwD+KS
	+p9Nz74b4LvHpH9o2hEGmXt221SmmtK5DlzsC5w+vJfNcM+6U6d9dPrBTRQr/BCXINuiwxKEnDJ
	L9KU5oQFcxGhZA/nb3ZrpMgWzJ5cJAU7kNOGDEcC5tlKIrrHjG3O5hN4VfvTwJDmaf9E4jUMo/a
	6A6D/RvOiHEm+vd03Vwbg9is8fe5SKXwURpISzI0PGVRM1jlDcvO2XlaFzkSKr51X9AekJT6DwT
	zNxYb20pBWF4zhqIxMv9CsggIAAbrBd12jXJFVfiea7VjqxrtkF2OAKbZtLCUQEvRinwSG576Vi
	jC6BP2GkEWm+uwPoL2b9h/3SRfWX7iNWNIm1hDoZPX/3/5r/THVRAv4GOAv1Rp/UU/qUCYTDpvg
	A=
X-Google-Smtp-Source: AGHT+IE6tkKM5tzQQa92Y/8CBU+6+g1CrxllNqlHv1TLlVy7w57uqLtmBftjT1nfnG3gOSb2IzldOw==
X-Received: by 2002:a17:902:fc86:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-23601d18723mr24725515ad.27.1749178505588;
        Thu, 05 Jun 2025 19:55:05 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077eb7sm2942185ad.39.2025.06.05.19.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 19:55:05 -0700 (PDT)
From: Jason Hsu <jasonhell19@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason Hsu <jasonhell19@gmail.com>
Subject: [PATCH v7 1/2] ARM: dts: aspeed: ventura: add Meta Ventura BMC
Date: Fri,  6 Jun 2025 10:52:50 +0800
Message-Id: <20250606025251.887953-2-jasonhell19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606025251.887953-1-jasonhell19@gmail.com>
References: <20250606025251.887953-1-jasonhell19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Linux device tree related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.Add subject prefix for the patch.

Signed-off-by: Jason Hsu <jasonhell19@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a86b411df9a5 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -87,6 +87,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
--
2.34.1

