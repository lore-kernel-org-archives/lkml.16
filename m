Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3642A8C
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747561707; cv=none; b=sXtDpNd2gmPKCPq3h9BwcaX0lYiisatNEyFPpc4n3LplGvZmurOP/XC6fByLrQ2sfJi1GefEmbdFWH7mrhipEmq/rbOvuoIVOAl8T+tEo26wTN6D1bdU5c+Wy3V46BMWL6V7StpgaW4lwS4ZYgWGjrHX7qno123bYEKwtfDFObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747561707; c=relaxed/simple;
	bh=fAd1GnAf/ExTF++zbaiyjk1utzg/TAXkIrKsAtv8WiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoLvjcUMIxuBczvBL0T66TkSD408pPcEvmJYgl7xMNORzVdEgeGxpf5g2Cad63gx0b/69k3CJwQRAnPMKezKu4tLpacUu515ASXtK57/7pvGy7QJzQfhLbCAY8tEI85+znogwAEFw2fqGs+AeWAWmj2nKZzZvjlkboXY9o3+8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0/g6Spg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0/g6Spg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4nu1r011228
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xeOReUMI3Hxt03467caU2I9E
	n3IbDwST/lECenXzhQA=; b=X0/g6SpgQqhIg+wgpQurGGuX+B1uwWoypnY27hcY
	Y1MbNVyNZBBE7z84kQO32/lwWMR3x8t3FI+JtqWuYGmg3u+MaygDIiQ8xYn4l3QO
	gktAdp8JExjheKeUn4VsqN8hgkWhkxtJA9tCdjbMqSve3P7X6pikMyunlEY9usqY
	/SDsoqvJetWtcD0R08dTgL3VDYkjwzoolLyl/mvyIFA2KPh9WzlgxMTKhkf1SViN
	61kV6R6KdylosE1wLWLLkHnTQb7niqeKxYFUXhR2Ixa0zilpjfGVvKOfu9k+OqQ1
	wnww4x+uGTcjAG2/mHRsaLqkj+6lsnDd1WREOaofdUknPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4stae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:48:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so1161001285a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747561703; x=1748166503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeOReUMI3Hxt03467caU2I9En3IbDwST/lECenXzhQA=;
        b=j0nJkLWHHe5AlzdC4SRRJ3yPLs+u76CIQ77++10tnGHWME0oCzk5Ek6xAd1iyG+r+F
         QqHrIN2EqNqyygib8pqZveKDYreeNTe1rwsy6CsLlNgpm8WCGk3zYm5V4ERt24DoRn1K
         7tNUZB4UHib11G9S0iw7m8ZH19BZnJKR0G0BqmjeDbEUVXL1V5GigApCaUfO8Hewyqof
         /4XytwTtN9TS36gxLcVBRgzDn539PdGXR66PTGh2cCKXotB2bdeU3Un1snPEzEaGakxB
         hU6REwaPYo9diA95Y0SeqpxOV2d2cix5XuFmBw1OyYl+jTEUivZ/kIreZclmzSOViqLx
         +vTA==
X-Forwarded-Encrypted: i=1; AJvYcCWibPNOSJ63kYDt4TULyRl8/mW4pJNg3QdBjCL7yFimBMN8Moce7BaZZTJln2dxIk/qitvugkOsZx/SwI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7f0FyfjUaNNVXjsKO3Q8SJSl5GY+vOWq4YsVwnqcoSyVoZVde
	Txqh1QTxrTOR/lvyFgnk/yDXKsEYyg//2uRouBF16jwvlyg3erZlXyAFC0CJe79MQg0bMnf8fwN
	lXLspgwpnl7xLOlt9N0WPJ7DtBDfElWjvzbnoKYcmjfpOM3RTNbopHezI1MsveRgiU3vsul9aWE
	g=
X-Gm-Gg: ASbGncscIMZvfl3SiPng20SSJMlCdYXz8Ae6mydhJlJFD7CAxDbB3eMSitcbJgn4fLv
	lnU+e2mY7rWCzZySeMilYDNrDtRY6IDnl6O52ZwoU0GHj/sptGzQg7OMYDZ0LwaWcgd9MHkXae/
	rC6QyG0XBPh7E3uDrlH8iNNPEX22wp5LZwrNh63atECsHR+WeQ9A73V8rGA7P5t9yAkwG/gcz3G
	aidYw4y0tuUn8uirKEINd11UmfZfos77GzkgyjzRt+QhbvixSoPELVXEcDXyGSeyPwkm5aZ8MOh
	Zj14z97Ik/K8s3CBzH8sPeammtgIj24nsv09TUbiOqLyIuKiUHhkcdoqcM2L7m4XZ39Zy9JHFlA
	=
X-Received: by 2002:a05:620a:19a7:b0:7cc:fddb:74d9 with SMTP id af79cd13be357-7cd47f1f04emr1103059885a.22.1747561703384;
        Sun, 18 May 2025 02:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhxYxoAbPZWvahXZRqd8LNtg4r08bn/rUDslpr+bykQGwOpoo53NY0+RqXYiJ6KdhKIbXOig==
X-Received: by 2002:a05:620a:19a7:b0:7cc:fddb:74d9 with SMTP id af79cd13be357-7cd47f1f04emr1103057685a.22.1747561703046;
        Sun, 18 May 2025 02:48:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017eb3sm1344694e87.119.2025.05.18.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:48:22 -0700 (PDT)
Date: Sun, 18 May 2025 12:48:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Message-ID: <ubugepmnr66od42jux65ffegreksmfxmfzkjcjred32htkzoch@h2pfezdxan4c>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829ace9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=OT4qMnZDQSWkCWZbIpoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pP7tbucvUikzjWmCffLzOZasnNyM54p7
X-Proofpoint-GUID: pP7tbucvUikzjWmCffLzOZasnNyM54p7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfXxBxwsdGVkzyp
 J7ZtucH7UlKS3CQdxoORSjS3V3sPyTVn06pISz04MVEMjUQm+OUTsEpRoe9eBOqHKNJ7msm3wSb
 7Pkso5bTdJW6ekhgKC548b/wjpluJ5ouzdpVx7FTsRV4wIzJxnxJ6f5mUZh3jwLQ2NUXl7EAjEY
 FIk8DIYDL+/T47YzpH9IpgUcXKkcVCb8rjw6jB8BYswzggGbAg+4+6wnFc0hDwnxjohTwYh+FXN
 PcjF7llVj/r1ru31qKiPls9JKleMkI0DCUys8E8ANWo89xVyhUVxwHHX3wkGOgDKzpjklmgdmTW
 dhFys9n6p7xoh71kge17G3M+DpHt77SYWhiJa5y6RrL16SHlJg+nCEG3Pkr8cHTOwUQCkIQywsD
 1FWNFWWxVvSmzMhVF1KLQ/u9yJvZMqXZkV0z2q+KkIcmPanaryCd34LPP/TGPvCxGYRJHWsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091

On Sat, May 17, 2025 at 07:32:42PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 154346591365f3f89d467674952abb2f067e7ce3..a20b57e964d31adb22f0b79a5178b45f0f5ec5d5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -668,12 +668,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	 */
>  	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>  	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));

Nit: UBWC_SWIZZLE_ENABLE_LVL2 ?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	u8 uavflagprd_inv = 0;
>  	u32 hbb_hi = hbb >> 2;
>  	u32 hbb_lo = hbb & 3;
> -	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>  
>  	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
>  		uavflagprd_inv = 2;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
