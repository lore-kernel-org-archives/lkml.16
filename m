Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128BE270EB0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744975383; cv=none; b=pQoqeKxtrVare+eN+ZadW1NB/loem5tcxmbZQWpbsXFWcjhrFMY5rr4UMhF9qKH5VOWMLqbn3D6QtY9JzGUPAqCswA5zhUy//pqv/iCooiUZ3s3SMNfQxInX6D7/z7JmOvfq5tnX880n//RRRJrQDPQ8VrrkSnnkfsm2JDIhGr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744975383; c=relaxed/simple;
	bh=YSlhGz/IYhgom0CSfIafTOnWszwkmu5raYX20ezQIGY=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=cvcdjy5WFT5rGxJvvCXJQoaHGf84Cggs/ykmUJJuIjPaFu7nNbyUA2T+Yd9ucskXWSlqeXv9KSk7VmtwO4Z0bkabVKAtqYALBAfyPUZyRRmLbUnV6ykG6aINvR0W4QC6M4yD3fYdqEsnlWwWgkj+U6D3AVr02uomTwesm3wMxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DySKQtJL; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DySKQtJL"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250418112259euoutp015aca64c30b8a4a01567a6cc30b04bf5b~3ZdzDMJcW2291422914euoutp01g
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:22:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250418112259euoutp015aca64c30b8a4a01567a6cc30b04bf5b~3ZdzDMJcW2291422914euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744975379;
	bh=ZOC3KnBcOzae7WQU4KMIVqJoLn7EUTSmtgD/622dHGo=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=DySKQtJL7rHS8UtBfDsyQY6s8rTIhFSr+Ycr+wjOXPcZaVFOJfpACUs7QRQM5ZINK
	 F67M/oqFNd6+rwztUQkHS3SD6WheLeJoraTtne00/xOyTysrABnpT6y1ESbOOTLbNV
	 L7jlIWb4ivqd/VMLaDaxioC34uO4UkPNGBVDuwms=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250418112259eucas1p28e48a553570ac9612d2f4a7645c0b89f~3ZdynUtNP2066920669eucas1p24;
	Fri, 18 Apr 2025 11:22:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 9A.25.20409.21632086; Fri, 18
	Apr 2025 12:22:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250418112258eucas1p22817a5693654e02016bcdc79068ed9e0~3ZdyK2mU40304303043eucas1p2h;
	Fri, 18 Apr 2025 11:22:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250418112258eusmtrp1e5caad80908c5cf0fef28d13db641597~3ZdyKElRx2607526075eusmtrp1o;
	Fri, 18 Apr 2025 11:22:58 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-12-680236120e15
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 18.3D.19920.21632086; Fri, 18
	Apr 2025 12:22:58 +0100 (BST)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250418112257eusmtip28247fec2aab8af8277a856d94b010572~3ZdxYwxVJ3259732597eusmtip2W;
	Fri, 18 Apr 2025 11:22:57 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 18 Apr 2025 13:22:48 +0200
Subject: [PATCH v6 1/2] dt-bindings: gpu: Add 'resets' property for GPU
 initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-apr_18_reset_img-v6-1-85a06757b698@samsung.com>
