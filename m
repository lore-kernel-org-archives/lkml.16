Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FDA1DDA34
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749101102; cv=none; b=Vswjp51khXvmHnJaXjkH7XK6GnXo7rofxUvS8hbRnRegYpe3laPgRlX70DmF1xzw0Z9mMvpbaxJvmcgB2nCGFPA+4EFHyXvAIWV/Tv/hhpulf5RO3HtucEg/bswr1zuBNOroEHPHXpADOtnFMlJADPYnnGDmu40vnyvYZHbflb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749101102; c=relaxed/simple;
	bh=zxxTXJJZhh65kKXR6vEVPLJAxn7l7xAFnunmCh9UKg8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mNH5Vl2+PckwhB0vA3FB7A+PPhmT03NvYGKC/hd7FbKSpJBqPXZW0FXhkmYZ64vs6OXdpiCXuk5C5pLYFouKQTDPXKqgFxOu0ajcHycAESuIB2eePbXIfwEOHfOgoxyx/71Mk2627jMgGe6esq046OU1Ot5wkDaeR+ZA2ozUW50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwJhctS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwJhctS8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554HOKBt027548
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 05:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f1j4ZSPrzmBEocor+zp0yy
	po0Ly70nYX+6BlcZmKgAI=; b=EwJhctS8gsAw2d6PuXWC1/APejCBRB5IVGxJLv
	U7tK8jyyK6iFbMqgRfyetsfx2nOpluU13d6mtx8wcVoq/R0qrrhGINaRunE1It1+
	+qJxE0p9KQcOOQhktQtP+I7qCWCJhASyo2HT5JOowG1agw1oAoh1+S21VfMxxfKT
	o7Zg6IKdshPznRmTHg664KfzZdvadEiKHob7aY6wA2LZ+fPLdrE26873HlKcHTwn
	1t8246P4++mINzRAvjXZuuX4yTHtqC9Pri7JYqJXzfnPbEbMMbW/75c2eg34ze5a
	sX9T7q4ruH1NWEK5LWcLDAJcSr2fjuI00uzS2RyRogXw38ZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t85gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:24:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31220ecc586so611569a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 22:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101098; x=1749705898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1j4ZSPrzmBEocor+zp0yypo0Ly70nYX+6BlcZmKgAI=;
        b=LwwZFJHc8YRWkWY6tb04zSE11+SB4wrCgq8mAPgwL8Do2pfRXf8ERVzJyTcE1ENufw
         ZJ9kt8mQ8aaHT6dau0NG5QmDWb6+L6chlGwjRn8JJcBRIn67SsXQfPoiz3NuYcRRnAzz
         /GRnri+Ao7+NNYRu4UTabhyDG/MkytOj1n818jTlvXx6fF4tBKzQwqCB8ktUEEm2Uqd2
         Bfgdh7rMZfOCSYafjfmtYjssJ18SXLYKJwFO60fILaOR7tKVNWNe1FUc+7CO89rYcPNS
         ynq8ioOtot7Y6ytjEG7rCDjUkdyDOoU2MD0Bs/VJhmiWJsCey7gRem8GdFMMiTEmU6Fj
         rZRw==
X-Forwarded-Encrypted: i=1; AJvYcCUkKNByTC/JBHaRC7d/NLEbkX+daSb85/6bLf10fJo1G3KJ6LPqc0xfPMDPNanTfNquvhscqwg0+9zk77U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ZrcEuTnrTgkgyQId0+oPaSJzQEpZy+MRACB6UKd3TaqoolJX
	t2G8FMF4ukZ+usR4Z8F+FAQKvY+uM0IB2BTDWD2oOnMZoD8ABhwIssp3Q7WsW58LOcqKdRiXjci
	N31M3otKEONASwJg3ZHXNeFh0V+LI1nTvlLPJgEUyZ8tcrJViQokQvYR7xq9IJ/7HvQo=
X-Gm-Gg: ASbGnctzNL9Y9JRHeHuVDsQ6lU5GIWl2tXMNCOMC3pL0b4iIPED+YYtclQhmirJ3JAQ
	+AIFvFlbWp3nZL49Wp5jBZhwYMWJqk4Y6cBIs0IeXdid6DV3Bucm89Q73bZ4w6TEcR74j7xn8uc
	brm5oeX6kLXp9QIUlFW028pNICEftmL/e9EmyuwJ3MJv9gA7hxi2zZZTkjvsvkqzT15lyZYk0Id
	/vwrsBEU+8mkVb9KhpdyjtKsRj3bWEe5DjFR8T+edyJcqUhhvVPvbHGPvE9I5ICS/ZqbtdXRMH7
	BH+p4fnhfiOVIPNDPRGGdBU/O76YQq0neZTwgzQUsljMT5w=
X-Received: by 2002:a17:90b:4fcb:b0:311:f99e:7f4e with SMTP id 98e67ed59e1d1-3130ce68a9bmr9236215a91.16.1749101097914;
        Wed, 04 Jun 2025 22:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHmGnhnQm1zpjI2lKVuzNvK9cPm639RcmIk44l1LsUIpI417hltM1yehmbAHOKHA1NS5iamQ==
X-Received: by 2002:a17:90b:4fcb:b0:311:f99e:7f4e with SMTP id 98e67ed59e1d1-3130ce68a9bmr9236172a91.16.1749101097451;
        Wed, 04 Jun 2025 22:24:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0ad55csm621815a91.40.2025.06.04.22.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:24:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/2] PCI: Add support for PCIe wake interrupt
