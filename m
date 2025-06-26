Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C3A22ACF3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979722; cv=none; b=s5HxZkX16Lo+AL7K+m39jouWY5Mm1V9e5muUE+WzTRwf5aBw/8bEJLyRQQBcy9N3VysflEsTNCDQDLD5lrC74jqnm7uy1pxA1WMNjtLK74usJZ99W5YePn2JBfYXoOvV2eJCGyEUrgBqVHay22ITUT0G8a4H7a5h28u4pUI3phA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979722; c=relaxed/simple;
	bh=1jCsWZV6YH+En4FhZgqgmTk5gqHTp1CzNZjYRBV0XYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=exIxido9dZ1Xblu4XRsxE+h+CZd21h3iiJ5Mk2J17edZEiYrxg1vmWW3Gf7U1OlFTmH9+3B9rOBYMvAwavJADzlpkX82Kma4gqga/rVFvOzC26oxIEXtw9l/UCsAsweMIy2XOLFJ/Zj/5EKTPh2VQQ4o9KLxZoT0Ke56rjwJqks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7Qg2Lgb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7Qg2Lgb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIX74n026606
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HLNCC18u4GYAUHXtrPk4G3bra8STduUZ1GMtNWsHsHY=; b=W7Qg2Lgb410fiiW9
	haY7/IO9rw/lb+9dXu3usr7h+lR9bMQAkT+HaaHJo4b/56yJuMgg3qaYf/fMkrlr
	O0+SEl7H/yp2MeFrldG96Im6YP1Bq6gOUPEp9KBhcvUBkNNHXRrZrEcxag1HwIvf
	EuexLl8KFLfMxee7vj/UTqiFRdyud2s36NV8yF1sS2lqm2cGMFGNVw0Gpb2waB2o
	dh2b2GoQJ8JqhM71UK1cLmqM+1BHObh6dloYhlHBebR3gUESeMtolvwyGnnjYfwx
	fkUvlLpl56r/iWKcPGLfmLGq+mDMGzUplI9if6n7b0rig4FFKbWtO2OILl5VtbHX
	ELPVpA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5wypg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so968310a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979720; x=1751584520;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLNCC18u4GYAUHXtrPk4G3bra8STduUZ1GMtNWsHsHY=;
        b=ZlD5TA/jrJ4tVAXUDGdzQcjscwmqOw8SswIMdycKfHqtPQJo5i3XRhRNtVOU4rgwV9
         iCKHY8+DgFLxhAr0nBwPBuK74VtH9EhU2sGwbQvxd0smNJPyAfU0JYpbk2cJR+dNmTXU
         f4GZtRGWxVREe5Al8ZaG26AuSxUwUME/KxqDlgRqLH7HWFkOSaxD897UXGKUV2RmuzE8
         +R7qfa7Sym0UT0M5MO4fbLEg0Lws7y9GMACWftCpOrScLP8265FNBX83IidEbXcjXol9
         zUWTZOQzW4NjYFxgD9ZGP9xCs0CIYFS//qcOW+R7x8V8mHJy/wiXwQl2zSxoc3OFhovi
         CRkw==
X-Forwarded-Encrypted: i=1; AJvYcCXErpts1wKsDfk5TfkodiUkebCnTVtHC+SfIDqEqUPeXGmG4gdaKZdKBX7fSh1BO8c6V+6f3TUeAjXZPRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkDGSLHsJd41wqr+xe2g2p+0VuMW2mKmXO/LxzIYd5ozppJt2W
	+3KvGUxUnZ2b9T/aV7h/Kzu9UR+gmsnGK2hz1XnVuB0p/ERmIx2UL/bqEOdySb3CAE1GOch7ifp
	XaUw7q6ImK+5P4AXKtKD4HxrcQjTJxp799YjTefp7JAqlQv2Htg3s6wE5tQasFfxjMco=