In-Reply-To: <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
To: Frank Binns <frank.binns@imgtec.com>,  Matt Coster
	<matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>,  Simona Vetter
	<simona@ffwll.ch>,  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,  Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPKsWRmVeSWpSXmKPExsWy7djPc7pCZkwZBssum1ucuL6IyWLN3nNM
	FvOPnGO1uPL1PZvFuqcX2C1ezrrHZrH39VZ2i8u75rBZrD1yl91i/df5TBYLP25lsViyYxej
	RVvnMlaLu/dOsFj837OD3WL2u/3sFlveTGR1EPTY+20Bi8fOWXfZPXp2nmH02LSqk83jzrU9
	bB7zTgZ63O8+zuTR/9fAo2/LKkaPzaerPT5vkgvgjuKySUnNySxLLdK3S+DK+HLpL2PBPo6K
	CT8bGBsY57B3MXJySAiYSLQ8/MHSxcjFISSwglHi4coHzBDOF0aJExdmM0I4nxklds+fxwjT
	8m/LF1aIxHJGiUNPnrJBOG1MEvMWr2QFqWITMJJ4sHw+mM0ioCqxZOEEsIXCAhESP95fYgOx
	eQUEJU7OfMICYjMLyEtsfzuHGSLuKnHv12Gwek4BN4lJN5+xgywQEXjJLHFh3RKwm5gFTjJK
	LOw6DHWTqMTvybvA3pAQOMwp8f7rdaiEi8SqKf9ZIWxhiVfHt0D9LSNxenIPC4SdL/Fg6ydm
	CLtGYmfPcSjbWuLOuV9Ap3IAbdOUWL9LH8SUEHCUeHNPDsLkk7jxVhDifj6JSdumM0OEeSU6
	2oQgZqhJTO3phdt5bsU2JgjbQ2LprgPMExgVZyGFxCykkJiFsHYBI/MqRvHU0uLc9NRio7zU
	cr3ixNzi0rx0veT83E2MwDR4+t/xLzsYl7/6qHeIkYmD8RCjBAezkgjvdB2mDCHelMTKqtSi
	/Pii0pzU4kOM0hwsSuK8i/a3pgsJpCeWpGanphakFsFkmTg4pRqYHI9IT97cr/5P4LDjjIP9
	zW/95nPJCGW8uhEms+fm/j/9yZ8VzsuskZ567PPmqQ6yQkX7NnlNEpj5tWs3g2FT/u9P8ZuD
	ZQ/djDguvSWo48EB/zTBwxmLppmskHA16uTlt0+st7652FP7p9Nlh2zmOJX0jf9P8Cnwrdt2
	Jdchpj/lpMG3NE/rwLyyVc9f7Vy7s05Du/i51N5Pz7hzLVIDBfiXlNa9WqMWX1Htqcx84vmJ
	sIodMfPUZvxK5GHocru1tijUZJXm7uYDxz8mKNya2bo3fea3yEDlb1Kn9jK/nC37XFeUXeTV
	8qNbW54Z9DH+zDESUpRxe6l7PFZX9dD9pSz9/nfFNaw6yjf/Sb6oxFKckWioxVxUnAgAvwaq
	0PIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7pCZkwZBq9/SFqcuL6IyWLN3nNM
	FvOPnGO1uPL1PZvFuqcX2C1ezrrHZrH39VZ2i8u75rBZrD1yl91i/df5TBYLP25lsViyYxej
	RVvnMlaLu/dOsFj837OD3WL2u/3sFlveTGR1EPTY+20Bi8fOWXfZPXp2nmH02LSqk83jzrU9
	bB7zTgZ63O8+zuTR/9fAo2/LKkaPzaerPT5vkgvgjtKzKcovLUlVyMgvLrFVija0MNIztLTQ
	MzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL+HLpL2PBPo6KCT8bGBsY57B3MXJySAiYSPzb
	8oW1i5GLQ0hgKaPErK2XWCESMhLXul+yQNjCEn+udbFBFLUwSdxf8BMswSZgJPFg+XywBhYB
	VYklCyeATRUWiJD48f4SG4jNKyAocXLmE6B6Dg5mAU2J9bv0QcLMAvIS29/OYYYocZW49+sw
	O0iJEJD9dmMtSJhTwE1i0s1n7CBrRQTeMEusfPCNEcRhFjjFKDFh6lWoD0Qlfk/exTKBUXAW
	knWzENbNQrJuASPzKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMDo3nbs5+YdjPNefdQ7xMjE
	wXiIUYKDWUmEd7oOU4YQb0piZVVqUX58UWlOavEhRlOglycyS4km5wPTS15JvKGZgamhiZml
	gamlmbGSOK/b5fNpQgLpiSWp2ampBalFMH1MHJxSDUzlv+K3KL7e0lsdeG1e+FaBy8sFjmi7
	usy+pLHtenoCe+Tv2AZJ7te7dW8tNi3MPnzozuPLzZwrrc7KuLnp6j7+/cs+tGXt7TTrDY/5
	NvTWSnae8L13jt9iw8JzXi7NlbkvGXRmNs97WhbXk/p7v2bG9uybgoYNtgfOqMVMVpm1Tvlt
	r6j9DherIP4HQTcXWMz8VbfEpLpWbKeg3RvORZVs6+NWcyZ3PLzw/exHLdWSmyJzDp71r/m8
	q3zDtg/vvu7flOycbVnJ8kZ+46Y1FypFhThM7WKU/jicV31XomlYFeNiyLvNZnPZGpkv27R+
	2h68uL5N4qbljYkWvht7Vee8uV8yS3c3a+vG29vY529RYinOSDTUYi4qTgQA6D+foXcDAAA=
X-CMS-MailID: 20250418112258eucas1p22817a5693654e02016bcdc79068ed9e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250418112258eucas1p22817a5693654e02016bcdc79068ed9e0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250418112258eucas1p22817a5693654e02016bcdc79068ed9e0
References: <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
	<CGME20250418112258eucas1p22817a5693654e02016bcdc79068ed9e0@eucas1p2.samsung.com>

All IMG Rogue GPUs include a reset line that participates in the
power-up sequence. On some SoCs (e.g., T-Head TH1520 and Banana Pi
BPI-F3), this reset line is exposed and must be driven explicitly to
ensure proper initialization.

To support this, add a 'resets' property to the GPU device tree
bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087fa0d6081f771a01601d34b66fe19..bb607d4b1e072dacd184bf2782cacddf550580e4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -37,6 +37,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.34.1

