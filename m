Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E3F27470
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745899358; cv=none; b=f73KOsucxuVmNcXDRDW+4RYMlRt+T5DRj4CBKbJRU7+yT5zMZGUlq8+9ljkoC2fMTYdWyAaitZ7TzA0vTWlbMq49it8KLkdKULB8guj7ptAqK/Hg2ctp1WCpKaO2EQzErQIB3MfjUviTwyoCoDrwC85KkOHgYhM7VBkxOLTcG5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745899358; c=relaxed/simple;
	bh=ewyN4s9Zb4rKfeEtwBwnUnCLyrklGDwG9BhZeUolaVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=je/5cL+fBHqBz4UbvzYZjY99F+PkKvHMEodk/12ZGFppygH8TcmbSZAD7pwD5Al+xxsxHU7BenYVflUJEHlekUjFNYpL+WbxIj8sy3VB+b1vq1W3J9sNTOEp5nj1T7xpn4YpQd9iqmF4B834zIHBTLj31GfYGLVyv4S6IWDPMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/4r+JUP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/4r+JUP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq1Rt030391
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MQOMcTqCEqcNFPlmglwpnX
	1yVDY/ZRzLIDa1dQXcAo4=; b=l/4r+JUPIVZTwfqViuKuvrVZPZTonVRnPVRsZX
	ZElCp1Q0HXqqC5NvdsTFrjva77B0jlrGYLqhYk7EDkaF+ibQOBK7qcy12lkFyias
	eQYjbG0DfQV/NUyZu0FoLCpjaNqpRjxZFhdTXgd5p8Tb7/rVZ6/9/9BBC8AvBODh
	NH2Rue2IluOXHee+e4V6nDrfkvlKPHb15iiJE4JyNK6doJIl6WyjZRX3sEOYK2VE
	WHBQt6MVUv3fw0t7j1VAIniJnrDksWxznJilxB9mfbx2Zim5eCOQ7hpFe4MEWGa6
	6YvIUofJRNzK+Tm67i/viDYaR0uhRK3Ri07qT+VwgRAwW3jw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevj9ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:02:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2240a96112fso88429285ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745899355; x=1746504155;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQOMcTqCEqcNFPlmglwpnX1yVDY/ZRzLIDa1dQXcAo4=;
        b=JRHBJptIO3rP3N+TOqOn1Q6Z4dQK48QjKm3TRfQu7cz59XdQbEFBP3Foc9gxnYlhUs
         kyAH5BajvNy3hK12XOos5YH02ad+EWYZZhCLj+4hPamU36LsRAiRza1x6NDGa0oF07EF
         UuMqlviPOfiW9joDGnrsGYpmCrqCJWhCs41oi8mqL7KNv/wxjB8pxsSufV58sr1SReSa
         nACHzDhV5eYhjOtBrM/bm+kt8kPr2oAHjivzC4nzfL+QoCbH7G1+ZMnSqqESgqt58U5c
         7CX9aesd7AR/ZdeNfSYzjWzHBi//nE34NhwWCrJIksXGxwo5OsXzFahaxIZEozOoNCgH
         KZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXKBdCxSETLQOT9SqYXIwVX/2hc2qbNUWjpYE6o6qEj+n22jL0LewslYS/MwBqTZin9lSTXDuxoxJXh6AA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpiwl9tdI3jF1+Su+ArJjdSOKV/UqebrxcCSCTrR6GiiW94KLI
	LEQlGN7KObRSPhHrJpgU7TaqFD8Nl3jO6Vb8WBhOMmOsCHFiKvEJz222ymJ6YRPG+xAcaL98qxX
	U64Sq4Ma2AwMt4ULcvX4H79Vmj6hgHmg8j6vZfkjF4i2uqh2XrNz4NmQpzXUi9oA=
X-Gm-Gg: ASbGncsfSukBTXwL6HyukZkCkcjdu+X63A2gVUEFPU3UFzsL+bIGYXGX4q27jq+W9Pr
	8WLy85r0diJAxN/7AAV20QM7uSUexGy1iCG5Ti2KdhP2g4/BXwzyKWFssmZ1anrZfZ7cIkdKv86
	svLarkLqmaDfUEPPZ4fli+FCOk/LX86tAJQ1YRxcmBb4pwOau2J09Gn/JdKDBPsx56HlomhGtmY
	TTJc1E7caG4KHySTMQY8cFTs830gIOQEvCLa2sKWXUsr/JmDlENVuwUet6y88bdBDRkBHM0Um+9
	tRLArUQ1y2CZj3yo/e6kpKko9A==
