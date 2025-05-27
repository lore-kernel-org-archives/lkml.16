Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191EE1FF5F9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329047; cv=none; b=qfo+XoETuphACMwtzlbp5ZHPUp/kKqYIdFqcwaOP8COr521w8MFZdYB4EXF+DjyYVHfIYSd8WcBE6YkN2hRo4pARYDFYpdxM1dUaGvwCj0IRei856sEhBMcGUplnH2aWtynObPTZbxr9ZcNVpfOhCe7vDy/+2O3dF2JIufXVCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329047; c=relaxed/simple;
	bh=E6uzMlVABYzll5NXvUBttowq1iRwQDG93U4RQisFH+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSnPsdTJLvjy9HjlrF0MA0lDSdiOR/7fyNfcu4g53HmoPrD4Y3CgR8yLrTnkLKTrvHVaNLLxS0TDnV7XXfVWRQRVncnQHMGgQafFrFi0wKnkuTZ+s2yd4tS8WHyA3Ck7KuoIM2zJElVGBvWN1ogUGoBzOcVkTgfeXqUMDravSPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uy64nr5H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy64nr5H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QLh4MR001972
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtC+JQtO3gxDVAYbGb6Nhx3602teWQouLuAXr4MKzq4=; b=Uy64nr5HFEFTcqsT
	qlaxzxJ/o8pIouB/jOE0FGyB4oLs45KTCP7MjA9etAg5pnC9oYEdG3Q/LWBjIel3
	WihkVx0WPJdeJRUbW/Xb943MZ69CpKk6UVoVtooWfiNbmRfF5959m19NZSJwZJ+Y
	NhLYg1MWfIlb1LVn8WuDsk5ln7fHO/LmzqKvoi03f0j6r+Co2HcJTaRtSJ6Ytb9/
	YPFRGZ0/WEZ4OwIvzlTevSmtIT6jUC07iF8FPiESt0zImaCj5ngN/SmYYx2qG1DU
	JOYMijtBnDjNFfYzmUm6V8nTNiaz0vZF1+sxZtriBoKKph4RpH3E/vVx5hlAW/30
	GjEqBw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549dych-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74089884644so2618654b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 23:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329044; x=1748933844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtC+JQtO3gxDVAYbGb6Nhx3602teWQouLuAXr4MKzq4=;
        b=AHQ5Y1vgU7DUU2l9LWp7yRPpFt3xhQkfV2TCWem+/MtHyvJKGhqHIZHbBo+3QPVKUG
         2pBkxA7AFj8BpOe0tlDdh6t0KktD8kOq56UP3iwfsOI+JQxWO6xilD+dR8Iu38GepXuN
         TMuMyNm9MTYnFcHyThQZIblsh6wb9nJhnfkQ0IebPshENUmAoDpSpdIlhQAerai1b80c
         hDM49ujL2RK0sYxc+qsNeXyoxlxO9ExdRsOjn+2Gr8nGtdYs8klgUbYgV2TStKINpQQP
         4NV+RhjwjU1BtIROnpB/RI/2wCb6yzlasvxSK1uOy/3SQW4s3tXh8V8J3L0iLq1IAOGs
         3R3g==
X-Forwarded-Encrypted: i=1; AJvYcCWH3+xErN5lBj1J0uyEJQ0DqVdN6r+6DiwQy6rFdFrqG4dbb0pgLh12trWdE/B0dEECH0WTznNaSUij01k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/p7KomODx/5Trdwcaj9/1CTeGWcs0K5QYWWiHm09luAnY7pUB
	sqC1wFDQDsEnZj3ywvnvK3xH3FR8WgS/+0Qz1cf5YO7YmEyvg0ubrldSDmRVXSh7dIFek3txFgv
	uxstw60Ive22EdMwBBeqW60fyniZM06Xgom3BIjG8xOTYgHCAVQ5+FIdAUCH48dPdrQ==
X-Gm-Gg: ASbGncvnYGit6ch8MkE9I/hw2p+l2UQfOxO9sBAxkVNFuUQunfj4tDtGkSxTyzTRG/7
	bBAnTOROG3gvVHnD4VFvLeN2QPrwxPhuJf7xy4mO4/PRzD9enZxebRzJ8Ot6ZGFbbQcA7ImMdRY
	1IfTdnxRX00AzIZmyVHG62D5nMxoCTzfC/nCJpaxEGLslAeirCb6Ei2m+DZFBw9WgIUwdpqStiQ
	EadgruNuSc7ISscVoQ53uBvdQcCSkbg1ZTYLzVHaaSZlYm0Q5igRNWAAHXFZj6NHbZMmPkH7asr
	XMRnPOGf8QeUKZOCeaRZkDvF/LvmnXxO0I5ksk/ney83QHVvqe3tK9KadAsXdpW6OW4XBQQ=
X-Received: by 2002:a05:6a00:22c2:b0:740:6630:633f with SMTP id d2e1a72fcca58-745fde9e86bmr17925595b3a.8.1748329043706;
        Mon, 26 May 2025 23:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuJK0Qw8sB9Ij2uNOo2Tek3D/ke3eqsRNl8h7Kgqs57y3/v4DiAHeFdr24Fp7zbHoUEgQ4Fw==
X-Received: by 2002:a05:6a00:22c2:b0:740:6630:633f with SMTP id d2e1a72fcca58-745fde9e86bmr17925560b3a.8.1748329043282;
        Mon, 26 May 2025 23:57:23 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:22 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:50 -0700
Subject: [PATCH v5 05/12] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-5-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: AlUwdGYSWfVK78d_cF-cMWPuP3GURi6w
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68356254 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JCP0Puskdh6qvuzBaLcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfXz2DaOR/ykUO/
 Mi0oaVqdn0z3N1ScuW+gC7XolZvZ1j4eJz4koYkCaWdtDP9XSt/rRxlKlOvDOBgQVWpph6XDKUn
 bzOUfBoAWeG7xsS1zNqbv93R8MwGsYjGkQBhStIk9vCwI/blWjF5cskyooRg4Imxu4vwagxjFVK
 XbjxrOKvIXDK2NobayxxoTgawi9r5NbOeCyckOnaLFzDTa6fxnNYlTFO2qKAdZuLs2gX1YpfhfH
 MkEC+N3zlFoWgq89QyDtfKVZWyzUYcH3fduarj5ZADyLqv+H52kwgQFyJKyYMTkRiccKkpsq8lr
 BllCn1aPlvCbWdKHCCMLbMOpdB+vPCydYz0QjSxquY1ZHFm9jt+fEIEiZQ41dyErxhTbeEz/p5/
 AMDfusaaScs8Na9HeIDxEXk39UeEECfVda6uL0JsXJFoAnjk4FdLg7vFOrDDeBHXoo2PRl76
X-Proofpoint-ORIG-GUID: AlUwdGYSWfVK78d_cF-cMWPuP3GURi6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=936 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
additional buffer space is required to pass all arguments to TEE.
This change is necessary for upcoming support for Qualcomm TEE, which
requires a larger buffer for argument marshaling.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 include/uapi/linux/tee.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 441d97add53f..71a365afb89b 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -42,7 +42,7 @@
 #define TEE_IOC_MAGIC	0xa4
 #define TEE_IOC_BASE	0
 
-#define TEE_MAX_ARG_SIZE	1024
+#define TEE_MAX_ARG_SIZE	4096
 
 #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */

-- 
2.34.1

