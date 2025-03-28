Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553221ADC7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157750; cv=none; b=Ash9hv7kvDUiFMcQRkx5jHJ7mjkoriNQH8hljS01FxF8NIxJfaVVL+v1UQKtVI3NICxDUfbbksKx9ZS5A1RyobhSXzlqkj6kvsWBS0TqmG3N5fn55uUHjF+GvoMXbIsIJilEt+BXullYGEuDaWHUneklEhDI5k2qhC1AGWuL0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157750; c=relaxed/simple;
	bh=CYfCgudxUmM43dHQpOpG9OMJgPcOsEIA5bFr+29j8ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUj+tGCRbkmrUD32O4a6FfJmquXlohT/Prz8ZiCvGR+WB6dSUzTyRP0/yhpFpQyhp/1OIMdcXx7oAS94m02P5YHSJ8rOIU1pnseBNAjsP/OLZrT3L4LcJOtnXEeKSVq7Pa2azFt1xtzPw/nP5u1xzBPL5SsIyUckr5w1MlFj6q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXvAgqZT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXvAgqZT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5Tnxg025784
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS50xFiu7/l9/tSwsWmVMjNyLVHaqm97GJbuXD8siio=; b=WXvAgqZThVIQTRfk
	khPWkCW4HN5YAZtNg0Qrqvmir11NmG0u5OZUm+PLBxpOYIa1XLYn5XA1mY1beLjF
	c8nZbSL6UYtFvaGIGz1eXi17NAuc+5SRz6FnJhy6Gq0rQFyavV/8HyVOWw/FxS6r
	FZfPmbBBVQKkCQHjwcF48OUeHXUJSTr8pJk29hlCs+Xz6sI1igcBH3r5JY0TqSVc
	i6C1c7hbLBgCk1lrUJBIUqgODIV1Tw0rNGdPMSCB+g2QY8WvKhL2Q4fPfXK1PpRt
	cpfR+RP8dDQJ2JXNpxghoLWNJ5c/SHsEYiwHeWj7aKakx1uRKTqgNoLadesL2hwS
	+7SQ9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nuv90a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:29:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-224364f2492so36408675ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157747; x=1743762547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aS50xFiu7/l9/tSwsWmVMjNyLVHaqm97GJbuXD8siio=;
        b=sx+8i6xlO/fRuohTD0BboOOrdRsJqygu0TBw8oYqIbWMgppwAFdDEspD22U5d268Bi
         InKm9n0zXCn7SOz+A3t0XXSqr2oTJ1IhEshpjLfXl0rBKxLiTbdTVKfUaeuuM5E//NS8
         xpPYgBR2E64gyJo3ZHYu4zxENAlhHfgAdj0Re9EeP1t+AqF39Vq+7bPCPo0I7Vhbh4Kt
         7AoSDRVx0AODsTQ8iVHtiXRhw9KnI7VXGn2HYo9UAoC8xkwdMnRARttEnoi/G3w1V7CM
         NvVNUehY1JRCCQ7Da/yyFTy3ABCBxeouftJGcGZ+sPVbCKlwIHrSyV+4HFQPV2gEsnPS
         BdWg==
X-Forwarded-Encrypted: i=1; AJvYcCXsIHBNKlqk2YmA2+rfU4Ck4JGuyix5f8zz+Z3l0EUwN1/kaarWShOgq8m5fhtk5DNjRwgEDfcEBwej63M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfY9guchb12BLMpdsszNvTjAcV5dSo1F47QJvRvCP3C1yu5O5y
	EIp1RvDyaIVMyCfNYe35zYAc00avyl4W+u2+scQcMu/b8GciRRQ2S3m5V7v48PPSrw2tTYvzXXR
	xO/M3tICwbNJB0gznKy1uPMlVSQZ9jUgeixs2Wtqqma+814C3XQSw+ByIs+IB1EA=
X-Gm-Gg: ASbGncupmOU5kDkLNXT3ibILtIOrICvtHE1011itGTHMfEKb82MVUGIDPXpkrn3yy8h
	jLlxJ5VtTl2It1vqy6en4iBNihIQtCdsjMQ/ZCk9VXOTOhNGEhxxokybzlDS+ZDd/NUs2cjaXdU
	ZXyWKAojP9bthxAOBc07LTAcwUX0kR6P0+HWIc5C9EvebnG7pCYhX6xMeIsUZ5cOLReP/H2NBfl
	4awtePMtLd5VdZEnvGq0wqpptuptb8CL2hPYPrBLDEMwNnD2DSFqGJV+R+wyOwExdesG1opzHRe
	St36q3drZdYiCeH0kmefZT+gVutqr9s19PoWQayhB8zSx8JL2Y4=
X-Received: by 2002:a17:902:c94e:b0:224:3db:a296 with SMTP id d9443c01a7336-22804882d26mr102654485ad.2.1743157747293;
        Fri, 28 Mar 2025 03:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL2jCaQeU1Ozk/9Xg9vIpyceHfMUqX+QmN7WOzJq+oW5h9ux/cLhPlK4EWKDjUvowOHr/gew==
