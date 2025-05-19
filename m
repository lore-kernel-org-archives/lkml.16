Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC2202F7B
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647754; cv=none; b=ZynmCRo50QKjSOsywVsJdyI4CQ2o4B/TuSLagzKdVkFdBZuTXVvESgaGReFkSnqoIAAle0aJjOuyPqxkTEgHoGfR/BEMtIIPYkMIm2807aH94/+fdB7wkwIZylMJ4zk62W7kcXAU/eEOU5LjSZNgYc3hUzJAes+bpazDSOVaNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647754; c=relaxed/simple;
	bh=E3NkA6uH614ySqMHBo8o678d+83U+3iUYauudgnzNVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b1jFFv2VlXsYKm3vtBKMJsyHjG2jXzBZLO8TNLv+JmDtdIkvY4HoLUtyxqw0rMzO5VV2Rpoy9SMheF+LOE10L42Gam2Mq8mhbrL8saPPR6WkY+LAyT0zVB3bSVZhiT06Gez6kPZBEbsReZHWaqE0IiK0djnRC56ADOQAr4GPmAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eu9CU4Pb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eu9CU4Pb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GbnL023174
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8Xdkk5ppMUCw7u+31/KTTq
	mStofyaJ7T2kwr9altaWU=; b=eu9CU4PbEUXefPcWbAyWOs01/AyR95FGM1YrA8
	dGkR4fizbmtGnQUy+L4n4d0UutUDOduIyFxuQMn+xcZX++YeLwYi0zQR35gYFsV5
	OC8rVKFCiR3D/rkHZ4bvWySE6R5RxhYa04+fmtbBAbexyNoMzImcLMwIvCOyz1zB
	wwq1vlES5R7eTveMADNzEMJvS+2LaHg0C3QmY9CaMW4y7+WIcv7V9TLSwrH5fHZD
	DTFEK4a8ABRExlFIInDto75SgZmdLJqnNUOhSK4ADoY3cly4fH7pgqbup9lTEn+s
	UQxwFYEr1iAIaFZIsTj1HJgeHmbAnniipriynh+xPDM4iOqA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rdpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742c5f7a70bso1399279b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647750; x=1748252550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Xdkk5ppMUCw7u+31/KTTqmStofyaJ7T2kwr9altaWU=;
        b=Wwxy9R8BM7YLC/LMHMrmwFTIhMo0S6ZypFDxDAJpgPxhxkYppXGNYo0pFOFiHGN/us
         Jr8UMeoCJkTyM06DW5LXVrZyLeBIuFg7N6TSMczlJantbTY2FFik8EpR5RsgMbh/X6PT
         MFlgFVZPeu4I+l7kC4+9Og9tHdg1MfVJy/5EgvIH6tecbFeJr7f/WbDJ7EGQdr174nM6
         UeDxiHLPoV0Xfkg4Z+RR9VaDLsA0zrE221IiA5vgOUSGhTRyUSi/J4YLZq0CE1g/fi6q
         UFrIMMG1oqvFCuUXZwjwT3/W6ytVCPEOjGlkCw5r38hEw1yYKNEG0fugg97cZNrc3Ycu
         t19g==
X-Forwarded-Encrypted: i=1; AJvYcCW4Sq7I8kshkfDbDzoYnM7eMr52vQFlpaOHKsAoX4228MHxnYQ0sXbRsHK4YHo/Qx9X0Y38cMG8WVouFeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ5+EN3uW8FsX47OTaxTa7gqBJcG4gcPVYUUTelwgWHLuYurzF
	Lj7FcCjlwEWEPdQNpcXi/OFGKCaXiyqlF1/X9nP77c0BtTqXiAPkdqdmrBAykhL3FKrUXYrNI9y
	arhcpfGqzCL9WXe7R+u1VEHvHcH7PrEV4AAKAK756d3j//5zHj0rU4GrNjMWx+2sX5E4=
