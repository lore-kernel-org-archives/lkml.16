Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F4C231845
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709330; cv=none; b=g1jZpQ/23fNWH9hojDuwnotAMxKiSEHqIMFuOlgrNFgNy/wEmbclM8fNLxcnVm80Y3ZFHaMuMycIRdL4OSkjMBCFu0Q8Rch+hwQRbLmUhKV7k5DQmlJ077vPzC02FlPDDYgBLmp9pGpOjcGeW5rQYzoiQpoCgu8SKCQ33/Tz5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709330; c=relaxed/simple;
	bh=JGeBWNQ7SOUaSfLmBoBeYMzuXj2s3WsyaN23v9zFEIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BPoy2j5cHs3fBA8Fqhx3jvZpAvVJNG71G4FTIoXS3ws6Vr/MJ0HGylKt8ioleXEnvzIVZSjlqCexo6ucFgua4t2zHKRvM4OUZaimUKgz9TmUwkx/tO1VwMSJRksjQ/jn+SeBtV7gjPpTtZaaRx6T3/Ew7c6sjEzoQAwvV7ye9XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSH7ScJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSH7ScJx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5654eNXY025077
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 09:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6uo0/Rv3qtzptZevcC/+w1
	5cuneDye/jL7LkgBPk7SA=; b=FSH7ScJxAEIYvmIVyhGLFFdiHL7pQvofNPM+bS
	Uty1FCC1AhWh7mvB3VVR1olAS3SKXHmGWY5k8NkK/zCt3vHV9wg169GNAX/eFPxn
	I1HrutFf9XxX/W1FVxxcUnIBKEzI+taaW5wD+cGgdYPqj9jxRmhy36RlwfiBsHww
	Ym3uX+dFHuaa/4EvNUgFgu52xHLcRPdkaKpHdzPbCHpotLczatASZyY8HKSUXZQA
	zbktXuX0Y6MivF24NWAQVWOPGwYzHi4G7lwtwsKcskSJPJF4qDiYHlCDG5zRRLqj
	mtPTRizcXGXMFOU9Q9I+PZ3GV7zxiTkoYFGDZhjLMLXquKvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q0fbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:55:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cf6c53390eso93279485a.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709326; x=1752314126;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uo0/Rv3qtzptZevcC/+w15cuneDye/jL7LkgBPk7SA=;
        b=EL7nwAFa3GF3c3YTvNTkBP8n6CoBbaapEnfxG30ZJcrLy0Nd3XB4D3DoSjsm8BEOyr
         OiBTtSql63Y7S+wPRQDuK8Giq7EIbPWvdKSYCPpHGbEXPTTj8pcjQRjtwELl/QRJZO7k
         TCrOLmvsVEH2VBas9KXXjwnqAgF1kDIXYDimzig7z2sqy/tOUSwF8+5DOylMGwUbx2GI
         upOxlkI9SvHoxlb9aOg9LL2mCb/63QyKCxHEgiQqDkbe9fRH4pnoi44g/MZwqEfiBtvu
         lx/lp+WROYZOMvNmSuChNnZZT558HE3HLSA7O3Ce9hf2Ldz6uY01+5kmLoa04ZSxCIXa
         dCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAkJbPQ/6EKsfTnw19d4RD7xxff7tUJbk6Y+QrBVrO/F3HCmReHjTIozZMkPMCYlSpDXAoebrky05e8Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmhY3XSHUvNnJCpKxg7kmfW4MOwPvQlBVKPZ6mtz/dO4cuNkel
	6ZNPuH9Wq8uwXYCcHQfP6qiOPPEqCWVnp5wmFtXyfD2rSUz3TI90XrmfLI7nmsnKhThKzjAaT86
	SCsqxJXL9aUzCGt7v5Sld1gvRDeLoktSIDYn+Q7tVZSQrYSGg6sYBeLmnyeOUjgFUR/nbUtgxS3
	Qdnw==
