Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0991E21C160
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157760; cv=none; b=bCvrZPDQDwDIYcVqofjGYujK0/Fc9TUDdK6KRh1l0hIwicqj54X2sndpfAmFFMttz//4JR+/pH8oSZHhq5vVp4ME7LkZtX7nwN3GMZAnQE1GhQfFbYFQIE8kV0rjZF9HJ/rO74FdFVpIw8SLTgxfDkcPDNlgMyukDSIoEz8pmUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157760; c=relaxed/simple;
	bh=sHJJJcuX61owR2kyjUesjcXVSkVy1yJD+aWD4is8QhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mS5sqYJSqX6dJWZzOiGJ1bt61wjkVuSobpjy0J16xC9YJKDzIg1p1fxyD1lEDw+q69rIOfBkaBG6P21d7T0SHADTN4je0FUQAatW0i8tLna/T1e30kYWHoqd28t0M5UCaF0mEbZAiX4eCtLItAJJvjawBYTGDA5/n6nhk62NzbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+mcOQgd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+mcOQgd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5TE2I025687
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76wnfktK4/WqcnPSiRccrWPBKZwX9OX9wOv5n8+c2Zk=; b=D+mcOQgdKQlRd3Uy
	gWvfXVkAUAf4/iq1V8VbbXoWSFpfS4GydVJR4Kvpcg5/regeFipbgVut6SHYeS7J
	Tj8ll71aczrDsB2nE/WaokfrftnsTkppdIqTCvpFvT2ADsEDIEusB8MYtZtUGogN
	408t+uAAW+ZCdb2gCvZClmb1I8dLPUg6W+ollQcck5vHout1y8KoaG2i7+rGydmK
	58/ywm7sC6vEbJ2Hqd2Oj0+Un/OI+CEvlttUU3lz4CS7r/ZRhuGjaMNjSpuH3Slj
	PdMwfYngPWdSihFJIxfkELAf8Gt+A5R/moBBXKsEBB7TQYcA345E4VHTRkWiJJuD
	e6Pdlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nuv90u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:29:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2241ae15dcbso43912975ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157756; x=1743762556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76wnfktK4/WqcnPSiRccrWPBKZwX9OX9wOv5n8+c2Zk=;
        b=TvobnKnnzLhtL3wsQLRYjFT8/R0Aw3qcIvKrmRP2/DJf1TyeAQ8mY6EIr78xZxkU+H
         +tw9KwfZ6TkKNWHtQN/Qy4RGsbSXIJimRrMbNGLyY/QRUqSiJmywXsAfvo/OwyBkw8mZ
         IZDH/HLi/U86cGUn70fakTXIrBmaI50vESebmINc6gwQqXrC9a919QpUHGbjbkjBOvT4
         uhq7LI0XVRFXp/FL3rlk7RpL5Xy2ZHUiU2O/3I8xrSJdLhYtiM6seRs1doCzLkb9M6Ss
         FaEVubKoOd1hPM4bwJEkBbHKa1CqBMgEevgz7zW+bHiqTcen5BF4XKCCbG/VVXfx7IJS
         Gm2A==
X-Forwarded-Encrypted: i=1; AJvYcCWacF2YsEcuSEIZEQAWJz2De2s8uIFXJB6pZOWO6YTpKp/Q0STDRnAgTmWuvD9iiNqbeyNXRH79JN7y0J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9GeRX787eRxBA8ountkxKjveOPA2n0OsZbgxQThPyClw22AOv
	0anK3E8JxC0wzlBgJF2ax7NuXZYFSf0F6tVHG8hh+xTCMJSfotwXNIai5uzZA2uI5vxIRUkC4A0
	o1JPUJ15BeoFwFHtJ90uHXA88boI6B+EuLly0mgl5hGt1faqmqZz+GgWKpA0lWBY=
