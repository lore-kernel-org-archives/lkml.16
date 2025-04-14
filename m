Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5C2BE7CA;
	Mon, 14 Apr 2025 12:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634353; cv=none; b=Wkve926z8r0PFNYyAmXvSdzdnV89H5LxdF4Vzt3n6TbbTezzf7GTCNxKLGcxHpkWWKXUyDZRanVMEEva1tnY5mGDdQv8/UPin4XyvgwEgOlVKX7DpgVHpf5T7FKs6IA5tYJsj7GPaDNyFcB9SyBZlFSFpgjj9gdLAIQOneoUA5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634353; c=relaxed/simple;
	bh=u4pVF5D8eNbZVuftOBcpJr8yEG3VXMk1bldkb9KzxHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AKEvCyWOB0bGzuWdmQW0gHG3HLPU8G70UcI8DeODU/xA6g39dkbeSS5BuhCEoMGsep5sz91dWtK8OReiylYbK4IcOj8y28g6uX/ELjejXSa3eOIkJgJxK/IJvgj/qL+uVYO87NpMIOF/Pm1uurx7hzVEDgkX/S3Bme0OdaqLLws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noqlzVqK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noqlzVqK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac9aea656so4176083f8f.3;
        Mon, 14 Apr 2025 05:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744634348; x=1745239148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7Z5bmbcR0wLl26iD0zfGWGrnXb+opdX92BPmXdcZ7w=;
        b=noqlzVqK+BopEORs5N/mjRHfaV5zWnO5uF15M03C8r4P5FHqqbqUtWxGQFZ+gucw2k
         daXGSiuHyAExYI+xYnRGu/zPTb98ryx13P2dcFbJ5H98YuFzMjVANrYnN77Axx7flDh1
         MQ/xPKaJy7w0ohXJgjwOufgb6y/mFabDU6rVAB0iSyTu2B3vdvg3cKnR62kNssik1gRg
         OioiAxx8UBOzrEbJVUksI23k/bhQszfx9yXOhTWKvFtoc+Mkb0bAPs+awF3YpjSCgHmM
         cpXpaViuVTCVdzV6wyo5fTmDwKuaWBbYFT0//lgmAuSXzRk9pcrUCpSzha0ynIQuXmu4
         p7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634348; x=1745239148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7Z5bmbcR0wLl26iD0zfGWGrnXb+opdX92BPmXdcZ7w=;
        b=gXio/29qHj9GsnoLwC/xkk0sZlaZc3rh2ghvW60qq5ADqvFrIRdnS9ts4yCiI0XFbs
         1n6gyp1VSXkkVwEsY5uYhn0ssqrFY3jkqxPHH0LJrbQkwQDOxHyeyxyaKX0NPxlSzVZR
         KSixdt6PFA97HCdCfRFG2MTN/Q9TTKDLuvKmXuaJg+Ot1ElkCGQGDcGPgcT2Ru6wdpVq
         jfwW7xOew+1QtdRAnh14Bi7KYlvx4fNynYQcUkqcpODhkUsDxdt/IxwVOgeYGd7ojdkE
         8VWtXWDfHbtVzCyeSeJU9Jna0EGHWKBhd+GJh4TSiJ09cdR/T9n8VfOoBMnO2bxDnLZS
         KyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgrfqMsso+xkmhgpTWMmCL+oMyUPMp+CIxvQ4Eq1M/dnyIeM/7HtUwtQ7sgnTDQdAOHc07Pgdkn46d2hYo@vger.kernel.org, AJvYcCVYHmgirK9weP0OOQvYXDR5p+5NdFhqmUwOyYJV1mRzH0TCL9tqQgmuuyQv0zYwpFkDwrzqe4e/7BGo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9WzFhUJrIgLlWC9Jd3MebtHSp0YhI4Y4Pv3Qa4KIKWLvR+ho
	olwf2uxVZab19pJIs/AMp2FW34e2VAuPLKYKwiIHOOJpoYqG4pCP
X-Gm-Gg: ASbGnctm9Nqw7K3qsPdbwKZcpWocXhGJOaB88zKOz0Bj39ePksh6GV2IM2jQFLpyE4G
	QEJH1Ju6cv9HOaVWrzaJ/lx8IETDygxDejyfhk8/I4a9JhvA7lTFT4h25N2ICcFMHpW1wtqmupK
	sbS0i7aGIcc77rva8k32ftrJ3cY57JlqUR0uEUY4OX+TmHdFPdNkvoFJ+yBqVd1vYqOgBAD5Wf+
	lFPUm5O+/rNEFaojm9/l+z/86SDfTXtZAHJNexL9MbpXPnUOHgIIArFr1R+rYQRDkt0uCTpTR4r
	/V/jrg2N4RbOPUAiTm/3K7hV/FCWrvMr0REs
X-Google-Smtp-Source: AGHT+IEiaFcK+z6JhYbYopoySM/4Ric1NLoTIMOYNSKFAaPNGkMjmGOlICjdAfMlUcx6u7DwwGRZcA==
X-Received: by 2002:a05:6000:2210:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39ea52169e6mr10011243f8f.24.1744634348423;
        Mon, 14 Apr 2025 05:39:08 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e602:d900:68a4:1b76:fda:f9fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm10703259f8f.25.2025.04.14.05.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:39:08 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier
Date: Mon, 14 Apr 2025 13:38:26 +0100
Message-Id: <20250414123827.428339-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414123827.428339-1-ivitro@gmail.com>
References: <20250414123827.428339-1-ivitro@gmail.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
v1 -> v2:
  - Add Acked-by from Conor Dooley

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

