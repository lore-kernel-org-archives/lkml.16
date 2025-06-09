Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155A1624CE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481300; cv=none; b=lWFXFqLXltqy9cKVyOKM4a0Ig468t8f1y8HSOlHhJwfexthBT9dKNUixQkHqbMxkPOV4SZa9y153oE3Ar6NBNDgEA7N0zsskRP8p1iWlXSo1ZD53OYB6NmRH1gazXo0BVyn/vSI5iNrveStHC/Gz0DupT6iCiAY1dOJizPnuwYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481300; c=relaxed/simple;
	bh=nDTdaX68kkk0ETbUzMRtOvX7XWAta9uFpsel/G+Mdtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLiH+n+rAd6APps170WueQ6j4+1DHxqBhIHHXIRSeZIH3In2qZDqnsz7cXH9CDUZCUb9Jb1oGg5E3ewbdaQceyqqjl8S1kqk32MRAKwSzU/Me1DlGuByVvgFQ41IlSR78lKkziIZ48C/CMnCheCGYBvZC4yS/swi+3sBlbwjRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvYQepXI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvYQepXI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559ADqfR012672
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 15:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eeZOilRRCfOoW7ivyBUSV/3B
	oCRgS1D3Yx7wgvq5hHw=; b=lvYQepXI4nKWo2BFshP/lyWx27i3MIHxl5bxwxfq
	REhRIDK6coQmM/cQT9WPUnEZhgiMF9KnoyM9CQiF4p7lX2QlNwm/ys9HgZXpmUPy
	Ibc/uJU0BJUlFSIBQ/G0URsv83Q+IdbrCvWbNmkF1Rhw9CKRgZ0N3e/Bpluz7P/1
	G/tMK4v8CtKr3qkMvJiShjbuClv6cRtYVa4QJupiv48Yiolh2wMgQt+U3GNPznEa
	V6qSeMvSZGtD/31/B/pt+gDkBZZB63eR8daTXFhA3YJpMaXv+zXgwcSRyIA/eONV
	iZXCYuDg2PjvVpKunDpKjlRRkgv/ajflrz10sirbfr47oA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6am0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:01:37 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6044db45c83so3201981eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481296; x=1750086096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeZOilRRCfOoW7ivyBUSV/3BoCRgS1D3Yx7wgvq5hHw=;
        b=UtIDyOeu2urdVTEUo++VbQibz2SJufbTWyplXIEsX4ZwVwwd6JD1nFHU9Yv77JtdXs
         5i3YPtyDaLMI/QPjB0lI4OekxY99fU8kAiSP7v47s4Q/VP27dDMHOWHIoo+57a/9/0i/
         ykCtmn0UlNOFqFzjFYRsxfTqCx4wTmBOinQiAJTdROmpuJLErEUw4QsyRldkAirrGFQX
         nJP4SXBVZqnkh2IsekHEQsxRHgfvIF71lzQYY2E3N+wU5wmE+7fWUCuVVfh0UyWOmFha
         3WyAV+14rQ/sEI43PNkT8fMmzkx1/wYhK4XpQNrU/fMOaZpsJozCSCqKOqo2G3fIo1f6
         lA6g==
X-Forwarded-Encrypted: i=1; AJvYcCXV3FeK0wURl599a1CWfqOU4L24ggxYiR6Rox9BoaM+S+SdhFyjnvYR+gDpCRKGRKMhSTMBg4qle4RaGCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyUh1wuxfPGlauDceoN8mvjB83YispA0xu816lhtDwu1E9QAq8
	BCYARk7lm5oM2YHpdp0uis9AbVX798IFDD7iFx24PuwjA8U/sNOd6CNRW18AfVXruXu4OcIaNbe
	h/ZOGSPaivpQLCAqoIkUQUztlrKJ9aChPPvvudz9D5dFi0wPkDdKpH16qz4ccDB7n+D0=
X-Gm-Gg: ASbGncsYHCmHMO7BMkDI3KGvNY89AeS13Vys3F5GfyWwOaYzIhxBcv08KgSGxKJLCWJ
	HlkeNPN2EOBjwnXFT9XPxIfMk8C/JNzRLjXJWE2j0dyPjjBpTjPwFYZhTZAfE2W4rmNjvHBbl4a
	/jnzOoFvkwvJI3GlpCpus5k8QnaxY+ZIDayBlgX0G+x66srs29v0P2K/hciTUA4A8HuX2sDNdW1
	Hkskm/8nIKkrJ8oWjZXKQWiWfFcRtt3rZ2NeZO9dHH1bH7XAoOEh91qsuNxo6dtBcfc8GjHz+MS
	ylRFL+IC4d/UlwfQWDWQo5mJgLaotlAvMXULUOtjqPUKv9OZj3K4sw4EIg3efHMhCznmFX/Vlg8
	=
X-Received: by 2002:a05:6820:3102:b0:60b:9d5b:e94b with SMTP id 006d021491bc7-60f3cf05b30mr7498261eaf.4.1749481296089;
        Mon, 09 Jun 2025 08:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Fi8e/8Pp5oI9faNSYkOSpVjhnJdV9bwjYCbtPXM4Szgyw5KA89jfNLN1bkno5QUfOc4AOg==
X-Received: by 2002:a05:6820:3102:b0:60b:9d5b:e94b with SMTP id 006d021491bc7-60f3cf05b30mr7498206eaf.4.1749481295529;
        Mon, 09 Jun 2025 08:01:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677385desm1186686e87.251.2025.06.09.08.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:01:33 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:01:32 +0300
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
Subject: Re: [PATCH v2 30/38] drm/msm/dp: add HPD callback for dp MST
Message-ID: <arfmbusro2nh7axnyqn26v4rjwfmop4q4oxu45ad76jubijnbn@3twddambhtum>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
X-Proofpoint-ORIG-GUID: m4Bs4pHxLqqldrUqz2BNEQNe1arl_xr1
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6846f751 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=kZwT76mLgBx3J5xcvQgA:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: m4Bs4pHxLqqldrUqz2BNEQNe1arl_xr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMSBTYWx0ZWRfX/697Bu9NY9dv
 Ez49EhWnogELPX9rcPFKXBMQTf2fXEzHy4wQldd8WR3yjlMEsvMgLupYN53hCOxg8cHnh8wPbXg
 n7lR1e0ZhL9DwN7MzL8bKZ42uBwjiWjnuQDhTH5A2ZyZis0TuAre4NcZIdyOzOZSURU3cU4gV+W
 Fcbjg/r6I1c85N6x1hbX4L35Nx99mdRttlbkiknhu8G872wRpGF+lqLuAxIwalR1qLW/PJ6urI2
 WrmEox8mfiYdmSsaKRougr2dKtI6enIEeXZ3+RtcwTCGK+X2tJkawev1yo5EcWg87jOl7fFvwGC
 w8GYqxyWKbtE850SfvXP3BTPM7g6IxNGrcyxt2dzV8JpxWYPf7inoMVE7XAkFN/fE0MFQq0to27
 QcwWCtE/AAR/nvXr2htMEWGdxxc+2W3lFIOj0MLIk40+gwtU3nPHrllBeN2Gk3LW5yhSe1D3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=717 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090111

On Mon, Jun 09, 2025 at 08:21:49PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add HPD callback for the MST module which shall be invoked from the
> dp_display's HPD handler to perform MST specific operations in case
> of HPD. In MST case, route the HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Missing SoB

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++

-- 
With best wishes
Dmitry
