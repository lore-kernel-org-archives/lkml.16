Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021011F869E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816347; cv=none; b=u5VxAmI3j8k+CogLNK6lsWE4uMBINQH5abAGlmbd+qqD6385yfOl0Ggo6ASQK4kUlkb/AUYaCFz+DkqzVtPtQ/D6TnjoKplQwltrH/b5EpyGCoJd7YiHSu1pZUW87/06EWqnAv3IMQmb0fT/vrOAZ5TYYgTXUiQihEu59cOufHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816347; c=relaxed/simple;
	bh=Z+pmHr0ci4IImKZUHWc9uRT78PbJkNqgUbN0P1+9dWc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LqsQcpyJuAHqsSgZgjn4IztJh69ZrOmPH1xUZC25fxuObmTo4vaJQeHWCW2lm5VqlRzebVE3Z8mOtLu8VM804y0Op+EzAcvYeN9UTF+wnDhbkgQEcNPSGFdvKaCHmiKWDsSzsOUDryQXpv/CJok/idoPXvGYQm+ifs/7o6cJQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+a1Gs9x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+a1Gs9x"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5KRqs006694
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L3ZBOUCYfdjFpgCfFbZSTY
	CenVFdfhrgxuqbRVKknHk=; b=e+a1Gs9xHvIqC8NZBjlApbcPDdMR+Uzdj1TApC
	7PtxxTJTQtaRxrlthnToXxZmOzkp5Rcs/Ym1XgFsJg9pi2GVrzGzPACbRG+q8R1t
	nMdRD33lMkDNFEvHjp/zNRBI0D1TNBCwf4LO4gFLGGxM9u7ep3AsU9NdmRFhiTLy
	4KB2saZCZrRXb+5PQA2psJdM+b4pIIQam9cM8hrYRJ62OEIuJ1p8panUvU/a9DY+
	e/0/BnqiqIRK546v6fznuNDMfBKxxcqKWyMyp+zoBsPDXeotQM4AE5yDCdv8jlng
	WVGjW6kmFm/j9xNVY/WYGf1KlIy01dSHcbq9DQCQAVZTe11A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0j82j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:32:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231de0e1ca3so44095085ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816344; x=1748421144;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3ZBOUCYfdjFpgCfFbZSTYCenVFdfhrgxuqbRVKknHk=;
        b=OufzhAe24VL6dP23yYDXtM9ubEL0ttD6rJlemEHkYs/36c/XqXQufsS8wAFJYoVobS
         8+0RRK4fJRytkWd15HZifbYuO5D1aroMBb1QEl51/nSvoh4KlHqDlUpRfYHW209e7zEE
         DEoY1xyna7agqL1fzDbfMfdXlMuwJ+7bScTotE+FnEj0dhudpHToYqB/9vOk4XzsPcEZ
         6sWj44lsgzm3iLtkFvFiypmhSQ9Xt8PyAvOt+CAm5wID5zdo1gzcL1EQDRXDv9R2mYq9
         s+JIkVVdLOg9q/jVCoF4f+fYucv/ysV3Hl8MQ1/xulpbVKk0cMODQBSIMmDcZC5rgzHr
         oyZg==
X-Forwarded-Encrypted: i=1; AJvYcCWloHYkhzQT4W/FVLc2a1Xr2Gt4di68Vvt185em7uLY6z5RW0Hw2MhxETfCxoG6k/6nvMYQVJ3WhDKkxuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7KE/ndLZNNekwEWlvMWTVco34uJmJ+/+PDjA5A5n8RCYb5tJ7
	aLLx+PbOlZwaXyeQgpEjOvl91wQLv8Kq6ByShRKATY0PTyC1VG4VNaioiaZWBoNVzndc0UjwcAR
	0QE2jPymLdIz2uN4yL/XKUSX7CrJOTebZy8gSs4cEY4GWwnP9GZkWljd7SMPbzq3bnk8=
X-Gm-Gg: ASbGnctN2gYWIZIFCKL6EhrxEj/sNmorGoXgPoMLUUjycQCKsyT+NJ2h65ItC1bmrcH
	sXh8kjuAJeCOQ3t6L5JFteg3k4hTduMi5T5Tnw/ljogHZY4VNu4jlqaUbhELIAgmispbyuZuSEr
	2ENqsPgVn0BfWlOtPC+kSS2LPDGS07F6d2TEP5DJpMJtmVQJgtiQ0zKmhNOf9PfXusH1W9Ehpks
	7MLMx5ZPUN+wcomkovnGBHdXGySvaOFJGIjSUNDEi6sfO8Nucy0Ul8bcJEE4Uu8FAL78DtcYMLN
	6eTmGaZ2YBBWAUyDEHhamApvzg==
X-Received: by 2002:a17:902:da86:b0:231:d0ef:e8fc with SMTP id d9443c01a7336-231d459b1fcmr280547425ad.33.1747816344045;
        Wed, 21 May 2025 01:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzKMSUbAujjFG+X+OzmPIuqvvDeHtm3PqSF8ObtM9IK8ua8My2FN2tJYifhbOCmWpcdAD9NQ==
