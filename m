Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3629614C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767768; cv=none; b=namMftytcR+DP8S681KfeMg+ieD0NUM7VnwGB5Bg1QluIfCK6+XfFAMU2QFu62zmtcL83e1f07NvW8AcinHsO7BWbF2Rc0ou4QZsmZSsGFzRobhbjmtQbF3T9ZVHKfyYrBKdlbf9zxxN/WMgmIMOEJZuE1rdAyvfZpGvNo5lra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767768; c=relaxed/simple;
	bh=Y2CybwO5O92qFRzmf6MiBBMqXPDVGxgZvsyOnSjjQXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEnO+29rOH7T0e4F6V370rjzSrA+A48V8mgyJHNGCigD29xb2NktD6ySTQiOlUwUiRes+o2P6CarNOyZbPKIaZWcQXVIVhkMq4novIMNZt0Gbgea3jRKgaDcOg/xCYnvaKWgF2zFgSHN/qg3NQZtNFBFqs9TZN5n23ZHGSC0nUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lRYg6IE7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lRYg6IE7"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso64284566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767764; x=1751372564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pEN8gXZgdAsFBjyK1sPhSnwBV3mYYXNO1YIRz4tk4A=;
        b=lRYg6IE7s22piuV5osFk21uVmQ2Ya4YNKKbtw4gUjx/hY/3VU+2X3/eRdLzvOCKmaL
         WrPN/9zuXYVbj6R+3zmgFbgGjSJtnME5aqFG2N50JSEb7Ph8cI0TQ547w2Oo4v8aBwZq
         IhmZhAKKk673R9PampWEcvrRsAIy5UOQ/tkgrk6tnzbGY34Pk/orqS7F4oOyxI6ZAvR8
         A/bH+U2nkuJhDUT0jJiAaH2iaPZzx+cQCC5HlCFCmcKEuH+Aiu2LxrIswZS++V4cRDSj
         CgyzuusYJxYntdKKpdFYhV9To57O87fEzyZacbEVB72q1BxH2xvLoypsYgdS4NT7AqMj
         WdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767764; x=1751372564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pEN8gXZgdAsFBjyK1sPhSnwBV3mYYXNO1YIRz4tk4A=;
        b=jzlcXfg8YSmaryV0sbDje4umSVBAvL10DaiA6VIaUzxsNHYJIinClGdMWbjIuw3Ppp
         Gu048psa6MUlJS6XrN998C6n6ZAQGIElpsIcn2MsyZWkeQTlmiQUWnKuz4xpQuRF84pI
         UwqpTRLOlulyDVWYMVWp/Hs9i6uWsXHx8X4twEe+n6I9J5pi0pmiN28wtPmaP41NSxoz
         xDVoqbpUkjImNbcHJnvHFtjDGnGwZyf4CRgZpQ7WkKYwbWUwoKM2yqCMHNtj+GhCUYfa
         3K0jjNiOM87aE1dgjJvJ2QgiXss82xff3ik0V002MugTM6O4IGAJuCiajU8cMVe4xRz7
         iLYA==
X-Forwarded-Encrypted: i=1; AJvYcCVl26HO8DQr0MqtmfrAU4rsepXnxPLE7ruJb6WaL/tEjYXaOMrFm18FnV2Qdyeq7ss7fDzhbzB16fnFdK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBG0R+41SVzKu5iXqZ0Rsxosig+OrAITvsloPAUPWvbiwjyNw3
	4Ct7l9oIlTHYE2vI4TYis90c337dtnhy7kc6WZOULzILQDL2LlIu91t8rTCIhSh0jmKimkxwG7R
	VrI0A