X-Gm-Gg: ASbGncuAJl+QkT7zr5UiEaSnuHgPgk+EbIJy57QD/AO3ePlJ2OH3mAoqLbdGabLwyOu
	a4EdfUT8lrEt6DDsGrXpapgf8rDgXeToMwu1FYIBEjnTYoBDmQbT42Nmxsn8FtjuLPVD0yQ88+z
	jT8DMERs9wtcy2o4BrXa4u1jBT06tM3AjNmc3D3lg02TUFRPYMLgG/zQuox9CdxFk2Pe5vOvAUW
	z7Th5SI3gFOonOiz+RopCqpxO5sd3gDTl99RZCrfp3uOxBhqvPGMq2SRZ6BqP0evk4ouK9o4uL6
	pmZ3zbA9rKDCS9GQl9Ps/IF8djJyRipTfQitzcd8FLV+D4g=
X-Received: by 2002:a05:6a00:a06:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-742acc8e94cmr16949365b3a.2.1747647750209;
        Mon, 19 May 2025 02:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoCNHIy8vm7UNK06bHoqEfkocfr01VDi6iYCVtGhO8fkUV8H34cgcNYNSP8u4+8ZFmO53vpQ==
X-Received: by 2002:a05:6a00:a06:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-742acc8e94cmr16949320b3a.2.1747647749707;
        Mon, 19 May 2025 02:42:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 00/11] bus: mhi: host: Add support for mhi bus bw
Date: Mon, 19 May 2025 15:12:13 +0530
Message-Id: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPX8KmgC/23NzQ6CMAzA8VchPTuyD0Hx5HsYQzYY0kQYbjI1h
 He3cNEDlyb/pvl1gmA92gCnZAJvIwZ0PYXaJVC1ur9ZhjU1SC4zLsWBdS2W5lWOA2uUUDzXWa6
 EAbofvG3wvVqXK3WL4en8Z6WjWLZbShSMs8LoWti9NLURZxdC+hj1vXJdl9KABYvyB9Dff0ASc
 MyLSiuSuWk2gHmev5ZAhGnqAAAA
X-Change-ID: 20250217-mhi_bw_up-f31306a5631b
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
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=5246;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=E3NkA6uH614ySqMHBo8o678d+83U+3iUYauudgnzNVU=;
 b=/lyU+5ydxEoQf3CrCMazF+8+/lgCqzeWYYIHuE+LMKA5vLfcz15M/CGdyq92AMFU1qdQu3173
 U7ZTed1Gw0lCrGIIKbJ6/caEFmvdkEmopnoewqoF5QA5DmGGkEhNYDX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfXwbGmhgHTIH8H
 65gUj3RpR4r98Tkvhv2BnzRg/5U4hKCixWrHNClnxOexIXISbf8YP5EAesCdB1//yiCizYjqjex
 HBYcVXWKfHC/addajUJSjvH1LvTzseUym7cHxhwTWCs61AOZdBiuyXFRm94AEG6BJWod+nlEvDk
 oXnu/rHt3zgTWA/nVINkT94QgGFdewaV1wALHqWC8m5FLMCjs5BNZrYP3zNhxJr17I8K9w1RO+f
 ew7+f4x9/bHQmEAc2o/TgY2wUu9lEINQupqrLzFC3HsWq6BTbguLuIXotfjqf/3EVrsBk6ihyRZ
 jd0mIP285lmZXawg+0VCeLPqjKgOkUqixUFSrqa+gikAj0cF+onWWDx10q4KtZUe3o3IbHJ6OSM
 Ng0DZlPYgW0FIDCnO2p8I2CA2RGz3uI2mx0okkHY3ldydD6XO8i88skq6BcwpciO6q7yctDd
X-Proofpoint-ORIG-GUID: OVbPF84cD3fkg0TgoRlhd6wDKcV2SJyk
X-Proofpoint-GUID: OVbPF84cD3fkg0TgoRlhd6wDKcV2SJyk
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682afd07 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=a1UGM4vktcZ-V-6vu5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

As per MHI spec sec 14, MHI supports bandwidth scaling to reduce power
consumption. MHI bandwidth scaling is advertised in devices that contain
the bandwidth scaling capability registers. If enabled, the device
aggregates bandwidth requirements and sends them to the host in the form
of an event. After the host performs the bandwidth switch, it sends an
acknowledgment by ringing a doorbell.

