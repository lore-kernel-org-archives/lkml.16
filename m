Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC2524500E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673480; cv=none; b=nBFbXuPILk7+w24Wm6TAPTbH/NcACCx+cLj19CcEeHsxr93WhCdb3PTQxXh6dHwxiEgoOSPzYZv0kXKO3lrY6Lx4wlu+Xd2XrljGYL9mPCADuQSX/v5CKhlA1FE4lzVKPzixwdctX+C8DVVnSGwmmdUJgx1qmfuCB1UX+OcoKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673480; c=relaxed/simple;
	bh=tvNgtlGvnFOszr/ZtpqsOaEmuzi1gJuz4eAo8q+Ei5M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=cNue+yYsPYlzEsxIr0PvBELvx0HwvK41CRoikQ6KaI9j+gZkyqNpJXnNYvhZGu9Dat3KHvCM1JJntIXIWbvrGkrJwAU9S0O1WqRQIbyKwOhj7r2/bDMJ+vwtId1DucewVGHz3adT7/3GcLEGjPmdZrGzLgBmZwl48mob2af0M0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=m6FMzYYs; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="m6FMzYYs"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250403094431euoutp022d23874e6a3b906b5fb69df75c164ae9~yxci076jr0298502985euoutp02a
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:44:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250403094431euoutp022d23874e6a3b906b5fb69df75c164ae9~yxci076jr0298502985euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743673471;
	bh=y9G9MUG9DOc1uZ5WKtQOjEgCXiNWPK+QYyIpZCzngsE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=m6FMzYYswm4JLVO0Yp15gpIt6BptqFfhGwcDRBpmn1Hn2fH9hXaYEc0KGb0ypM7JQ
	 1h2Hy9zxvB5i9z23/byNron+lLJzOVbhiwT5HhnM1wg9k51zBJbrknipaS6De0Ne86
	 ihc8MhXgo6+XwXkyGY9g/ThorCPQwuvocfct5wT4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250403094431eucas1p19c31006cd90ab2c50f40ce7c802573c4~yxcibnPDY2581425814eucas1p10;
	Thu,  3 Apr 2025 09:44:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 79.93.20397.E785EE76; Thu,  3
	Apr 2025 10:44:31 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250403094430eucas1p21515d7f693708fc2ad0cd399cb0b81aa~yxch6_uH51408514085eucas1p20;
	Thu,  3 Apr 2025 09:44:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250403094430eusmtrp2ac6b311646012c10afdb6ac5bd5b41dc~yxch6AdC31352013520eusmtrp2i;
	Thu,  3 Apr 2025 09:44:30 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-f4-67ee587e6ff5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id B0.FF.19654.E785EE76; Thu,  3
	Apr 2025 10:44:30 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250403094429eusmtip21d7935307107ee4f08337db645936e5a~yxcg3ryH82665526655eusmtip2e;
	Thu,  3 Apr 2025 09:44:29 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v7 0/3] Add T-HEAD TH1520 VO clock support for LicheePi 4A
 GPU enablement
