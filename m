Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC5D253B73
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751721654; cv=none; b=XkeIbUn4021Y7ohbZQgfk5Ou7+gyNO6JRKVH0eg/munvX0cVyVMR3HK2jEmgquD2QRWK8kTsHIJr132mk9zhz/8hhz5sgf0SQaSIm+zxnAGuawXarl7ZlEtb18UOgtGaiXGu6zNxi1zPlkxOtP/fkO9wgF3iZ1ycQOovg1HUto0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751721654; c=relaxed/simple;
	bh=GyNlZZKfUfhTLRGiSdgHDvtTuW6Mnjcxo61Cp61UQBk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kOIqs9sZqhdqUMFs85jHLyFQZ8bTw4MF80Gc69z3dMKGg+igt56+eRAP/wBPc2swv7gQwvxH8yG0V6DbbTnjqkN9c8T0H+2dKiZf82JB6Cfr7XC6r0plXZi6/iwAJDlnVXUOtiPtnKsyjnFHNsZ/HObw/cNtvxnd9CH4G6QexlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2jqpw5Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2jqpw5Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565DF1vm004860
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 13:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPpxJ1usBrNjKvHIjv3y2tT5s3fkHooWPv/2s8UOe6I=; b=Q2jqpw5Yty9zS/mE
	0TLedV8tnzuC145IXtGi9hKnhvGyAYYpOBv4LyO/6nh0YfdtRFaiISbbXVKyENSX
	vD/7Wr+qBEcLnlfXR9tVI7tk0xaNoa76aDWkv+7f4B6BMZzgzfRmVyPTxb4In+YR
	bgA8kUmc23c059MAIpA1+KoUZB0A7F69yOHfUQZ1Cr3WoinkY0GELiex5xQPkRuM
	bmmD36lKTQ53BkQIrmgwBf18o0FjtLmDyUhPsLMJVP52hIXJUODNRWIzENKVHXtr
	nmB/AUPSZPm7egkvOfMnMzXyc8MK+JgcLLqrXJAKLHbQoOGEpNcQ/pnararOzlg9
	jxVoaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd0xsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 13:20:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d44a260e45so282777485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 06:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751721650; x=1752326450;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPpxJ1usBrNjKvHIjv3y2tT5s3fkHooWPv/2s8UOe6I=;
        b=RXzTzrekPdXNN3pQdKvNbrrH+MfuPbEgVFsMbfxOygIq78HaCjKYsdgr82+hrVxk/T
         7/rGwrffPvocn0kwY+XhVx08TrvFaWiDJbgcQpElMn2KEtisUKcqnlBsBz9Sp8xeyS7Z
         aFVlTQFM9WoBykH1XW1TfuWZHnPYK5jXRBBsdvLM77PrUaM9dinql/7SiRZQFi5Wo8VS
         1yjLmhhiGrVfR/T+cwiao1CcdQmjonpCrQZBB9k3TK5K1WeqwgkM+wOxS1/MceDi1pnW
         5eRYxY2yunkWO/OQRuhpWcJ+0tLNm1HOP6QtuCKZpLUNPJE1fgKrYvF22i5xGw2EpH0V
         idZA==
X-Forwarded-Encrypted: i=1; AJvYcCXzuTmxYKcS+Iz840yLbaQ1QAcf3hZ8+suS9T5re6OLqoCYSiMTQC76pMEx+C+YFNEqtoXgmCA0P2n9Bj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Gyd7bk85muRuJKIkpGvNCIn/i7PMJLGbjEmxD0wT9plSdFMt
	5m8cYym70u38rMVLPcSG4QwFgUMCGfxWI0utroFYIt+ahlKIDTGCd93NMoxiii+3r/qMVSi47n1
	M/XfcE7FkXQ1QhjkXie8bM2Pfqg3ebTd6ZrCKrk1ap16g7b8t4YqF8Wf8SRdtYrwf8Ag=
