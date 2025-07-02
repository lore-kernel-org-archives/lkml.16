Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427BD25EFB6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451486; cv=none; b=HeLpErlPuVG7o+ZKnesFDeO3Tfc877UNIHNwCP3hUwVsrMktZPebuyb5LlYNV3rCQruBTM420PfNiXy8DLFnAHeLyaqFBZwMdtB09D/hXnnY6Nzez2Cnh/HO7nS7tULO4hSTbjPT8GdIVhI4C07SZCQ9zBOkh3pTw31ijNodke4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451486; c=relaxed/simple;
	bh=FTU0yQHbOLuAOsUybPfK1jxnzYQyX0J9vLxVroO1rKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQ0C5wz9W7mPbFb/o0kWl0yffTP7kyiO0SPtPGOTZCBOZRjd7BD57xL/tVHsmafhdsL4fvk+rPs0ht+AWZ38Fp2QplOoFJDi36zYbmd8hHL2V9HvkAJiARQbWVxaJjC4wFjYiPdhdK/eyTfDpKPIztd/kSuZLZQLhdv78MtDBBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyXLeDqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyXLeDqb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625PjA2024651
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBX4mfIGHvj28TXKQttLCh8fGJ1egnOpU5n32v/oz6E=; b=WyXLeDqbVRsW5ie1
	EKS9+x4hgswz/noDVSiyINsC2/xJQczWtN6JVeQVJ938YXf/6jZWpM634ZlaJg7c
	JidpicbQdm11eWrJNqEgCozBxd7/iDybjjNS2dkpnKBYqGlMcpNmq3xlpX6flgg4
	WSxIssFEQeBGjLXquUO7hDxOJGCzp7xITJui/AcdgtKE/eTQJ+wOYd0ITHSN7qFw
	q6OF4EYoSiqO0nu6hqE9VPmTIL8+brU3fWW9gwVDtLoXpznWvGd5eGa82eELwWN2
	UzKOJ4VOZmlGC4Pehr/vVZHttZkSVzcNpgc8OAYdVshXLy2jX63gC4ezDaoTtu7n
	ZIHmXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9m840-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:18:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748b4d5c045so3805671b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451483; x=1752056283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBX4mfIGHvj28TXKQttLCh8fGJ1egnOpU5n32v/oz6E=;
        b=FhKu4l0rjpuvZrafULSw36w9ykdiEcPxczkaVz85OvEEOThHQ+5qY3rFbixT0QMXcD
         LMrWgFIZZc+ZQK4ZN1HY6ngqxgo6mucxjkW6bJFX7IN9qB1erVBMRlV6aM9H41Q6F0BO
         v4vzLYhYi9J8+gpFrpDYnMfaf21DGofQE4Cv5GM7RlK09wR530VPEdqI/Ki0GBLL4LsG
         2xNYaRDJHl0Ku3KZWvZ7Dpitd0LXQLAfY7rGhFBUmbjJAma3xYiChig+6qtldlBfVbob
         hOm5EshGzN0sraa/1PLz1VGZX/FcKc6F0P2mkqr8v6gUXmNI3jXAr6w/f0dMqxwUE6f2
         LPKw==
X-Forwarded-Encrypted: i=1; AJvYcCW5HLLIVefhR0Tjzubx1m6eA2GQDnMWujLGjq6Iitve8TjLb/WBbyx8vBneaaWIY9Syut/CIbr5/H454To=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQlmm2g/dahmBz2DU8/tMUKoo4nT/OPG5VqToDCZ04KIPgN9MZ
	qselxujvs9iAChq/R1tMFdeCOYwqJ5OWJqwFTKcLV5kfzA7xThzopEpCS+cVSiXUY7Q+RYOTsab
	3B9fHR2QQ5gAuHvH2hSRCp8ozys1RQHAEv4aTQUldRXhHXr76lZaIxqilcqq/fsRJSt8=
X-Gm-Gg: ASbGncvl2tgd9hwFjs5P0QhGHrVKhs2pF43Y0HIWZV0TvisDyrIFZcEU1K9t1yAR/d2
	gBYZ4OQzJrQd9Y7+OGnNXu5yQEp4gzNG/SpxuKyvvtW/b2lozgCOyxCeKSQp61/Yg4J/nx6+fu3
	BKgkHoW75IajqxIXuG3moe/OyvKaqrXpep+fhP2bwvC02n9pyYL24P5EPW4AsmI+TnorkqMm2BH
	xuvvI+bCE7FPRW8aQEe1XnaVT4UFKvEk/sxAKyEgGnKJ/98k4K8S9UE0Bp17h8vUPNCqrDhvcO4
	nApfG53aswa5pQsnkn5UIQKhR52VOVt7+1B6rKL3eSxzicJmgGJ7DjzSNn/N5IG/LpCe+6lOKAN
	CPSRt9QUXRN6SXnq8YElmaEVPlcbXm0ZgaNzlOoacvYfLKfAgVC8FEaLHqw==
X-Received: by 2002:a05:6a00:848:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74b50df8be3mr3504763b3a.8.1751451482995;
        Wed, 02 Jul 2025 03:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgRvV9sdTWMDvkgooI5Qo4vx1nVTA+9j+sC7mo45Nm7Wu2hM8dJNKd9XnCJHchrKqcKHSwlw==
X-Received: by 2002:a05:6a00:848:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74b50df8be3mr3504729b3a.8.1751451482531;
        Wed, 02 Jul 2025 03:18:02 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:18:02 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:38 +0530
Subject: [PATCH 6/7] arm64: dts: qcom: ipq5332: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-6-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1172;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=FTU0yQHbOLuAOsUybPfK1jxnzYQyX0J9vLxVroO1rKY=;
 b=oiktSHHzoBU9Jz+DIjgHNaoFblRRZCIxVOBJapx3t+n6re0F1Sw+qnR6aGkjYg3VRrqblJnSV
 j7AuECJ97CIAPF+ZLOzIe8GEJRl1k7W3E4vsefDQkURRFU4vTR73j+W
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6865075c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=g_gtcTFTaut2jdyMrvoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: UhaZ89OJEuceSXdXm-SO_2ks7yr8TbUl
X-Proofpoint-GUID: UhaZ89OJEuceSXdXm-SO_2ks7yr8TbUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX8bnZG5g7F1F8
 V49EJB5Z+WPgbiWbNMReLxF0yULn4gMyr8M3vAGwt0CUo6sWdD1v8t/AmoZjqr2grBImVfnEJHl
 FI/6yA25n/jT6AAtzXpPd7u/1xA2iVVwunAI2bwqImEugc4XX31lFV0VBW4xHJplaJm3l7BRIQ0
 20LWSZ8BBiOmQ3TfG0fksk+RRQ7+JhdgmSdmRYjIb6/mhrmWDbLBy6s8xDhKWJoylu7RyGySTWZ
 AE6YnF5O2+GGuzlx4pUU+kbAnWHw/NAMnZvy8ZzssrdYlpFz+KVGuVq/nIsRbBWmIjSGNJD8Z0H
 4slw+cKQe327cgW2fLL6wdemn7W33msdKgZu76/8Mvu+tAtXbFi10Mb4Zqo0SOWxhL6KyjnNuwL
 suHzp98O5d1QZVYmreKT5nnRLP18nKrdMJW3dFspVz186Ox5r6qGL+fkFEF9CI2nQUFNCOC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=767
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index bd28c490415ff61624f6ff0461d79e975f2c397f..6f54f6e758309932a35d7156f32ccdf09dd36ee0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -423,6 +423,15 @@ blsp1_spi2: spi@78b7000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

