Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB93426FA7E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647770; cv=none; b=Ab8aZk0eYmr8ZfBl4iAPzNjzZ9yup9jwHm5YrUg9NGiS0qigId4sNPGFckUO3aPNMyJvxehu3i2nH8sSE/YzFT2Sn7maXdj9pA9GHBGfxAOUeo7NLi6onadYSSsGIaE4MTJE0vY9YzlYfFgvMqwU65K9Eze+6VY4YhawgYDN5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647770; c=relaxed/simple;
	bh=LW6uUZFGqD1UyYUFU68Xi6WQWlLczbA/2FzJMIC0YvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWe+P5HIteXVd4bPwuNY3U+Zvfb2Dm2Y+TU34J6zRp07BwuD4yw+E90EK4g/n0851osBE9CSbIE8AlHw8c4haZ+k6YGhcbe9TAKxwyte4FeuL7T2qiPPT2Q1CDaQkJcSJz1tyLGprYhIlA+sw5OOpWJRESvwqIbJ1E8Q1PXv/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExbS2gRR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExbS2gRR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7Ggk1023276
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaEhlMZNRK2NLwdfwilZTHaAPGsfv+pU1e/jm5Z+ob0=; b=ExbS2gRR+sO6HL9d
	j9rfgQ5wlpGb0F82HJE006JlxlF+RTyNz7lYfsH3p4v+klgFFW7Qbi7UHWbX/+17
	C2DmOvkRrwK6LSo0hsTAy+fHZasoC7n6XF3JagCfnsEhkFX9IRyt23d73+N/phGd
	dfnpE7QAWwYSKt9rw/cXWQv6A5QXcLDah7GzhSVYHK8R4IAYonjD/8CgRsZLcXBt
	VOCoscgIOrvXEGQdhU5ZshNzITpSgE4JHVWlkKoSOfUp0xgNL1X09QMjf49Fm3vf
	mCVSx5lS1+7yf3g4ZDNh1OJto0E52EyFisDBQxPN2gqCkKez/xlgW0Qd4BTotZ4w
	UcdpRA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rdqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b16b35ea570so4148425a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647767; x=1748252567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaEhlMZNRK2NLwdfwilZTHaAPGsfv+pU1e/jm5Z+ob0=;
        b=TncmDU82+eUYO4p0OGhpKJgzd+FAduQmqc5LPJxGvHeMLqoeQdzGvbq+lPxpwGP39M
         SPlg1NU1qlOmQUNTl2VtEtP64BHsMTj9pTweoZJC1tFt1qlZ0GlwkAsra5URYCU3qnkP
         lK+CzppMaaf2xnGXyteM6Jqx1OKvhGTZXbA9dQdNyFDg0xnNvh/y665S3+dLsPxaj4oK
         EyMXF+1oB54xMIlxJZRmmD4pOqwVQGMIVQfNalrviHM1UcTYHOmPvlj3y2fnn60WoVW9
         StY304pCAX0loztBMLrfjgSZha5OPrzh+3i0FIOsf4VaNYy+5ArcxJsvSYjHA9vawrzf
         RRhg==
X-Forwarded-Encrypted: i=1; AJvYcCUFe0qKfmgbuk7TtnjZtjaBZsOIsKJWksgVSDIB/I042M84p7H5GKfexHkmDR6DkjYEVGGa6ZrzxvcVof4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKHKvIt+XC372lxn7hag0M6UcJs8fntteloEpsU4Nmw7Au6Paj
	+NckA0/AyY63NrfMFAfYl9M6Yj9Q24X5A+TptPJiQX5na2rgNZUdnhIOKhlu+s0hrhK7CFfZ6vU
	6U7IWr5dNn2yy4Zoz06zp0+h860l4hVAR9mnfYclt4GwdvWi5ZERclE5Y3CO5K6HzBjk=
X-Gm-Gg: ASbGncuet2PfBbx8/LpPmMBHbTyVAEa6TQut1AXEzehuhsy6FijqeeV/PYfOeEVVsFB
	b0CnKd9BxHrFMDccDO7AU4oI+da1+xbP3Wnh1X+aFKfBk7qoTgqiPybhnyj4IGvnJtjstZaqkAj
	QPAZQpFmwMYdBkAPiUTWsv4DYNh9+QMtaLSyAF2Qxvr1egWjs1WVDHUIrj1nyIfPblfOUAiU/6F
	x+oG8YWdD50cZfPTu7Xcs6vjE2kEnK1osqs7YVDJ1pb3gdc1c6Kfxzhn4H8LT5KJDnuw5BqooOt
	Zw2EuBQcw2FZLd3IiiorlJ5t4HxwaSkt5+COx9ocqx4s2wA=