Date: Thu,  3 Apr 2025 11:44:22 +0200
Message-Id: <20250403094425.876981-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEKsWRmVeSWpSXmKPExsWy7djP87r1Ee/SDV5cZbJ4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	WP91PpPFxVOuFnfvnWCxeHm5h9mibRa/xf89O9gt/l3byGLRsn8Ki4OIx/sbreweb16+ZPE4
	3PGF3ePeiWmsHptWdbJ5bF5S79Gy9hiTR/9fA4/3+66yefRtWcXocan5OrvH501yATxRXDYp
	qTmZZalF+nYJXBmf5kxnKlglVXHq2m+WBsZlol2MnBwSAiYSs4/3snUxcnEICaxglDi39T8L
	hPOFUeLno5esEM5nRomj/yeywrTMb38GVbWcUaLp1Wao/jeMEtsnTmYBqWITMJJ4sHw+WLuI
	wB4mie/ffzKDOMwCqxglnnz7yA5SJSwQLXGhbxsbiM0ioCpx4vsBZhCbV8BOov3aEmaIffIS
	+w+ehYoLSpyc+QRsAzNQvHnrbKia9ZwSa28wQdguEq9fXWaHsIUlXh3fAmXLSPzfOR+qJl/i
	wdZPUL01Ejt7jkPZ1hJ3zv0CuocDaL6mxPpd+hBhR4mzF/oYQcISAnwSN94KQlzAJzFp23Rm
	iDCvREebEES1msTUnl64pedWbINa6iGx8vpBsGeFBGIlzs38xTaBUWEWkr9mIflrFsINCxiZ
	VzGKp5YW56anFhvnpZbrFSfmFpfmpesl5+duYgQmy9P/jn/dwbji1Ue9Q4xMHIyHGCU4mJVE
	eAu13qYL8aYkVlalFuXHF5XmpBYfYpTmYFES5120vzVdSCA9sSQ1OzW1ILUIJsvEwSnVwMTi
	PPkHh2ZKqfO/3xNVeNSmu3Ry8cUJ3QjUXCjE+f/RPr5Ll4vXds+aeOqXzbz1c7VO3Pnhyu/D
	7+z7pjD3naP7BOHdnqeT2pOebnvGdpa1d/eqta8P1thM7lHvOiq5zaay4N7Ek4c1+w6mf3kQ
	znPrpk3KlqtFbLa3TaLXhy43/Si4ab/ZH2sWsZcfpG59Mq1im2x75b+W5NxUwT7Xddd9/85u
	CNGUEIgXVvpx9fqbtf9PMbBdOvX1rPP9H3esb2n+ZPMUn1sTJHHG8/r7hEOBm1uk+zNUvgVI
	OobJWIqv+pi+4aOd/cxX96+7Bgd9F5sXuEJD7tHDuOiU9LmbPgeme5y5yLP1Yq3xRderXkJK
	LMUZiYZazEXFiQDbd8sABQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xe7p1Ee/SDY4el7R4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	WP91PpPFxVOuFnfvnWCxeHm5h9mibRa/xf89O9gt/l3byGLRsn8Ki4OIx/sbreweb16+ZPE4
	3PGF3ePeiWmsHptWdbJ5bF5S79Gy9hiTR/9fA4/3+66yefRtWcXocan5OrvH501yATxRejZF
	+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehmf5kxnKlgl
	VXHq2m+WBsZlol2MnBwSAiYS89ufsYDYQgJLGSU+7OOBiMtIXOt+yQJhC0v8udbF1sXIBVTz
	ilHi+u5esASbgJHEg+XzWUESIgIXmCR2rVvNBOIwC6xjlJiyfQeQw84hLBApsSofpJ5FQFXi
	xPcDzCA2r4CdRPu1JcwQC+Ql9h88CxUXlDg58wnYfGagePPW2cwTGPlmIUnNQpJawMi0ilEk
	tbQ4Nz232EivODG3uDQvXS85P3cTIzBGtx37uWUH48pXH/UOMTJxMB5ilOBgVhLhLdR6my7E
	m5JYWZValB9fVJqTWnyI0RTovonMUqLJ+cAkkVcSb2hmYGpoYmZpYGppZqwkzst25XyakEB6
	YklqdmpqQWoRTB8TB6dUAxNz1yPe+nvtNetvs5yX2WPjeKYvIy3t2FOTjXznj0/7Fzh99WJ2
	MyvvzUZ/ywXXy7XteuW4o0OHmeVcUUjBbIkK7oNsTy6cO3zfqjiTfQLf/HXubwWTNCuDLyh+
	naQn/rbXpiPzl7RSwpLm9xe7FLdyVG4P/iXxqjv11/NFe30t952a/M6r5q8986qoq4V/W86t
	vL5DO9F9ucqX5af0myyrDRL+8x2RjG8JXMNs0r90yblPkwxuN77kdJh2Kkhztdqb/0eeP6o9
	HfDkoJyuxz+m5z3pByJP3TepmPqjVmrV+mnnbZLuOruZzQv8uuin2rZlvd2ffxyRaZPYorq1
	TNM3ozVy+ZP7Av77ZOLFqjqUWIozEg21mIuKEwGS1Nm2WgMAAA==
