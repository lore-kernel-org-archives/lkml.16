Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BB256C83;
	Thu, 10 Apr 2025 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277402; cv=none; b=HuNuUKk7ShRzaMbhXH0E7tuqPGN2YJMRS/kGm0VKC7WLQYON83qMptGRx96QB7Bfw4xKLl3NWAIPkQMYfQJ+uEwXZqRBO7UdOFUhgrDUfr1YhyT24k1+Eflkbe4osqej9t+i3GWZqpDh6PPaB8b0zc4DO+WLabZxZKhXpkX9Zos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277402; c=relaxed/simple;
	bh=quCNk1faeQKjRAEpgmno53rSVnZoYWSifrHmScTLPzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J+iOIjDylA1HrGQoPgP1lOTWCDHAeXLXevgDAo5T7Z8s5hzKT7DwVw7LPZPKFzQ9/H4iLi6v9MU1Kr9bccGg8j5VWXZc2Ld4KVfi58Jkb5957lpoA4+Aid/Kpo4hn4RLb/jOJl4LxjUJcITiE/TWEAaegaZKLLUw6lqMRBzXRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EL459TaF; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EL459TaF"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A6W10I025695;
	Thu, 10 Apr 2025 11:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hJlHhbxitP8LDlQxS4M+ZJIc/lDJOqTIWiKvF63v4os=; b=EL459TaFDja+X1hu
	RLsh+oeSI8eFue8E1CMOqDPtV6pCd0rzBmKC9ndvg9x0nFeo3gm1QRYOpU7+ikNK
	LhZ0vcXrcR8xeRHeLcXCM4VzD2UELhu4nhfSk/OBr5sSxJl0fWLwYLJlxMPyLERE
	UXsWIljsR+SQREIIGpohPzW0HEuVFOeeImjTQhA6Dm+OLXLrjZRNRdb4FEcG8Jn1
	zTXMk0gRSQjfnpk6UdH1HafDTZIbfmd4jjVhFL/TTgVD56wNx9LK96Ljcxoqb+Si
	SLsSWU7ocW/Xi3vOcT5AgJ/Nz66vSjcCdX0o7pbycCzK9hXmbdq5k36ZILC/IJhu
	2YAHdg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw2h6wg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:29:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DC34240048;
	Thu, 10 Apr 2025 11:28:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3329B9A69FC;
	Thu, 10 Apr 2025 11:27:51 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 11:27:50 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Apr 2025 11:27:44 +0200
Subject: [PATCH v9 3/3] MAINTAINERS: add entry for STM32 OCTO MEMORY
 MANAGER driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-upstream_ospi_v6-v9-3-cf119508848a@foss.st.com>
References: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
In-Reply-To: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01

Add myself as STM32 OCTO MEMORY MANAGER maintainer.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..32abd09c0e4309709998f91882c7983d1b53a80c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22881,6 +22881,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-stm32*
 
+ST STM32 OCTO MEMORY MANAGER
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
+F:	drivers/memory/stm32_omm.c
+
 ST STM32 SPI DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-spi@vger.kernel.org

-- 
2.25.1

