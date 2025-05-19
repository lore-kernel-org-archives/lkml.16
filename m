Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EDE275847
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647827; cv=none; b=kxlropef5AdPHGP1WrH3aLtDd1UeVqgeDLUy3dZZh4d18JUMNgvKGXwD5iuXQJ7xk6kgRaYA3O3UNUBk4pJq9qEm22opH8qTBssCD9BNDOKjkB884Dv6W8qbPbdhDpLyCZsSmuZimidaOHY6hsOHwxH9H8DBHxFGhUtzMwCVpRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647827; c=relaxed/simple;
	bh=ciggJN5AEA2xtLRmbdfXbsqmVBeTQ+3RUbZugVrrsac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrioV/+JPREClXCEc5GT6C6NIk7LKmfCCoLlsUyQ3mb0649YhySI3ah0NY7jfuZPAP8XKRhwbCEyPc04nop+c4g7EtTfK62BqmYP0JOc8VouxYysUS+MrcprOyYnF+E5vBYMKRwLFRJOJBU7UVPCH1/kKNlRXDKKfLYx2cN6wfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NT+X5ju3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NT+X5ju3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ABpm000361
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sdf7PFBmZ+dWTupOwPp2L2RRFGZXAccr7B/5Kw7lJr4=; b=NT+X5ju3qOKvzfHe
	xc5ntELMAsH2oxInT4ogGF8raCjNMz+8pSHBkmWC7inueP4yKG40TmtQpMEoxBxZ
	Oj3K6ZDzdek8HDAP4rTU2xpSbjJB9kHw3jb9NyV9jp25oMDkQp4nSVMEPo7bYXr/
	YA9MNSXVqfdsUZuSJLj57rDsD9XWuGegv0GeY+4ppbGcShh1WrF+na4/dmRq/Hjq
	IL6/UsqwvDSzt62q0jcKEg9tv4ji86zVbAHP/nCoINLm8NSlxhOR1r9rIGAa6G9z
	7dknjoM8VhmGRlu7SmX02PS3VgB/TZTgcevLW+xDbSujeAaw4eZuV84rmIJG06Lj
	CfvzFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkykyj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742aa6581caso2389070b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647810; x=1748252610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdf7PFBmZ+dWTupOwPp2L2RRFGZXAccr7B/5Kw7lJr4=;
        b=BydEi7VDFmz/8uHG6vEs6or1RO13hONmeMRun35rZ0pnjTgyAFWYfStTMa6XgT/RVA
         Qk6eV6knzYY89eZzKO4JZtK9OychguVgDhkDM+uIwsmlxiyG2yugHSJbNQR45t/yv8k4
         lApWA02PZKlkCAIFsA9ZrwEJKnaKHT7uPa79zdcXroZfKrAX4EumBzf3JT5hT/NKFHds
         yx6aorRp481ijjCf/GGAv3DD3/c9fTEk95QfOpE/I5hCPXGL4E+2dM11HGljkdH0BxsB
         60GZAgZQfCBR4Ktpvdp4HCvp4yPD9PrgmsjL972v9+XlnFYRmtD2UqldHolrSw7ax9Qw
         KjlA==
X-Forwarded-Encrypted: i=1; AJvYcCWJQsAZ7GIHx0DCHDJxXOj+ocfDbTEwXjipCEVuG1tquQY8Rr1HJuL0m8hSd7rCVRHxWu8SSTbu5kI2tHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5XUEGqoQ6C9rMiUjeG6fQ4cio0THRHDhLCmAKOJYNwsCDaBgI
	M5y7suve8584Ioh662xXAN30lB6GM1TyGbKdbAeEMAHpg9VkmoW1VeH+nf4dbd4iz129dEnfXKr
	Yo0ug7qK4mRbkxaqnZiD6KcELxPp/y8qA3m3nclWi0FBccSDY7yyh6uJzNXzmtQHJPfw=
