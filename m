Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5211E5B7B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608040; cv=none; b=bWTin82UUxv30CLMQbV2t4M5ziAUYKp3MbUL5cJMcDRZtYXAObOGhj50tiwlex7q29RKi6ofEio/C1FgDNi6wlCWNuItYYUxtMou74Pa8JfoEozRRsXbbIG/gUud/U9Ve/7/yBgLwVV9wFTODDdIq7RgygnqzFZer82SmNr2yZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608040; c=relaxed/simple;
	bh=PptaosrMKIkszF9oY5swFi4VZ1gvZMuR9i7Ep8CGyvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJh1iSRzEhTlCQG+QXp0RDBReODRzSz/ZlkV81n04Xl+4N5UPoo8PC25psgDoS/+I+WbxLWf6uEBGYuLn5SVvtWDExWMexviZtInzMA+QUOuI4K7NbCcVH6AMAI0qdjvZZ/t36DXIHSf/Cobj+UWqfmZuJ3+nzpNZfZ/mN/QNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6TV0Lox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6TV0Lox"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuFM001357
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YJbYuN2gJ/vLBVO+7ggEakIk
	yWo8fYN/fU1HKulgY6I=; b=S6TV0LoxN9Hg9UrUvaO+4Ci803NRAtkxU5Vfo6rY
	80rUfOdGhN1a9MfOxX87Am9700jbKmaBiTQTkA1uXadpqDCPb5QEgrdrERyRE9NB
	SMy3ULr6tezjisWlIiL+16hKKbxqPD2abNFbLi2n0s0qarzJsOVtpMgVB+TsjBmP
	4Lqc0a3p1Dv3ErRpy7pLTi/qBB/3XEOo8nL08zhNKHi1+sYkCMvjvrsQrmCbjH+5
	Uv5t3NKkQuino53SK5SE95mkEhprXs2L6YY+bsOxQu4TmkFNHeXYezhbVFYIfcxe
	lW7ZjJZR1vPgn0+QNr1XW8EFcyOOOYZiLYqXy3nUMGBABw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j36t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:07:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so724845385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608037; x=1746212837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJbYuN2gJ/vLBVO+7ggEakIkyWo8fYN/fU1HKulgY6I=;
        b=PgOtw1JIZt4j1vSTX9ZXMcYFSCNKblo+jJMULvYNYbaDNzfKEOUhrAuy0G994jNXwN
         25St6X+eazKVmXEcqtonhx/VIPo/rremWDl2kZxkNPidwGCJpBWxgeAr54vmdDkb/hQF
         dKTcNuogC2wICCQOwL+1K6KOAZ+QZd8y4ROMusGs83ut/pddaj9jpT2OhDQsh/pDzqKM
         Ys8vDe+4w0eaDeRVoIx/ow0WX56zYeacREuND2AnanvvGEQDNKQLV2F0EyrjYIxdyP08
         kv/Dr2+/ryMMd8pImFmMeWOM4GR3pLurvCXG/0mScD3ctcnsVZOXspo47pOnm8u3z8aO
         jjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXj1gMLvhhddcCbPlKaVHIpga7j1EfwDivPnLMB+xxPe8EISFIQausao20FFg8GyHgXEf7M34cXKv9HkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIJaDkCBbSaTIc3gvCqVNUOg5DooSPou6IXethq/2QOJncg/3
	8Srp5MWyENkJXyNo7zs9QdIXIDXHaiFOz4sUezkvi3RRX8MDAYiU5S3/EUp83FKRv+zdrA8h6KU
	5GpCGLeruS9wNcWcvwHtMal8zRksDPWx5Y/WGoLIJth7TY6b4AhVVPO+QujR9Mx8=
X-Gm-Gg: ASbGncsB/TBx1W9mXZ72ve0BXBfgHO2UdkCdAludXPwFc8+hh2+Xu4l5Okc3F76NWqo
	bWT1RS/J4sJHEQNfEk0yPrV78VmcYrS+2I5rkTl8+N+OEsH9VDx+i+Qkx9EDiPXB4BGG78uL35w
	Xi7PuuX5xTHXkJM+LLu5VD+LKFmuR32Cv8jGOeJ07uAwPPbHY76y7zlEBSXFdfxQAkwIvB7qfEg
	65eM/lGYtPlzTrNC6HbqpK4lZq+q5T5i1WUIIV3XP1JgkiqK3+b7i68sZiCFpFpTb6vUDSuNj3P
	ervb34PDowKEC9dQwuDJsmOEyennOw/jNyvyJgfm/o0kE4ElHygx4UCyr0UeohtDtkuFlTAdnZA
	=
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr115702285a.58.1745608036741;
        Fri, 25 Apr 2025 12:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfsamSTL36MZXKs1A+xdmyxqbS+5Cgy4qJPLYj7dmxRhp/lz8rumoOXUYE90g5yOpO1ztFkQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr115698685a.58.1745608036439;
        Fri, 25 Apr 2025 12:07:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83b5sm712379e87.245.2025.04.25.12.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:07:15 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:07:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
Message-ID: <zb5fqcnersry6blohozlzc3f2it2q6ypi4xei3z2fvzp5ogszj@mj23wsa64nqi>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-5-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-5-alex.vinarskis@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX1Y8mU7WRmiz3 HCsrvzAP5HvlWt99rO9FeDfIjloqxp7hnkaRRZNsAkU/Zf7LXFtAJEccPzJi54SVjFJxruAgTtw HST7FPXqKyc+IvtPcHwxojLgqfOLnygRZ5n6yyhA0BcxNcpBZDex4XnX5vrUQbbapRwgfGGQL19
 oKSRT8rgBYa1Ib7Kp7VPfwI+hOC9SjsdrugtHvVu/Tc+xDW2LZwuHc7dPEPIpUwCv7TfO/csRD4 AwCm1f03hMyfSshOY63lg+uSeYnvegYZNSy0F4FTMtGpNbBxC6ldZ2t7NdG0RMKeSSy3Ji2cxlR jpr+UckoIHf9qZyTAlxgORNQUevTm1r1Vsd7vfFlgHccVI921GUfXJEA7EE3FlFMnLd7P84JJSY
 xEjowMTbHKIVPOYFJz9Y7284afjT8RnLB3Skx06v5Tsi+gqcBcGVSsrZRMtV08LSi3xUS/Qs
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680bdd66 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GOLd5LZXdg2kOnOye_0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gjNpQrwbqYTuug6R_AgrOmyLZw-lXjDs
X-Proofpoint-GUID: gjNpQrwbqYTuug6R_AgrOmyLZw-lXjDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Thu, Apr 17, 2025 at 04:10:35AM +0200, Aleksandrs Vinarskis wrote:
> DisplayPort requires per-segment link training when LTTPR are switched
> to non-transparent mode, starting with LTTPR closest to the source.
> Only when each segment is trained individually, source can link train
> to sink.
> 
> Implement per-segment link traning when LTTPR(s) are detected, to
> support external docking stations. On higher level, changes are:
> 
> * Pass phy being trained down to all required helpers
> * Run CR, EQ link training per phy
> * Set voltage swing, pre-emphasis levels per phy
> 
> This ensures successful link training both when connected directly to
> the monitor (single LTTPR onboard most X1E laptops) and via the docking
> station (at least two LTTPRs).
> 
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>  1 file changed, 89 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
