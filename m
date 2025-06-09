Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038CA2566D7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466337; cv=none; b=mVEmIhcJRrcIsM2A3p8jde11fak1x4VbN75TPIZ4LCFmKNAkVg2Nq88VDWSSyX6o2D2awGY/cWXGjnsBz0vTQPC95F9PWso9K2+27Rz4p0DdfME+r3BssRL73iXZBShEShtfCir6YpnX08V28XLTG7QRiVabeuLClNkhfC/KJjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466337; c=relaxed/simple;
	bh=ZDtM21/VpYgUVrvDvFCvhbVFgnDB7/qixYXvJx5tN8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkkHnQgD2kpr85w0NoJ1rdnJEFp4OgdXPR99xIIisXw7sLfJNNUgTZ7T6Vgy0R7EyME/B5ZzgSSlUgFkSRe3K1rLv4MJ7pAibGz0sDcqdADEd8+8mGaouVXDdghy2RP8OKNTw59JQq2Y8Ea8J7Do/1tZzrELp7HnurDMU69F67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaTz+2TT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaTz+2TT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559A0njJ029980
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 10:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPgT8D4IPTgaAa3s6UuMsQfkwr2chND+bSAhzKGs8QU=; b=kaTz+2TTUluP90gA
	qb9bfQgIP0wW0hGU3JlT/vLppkNQR67FLVqXxBuPRuqfnyQhOZP4NcMsF/PbBTqt
	YZDhuAMryCkvy4o/Sku6P11w4w5E0pTL262yT19N6n7kuiTu5Wrncy42gwyF3bz7
	Lu+hvPUbMASH0L91vY6gHhE8L2KrkS5hEsx3SToZF00AG7jLRdKgrd8rPofuenl4
	26dwj2pJ/o2Oou4sMJY6KdMwG3BGlAotuUSfQaqRa7miYAWEI+w5yKsRq4WNXVOG
	K0B0TvIZG14yB/0P4B8nITsBYRhRXpTugwAP8LlBc6NSDGmr98nT9adP51dFQ4pQ
	QBLbjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9nwr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:52:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so27339805ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466333; x=1750071133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPgT8D4IPTgaAa3s6UuMsQfkwr2chND+bSAhzKGs8QU=;
        b=AnLyTfQCgPlPawER2YTCApFbTiZ+IbEco6PTJ7S5xVdseF4wJp2PvfLvZPf23NX/xT
         MDeUHalvVhaKuQULQdb/a0UYggWspR4Y0CPwyjz3itaGHdgYzH9Z2Dn2uBI3dDPNt9pZ
         5o8mkI87fCwKm97Og9r9H0fh6XA0oSGb/ZNaLS7c/TasVKGSaN370mYPEl0eK+3d1F8n
         dom/gj2XSYGglFUN1ZW6+5D7/1g+IonB+nibWTEbUfPHyRkYUIRbCXTvI+mFna6HPP9q
         GRwdDsDdtHFKCsPADvCGP+zspVkqG2zQsoBcl8tkmUOVAxknYzFQHW21NXRinnzq+rCn
         xJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeGCXfevvK0Upu+zCymJGV7fTFIbzVKInhwflUHE2RYXMAs9qJX372Oh5g7bq6yAQMxGe+GjRDV10YDJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD/ObEE9CYKesRWAr771cfyn0OQbS/iLIdIfU8vbpl0q18Mskk
	kzj3jXNHCLEfjXaCQ064WCBW5quzs0jRoqVuBgqr8bkf0xxsWw8mz9rY+ecvo4XkCMR51PUARk4
	SbGVdz7IMCLPRmdtPMb9uoKXmUhcCzWqQrN5dNxyDMN4wO5FKbADo6yfrWDilELxD7JQ=
X-Gm-Gg: ASbGncvMwyP7ZaUB1FO+lwFbSEApm42UbZ1BkBkX/lQ1eTkb59ezsTZE3VXBLbuQEdA
	GFMmal4gAI0ElCsUSqCXpOxBJOVu6N0qJSJzal40Fe2FxkSv6/MwfrWglpjnam2Rvg66CoM3U0x
	l4NGjvIrGpvxmpWQAu1MV7B6eBgstqbezRyhJQ3GIf8tw6yCB2KJnvVIOPKTctaP6zOfnR0bwNC
	vulN+u1uBtehjDxu86c05XosoaaM8TYPlxy8znnsmOITd1rNwY6Minw7VKJnqBmkhPyjBtGPkxu
	NOy2WJxQqT9me38oRZH/82S0RTUwQQonIGvNbu1ytya+IaM2aiDuC9hQsg==
X-Received: by 2002:a17:902:db0f:b0:234:f182:a734 with SMTP id d9443c01a7336-23601d24a79mr172681445ad.31.1749466332587;
        Mon, 09 Jun 2025 03:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo/wXnrK3iji5yZk8aH4OcOGyMUm+fPqYmD5eHGzL0faoq492bZ37GElru7QLbpXFgJf0IYw==
X-Received: by 2002:a17:902:db0f:b0:234:f182:a734 with SMTP id d9443c01a7336-23601d24a79mr172681045ad.31.1749466332182;
        Mon, 09 Jun 2025 03:52:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:27 +0530
Subject: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=1156;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ZDtM21/VpYgUVrvDvFCvhbVFgnDB7/qixYXvJx5tN8c=;
 b=LirUNXKSmX3ebHFBXXCn4igrV12r9SfiTvWKTR2nB6rgsDGG8kxtC4uNmZtMHaceWbMcscgcs
 fEN00pM7t4NAA6x0mbb4IpyHc7lmWammFasxXqtmtx8STYc7YUguKj6
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: kliGX6yGc5Uef_dm7X1Xgt_LRoz3vKKl
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846bcdd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kliGX6yGc5Uef_dm7X1Xgt_LRoz3vKKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX41jRgTS78BhV
 YsfXoYpCZLWx6gXTiu3diWZ8dDrOhA1YdpaVCVoiWK5uB9NWGTq3FmuUhIJB5PvY92gH0acelzY
 6E0AUKfrYzEITzpC5BqJOHh01i+NsEiIoc+RZrUAnjmibYbhBIBNsOHQ6UiTmgeCsGYMS4TZ/fW
 hETPvLMmxnuJqRC2+uOtRgzlnKKMjysaV7xtlD7oXjmjJXqbFftMY8escdvT6OCFLMd3pe4Gd6b
 XR2chcrot5ECGLD5gPXXZ2MMP+fwzRkKrpJMJOWtE8SU56w5q53aVp9bew1rAW+3+V77hWXrXCk
 czaGJxN+bLlUGK6LnB+v1XJi+QWw6lKxOln/FajGA86571EL9Y6gjpyOlkQvAVwN7plkYa6HP4d
 be/Jywjbs5JpvA2bGRsit2gxLYz28bpPSLlEQ5z6+yW8Q1mmRFKACkDWpRFzixZERiECCnjy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=923 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090082

ASPM states are not being enabled back with pci_enable_link_state() when
they are disabled by pci_disable_link_state(). This is because of the
aspm_disable flag is not getting cleared in pci_enable_link_state(), this
flag is being properly cleared when ASPM is controlled by sysfs.

Clear the aspm_disable flag with the requested ASPM states requested by
pci_enable_link_state().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d..0f858ef86111b43328bc7db01e6493ce67178458 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1453,6 +1453,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
 		down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
 	link->aspm_default = pci_calc_aspm_enable_mask(state);
+	link->aspm_disable &= ~state;
 	pcie_config_aspm_link(link, policy_to_aspm_state(link));
 
 	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;

-- 
2.34.1