X-Gm-Gg: ASbGncsPUMIrvau6ZcKIhShLf7lXgRM9Syd78g5nhpfRxYFaAkFiT8krYn98bBm8V8d
	bjT6bvVHvw9KEBesqsk2EgcWCMHtgEJMO3ICLeEAu8dBbkFD5gnsDRpdiVWdFX9KcvyT3zzyRF+
	hRT7DQKgQ4wKavV84U0bI385BqIzR6rO9V4ki/2/8ovSDnw0yP9aielCJxFZ7FyNV5n7O0Wy/xN
	sO2ab+W7VLv8MwqgNW/gO37fFOd9L0V6rUg6Us/xqnhsDSHeNZTLuRmRBcRy4BWpc3VklaqAG3L
	qR3YZIPfSIgsDtrbJp6q/ErIP3FOsZhWv6dYsbcpYUL0foMWQV4=
X-Received: by 2002:a17:902:f709:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-2280481cc49mr105959475ad.8.1743157756407;
        Fri, 28 Mar 2025 03:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXkA4w1mpUhoDFXTTo21wx0R4Ts3go+ZL4NmFZ2yuDManGOG7lOg7EVTJNBHvMCKqEBeqaQg==
X-Received: by 2002:a17:902:f709:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-2280481cc49mr105958905ad.8.1743157755896;
        Fri, 28 Mar 2025 03:29:15 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee11b7sm14561965ad.86.2025.03.28.03.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:29:15 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 15:58:32 +0530
Subject: [PATCH v9 4/5] PCI: Add lane equalization register offsets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-preset_v6-v9-4-22cfa0490518@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743157732; l=2046;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=sHJJJcuX61owR2kyjUesjcXVSkVy1yJD+aWD4is8QhY=;
 b=a9KRYry7jIrmqwsIS2XJJ3sGB8e+LtGwDrzvmnIfoUkWsS2MMxW0KQF0540d8pI13QVDyreqo
 mrRxGO35u41BBXt18lsZ9/RQI3K5I/ZR4IL+lB0eukonydk4IFeYCzk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 85eJEx-2i3SjT00REy2V-7HSD1q7sH56
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e679fd cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=QpCTzhXZHEQm8rbsoTIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 85eJEx-2i3SjT00REy2V-7HSD1q7sH56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280070

As per PCIe spec 6.0.1, add PCIe lane equalization register offset for
data rates 8.0 GT/s, 32.0 GT/s and 64.0 GT/s.

Add macro for defining data rate 64.0 GT/s physical layer capability ID.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/uapi/linux/pci_regs.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 3445c4970e4d..0dcd9aba584d 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -749,7 +749,8 @@
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
 #define PCI_EXT_CAP_ID_PL_32GT  0x2A    /* Physical Layer 32.0 GT/s */
 #define PCI_EXT_CAP_ID_DOE	0x2E	/* Data Object Exchange */
-#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE
+#define PCI_EXT_CAP_ID_PL_64GT	0x31	/* Physical Layer 64.0 GT/s */
+#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_64GT
 
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
@@ -1140,12 +1141,21 @@
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
 
+/* Secondary PCIe Capability 8.0 GT/s */
+#define PCI_SECPCI_LE_CTRL	0x0c /* Lane Equalization Control Register */
+
 /* Physical Layer 16.0 GT/s */
 #define PCI_PL_16GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
 #define  PCI_PL_16GT_LE_CTRL_DSP_TX_PRESET_MASK		0x0000000F
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK		0x000000F0
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT	4
 
+/* Physical Layer 32.0 GT/s */
+#define PCI_PL_32GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
+
+/* Physical Layer 64.0 GT/s */
+#define PCI_PL_64GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
+
 /* Native PCIe Enclosure Management */
 #define PCI_NPEM_CAP     0x04 /* NPEM capability register */
 #define  PCI_NPEM_CAP_CAPABLE     0x00000001 /* NPEM Capable */

-- 
2.34.1

