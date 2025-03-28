Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA920DD64
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130103; cv=none; b=Om/kJN4ISQYp2s51RKdFO/Bg/zc6gyo0QY+Z2JBgn75xr1lnDnTdudBfp0Hvee4ofek7rxJi1jWLGdSozf/fyhYI9GgmN17WdZTqBP5uo1pEC/TZ+0YNjtoDVrmhFKTUm29yQ6EUbydrpMVFo9yTzlq3WY7Vqycm7tllFMdpFiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130103; c=relaxed/simple;
	bh=1k1C9VP7BU3rWXxl+8j1x0TGpEuno44voPw5THBCC9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qq196nAEbub6GnT1h0ocFrAH5AU1iiCkYk2NiEDK5CtIoU5eT0C3rmWSYvjXXgvl/EHXevjCfB8ZKbuee17yTKpfZIDYdgzzqwfJkc2lJQs/uuQnSfKhp+k9+axlpoXoeHZAXxheJyPHMaNQ80UajYKStxdb1k+mneIK5vaWt+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsCoTPVm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsCoTPVm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RKGo93004726
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sjobw0Qvu+HD2r6/N5ib6f1zTdWIPLIs8HbgKzd8qfw=; b=MsCoTPVmUHmW0pVm
	5dAQq56G9qxHbB6CphNSZkK+5GifZp4Uyp9Y27F7gyixsjEbFOACY5MIUZkHqO+A
	IwM4fw3Fy84wuHeZK9RD4gyigIG2TAuqzTOGCAy8BASqxLyVUJyPTMp9qAJq+V/l
	5ZP9Y41xIhtlC+tL1KnLupGLKpFA7gG1KEi0/tqdDdVU8cX0jrhRSAclmUIWhtAk
	CpWepYh7lGxa77g9a9EaQOGuWqpkH8z5xh2mJJyQ2kHdkZ6HWg+DMjtgnd5aM4AT
	LGNlCkWpV4ocWVGkiOnEuJ8VLNtnwcZX9oAlu+d1+Me89YsvZg4tpy/1vpaMsFPg
	HC9BWg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf76jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:48:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-300fefb8e05so2175115a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130100; x=1743734900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sjobw0Qvu+HD2r6/N5ib6f1zTdWIPLIs8HbgKzd8qfw=;
        b=qfusRKAlm9CtiqbGdAMDczCAV5jHygqbxouiQwbB5Y+rGmHvoKm9ruKjYQjfTqwxNv
         sVYl66ht6pCShGmpR/g0uvwou7GwFGZjTuffMau6nJghmosSqU6mr/tcwpn/+38zBvNd
         r9yl1vzJOa7ceOtCOn8IJG6GZEGQng3Vcr9wNNjtn9crIBggoWzRrNHbTiEbGLEco5Tp
         RqdXjmYWbhXo0Vz9ti3QvnIC4V1WEHrfsDPcwxfbUbnpSU7kxbkZVZeM6D5ZBPEj3pyM
         zhibQl4CrP8l+3LZFkYfaUtRMujVY2bfIyAACQBLp9IaveRci24PK1FbjZU7UZOKyCTN
         ACaA==
X-Forwarded-Encrypted: i=1; AJvYcCW2aml6xoELtlP+rSr0GvHLM4fVOeD2p+OwElgt4hxzAOoFUn6UAoLYbmL3cmY0YyCkvaimy9yJkbO3fTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwglN943R5vhoG0wOeR6v9w6gHm5rTOWqh0aJTva4yCJw7Ur3QU
	zKK1cEV+8EJ3X+ACfjy7u3JzH1e351z2zMeO+C7Qivltzm0DTTrq0CxFig2pQRqvMpP1+1TL+y1
	sg64+ea3fu4smTSalMf8+V/31ZBoyZwmYHlmb1VM8fTxQy5RRt216EV9VRSPs4g==
X-Gm-Gg: ASbGncsUe2+y9xCzT52FH72cQ5cE+w5+9E4HEMSiTvND7rkELaMkQ2ZWj5GhDyZzMa4
	8LdsME69/sj002id67zBnBNklZBPRWmi2IZM8GiRVua4oQ6uLOxso1y3FAnlRXj4BcNyGqItFoY
	kSrgR4LURtDQs3t+7Lm969NxNEeVgxjU51g8Ud9rlL0kYjtN/oJUD7bsOyGm7Y0XbQLTgPgZkpL
	o0zlDUw3Xn0PUV5q0tngHK6EYqk5XMyBayMeclI8G8OFk6/R4oSqr8GVfQkr+vcbq05xnBnAFtn
	tGVKaBDe8gzCsMwBAcz6AGOmiLct3bEHOfqAFparEmPwQs+mFXUXuAI4/JYQHiEfPJCoVaT6eX0
	=
X-Received: by 2002:a17:90a:d44f:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-303a7d6a7ffmr9395583a91.10.1743130099764;
        Thu, 27 Mar 2025 19:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfuggGkq4jSTgbcoTzgRuHjPVKkGNdwncF5LgoWm+8c97edaKwNQFJPvOaF357TftOkkfmkw==
X-Received: by 2002:a17:90a:d44f:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-303a7d6a7ffmr9395547a91.10.1743130099182;
        Thu, 27 Mar 2025 19:48:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 19:48:18 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:23 -0700
Subject: [PATCH v3 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-1-7f457073282d@oss.qualcomm.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: W85w8TPRHXWJhFhGWZIxjUxB4K6hVAyM
X-Proofpoint-GUID: W85w8TPRHXWJhFhGWZIxjUxB4K6hVAyM
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e60df4 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..24edce4cdbaa 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -888,7 +888,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

