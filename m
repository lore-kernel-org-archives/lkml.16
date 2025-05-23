Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D7E299933
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027276; cv=none; b=KBPGK6CJKoIQcFeVvqh1QuFGQmcHZfg+JNV4eykpy6XjZHHA0zczHCYo6saLncWVjG4wmsSAe60XqyWeOTpOvk3gPjvAIgiAGjqDxBDo2gjkMs8oeymSQ9wALjlxVMKKrrIWrsesH0x6xOVHaODJVJL9XjSwY6aOWbSmcSlEc2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027276; c=relaxed/simple;
	bh=RqWDddVKBVSB8DNsRcLRYLWSWKHisQV1n/qob9as+HQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AohBBgUmtSW6hBxvMtLIRk5SkKN9JQxt11LGP3+ZMgAthXNZSv4qOyHWjLR6yo/duKnSeaNhlYdLlu93p9vHdLpS58YACeZML54jAtG5eM5A2gCAnuAYxn/SlqgtWdCYS3GeCwMjyDVP9ZXXLW9ameOpxchQQgi7MbHjdfXbFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPso4De4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPso4De4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBsCUi016582
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dC4YbS8t5qW39B4qR5dXMx
	f2AprSAL4geh92MowQSv8=; b=iPso4De45aIOhUV87Q8QAiaa41u5YkhKG1Ez8Z
	MlRGNyAztNkYbRZsS9WF037rN/mMBJkKmMw85l8vHX7drL3bhsqggx0BYzFw3x9o
	h1IB8juJ0H6+s6s1UnUMWXPnUcqJ4px6fZhb72QxLSNoxtfO1VC0FGgEMst6B7iy
	nnMbX8mxgghCuropgcx/tMTwTVbOz1POeutyfUBIRVbRdoAqPMLqKz+mrwMRgB1t
	Afx+H5xm/RCiCr10vmfK6LytfPvCVhLUVcdi88bWhO0LkpZsuRwVNXvjaYyPEFZb
	GD7Bzi5cBAR36+BS7ogELcKXmW8o+4XrP574roW55mChd4ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa3241-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2321215e4c1so12373995ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027272; x=1748632072;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC4YbS8t5qW39B4qR5dXMxf2AprSAL4geh92MowQSv8=;
        b=Mvbjlqw9xxiJk9bU2xwICa5ZxOfXfrEgwExs+iBrule+CknJlh0hmCoTihp45PHhjr
         RtCsuRmJtpaMOJHUJwuB7jg+gcMjB2mTwqbBxTvs+jpaI5+P6vJSxDY01DNuox96u+qK
         pFlYq9+XsYuXx3FSRZdwPCyBSgm+mdHQLUGtczNkmgLMVqv2KQTjcNesY/p+WcshfBqU
         FXt9SMmQr4P+TWCyZeREo7wduRE2F3Ny6WlgPHWM5NU/9kE2WLubfLxwoYqKayJ9Tus4
         qsTZZVeFGfQS4c7+J8mdHeqC2Vwot9n2MWEPVemDJkBZZL9eLGSwKMOFJSuD44vo1MjV
         35HA==
X-Forwarded-Encrypted: i=1; AJvYcCWClBYfzWWEkBH+6GajM9/VV7zgOVRulqeVwuZFa+/wJasN/EnH8r2onXwTD8r7sP7N2FlE03HS9OafBTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKC0sVuodfCf7ZW89A9b4guOdrmrHaT10an8n2uyV6/1v3Jyj
	3dZoSIgVyW5oOgTNkkAKQsSPzk0Y/iEGaSRVQxM1JinHLhz3s0Zr58+4yGXVCTijoJkj8Ir7eQx
	NUq5HNvLSLQ1NH91Nfc7CScMN1vDbOe6wwlUAiysv/jIfC0XK80xRmwathePK8e4rx3s=
X-Gm-Gg: ASbGnct3FcJTnbFppI1Eog0RjA0Ag7pBWEk9L0I7zcYyadbFJ5yHM2Xya+jIdlFeTMU
	XCszu3CoYQsQTTpqjDbY5YxvCQl2NGnT2UW9Rg0t7HhumUN8KBEGxUnLn0+t18DHcXbmB8y4wEu
	PL7Q9BFQdowcBAWVDC2p/+KdA8ssYh+UD2NQf4TlHqL2sXaAg1+xOT45/hsvtOEwVvzZJaVqr6A
	L78/PSsx+avXYBNS6QmFZ78HzBj29YIUTQe2QlagsoD8hqxiQT8dGsW+uJUUD+zFhMgLwOfdV7s
	kfweLscxxpR2gw0icnl70ItiVI7agsAqGPByqg9jF3YoFiwD+qg8LdQ04RZjjGzLwS4hYgWzo4O
	YF/k=
X-Received: by 2002:a17:902:c94a:b0:22e:23c1:d711 with SMTP id d9443c01a7336-23414df58fbmr9738405ad.16.1748027272330;
        Fri, 23 May 2025 12:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErfBpxgHCnrnmCVLta1aBIxjn+lXfdRkgYEcuR/jezA+PI/Jn1guTSB+pd89aPktXoxSQk6A==
X-Received: by 2002:a17:902:c94a:b0:22e:23c1:d711 with SMTP id d9443c01a7336-23414df58fbmr9738045ad.16.1748027271918;
        Fri, 23 May 2025 12:07:51 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97886sm126652165ad.146.2025.05.23.12.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:07:51 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: [PATCH v7 0/3] SCM: Support latest version of waitq-aware firmware
