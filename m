Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD32417E2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 23:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738884550; cv=none; b=Ey1uKHDAgZGUlnqv/JclkAvmJAJQnH0X1i/th0geXoHy7eSDZrSHPCHGYmuzOlZfLsyxUYN2OGRp/WsIsxxqcnJ/GqnxZZSVWGyrfZv0Mg9H2j6axNeOyDgzMkNu4jrs/addsk8X3sgawajKnRGF9UkPsN5QdanaPRrf0LDGNuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738884550; c=relaxed/simple;
	bh=oxBfLTZdXL8ZaQ+RGvvB79FuQ4Hav3x0rRtUrfoL094=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jy+NvRXaowYIgpDoyYx++A4kg1Qrwf1UfYQ0H5YD3xtJ3Fe08PW02o8cvHj2+Qs2y7O9vzKJxskMY3fGicNm5ETKH6DHn4fVlkuPkK5V0D/whQHmXfWszVHe1KS4dIQs1YEGm+hV0Zxy7KA32N103BSJenf6MKdMDrqmLwv/0zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptIgSLPK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptIgSLPK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516L9ZC6021824
	for <linux-kernel@vger.kernel.org>; Thu, 6 Feb 2025 23:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dpZ6su+P1oYF13MEsL4+5m
	JyK1Vwo2Uj6+roerGXEPE=; b=ptIgSLPKx0SQetApTgqxDoRw1g11h/SZLJyyzU
	miZhdv0iC2frHFQAFgC7CQ04oQZva2HU/KDgzZzHirOQfS6gsRCw94Dn7pU6XQ3Z
	pOkOH4t4Snjl1+t1XeMxQAwRpbSu1fDGX1YSkRi0vGsYviGYnv6k+tEwH10oCDia
	BhGSkUt0xOPV2g00ekBn3Rx4tKq/qm0YWuS6uNvAI0VJ8aJbYQnjEgg1MpH/Cc/W
	fB0Y8IJceij5DPupF+I0RGhiNCzk9vlb3xVr5GwUO9TcYF8VUHILuDSQjMTCtNj7
	xF4dGswtyyXK9r56JhBVxRU8m2aogaVgB8WE7FuEmfPZTpoA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n4rh088h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:29:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216266cc0acso51486245ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 15:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738884547; x=1739489347;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpZ6su+P1oYF13MEsL4+5mJyK1Vwo2Uj6+roerGXEPE=;
        b=FEHxzGbYY5bvoyqGnO3ot4ogEToBLQnfzDg6JBDO9Rm0+pOq9SZhebtddDD+uIkpir
         uS96KhOfcL+hbCSjXFCizM/UD+jwUXMbgaMgbvl5HkXGcfx/IP5xCZzYsWSP+RRJTWZz
         Cr4erwdwi/O2lJGyVICfwdSokBzrM07q5RGppOKJ7E5tEr/VOr1aKA8GvGYhAkTanole
         66VSHAVsGs0ePm7ZrPSulZg28xkDglvoJSDyTV3a7Li5R+vcLcFK2eoWQgHPKEVR2sro
         20WfkNiY01+JUhK/G+SxoxXdU7jDB0HOV2F8JVTHk6sPRg6243Czsj10lu9xz/r1bUy/
         kYnw==
X-Forwarded-Encrypted: i=1; AJvYcCUftE9QgJEPKEIr/jHp11wyXCfuLxYEJx+qJRYHyLHjCtg2h8+j5PsQ2EdlwjCVX1CUQeLGGDzRUo0SAYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZFSvQq/hmlF3F7YtKdOnlYijVJNDl8fVGlfqekM7K4yDVP1Km
	DTnTgwBwcXnj3WAStFtJ0wF2sDmeGNjD8d3NGsRGiqbg2KDFZHjx5d01Tc0UGivHbWKYooAPv+K
	DYN9REdSZPvsaq4oMHDbaluyV35Nye/bPcCNm36pdtvhJATzeL4vG8vy6QJ+pImE=
X-Gm-Gg: ASbGncugibGHe7yxPT8sWAVpmNzdbJ7vOrECbrn6hRbFExTIspe4bPO+lExoFnLTH8M
	HKnfLOG7ZBzujwSTa4FhPeCufQkR2N4oewtzejNpcdhEkoHzp+tlbbAV04Uqf9CTKn9NNfTyLTZ
	7pCEpVPAamOSG8Ioi+ux69GnWftJf1Pl1U0DUNJ+mbwz6VlJkp2ZoTSpWZWtVtZHzVS8Wsfs+9R
	d6aZDAxTVCdP2k0X1vbXZIV4m9SLhpdiVDe2Y8190/by2rSod9XVIBpaQgGE35U33xxsMy0JTRe
	fEwvOL9MA9EVHN45Hnv4u0Xkoo8DsY0ss9J3OnbA
