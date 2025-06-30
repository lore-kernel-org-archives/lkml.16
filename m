Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071371C36
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273183; cv=none; b=hkLymnU8/odRQMWRVfk6bf1+Gy0R+uMHvifqNFBPJm55MgAsft/4LxL0GK5RphMMC3QG2fnPaWDJfcO2/xe8vd/dYtb4g0FFiAR4scIbBAaCudYOn3loyZ3Yt+42GqrFqy4BSexEz7srOLSngxsqfa5pYwTe13MfB5kZXFQszWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273183; c=relaxed/simple;
	bh=4LUJ6548+InMpbqKv8I7giovimJrk+U7GLv94JQ0oVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=TSw4mXQNXp100Ju4uvUOlahNJTEmGYaGnQ9pvU2D3I9Xu0OvaMbxk/eSvRMRAv1NmWwxwAfejrB/4AN8HWctgBJkMTKhbK7o30d59bM9SN7YOHGj0yWeon3ak/6WaLSyxyx4DTb5Hm+koX9VN2ZGqyDk43M8XfbvBJnGMFkMjJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KR7LCM3T; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KR7LCM3T"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7kOF8012015;
	Mon, 30 Jun 2025 10:46:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=3743PsDYmw0FuLo/fDLEYD
	EF4/6D0ibRvsDao899kPc=; b=KR7LCM3TpS8rrysblkmnP0SsTAj5hWXjCqEK3k
	Kb84t80ZltEIFeC+UTyns52nSFbgHL4pwMX7YRaPYLwEZQP5shnlHqyytIVYhKn9
	wDIk/549yBVXDkJ29IQCIzvTGbvpMErWqRC72lXguhEtSNcJzZmk/8DMj+mhONpK
	4gT3RUUxQYZkvtDmVDwu36Npc6SRuMBTjbkbzX5V2q6rjUEoo59bDUuuh4KIfZvF
	R88DMLdX8Zpww3/kP//zqRPA2DlBXLxoqjz2hoA079FTBmDZsZEd1oC/gF6EKK9D
	kiQ9DeWEcefHJRA0QMIqSfk3bvtxq5ATTpPL9WmDBQFKU4Vw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy4m3w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 10:46:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E244440045;
	Mon, 30 Jun 2025 10:45:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CF34644565;
	Mon, 30 Jun 2025 10:45:08 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 10:45:08 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 30 Jun 2025 10:44:53 +0200
Subject: [PATCH v11] arm64: defconfig: Enable STM32 Octo Memory Manager and
 OcstoSPI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250630-upstream_omm_ospi_defconfig-v11-1-6e934fabe698@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAIROYmgC/32NQQ6CMBBFr0K6tqStgOLKexhC2mEKs4CSDhIN4
 e5W4trFX7y3eH8TjJGQxS3bRMSVmMKUQOtTJmCwU4+SuiSEUaZUhVbyOfMS0Y5tGNN4prZDD2H
 y1Etw2NkLuLMyVqTCHNHT68g/msQD8RLi+3hb66/9dc31b3etpZZVBdo5C2VR6bsPzDkvOYRRN
 Pu+fwCWCjADyQAAAA==
X-Change-ID: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01

Enable STM32 OctoSPI driver.
Enable STM32 Octo Memory Manager (OMM) driver which is needed
for OSPI usage on STM32MP257F-EV1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v11:
  - rebase on top of next-20250627.
  - Add Alexandre in recipients.

Changes in v10:
  - rebase on top of next-20250509.
  - Link to v9: https://lore.kernel.org/r/20250428-upstream_omm_ospi_defconfig-v9-1-66c1bbac5461@foss.st.com

Changes in v9:
  - split patchset by susbsystem, current one include only defconfig related
    patch.
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2211c385195456f8609edfad40202002df0abb5f..978bcd554ee18b0fa1975a984b9eb9058727df81 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -582,6 +582,7 @@ CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
+CONFIG_SPI_STM32_OSPI=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
@@ -1528,6 +1529,7 @@ CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_FSL_IFC=y
 CONFIG_RENESAS_RPCIF=m
+CONFIG_STM32_OMM=m
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
 CONFIG_IMX8QXP_ADC=m

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

