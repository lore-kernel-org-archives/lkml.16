Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8517BD3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495298; cv=none; b=nBvS33eagokYjVbNXugZcFCWvMrfrfJ2QIb1Y6Bl1g86VCWvffJumqFdibSM0+pMeJefJ6+OgJF5aQD3bhluL30GzhwGXJDYhk6wEzV37YsJS3hZGXu+5HhAmVafjOK/Ze1FsauW8f1HZk/fj6In0Z1ZnhN/nLGeOKHjavlIhTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495298; c=relaxed/simple;
	bh=lLmwBsgqDrtGpBoG6u818eLdzLFv4tb9Vzn5v7VixA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFG46vSxKRagPiFet0VQgbswnhqrBSjrrwx9jPw/gHfLRUBd1MbwSJyYO740QEhQHLT4D8xeWwseh9dLvfwUj+5lqNk5UT7xit7wmRb9xDeEGLuzf76UsSC5/PP/RUQKZfj4AhLkupVoVnZBe2mbp3a2VJnvgsTCvGDWZjUFrtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EafUsoQF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EafUsoQF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599XTMu027298
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 18:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bdYSp294Kmo6eHdYI4u8F4yR
	kn866GRiB5ZbygzcprE=; b=EafUsoQFjER9dtK/DAMY4LtUOOHr+2JZ1yPJzRdm
	q2RztNB/stSra0seTjs1t/+iKMNLnLqWprO/h/B2HRCkBMpcBFmcF9gJUFTu9GGg
	U6kSzocK/oO7znsssoliJgh+8iqOomiIoX4F1piOPOg2osW2vsoyrwlpIXyEMshl
	53isUTrcBzHn55p/R7TFzfcrEJni4fLX+BOaXvl33+H4ulKCfv3P+D1MJBzFrQ+g
	mRCRSEIufOza6QUatZCtFy7/2YVs7VM7rcfF31ia5hFHL5S7lhlCBg+IOXxZbOlI
	KNjMI0ny9yuHkgdY+z5kRcwZE4GW3eHjSdXQceHJaY+2+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jesbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 18:54:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d15c975968so825040085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495295; x=1750100095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdYSp294Kmo6eHdYI4u8F4yRkn866GRiB5ZbygzcprE=;
        b=nJcUf2GwV8MDYgjTalT2XwrmPo7MTWG/tRdS2XFWQgJhFbvWcym/tXBSGQfYDuZaQq
         igEnYAhNVkiVLPSOxAYpJkS8qdzgH+KQM4OFN8ML4Z6cCwyCAKSQIAs2PcN4EQ5KJWEQ
         XKR/zowznNOgc0MVItbX7rkWyV3RnnoUrhEq3QB78efvSPnERsmrbBd2XMTG/3cJpKAm
         o3hQVWicgrtjYK0ue7QQc3h9znI2jASBCtqpbh3FcE6lYkZq+4XeLLdocEQJdjcwSWeP
         l0yg1VodCzVURws4Wsf8afpUsB2QqdLzuvKVgGUuD953PWumbiupWhMtwlxuoVkm09nI
         qxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0pFqmmxr7G4IiHrAiJcdpSqvSGRS87tzk7JaekEv/tF98qMmxEL4MC2O6zsqTrYvZ/A9s6ryHSEN7sd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOqey8EXqQwDmCCKYoPS/YwL9nCAyIUg/eQevloyH5SczqrdY
	fC5v2u0VMtJdBTQJNeqX8uYXBMEwnkMhfFiAQHPX3X7ntAGeOD8ABETe01fQ10usYq0emg1LNOa
	wZuyrO7qhjH5w/JhMUkFQlHeSTv7pMT+AuYIilhO3+OElZAOY4UF11+a/hFlLcNIRgcY=
X-Gm-Gg: ASbGncvWkpA70pZE6CHV9KpAwWaHxu8gMmVBfbfZCt0pr7Hxrof47mu1xuoxR6qIq6Z
	+NE/pu7pJvilHpqg4ygfd23iwCEtCPSQB8Nfv+vDImsO9R+IqM5fQ5GjQJmDQDJeVRJdTwY2Hd8
	tlKNTP+eMlfM0u0JajbdGeQ1JaF6YRf1zr8x0M8jn6e6YlvveZG6ieEO3FrfQnN3o0jVk+XQLSd
	ADlVfWAJeT7A7cMijZ14WZe59ik0qJapISXi9qRuOgIEjfRPBpe3+40ypmhbkH4c20Ri5GJ4stZ
	BJGa7TXjIjzGpvbHisJASYScL2NDpNY8BpanuRdI6iPMp6Z/PXYANWcNhIwwR0r+foPquV4jQc7
	T1qYD2HC1Ow==
X-Received: by 2002:a05:620a:6a81:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d38d2e21bbmr731860785a.17.1749495295564;
        Mon, 09 Jun 2025 11:54:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNLps+ki1+SdzxXPF5sfV00WqC348swYXpemcq1eg1DxuJ4nAqN5qEFtZ4+PjRVI+oaARS7Q==
X-Received: by 2002:a05:620a:6a81:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d38d2e21bbmr731858585a.17.1749495295248;
        Mon, 09 Jun 2025 11:54:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a1e5sm1291949e87.141.2025.06.09.11.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:54:53 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] drm/msm: Rename add_components_mdp()
Message-ID: <c4myfvymbbg7likuahefxtuscskkreflyonx4moul4dqnvmjog@mzzz3qrlsocj>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68472e00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OjWyfXwSgoeToDsKX1oxCRme61ZxEDfS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfXz3mbklxB4rcm
 jIkNPm5fH4rTpgJXhPQfVlDvw1ialqq7JDGp+4WIvticS4NGfwgD7aVQiETDQyqBr8rvAg7ISQ3
 i3v0AnQOScK4QtjZGFUd3j6xpqueeP81Y95L46V7HTvIuT0/RPCcKmGbzv8+uJPn1yvp9pI5vfe
 yt++iZ3buVgP4WeAz9rcyP9RevJlkq8RljtLASRHFPZcejvngp/H0RCliWbbX0PSreKa4pZessS
 kYd87lZ/Sc1wsok1AN+50LyHWmEDdJd9MdCr4d+UxQk/J4Q+HxONPkG91uKqEGfiDtD0lT3BC9Q
 z+jG+txPysFoLKQqp3X6pNdXkiNPkumVv3DLc1w2xCjVE++s/32TPPhG9VADWmoUJLQQLQVdbpg
 BGTCdLRG8M6t5KFr1fSEm7UnM/68u9VGhY0n8uEWfEgbvy1CDfOplS4HShXSovXr8DZWOqY7
X-Proofpoint-GUID: OjWyfXwSgoeToDsKX1oxCRme61ZxEDfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=724
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090144

On Mon, Jun 09, 2025 at 11:24:35AM -0700, Rob Clark wrote:
> To better match add_gpu_components().
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