X-Received: by 2002:a05:6a20:6f06:b0:1ed:d780:feaf with SMTP id adf61e73a8af0-1ee05290924mr1616904637.6.1738884546622;
        Thu, 06 Feb 2025 15:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxmXBVvH1fpX/BdAfjS95c5Q07NgLnx+DigG5tdrqzE17uXKKnHeKeKCiQd7KexJ11AQqGoQ==
X-Received: by 2002:a05:6a20:6f06:b0:1ed:d780:feaf with SMTP id adf61e73a8af0-1ee05290924mr1616872637.6.1738884546221;
        Thu, 06 Feb 2025 15:29:06 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7f6esm1845905b3a.74.2025.02.06.15.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 15:29:05 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 0/4] PCI: dwc: Add ECAM support with iATU configuration
Date: Fri, 07 Feb 2025 04:58:55 +0530
Message-Id: <20250207-ecam_v4-v4-0-94b5d5ec5017@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALdFpWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNz3dTkxNz4MhPdNJPUJMskC0vj1NQkJaDqgqLUtMwKsEnRsbW1AP1
 9uXNZAAAA
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738884540; l=3998;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=oxBfLTZdXL8ZaQ+RGvvB79FuQ4Hav3x0rRtUrfoL094=;
 b=Qwbi5zyvH8rfmT+Wv3pa+qBkexhAhioDvey0+mkUJGVmlYr5Ium09a000b1HakE9EEh7+5Ui5
 8SRakNl3nMaBTQTIqBljjJpePvZtBFjYwRdTSL1aZmP64DeCHXeLGap
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: L6TyF2vxTr24T7rF_koLhK81D0c2VQur
X-Proofpoint-ORIG-GUID: L6TyF2vxTr24T7rF_koLhK81D0c2VQur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_07,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060182

The current implementation requires iATU for every configuration
space access which increases latency & cpu utilization.

Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
would be matched against the Base and Limit addresses) of the incoming
CfgRd0/CfgWr0 down to bits[27:12]of the translated address.

Configuring iATU in config shift mode enables ECAM feature to access the
config space, which avoids iATU configuration for every config access.

Add cfg_shft_mode into struct dw_pcie_ob_atu_cfg to enable config shift mode.

As DBI comes under config space, this avoids remapping of DBI space
separately. Instead, it uses the mapped config space address returned from
ECAM initialization. Change the order of dw_pcie_get_resources() execution
to acheive this.

Enable the ECAM feature if the config space size is equal to size required
to represent number of buses in the bus range property.

The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
gives us the offset from which ELBI starts. so use this offset and cfg
win to map these regions instead of doing the ioremap again.

On root bus, we have only the root port. Any access other than that
should not go out of the link and should return all F's. Since the iATU
is configured for the buses which starts after root bus, block the
transactions starting from function 1 of the root bus to the end of
the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
outside the link through ECAM blocker through PARF registers.

Increase the configuration size to 256MB as required by the ECAM feature
and also move config space, DBI, iATU to upper space and use lower space
entirely for BAR region.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v4:
- Update the commit messgaes and do minor code changes like adding
  export for the api, adding error message( mani)
- Link to v3: https://lore.kernel.org/all/20250121-enable_ecam-v3-0-cd84d3b2a7ba@oss.qualcomm.com/
Changes in v3:
- if bus range is less than 2 return with out configuring iATU for next
  bus & update the logic of ecam_supported() as suggested ( Konrad)
- updated commit text and update S-o-b (Bjorn Andresson)
- Link to v2: https://lore.kernel.org/r/20241224-enable_ecam-v2-0-43daef68a901@oss.qualcomm.com

changes in v2:
- rename enable_ecam to ecam_mode as suggested by mani.
- refactor changes as suggested by bjorn
- remove ecam_init() function op as we have removed ELBI virtual address
update from the ecam_init and moved to host init as we need the clocks
to be enabled to read the ELBI offset from the PARF registers.
- Update comments and commit message as suggested by bjorn.
- Allocate host bridge in the DWC glue drivers as suggested by bjorn
- move qcom_pcie_ecam_supported to dwc as suggested by mani.
Link to v1: https://lore.kernel.org/r/linux-devicetree/20241117-ecam-v1-1-6059faf38d07@quicinc.com/T/

---
Krishna Chaitanya Chundru (4):
      arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
      PCI: dwc: Add ECAM support with iATU configuration
      PCI: dwc: Reduce DT reads by allocating host bridge via DWC glue driver
      PCI: qcom: Enable ECAM feature

 arch/arm64/boot/dts/qcom/sc7280.dtsi              |  12 +-
 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 142 +++++++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.c      |   2 +-
 drivers/pci/controller/dwc/pcie-designware.h      |  11 ++
 drivers/pci/controller/dwc/pcie-qcom.c            |  77 +++++++++++-
 6 files changed, 218 insertions(+), 27 deletions(-)
---
base-commit: 92514ef226f511f2ca1fb1b8752966097518edc0
change-id: 20250207-ecam_v4-f4eb9b893eeb

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

