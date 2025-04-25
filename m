Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8374A2550B7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624892; cv=none; b=WD7+Ix4HhHMTyHoTLxkOR2DMRIRM5/1rq5pkQBTTZtp5iz9QXEYW9AVZSwncHBgOSYOY7+ikv1oTO5FRPGaVs/sGHjDaZXqswf5+2vIy3X+90pE1McVY/Q3kyyTWOMa7zluWVd/WAUwXFqkH/BCUIi/bX3x5LosdpQzIHmHgMNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624892; c=relaxed/simple;
	bh=CLM3LL+yamKpOdfncrRxmMa2Pwc/ITqBLCQh5XRNynA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mgQVjAm4VAIXuUDrxEoZ5hQ4gAwn4LbiG6ez+rEdBHzAXyp+O9gAa4djk2F8VRtfbV3jKktRRX4PsY7TBRrtVQ5XHvfZ2ETwWxjh6XVTjbpDrPylbJk5MSx446KFExJy582vT8q9B81BvgS1ODabcO+oESSfidXMyT+GZBXWLLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnuogjRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnuogjRD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJvGo024841
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bY5leKmEysE0ZY4g9gwRQw
	CCOo7dT0pBp5t1RvmPLns=; b=JnuogjRDkIo5eVofCzw0Hd63Z1IWw6Z3rCoRCB
	qVgH4sMixSIP+d2uSz7mjV3Z5cbSVlSbwdka3D+b8KcImNlKGIpy3EVDDFTLLQrE
	obZ1QW9E8vrevf6YsWRYl3f+t4AT8XDTGnPiigmWdUIZSuM0Z1IRiTITnXXhDtrd
	YRzENvsZJNYaziffh8tMwup8HtjtTPCs/nXXdqWj0BC8rkJ2D4jcnDGoAy3ggwt+
	kBfefCXwsMw9g23mwlcTWG9ax70Px4qNZYCGYYG4QEP7xZJ+F1AOoa74NHYDTO+X
	IldBmkodv6rLCXkH/KIdSw6T2JNTdRCkM3SV3hFcnYsuUF/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0tdg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7377139d8b1so2301484b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624887; x=1746229687;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY5leKmEysE0ZY4g9gwRQwCCOo7dT0pBp5t1RvmPLns=;
        b=ejzzR0cQOfeHTgM7fvFJQ5fHUNUoSggMW+WeLWLWkFhg7aqTs2FXug1b39AW6527nT
         psIejXhRAWQfiJT4Rx2wM558plUcr+S+TJus/ZUFQN114Xi+BfWH6Rh5YCkYlSMwahd4
         wyyQNs0QtRIWUTvNkUWtAw+X6ZItuAA/3mpqCAEHGrZP4Q0zqE/PsRSehxRkaAjFbxVk
         ddvA+agLW6+As/TI6SHo1ZC8QKtWxxMc1YMczmGQL5ijMxA+kRE7BvAH//2nNsN55ykF
         G2h/vpNKvOFa5Sjj43VjQfsyEKg21c1n7gJsMCAfIjr1nNYgd97Nws87N6YYis7NTgQH
         Hyrw==
X-Forwarded-Encrypted: i=1; AJvYcCWNEkrrl/smsBe0W/AaUlbw9t214ELTj3z2i0eVownmNv9rVtqRkbP3+65i7zptmsEYywpCbC/UCYlOTjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7k7ALhN94e4Is9K5caFd9n6cidXWtTDcDZWzMlHZDY72rWc9
	ROMYjgLlaX/OLPu9PxbGTg3fZKFKlC2ihfFW9QBksmHpuM6m1arWhR5VGIcp+w/HLpn6qGLD6Va
	zZR6eUafwgzF/0WP3otWVDCoSBh2+WC3IhrMP/1HBNSlLMi91TLPXltpkkeE5PKvuPnUfFrs=