X-Received: by 2002:a05:6a20:2d21:b0:1f5:8eec:e516 with SMTP id adf61e73a8af0-216219c83c7mr20960863637.32.1747647767007;
        Mon, 19 May 2025 02:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPivW2uuHer/futXB6CATvxy78IsEmfKwkUhEBc2jqHppm0UtJRVQovLwVfQwoCRtaYVtxaA==
X-Received: by 2002:a05:6a20:2d21:b0:1f5:8eec:e516 with SMTP id adf61e73a8af0-216219c83c7mr20960821637.32.1747647766601;
        Mon, 19 May 2025 02:42:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:16 +0530
Subject: [PATCH v3 03/11] PCI/ASPM: Return enabled ASPM states as part of
 pcie_aspm_enabled()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-3-3acd4a17bbb5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=2254;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LW6uUZFGqD1UyYUFU68Xi6WQWlLczbA/2FzJMIC0YvA=;
 b=CeH1rqozNMSAmO9N8S8eg5Dl36biG9HcHhnJfMpzs/VU2cnmb7kh/fdVzeA1DzlaweGbH0UQg
 KwlHYmQmjGXABbM8yXmUPJRmsh+iFpFd/GgRSJ5Np41KR2CV1JFVSLP
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX4FMh+WkBwvKs
 LuTGV3/lVgNqMbRZWbD51G6vo8Tk2CWg2+8mXZcnFwvzqT04styagdIN1fTp8Cs60ZCY5sOQLBn
 Hi2CSB2MzZmW6s7NxIyB1xfRyBgqAPqQZ0Op7L1ixUwP3jbOlUW+rgmqqZYHwTz3RHX68H3n7Ih
 ps+gnv1IL9jBLAC5MN0QZjaOsN7n0ChZAayJrRFYQfxquVtBNdlkXwL6pKID5hO4zVnfEcTEbh7
 R05JUA3CJbPATevM0hIThXty77wS3g9zHJbovzHj0ysKkUlge5rCaxt3SWX1ygDQAeyN5Npc+Jl
 ZdKnoVaX4oaaYR0YnaF2iR5g9cmetfxojBN2LOMnmk4xxFmz69KPugy7quuBoiD8swaHV6fvLrF
 9U3MHMoWfpOoO5ss3AjLJRYvA6YePMkgvbtLlpLkk+popACFo/CovwdcdC0Tzphx8cotW5gH
X-Proofpoint-ORIG-GUID: a5LHzzZRk52pV4L9RJOX3dWMGHA-t0OI
X-Proofpoint-GUID: a5LHzzZRk52pV4L9RJOX3dWMGHA-t0OI
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682afd17 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=wuQQqu7ThqwHlQwkt1oA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

PCIe ASPM states can be also controlled by userspace using exposed sysfs
entries, if drivers wants to disable and enable ASPM at runtime they
need to know enabled states for correctly enabling them back.

So return the enabled aspm states as part of pcie_aspm_enabled().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 4 +++-
 include/linux/pci.h     | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 29fcb0689a918f9cb123691e1680de5a1af2c115..94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1555,8 +1555,10 @@ module_param_call(policy, pcie_aspm_set_policy, pcie_aspm_get_policy,
  * is deallocated only when the last child of the bridge (i.e., @pdev or a
  * sibling) is removed, and the caller should be holding a reference to
  * @pdev, so this should be safe.
+ *
+ * Return: Enabled ASPM states
  */
-bool pcie_aspm_enabled(struct pci_dev *pdev)
+int pcie_aspm_enabled(struct pci_dev *pdev)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 7eb0856ba0ed20bd1336683b68add124c7483902..ce9d0812a61c2337ba533ef246393a0101e617ee 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1849,7 +1849,7 @@ int pci_enable_link_state(struct pci_dev *pdev, int state);
 int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
-bool pcie_aspm_enabled(struct pci_dev *pdev);
+int pcie_aspm_enabled(struct pci_dev *pdev);
 #else
 static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
@@ -1861,7 +1861,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
 { return 0; }
 static inline void pcie_no_aspm(void) { }
 static inline bool pcie_aspm_support_enabled(void) { return false; }
-static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
+static inline int pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
 #endif
 
 #ifdef CONFIG_PCIEAER

-- 
2.34.1

