Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B828192D87
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606730; cv=none; b=ZRcxHR/eJwu9iNrfIJzrB1xOAKAZJvtp3YrPujDCuI+ykRmSzTUiTquxeO4cPCtR+Od6s0YX94eS9861a42IRJwMkO4+d+L2do3cdJdK/fwI8JmpbwP42xAS3KUs3Chfo8PyaTqPUelHb/oH/T58CJa8Dmfo9r8RfXQwLA0eask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606730; c=relaxed/simple;
	bh=BNpdicJXoLGWkWg4ZeGn9Ii+XhEcaBNojBK1EIAnv0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UsFqTQ9qgruWL5Fs2r9/r69Xuf/n70qnFTzf6tTs2DV8a+w4YSxjbeLXCi1QGX4nIbsjYAC7Dk7xeVrLhMw6oTQgfZcs5S9tSVEaX4ZqcMDjZkAqih6grUHfwUkOT6QWkMmjfN9WSF51vL+D/cgqlbv6c9KUlC+AbMq4gHLmKpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DC8hQOTO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC8hQOTO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqGS003978
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fi9sboloBMqbSP3EVVpuP2
	G1c7dk9xKFMIdYMIuaGQI=; b=DC8hQOTOKv1E75taRgPLP0NXSuy1/OZcM6G2zI
	58is3urAZkP5OTimkMy/PnOzBVEeoro41Ts1lWhGXqhDuuUrJU1V4o1S8MCDpIFW
	X2h5jr/RTKN8aEOnsYr78OCiuq6VcCjjxuqhhBs/CkPyBan/CNqK+Gq1SCDkDkVz
	wk/VHxoVlNx//HDrBRDaH2PUxDoMk4quEeP/BrFoMNxO7qPd37cNHma6XZTVmra3
	dFhg1MsT5vVxmAz09FhtX1AdQp4KrAeuIpk0Z8+ra5KI9oSbYEti9QcdO6B7C8PX
	iFxLRHbZf47VUf3BB212qpPqzkhWm7NKZOJf7Wp8oQ167uew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a34f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:45:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c95e424b62so254531485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606726; x=1746211526;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi9sboloBMqbSP3EVVpuP2G1c7dk9xKFMIdYMIuaGQI=;
        b=mJZyQipeDEziH3LPC+QX1EvWZUxFfpzNGHl089t5nYxUwM30kvsfHJ8FDSmIH2Uon3
         0Ny8dOcW4F5h7JGhyZsjUcLtJKfst2ULNltLc5DH23WyeHysDoomkg/7EcYecPWuqLqN
         kJ5QMXghisWJj5qFd5Usfau6xpK02kRb8djrQ4jpr+Nkbp4CzKv/JsyPDiZeAJeIxwiS
         OJ5cCWdfp+KvaoYBcddWKcZerfPOApAtUhwsQ+uAQ0YvtDFy82fdYfY25YewBM8Qebi0
         hLdpH1wT+xuoiqIbPTPNBYTimhzV5+23G0S8pEA8aoHcrf5PdxNajVjToFou8iM6POaI
         QRHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX1DvgNO6J3pb11iiVU2HyymRtXFK6GQ6SOOceEwopMTKfcz8Y6vGSlHSN2/9AWrT6cJs3jNahQlGCaYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKWIYip70mn1SiAJBMJe8053zHUmFm33iEXUoippSOdMNP2Qcv
	WsfRj4f5UuG0GNzXj12DPsVSKoR/DIaPu+hHUBz25mF0o8Q3N7QiojC4ZEfIrtsg+ISD/VzT/Q9
	32wwnPcHDlDnI4mfoE2dKI0BzpJ4RZ7/RJe5eyRTHvSC1X3MdyiNW5pByEHX2yz0=
X-Gm-Gg: ASbGnct5rlf/EF3vV4S71z2Dx/MCz3gFmb762+g3JhbnIrx+vkpA09C2/LiDV8Uxpoh
	CyrnZVhRvncc9qcMRzSEXqxR61DIWd4B02tpMXAJOiQH2HllXJEP45lrRCcfZQapeCJNOUeksWL
	NBxKkJLaar8ThUHkWFjytCRi2/TGLH2hCnof+07m8klPPYdFOmB+aL5Mf96kAVzOcJBEJnWgPOS
	+IlWl/cbRjYFsnW6qDBihU2a+sdc4DA2ZKHQ3EbV8F0OAu8zYUWfKMWR+YNxqvuOzNevkVfmKT0
	vNeqWCRErFhkTDWEJjUpQcJMCZaQ+baR5Il6nM8f8illoxj3AJf78oNguVu1PsWETuHNN3s8Wwg
	XfBqj+tqgwBbE+q2fNR+NTkdP
X-Received: by 2002:a05:620a:2805:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7c95859ad12mr1195495685a.2.1745606726217;
        Fri, 25 Apr 2025 11:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXm1vmoiTdWeuAnhhj3urgNVnN0twLPssYE6XSpmYFJdZ0adsQi97fPa5JHVZwSSNcVjQcmA==
