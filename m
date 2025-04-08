Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082F204F9B;
	Tue,  8 Apr 2025 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154310; cv=none; b=bWP26t6jF8iX/pnYbmxFTXj7ZOf+0bNXFG1OdqQYy/Xm4aswvHrdERLfGcGzXKOHjM+wHE4MDYYytCb4KSGKL2SszlkfKsG/ojpGGgcPNNhxFX5JUfhH5c+JlcNLPgNn6YnMAOD9izTl/Ay+uH/mRsWp5XwgEduTtWW9QAFKyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154310; c=relaxed/simple;
	bh=TG4EQWqRrbUu9xl4AKd5LNrgTm0mSdNLmmatHbdF0n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBD3kcAL0nYpZwxP9Rih1RGtUNGkOB0Bdzw8bVvd3dJXMVkCuka3qMIFIrwz+1RCccRyZI6EdnXjGm2k95YrcJdv1K1Pg4nz8VOEcAA6wOAzdvvNea5uBjtXA7+UdsD1LwSbH8vTlN3AhGgiKPmlXAodvWisGwyJVkT1d8HU3JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afC2FybB; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afC2FybB"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85b5e49615aso558030139f.1;
        Tue, 08 Apr 2025 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744154307; x=1744759107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSfFK6BUAK+Qxfp2fpBiU7pkFHlfyZI9MOMS3C7WUDQ=;
        b=afC2FybBFRzpPOgasKUTcunWN85N3n0/OaeYDHGklLbu/Fr1iDOuzPrPnfzyeiX7mp
         EHISjNfvo9tEz3WsG5Umj+sHUqliVcHPVsWKgQ24AOf6Q4bN+Y248bQE4WugIfRUkUYi
         vAzOqvXr8OZIT4nOKwSEsgZiSoCzfRHRecNYVPDrdWoAWvZt65soMN1hbNJexUC17DJI
         FcTw7P/5iRrJlrVeHa+VP54i5z1jFX9OsU2/uC6FmtQCgUNvlsBC/33yLgq/aXR03Xe/
         P4Qrh6mCwxTEWjcs8DzgwWE35z6ySGHX9GlTk+araURL/fAmhIUYFeg8uqBCkzZV0/4n
         Ka8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154307; x=1744759107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSfFK6BUAK+Qxfp2fpBiU7pkFHlfyZI9MOMS3C7WUDQ=;
        b=UPkqhyaaaAerFZ+GZAsxBHtpbDcUxN5vODKE9s/KNEB3s+8v9PA1lUqcHlwRrsQCn4
         iYkgp1WdebBaM3fpshHcTPanlM/GdAOTexJSTknBKZkgtdqXR6xwnEbMPxpReejBQWpV
         rclMvK8eMZ5kLj7siRhB23BO3UJdE0lsl0v83NP58Q/xTdUZLGUtIes49zlXENLayh45
         Z+CaWfL5kUpnS2gfYr/fJlMJw+LE6gJ99A7CLLK/JPt2f8xw0aolrttLKwO5is1VyWgB
         Qx8cFF4Cx1Dr5R/3yM/V2RhVsl7hte36Wk00flyymEd2/y0wTAd4GCFy673/E1c2/oe9
         8COw==
X-Forwarded-Encrypted: i=1; AJvYcCXd+eIYdriaBlInSUqJ9HNzRMrcF81aKw5beYceZeyBgEC0cvckmiP/zdo7E+zMFBYp6p7z/XqeTOSOPS0B@vger.kernel.org, AJvYcCXkrTATx6sCW0uZblzPhl/s+1qqMHfydpahUJ4f0Aop/OgdoU27Ovn5jbOb/I8R6GUth4oWyU1fddzR@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqC17vwgHr234sYymrjfe0RjxcVCy85F/yBYt9Uip8zKndSCC
	6t+0f+8ElqPTxlsYuGtOGdj8y/6FKei1dwTMAdTviXQKsEgHdzHFg+aTGA==
X-Gm-Gg: ASbGncvfD5L5lcr0lrMpZpdLX53Flujatnm6w54JepgUJsD2uelXzPgMyfUEUaotPPX
	lUSqweW07IU1mIBJvUVcp4UfsrK1TNWIIjzueXgL2JalRuuryzU72d9kyCyhdTyRTW9w3wLvHOs
	eiAV9cq6Xg6lZKIKpdYxpd6pgNbLsdMSBMTdPRCSseAWHxHLSeaIlOSHM66RB8PG9p1tog62REm
	B+89ILG2fA+vDEqeGPmxCpoIUhHCfDbCELMsXYBVFjQ0v+s79tm8CIsCiZHLL4sxf2j/ATLPk0z
	P7jY+Xdrn0kWXAVfz7+NvJGMm5u22LdtPTuJhj0q3rQLOtloPAFHaJppiyq+QJmnLDF2XlxpHb7
	EzcNP
X-Google-Smtp-Source: AGHT+IHYg4dISZi5MgFUiEYdRjYsvIUqdiL+bhUuYp/Fy7sbHYzH9I/h1mFQvjX09fR0NQhMOw2CjA==
X-Received: by 2002:a05:6602:408d:b0:85b:5564:2d51 with SMTP id ca18e2360f4ac-86161265dfamr143772739f.11.1744154307543;
        Tue, 08 Apr 2025 16:18:27 -0700 (PDT)
Received: from hestia.. (24-220-158-153-dynamic.midco.net. [24.220.158.153])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e2759sm724244173.128.2025.04.08.16.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:18:26 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Dhruva Gole <d-gole@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: ti: Add PocketBeagle2
Date: Tue,  8 Apr 2025 18:18:22 -0500
Message-ID: <20250408231823.826163-1-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This board is based on ti,am625 family using the am6232 and am6254 variations.

https://www.beagleboard.org/boards/pocketbeagle-2
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
CC: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Andrew Davis <afd@ti.com>
CC: Andrei Aldea <a-aldea@ti.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Deepak Khatri <lorforlinux@beagleboard.org>
CC: Ayush Singh <ayush@beagleboard.org>
---
Changes since v1:
 - Apply acked-by from Conor Dooley
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..b7f6cd8d4b9e 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -46,6 +46,7 @@ properties:
       - description: K3 AM625 SoC
         items:
           - enum:
+              - beagle,am62-pocketbeagle2
               - beagle,am625-beagleplay
               - ti,am625-sk
               - ti,am62-lp-sk
-- 
2.47.2