Date: Thu, 05 Jun 2025 10:54:43 +0530
Message-Id: <20250605-wake_irq_support-v3-0-7ba56dc909a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsqQWgC/23QQW7DIBAF0KtYrEvEYBPAq96jqqIBxg1qE9tgu
 60i373YWbRSsxnpj8T7Gm4sU4qUWVvdWKIl5thfS6ifKubPeH0jHkPJTAqpRC0t/8R3OsU0nvI
 8DH2auLZay84bH5qGlWdDoi5+7eTL6z0nGuciT/flL9xWOwsC+EApT9w7Y5RTeARp2wU2zmEm7
 vvLJU5tZUyoZUNHS2i7Ggk8WKEItQoatBfGBWcIFNuKzzFPffreTyvW1rzXNaXu3xULcMGDJCm
 7BgV14bnP+TDO+LF1H8rYzUX+ceDBbyyyOOLokIJFoxEeOOu6/gBDuADUeAEAAA==
X-Change-ID: 20250329-wake_irq_support-79772fc8cd44
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749101092; l=2878;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zxxTXJJZhh65kKXR6vEVPLJAxn7l7xAFnunmCh9UKg8=;
 b=IZcOgC8nmitlfrmtcZL1Obj1+2m4EqvTV//JU0kriQbXDrs3VebrfZ1/r5+LL/r6/ctoUTIUB
 rDuNJtRzzQ/AzcYH2mQ2Xpy7Lw0FI0ZYVDTRSsOKwOe+Q4nyw0z0GLk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=68412a2a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8 a=l8mvWsQ0dvX29tmygDoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: A1KQnXBnvAA0_r73Ovh6ZNAIb-xpzAgP
X-Proofpoint-GUID: A1KQnXBnvAA0_r73Ovh6ZNAIb-xpzAgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0NSBTYWx0ZWRfXw3to3kvs08/D
 AVqX7/NjHX/GA4M4PNkzWvokSz9ZYkeVMfzGHysF9nYyROJ76i7gPooUk5suJ7FXWQt9Ghp+h58
 idd9nS54WsZSv2q5gd/ZPpYA4cruV4aK90tIg5lSPHzzMel3Us0Qm/DnzR2wrnPJc96z75q2t45
 o902LcVBQXwkXq4HYmTPG/kNf4YH/vQXYHEaagi3KTz4jlt769L3wwlFrbxAApGe/NJSV6IqLwb
 Hbt2UmBI5rx53jvEXD3JLmrvEn0uiAL/JwZ4mcRVjrnSCAIvz+zL3zrxqBtkZ/M6ofrBQL7moyt
 tHJH5QWUIUm7X28CwmK9GRjhJYC8zmnEMLsu9mInYbf6Ev/sHwZlEYTurvEOoxc/VHx1oh+f+zP
 ivYzlZjCDgyJe7qCMMsJNl7oszYZrAYCGHvI6LqwpSaEoQwTFDWoKFzp6gsLE/ooq21CvDgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=578 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050045

PCIe wake interrupt is needed for bringing back PCIe device state from
D3cold to D0.

This is pending from long time, there was two attempts done previously to
add wake support[1], [2]. Those series tried to add support for legacy
interrupts along with wake. Legacy interrupts are already available in
the latest kernel and we can ignore them. For the wake IRQ the series is
trying to use interrupts property define in the device tree.

This series is using gpio property instead of interrupts, from
gpio desc driver will allocate the dedicate IRQ and initiate the wake
IRQ from the port bus driver instead of pcie framework as adding in the
pcie framework will be applicable to the endpoint devices also. As the
port bus driver is for bridges, portbus driver is correct place to invoke
them.

Add two new functions, of_pci_slot_setup_wake_irq() and
of_pci_slot_teardown_wake_irq(), to manage wake interrupts for PCI devices
using the Device Tree.

The series depend on the following series:
https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
[2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Update the commit messages, function names etc as suggested by Mani.
- return wake_irq if returns error (Neil).
- Link to v2: https://lore.kernel.org/r/20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com

Changes in v2:
- Move the wake irq teardown after pcie_port_device_remove
  and move of_pci_setup_wake_irq before pcie_link_rcec (Lukas)
- teardown wake irq in shutdown also.
- Link to v1: https://lore.kernel.org/r/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com

---
Krishna Chaitanya Chundru (2):
      arm64: dts: qcom: sc7280: Add wake GPIO
      PCI/portdrv: Add support for PCIe wake interrupt

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   |  1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       |  1 +
 drivers/pci/of.c                               | 67 ++++++++++++++++++++++++++
 drivers/pci/pci.h                              |  6 +++
 drivers/pci/pcie/portdrv.c                     | 12 ++++-
 6 files changed, 87 insertions(+), 1 deletion(-)
---
base-commit: 88d324e69ea9f3ae1c1905ea75d717c08bdb8e15
change-id: 20250329-wake_irq_support-79772fc8cd44
prerequisite-change-id: 20250101-perst-cb885b5a6129:v1
prerequisite-patch-id: 3cff2ef415ec12c8ddb7ce7193035ce546081243
prerequisite-patch-id: 820dbf5dc092c32c8394fbc33f9fe6b8da6e6eab
prerequisite-patch-id: 7f87f54386a87b39ca346b53d3c34ff0d0cb7911

Best regards,
-- 
krishnachaitanya-linux <krishna.chundru@oss.qualcomm.com>