X-Received: by 2002:a05:620a:2805:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7c95859ad12mr1195491485a.2.1745606725857;
        Fri, 25 Apr 2025 11:45:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8979sm688984e87.257.2025.04.25.11.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:45:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Date: Fri, 25 Apr 2025 21:45:21 +0300
Message-Id: <20250425-rb1-bt-v5-0-154b35435b4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHYC2gC/23MTQ6CMBCG4auYrq3plIG2rryHcdE/oIkB0xKiI
 dzdwoJgcPlN5nknknwMPpHraSLRjyGFvsujPJ+IbXXXeBpc3oQzXjLOgEYD1AzUeit0AagUOJK
 fX9HX4b2G7o+825CGPn7W7gjL9ZAYgTKqvVSVRcULJ2/P0OnYX/rYkKUx8v+OZ1c7RAYgUBlzc
 MXe8c0V2VVCCY1YCevdweHeic1hdk4Cq620CrX6cfM8fwHZFY6pRQEAAA==
X-Change-ID: 20250201-rb1-bt-cec7a314991d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BNpdicJXoLGWkWg4ZeGn9Ii+XhEcaBNojBK1EIAnv0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC9hEry2y1Ev170WQH7/km4wS0ikUFkOMMx0Q+
 9w2dIomY3+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvYRAAKCRCLPIo+Aiko
 1V22B/4kNUWwXx7Dp4N9DP4cXRd2PdCtSJIU1T3SaM6f+8rlx84DXdhmQX26TS4tdHl+wWxVg0C
 jQs+HmHg+2N4I2MSEkgMwvnuhbg+eJ66NAavDPgclLF6xR0ECVBg84++hiijCxkGoGpfsJJWqfW
 zwqbrMkQyAXJpHz55VB+erQPNx0zzA6kqqUBsXdP/7pulq9A6d43Ln8Mn/OqAvkUMLm+QkJl+Wt
 +5ZtGbl0PmhVn5S1wRAvvBPz0q6rZvS56XPX0LWM84R7Bi+URdViSzbtCY7ZUvRsNLaJszTcomk
 yBf7s76new8y/mCHZVBvwS3X8b28lOeLAYo1L46N/RxkDVRM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bd847 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QHDpyB9KspxQiDUAPI4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Br_EQE5j3KCW2s24xPLArVdLZgjm2OYo
X-Proofpoint-ORIG-GUID: Br_EQE5j3KCW2s24xPLArVdLZgjm2OYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX1HnGOoOCKCOd E0xGeIMCVeC3itK+GGpJQokANfI56ujpdvaR2OM/Ps1CddpyWAhwbL3zL3dvQPqmqFzivdz1JCP efmgleqHhluSpyGz4o+DWc1z8Rvq4d+O34VTPpuLQhPGJHd64boUQ8oYZPozpjPc4k07cgaL818
 VbgAuUPiguc9ACgNLezCbPLZcnH+b+p6dTH8hbBJqZ9VEPLIydZKRB+6NnAE96W7i/o9O42OKQ+ clvlUXnqOweFuEbdTYz9s0+rRkxr9gc8Ij6SaY0zbuX+FoRUUUzrmPB5DE/xQZfJp16pKGRQrrm 2GUw2CgkMq8/CKIhYASZrGX/XzeN98QTaitEelNyCZbO7CyteUv2cZr1BB2Rob9w2sBLuUVcigy
 LugABxVPfvj4vEwwQ7YLAG5+j7fdCTJbTNLAgdzXBIAgwW7yavjI5AMVoICQZC5nKmQ7mubr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
of BT/WiFi chips. Add support for this member of the family and enable
it to be used on the RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Rebased on top of linux-next.
- Dropped applied patches.
- Link to v4: https://lore.kernel.org/r/20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org

Changes in v4:
- Added empty line before status property (Konrad)
- Reword Bluetooth commit message to follow linux-firmware changes
  (cmnv13t.bin and cmnv13s.bin were merged).
- Link to v3: https://lore.kernel.org/r/20250202-rb1-bt-v3-0-6797a4467ced@linaro.org

Changes in v3:
- Mention new firmware files.
- Link to v2: https://lore.kernel.org/r/20250201-rb1-bt-v2-0-fd44011749bb@linaro.org

Changes in v2:
- Corrected QUP interconnects (Konrad)
- Added /delete-property/ interrupts and an empty line before status
  (Konrad)
- Enabled downloading of different NVMs as required for v1.3 of the chip.
- Link to v1: https://lore.kernel.org/r/20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support

 arch/arm64/boot/dts/qcom/qcm2290.dtsi    | 16 +++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 83 ++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 8 deletions(-)
---
base-commit: 948bc2b5c6fec70fb8c5b63c78aaa27611d7eea4
change-id: 20250201-rb1-bt-cec7a314991d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