X-Received: by 2002:a17:902:da86:b0:231:d0ef:e8fc with SMTP id d9443c01a7336-231d459b1fcmr280547025ad.33.1747816343614;
        Wed, 21 May 2025 01:32:23 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm13194265ad.254.2025.05.21.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 01:32:23 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Wed, 21 May 2025 14:02:09 +0530
Message-Id: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAImPLWgC/03M0QqCMBTG8VeRc91km860q94jRM7czEG62jEpZ
 O/eEoJuDvwPfL8NyAZnCU7ZBsGujpyfU8hDBv2I89UyZ1KD5FLxUlbMmNDRggt1rGiE4koXBiu
 ENLgHO7jXjl3a1KOjxYf3bq/i+/0xzT+zCsZZOfS1qBH1UeuzJ8ofT7z1fprydKCNMX4AzLCtX
 KsAAAA=
X-Change-ID: 20250426-ddr_stats_-391505b3da6a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747816340; l=2995;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Z+pmHr0ci4IImKZUHWc9uRT78PbJkNqgUbN0P1+9dWc=;
 b=EeFIC0ShrQJhQx71FaHe+OqQiaKR8idtLxVWdDSbw/XH7kzD/sRVQLrbUR3azo3KetGTquhM1
 KlG5fOrOSA2CRG0xzKEuggp8TI0mgxMHqisg/W65Hy13hMoCxYgIU7Y
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: sBwL2_xLOzjvioKj5W89HUnQaDGRbqJW
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682d8f99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LL9MhAs6j1V-iqFh5R4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sBwL2_xLOzjvioKj5W89HUnQaDGRbqJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4MyBTYWx0ZWRfX/c6Dqy5LWU9X
 tZjcyAH9mUqmCrEymhi9aXKCiY0GAOpHcUZluaZCsBU8GYl5EkhExnjhqrsfUY9QT3/3c9ReQGW
 loVRpSdskxAtXtq9j2gtyMSzrlK/UjEWS23g1otOgsc8htQ0woWfSVTp2JvrnNtuiEqjH45AIMA
 fmUCSKC+Uhm+JMhzonCA8z6+wA+8kyeOYo27V/MsTF22wu0Z0/5cucyvtgwt5a06PPcEKgwFgns
 I4FGRVQ0Rfjov9Ee4wWJHuN8fzlkdUTHnN0BRlFua+v5evy2BJoebfrtOlTsgZ/XHthDAB4GnQs
 dLkIC30SKZyFUGIBdsodXc/RGwZGRARMNXhUiQR/4t7mauvEqQvTONhyPqJQIycpg5t/GiWYmi/
 y75onS1C4o/xvFeMVQ1xyOC4A0bYEArWt7HbPp3u/H8zcNQxM6D9AGw2otCNsvL/+iZ0P9N5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210083

This series adds support to read various DDR low power mode and frequency
stats. This was added in past with series [1] but reverted with [4] due
to some SoCs boot up failures. This series is more aligned to downstream
implementation and fixes the issues mentioned in [4].

The series [1] tried to add three feature support

A. Reading DDR Frequency and low power stats from MSG RAM
   (targets where DDR stats are readily available in MSG RAM to read)

B. Trigger QMP to ask AOP to populate DDR Frequency and low power stats
   (targets where DDR stats are available but duration field syncing
   requires QMP message to be sent to AOP)

C. Trigger QMP to ask AOP to populate DDR vote table information
   (To read different DRV / Direct Resource Voter, CPUSS, DSPs's votes
   for DDR frequency)

Current series do not include reading the DDR vote table information (C)
part from [1] which is to be separately sent potentially including reading
other resources votes like Cx Rail level vote information. These vote
tables details are not strictly related to DDR Frequency and low power
stats (A) and (B) this series is adding.

This series updates respective SoC devicetree with QMP handle (where DDR
stats syncing is required) and it is backward compatible with older
devicetree as without the QMP handle present, ddr stats can be still be
read (duration field will be read as 0).

Note that [1] was only partially reverted and hence device binding update
for QMP handle [2] is already present along with the fix to have
dependency on AOSS QMP driver in Kconfig [3].

[1] https://lore.kernel.org/all/20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org/
[2] https://lore.kernel.org/all/20231130-topic-ddr_sleep_stats-v1-2-5981c2e764b6@linaro.org/
[3] https://lore.kernel.org/lkml/20231205-qcom_stats-aoss_qmp-dependency-v1-1-8dabe1b5c32a@quicinc.com/T/
[4] https://lore.kernel.org/all/20231214-topic-undo_ddr_stats-v1-1-1fe32c258e56@linaro.org/

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Mention count in decimal instead of hex
- Update read failure cases to return error code instead of success
- Fix typo in comment
- Link to v1: https://lore.kernel.org/r/20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com

---
Maulik Shah (3):
      soc: qcom: qcom_stats: Add support to read DDR statistic
      soc: qcom: qcom_stats: Add QMP support for syncing ddr stats
      arm64: dts: qcom: Add QMP handle for qcom_stats

 arch/arm64/boot/dts/qcom/sm8450.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi |   1 +
 drivers/soc/qcom/qcom_stats.c        | 126 +++++++++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-ddr_stats_-391505b3da6a

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>

