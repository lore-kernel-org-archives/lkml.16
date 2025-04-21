Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53D11D7984
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226598; cv=none; b=YNeRIvlscLqOid4Z7QGVYsTlZ1DGe1CRHWwrXqw+vtuODt2YBPXb4KJV9vmTrYAIKUZDxYANMm/1/s9lySBozV7l/MJWyCULucM/8CULftWjiuLQPsgn2+iM2j38I8MAnYbJUowtPxMjfL3kkn+X71J5tFMGWFQZl2vkrvNU3qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226598; c=relaxed/simple;
	bh=jYfITdAy8llVjno19Ac2CzcMCZqR2AGhRl0UKubybFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFA7C9f+a6mjXv5P7whiFMBu5j6KwmTAm+2V+gvK2wm2QvSI0AmrroRJFNTABE3P2CRcYzaW5aJcprXY4I99ShcdnvPU6oT21klMWhjSeq8Jamn6fn3nek7h1uMYR2w3UotGvaW/25obvffIzIGK5UTbYtEaEFvub4R95ltm0YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ifrf0QRU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ifrf0QRU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227a8cdd241so43795795ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745226596; x=1745831396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xw8UIDvZBCcr83U5CXKVA2bqzTMOFGkmm5WFSkBADIc=;
        b=ifrf0QRUSss3cnedRZ6j/eUymIc5z05KQgmQxrM2o7I69fLbR8d1EBadrQb4fZSlMc
         96BaiQlPZDQML5tYrWb7T+Fc2KBtFTw9p1fUhMj0ZaQGsuANzQag0G+Y/KsFImCKlYaf
         ikCvwamv3vKvw2x0IV7gYsBn94RMLoIEjuk/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226596; x=1745831396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw8UIDvZBCcr83U5CXKVA2bqzTMOFGkmm5WFSkBADIc=;
        b=uFJDsQyOxTfGGYFXx4fJiR3Pec1Rzig62LNkknz65wbgbHqX1s5dxd9BntX+EJuNC5
         HA7VOWajyycocsMvrTL9LeebJpQqob6+X/YR9Y7vPgP6IGdiqgmmYOBxL/naSA4wXbHp
         Tutx9FB232FEaP0ajcovMLskDmkG/9ymQSBETZkiV+F+xFf0Wk4LIkGSZzymW8C0e4qE
         wRiWghCj5f0tykEZwXL2kgaxKKtGO8QLMqclZAq/8MC2u3CvJyWhrm8mK4uH2VFGkLxX
         zGTPNU+vCitsOhGSJ1PKg1q8/ij1XJLt7s6JPOE1CRNMaQ9Ny97nYuwv8+sCNTK8HoCN
         hU+A==
X-Forwarded-Encrypted: i=1; AJvYcCXn9lVOHfLTGWWoPmnCeJwF8ubMVK3FnHkGJ0FG0S5A7GC2RhJY/ChiErMgNiXXYyPm8OewDTNQqdrAv88=@vger.kernel.org
X-Gm-Message-State: AOJu0YygupPEi7YyyygyqLGYDiXgIH6UxpRS7k1h2FXZd5cYBjby6reS
	jTQRkZCr/mot1a6j8Q+J8Dm2fR4HE8EhvvPFQRoWkY6/q3F7jLS1RzE51tahBg==
X-Gm-Gg: ASbGnctBUa/9oJ/KZk/sikEeWYuDlP0i3Mlhmai59kNkkJW6+mSl48fnkxQtUwshBKh
	r9NzsOcCEsrefHv5FA72FGK8GqzJjaulmXIgl3fhunG1Y6xzaQzmBBTz/yGyvC+WzqvYMhFEuGX
	KrnOq7JYBBOCB67IBivF/wwIJlDmenyEkRahIwX129WAFdvOi/au3IfCDA6CF8zt5L9rv1ThUzm
	T3icA34T0EuAK2isnKepKgRHC+YgwLURMTSHB27EQasaE8E6ZW246BTIqwoM3+Qo8G6dbvMpSlt
	oH5TFT2HkDSHb+sIUeioGi2FJGKeyjzN9HZK/n9crsJ4HX/TGceMy03Qf8iQ2xDEP5DU9g==
X-Google-Smtp-Source: AGHT+IHDl/Ex7FBzvgMFPAFFoh7YhHYfxUvKL5Gx49McL1TrmyCRhCWjmqZwJhpIy+Bel/jx902Q6g==
X-Received: by 2002:a17:903:2ca:b0:224:1609:a747 with SMTP id d9443c01a7336-22c535cbfb0mr168110325ad.31.1745226596121;
        Mon, 21 Apr 2025 02:09:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e3d4asm6113079b3a.70.2025.04.21.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:09:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pmdomain: mediatek: Add error messages for missing regmaps
Date: Mon, 21 Apr 2025 17:09:50 +0800
Message-ID: <20250421090951.395467-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change to the syscon regmap API caused the MediaTek power
controller drivers to fail, as the required regmap could no longer be
retrieved. The error did not have an accompanying message, making the
failure less obvious. The aforementioned change has since been reverted.

Add error messages to all the regmap retrievals, thereby making all
error paths in scpsys_add_one_domain() have visible error messages.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index b866b006af69..22cdd34ed008 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -397,20 +397,26 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 
 	pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
 	if (IS_ERR(pd->infracfg))
-		return ERR_CAST(pd->infracfg);
+		return dev_err_cast_probe(scpsys->dev, pd->infracfg,
+					  "%pOF: failed to get infracfg regmap\n",
+					  node);
 
 	smi_node = of_parse_phandle(node, "mediatek,smi", 0);
 	if (smi_node) {
 		pd->smi = device_node_to_regmap(smi_node);
 		of_node_put(smi_node);
 		if (IS_ERR(pd->smi))
-			return ERR_CAST(pd->smi);
+			return dev_err_cast_probe(scpsys->dev, pd->smi,
+						  "%pOF: failed to get SMI regmap\n",
+						  node);
 	}
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_HAS_INFRA_NAO)) {
 		pd->infracfg_nao = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
 		if (IS_ERR(pd->infracfg_nao))
-			return ERR_CAST(pd->infracfg_nao);
+			return dev_err_cast_probe(scpsys->dev, pd->infracfg_nao,
+						  "%pOF: failed to get infracfg-nao regmap\n",
+						  node);
 	} else {
 		pd->infracfg_nao = NULL;
 	}
-- 
2.49.0.805.g082f7c87e0-goog

