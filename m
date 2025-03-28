Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116941DF257
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157742; cv=none; b=sl54wEdwfjqfeWsi/oW3brRkECgceUQxC3WD4UFUqhdVBC2e4kLJ9XOalakjrnxRO0UGxKZskYiqK7g9l0j4ycsVyiIM+Y2LZlveVVi+RSU+f1c0c08VGDBJr64W22Himbq7hKkl5BWQg6ubovQcLiasSoeIHrhb7vktDsU9Os0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157742; c=relaxed/simple;
	bh=mf5BuP4DbTs8hTdfi6oMr/Lqb1LlM5HErZJeEIbfzrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gy7Jag8tDJx2xEbjpe6IemSQTw5SyKXPKpVu0EYqQb8qZIAsBjgOeqUGYJsN+Lkpnqm8nAZGXqOIxLIRiDKl5/X61TC5RLnEHIQPhIHWHVuVzXkplBEp/9OgI/nW4mc93677fWIMT71ML+7caZlTpSdCFiCyXrtolPsBb549JWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9+d0dBj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9+d0dBj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5EcI8013285
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CrA1bYnBuWeYn44o2Bh0OW
	jG65xH/Z9n/7BBROFN/aw=; b=m9+d0dBj/Aavca+RXxdi4QsUdzHUOovMU6x6Zm
	hSji8uKd2fXuP9BvvS0UaKRalKb/jpDDuEiLKuSkWrLJLI07d4mY21Jh9ciIv0lj
	yoTEhXeV8ytCu3yULvM3s85vrn7UDX9QsBDVuEFZhzC/nL/MTcsIGzFz0O07NrB3
	28DbFSvcr8KW0fxO0Kp0XsaXU/dVys2kRV1rG/s7tw8HOAjAOl0zYJvHlzkonx11
	addwqUPDtUBQcWanTLB5ImrsAEaKoJKyil1KqryyikMkMUMMmvcmx1AUjIvxwKuk
	EdBsO0nXnpMTxGbYrQ7K5CM/2mNFfvfC6wi0BN88c78IUO+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutp3hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:28:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225429696a9so54675225ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157738; x=1743762538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrA1bYnBuWeYn44o2Bh0OWjG65xH/Z9n/7BBROFN/aw=;
        b=thTFjZ3kjAdvZ6fS9TJXFz4FqF5RMmAIgNKTx1rRVjPVqhZPaNLZ6QPoGiJpH/oLJp
         9cdwIZzC/X+kIJD3HdQSSmHJcknoZEByJU4xdqYRt3GKA0ygha5AICVMkQJXNndTQiM7
         OzHs5vXWBNJADFl6eqWHfJ7F/TT5cjlMOKtNq61njIzf/kCuPyuLptr/VskLKoMRZ3UR
         67HszuBLU87+MbAXiROyY4xp4figI1rEhMvZSJuPsm0OBw+G7KoLAhocm83GbNJO3/GO
         nQz1rHSP7I+A2uaPMLya+c3uXJrgFuCR2nXhoqOi5LL8UbrqKtz1KeLSZqRNxwhR7JFC
         EC2A==
X-Forwarded-Encrypted: i=1; AJvYcCWbAHD6MqBv/c2Z1J/Lp8ApcFbGhrFww6Ee6sLfhgNhymSFZYT5R7jjv8q+S+55P9KwjDuOjQerlwqN/eM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXbZD3rxcAFoj8+bdxYqU/hLTvQCTgNcymsbvxawEWudam9TxB
	JVnwZgn76bPkWEujRiVjuxkNXdz4xUp4/vfpPS4GhdbBEUdhugX9RnwTAq3nFEtq/7KE2gYCCrd
	0FiksPLWFTOACzkbbVYUV2SG+c0nwqCgPlATU3dE9J6mV9/TnPi7VBJhP56Xsm2I=
X-Gm-Gg: ASbGncs4DeP3EKrXq+AoCzgYrY0brNxMG3PopEcRWF5X1+vShSafuG7d5TudFIbDTdr
	oBEYixGkBCmNYr7rwAk7+TDF3f9Y6pertf6TqRW1A1nLr3zFd4Dv/dc4kqRYqV30uYBcNt2CMmD
	e6Ov6I8sWlcePTt3ynyRzW9VTNHvpDoAYerwmL+gyDJpc/BAIBm9Hurm9JxWKFoKJW5lbmhoI9M
	/2fpo9rbxf+PnTvSvQjlHdCWIBTOHrs4CJHcb16glWmWxpz0AoSuUUYAyjmusARw9HzxwtiDPhJ
	aSyiGQEvqqpl8FcvlU43Ut8pwY5MTO2Ew2221NLYpOGyNYZKAGg=
X-Received: by 2002:a17:903:2b0b:b0:226:252e:b6ef with SMTP id d9443c01a7336-2280481d0d5mr114123665ad.7.1743157737940;
        Fri, 28 Mar 2025 03:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ6Wp9H4IH/hwWRloE8NFm6xudfOST1lZ3UslYecN1jAwAqFCFXqGZc8RTchinS4ImWDIc3Q==
