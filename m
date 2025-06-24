Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC058FC0B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767765; cv=none; b=sntWntjJVk/Vy3nbb7GqXEhS2sZ79gzX6koOFZj2wfLD5HhOTXqMpIyswkE2D1ULAkvmeWwnQN+eLiDpNRc7K74TCjUcZre3y1dUjH6PW6P8cc2LP5EDT3UC7c05FHkON08y23wC4S/9+a95m90wCtX4XD6GZTVXn0OtnDAshTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767765; c=relaxed/simple;
	bh=RvFdNy6eRq3jk+TGzSf8jssUcNniJlHcLRIQMwrb/Io=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UhhmVr21YnhUEJP2nyrOXBPQHhKXPubLHGq5FC7XIlVMzuZDdY/64E9KZmlB3D+Men3bQs5iyvnH3fvaue+WrrQzsIQhWZbW5c0VOpcC5n3/Ga4NTZxAzkDTFMMAcobksg/3f4VuxIBp1nZHA2jItzDoPk671b4a00qcIwkKgyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZ0dJT5m; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZ0dJT5m"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb37582eb5so62648066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767761; x=1751372561; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIOHrhTp/mewrh9i9oK1S98LI5rxY1dc4uYp1wgAtk8=;
        b=RZ0dJT5my8t0bJmpHx2J5lHRL0ml9W2NqRMlxzswQWmAPZF+Er6Y8zrOGXnXa6ESGM
         DDIwQsWGHTcVaWomVbSB5O1CxbPDtrpULnCJurM8w3Vt9yWTUXYrhFrZSt2bzOe0CBQn
         OkRUTUJhNPt8e3OE/sbvCekR4fUJ9X049yT6xer66GIh5uBCpya+2M6bCA5RnMdYM6w8
         JLnFdxUOq3f1z/8B6OTk34lo6T8yqPwAUfsLvPaCZzCPdQWqRj0j3RK9Vl7lZxmOswgO
         nzkJdXW2/6dydtVRlX+Lf+yXdothhG6jNkquBiWbHAjkvJydHxf0D779PgW4bSjYcPnZ
         3EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767761; x=1751372561;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIOHrhTp/mewrh9i9oK1S98LI5rxY1dc4uYp1wgAtk8=;
        b=dn8yuq0j7ImMlB6NedaQIE6pP97gnJnSlFCHfAeAx8uqsa0FefffN7CrhWJjoZMaCo
         M2JqcAzlc5TNZT7isdRxwE1tlKMr84BMJdhZ4eYkJXdDKPsg9Pr3mcrLWAlGZ4zs4IrU
         e06J9QVS7sCYZC0+2Gp96tpnlvcctlj+4zTCRChVS66Oeow5K/3tE66n4JN+pynWwfYB
         sn7qJfstsopzQrtvGcu2cbDUTOYC37ExskiP8n8u3EG8/5NuUIAunS++/wENwxtWCUo6
         wisNx3B3RJjMj4HRvAuleVrWDLmSZnAz4G3L0CYUM22IU+i7sng5994sLi69kgSSfcXR
         +tkw==
X-Forwarded-Encrypted: i=1; AJvYcCU3opK2dK/chiM5Z3si9Rblh0e1HC0fb3cdUfdvbVoXSbWfeP2LslXFvUSWu2vnnRyCC8ww3zTQ0dsdDPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zLtlNe7lIG4LLmJ4bAlj/NM9DUosRxYBGshJpDlrQGh8NFaS
	b3o4iiH8FcJ1GBlDfCBU9gFPhyfowyozPDhbGfrPODy4Zx0yKX+8lmYxzH6t9efDYgmENQPzJVl
	dhdP5
X-Gm-Gg: ASbGncsgBch2DjHTnq7K6VcoodyxwlLE9Gfk5rkau4oz1V2z9GgEH2ZrLVH5+/zbpQ5
	NlmTx8LMPmP01nqL8EW7bnitlaO/DAO6I0T80Bju3MLY+UoD8q0Li7ZB+Ha3QPDq0XbYIRfcSjw
	GtPqKsgbkhe3wqy/B8Yt1iVK78+EQfaMHczzssP68KjsOkk2WSyeE193BMSNmlxh2mB52jDbACF
	XHqcYemq5p7nCXviM7T6zzLy3HD2Dyk6VsaTdgmqOzjK7VZwHUq51kzsse2jqnPR6hZ4OiYGXbT
	RgTJVfu0HJlbF1kPs1P0CSE2HeLJtO9gfK2+CBwoLvB3znGoGr7iBmO/kTQNkmWNcTtygisRPPr
	Wx2bFFjz2KcxGbr1r
