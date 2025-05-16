Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E80277815
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417251; cv=none; b=dmAzj6topWKGEongJ5aX6vsT4DgyTf+643Y+Ieolpspow4KG/hyVjR7/B46oeAYg7BU5krew9KZOe6OXglCRJEek3LGhnu1BWHk8TbEWM9EKtgKu60vRW1l5KBsJEqd8rL/VXCEmLbrYIZF1fCQc3MQLPUD+3snBnJMxjF2bQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417251; c=relaxed/simple;
	bh=jG/ckrkV16bWaO/MxjZ0wfaCqOg/mK5Z0V22ANGyr7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nJ3y81OkrAQjyTvM6vYckSkGB40SkTMGiH4lTf9gJtgh79vKzI+Uw4SVmxCF/ZUJdv+ilQvWG5xuTaE3hHXP58C0bTTLe64m6qvC0Mj1Io+KAhWVNds92OUy/A0X4kHUagedGBdfni6GRDd2C3dceoCKiPX1CHLfr4yFSTr6Rtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqQUiNS0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqQUiNS0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCP7CQ014932
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYYYIkhOgZCks7bf2vlFMUbm63VtKXu7vPL0cGHE8hg=; b=XqQUiNS0PL0F4tWT
	ev4lcrBfAfaoNNCV+nyE97NkM94NNKYAZF383UlOOqGDmpHX28gqzskGeKOKOxDi
	VC5+SFmHQxlE/nRnM+QwIEdVmr8dR0ussP3bJ6OEIeaWh3nFzZIxwme2g65gDVUe
	oHPI+aq7pdtmQCa8mxzTjT2sOB/gW34y2M33Wl+joEPhepTevtf+NHeTOf+e5TKX
	TNKaiwXLsv9v0/quVgdQJKMCL1JpKYDegj2EpQMaMVwIkK5ZXiJhhZVpYXmxGTPG
	IyXsZI7N6AzpOKNziDglX6l/5LJbwvTb+kvYkW/xQFpPkRST7mBUgFl5c5q2n0m7
	D5g8ng==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9jt733-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso1511032a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417248; x=1748022048;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYYYIkhOgZCks7bf2vlFMUbm63VtKXu7vPL0cGHE8hg=;
        b=JSfnopUGS4S4qYO908LJpBhOm2iO2XkXpXnxHk40MEQp0SE06WCbzJ8mN+fEMfSF5w
         ZfuH0S5vKcb1omibT4vN8kP2+ceAXaDUetHzVyel60s6sd4zvmvUQulkPWuFZm34cARR
         agggbolYCOP5FZBv0y2opgjHPkSoOw+Hq0qRSqcgJPiyQJIuUUY2OvcLN4wV9Ew1DCaz
         lp7sOud1wXguVViW9B5PwgwmWgx56gAla5d+BpYHwW+JjaWLrTKBLCLVRKCPE3idhXdl
         +KJgbAoUCr4U1QVZIVT7Yg7asG1UHE8z/AVinqnFz+Yb6oE2Lz2uEgI/s8A9i5bLcOhp
         8M0g==
X-Forwarded-Encrypted: i=1; AJvYcCXfXqMaHqi3P41/InG1eCIOJLo0C5M1l1KkC6FrnvJ+dROiXZvmjLhbJakZGaVOmEcd4CX0UcyAgU7xTwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybVGiAyNJajWr9lVe4mdFkvkcPryGibbqjcQfIBPYRupdFMFCm
	SjQjCNvk1lfuYZvOkwaI7EQ5zBg7QAQh4a40w+X1vVso2yqMK7T2Gf1lb+tlbpfFtFYrXD8TDNY
	4ckkxlChCkfJoyapwrM4X9v6xuFnCbj+whwzr8LC4Ku32X2yz1dEz8kMF5++IJuQLVCEkvzW3Nl
	c=
X-Gm-Gg: ASbGncvjHJIWOja1iWrjy1NUtIFwMZheP22d3mF5q33C1+VZk1ZprRdZW+fY+KR1DC9
	TPKNU2x/A2jDWQ4ZlBpruTlyiDuMkcbBvA1OTpy9mqClilLPmwT6BxJ3WdrcemVkJfNEgGmjLiF
	igAWdSAPydQpzVIODdrKWkZ5cEoTezxgHua+9OORl1sELoVGDRjxKYzV80oJvJkEF2K38YTCDD7
	WEK4BatiLcJ2f1bdaScFWKTj4XXXYt9lKXQ2ca6gCVBES+Ed0YoVwmijgQDjB1HQuuQn7aR4O9H
	tAQbrBgXUg5dFmZa2JRz+RtO2aKDo2FGgA7pBv4x3EyRFxg+
X-Received: by 2002:a17:903:11c6:b0:216:6283:5a8c with SMTP id d9443c01a7336-231de370f04mr40949015ad.39.1747417248438;
        Fri, 16 May 2025 10:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbOhxGp/5Y26jPBRYigTgBT2fqhDZibBzzCDxwoOF3qU7F17OUCBtbwUaLfsqf/k9ZfuCzEA==
X-Received: by 2002:a17:903:11c6:b0:216:6283:5a8c with SMTP id d9443c01a7336-231de370f04mr40948725ad.39.1747417248028;
        Fri, 16 May 2025 10:40:48 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250421040044.44887-1-rosenp@gmail.com>
References: <20250421040044.44887-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] wifi: ath9k: ahb: do ioremap resource in one step
Message-Id: <174741724683.2935573.9349928860978714588.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: butti8S16BXie8hsqBpuQDIQlzbyYuzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfX+YRmbMM+6/Wt
 DuohIA1sQp7jBtz7B7ZYzkQp5V/rUz6KMIoP9FEGOtl+FJObB49ed4i9fge4CuhVCUGmtZ0bj5j
 td33exzXByIEQGhh2jvjiYYW+pw+9U+Vsm5OBkvN8BNwzL+O8NOsw81grX+DSRW5oUABastpvzq
 K6lgO5snupLCXjYckqWMNGPpSLlHzXvWtovkZM/7PR0FJdqSZx7rfjZJ9F1zpu96FPgh8U4uRKQ
 JwOgmlZDIAL7SaVvtwsSE5FEGdvQ4uvTQev26pCi4hRw8CWw/5earj2yd/H669XHxxS094jKfPR
 6BIvavBVp3MDRuKmq8Vj1zVfzQQYQuszV4PLjh5g8xYUdgOXwNB9yAkH/wzupQfV/lRO7igHyXL
 /pmaP3qdUMok+Zgcmxo/Kkns6mRaWDvJ+15gcGKYp/3lk4vBzTbLcpnQRob/T57XdTg+5C9Y
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=682778a1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CHUqY5kqh3KTGWwiF1UA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: butti8S16BXie8hsqBpuQDIQlzbyYuzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=872 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160172


On Sun, 20 Apr 2025 21:00:44 -0700, Rosen Penev wrote:
> Simplifies probe slightly and adds extra error codes.
> 
> Switching from devm_ioremap to the platform variant ends up calling
> devm_request_mem_region, which reserves the memory region for the
> various wmacs. Per board, there is only one wmac and after some fairly
> thorough analysis, there are no overlapping memory regions between wmacs
> and other devices on the ahb.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath9k: ahb: do ioremap resource in one step
      commit: b4206774fe8231187e5863ff861160db77d4960b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