X-Gm-Gg: ASbGncsHCT0nOSyUOFZend98DDOQUzQYK9z85EsLOq4QD0jynCsedTTUL0wh3Ai0fdM
	sOWywsqkv/RgDp22sOwpTmgIYlBoAve04pdLrMnvo1+tdBtJ815YQgX4y0lk4ufXJt10P38hfih
	v0jdVJ203HbBDIzGVIQGKhJmkBFoX8sSBsm8rND9w/xV0/gDBs3uQ+IugtWYp4TRMlOYay3AyKq
	smcomzepH9P8NdcSiU+MtszlwJXMYGIFvridIxWccUAQ5OyyFuA7ULuJ0Xg9fUHNxinjOkHhFlh
	SB5l6kp0PI477PvhNeEFDTjJqRk1clOtBx8Ph3ak70jhCZYXd5Txy4+DIZ0M5FHGRQkxkBzeu/V
	4ruQ=
X-Received: by 2002:a05:6a00:1744:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-73fd8e54a8amr5886000b3a.24.1745624887047;
        Fri, 25 Apr 2025 16:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET7m20puHF/56IN7Vi1vc4sJeIlAeDckkPOER1DChLnUF/bgcy6ViYl6PXC+Bgwq2r5oA6Uw==
X-Received: by 2002:a05:6a00:1744:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-73fd8e54a8amr5885970b3a.24.1745624886638;
        Fri, 25 Apr 2025 16:48:06 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a308sm3868948b3a.136.2025.04.25.16.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 16:48:05 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: [PATCH v6 0/3] SCM: Support latest version of waitq-aware firmware
Date: Fri, 25 Apr 2025 16:48:00 -0700
Message-Id: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEfDGgC/x3Nyw6CMBCF4Vchs7ZNKZcaV76HMQTGASahVNqCJ
 oR3t7L8Fuc/OwTyTAFu2Q6eNg7s5oT6kgGO7TyQ4FcyaKUrpbURdp0iN5+W49IEtKLqelWVV9W
 ZLoe0envq+XsWH8/k3jsr4uipPTvoNvIyN4Uypa4LIweOclkZmzX9TYzj/S+eUaKzcBw/nMTML
 aIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745624885; l=3233;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=CLM3LL+yamKpOdfncrRxmMa2Pwc/ITqBLCQh5XRNynA=;
 b=lEjMhw2scyKsr/465JRfH9GU2lwd7af7gweXimVGjBjVNdHJLL2Cej9166jXOI64zj+k+9Gp6
 AP0X1p8/CvcB7JmpqU8WdB4iwOo8MiJWd6cdAY24XO7KTj7GPZjOOBK
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-ORIG-GUID: 5KsW8RK3y3rMcoL4zyCT4HTujY0CSdvr
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680c1f38 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=_3eEL7FArTPTRUMljOsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5KsW8RK3y3rMcoL4zyCT4HTujY0CSdvr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MiBTYWx0ZWRfXzJf21ogDNcx8 lKl89WmUtlOD/G6ZJ7+sXnZ0OII0MUM/HlZtE31ubBVcBkmSl3WmrbFniEjDBmjpavKqJ2p0PRH gCF/h6t7+Jgq9lM7eXfOMmGu8QG1wma0gbU2EVN6jb12D9Y2Xu5p5p4KnKHF44NMPGM9dz0b7DT
 MtzrqSymF/0O5kjnR1ELpR28OGa24fo9TgsxkUZs4D2lv11x7M9nsv9MxXciKO1kRwCqVsDGsSD TAdqEIPdz7eYpIBkGgNQflIgzsKd3sCJb1Tov3GEdHEtHxNHFoNkDHZ4bMhOXldHZmal4cW8RUO P8sEt6pZzjkV4tQewovydqo8VQ/RQFsbFUUcyQs1jRSdIqx0qoYZEQyHW32PmrrRrUdJMSMRg/B
 JacnvvTzLLYTECqmqcp3Y3HkHoVryzfMSeJ45pMlOOBh3ftrc5MQhPIaHnPY+Exf2eQHcK8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250172

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

---
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

 drivers/firmware/qcom/qcom_scm.c | 130 +++++++++++++++++++++++++++++++++------
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 112 insertions(+), 19 deletions(-)
---
base-commit: c3137514f1f13532bec4083832e7b95b90b73abc
change-id: 20250227-multi_waitq_scm-5bf05480b7b1

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

