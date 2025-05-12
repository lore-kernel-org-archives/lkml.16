Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3822550AE;
	Mon, 12 May 2025 06:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032021; cv=none; b=Dqz4Nx6RG5Nj1Vhv/amhM4B8ogrRuFF4JGjND2XXvGsoNXfaucGVa64dti+B2T1WVe1IWO8b9QgiZ2pMgntF56gVRimwbVWeugWzsGlkfuTs/cqUVTNbdgdB2C85wTwO1hrKt10t1bcgQqeL6i/mOhBcni8fET+29zptAGapoBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032021; c=relaxed/simple;
	bh=6FEozqC4uF74o1AdmgOn6U/NWk4EQrvRnEAFCbr4JRc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=p27+0Uc3hOtAZSnXxsEIAhGL0YAciOkvwb+7wgCjLaVOQa3O9HRWkKovDFpFSEQOOmyI4ionL6H5YNfuE2mBp1VpmVltl9TvNcKHCjgu1KIvnbMaVI98sbebDbzvZIcsYVtXZlCY14lQi0xq8Yr7Ag/nYJi65qzR6BCK9QJWJW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HW1wDHX4; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HW1wDHX4"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMG0Xq027496;
	Mon, 12 May 2025 08:30:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=xEvO38UxR3TTkIts3bIi48
	jhoAAjtchguqrU+RI62HM=; b=HW1wDHX4Qlx6OJht/bWKC3Dh3vYO6re6KsO+Uv
	nhTdTTAG56fDwHJlLcO+pF7yyrht76c95x9kMlQW8GkMD3pVtvSyaNVPz6sPm5z2
	aAHhopqPiEMs9KHQpq+MdoDXAZUBJAa3cgNoADHvrvnDYFK9dE+4tIvgkAeuUl9L
	s7dOOJ6CGd7i22GhPnshQmTHZUnozxt73ZOLzbyQjoiuoDMr3V1u6KuIaDuqQQ1y
	D3pFABosKN3dlA2AvD5ScLzuFkp2GpOG/5OdEZ11kFqyOV2a4q3DdvPvL9it0uZS
	49vZZPsEmVuuQvr5OtzNHvXS0e/S6HxwZjTdcKj1g66VW8YQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46jgc437yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 08:30:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E6FF64006D;
	Mon, 12 May 2025 08:29:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D124A4B610;
	Mon, 12 May 2025 08:29:38 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 08:29:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v10 0/3] arm64: dts: st: Add SPI NOR support for
 stm32mp257f-ev1
Date: Mon, 12 May 2025 08:29:30 +0200
Message-ID: <20250512-upstream_omm_ospi_dts-v10-0-fca0fbe6d10a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqVIWgC/3WNwQ6CMBBEf8Xs2ZJlA2o9+R+GECiL7AFKupVoC
 P9uJV49zOFNMm9WUA7CCtfDCoEXUfFTghyPB3BDMz3YSJcKIKQSixzNc9YYuBlrP6boLHUX1WD
 R2rNzSFwSpO0cuJfXLr5XiQfR6MN7/1nst/0Z6fLHuFiD5kQlUZu3aIluvVfNNGbOj1Bt2/YBQ
 ZZHdL0AAAA=
X-Change-ID: 20250410-upstream_omm_ospi_dts-04b97cc02e52
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01

Add SPI NOR support for stm32mp257f-ev1 board by adding:
  _ Octo memory Manager node in stm32mp251.dtsi
  _ OSPI port1 pinctrl entries in stm32mp25-pinctrl.dtsi
  _ Add SPI NOR support for stm32mp257f-ev1.dts

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v10:
- rebase on top of next-20250509 to fix DTB warnings.
- Link to v9: https://lore.kernel.org/r/20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com

Changes in v9:
  - split patchset by susbsystem, current one include only DTS related
    patches.
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com

---
Patrice Chotard (3):
      arm64: dts: st: Add OMM node on stm32mp251
      arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
      arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 54 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 32 ++++++++++++++++
 3 files changed, 137 insertions(+)
---
base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
change-id: 20250410-upstream_omm_ospi_dts-04b97cc02e52

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