X-Gm-Gg: ASbGncvk8y9ajnM3peR6zuSMdyGUrRenCeegc3/KV/97OyKMFHN0kGnuSK+/JoYYshV
	7hzHVo19uoPpSL631eSaXAi+RGSRyAoxnnmi+lAoI3xnF4lyrZ1TmqV0W1/lC8vqBDy1HVRL9yT
	BSo+PuMO1v9hfIEY6xNBx0BAyWrQ4CxDFxYD2qrPgFwOlneg/d0/ZLzcPL5c7pZMfculFd+PwrW
	CFmyDgikFLncBebJy02WHu4wQlatDWSIgwHL4+/irqoDq2RL1xd3OH8HfYdQ9zByfMNjXG/leIO
	GxEgcMBpD/5lKewYOkyZ9rx2QyRbXGM8rMLfz6JgJZcPi81evzvnMiSPbz2Qtr6ldx7Gytp4jae
	RSL3AMSGoPeqGplXm0olzrxC5Wmt9mF5iXiY=
X-Received: by 2002:a05:620a:29d6:b0:7d4:3c38:7da5 with SMTP id af79cd13be357-7d5dc6b8d41mr905336085a.14.1751721650574;
        Sat, 05 Jul 2025 06:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEykqonacErWWXyzoc8AUTjmeChUXBwp2f1L04Yp8dJx+7ljWl7gkvbra3cS6aaAdP6KUCpmg==
X-Received: by 2002:a05:620a:29d6:b0:7d4:3c38:7da5 with SMTP id af79cd13be357-7d5dc6b8d41mr905332385a.14.1751721650087;
        Sat, 05 Jul 2025 06:20:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baf0asm591307e87.7.2025.07.05.06.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:20:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
References: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
Subject: Re: [PATCH] drm/display: hdmi-cec-helper: Fix adapter
 unregistration
Message-Id: <175172164893.2789471.241982274720939325.b4-ty@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 16:20:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 146610sThNmQFyeiLyixXEqETZ24fuiE
X-Proofpoint-ORIG-GUID: 146610sThNmQFyeiLyixXEqETZ24fuiE
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=686926b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=FPokAKTh0P3oSSPBHH8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4NyBTYWx0ZWRfXwf6VJzG3YmuR
 r4NEJV/2I8xz7QQdGjQu4p2rJyUqZdVZm1l80bu215wPrrwxdN1eMZMowlrv60qAWP8idhGfnbS
 yvHGhc6Etgefckn4zOBMGoSQkjqgc5X5S9H74TPOKZikQFHIm2/UdaVXSihSENRfg6+evZn0HRA
 BWNjNA0gRQCutqMVp05ZmLXaPUMA4A97TMrs5hJlI2bEVslDLZ6wB+cQ4jiwPgkwNuO8bjWYPCc
 XbHRyH/9fZHBafqk5vE8BxosjAzqVFVGbbJYnm5FiNfItni1mNYHrHC8KO6J70EqHLn/Y/RIyS5
 gWMvS8NDPRfzbxFgWD8F1a4tM3mteKJtP24sboxqxvCGtAKtBaf6wCwiPiSWqy9jCPWJPyV2vfz
 SleFstWwMaPc6m1W+wlIweuIfVGNEKmJh7dgaVqAjJKsKhmBZpD3TK/X7inhQk0vwKChaeZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050087

On Thu, 03 Jul 2025 23:05:45 +0300, Cristian Ciocaltea wrote:
> Attempting to reload a kernel module of an HDMI driver making use of the
> new CEC helpers revealed a resource deallocation issue, i.e. the entries
> in /dev/cec* keep growing.
> 
> Moreover, after a couple of tries the kernel crashes and the whole
> system freezes:
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/display: hdmi-cec-helper: Fix adapter unregistration
      commit: 19920ab98e17af4e733ec4c69881d8ce433d3f1d

Best regards,
-- 
With best wishes
Dmitry


