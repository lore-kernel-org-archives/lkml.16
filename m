Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E11D95B4;
	Fri,  4 Apr 2025 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764140; cv=none; b=YXdBiXBybvrEzvHRsdwtuxvRPLhRO0qLcfMKEHVb5o/Sj4y0QU0XBzn+kdaZm2jWW+iD4vyDmoOgcmifpEpm2Z9Mh/Th5nBd0gIxArwJq+vwtXyCTDqxRe+ZPzAI4Oz+XSB9ct9FIdOo0BYg+87nkbM6kw+99G/GA4hpanq4a6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764140; c=relaxed/simple;
	bh=vVdmnFtLy/tw7aRM7sEWapxfTjOFIN1E2HeyTK+L92I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JApiGN5uD6e+oVPaA7W3iQGc+vx9ZrhC8gL9x0X+GXJ+P1xaX1gvchI2KDlmDCYGXttwtrtraBaAOrZ1dZVylFoRcG+YgHUULsPkyab/bOtb5SJtysE/IdeoRnpA/tE06kCUHmiOKIvQpCkXPFo+zlAnVTRLA62S58UnOtqGtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTYZ4saZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTYZ4saZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so1007846f8f.0;
        Fri, 04 Apr 2025 03:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743764137; x=1744368937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NoCVEHwihQ1loXx0nSFlkGqZPVNcZeJYP1pFpVRK6w=;
        b=UTYZ4saZSaN4IIUzoE4SObmNJsO6vomVwADShigMCCHY1GHcHPpN0Jd2FYYyZm0Upt
         w6o99VquMrHRIcgFFTQe4bich06lEmRK85kkDkw4SOY7vdrC3Bn5LpiiQHKzavH0cHLP
         JtjzHQTUW3PtOKTEm6QVuGag7xc7P6cw4ZHJSXpbMhE3NawyqhHDFc2ZXzRe4TMAupxV
         WkCc0rAqmHHy/+wSqpugcGcwqjR6fOINban923yZUZDwmbGT1cu+X3Zucyx8QY3fz5Hm
         CvG7kqo6eyy2b93o8znNWXVkuvdqiif8lGr4Hy7Uvu9R8S/4mIrJpIcgWTZIBkbj++Iw
         eDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743764137; x=1744368937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NoCVEHwihQ1loXx0nSFlkGqZPVNcZeJYP1pFpVRK6w=;
        b=To8yFUFU+A0u0OT67THtsAVBC0V4lHCA+6zTkrP3Xa084F64ppD3iXsdVsX5U4gT0N
         EUtEKuK2CbhZvOnHfLDW0xkS+l2r872pPJcn92wTfOqqRiUD1EbynKMy46sQZUVJfBNl
         2D6tmeBGw+sTH73u55oEaggvaS2Cpp1PF2gbLD1h/o9w61WS0YTjQw+PwpYoK8izsHt5
         BIV635htgTvkZQwY5P+TkdZTrXh3JDgRz9Txv4ChERSkk8LQ6wN9co/XIYr9G5PVL1+k
         eTVeBUoh48K5NCanMJQO596kO/a94LjlH4JiP0zeobKVsYf5Wk1pjcYc6lJlskB7IJ37
         5cOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH2GZ3rA1DeV8Dk2e50pUuICefOnza3iaQHr15a9Htig+PfmIlbfephAwhSAWOllZ78LgNL9XyAqb8@vger.kernel.org, AJvYcCUj5IUDKIBDqHXHA6zK+us31OkgEiGBahhS0BWxZsMgOCdRFnN0JtWt2R3gYzn1KL+5x0dvkQMgNKW64jMx@vger.kernel.org
X-Gm-Message-State: AOJu0YyRm/BLq3nCyPS16XenV+Kp03bKYFDvbY3Z4/IefE5Gd2eT24cc
	yTgp4NzcZM95OsAsnkJkhQddLK/B6JwQHVbj6CS2NMbCQjK6VM2bMf4DAA==
X-Gm-Gg: ASbGnctRghlRtgJMylY1QySwBHiiH5iMMgt5P0NYtapiobh9dUVPvcD/DUPq1Qa7Ghm
	9o1coyh4F8FQsbvEMJTUHhSa/ab1LZ/+eXWVSz1yZxL4Hop//MPzYWaNKYXsg8FhEU8lIagDnFm
	0gFyUdLAyvVQm+qOGZmTySDvfyNBZ8jfWBggLs29ihx+05t99y47ERluE2M2w6mgorZneu0wGrB
	HV7jE25LcxrKSNwtnn06JPm/ioJtI5Wub6OilZpHo83IvK0q78mx3hkQbLY6MjubNwhFSljpXI9
	tBgYWFz/IB5WY2yyWqNwMDUjoCljTf4MC9k/MWdF
X-Google-Smtp-Source: AGHT+IFo7tlkl/+wMvwXptBvJkGXJEA8uG7yhSuxj7cy+rmK6b6ptf9ozqOVK6DTf/eox0u5cbJ7JA==
X-Received: by 2002:a5d:64aa:0:b0:391:2f71:bbb3 with SMTP id ffacd0b85a97d-39cba9332f2mr2428269f8f.46.1743764136576;
        Fri, 04 Apr 2025 03:55:36 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e602:d900:7d1:e192:9339:cacd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d938sm4078097f8f.65.2025.04.04.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:55:36 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 1/2] dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier
Date: Fri,  4 Apr 2025 11:53:58 +0100
Message-Id: <20250404105359.18632-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <y>
References: <y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add DT compatible strings for Toradex SMARC iMX8MP SoM and
Toradex SMARC Development carrier board.

Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx-8m-plus
Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..daba8ba8c95f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1176,6 +1176,12 @@ properties:
           - const: polyhex,imx8mp-debix-som-a       # Polyhex Debix SOM A
           - const: fsl,imx8mp
 
+      - description: Toradex Boards with SMARC iMX8M Plus Modules
+        items:
+          - const: toradex,smarc-imx8mp-dev # Toradex SMARC iMX8M Plus on Toradex SMARC Development Board
+          - const: toradex,smarc-imx8mp     # Toradex SMARC iMX8M Plus Module
+          - const: fsl,imx8mp
+
       - description: Toradex Boards with Verdin iMX8M Plus Modules
         items:
           - enum:
-- 
2.34.1