X-Gm-Gg: ASbGncuiDEfh5XPjzPqjEax39RU5Y0MrlgKDLmVit62e94+2vgydjp8ylfUkig0dUG+
	gBZMs9wwEbJ+vYKQ4F9y6gb//cj6DgZo4Zb9nNSX1P2rByyHQqKQjpIGi1UmJ3GE/Q1bIk0iuqt
	7tawYXx7RM4gcgTSVlt1K31i/5obBABAJqJ8qnq014yyJC5YfmOqxwb+qSjxmdJi0fvbUN3A/xu
	TOjsvV+rOWWsBS8fCgaC1lKwgJCyxGnbO3P6MEGW4GX1YohTx0g/7l9tWumxrP+IutnOqeF3Z2L
	ZXee7ziEUxTIFZDhddWKrzwlgajiVETKhWY74vUgmTtJV2C2VG67prgTo4VDeFGMa7YhSp+WKWf
	jX+SaubbM81MG1c7sOMRz6/7Evc8tI2U7GQk=
X-Received: by 2002:a05:620a:6082:b0:7d2:18a1:cd5 with SMTP id af79cd13be357-7d5df161e03mr588111085a.29.1751709325647;
        Sat, 05 Jul 2025 02:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE8KfDhqB/NbaCPKYqo7Ux5mkzFzkMX+HPMqyGTeNSITo2+WSahMj1k4Q92D4imbOcrfQKMA==
X-Received: by 2002:a05:620a:6082:b0:7d2:18a1:cd5 with SMTP id af79cd13be357-7d5df161e03mr588108885a.29.1751709325150;
        Sat, 05 Jul 2025 02:55:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ba7aesm524758e87.205.2025.07.05.02.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 02:55:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 12:55:19 +0300
Subject: [PATCH] iommu/arm-smmu: disable PRR on some of SMMU-500 platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIb2aGgC/x2MQQqAMAzAviI9W+jUKfgV8aCuag/T0aEIsr87P
 IaQvBBZhSP0xQvKt0Q5jwymLGDZp2NjFJcZKqosdWRRTu8vXOXBoIotUWPNbFxNDeQmKGf1/4Y
 xpQ8xpLz/XwAAAA==
X-Change-ID: 20250705-iommu-fix-prr-600451b1d304
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JGeBWNQ7SOUaSfLmBoBeYMzuXj2s3WsyaN23v9zFEIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPaKIp4CP7PdrUdGM0f7ikogTsm54Xj4B8Ly/
 667pqXwivCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj2igAKCRCLPIo+Aiko
 1TcMB/0YzadNI5OfscFm2/tsfVF/roOdhAwrj2xq47UPIKm2lX84xxhCD9BUPSpvpa4CI14tkuG
 BDFllzG6FQ4IOkM3QVwgMUM/xSZoyRYtkYerIWS0kw+RvSNM3wBc+KAr5K+yCVaB7QDbkUje64C
 z3oWcyjdHQ11J089A7Kpq4Iq3tQqAWM0VOOm6r6FyluezFKGfa2FbrjjI41HQatMghTbKoMXZm1
 vM3yX40xhnuP4dQhVCEjv5bl+DGcJN3tPXfGrNy8LnkTYip39OG7yf4TY3Q186q56OEkCH9nd7K
 eYhDOR7EUhoAD5GuN0ijtzp/s6MrFqBQ/vAbtLk5+bOJ/rVi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2MyBTYWx0ZWRfX+/IF+Pi69A/s
 0wJQ6Ld/tVZY3MaCDkijcw5Iy0+eH0sP0803Gp+UZ60GtvdVyouznJmgfafFI5mBNzPJXheAr9l
 LtCV+K6ocNKoCJf6gTOXRaHsJ0PF0ET5rCRWWuno+H1WKQINX/m04A7NdqWmBekhoB9uKxV2U5a
 9GybSDezZzfu1CKKDjQf6fFUNM+BphXS+QnLVekzT3JBjIzW9A9Bi3QlMk9Bv2CFUFca8se1sQX
 zg9OZRtsmMeLyuRoiuHG8/khRqY8VK9G0VGUpQ5X4fkIebL6iUWSoTF58PZsvLu75bxt8iasxHl
 Vf+zERq3UtIaWY0LhvKQaq0vP4wBnNKO704PmP++fGew+C/VgxVoJuy/xwfdTZtI03K9ua2crn/
 9PRme87PtTsZwtzQmpoQYYgXLbejql9EqlEtHuWwPK5C/w+RHB6R8RVgFyrdSEy7cpn8MDKB
X-Proofpoint-GUID: 9ifrXHX5N2iGE3cAmmAhDrVRYz7zpJA4
X-Proofpoint-ORIG-GUID: 9ifrXHX5N2iGE3cAmmAhDrVRYz7zpJA4
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=6868f68f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XLurikqG2CS-mm0B5QcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050063

