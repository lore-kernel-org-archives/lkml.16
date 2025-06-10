Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31898278E53
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537288; cv=none; b=hz4d7QXBRHz2cLy9+YulpxqMwpY2Hn/nR+gfgKMXHac+BUi8TmKNDfdBs0ZG7Euj+9auwHr3YPbsqndDAO83ktQkXy1tzrAxkdIS+/xxIEyZ3SGv+1a9aZd4SOCwiwhnqsJVmu4jdcoHjDOly8seegYRCFBoxwQNUYpPMqJA3Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537288; c=relaxed/simple;
	bh=i26MHPsWyMpA/vIVdZLIh+KpoJG4cIY5pq43DPT70/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjE3tK7tFnHkaUv25apSjXI+u99+nLmzPRp9jzf+SjNSBEvM+7atAQ43qeCcU9kzkPJJWuq7ULkQw6VHWHwhxC20k+VADoypVX/azNcuFWk3p4uXABrXPWVVahkA4PdgEHHMW2vDWi/BqJJF7LI3mlLqSgv87E8SVSkCij9EG7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e5o37NNI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e5o37NNI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234c5b57557so46725795ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749537286; x=1750142086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9s3bFxA/iUmk6qSfJ/+0ju+9AuK7egSHjY2rer4xcAU=;
        b=e5o37NNICsXR46EMRSX65qg7lZBkvSeUstYBUw/Y2pgQEWWXTZbg/FuQZVfuKbJF33
         oFUwIBXi5+vKfmRofosvsE3IBLddaNfnSB6TnnujvWuKVGOVjtHUyeJkLypzYRRa4N4w
         TVrOz95cn0vlRDKXzUesUWWu61EpzbEWAkqfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537286; x=1750142086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9s3bFxA/iUmk6qSfJ/+0ju+9AuK7egSHjY2rer4xcAU=;
        b=ij6xZxOv9ZnekV6kaAwi7SU3B085ekWFFzoyrxhghUCxodu+dusXmHTlwkpCAP+G5W
         ZBiYdtCz1OnmKljGjKybmqueVvPDSGqGCaWCSRiLcDeV9Qtn/PYiJUwRhQ28eJswRbOp
         LRrFD7j5AOIV4iOyraJpjaFzADM9zbNDVimjI7s7gYSRDcONOFNc3kaE/v+7+2+XCeVJ
         0rE33B4iquG7rybcO0MD0t0a0+lQV5ssgRT30ir+Lk2frKSmg5pNZtbvovIuHrxzbX8K
         9aj+WJyGmZzjoBREC7oEbdnBziag9prC8kzP9+o39zRX9vxTB1Q++vSwUqkFuD+rEcfE
         SUoA==
X-Forwarded-Encrypted: i=1; AJvYcCWzWstHI+zaC8Xmlz22sk7qlizkzO35chPzlI/rz46Vdwcf4ErmS+1Ck4Ue5NOBd6Gf8W6HQKNJV4Krbb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9eazySw9NFvsCjEv4C+oFCRL+Tv5/MbeEeJUCiCFpsaqY08W9
	W68RqFsEqxl7kHjzPFoArSNPmml0sikI4xCPgg5RlRK1iWR7ohPCtQnF6QhswuFZ4A==
X-Gm-Gg: ASbGncs5K9Cnp5fNkx0p9RymSH+xAPhWSDKkqKC8/8ZhmaPv6UGAzaC7Uo0TyVAxVxH
	pyHtc0DL80BeVTsPo3Wt2S1aaAQlv7RlJEF0oW4upCL5zrMqU6QapyrdvELLrFQEDvoG+kEUJIi
	4iDwSCZ3ToTYzYnx1SclDM697Mq+/67fMWXmeEHS7yOHMkWCURfZHIR+wXZ5hGjBgg2HvFJwbZ8
	h6Zam0EXdiuzsw2wXYxUFsR3a8yjmfMlW+Z1Qg0OoqqjHQ1J56TxeWYXe8pYm1tNRzs06yKnQo9
	qWeL+nI0sFv36LYX7M6urNA2hNLZi7r5zijj6Ttik5jUrcjV9SkZw/lya0kQwLhp0abHHZy3bKs
	PJyFI8QArPo2VEHI=
X-Google-Smtp-Source: AGHT+IFSfenrPgpYS8YpG+M5+osrGMDb3jGStM+tUH+0iHwn7+BobeG4OBWi4Cm0UHiMF1nHBAIopg==
X-Received: by 2002:a17:902:d58b:b0:235:eca0:12d4 with SMTP id d9443c01a7336-23601dcd1f1mr210895915ad.53.1749537286555;
        Mon, 09 Jun 2025 23:34:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2826:ada4:efac:14e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092ee2sm64596765ad.82.2025.06.09.23.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:34:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8188: Change efuse fallback compatible to mt8186
Date: Tue, 10 Jun 2025 14:34:30 +0800
Message-ID: <20250610063431.2955757-3-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
References: <20250610063431.2955757-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The efuse block in the MT8188 contains the GPU speed bin cell, and like
the MT8186 one, has the same conversion scheme to work with the GPU OPP
binding. This was reflected in a corresponding change to the efuse DT
binding.

Change the fallback compatible of the MT8188's efuse block from the
generic one to the MT8186 one. This also makes GPU DVFS work properly.

Fixes: d39aacd1021a ("arm64: dts: mediatek: mt8188: add lvts definitions")
Fixes: 50e7592cb696 ("arm64: dts: mediatek: mt8188: Add GPU speed bin NVMEM cells")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 202478407727..90c388f1890f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2183,7 +2183,7 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
 		};
 
 		efuse: efuse@11f20000 {
-			compatible = "mediatek,mt8188-efuse", "mediatek,efuse";
+			compatible = "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
 			reg = <0 0x11f20000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