X-Received: by 2002:a17:902:c94e:b0:224:3db:a296 with SMTP id d9443c01a7336-22804882d26mr102654005ad.2.1743157746737;
        Fri, 28 Mar 2025 03:29:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee11b7sm14561965ad.86.2025.03.28.03.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:29:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 15:58:30 +0530
Subject: [PATCH v9 2/5] PCI: of: Add of_pci_get_equalization_presets() API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-preset_v6-v9-2-22cfa0490518@oss.qualcomm.com>
References: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
In-Reply-To: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743157732; l=4772;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CYfCgudxUmM43dHQpOpG9OMJgPcOsEIA5bFr+29j8ow=;
 b=kxT+GbvQGv6lewdqLXVnzWQKFj468RHAVjYTBH2ufsP0NLN3vEqK6LeZ+C/4zC0eXWrhxLqlg
 Zcy2ODbz6nbCBwIgUy+Y5rLrOExN9kXJjeuZd+Klmjx9OUzLmjqkyEK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: yqesErtW3e_4pOVByQSRARun9Ax_vLs5
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e679f4 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=C2froRUT8Woxtj4mbF0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: yqesErtW3e_4pOVByQSRARun9Ax_vLs5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280070

PCIe equalization presets are predefined settings used to optimize
signal integrity by compensating for signal loss and distortion in
high-speed data transmission.

As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
configure lane equalization presets for each lane to enhance the PCIe
link reliability. Each preset value represents a different combination
of pre-shoot and de-emphasis values. For each data rate, different
registers are defined: for 8.0 GT/s, registers are defined in section
7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
an extra receiver preset hint, requiring 16 bits per lane, while the
remaining data rates use 8 bits per lane.

Based on the number of lanes and the supported data rate,
of_pci_get_equalization_presets() reads the device tree property and
stores in the presets structure.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/of.c  | 44 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 7a806f5c0d20..d594a0e2fdfd 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -851,3 +851,47 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
 	return slot_power_limit_mw;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
+
+/**
+ * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
+ *
+ * @dev: Device containing the properties.
+ * @presets: Pointer to store the parsed data.
+ * @num_lanes: Maximum number of lanes supported.
+ *
+ * If the property is present, read and store the data in the @presets structure.
+ * Else, assign a default value of PCI_EQ_RESV.
+ *
+ * Return: 0 if the property is not available or successfully parsed else
+ * errno otherwise.
+ */
+int of_pci_get_equalization_presets(struct device *dev,
+				    struct pci_eq_presets *presets,
+				    int num_lanes)
+{
+	char name[20];
+	int ret;
+
+	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
+	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
+					 presets->eq_presets_8gts, num_lanes);
+	if (ret && ret != -EINVAL) {
+		dev_err(dev, "Error reading eq-presets-8gts: %d\n", ret);
+		return ret;
+	}
+
+	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
+		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
+		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
+		ret = of_property_read_u8_array(dev->of_node, name,
+						presets->eq_presets_Ngts[i],
+						num_lanes);
+		if (ret && ret != -EINVAL) {
+			dev_err(dev, "Error reading %s: %d\n", name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 01e51db8d285..78c9cc0ad8fa 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -9,6 +9,8 @@ struct pcie_tlp_log;
 /* Number of possible devfns: 0.0 to 1f.7 inclusive */
 #define MAX_NR_DEVFNS 256
 
+#define MAX_NR_LANES 16
+
 #define PCI_FIND_CAP_TTL	48
 
 #define PCI_VSEC_ID_INTEL_TBT	0x1234	/* Thunderbolt */
@@ -808,6 +810,21 @@ static inline u64 pci_rebar_size_to_bytes(int size)
 
 struct device_node;
 
+#define PCI_EQ_RESV	0xff
+
+enum equalization_preset_type {
+	EQ_PRESET_TYPE_8GTS,
+	EQ_PRESET_TYPE_16GTS,
+	EQ_PRESET_TYPE_32GTS,
+	EQ_PRESET_TYPE_64GTS,
+	EQ_PRESET_TYPE_MAX
+};
+
+struct pci_eq_presets {
+	u16 eq_presets_8gts[MAX_NR_LANES];
+	u8 eq_presets_Ngts[EQ_PRESET_TYPE_MAX - 1][MAX_NR_LANES];
+};
+
 #ifdef CONFIG_OF
 int of_get_pci_domain_nr(struct device_node *node);
 int of_pci_get_max_link_speed(struct device_node *node);
@@ -822,7 +839,9 @@ void pci_release_bus_of_node(struct pci_bus *bus);
 
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
 bool of_pci_supply_present(struct device_node *np);
-
+int of_pci_get_equalization_presets(struct device *dev,
+				    struct pci_eq_presets *presets,
+				    int num_lanes);
 #else
 static inline int
 of_get_pci_domain_nr(struct device_node *node)
@@ -867,6 +886,17 @@ static inline bool of_pci_supply_present(struct device_node *np)
 {
 	return false;
 }
+
+static inline int of_pci_get_equalization_presets(struct device *dev,
+						  struct pci_eq_presets *presets,
+						  int num_lanes)
+{
+	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
+	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++)
+		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
+
+	return 0;
+}
 #endif /* CONFIG_OF */
 
 struct of_changeset;

-- 
2.34.1