X-Gm-Gg: ASbGncsxymyuEjloc6ZaTl/qQyrlo6I81EP2k0IlDNuRhJNb2DcjNGUAW2dUPmL0HC6
	t4i7A0uBKUtkLkEp7aITUawNA8l3dkLZ/EffLXsMSl0shdVdPLIDrS2NLsHLO7ZJm5dHcRkwZTW
	0Bv93qnIhB+/SvV/vQ51890/u/uw1elJltk5xPKzImgIGM1Nq2seFwgqKBkl3FPLf2LrZl9jo6j
	/KH+Be85Yr/w797m/f8eaLm12N0nV8LAGqK482uO3v7BC8ZcmNgxH35KVv4T69Y9QY6ZkvIsIPc
	MlMmeOfRZMVF3ywrAeVuLd812i2WcdSXpZSjxa1zGRcFdBPVvD6+6kYcvn7qERbUCWYGlhPq5A7
	mDzS5GI+RRmsySwot
X-Google-Smtp-Source: AGHT+IHClClHU8Au2E96p3VcVy/ff0krSWCye8OOGPLD9aP9mvkIHbrhp24LtglbjPmIGsJ5dSea2w==
X-Received: by 2002:a17:907:d91:b0:ade:3094:d70d with SMTP id a640c23a62f3a-ae057b2c11bmr476040266b.16.1750767763870;
        Tue, 24 Jun 2025 05:22:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Jun 2025 14:22:31 +0200
Subject: [PATCH v3 2/3] iommu: omap: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-syscon-phandle-args-iommu-v3-2-1a36487d69b8@linaro.org>
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Y2CybwO5O92qFRzmf6MiBBMqXPDVGxgZvsyOnSjjQXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpiNSYzTl+2MUxaNx8XvXO4QwkWAl2BTxp+79
 MVamFK8qjeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqYjQAKCRDBN2bmhouD
 15sLEACByAyjNTvE5aoZpmaIOtqtDYxUQAJh1mOrJv0pfkE1rBoG8yp6pAowtxtJEEwgfEcU5F5
 BKuN1dDYXM226/q2h2cDfS/EB/wYD4OcdC04BGpnhGrAn8l7z/p0QLoA+R8rahrL6Kmeurej1wp
 3I6MHQW/6mc7byXrEdjooXdl8zoK82GRQTm+GYSPL9dWxCNA9Jp4dfwdapw1V7KM4Xn+OzyIEZE
 0HyZOFfz72MCMXNBN6QiHMf62AZVoXMpu5HXzTiC+sQ4XNNngE6aeYz/99QuCkOpX+bsjAi+V3q
 8VPQeqkwbN+HaQZL7AGa0bGDViT8s0G6hY3w5hReKey6o/obX5VaBgcJn8dShzJ9N4VW64MvEkE
 JzWuwnYmRHZZicPdB9a7usUhHnBeMThAqBOQx/VXoZOAvcLwPuFDbv5x73BbZ03KMs27+Fi9vgO
 ScfFSK6YRA3sCBneffseNwpdbLsFFRITJN1pZSn8o4HqFTmRsS3HPCOtqnQEMRLEb2mnJISWcw9
 1lOOtBpQWZH0fgynm+mJGTl4ATeMTvpeW9RH7OyfWKnbrZ2Fr8zwWyhgeex1AeJJcL4QMibillA
 WwrzuSgeLfN2UbX/ORvzOUZMmnQw6xlla3/5O8TpYG8PAa+ElTtlYy2c7EtwCcwfzfV2igtykwS
 pDPqxuoBKGaKq/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/omap-iommu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 4448c0a512137c79195112eea25d762266c77bc3..30fdbabbc9c652990e6cd31d3c0a1a06633df9e6 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1127,18 +1127,12 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return 0;
 
-	obj->syscfg =
-		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
+	obj->syscfg = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-mmuconfig",
+							   1, &obj->id);
 	if (IS_ERR(obj->syscfg))
 		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
 				     "ti,syscon-mmuconfig property is missing\n");
 
-	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
-				       &obj->id)) {
-		dev_err(&pdev->dev, "couldn't get the IOMMU instance id within subsystem\n");
-		return -EINVAL;
-	}
-
 	if (obj->id != 0 && obj->id != 1) {
 		dev_err(&pdev->dev, "invalid IOMMU instance id\n");
 		return -EINVAL;

-- 
2.48.1

