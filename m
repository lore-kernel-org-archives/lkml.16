Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6806415A8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378764; cv=none; b=lAD72RLkQfCewwOTeOIalwWuj06bXjpuqKthj1Ib9JCByJkWUzV70aXRGgFeb01T3QZKtM2srrxrS77JZnfLCEv27SOIYWHdfiilb/fcvWG8ijUt7JVKL7R9aNlZo1qA0HOb5XeX7Pq+wKeYUz1/INY2LBDIKGcH57vYWMLVtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378764; c=relaxed/simple;
	bh=oly6xKQCtLgn6WK/bKqCbtoEQhZbg2smDHGYPGGVBf0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h5LKa7b6e/lwI+Ufpw2b+JHi9anxSYWo8AL+rCZ2n1f9xdxDLtgUCbdKFzHyAkGRcUNCEGp1/DcIOrT8Qwl5vNjcSCNS09UOg32B9NLvtno37NObJCp5ZN+5m2DpAAh57g3eNZFihW1sAv4ny8BCDsd64vYbcFcXSZ8HUJ7pN18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkSEFdfb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkSEFdfb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEh5ES020136
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pko1fJ5f913jrRVn+s2gvRxSCELMjEDtrtO
	I2RO3+4w=; b=VkSEFdfbvoMtdA640yXVvvKzCACRk7O+RcNXs/B9tEvbMx/Bdti
	8ha7rZvckxV1orN0G0V9dLwX4MDPtVm6XTF2Og6V1l9T4yYYqW2EQK4DMxsKtQpA
	+f81fgBF5RtToZK36GM0BHJko0M1ZFEqug0FMfwqdjPwE6YvhaYfrOfqDiuhMHEM
	zIfooPr4Go6dT7ECsZjRlKj9NBtsnt6CaRoJrqmGoFl187gfoJSRrzxB+dV6dzjb
	YXS6sq10p7OLbqhpq1v561Ya5pmWQWxT5N+Sn4Aw/cQAR0s1DnIkujLxmBkMTrGd
	qOR3TN5oaIG3t0KBE4OKOTgkPr+ip5iob6A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp6058s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso862426a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750378760; x=1750983560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pko1fJ5f913jrRVn+s2gvRxSCELMjEDtrtOI2RO3+4w=;
        b=v0sS4jTJzT2csyEvMgWFujr3/eeW/UTgET8yeWiGFXiNSdEd/KVlnlEdKKJFMP4EjM
         rVhjCDKCzDB9bD/ezQZGxD7zUbySNFdFYUmukLGjmdkwTFj8CeGUh9MnMqOSKtumDQZZ
         LYeDaql8fs4jY34kat9Bpdte8HVZPjiFz26IIjaFPhpxm0n7Z2rMwdqT9EMmXOrL9dEQ
         fICceGQNJkbdvBwTWQ8i2wiRDjH/A4RNXh+jZmtauGZzlzAT5gQODItnTtYAqehASsFl
         aumh7JQCEu8c+O7o8eI2BmPbJoP7tuITyfP1xR9VawrBlrtoYKN7xLx5Rd6w8lMnW0jU
         yj1w==
X-Forwarded-Encrypted: i=1; AJvYcCXiJ1p3q8GEUE5LGszL+dKgdh3PN/kOyWIzcxgLKngBHLFoR93jxz0v1J8kxQjJzLG1K4IgoS8m8eUQhog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Cv08mNv6k7Uf3Rt0PSRgeQ+Jwo2ldSLJY5/plbpNa8+fqZm0
	tjazjyjiMhJCXMDn9wjcXkwHQHJipNGLzDnD7TFwG7Th6qkKbGWz3OyusSnTmkFbqFpYYSKr/0W
	OighPpq8uck1HXmrZj+hGT2BJ2HBGmiQxPkgZoze1xVyP7M8uYsIsEo1eaf/vfzFCuSs=
X-Gm-Gg: ASbGnctdjwSnsBQrKXiH9e41cONYDwpxAQS0wS4qVu2ROy8m3Xf6JxTeMvX22fulFKA
	s5jFB8ZLMRwJcaeCgeiMZaOEmGPPHFLXnt0VJCvoepHgdUGxuoGfqXuaLJtTTLLyxMZAyIdmWyA
	9id88FPDG0qrE+DRKZreYotRHQPpTafJpj5InvKwMsRB8mTy6MQgKcE7yAUelqdePUvj/64xCCF
	zOGfnFh9AZyY8gp0ifv5zFLlqj4fDuqli3B7i6WkM1PSPBKS7hHnTWf9j8dbW3lBD1dhl5InY1D
	NSE+VUSz+vQa/1SbDU20UCo9rDh+SmZIoZI/O2m+GilD6ekx+N5vwGLCtHks8qwgNVVxsUC1dOh
	PAGvBT0ra5w==