X-Gm-Gg: ASbGncvXbzQNplYKi0aTL2mPs9bSXxNDSLsFJm/fF083BXqGymU4bAkCgOHhgXoH16X
	RNftDgF2ApoYfUFHl/UGDGz9ncDdhuq18DEEX09LzWp3RI4TGOSFfJCA51cSzSGeyVCX50vvHR+
	7YWIcr6CB3KEOrfe/FCXcvvdadUEkdP4G73ALVKHMdopMIEofhUdSELLAzGOxeoypWa2oZTad7V
	jP54vy551OpaHdz5odwdCMvV/US7NvwG2Y/0msCo6j0ULwdEhqN9J7hk/Ed5pWAdUESmDlE+Fmg
	WeUQf3WFWlwP5IHMmb2/YhcuOtK0q4jWz3KRkmNmMHt26KjB4l/zd3nQXh8=
X-Received: by 2002:a17:90b:4a07:b0:311:eb85:96f0 with SMTP id 98e67ed59e1d1-318c92e3185mr1037331a91.29.1750979719687;
        Thu, 26 Jun 2025 16:15:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr0zfQ4LaAItTUYwvb/LC3Y3GvwyEivrz0SCmRrszUpGz2KrLs4Xxvy9A0We+P/mScdNUhtw==
X-Received: by 2002:a17:90b:4a07:b0:311:eb85:96f0 with SMTP id 98e67ed59e1d1-318c92e3185mr1037292a91.29.1750979719198;
        Thu, 26 Jun 2025 16:15:19 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Remi Pommarel <repk@triplefau.lt>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250617084402.14475-1-johan+linaro@kernel.org>
References: <20250617084402.14475-1-johan+linaro@kernel.org>
Subject: Re: [PATCH v3 0/4] wifi: ath12k: fix dest ring-buffer corruption
Message-Id: <175097971842.153431.2750880388406500555.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: c1YHEPsPImNbYNPEuNs3JGj910dvczUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5OSBTYWx0ZWRfX4nhIQmMc12EZ
 tLGl51ULPf7X2edErgEwpxRLApj8ossIrOa/2kEVfdCguf4gJKJk5kTzUH/VhD7OBD25MMhs+84
 VPZaXnnIoTC86rMY3GCcsXhe5/iU5jDd7dplRwbIRG+4V3fLWwpYh6op9ClAS2LSd5R2Kou5b+6
 wFP81LxV/deEvxDbFWXZMVXddzOR0qgpLQFK7kUHVMfz8Jr0iFXKZJlL9GLx+gnp2qzu/fTALHx
 gQ9A2elW+5vzxTlJytIfq72yCnB2D59sg1QYRS66mA4PvWpf4eT4tO0co/XDpYMfbZuRgw6JzLl
 OXhramfYixeJ8sfVEQtDZjGpEita8OXZ0M2hQXS6+n3giViLahBW5WHUuREWuMjmy9eePofsDLN
 yXBucXKXIRtNZ7cSK+6IikVb+zedkrP/onVbhAGbKXGymBkxNEduCPLNOKsuI0SLDWRZPpfE
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685dd488 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HENjWuboO2KBCxN4OrUA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: c1YHEPsPImNbYNPEuNs3JGj910dvczUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=883 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260199


On Tue, 17 Jun 2025 10:43:58 +0200, Johan Hovold wrote:
> As a follow up to commit:
> 
> 	b67d2cf14ea ("wifi: ath12k: fix ring-buffer corruption")
> 
> add the remaining missing memory barriers to make sure that destination
> ring descriptors are read after the head pointers to avoid using stale
> data on weakly ordered architectures like aarch64.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: fix dest ring-buffer corruption
      commit: 8157ce533a60521f21d466eb4de45d9735b19484
[2/4] wifi: ath12k: use plain access for descriptor length
      commit: 79390f613d639f7ef913377719cc5094357e53bc
[3/4] wifi: ath12k: fix source ring-buffer corruption
      commit: e834da4cbd6fe1d24f89368bf0c80adcad212726
[4/4] wifi: ath12k: fix dest ring-buffer corruption when ring is full
      commit: ed32169be1ccb9b1a295275ba7746dc6bf103e80

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

