Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8D27715
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747942706; cv=none; b=I+j1dsTTMMs6TgAo+DcQyYZTlJUWckumKxiQy1mIUgLxjlzAD79BvpS4XMZ0JnPjpNIi3bI7oo4mB2x018WLsFgD/aPz3iyZ1j3ZxCo8t7ivd7NFnAZQ0/x9fvH3XD82GrJz1QKSUzNoK70zg5yXsOSmEu2xXGXCTzdksNJ7cI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747942706; c=relaxed/simple;
	bh=q7mqLfjENNgNP706ckkvIptpsi1F/7KGa9dgbFNqNAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vta3V/8TqZLSlLKwZG/T+GRx7frskwjThzFpZYf+78MEPnV9/m3Zd+QDiAMf1OPHZCBlIHmLSudEa6f1PF0grDQ17qdU82OqI+EYp8zcNyFRgbhjfByG6n0Bn1eSGxM8cDjMykUG5fVGERvsb6nKdBvXxX3cGFpbM7H52aIquus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yl7DB/jz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yl7DB/jz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFVr9H020601
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSVLbWs9WEhXD8F0quIy3d6Y384Oh4iaFb1o02G72Cc=; b=Yl7DB/jz0EzwSBp1
	LqD9BO8Gf8Oe41PkxdLkvnWz71ywYoNrRJByZVuwQCZpbI0SCe+QXfnte0oFdzCy
	LQ6Rv71FcJuZwHVsdCkcBCOwnM6JXUUWn2sInzckyHhlm7Cx5LB4ZiXhwBkDX+Bx
	30dEFEjYktbBvPTDDAQSD/RJLmgR6LMgb0pT5SbEj5H41jadXGLJPl7FwAxwSPKj
	dnV1tAoYU/R3iL9/bSzpLBQ9DuzkzgnzOT6ihjsklgxWs/xv6Vd12vygPyRu35Rn
	0kVz7H2QAUGTs/NQJ3e3G3Ra52P1czVLB5TI4WO1tBqWaGdchtxoT3NxYGMWl/o9
	6JF+9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb5xg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:38:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c552802e9fso205804885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747942702; x=1748547502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSVLbWs9WEhXD8F0quIy3d6Y384Oh4iaFb1o02G72Cc=;
        b=Tu09dDBbOvOA6XUOcpGjxYsZfW++TKAlb6MoqVas/fcPzKqe/nW12yMNlVvXT0XijS
         +3Gh+USHtF6dMbEQ/NhBjCPIwCUQzVyhRrzYmCTo5V+4Q6QaEm+GasxNq4wT4G+tEQX5
         XmJkTC9g24Yi352zDft83TNyHM/0Vci8xg5eolhHkhufg+XGC3CxB59VrYbjIvoNXZik
         Ths1k0ljVQ4KyfpAV7uwKcNW7sc2YeBWATWoQJ7GbhaiIVPjiapa82B7imR8Kfri107f
         eJh+k+f2X+r913Dc1yA9saOcDTEkSstipXOtCEeiHEzZTr7MKv6r3apwkyraYlBBL0KI
         6VZA==
X-Forwarded-Encrypted: i=1; AJvYcCWj3JIvRubaofugo6Eu7u9Oyjrb4Av3fBCXxil4oMEptEFn3tE6axK0nT8Wi9hFI04f+luXJUENSOkhApM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzZCtlbTk/WL9ZjhgKOgEmOs2EX40dMHUgBxTIYWllnzBGgrd
	94ypMsINfQISE9Fc1sMxPuyuPtFK7LfnaE8nMWws1JEY2+HTtVI9e7en0PhQg/whXafx/2UvYqN
	41uKTHLuQ21d2oGLFFw2mnaM3poO9i6h5tvNQuJsRsTluPGz4xMPcMNdE6JQ3Lk3haxI=
