Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496B256C7D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466307; cv=none; b=uEJ+345ZEOmiLyjkLSbpNAE7vGttJAFB6uPdaUF8s3ZFC/1eAsQo3ldPgtCgFCQ+KeMDpAUVTrL0gyWg6lTxG6tv5x7lrInNNSJs2+2MXv9XgILvaleYBnLuTbOE/Cg3j8zXrTe8Hi2iAksBXxrk0n2ar4Zuviitm2kd2FlCW6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466307; c=relaxed/simple;
	bh=s3BgbObr46Znv5BUzFNNNM+2F0k3oFKX2PcPm3YAn5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqpLxyw8s2dRISWbcCeJ3zA8kIht7Psxs+kE7ZtSHA6DU24G6gtOzZHysIBnri1BbeWnTqao//KIYXF1Q1WHJck6xeHG8pH3SI0uDmjp6mhRraLiuIwGx2Mdmw/Td7gsXlqXtEDAlIMIPy/DMkHGP3Ww/Zp+79EUMfpt4CG0dtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzEaZCQR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzEaZCQR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599qRG3029522
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 10:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7A6tRGMDv2qa8hQq+J0NjE48UHIfnawBC6GPkL/QNI=; b=OzEaZCQRh5beUg2l
	57uAEDGAK6nHLFQlooM13k0An8SFSSSGT7k8kkNIzAwc0Nv525iQDnxT38oGuY54
	BBw3J59ZmaivQR+F4t0OiTyDSWhAbVtkCZIRU0ssAN0eNYG4JBI/owGjBUhwhSe4
	cZlln4K+91q9uGj+B3GC01j/QzwV316vrqzUrV2O7FodsfvToHgYUQeBzkUTWsrU
	x3iN9YDBmVyS+Xceb3rZf4Z8VgT1JMYasVfEb0SfSS8o6i0p3yzml4U0/AFNZj44
	CnFYC7HokpxN8k5FdlxfXixckwQXNhb0OCm4biOJd9u6XN2qEJUMs6eHan6t+Qxz
	vTnFAg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11wxn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:51:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235089528a0so42467085ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466303; x=1750071103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7A6tRGMDv2qa8hQq+J0NjE48UHIfnawBC6GPkL/QNI=;
        b=uqjDV4J+KHH77XoDBwRJe/4v9xA7Kv0ePuEaRSdt0yWRRpzBVGSOf9Masuc73Ol9ne
         NCgC7Dz8IUCcfR+t0daYxocvSgkpdDpYcCuv9wrK0gG7OF4tLDeXlpQ7zKXXNbTWpgLn
         yU0MPBA9bZekiRuUGr1DoGo0DZpi4lOhXc4LgLKlooO20kbFN2rrjtSaLtkF+908qdx0
         HyblwrPE83dB1M5xj3JcAzj8Xs1fAZefhnjirJ5atvEy0gZwSZ8sXqb/9ZeC6ofOSTNi
         8VHFs3z6hmsAlg0XFxHG/9ymxx4yt1p17gEVFTRws29x8RziP/20myanKRvr7Xgc8iGH
         fkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXS+RJQdFatfPtXmcKbLjpxbBPdT3XYHZVhe0C2UB5ZpcSFqnB75i/+2/+TB1mSVPV6Hpc4mhwhgvhGkFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZsy1b0eCqzj95vpf2aYyhBcOihw9x2mEqgE+H8FHhsTIGm0Ip
	hE0URHJegETnasbaiKylwzfxvQN85lS8qG5bSl/MljUesIkBEx9m7Q7+n7QevkiNhXVTpTk/wkE
	6OkUVrF0UcHfgyjfvzlG+q4z5k9xlUueagJwb1cdDWcy55nfVHSuKvdhczUqeDpu7ZTU=