X-Google-Smtp-Source: AGHT+IF4Jlt2QDiei0JDT0YVWn9adcZO9qMwWDinm6xPhvNP3a25MLMFZSlajNLltiKpdAK3V8gtEQ==
X-Received: by 2002:a17:907:94d0:b0:ad8:cd31:5c31 with SMTP id a640c23a62f3a-ae057a6d22cmr544529066b.11.1750767760957;
        Tue, 24 Jun 2025 05:22:40 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/3] iommu: omap: Simplify few things
Date: Tue, 24 Jun 2025 14:22:29 +0200
Message-Id: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWYWmgC/43OwQ6CMAwG4FchOzvDOjbAk+9hPBQosAQY2ZRIC
 O/u4GK4qMe/Tb/+C/PkDHl2iRbmaDLe2CEEeYpY2eLQEDdVyAxiULEQgvvZl3bgY1hWHXF0jef
 G9v2TA6HQUABITFi4Hx3V5rXbt3vIrfEP6+b91SS26T/qJHjMZarTikhlCvW1MwM6e7au2b7sB
 Aj4RZSyxiLJdJHAgdiaTfBpE/p8oyBQCmWJBeQ6T+FArev6BnZF73tRAQAA
X-Change-ID: 20250111-syscon-phandle-args-iommu-2ea162b223a4
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RvFdNy6eRq3jk+TGzSf8jssUcNniJlHcLRIQMwrb/Io=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpiHrbqzI4XtvWNg1LD7hn/LUZqgGqbo4sCCr
 Zd0WoSazmWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqYhwAKCRDBN2bmhouD
 10GoD/98RHydJ68XUE8URRl8Cvud7c5JUY4F8J8UvqOe0IHaznPrl6ENd2e+5imRRDCKx60zez0
 lBvmfvH0frs1Escs7BrTcDT0b7GijKtMUsIFDrIq5QfEPY0cge1hijJXgPsrXz7aAEtXUevetcf
 +Htv7A1ovlxGVVJSJHqCELxOj3kxH92Se8HKhrADEUt7NHOq+wPwjh6BxHstmdgUqnBGhcbaGAP
 l2V1xQ1aeHO6zsWhE1wikgp+ELRz29G+A7VBz6DS1VFp0NA1y+1S3DApBPF9Ej5LxegzaePFUJO
 bjwEUHo+GW+prxw5Q29539xnPMP6cwwt3AprX9Mc3Z9R/JmRE6doEiTLu8V/qihWajenLuu7S4K
 RZbeuY3nDmKuPzurPU+GJl2/DbospvmYNBndkl4QqpewpB6xS4pDCc5DRheDv6nnwOpz5aA5N7H
 +Z595DGPrElY7rSDw8ZaCD8NRK1KE9qEcWwDNlsq/ZBCTWxhiaYdZ1jmJKcSuCSLLbmjHnxiz+W
 AcTQOr314cVPQ8+cZNzHyWcxfHj8V6H7R+GjcjQFDR9viZ7sBu+jBQ3RFRZMtcOoeqyHsekkxND
 cGxfkKfQpvNaABGRY+aloO3BMlOwhVRvFWsITX4aDwJVVLNM6L0DUYJZA1Uw/Pg2bphuN9VtOxb
 OmjDc18i3BBuuhw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v3:
- Rebase
- Link to v2: https://lore.kernel.org/r/20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org

Changes in v2:
- Combine patches #1 and #2, add dev_err_probe() and drop the comment
  (resolving Robin's comment)
- New patch: iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable
- Rb tag
- Link to resend of v1: https://lore.kernel.org/r/20250212-syscon-phandle-args-iommu-v1-0-c3fab486b426@linaro.org
- Link to v1: https://lore.kernel.org/r/20250111-syscon-phandle-args-iommu-v1-0-3767dee585a6@linaro.org

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      iommu: omap: Drop redundant check if ti,syscon-mmuconfig exists
      iommu: omap: Use syscon_regmap_lookup_by_phandle_args
      iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable

 drivers/iommu/mtk_iommu_v1.c |  4 +---
 drivers/iommu/omap-iommu.c   | 24 +++++-------------------
 2 files changed, 6 insertions(+), 22 deletions(-)
---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250111-syscon-phandle-args-iommu-2ea162b223a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

