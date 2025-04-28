Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5724418CC15
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830214; cv=none; b=ujEE9RZywHCgqejfO/1ZgZuor9j/whr/neU4+cGSIWApkfb3DacRL0QZ5u+1qVbcvWxWZl69zKa1Yktf5wCo0peJTS2j6r+nX0B5MS/bhsQnYbs1mWdSr+j3FzHSOjCtnrT3UGZ+x7lIrTaO+ufKtE005wp4ls+f8B1MXvmsMpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830214; c=relaxed/simple;
	bh=Lsdqd6slK8yIoftJSFtfY5uw27VXZs4Ue1D0rA2Dk3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=hJ9sSV1qpLrUgsR8Nc7x0KFtZyR1EzUzXJNQnRlvH7vvrP/GYwPpIV2dCpOCSrj3nnOUcJPYSmk8AMRR5s8BaWkwiUy88tquVKl1REdE5V5qA10rAlKxAM71+LZfL1o8jlYwQDVMbo/Qaax6VmNySFIjVudujKahkBHqIZeqrPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Rca96GAA; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Rca96GAA"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S10wD1009691;
	Mon, 28 Apr 2025 10:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=U11p1IY2aK2v6bA7NuFH2S
	koo0U6MbsQxOYKzBo9dzc=; b=Rca96GAABPkgMmwgmIBMQrb/IQ1Cv5krsECLbv
	rUneOz0zCUfLj/67KK7Jna7nwOGVQabWLi3O7RQaJI5v4pxD6/locx+iOzZmeH1N
	c8YM0bq8CmYWxkV8rbYlUvIrzfD1NDIQEjam9RtzLYk1/siPSBfJptyg6L7swnkz
	MHRAZuqijtfz/7Xx2nsp/H/7f5poxno9jaS3+3BR1kGA++jSn6ss14p5orJ6CTM4
	1uQpJoiNJqYyZBs2EuqTalCEcZQk7YP+Xnez/YvUC97idlH6rv8Nuv1FW4bLSikj
	XFu5XALQn+3Ybli6cVF3azxuTfH5G7YBlhYfOkCVtQ/dtlLQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg5pda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:49:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E8BDA4005D;
	Mon, 28 Apr 2025 10:49:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00C32A3B91A;
	Mon, 28 Apr 2025 10:47:44 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:47:43 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 28 Apr 2025 10:47:35 +0200
Subject: [PATCH v9] arm64: defconfig: Enable STM32 Octo Memory Manager and
 OcstoSPI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-upstream_omm_ospi_defconfig-v9-1-66c1bbac5461@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAKZAD2gC/x3MQQqAIBBA0avErBPMiqirRITpWLNIxakIorsnL
 f7ibf4DjImQYSgeSHgRU/AZfVmA2bRfUZDNBiVVK5tKijPykVDvc9hzHGm26EzwjlZhFrS6M0s
 tlYZ8iAkd3f99nN73A+OtOFttAAAA
X-Change-ID: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01

Enable STM32 OctoSPI driver.
Enable STM32 Octo Memory Manager (OMM) driver which is needed
for OSPI usage on STM32MP257F-EV1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v9:
  - split patchset by susbsystem, current one include only defconfig related
    patch.
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..288b3beff20246c59b497fc869c5f366a21b089a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -580,6 +580,7 @@ CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
+CONFIG_SPI_STM32_OSPI=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
@@ -1520,6 +1521,7 @@ CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_FSL_IFC=y
 CONFIG_RENESAS_RPCIF=m
+CONFIG_STM32_OMM=m
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
 CONFIG_IMX8QXP_ADC=m

---
base-commit: 1990c01f0bcc5655596709d0b8cf4e412b4c837c
change-id: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