if the host supports bandwidth scaling events, then it must set
BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
doorbell that will be used by the host to communicate the bandwidth
scaling status and BW_CFG.ER_INDEX to the index for the event ring
to which the device should send bandwidth scaling request in the
bandwidth scaling capability register.

As part of mmio init check if the bw scale capability is present or not,
if present advertise host supports bw scale by setting all the required
fields.

MHI layer will only forward the bw scaling request to the controller
driver, it is responsibility of the controller driver to do actual bw
scaling and then pass status to the MHI. MHI will response back to the
device based up on the status of the bw scale received.

Add a new get_misc_doorbell() to get doorbell for misc capabilities to
use the doorbell with mhi events like MHI BW scale etc.

Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
which will called by the mhi controller driver can sleep.

If the driver want to move higher data rate/speed then the current data
rate/speed then the controller driver may need to change certain votes
so that link may come up in requested data rate/speed like QCOM PCIe
controllers need to change their RPMh (Resource Power Manager-hardened)
state. And also once link retraining is done controller drivers needs
to adjust their votes based on the final data rate/speed.

Some controllers also may need to update their bandwidth voting like
ICC bw votings etc.

So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
the link re-train. There is no explicit locking mechanisms as these are
called by a single client endpoint driver

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Move update speed logic to pwrctrl driver (Mani)
- Move pre_bus_bw & post_bus_bw to bridge as these are bridge driver specific ops,
it feels to me we need to add these in the host bridge driver similar to recently
added one reset_slot.
- Remove dwc level wrapper (Mani)
- Enable ASPM only if they are enabled already (Mani)
- Change the name of mhi_get_capability_offset to mhi_find_capability() (Bjorn)
- Fix comments in the code, subjects etc (Mani & Bjorn)
- Link to v2: https://lore.kernel.org/r/20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com

Changes in v2:
- Update the comments.
- Split the icc bw patch as sepertate one (Bjorn)
- update the aspm disablement comment (Bjorn)
- Use FIELD_GET & FIELD_PREP instead of hard macros and couple of nits
  suggested by (Ilpo Järvinen)
- Create a new function to change lnkcntrl2speed to enum pci_bus_speed (Jeff)
- Link to v1: https://lore.kernel.org/r/20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com

---
Krishna Chaitanya Chundru (9):
      PCI: Update current bus speed as part of pci_pwrctrl_notify()
      PCI/bwctrl: Add support to scale bandwidth before & after link re-training
      PCI/ASPM: Return enabled ASPM states as part of pcie_aspm_enabled()
      PCI/ASPM: Clear aspm_disable as part of __pci_enable_link_state()
      PCI: qcom: Extract core logic from qcom_pcie_icc_opp_update()
      PCI: qcom: Add support for PCIe bus bw scaling
      bus: mhi: host: Add support for Bandwidth scale
      PCI: Export pci_set_target_speed()
      PCI: Add function to convert lnkctl2speed to pci_bus_speed

Miaoqing Pan (1):
      wifi: ath11k: Add support for MHI bandwidth scaling

Vivek Pernamitta (1):
      bus: mhi: host: Add support to read MHI capabilities

 drivers/bus/mhi/common.h               |  20 ++++++
 drivers/bus/mhi/host/init.c            |  90 +++++++++++++++++++++++-
 drivers/bus/mhi/host/internal.h        |   7 +-
 drivers/bus/mhi/host/main.c            |  98 +++++++++++++++++++++++++-
 drivers/bus/mhi/host/pm.c              |  10 ++-
 drivers/net/wireless/ath/ath11k/mhi.c  |  41 +++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c | 124 ++++++++++++++++++++++++++-------
 drivers/pci/pci.c                      |  12 ++++
 drivers/pci/pcie/aspm.c                |   5 +-
 drivers/pci/pcie/bwctrl.c              |  16 +++++
 drivers/pci/pwrctrl/core.c             |   5 ++
 include/linux/mhi.h                    |  13 ++++
 include/linux/pci.h                    |  19 ++++-
 13 files changed, 425 insertions(+), 35 deletions(-)
---
base-commit: fee3e843b309444f48157e2188efa6818bae85cf
change-id: 20250217-mhi_bw_up-f31306a5631b

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