X-Received: by 2002:a17:903:2b0b:b0:226:252e:b6ef with SMTP id d9443c01a7336-2280481d0d5mr114123185ad.7.1743157737365;
        Fri, 28 Mar 2025 03:28:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee11b7sm14561965ad.86.2025.03.28.03.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:28:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v9 0/5] PCI: dwc: Add support for configuring lane
 equalization presets
Date: Fri, 28 Mar 2025 15:58:28 +0530
Message-Id: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMx55mcC/3XMTQqDMBAF4KtI1o1MEvJjV71HKSWaWAPVtMZKi
 3j3jm7qwsIw8N4M30SS74NP5JhNpPdjSCF2GIpDRqrGdjdPg8NMOHAJnAF99D754ToqyryupQL
 HhHUE//FSh/dqnS+Ym5CG2H9WelRLu6fgAK1KZ4R2ANy4U0wpf77svYptm+MiCzbqDcDlFtAIW
 FmIWvhaFJL9AcwPEExtAYMAaBBWm6oUUu4A8zx/AQsTU3krAQAA
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743157732; l=4598;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mf5BuP4DbTs8hTdfi6oMr/Lqb1LlM5HErZJeEIbfzrc=;
 b=a/zjTo3TtQV0vTCF+vmKHjKo2bIsuH+js3eqMkJyGZY3grCN+EeBrwH3mZvVxsSU0A358WCmc
 LQphtlup3AdC+dz1vha2uSW/tvniTXpxOCRRQJjg6z/DhCf+KL4IHfK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 1ZA3UAsT4WGdSA70wYzh5CvspJuybre5
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e679eb cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DYBN0Cp5FbWaLJN7M44A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1ZA3UAsT4WGdSA70wYzh5CvspJuybre5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503280071

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

Based on the number of lanes and the supported data rate, read the
device tree property and stores in the presets structure.

Based upon the lane width and supported data rate update lane
equalization registers.

This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v9:
- Add support for data rates 32 GT/s & 64 GT/s in dwc driver & macros
  for those registers (mani).
- update the print statements (mani).
- Link to v8: https://lore.kernel.org/r/20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com

Changes in v8:
- Couple of nits by (bjorn & mani)
- Add EQ_PRESET_8GTS by (mani).
- Remove the logic not to update the DWC registers if the num_lanes is
  not equal to maximum lanes (mani)
- Link to v7: https://lore.kernel.org/r/20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com

Changes in v7:
- Update the 16bit array in the array (mani & konrad)
- Update the couple of nits (comments, error log format etc) (mani)
- remove !num_lanes check as this is not needed with this series (mani)
- Add warning prints if the data rate is not supported and if there is
  no devicetree property for the data rate (mani).
- Link to v6: https://lore.kernel.org/r/20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com

Changes in v6:
- update the dt properties to match the lane width ( mani & konard)
- move everything to helper function and let the helper function
  determine reg size and offset (mani)
- update the function header (mani)
- move the num_lanes check to the main function (mani)
- Link to v5: https://lore.kernel.org/linux-kernel/20250128-preset_v2-v5-0-4d230d956f8c@oss.qualcomm.com/

Changes in v5:
- Instead of using of_property_present use return value of
  of_property_read_u8_array to know about property is present or not and
  add a macro for reserved value(Konrad).
- Link to v4: https://lore.kernel.org/r/20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com

Changes in v4:
- use static arrays for storing preset values and use default value 0xff
  to indicate the property is not present (Dimitry & konrad).
- Link to v3: https://lore.kernel.org/r/20241223-preset_v2-v3-0-a339f475caf5@oss.qualcomm.com

Changes in v3:
- In previous series a wrong patch was attached, correct it
- Link to v2: https://lore.kernel.org/r/20241212-preset_v2-v2-0-210430fbcd8a@oss.qualcomm.com

Changes in v2:
- Fix the kernel test robot error
- As suggested by konrad use for loop and read "eq-presets-%ugts", (8 << i)
- Link to v1: https://lore.kernel.org/r/20241116-presets-v1-0-878a837a4fee@quicinc.com

---
Krishna Chaitanya Chundru (5):
      arm64: dts: qcom: x1e80100: Add PCIe lane equalization preset properties
      PCI: of: Add of_pci_get_equalization_presets() API
      PCI: dwc: Update pci->num_lanes to maximum supported link width
      PCI: Add lane equalization register offsets
      PCI: dwc: Add support for configuring lane equalization presets

 arch/arm64/boot/dts/qcom/x1e80100.dtsi            | 11 ++++
 drivers/pci/controller/dwc/pcie-designware-host.c | 79 +++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.c      |  8 +++
 drivers/pci/controller/dwc/pcie-designware.h      |  4 ++
 drivers/pci/of.c                                  | 44 +++++++++++++
 drivers/pci/pci.h                                 | 32 ++++++++-
 include/uapi/linux/pci_regs.h                     | 12 +++-
 7 files changed, 188 insertions(+), 2 deletions(-)
---
base-commit: 3175967ecb3266d0ad7d2ca7ccceaf15fa2f15e2
change-id: 20250210-preset_v6-1e7f560d13ad

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