X-Received: by 2002:a17:90b:3f8c:b0:313:2adc:b4c4 with SMTP id 98e67ed59e1d1-3159d8ded87mr1783502a91.24.1750378760361;
        Thu, 19 Jun 2025 17:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS/bNyMmpqZhoJ8zKSQMa17rVXP9ofotHQAiaMpr7KV+H2FeaMMCcNL2skFmms3dBEQH8uvg==
X-Received: by 2002:a17:90b:3f8c:b0:313:2adc:b4c4 with SMTP id 98e67ed59e1d1-3159d8ded87mr1783462a91.24.1750378759808;
        Thu, 19 Jun 2025 17:19:19 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258932sm410011a12.64.2025.06.19.17.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:19:19 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v5 0/5] thermal: qcom-spmi-temp-alarm: Add support for new TEMP_ALARM subtypes
Date: Thu, 19 Jun 2025 17:19:13 -0700
Message-Id: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: anq_Kmbc03_mDDTinDZsTaxcjLySD0F8
X-Proofpoint-ORIG-GUID: anq_Kmbc03_mDDTinDZsTaxcjLySD0F8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwMCBTYWx0ZWRfXyW/g9OgsMedi
 LS6dai5afZ/XkTd8FH0/bf0t/BaoKo+7GHSrpxUef/vwwxKeij6HsM3b+tiEz1xySBcixbaw6QA
 ZPfbG3sQIZhdb3051AzZGOjrFp9xD+L91ixinBgkFWhnqo3aOsJxEwJGJx0Si2h6J4H0OWKnqiV
 Hxj+2IQUiIQf+tSeu03xe+l78laRV64gF91cug5wfQKlstGE83fup8XwfpeVdbV54UslGXEm1eB
 MZXQBkzcljwE8BU3+XhDn9dlmZ3IDUVzLp8eciwob3k2JNzIKSGlscm1UlNzBILgX4X+L71iIri
 JlRgnzw08TRbS5rT/Tq1b0LSAxrn6osif8nkLUivdxKjwTGv6tZG6/cR589S9+zvTlwHC4PL8XQ
 fXKVy/0i3wxCIqF4QQ2pF4MRPO/IMOIm4w8q7IOwYIZ8WhuwbbkpZ4YUd5AACYxpHS/2Rg6Y
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6854a909 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=p-nOP-kxAAAA:8
 a=EUspDBNiAAAA:8 a=R1SgPpZEabuFLtygwqQA:9 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22 a=XN2wCei03jY4uMu7D0Wg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200000

Add support in the qcom-spmi-temp-alarm driver for the new PMIC
TEMP_ALARM peripheral subtypes: GEN2 rev 2 and LITE. The GEN2 rev 2
subtype provides greater flexibility in temperature threshold
specification by using an independent register value to configure
each of the three thresholds. The LITE subtype utilizes a simplified
set of control registers to configure two thresholds: warning and
shutdown. While at it refactor the qcom-spmi-temp-alarm driver to limit
code reuse and if/else statements when deciphering between TEMP_ALARM 
peripheral subtypes. 

Also add support to avoid a potential issue on certain versions of
the TEMP_ALARM GEN2 subtype when automatic stage 2 partial shutdown
is disabled.

This patch series is a continuation of older series from 7/2024
(https://lore.kernel.org/all/20240729231259.2122976-1-quic_amelende@quicinc.com/)
but current series has been reworked to address the change in thermal framework to
update .set_trip_temp() callback function variables
(https://lore.kernel.org/all/8392906.T7Z3S40VBb@rjwysocki.net/)

Changes since v4:
  - Removed the unnecessary thresh member of the qpnp_tm_chip struct in patch 2/5
  - Updated order of logic to limit acquiring and releasing lock within
    qpnp_tm_init() in patch 3/5
  - Fixed misuse of signed vs unsigned integers in patches 4/5 and 5/5
  - Added Dmitry's reviewed-by tag in patch 5/5
  - link: https://lore.kernel.org/all/20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com/
Changes since v3:
  - Updated order of logic and made dig revision a local variable in patch 1/5
  - Updated Locking Logic in patches 3/5, 4/5, 5/5
  - link: https://lore.kernel.org/all/20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com/
Changes since v2:
  - Updated function name to include "gen1" in patch 2/5
  - Added Dmitry's reviewed-by tag in patch 2/5
  - link: https://lore.kernel.org/all/20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com/
Changes since v1:
  - Remove unnecessary moving of code
  - Added new v2 patch 3/5 add a preparation patch to v1 patch 2/5
  - Updated temp alarm data function names to be consistently named
  - link: https://lore.kernel.org/all/20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (4):
  thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
    subtype
  thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp
    Alarm subtypes
  thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
    peripherals
  thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals

David Collins (1):
  thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 579 +++++++++++++++++---
 1 file changed, 510 insertions(+), 69 deletions(-)

-- 
2.34.1