Date: Fri, 23 May 2025 12:07:39 -0700
Message-Id: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHzHMGgC/2XOQQ6DIBCF4as0rIuhKGK68h6NMTiiTiJSAW0b4
 92Ldtnlv5hv3ka8dqg9uV824vSKHu0UQ14vBAY19ZpiG5twxgXjXFKzjAHrl8Iw1x4MFU3HRFa
 wRjY3Eq+eTnf4PsVHFbtz1tAwOK1OB+yqXXKTKZMZz1OZ9BiSeUGol/hvRBjKo3CCBKw5wAF9s
 O5zLlzzg/2Nybj4G7PmlFFoVAFKqLxlaWm9j7waI2ZOsdr3/QsvxGRN9gAAAA==
X-Change-ID: 20250227-multi_waitq_scm-5bf05480b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748027270; l=3585;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=RqWDddVKBVSB8DNsRcLRYLWSWKHisQV1n/qob9as+HQ=;
 b=+M9QJMeHC5wd796T6pVSmSUukfdwLH55HWHeze7LVHKf1eDXjUVs49HITzCMDF1BuWOzw3y2v
 FKYy40qkmfaB+hOwYidRX70HE7soc+WFSdzEz/xczfT99dXGSfD7QSu
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6830c789 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=_3eEL7FArTPTRUMljOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XrePQFljMrslfe8L7Rv1DuBZgmjZn_09
X-Proofpoint-GUID: XrePQFljMrslfe8L7Rv1DuBZgmjZn_09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE3NCBTYWx0ZWRfX3AVSYXbvopMT
 jmeYfn6DRayRq4fnQPJ16FjCV1TkADk3XqxU/EJDWU/IUIE/JZf4IlRBPqBR3nwXetS+CsDeHxh
 pW1PdObtuD8qWzcE+0nJrO/m6O4gAKKJh+XKH5b105nJYMvMxHSf+ud9EDv4QMfT62F5rtJ+L5/
 E26BCv/E6g9opDDvrEypcKJ9GjU5Z2ukuG8sa+sYQVHwoCSvcAvqEP6NTpOi58pm8otFrnQnNXi
 Ac2nrhDhBX+zlZa9XUB06V1Y6V8OmVE6P+Y91BYUoGSGuGrs6oknC21lbpmFcENLT3CuJIn7Owr
 0uawSbKtIrQ4h2GJNQGEcDFgtdTRZYomX2yueE65zDw+PtlJgvIWseMJwYkhHYpHd/3O3it/JMu
 zDuKG9orieMbQtSGBk58icawf0xmKMWffLE+rOcexqTUwSiogN0JMlHjpggB3CUQYitm6dvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230174

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

---
Changes in v7:
- Assume failing scm call to mean WAITQ_GET_INFO is not supported on target
  as qcom_scm_is_call_available() is handled in Qualcomm firmware's TZ (EL3),
  which doesn’t implement WAITQ_GET_INFO, and therefore always returns 0.
- Link to v6: https://lore.kernel.org/r/20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com

Changes in v6:
- Added R-b tag from Bartosz for first patch.
- Check if QCOM_SCM_WAITQ_GET_INFO is available before making scm call,
instead of assuming failing scm call to mean WAITQ_GET_INFO is not
supported on target.
- Add a new patch to check for waitq idle state in wait_for_wq_completion(). 
- Link to v5: https://lore.kernel.org/all/20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com/ 

Changes in v5:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Modified qcom_scm_query_waitq_count to take struct qcom_scm as
argument; scm is anyway stored to global struct __scm after
smp_store_and_release().
- Tested on SM8650 which has multi-waitq support and SM8550, which
doesn't. No error logs are seen.
-Link to v4: https://lore.kernel.org/all/cover.1730742637.git.quic_uchalich@quicinc.com/

Changes in v4:
- Moving back to redefining GIC_IRQ_TYPE_SPI and GIC_IRQ_TYPE_ESPI macros
in qcom_scm as seeing compilation issues in linux/irq.h when including
arm-gic header. Will send a fixes patch and move to dt-bindings in next patchset.
- Fixed a few compilation errors.
- Link to v3: https://lore.kernel.org/all/cover.1730735881.git.quic_uchalich@quicinc.com/

Changes in v3:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Prettified qcom_scm_fill_irq_fwspec_params()
- Moved waitq initialization before smp_store_release()
- There is no Gunyah hypercall API that can be used to fetch IRQ information hence
introducing new SCM call.
- Link to v2: https://lore.kernel.org/all/cover.1724968351.git.quic_uchalich@quicinc.com/

Changes in v2:
- Dropped "Initialize waitq before setting global __scm" as it was merged here:
https://lore.kernel.org/r/1711034642-22860-4-git-send-email-quic_mojha@quicinc.com
- Decoupled "Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL" from series
- Converted xarray to a statically sized array
- Initialize waitq array in probe function
- Remove reinit of waitq completion struct in scm_get_completion()
- Introduced new APIs to get no. of waitqueue contexts and waitqueue IRQ no.
directly from firmware.
- Link to v1: https://lore.kernel.org/all/20240228-multi_waitq-v1-0-ccb096419af0@quicinc.com/

---
Unnathi Chalicheemala (3):
      firmware: qcom_scm: Add API to get waitqueue IRQ info
      firmware: qcom_scm: Support multiple waitq contexts
      firmware: qcom_scm: Check for waitq state in wait_for_wq_completion()

 drivers/firmware/qcom/qcom_scm.c | 127 +++++++++++++++++++++++++++++++++------
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 109 insertions(+), 19 deletions(-)
---
base-commit: e85dea591fbf900330c796579314bfb7cc399d31
change-id: 20250227-multi_waitq_scm-5bf05480b7b1

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

