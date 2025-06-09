Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0291494A3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485242; cv=none; b=l0JcjzBUkUsc1XGIpRUxDQ5cOgOi1S8xWq8gwOlxOTOyzvKHJKALM5TcyoMLF1c8Dh97JDiTd1Qb5eIQyiAMoX20uGXb2uYu6VeptX7HXfdMJYU2hrEpejkaUw4I8nBNtfVnYqCxHLQtIv/P19Y4Se9SkKIO5TY4lgJTTz99lZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485242; c=relaxed/simple;
	bh=sxDoAzFVJdKVoCx+2HvwwQXAErvByDX68UtIBeOAd5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apx6PhcZJYrCr5988+0fKKSJ9nezvS9OsQfJF3hItytcLzFr1R/lcv5DkhDvX73zREdSo3P0ledWlW1nBptFCcBKUmde3QcHJVYIh6nZKajkGpisAgzzoxg9ZfQKENkZ3+P8UZGPLrvPiH/bqdDQzxIqhWQGbFnNXYI5JY/BGCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeebxVQI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeebxVQI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599IP0g020541
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 16:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+qUNrYBBdbGS3K588n15a3kY
	0CudgwuLNgaq06xok2w=; b=AeebxVQIFSYXIjUw8volmoUkk0g7/rGSysTwCnRp
	F+v9rWYratG5A/8n4mAE9aCLxhFJP2Ytwqt6HnFa0Rlrs8IGFJHEEsmNoRPbOeFD
	h4OuYziaGv6R2f2+LYzgia6EYoNs5DZHdSzFj8h4VKE+5c/unmeNES6LSzE2W1CJ
	QwSjGP3nZVobIsI519w6kYg/qYNHKH9hVvduugmWAFXK9aOjg7+RUryvorWbAfwW
	Z2eJTNPQ0VX/0OPJ+CGXJwRR7j8giOBTfgiWOxOLAgyTxGO1DXRfllBTfIrPQ0he
	iJ2VUjqNkrk2AKEr/9PnGZuOZPbnpDYf0CY2xQnB89YLZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jec81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 16:07:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e6f5so1139272685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 09:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485238; x=1750090038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qUNrYBBdbGS3K588n15a3kY0CudgwuLNgaq06xok2w=;
        b=RHdoUuv/cfHDdKReATgwhpUYSRvtc4VA6tkzuT5p2J+yNmK/M4s0GZzqAJ7MYMNC8o
         9J7Su2HH5nBbaVNgQlPE5RNbjprO4+82GLJ4iB8K2BVfOKMqmjceYXZy9HmLuID7nY2M
         BBJpX6ZF94nXe/JKuKOfqBYv+J/U9rOi5q2pNOkM2RevYeRM7t3ZkVRNBCPlsSoIkw5c
         kJ67a2ZdxDGZalTkNh1jD71YwK9YsNXZbESSWsUV9LT2FLbhLgUcNjLiEuu0UI7d4GwT
         jvUoyohPuh7w3BXCSjJ77/T233HUHHOVi4wfu0ZQZafhZ9gAg3ZHxD3k/9hffL7KR+DW
         nhug==
X-Forwarded-Encrypted: i=1; AJvYcCWyb32oxeuaTQmBFoAVhIJHAePlCdufRFNPvCe4ZH+cxFfjyu4qVITbZkhhKQBTkwwJdIxX/yb3oraj3VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPESMI5XNd5OXBkjXeKzdTXoIWj5xA+Fw7HSQqhybFzM0EPXBw
	zK1mhJjFjMqnJr3CZWXCqVK+I4iJq6/l90Szb6KMeqqN6YcWe0g07UE8xAKqx+VdaXZqrtf5OtP
	XujvjRpwy8JOURliaufVUYmzMdKi5tEN2SlzfuunHmtoO3EkSOA6k3elEmaEREc8ts5k=