X-Gm-Gg: ASbGncsMSzAHo/oMspOiRC68fEGc7KfJ7OaQ0N/ytC4+Tltetqul8MtCUvppSob0owq
	2YiDgV8/wwkodSVhQDc3QcdA5SO8gQPazhFbLwdBkYwNH9GcevrXG3OURAmlkDv5smXDI1Vt0fm
	uTGVkQuAFmiN1+tFE8BjALHY/9Yl8E/Z4+Lh+qOoLKilrdFIafcW1iXwDiong9snczxIVa6sjU3
	ZIk2+UrI79C7kTXOYqvTmZbJ894anviqRJMPfpaGgxujBfZt/ejwKiW/GnLoMFkScUPm4MKn6+1
	mLDvujod6QE8ItVV73NYN9Cbdbe2gBJmJF44vgxeIKaBcR7DRFXk3tJJUwbyfl/8uA==
X-Received: by 2002:a05:620a:8812:b0:7ca:d396:1460 with SMTP id af79cd13be357-7cd467aa279mr1659323085a.14.1747942702229;
        Thu, 22 May 2025 12:38:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1KQbgFQvKgKzZOxfQl4P+o0nz/PMO7DCB/IkhNmAwt/2Mx+vUW+hul4ymo+fK/nT3VCXeEQ==
X-Received: by 2002:a05:620a:8812:b0:7ca:d396:1460 with SMTP id af79cd13be357-7cd467aa279mr1659320485a.14.1747942701886;
        Thu, 22 May 2025 12:38:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278290sm1112380366b.78.2025.05.22.12.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 12:38:21 -0700 (PDT)
Message-ID: <be9a5e0a-1314-44ba-a8d0-f1071138c86b@oss.qualcomm.com>
Date: Thu, 22 May 2025 21:38:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Fix SM8250 IFE0/1 max clock rate
To: Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
 <hverkuil@xs4all.nl>, Jonathan Marek <jonathan@marek.ca>,
        Julian Grahsl <jgrahsl@snap.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>
References: <20250522-topic-8250_camss_ifeclkfix-v1-1-349350d31238@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-topic-8250_camss_ifeclkfix-v1-1-349350d31238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f7d2f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=MmXTpdYTAAAA:8
 a=TH8GZ54sAHZQbr7yu8oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=7hoCnnChfAR1N-e-f1W3:22
X-Proofpoint-ORIG-GUID: kuYi-oqWkyI5dS9POIa5a5QbW41HGRCn
X-Proofpoint-GUID: kuYi-oqWkyI5dS9POIa5a5QbW41HGRCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5NiBTYWx0ZWRfXw4TpIL4vp9Hn
 c2psYM82+dpAU3OExMt84ta6/pGfwLFtBbMfYZ8P0tjVrW1LXj52+EWtcD+dCTg+u1VJZw5Q8or
 EwbaU2qE0UBPxaisEhqq8VC4vjoKrYrEhgsGbSOB5+27oF+X5KYZqUeGMC7S2Kg1rrvNVn6Wd9G
 KVOSptKFdhf2B2GCEgYC3m6b//8+ymrOneAaMBPEAcvxtSMvIVf1pycgbusosoVzyJV2FZObsGr
 qHA57dS+JY4pK1RphID2gZvWNwTCRFokIx/v9UtGjqZg7kUK9jklFvXwslwM67xCXuxqPE6oBqB
 72KCxNfiB63PwvwEtDXYHYNjWR6KtsX7KMpShDj3dt5NCOtYGzz7L7kskafS+UAIw6I7MqsY836
 YvPxGcSwolm8euphCoE9BY2TJBcRjUDbwCSLM8jo3KsVUd01+adzG/9Sy05RTBx6GGzfuciM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220196

On 5/22/25 9:37 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 720 MHz was used on the prototype revision (v1), use the 680 MHz that
> our clock driver expects.
> 
> Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Jordan Crouse <jordan@cosmicpenguin.net>

I meant to Cc him (re: irc discussion on #linux-msm).. oops!

Konrad
