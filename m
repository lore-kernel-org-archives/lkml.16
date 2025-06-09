Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0621322F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484738; cv=none; b=dnYt1wgGh7ifgVCJ1xCr50Pcxzx64DqoLqOUwjBkC/EF6z7edBMb69Wd2Ka1QRFlNHwptPVHbBkqbx7X13j+jM/KLQnGPXzH3B+GfotKRsVRbaCkv0ytNzOrWnYaiWTnnPsVzi7dYtywda/Orzrcr48I7mp4koJTCBNHuvQo7Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484738; c=relaxed/simple;
	bh=oGQPDHyt8o5wmupzTzzqpDaFld/IFzmUGTmIhFY+rew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VawzNwgqobzliWqilhRWkSYu3XwQN2yUknp9nO4rHU/XAu1BgWoYvI1cXUDttLNKRD3xwxmX31ibyoZcMzY7/gzxbwGUOCorgXaYUAseA/tVEa/g3O4G2OseMOspzSvaxKuHVeAlw0Lryu4vPUSj/y40MfOu8uwwfP6E0X7cE90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLhvuV2z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLhvuV2z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55993thE011063
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 15:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m/oHPEvdt3BMym8AUpjKM5ag
	08QdTTyK7Hp5/0bClSc=; b=mLhvuV2zbVR4/brQWwKuFElCWc2siOd6LjrZ54O8
	5c8qtXaINXFQjudluqcQOH/fKNAlGP5dMYJ6T2VaQWXtDBPz4eJdH2PeywhNfBdU
	H5Pk8GIv3o1f2yJpJItOW/v2u2gdVNWNjVDkUPDS2YEnsa0JHXB7THnXvkWqKL+L
	Q0pdwBfc3a5zlKKRcfUNdyzsINZhFBdnx9NL5dIRrM0ASaaTZ24Ogs6GXcFTCDA5
	VlOCTqL0GYw02L/RS8+k5fM5ua5qkGt2P4bUAVTVtASc5y3q482bu8wqy/jByh0F
	nbYKLEFjGNFFNiKT0Y/AD6F2qvrWXv4f4I6WWJmBQG0mAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxpvwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:58:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so628809885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484735; x=1750089535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/oHPEvdt3BMym8AUpjKM5ag08QdTTyK7Hp5/0bClSc=;
        b=KIz96sboGnZ0Af43h4CAVfDzF7r/Rult6rptTTOdvEB7bdRvh0SWaKORvWKx9iTPlH
         u2ydOdGnCI/NyDZkJKmZl/30XjYuq2tzozaTGgWoRPfwmotFqY1Rqyd5ZpNBwj+NHVZM
         +d09FYfaMTlF+uLudoBtTo00fe67MXL0eXR90Q2XWUTaojkNsxUE5KYG0nuel5ZM0bhP
         F6FcXoUsBHdcYlT6Pl8DbtzzeFhn5ZqarmIRmNelq+5M8p3KB+73bL8E/I0j7wU+fjE8
         hQ2jrLuweb1KwAwe71ku/49QRq6kYPpbGqMgxnMavlQEdebtf2V8t/ACG53Bl41ZK5sc
         xK9A==
X-Forwarded-Encrypted: i=1; AJvYcCVsYwH/qWzetSgyFYbNBEkS6h9x9OaMS8mUJZrlh8UUxqk8nvMn/iifZebGTO+dbmC3J+YID6Qu9VKpU+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/l+3zMng8BSudYEk3LftXQ+6AWIonSC+M7q/Az9Gr3mQu6GL4
	Dgtf82yBMR0clowUj7V22tL5j+QjqJZcIuLHnil0ABomxh0Y0CEd327ZOHh25o/BRuQ9aMyoQM3
	+lGhTJJzkJ2iglGR8E6MsRH06X552TxUF0g9Dlvv/QSjmdKbStjwHfO1R7hPohJXn7PM=