On some of the platforms (e.g. SM8250 / QRB5165-RB5) using PRR bits
resets the device, most likely because of the hyp limitations. Disable
PRR support on that platform. Instead of adding more compatible checks,
set PRR-related callbacks through the match data, making it easier for
other platforms to apply the same workaround.

Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
I currently don't have access to other devices from these generations.
It might be necessary to apply the same workaround to other platforms.
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 134 ++++++++++++++++++-----------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  11 ++-
 2 files changed, 91 insertions(+), 54 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..f1cb30cd99af6020a8b472f11d4999ad70d0bce0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -55,6 +55,11 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 	return container_of(smmu, struct qcom_smmu, smmu);
 }
 
+static const struct qcom_smmu_impl *to_qcom_smmu_impl(const struct arm_smmu_impl *base)
+{
+	return container_of(base, struct qcom_smmu_impl, base);
+}
+
 static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
 				int sync, int status)
 {
@@ -313,9 +318,9 @@ static void qcom_smmu_set_actlr_dev(struct device *dev, struct arm_smmu_device *
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
-	const struct device_node *np = smmu_domain->smmu->dev->of_node;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	const struct qcom_smmu_impl *qsmmu_impl = to_qcom_smmu_impl(smmu->impl);
 	const struct of_device_id *client_match;
 	int cbndx = smmu_domain->cfg.cbndx;
 	struct adreno_smmu_priv *priv;
@@ -351,14 +356,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->set_prr_bit = NULL;
-	priv->set_prr_addr = NULL;
-
-	if (of_device_is_compatible(np, "qcom,smmu-500") &&
-			of_device_is_compatible(np, "qcom,adreno-smmu")) {
-		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
-		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
-	}
+	priv->set_prr_bit = qsmmu_impl->set_prr_bit;
+	priv->set_prr_addr = qsmmu_impl->set_prr_addr;
 
 	return 0;
 }
@@ -558,65 +557,89 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static const struct arm_smmu_impl qcom_smmu_v2_impl = {
-	.init_context = qcom_smmu_init_context,
-	.cfg_probe = qcom_smmu_cfg_probe,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.write_s2cr = qcom_smmu_write_s2cr,
-	.tlb_sync = qcom_smmu_tlb_sync,
+static const struct qcom_smmu_impl qcom_smmu_v2_impl = {
+	.base = {
+		.init_context = qcom_smmu_init_context,
+		.cfg_probe = qcom_smmu_cfg_probe,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.write_s2cr = qcom_smmu_write_s2cr,
+		.tlb_sync = qcom_smmu_tlb_sync,
+	},
 };
 
-static const struct arm_smmu_impl qcom_smmu_500_impl = {
-	.init_context = qcom_smmu_init_context,
-	.cfg_probe = qcom_smmu_cfg_probe,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = arm_mmu500_reset,
-	.write_s2cr = qcom_smmu_write_s2cr,
-	.tlb_sync = qcom_smmu_tlb_sync,
+static const struct qcom_smmu_impl qcom_smmu_500_impl = {
+	.base = {
+		.init_context = qcom_smmu_init_context,
+		.cfg_probe = qcom_smmu_cfg_probe,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.reset = arm_mmu500_reset,
+		.write_s2cr = qcom_smmu_write_s2cr,
+		.tlb_sync = qcom_smmu_tlb_sync,
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
-	.context_fault = qcom_smmu_context_fault,
-	.context_fault_needs_threaded_irq = true,
+		.context_fault = qcom_smmu_context_fault,
+		.context_fault_needs_threaded_irq = true,
 #endif
+	},
 };
 
-static const struct arm_smmu_impl sdm845_smmu_500_impl = {
-	.init_context = qcom_smmu_init_context,
-	.cfg_probe = qcom_smmu_cfg_probe,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = qcom_sdm845_smmu500_reset,
-	.write_s2cr = qcom_smmu_write_s2cr,
-	.tlb_sync = qcom_smmu_tlb_sync,
+static const struct qcom_smmu_impl sdm845_smmu_500_impl = {
+	.base = {
+		.init_context = qcom_smmu_init_context,
+		.cfg_probe = qcom_smmu_cfg_probe,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.reset = qcom_sdm845_smmu500_reset,
+		.write_s2cr = qcom_smmu_write_s2cr,
+		.tlb_sync = qcom_smmu_tlb_sync,
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
-	.context_fault = qcom_smmu_context_fault,
-	.context_fault_needs_threaded_irq = true,
+		.context_fault = qcom_smmu_context_fault,
+		.context_fault_needs_threaded_irq = true,
 #endif
+	},
+};
+
+static const struct qcom_smmu_impl qcom_adreno_smmu_v2_impl = {
+	.base = {
+		.init_context = qcom_adreno_smmu_init_context,
+		.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+		.write_sctlr = qcom_adreno_smmu_write_sctlr,
+		.tlb_sync = qcom_smmu_tlb_sync,
+		.context_fault_needs_threaded_irq = true,
+	},
 };
 
-static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
-	.init_context = qcom_adreno_smmu_init_context,
-	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
-	.write_sctlr = qcom_adreno_smmu_write_sctlr,
-	.tlb_sync = qcom_smmu_tlb_sync,
-	.context_fault_needs_threaded_irq = true,
+static const struct qcom_smmu_impl qcom_adreno_smmu_500_noprr_impl = {
+	.base = {
+		.init_context = qcom_adreno_smmu_init_context,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.reset = arm_mmu500_reset,
+		.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+		.write_sctlr = qcom_adreno_smmu_write_sctlr,
+		.tlb_sync = qcom_smmu_tlb_sync,
+		.context_fault_needs_threaded_irq = true,
+	},
 };
 
-static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
-	.init_context = qcom_adreno_smmu_init_context,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = arm_mmu500_reset,
-	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
-	.write_sctlr = qcom_adreno_smmu_write_sctlr,
-	.tlb_sync = qcom_smmu_tlb_sync,
-	.context_fault_needs_threaded_irq = true,
+static const struct qcom_smmu_impl qcom_adreno_smmu_500_impl = {
+	.base = {
+		.init_context = qcom_adreno_smmu_init_context,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.reset = arm_mmu500_reset,
+		.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+		.write_sctlr = qcom_adreno_smmu_write_sctlr,
+		.tlb_sync = qcom_smmu_tlb_sync,
+		.context_fault_needs_threaded_irq = true,
+	},
+	.set_prr_bit = qcom_adreno_smmu_set_prr_bit,
+	.set_prr_addr = qcom_adreno_smmu_set_prr_addr,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 		const struct qcom_smmu_match_data *data)
 {
 	const struct device_node *np = smmu->dev->of_node;
-	const struct arm_smmu_impl *impl;
+	const struct qcom_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
 
 	if (!data)
@@ -639,7 +662,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	if (!qsmmu)
 		return ERR_PTR(-ENOMEM);
 
-	qsmmu->smmu.impl = impl;
+	qsmmu->smmu.impl = &impl->base;
 	qsmmu->data = data;
 
 	return &qsmmu->smmu;
@@ -686,6 +709,13 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.client_match = qcom_smmu_actlr_client_of_match,
 };
 
+static const struct qcom_smmu_match_data qcom_smmu_500_impl0_noprr_data = {
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_noprr_impl,
+	.cfg = &qcom_smmu_impl0_cfg,
+	.client_match = qcom_smmu_actlr_client_of_match,
+};
+
 /*
  * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
  * special handling and can not be covered by the qcom,smmu-500 entry.
@@ -712,7 +742,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm7150-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_500_impl0_data },
-	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_noprr_data },
 	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 8addd453f5f1c9659fbfbc68a84a3ab1267b356e..e805ad604339463b706a43e359ccca657d42a602 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -24,10 +24,17 @@ struct qcom_smmu_config {
 	const u32 *reg_offset;
 };
 
+struct qcom_smmu_impl {
+	struct arm_smmu_impl base;
+
+	void (*set_prr_bit)(const void *cookie, bool set);
+	void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
+};
+
 struct qcom_smmu_match_data {
 	const struct qcom_smmu_config *cfg;
-	const struct arm_smmu_impl *impl;
-	const struct arm_smmu_impl *adreno_impl;
+	const struct qcom_smmu_impl *impl;
+	const struct qcom_smmu_impl *adreno_impl;
 	const struct of_device_id * const client_match;
 };
 

---
base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
change-id: 20250705-iommu-fix-prr-600451b1d304

Best regards,
-- 
With best wishes
Dmitry