X-Received: by 2002:a17:903:22c2:b0:221:7b4a:475a with SMTP id d9443c01a7336-22dc6a8a948mr155240175ad.52.1745899355012;
        Mon, 28 Apr 2025 21:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfeveEwDRtBqG6Lk7bB0D7+sUUPKuDIbAdq/68nC+bRSnjWFgO8RVXd3ZJwIdE0t5+GjkvYQ==
X-Received: by 2002:a17:903:22c2:b0:221:7b4a:475a with SMTP id d9443c01a7336-22dc6a8a948mr155239935ad.52.1745899354688;
        Mon, 28 Apr 2025 21:02:34 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef09985asm11077957a91.28.2025.04.28.21.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 21:02:34 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 09:32:29 +0530
Subject: [PATCH v2] pinctrl: qcom: Fix PINGROUP definition for sm8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-pinctrl_sm8750-v2-1-87d45dd3bd82@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFRPEGgC/13MQQ6CMBCF4auQWVsyVEqRlfcwxECpMglQ7GCjI
 dzdSuLGzST/JO9bga0ny1AlK3gbiMlNMeQhAdM3090K6mKDRKkwl0cx02QWP1x5LLVCoZu2wzL
 HotAK4mj29kavHbzUsXvixfn37ofs+/1R+T8VMpGJFjXqExrTGnt2zOnj2QzGjWMaD9Tbtn0Ab
 XcMsrMAAAA=
X-Change-ID: 20250423-pinctrl_sm8750-7abd08406675
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745899351; l=1896;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ewyN4s9Zb4rKfeEtwBwnUnCLyrklGDwG9BhZeUolaVg=;
 b=ua6PF0Rn3GncpODIKmHe2SMs9xkGtQZHP+cFSzYbkhZCEAJoX5uk2eFgF3iAzQxJhgn9NrKg/
 flS+60G/fDXDQUk1MGKynwSFjQ1dBiVn6fm4TjEGavnuWh+R+jIkEYf
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: GWxwCj5HEZhrZHkTDQp_AH3NPTCBrNNj
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=68104f5b cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=61JurpKn_mCFDXP9eHYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GWxwCj5HEZhrZHkTDQp_AH3NPTCBrNNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyOCBTYWx0ZWRfX/YovXMKoRfcc RKyCfb4ZS70Zs6yL8+fXt6sRPoZynbL0KmiNfuvPCUXiCbV+seaYvOtf84j7NhDS1jwGyc73ein R8xy85WJjBt2GmkjMJ+MHcGqtA0BIupokt1r2/dl0pDfGAubTRQmVnLIqWmvFJJtlytGwpKQwAH
 8+u7DGGbGwNR0skXKdrw4Tawrwt7RdAxQKaAPV6PCvH2I67B65VzwkP+XlVbb2rORH06TELBiZA gReK6zbiaBEhNWwpHBvoQBDLZEUKq/q0b+xsk2nhPQMW2KlyytpI90kVNBRohjZhWjZZ7p7zmld IWlqqMcJPv4Z6gV5HCqTy51fsndTy5nEI8/M9LqBwHQYVQLd1p9N1Ukjha+ANCnqiokRWi73HnI
 Jb7DNU3lFeqZTXRREQK6oLvRx6qviN2pznDml1l1huhR7WitxghCAb0KiSBlP4gICKu1rl1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=612 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290028

On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.

Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
enables forwarding of GPIO interrupts to parent PDC interrupt controller.

Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
Changes in v2:
- Fix spelling of definition in commit subject
- Add Reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 1af11cd95fb0e69fcc876fe069cc2cd6fd6679fd..b94fb4ee0ec38013d8cde7e45a7d6088a20e3b28 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -46,7 +46,9 @@
 		.out_bit = 1,                                         \
 		.intr_enable_bit = 0,                                 \
 		.intr_status_bit = 0,                                 \
-		.intr_target_bit = 5,                                 \
+		.intr_wakeup_present_bit = 6,                         \
+		.intr_wakeup_enable_bit = 7,                          \
+		.intr_target_bit = 8,                                 \
 		.intr_target_kpss_val = 3,                            \
 		.intr_raw_status_bit = 4,                             \
 		.intr_polarity_bit = 1,                               \

---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-pinctrl_sm8750-7abd08406675

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>

