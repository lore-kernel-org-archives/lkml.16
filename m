Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420D166F29
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744431859; cv=none; b=dsyFXxKQu0PuOJV/PwkeamOIKaUN6XNzoojBvDp9weeydoDD0A2h7tRTEoeeYeQbZpA6QPdGzmAdLMOyzlpnDwKZRvBBU+vSSgvyeKB5yLy5z2Q38RX4NCdG8RC4XHYCo6mejM0A0EOiUDejd/XMTpQvpE+Fmeqr697i8ImqLPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744431859; c=relaxed/simple;
	bh=oaLfSJxSzeJR9Rtek8qj1Vt4DB0A3q5t/ljDNAQbLK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P5HEwDKi+UCLV1wnjgqHfTnL1VBUwuSyNdGcGoJ3PRt0trEnwh5eNwL9xkkJY0Yd/G62fwmGKTTuUJ8A3LVNVVwEIrvnBHGWYN4ReqMg+wVqNvm1yzvpYIaaUyGfiEedSTEIo4QlMw5xQJeRcHWZD5inG6TS5hv6521caxCU6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBpxb7U9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBpxb7U9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3jnRt015636
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yltj8V/FaVbMSn3d0Z2qwwLYdmKBWgYnuTV92lGPDnk=; b=QBpxb7U9Mn/ZY0IW
	QUjlFwrAc6rBkpKJ/KwtkZYNv9p0UuJ9zZOO9E/x217M+Xn0YUgajqZKCIYTjV4r
	CfvUkQpXXExzx5cx4Pt2sa8xdKuQfn8Tp8xISy1OhOQadjHre8iXTpVpWfshPg2S
	PRljKOAdcQA4PuGWr9rZWjQ7i8NOIdR8kU+qsg3n2ppyWqHQJwNuiTIvLShfghtX
	LhlJY+10/9gpHWoGi6+Y1cxfoEjbvKOjzWVJLxlU6W3bxOHD1Y4rzORgTil6QyZN
	7iZ5GRPj8Qky7uQFnA6/UPqYFEOnyJBzDxnUL8KCfDRlvalu3KDo6toQApVBiuqr
	hyd6zg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj901fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2255ae39f8fso33459815ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431855; x=1745036655;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yltj8V/FaVbMSn3d0Z2qwwLYdmKBWgYnuTV92lGPDnk=;
        b=rQSbYTCr13vnyO9jLeL7nnjytH2zsRGd/3PMD/Hg/oZJx9akSt7j41v6i65Gj4/g1v
         C2YV6do2QFz3c5feWplSgjjS/rZ4jR8pBgrNc9A/kaCe3pxLSu/IDvjP1QYgNpZUZsg6
         WkFEMTgG7jYqLzN3EvqDZaxqPoextPgCnXLuG02xoak7iJe6pRUIu3VUqo8daLvf8aJ5
         8DtMpKd6/uU1s2H5yQN9cAJvvApdSeXcJUhTZRUxwC6DDmCXUlit+nmgrlGxTDYU1yas
         3VEhX6j8c7E1Hx0yIod91W6+NhFPJwXy/EQA5SgIgNYerLT3hhvyvHWNLbJsWKqtPf2+
         /4xw==
X-Forwarded-Encrypted: i=1; AJvYcCU55V5wCk5yHJc32tfaRJ17WZhvTFkKMkP6QpuJ9KIKtWbKCCtM5BRgq9OfNUjPcczN0dPyShxewIrsobg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Uw7nrgd5B+b2kf+cGyidPhHSNPn/YWRs6m93v2DT1cjfuhEU
	Y/EC00KsHCnQM23il4ImiNqDPT2FmayuT66RLvII+K7WMaqJwiIyKgMyYPCsBVNW08D8draYB/6
	LhiitXo57yV3QISwtLsYXAUUhiS0/NakJNRA/Ycvc3/Z1TxcXGHsdajSdc4ISi+U=
X-Gm-Gg: ASbGncv6FBjHIRduUJwuhnWyl0ShSqBos8WC9C51PUYptooNSb5LUoGQTcS+UWMbe1q
	t1qseVb1QYd+InL2rC//2l1w/zDxpoDKATshHHLQEKltd6x3KnmAk9jrhXTgWpiLJMKbvWA/mQy
	mCLm3g6hU2IuhVDYXsEayla2arCqZ3Kj7NiJv1mKM2sd11hl3iMwRxF8xGKNG2jGP56uWgf4/2o
	Qd1si4KluU+qu4HHlwZRy32g/xZ25bprSH1CFXu/v9QDFN2DS4DCCbu2pUMtfUQCWAIOgPp3wXv
	p0O5pj9rMuOa97JOUjixRq/ktdnrtwGh3qAq2TG4bFTjua6Z
X-Received: by 2002:a17:903:2d0:b0:215:9eac:1857 with SMTP id d9443c01a7336-22b6943010fmr130686855ad.5.1744431855269;
        Fri, 11 Apr 2025 21:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaF/ZdumqPMm7Lo9UgIJs3LlV557WY/BkCBFOJHRD5je46M0dwSnCadkd518sE39kMcv9Fcg==
X-Received: by 2002:a17:903:2d0:b0:215:9eac:1857 with SMTP id d9443c01a7336-22b6943010fmr130686505ad.5.1744431854652;
        Fri, 11 Apr 2025 21:24:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Dinesh Karthikeyan <quic_dinek@quicinc.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
References: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Subject: Re: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
Message-Id: <174443185385.2972989.16898377871566470788.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: XYlED7vW_NQUa-dW9-4aIWcKXMmJvRTt
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67f9eaf0 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: XYlED7vW_NQUa-dW9-4aIWcKXMmJvRTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=627
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029


On Wed, 09 Apr 2025 14:01:25 +0300, Dan Carpenter wrote:
> If the user tries to write more than 32 bytes then it results in memory
> corruption.  Fortunately, this is debugfs so it's limitted to root users.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Fix buffer overflow in debugfs
      commit: 8c7a5031a6b0d42e640fbd2d5d05f61f74e32dce

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

