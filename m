Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D8519DF6A;
	Tue,  8 Apr 2025 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104687; cv=none; b=YRfOg31EKoZ53yEh3tGjuc0QexTYvDEutpNsv/7a0OlEvDcEaoAv5eNd4QijkudH/WnyQYykXohbM0CHRxJ5G7dmDipr4TmfyqTOgkQXy7v1GxTscFBdFO377zQIQgyREPngKsg8/9h5wjm+Bbhs+zulgucv7T9zSN4xqJ20dAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104687; c=relaxed/simple;
	bh=fpS5YVGWTZPYEvvgYngxO5KAlSIpOZYP/lYTQ3HP9fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARaSApRG1bH4XtwiuL5DJBTZd8owC76w8MWRy6GPHSKjnRl4MuTinymha+oGvs1H0JV1b3M9J1Nk7H77fhDUvNrTqtbj1v/ku2UrLnU7o8SCyeMbbAdgujcI6yC72NXxgMErHP+AkF1xuJdJrxBEGmnobsmd3luTo+MWW7MZBZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=FxVZ/rqt; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=R3gfoDma reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="FxVZ/rqt";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="R3gfoDma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104685; x=1775640685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XuzX/2B1C//+iENy5p338mtpUdEXVW/pOaBatY9uies=;
  b=FxVZ/rqt9xf3v1V6Y4JbkLPHX9Tky38k2wSKYyEHpS1XNlG5AOlYUsP1
   FYWJa9Y3edPg45JrltZUSQN/+qid5lpuS9iKe5HmrDZxyMMlxI5IN8d3l
   6xmPSpC5B49Afvj7GzT2uTjzChGB94LehHX8FrI1IsATq8xBsh4zfxXhw
   Ydq7GhIh48wwhMHi0tqe53kejYo2+AGYcjQzA1R0ma9uSUPsJJJvqreAs
   hPnnNquyQOcAvW9Nj3l8YVv1hHs79Xa/PsDgZVK8jdEVuC2JAYGNn9hUc
   GQbJ/80yW1llxQs8B3DyT1xw5rK5Q4dz5NIIlZcXfNdSH+Zm4mspL8hFZ
   A==;
X-CSE-ConnectionGUID: VfUTMTCzT3OxDhSHcKVeSA==
X-CSE-MsgGUID: ZU9egV78T3OwARYeZLf/nQ==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397361"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:21 +0200
X-CheckPoint: {67F4ECE9-41-2417938-F0170C2B}
X-MAIL-CPID: 347FCE5F84C88B12D126220E1586B139_2
X-Control-Analysis: str=0001.0A006375.67F4ECE4.0018,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CFE3169020;
	Tue,  8 Apr 2025 11:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuzX/2B1C//+iENy5p338mtpUdEXVW/pOaBatY9uies=;
	b=R3gfoDmaIlSg78xQmb6zDI7KMcTVk6P53HNG+DINOEY+pO8oVe3RHOzCu64+dnexA43FhE
	+NeGPiM7AM62JELdyX2D1+04eV14hW4Iwdc1Y9kOzD/LdPC+b/Kv9IT/nsM46VFdBmiVkl
	gIn9beq05AaPU4FpTjt8dV9ju47CIQq3wXLIU8UEt2y7rDOv/BRNwz0eyLbXSx1JNGoYK1
	smp3vWI+xY3d3a+5PNg/Q7TocgcRQDJBwjSQdfGdqSas/179RX8lwqxLdx763x/uY9uj5l
	CF4iUFfhLaPHpp/rXoJtKhe2aPNtzeg1jmiJ3PLzuvEUE94B7kPUSLknKWdbFg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/7] ARM: dts: ls1021a-tqmals1021a: Fix license
Date: Tue,  8 Apr 2025 11:30:48 +0200
Message-ID: <20250408093059.551700-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

With commit 784bdc6f2697c ("ARM: dts: ls1021a: change to use SPDX
identifiers") the SoC .dtsi specifies the license using SPDX tags.
Fix license according to the ls1021a.dtsi this platform DT files
are based on.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts | 2 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 34636fcdfd6ad..27a55fa638128 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright 2013-2014 Freescale Semiconductor, Inc.
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
index 1b13851ad9970..f7fe8581a23fa 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright 2013-2014 Freescale Semiconductor, Inc.
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
-- 
2.43.0

