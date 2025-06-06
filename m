Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FC62BD1B;
	Fri,  6 Jun 2025 02:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749178502; cv=none; b=RxYO92xx2lx+DTMReDDEONLs0O3Ws/8XvRGSkWVRXUzlnJXvHWu52QLaW/2ahOwjSQmrT4PN5PuGCOogtRB1l0EfdkVg9Sn6qN0QmC7nECPXMP2qMxMPsdV7HVy24YoejJ0UB4e1iCjGS371Wd56y145//kZGq8XRSf0YGV0dc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749178502; c=relaxed/simple;
	bh=u4nMLpzLMWMlFcA4Pz38X62iia64+9KSBzpJlnBSGKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ukhMGuPIWpJDzuVsuTAXcpPlN1o70oO+CwB/+52EOm10+bsHDaT/1mzp2Y274Vyd26UEIMVrHbz3xoYEaRVoPf4kGtjmPSMgiI+rTDSBb4UbbFXNSxoGMBb5x9BKg2DReIfJVUfWd78jto8wnUBW7RneU9pPE8c9zTSNiPZ2VX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwRHr5Bj; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwRHr5Bj"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso1315195a12.3;
        Thu, 05 Jun 2025 19:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749178499; x=1749783299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqrGZxZfe4s9xgG/EFT6KkjJVPgG2O2ieIG0K5ZMp14=;
        b=VwRHr5BjRPFl5ONlySOUXRoRkDSAfT/AzVCdeNhLjk8FtyopY5HgFnGesjqFEfPgKk
         3eBhyxA8CtBiny1pn5bLpSBgJu1425DyPtb9LYOAps+PhcWuEuglr71EvToWyuP1aF4G
         uDXM1yFEtA3lro33+2xV851drBBWMzbNV/v1AYGKCjFo5Y9ezofDIwyRhV4eHMx5Okbs
         IKOn6B95iaswZecLpEc1cl8dvP/E08FuTDTUmpKktNTA4M17ysO1IfXHMVZIr94HEhJa
         BdwxYyejNfauVEMTrboQtThJ7JLIReYY/X/YWfh01kz7EV4iFU/yByUow4sSS85fg6yh
         kXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749178499; x=1749783299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqrGZxZfe4s9xgG/EFT6KkjJVPgG2O2ieIG0K5ZMp14=;
        b=tggYAEIjYja6Tb/oMlJfUzx9dbVnMPhx6X1y1NgTil9m8YfIL7sNpHcI6S0BebUACV
         FllQK2Uab5deQQvwyVZrrOKtc4UhhTIKZnUZKW7K2PhTFkeJ+dcjYIvz43hSXhKga8sM
         RrKtQoG9O/rQUVkMAinDxAFoVMfmIzyAcNYxKZRH8h2Cnd4WKppzXbXt8dnEz6xQdIJf
         KeXYX+G/HS5Oj5vCgFQ3jDpya1/32mn21MMQDCSdAh79T1n075lbzknC5Ae4UO2msueV
         pMIpHxctL3fof31TplD+vBD63uDZROSG4m40hqYkLce5ElvwBxLnQQtznGtQdj9q/DZP
         G1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWuWLOMZlgPh8oriwECH9a8SjWHttf8sBPUpSNh/5foKGGfce+CLW9Xk8Cw0hWVbvlKbhIPkJtoWmBq@vger.kernel.org, AJvYcCXVlOsVAOB43Hjw4OualtkCyH28UqsXroOO0UBNqo+j2DkKhNgd8OLZoDSZqjmFBYG3Ml85DVAVXXABsEuR@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2FEUuzEPlV3nvh61Sq6Vl2wW3M+Uceeoa9rn4N8k9BHEZ4Km
	fbYcHJupivU1akZe1HI729LX3lwvhRPrvsRlANxAsbqI7GyeNNgvNKP0
X-Gm-Gg: ASbGncvJ2/D0elz/IelwIcRTP2mA6ZDWqpF1J43npd8FhD+5KidtFd3sYyjNskQg+9U
	Wvp4T3E42P073zYPLI5lRJw0LHH3LM6oule6WHRMCpF8qVWzSU/s64Y6tIHQVTJPQJ95gSOPqWH
	djSbdCOGOHouh3Jm/K4q8OlMXzxeRFTVrvYBkXN0D+dzrD3PI0Yt2GdLhhmbQQIONtNAPCrTCVY
	X6tWw5XZ9v0zAV7MOEIOQTDvRrUxS47q/V6jY9Nugxvbsjyf2dHKPGStx3k3k1NbvoxYEeWsBk4
	7JanMDMx9CBFztbpU5jwxYVH1QERN9lR36D+gEIuOU08kDhEnQN8WUveY5+zwwbD4aLaSRL2dbd
	vD2P+Qmb0VWDEI6Rj5+5d9wUgE8bc7i0ljLyzf3GhikxpFRqFg+1+Wov25y5oMBUiMTVhivOJsT
	hhCy8fCJvbUA==
X-Google-Smtp-Source: AGHT+IHB3aHU7n0uaEQbmWTSYTIEsb/YABqewfurUM9yqVpjSkQhfmqbYeHsudldolnne0QyhmNdrw==
X-Received: by 2002:a17:903:22c6:b0:234:986c:66bf with SMTP id d9443c01a7336-23601e21e73mr25301895ad.11.1749178499573;
        Thu, 05 Jun 2025 19:54:59 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077eb7sm2942185ad.39.2025.06.05.19.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 19:54:59 -0700 (PDT)
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
Subject: [PATCH v7 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
Date: Fri,  6 Jun 2025 10:52:49 +0800
Message-Id: <20250606025251.887953-1-jasonhell19@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Linux device tree entry related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
v7:
    1. Fix broken indentation in the device tree file.
    2. Sort nodes alphabetically, then by address if equal.
    3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
---
Jason Hsu (2):
  ARM: dts: aspeed: ventura: add Meta Ventura BMC
  dt-bindings: arm: aspeed: add Meta Ventura board

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1481 +++++++++++++++++
 3 files changed, 1483 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

--
2.34.1