X-Gm-Gg: ASbGncuA596V3ZAriAqGfMytlLdff3y+HPzAKeTP+AkoRDIJSa6hdGLZF4r7XSkRyPv
	CRTqK+rngJSnuiE2utIR2/UeobcIlfJCGFEyO7zwgtMVC6IVNvGLLGxtvrpG1CZnYIFFJKtWBjj
	1R2WAjoiJ8datYarEc1VIjzrtXmsdXQ0VeDDAldehCmutdCnW9lWzOOh8fo1YT4EXyXZFEPOwSi
	k67mqyDSFltPqJLsdHAi8VY2e6DxGOXCPjuAePk1iFQkjYxSutOrPhm8nOrBc56zW4KA/jvCMjo
	nrDt4EjRIm6JQaGYaxHLHnah6Iw6barMDqLbnOBzMr4tOpQ=
X-Received: by 2002:a17:902:c941:b0:234:986c:66cf with SMTP id d9443c01a7336-236020d715dmr193522765ad.16.1749466303535;
        Mon, 09 Jun 2025 03:51:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGLzOtRKOSJqf7NTxp/jA1tIZZWcn7SzcOC28q5ajezBWgKmY9lqYSDR8i0Dk7f/REuQx1ZA==
X-Received: by 2002:a17:902:c941:b0:234:986c:66cf with SMTP id d9443c01a7336-236020d715dmr193522275ad.16.1749466303160;
        Mon, 09 Jun 2025 03:51:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:51:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:22 +0530
Subject: [PATCH v4 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-1-3faa8fe92b05@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=1335;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s3BgbObr46Znv5BUzFNNNM+2F0k3oFKX2PcPm3YAn5I=;
 b=ZfB1rQO8asuRz4N6P4tN0plpJ2JrMF1tt5D4/AjjMGr84OpeBvswukdYc5xJoV20WCuxq+p/5
 w/L+uUEC7JdCs9uZ6zUtriA3WQtBD1w122UYq7IZ4ufsrkQ8qgVr/cL
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: U9SoOGIzSzMKhB1LeplSMm6KviVjyETR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX1f2ue3+GMQm3
 PZU6zApC0kKBcMNHwh8Ikll9igpbwbaK9//T6bqtO5zORnLCAgSyUY5zuiGVqSMkwSMSkzteSYh
 w8QC90npDup2ECr30Uf8GNwd98k/0+AFHIPdVTFrZ7+1EhJCgBrla6vyYja21tWyff4Bn4PGKau
 f78DjxcABNWn76iYgQPhep7zb3MS8KtkobLHfsLFUxyaVW+/WY6pe1h1vP3UuNjlr+bJIrPwYYg
 Ank76saUTPtvBk0Q1YQomH8QM47UPaDwigSoALFhA4POog7h0u0pnOMfAZfNbpxSgv/NLPowvmX
 o8PDUqodtUvwBzTbpgvf8gD976JABobYkrqkBocp3G/tBoGy/NwUM3Eh0CCFCwSIvWAkH1CZ/Dg
 0GWPM7FKG1hQO2MAKRf6l0D+v3bsS4O7pxWrscdbxcAFqIXAcFLwKcbGvkWN0KH0wcldYHH3
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846bcc0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3phiJa3m8EW-4BHYHVwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: U9SoOGIzSzMKhB1LeplSMm6KviVjyETR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082

If the link is not up till the pwrctl drivers enable power to endpoints
then cur_bus_speed will not be updated with correct speed.

As part of rescan, pci_pwrctrl_notify() will be called when new devices
are added and as part of it update the link bus speed.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 6bdbfed584d6d79ce28ba9e384a596b065ca69a4..4c1d3832c43503a7e434a3fe5e0bf15a148434dc 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -10,16 +10,21 @@
 #include <linux/pci-pwrctrl.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include "../pci.h"
 
 static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
 	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
 	struct device *dev = data;
+	struct pci_bus *bus = to_pci_dev(dev)->bus;
 
 	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
 		return NOTIFY_DONE;
 
+	if (bus->self)
+		pcie_update_link_speed(bus);
+
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		/*

-- 
2.34.1