X-Gm-Gg: ASbGnctfXsGEn9rrfk8xeq8hJEAxvIQUloyR3oT2wnYFhMSQiP1Azi9saaU60/JEb1Y
	SVVKhPeOX5b9GEZKNE+faYeTd7fjtpwZhd5+EKj6kcvQI7M1LepmlWBPSH1zO4lPH5Jkps4udDz
	7zwpIJqoCcSw9nEjUvij+JOH7NJHYAbF0lLK40fOjbLwEsaXMG6b25QBSPEj8gVMf/psMKkEiyi
	cP2pGvxivxYZyVmMrm17cypgD4cYcRsIRRuKPoo9Nnr78frR4aZ50lbU5c+s4KRRhhbinKmh28z
	AC+8zLGLbTQrfPfnILYZ1UxY3g3imxNdgRjjhVUKXHmwZMs=
X-Received: by 2002:a05:6a00:858f:b0:73e:1566:5960 with SMTP id d2e1a72fcca58-742acd507c1mr15013605b3a.19.1747647810001;
        Mon, 19 May 2025 02:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBiZoJIttAqGh73o7b+oxSz8Gg3VOIHkxWf1cUJrHMPT58Y/cYk/xydm04u9gJFvMbMdWJzw==
X-Received: by 2002:a05:6a00:858f:b0:73e:1566:5960 with SMTP id d2e1a72fcca58-742acd507c1mr15013579b3a.19.1747647809549;
        Mon, 19 May 2025 02:43:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:23 +0530
Subject: [PATCH v3 10/11] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-10-3acd4a17bbb5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=1624;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ciggJN5AEA2xtLRmbdfXbsqmVBeTQ+3RUbZugVrrsac=;
 b=9tbNb0ShTaqF9yKpDzZgn5+IkqxjlBzSFrrncqIPIUBywJht4BGIpIewbdNC9EZoJ5T+rqib5
 hi5eVz2dqkxA/eMOSAv3OvErH80iQTydRIqFwBY3czPX7odtNQdyhO4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: tui8y-rMEuEjZEVZUsv891Zh0svW682Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MiBTYWx0ZWRfXwzfoVR15fJdj
 M7eCXXFxIwTzYnbol2BSyHKNR8uOhefLdsrN1UAi7kqtGa9xY9UVUD8n9z0FbgixEOMDbk3zIDC
 YSG3jSs4J5DmUPnq37pVbIcuqNg7M1Hy88Ut5bNojm483FuBrCUd0BzRwQqfrBLRwuIMz4be66M
 O4ncqd7EnKTk5lnf5VuKpAxBOdqhekpoQvpd6jj0c1BEwNpcXEIWBwps8xFz3aaXz3h20AizqTt
 AoiYwwy3nTAdIAcPQ3okG0pHIgHbTL0dp0d/W+YD/8+nLWaHel5CWSL7uWTdL6JI85/UQSSmg/z
 8sTr+XLmyAU/VTySqvEAgZV80oJUGKeL5d/niruJAL/LNFs6ovr/1IHyQJwJl64yBDQzb0RX6a/
 pF/cLy/FcR1TtHZoRglbPIaiEKvkXxd99skh+5NZ+OIbdPMzURF3sTczJsE3oIJZIe3pfaxL
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682afd51 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: tui8y-rMEuEjZEVZUsv891Zh0svW682Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190092

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 12 ++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e77d5b53c0cec9c7cdd043ac44329d1b285cae83..363565fd71bc184bb07e4f21e9009ce382e6075b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6035,6 +6035,18 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_speed_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert lnkctl2 speed to pci_bus_speed
+ * @speed: LNKCAP2 SLS value
+ *
+ * Return: pci_bus_speed
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ce9d0812a61c2337ba533ef246393a0101e617ee..48c3f5b1f6f86b652355fc9edbcf834d64fddd11 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1655,6 +1655,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1