X-Gm-Gg: ASbGncu1AZfjUuMMES4JgvN/KlDwGGiqptgUYwYVzC7OYjyXMIq/uRtOFGnmpFtztHY
	/qWG5t4P+GKJsEx5NZ1MsjRwmEv97ZaqV4t2qhHo+IMkJ6BawqdHx5a+YNb//aeKRVFFTxZ8l8i
	7l887/nTQwN8gBEhqUtppmlgTXbWs6/T8z7b/yH9BHjfwKEBPzis1l6Nd/nxllQMK82pNPXAOS8
	worV6r/yKrSN660OASwMb7UbRNyWUJIlE84ymhDFjxyJ9McReOor5zWb2cvZIL0O7Iv0puF3/uI
	4KZ4NLG8sd8R5EPDxqAdNnp7Cm2jBTH7oe62OSk6Kh6BIZawWdRcjhugoA9+mmuwlt2N53fPMVH
	1UKcNrO7vEQ==
X-Received: by 2002:a05:620a:4513:b0:7ca:cd16:8fcb with SMTP id af79cd13be357-7d2298d8a80mr1961966885a.37.1749485238176;
        Mon, 09 Jun 2025 09:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVYJSeoW9tp8i95NtJeZMS8aHF8ENwAwCrE9FAY1YpPN3brqQ/9Ah8IyaKKQghe8Xs6Opplg==
X-Received: by 2002:a05:620a:4513:b0:7ca:cd16:8fcb with SMTP id af79cd13be357-7d2298d8a80mr1961962285a.37.1749485237767;
        Mon, 09 Jun 2025 09:07:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b347f2sm11561811fa.29.2025.06.09.09.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:07:16 -0700 (PDT)
Date: Mon, 9 Jun 2025 19:07:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=684706b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9hUQRU07m4UGofkZ2RUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: n8uotgQZBGPbaXzmq2uBxOL-mXrK-7QZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExOSBTYWx0ZWRfX7fdQ+XK+9lOl
 OahB59J2U7ekaAgo3y9ifbgCMGQDIQKR2TrctYD2OSV5HZlE7+YZK5gWOFD8g6/GTO2p1pMu2Sh
 NNnQSjxFpoMusr54E5sCPmc45+lemAE82/sQEl1rMtPBVvJRb4eVXWbOoKsBzpDriZU/DuIDsKo
 QxnJIaAyD5ObYIrK7HuwWhLjBUvgzpdTvinDuRiJidFIlmoEl0Un9IlcVyd8cNYsjlJM7fjfxCf
 1XicM6mScDkOtAxZqArqKSzHySwq2xiNxVFDP939FCx1XMGeTKoJCAH3j51qnBQv+FbcMGYxSOL
 OGrBz7MbBEXZ07mK4GAG9cDLsBapn0p1XVbNC5g0SImSiqqVfb2hF6NtPf7ctnNVzrajUuJTmC1
 bLcw+pmAjl/xBsSEr0HMmC9QqpAIHN7GDS8pWky/LL/JOQFaxqWulq7/qkJw5vaWTKdIc0Ol
X-Proofpoint-GUID: n8uotgQZBGPbaXzmq2uBxOL-mXrK-7QZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090119

On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams. 
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> In addition, SST was re-validated with all these changes to ensure there
> were no regressions.
> 
> This patch series was made on top of:
> 
> [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> 
> Bindings for the pixel clock for additional stream is available at :
> 
> [2] : https://patchwork.freedesktop.org/series/142016/
> 
> Overall, the patch series has been organized in the following way:
> 
> 1) First set are a couple of fixes made while debugging MST but applicable
> to SST as well so go ahead of everything else
> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> of the work as current DP driver design had to be adjusted to make this happen.
> 3) Finally, new files to handle MST related operations
> 
> Validation was done on the latest linux-next on top of above changes and
> both FB console and weston compositors were validated with these changes.

I went about a halfway through the series. During that I noticed ignored
feedback, missing reviewer tags, invalid or strange authorship / SoB
tags, overgrown functions, one line wrappers, etc.

Please rebase on top of [3], review the patch series on your own,
removing / reworking all the bits that can catch my eye, implement the
feedback, ask questions where you don't understand it, etc. After that
please post v3. I'll most likely skip the rest of the patches for now.

[3] https://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com

-- 
With best wishes
Dmitry
