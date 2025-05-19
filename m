Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4553270561
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647780; cv=none; b=qH8XnmbZu+4sLME9kqy3KjHN4lcnCqH89ERsCV6yDWHoqFqq4Om5D6aORUXLl7BG17H8iLZar3W7r5UWO8USBfx/W0XuX6Q9FgH4wot6J7y56LsVPrqwzZ9+zgB+WQq6ejU2vpeQMSK2r0167p5UArea61MrOXAdsBNCn8tsA64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647780; c=relaxed/simple;
	bh=MfTQ3eSGE1lsQsEKDfhk3n4vHJQjv6X96tSeWcGlv9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdQsgdJLGqfLPE6VecDH2bYUZV7dQknh1Bmshq4G5F4KPkviVAvX3H1LBr3xqca17GI62omuZOKnMIX7cwseLHwXbqzHaNGbBKsR0UQiXt8x6YVwl77WRc45jYHPm/5fTcnuwd3XCFCdxgh/xlTg0RyVOJzFrbzYLb/ljnNVcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKKAZkPI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKKAZkPI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GiGJ023369
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1/73SEf4ytXoZ1yrIlcLZ+v5wHcPMuVTgw0lx2XQTo=; b=kKKAZkPI6RNDjmuv
	H7XiYRa14vGzrsv8xoWeuBl5p9PkYLjXZjfgj2farMRVSOKTrJvtAcSUOyZIA2Tk
	gr5SDApVc0yZ0cBJOS7SeY6oPQ2zdxwlhpK+ovGFSxvdjNjQCp2yQlZvREG2nawD
	FhG+siBqr34WwgYXCOik3NDK7Vhr+FWyQEbvuqCOabyK6CPzTJTSXuoO9u+NZ1j9
	gDskj05FmwZrVo3Q2wxMs2/6QkIJ6cW0LTb3BL1mSP03wku10Glv4rib8/lB9PTX
	bx7UU6sw14ByggecxvDtPmriXj7Yzje8EdBnYEVYZEwptYv8/jjYGF11UOUi9P4d
	bknKNg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rdrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7425efba1a3so3867657b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647776; x=1748252576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1/73SEf4ytXoZ1yrIlcLZ+v5wHcPMuVTgw0lx2XQTo=;
        b=o2APBo5Hc2wn6GUJQU3cdeHykqKQkgxrwuLKiXCm9AqvKYSOWQc9T4jc8cE/Le50m+
         DJquI78odsAaxnea8hIJom/9fngR/MuUhtkl3NcB2aH4apovZtsd/X4fAwYyEliN4NqN
         QshM8yl1YTuc31c9himPJ0iNPdmMDc7RTRAQZRMpoWCcYgcm6P1hj6IpkSLoWy3Cbr2t
         8NRaXjKEyciQ96R2nRzaAEuyDO/0lXs9lfcdsh53SacB/abcBen5kgV36kQv42DZCzJ2
         pzeL8xSI7fs6aeGzMB4C71ipgBy9HPhbCIeaLRtrgAN/Sx9k8hxqHnFqkMCGbH57qOYt
         Ldrg==
X-Forwarded-Encrypted: i=1; AJvYcCXHYN1UAwF1bk9/lKlRfRFl2rG1Ardv4ypex06aalkIb/SJpUpiRIrHUh7ANf6XNM367q1mIplAhDsXvTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCXsutujMCQV8ksBBzMJ6vI2cl18AlSEG0XROiKKz3ERNUI+O
	fEZaEvMqJ5tJivHaDWv55kY5ucur6LstuZLyFLC6KOd4vsriyzZZjDmE7AgaBeNZUOD6igcFIHg
	amvni9E02zCLHnOFHpEKA5mEpmIrxBYTJ13G6c7sFSMi+/NIkiYUD1PKkliArLkmMuw8=
X-Gm-Gg: ASbGnctdWSqzvn9p97b5pFEVBnWGUMrQ0vcb8jlA1L6nUQnOZFuq6MV/nyFb6qNyeDm
	nsJ+6yfi4OdmaHeasVruqY/7fzSEr+4E2hFkkte1duOqccBW+r9HkXqqkzfncFbWYnw94OxLjJr
	ALNbk0XroAfFSHGVGRYqErUaPGSlNBS5RK5rBSlM9DJ91SXQlGhnyz2RpD7EyvWpRg2/Pui+Lex
	Lcap0JYoiyBzbSaWiQWfW5kQhv4C5Va40pgk9MOh2SXRA04MH/HqK6ibEVxC8NXCB9fJ/l6EHW+
	q+8edfUz/lRBT0d++m6/FaQrHs2GKmXKV7lFetUgvyefnNo=
X-Received: by 2002:a05:6a00:ac1:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-742a99fab76mr15619566b3a.2.1747647776266;
        Mon, 19 May 2025 02:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6FoWtfS3J3KvBeQkijcvhEZQEo0F73rDNyaSDtfdrDQW3C1qk8ZesN/i6Mh3j6GEYFvr+HA==
X-Received: by 2002:a05:6a00:ac1:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-742a99fab76mr15619544b3a.2.1747647775854;
        Mon, 19 May 2025 02:42:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:17 +0530
Subject: [PATCH v3 04/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-4-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=1002;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MfTQ3eSGE1lsQsEKDfhk3n4vHJQjv6X96tSeWcGlv9o=;
 b=Yem+nDFvzc6dsaIOAR4b6zXLoldPziYHuM1lIowV7FV6LiFHouh58R4R3CqoekwHVIv/w/HTI
 vxXIWwGg9BDBlBKkBDVhf2SY+qlPn4lRdA9jAvQfk0MP/izsfcAVMWG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX0CJsnxJVvB2V
 PohJIdN1drFNxiKTEsmVzHIVp10NxTjMaRDnVq/GizWPPO2RIwRso90ZbzV6LCpvev+zHO3SJE0
 i6EhB3ifpVoKwfJPAovByFhFEVebNQssVI+9BDp6MQZMqgrV3enHa4DGbrAFJDzapcpppAt2d3i
 k7hYTeMIGwavlKr6CDpYdeX7YCj7U59wBbEsc+cPG+r91m5u1OD9CsGFvPNzOcQ+7TWT/uYKWFw
 cUkMepdBrhjBjDcpw+n1jjNVIVkghAxHzVnP66mSCETgbnNemICBmjK/qoJWZgR/vB+z6MKI4oP
 ahuKMNfVgqolwnmG3LkG1pnGtSiWBqJ477jU8ncxeFEj9pn6htDDnDeh0HT8NHxI/8LU/preavy
 Pf6I3mBn8kyXgg91JeZuawL/PRYvV1O3284+kZFsobv3OoHllGXrsPifSDaHCbh2JJrXc+04
X-Proofpoint-ORIG-GUID: 71WZY1h0s-vb--c_Yb-DFTTXBMAQHruT
X-Proofpoint-GUID: 71WZY1h0s-vb--c_Yb-DFTTXBMAQHruT
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682afd21 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=977 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

If a driver wants to enable ASPM back after disabling ASPM for some
usecase, it is not being enabled properly because of the aspm_disable
flag is not getting cleared. This flag is being properly when aspm
is controlled by sysfs.

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