X-Gm-Gg: ASbGnct+vrEUX+kGZLHnwVPge12vpy+/i8S5UTPthCM3vCL0UjDWF7dkCXYm39ZWarj
	kJxcAzV6HUC5Q1+T3CQbiHk7dKUSAbY76hilKsgpCqKEZyhOB7dkKl37EqpxS2DeaIKRRaVb3VT
	wp6R+1o0vAVIe5WyYhCoWEf/OE4miXRQYxQWPu6sfEm5KPt5dY1RzjCCDbI7fIOjjfxAOablACo
	hCvcDjKaPPjuAhS7QzdskyMNNR0vibPhx+B0e7AnbJNQwiRF1PODhkylMqLS7R3qCJymeQrD2J9
	udtupfQ9IvbNQ4zBWG7lGlC6O4D7H4Hkv0Yv9M+N2lXyLEYN/f3jrA9AJP8K3cZZePCeg7bd8h7
	9XrBDbAwiVw==
X-Received: by 2002:a05:620a:4385:b0:7c0:c469:d651 with SMTP id af79cd13be357-7d2298fe1d0mr1994329785a.57.1749484735415;
        Mon, 09 Jun 2025 08:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbNI21KBX497/aUWP6ZoFK3aYx+NQWMyhtvdoUvR9MJJt1pLIO3tvv8ZkDsXU7I0e7qf911g==
X-Received: by 2002:a05:620a:4385:b0:7c0:c469:d651 with SMTP id af79cd13be357-7d2298fe1d0mr1994326285a.57.1749484734962;
        Mon, 09 Jun 2025 08:58:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367733280sm1218659e87.240.2025.06.09.08.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:58:54 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:58:52 +0300
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
Subject: Re: [PATCH v2 26/38] drm/msm/dp: skip reading the EDID for MST cases
Message-ID: <lusd35wv2pj5sy6mdiw7axqxnei2wqo57pf6ju5ys2ibfrkidu@63lkbckuu2n6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: xHuN7aJDjC94ES1fQmFp_jNARG5vTaG-
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684704c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=a3mUzBo2FLGOTCIFHJAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xHuN7aJDjC94ES1fQmFp_jNARG5vTaG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExOSBTYWx0ZWRfX9vjjoaOMT7Gw
 m56RC1FyvukUwUUUlJNlxPcICL/bskHEjPSjKXeXOjnMZnoVhSv9xbwDJF9YcBvZsNr/YVQ/OUL
 5sNLoc/lja9ecogRto60IYMtKLN/A3qoYc0bBxCT/CWb7aoHMmFeC3UYd15Rh2ZaChUXoUTE7VQ
 yh+Lc8nQ27oKNdo1QoYDAs0WMVi0wK1vIcEpkprpwTB2yjVzwCZo2R2ybO922ti2+w23vWjSO9j
 tjq/Kc8J67nUV1aVK95tHbW3JknSd4sdzUKX0L0Oe0Hs+xeZ3LaSa6o9BxE/s4gOPpZygRMbFVr
 xWq9TrsPCVzc8WUyWfWEv3EDmSoGTFErxGz203zq5e2ddZngh16i/qqDLk2ohX52oAcOcrJ+2Yk
 eTva4u2n3RPMWZcQOASFFCVh/m7HFOYC8bWgglJhWyU+zmXTAgzfZ0GZ+TN8TWRZakho8TMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090119

On Mon, Jun 09, 2025 at 08:21:45PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For MST cases, EDID is handled through AUX sideband messaging.
> Skip the EDID read during hotplug handle for MST cases.

Why? It makes sense to read it during the HPD processing, ping HDMI
codec, update CEC info, etc.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 88cae0ca66015377e59bee757462edeae5ae91bf..b1b025d1d356046f8f9e3d243fc774185df24318 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -438,9 +438,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	rc = msm_dp_panel_read_edid(dp->panel, connector);
> -	if (rc)
> -		goto end;
> +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> +		rc = msm_dp_panel_read_edid(dp->panel, connector);
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