X-CMS-MailID: 20250403094430eucas1p21515d7f693708fc2ad0cd399cb0b81aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250403094430eucas1p21515d7f693708fc2ad0cd399cb0b81aa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403094430eucas1p21515d7f693708fc2ad0cd399cb0b81aa
References: <CGME20250403094430eucas1p21515d7f693708fc2ad0cd399cb0b81aa@eucas1p2.samsung.com>

This is a subset of a larger patch series enabling the Imagination BXM-4-64 GPU
on the LicheePi 4A board, which is powered by the T-HEAD TH1520 SoC. While the
full series includes power-domain, reset, and firmware changes, this part
focuses solely on the clock subsystem needed for the GPU and other VO (video
output) blocks. By merging these clock patches independently, we prepare the
groundwork for future GPU integration via the `drm/imagination` driver.

The T-HEAD TH1520 SoC features multiple clock controllers. Initially, only the
AP clock controller was supported upstream. The patches below add support for
the VO (video output) clock controller, which manages GPU-related gates, HDMI,
and other multimedia clocks.

Bigger series cover letter:
https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/

v7:
- remove commits 3,4 from the patch series, those would handle empty MEM clock
  stub, and reset management. It's not necessary anymore, as this would be
  implemented in power-domain driver
- added the device tree patch at the end for the SoC maintainers to take after
  the other patches get OK-ed
- added Acked-by, from Connor for the dt-binding patch
- re-added Reviewed-by from Krzysztof, as the dt-binding patch is the same as
  for the v5

v6:
- squashed the "dt-bindings: clock: thead: Add GPU clkgen reset property"
  with the "dt-bindings: clock: thead: Add TH1520 VO clock controller". As
  a result, also removed the Reviewed-by from Krzysztof, since the new
  resets property has been introduced, which is mandatory in the VO
  case

v5:
- introduced a new macro CCU_GATE_CLK_OPS, which allows providing custom clk_ops.
  In the case of the 'MEM' clock, it provides empty clk_nops. Later, this clock
  is provided to the GPU node, thereby avoiding any ABI breakage
- used the CCU_GATE_CLK_OPS macro to implement a workaround for de-asserting
  the clkgen reset only after both core and sys clocks are enabled. This
  sequence is required to properly initialize the GPU

v4:
 - enhanced documentation for new Video Output (VO) clock inputs in device tree
   bindings

v3:
 - reworked driver to support multiple clock controllers through .compatible
   and .data instead of using multiple address spaces in dt-binding. This change
   allows to re-use the driver code for multiple clock controllers

v2:
 - removed AP_SUBSYS clock refactoring commits (1-6):
 - instead of refactoring, I opted to extend the current driver and its
   associated device tree node to include support for a second address space.
 - resolved all checkpatch issues using --strict, except for the call to
   devm_clk_hw_register_gate_parent_data().  The current implementation remains
   preferable in this context, and clang-format aligns with this choice

Michal Wilczynski (3):
  dt-bindings: clock: thead: Add TH1520 VO clock controller
  clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC
  riscv: dts: thead: Add device tree VO clock controller

 .../bindings/clock/thead,th1520-clk-ap.yaml   |  17 +-
 arch/riscv/boot/dts/thead/th1520.dtsi         |   7 +
 drivers/clk/thead/clk-th1520-ap.c             | 196 +++++++++++++++---
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |  34 +++
 4 files changed, 223 insertions(+), 31 deletions(-)

-- 
2.34.1

