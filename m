Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23B92741DF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652424; cv=none; b=FctHGuGXZhfA24nhy9aT7gwOh0Csj8dyTXuZcTYiNel5paBPbkV+6DbXll8A27BO80GYD9PrNZwSbkp988DdQ8OiGotZz7tgtwy9jLbv68iCGoSAjWZwRYfTSCke1To0O1AiO0CRTNksIG/7bWzOEdldo1O9BsnzUfDyzS9d91c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652424; c=relaxed/simple;
	bh=fFmjqnxgeSmiyzEOPvUC2pZYL/wVtsRdLROklYyM+Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQLoE15xINY1sgpK82+uK0Ev8j0UW4VdvmDy9HzQiTbZ+j9t8WQemJR9hUoj5YQ2BV5Zo5GozVGn2qAUsBtWJkemoP+/FTw4V+PMGdYNSE8EX5Kcu3hfsIgqhHRNeJhOXqZ1F0VIIm9OR8ELgYZTOy/fgyi7xTu+VdjuhcKZbAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4FeyJbI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4FeyJbI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9aBL3006225
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AR3Ehus8X3xdnq+Qo57YslQ+
	CRLb/Q5bFilFIz2nOhE=; b=h4FeyJbIQExSvfT7G+6p82PPzQbsTO68g4UGOPX+
	Y2/tcD9XHkpP8WKTnJAEsmrC6niddSILbxN5ENl6HC20Kaa5peeX7zFh8wLY/WcT
	0Jl8SxYV+0jFcOG6YmgygBxLGm5AzKHP3iHfUrKV+vYjk1+hdaDuYjqNfhc+lycC
	aiq/g41myBF9oZAeeOW0r+LhIvymBtFRajUgRGRQnpNuuL1bomkzP7BaMR1+he4h
	LvM6C/8umJarqhJ/uXhUryv7wGVb9pdOTAua1AEW0bcMsBX6dsSeHHFAC/t/xezC
	EiMJ5uZPAxLslyOiOOZ8yVfn44WxV8bARPFwnQlyJStqVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m2a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:00:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8d8f77d4fso15432556d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652421; x=1748257221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR3Ehus8X3xdnq+Qo57YslQ+CRLb/Q5bFilFIz2nOhE=;
        b=aSYqK3WCKFhsp+mY46RVyNHFSUHOg+DIF3egGaJui/7msNZzikfmi2G/0MEyEi2W+e
         rc/qTrn4e65H/NiHfhyLMIrB5Rh4wXNRmAqDamATHSBAyIKlTkQA+IRJK/bthDvn+1p8
         hSCJVd7cx6IhHZ7kJ9b0svaWBVtXtKCNWR+nHu87tzdiQlCafs3+JmThPfWCkKMwwvRA
         mAZD5oajg/kuolCTYCJOXnPsNl8ateHnR/Mc84EAc2HlzISDbJ4uARI8/1DkKyRvKt/L
         Wu2VuN/wJGmXVXWQfnxVMDKaD7biV40rS0PxKOJxjdERoFEwkDJgagEGetgVrjPeUJgM
         oL1A==
X-Forwarded-Encrypted: i=1; AJvYcCU4ZNgXGxXS+0GAJezXXTkrfxjc5MAdIuOTCrNNk335hFx7mD53Oegn289IAiuPB+lFqACJzptSsGhvpyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOm8AqcwL/ExMrSDYQSKj0L+EdTVvOcN9bQiu9uj0bTsfzCCGm
	yP7Fp244aj1Yk2n7tJVvmbWMaXDE3YtY0WbWrinmfSlb4gq1GiDXRTa1ugZZIe60hL99CiKsfub
	3zQgoeV2h+DsjfMGGK0KlYITEr1xt6yJpGI7sOFP32/DY3m3lvcrv4GLctxpXnpQKDjU=
X-Gm-Gg: ASbGncuBpwdfR3Tgrt89VzRQuxJGED5SFIOs6Aj4xFT5jCdI+2KOnIfpUCzTqIOwIsM
	Lc3UXrXnmCaVdHnfCn0YENpyLxSbfcLA/4+wDOr0lo49NEaaYblGQUcKlzCyYBbRZeJ7I7Rk1Id
	PG1zlWN9Nm+0dWZGJSfHyBbbDlXaCgylrNEVVi2Ggd5Hgw1sIdIrVxRHfnI5MJyIKIyAX9GwcE6
	nxfKW5vl34Nk5THvH+7rgn96ulx7V8AehvRnw+0VSEzJZ7z1EallkMqmxXLBgODW0/Xxp3HAX2t
	TubQvWEbKqwaGXBUR32AdCeurEx4oWHbKkUfZJiKyAf+6htgkXickeHtxl1k5OM6qEErJ+t++wA
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr194273926d6.10.1747652417974;
        Mon, 19 May 2025 04:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKLoOs77LAAd2FaVlz7S0E17UdAYw+X90/56bpj496u2rqnN6gHMaHcHAnyDBiwJmiqq2D2g==
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr194269906d6.10.1747652415358;
        Mon, 19 May 2025 04:00:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e7b1sm1779835e87.229.2025.05.19.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:00:14 -0700 (PDT)
Date: Mon, 19 May 2025 14:00:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sdm845: Add error handling in
 sdm845_slim_snd_hw_params()
Message-ID: <e5k5zslz33in53ivbqttnnkt7whvzfay4uwxmi2o3m2a6c6ahg@5kpjzcyov35h>
References: <20250519075739.1458-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519075739.1458-1-vulab@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: 92YtyYz_JXnUUgqbJkQI2PcjIwHjQGN1
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b0f45 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fLaHX3QtLFUqQw0t1l4A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 92YtyYz_JXnUUgqbJkQI2PcjIwHjQGN1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX7eI3yj5O0tN+
 4DBJhVgAiRxPlUDCFq7eDy8F2YTT8hczQEPqIpyMGrS+kN6gTcTOyjWrB6hdCkFu7KalMbFxiFF
 ka8Va/0T27ZisrHlhHjZmJyEog/g5SHLTfuIPnuRzoYZVl3hYY2uYxMXx9VeVl4ETy6ISbOddPA
 W+yGdxYjNu7ZVp+uH9Z9T96xY5fdb03KKiNgratp8u6J3cjpSrnUyr2kSkQI9kjmLsCnfkrQqVU
 i1eKpRs/cPZXVwZFi9NMmhVtxX0rmf9ymE4bUnZh1lrqQSQgxaHGY1wNrsIwFprxoE8g5qrrp/P
 iUyji155wIRHfQZkqnc01Ke7kZZJoJBzgk7uN2+Cpd4pAQZymPMdM3FJBHHEVB5w4pw1FFm0m7/
 ZKPfwDv3QzzPh0t/amoWheo3LWjv3Hx4G1IhKK/NTfZu45x/bKZJX3qJxEFfhYrYH1YNkzor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=717 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104

On Mon, May 19, 2025 at 03:57:39PM +0800, Wentao Liang wrote:
> The function sdm845_slim_snd_hw_params() calls the functuion
> snd_soc_dai_set_channel_map() but does not check its return
> value. A proper implementation can be found in msm_snd_hw_params().
> 
> Add error handling for snd_soc_dai_set_channel_map(). If the
> function fails and it is not a unsupported error, return the
> error code immediately.
> 
> Fixes: 5caf64c633a3 ("ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga")
> Cc: stable@vger.kernel.org # v5.6
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  sound/soc/qcom/sdm845.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
