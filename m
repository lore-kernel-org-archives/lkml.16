Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414C2750E3;
	Thu,  8 May 2025 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715110; cv=none; b=fIt4jePKprRMEpbJKTFOcYZ9TyqTj8He3YHSFO2x1bpCEI4YkUSA2jmPSvkqLGpUtedy1SVtO747RIBBnqS9S17KmlWbrvBiGL6hzCzklg8EucY9OD3t4/5vQFtwvDmjCMlmiWpEBGG5Lir1qSucYkkRpnEPZMnbuh+6M5HgfXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715110; c=relaxed/simple;
	bh=bCU02Z4YtmP/mOd/KT063huwsDfYDDWDFR8Fy8frLfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrmLAiInGW0A7eMD5VpY/QKfBtlR07fxaLTUI0o1EW+ENSoBGSwmayDSfUqTXvLYskTxmKusVsj/mEEhBX70LQ1etPlcll+kD87E8Uh3GeYV/g8cdGIix6uVrgC2spdNR31G0Wws2juWXRfgs055tFnU794cXHd+Fw+ggUkeM2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lct2F7v8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lct2F7v8"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb415dd8faso175435266b.2;
        Thu, 08 May 2025 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746715107; x=1747319907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
        b=Lct2F7v8IC2sZsOcgPPVin6giJx5GBPcTU1ZTCL1MxerXmdyZcolITCVpMLOplBClz
         JynvHy5rECecCtZz+hItghCMtpjSLqTHJX8awM6nrMbeUWk2N1byAj0KJOekAUsa6YFI
         xRLoZe+B5dojbCyTDjMJ6YXLmaoPV8evQMDqTd57R904uk+wSoKQ1PDseDF2JtXm+zhW
         MXiEVp5iydff1Qu/GPP7tyngklVdB2S/LuvUNMew3Gwa4+JWVxyhdOMoP4NO7RDtaRM4
         SoaLnG/Pd2SWfUZUTsQYO7prlvgvyvjiqPAbm0fg8ZrWapteoLAvUTNt7K81a2dnMKIy
         0RAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715107; x=1747319907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
        b=l2eo2FPPmQ8fB3BpFwPUoGfHx5v2p1XIH7oFK55gyQOeTajMRQCI4Gni1fNje5R9fs
         Wmd8wmIZTaKcMdsnjbXvmS79h8I4DFCJpKADL29pFxbPzXtvbbLRa66a8MWngODQFsvr
         Rn0uEPHQmWMwQRjpinuvdgRK21J790ywH2hsKx+N7pgGkHb0WNZe3qTY+BCkLN5flgf7
         hrwZzUfM/B4QXU3LOJgy/Sj8ea8P+IYHISOCo3hf1gPHlCEVAAa3nBBS/EAYZS0cLYIW
         Mim+lAXQYYQzHxmxcrShuXg9S1S2y/q5NyvKyg587kiagAZgBCfWj58FAJss6lXIX22+
         ULFw==
X-Forwarded-Encrypted: i=1; AJvYcCUtPbqS90M0NQaDDYamX/2Uxu/I9UoWMfrOup8vNpZIRaHc6divI20RnerTPpBobmtLHr7h8lnQLOfzqA7Z@vger.kernel.org, AJvYcCWRwQ8ilMNOoAYaPFFZh5PSStlOjY2Aq+PsXADcEahCywYSu84MDS4FannMxXvrH58qJUxSh1QIRSA1@vger.kernel.org
X-Gm-Message-State: AOJu0YxBaYF9Oyv+Pppk9WmDGdnFbczjlpkmgH78JFxF5VB4caw5/l/n
	pX4cMOmFRX/esqM6TUHxkwn7kw77MMFxWJ2K2pPU3+WFMiyTDJUq
X-Gm-Gg: ASbGncvn5LrReWNt86egtXeRXmb31pDjHd+DqekbRira/pwYBjYcMqesay5fwz4yiDE
	BjT0IYkmAVgoAcU0uqqS6LrnKfRL/eeBa/CSE75PsDch0mZmhwx9D+rgkBag0kMjsj4hFTeLAS9
	Sh4YjC2F1N0mO1X06qdPQcXSHKJdRjreHICD8WAEcH4H8vpYOYeBYJohRtwzjMhr3ROZVxRUALR
	FszIL1vo33k3zm9arja1kiYMQqnM6JMRdq5qRdDlyWVbyw+ewl7qj+EIjyZBWFE1qLtJtPYih0F
	EP8TlltwYpBM3E/yNhPI3V2PIo+hG+dEMRWwvm7nevl3
X-Google-Smtp-Source: AGHT+IEl8W7Z48QojZSSlNyKzo/MwD2zC8/Fy87SvOdLzrwX/FLitnj/UnwE/86blYtfAsljSHA5MA==
X-Received: by 2002:a17:907:3e8d:b0:ac7:322c:fd0c with SMTP id a640c23a62f3a-ad1fe946c93mr353166166b.40.1746715106657;
        Thu, 08 May 2025 07:38:26 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1ed2f588csm334443166b.42.2025.05.08.07.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:38:26 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
Date: Thu,  8 May 2025 16:38:14 +0200
Message-ID: <20250508143818.2574558-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508143818.2574558-1-goran.radni@gmail.com>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This commit documents ultra-fly-sbc devicetree binding based on
STM32MP157 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 5fee2f38ff25..65c4dcdbdf1d 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -184,6 +184,11 @@ properties:
           - const: phytec,phycore-stm32mp157c-som
           - const: st,stm32mp157
 
+      - description: Ultratronik STM32MP1 SBC based Boards
+        items:
+          - const: ultratronik,stm32mp157c-ultra-fly-sbc
+          - const: st,stm32mp157
+
       - description: ST STM32MP257 based Boards
         items:
           - enum:
-- 
2.43.0

