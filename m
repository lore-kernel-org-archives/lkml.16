Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3D7199EAD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481025; cv=none; b=Ngn8aNpBDLulvmwZytzWJv60iZNqcb36w9fq9jHMdXPmmmwqaYDsSPWj1gHcOMwO+ZrGNFgnbd62k1h1EYNsvoPVBAhm18nFNql/5HqSqP5+aK2UVVdJR0asX3xS2GzeXyorp52krU99jbjzsa/3mTezxUU0qdwTlAV4HFeDGzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481025; c=relaxed/simple;
	bh=LP1HLuoXtoCGQb2udgcbm0cAC6ByWX+Cw/vEV8LuYJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbYuN7mK401BMKyYztHOotWXa/oAkFbfjpkYVQ/SwSeEOEyVrXsS4R3KZJrSSBA0AOxg7Cl7an7opdu4NHEZ+fKVL/ezkTjvPGC+ftPErCCpt2gyX8t8nl70VgBu5J2JSwrXjUPlIml6qxbNyG5JmOG5M7Td1tlMjN8UGbwysD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDNPH2Cp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDNPH2Cp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599cvp2007717
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 14:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K8r802PenSGXPrkZXgxFoete
	wp971X+pPQskH5G0jbk=; b=YDNPH2CpZZgplNKrxTcITlOUEPl9X7J9WlI6s7oc
	tKFSZL/Q6UGPuy0udoq5iLtlEmu5jQKGVbq8Bieu5ntI9VahAj9SPOcVGyM1T3Wt
	zE64JavD/0VGnHLbOvMUTT6AJIYMROkZdevMny0945sGZhlZzsu5IcwzG7j+F92u
	QZX6xyFBnovv21jKEa6kqrNSzgpAAcwJzZc0gRolaCl/GG6QfrziUncGFn0w8q+9
	T30YAgSUZQMzEZkBZD86Iu/sXTDT2D0gW7DWul9o9+yCYGRQxpVBRkKlwOjNVpOZ
	14bXY0WVO4x4GBv1p31yJf4TD8mW1+iHchFv5GlZVEgLNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpp4c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:57:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so581342485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481022; x=1750085822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8r802PenSGXPrkZXgxFoetewp971X+pPQskH5G0jbk=;
        b=Me0GUSvtMA6b4GCsCwm1TJ+0Lq2NACbmWzuWZbBuhMtGtlq5podubADwQTq2rw7Vv/
         2lVhw4/3Pc/M3ZW4mV6Zui2kHQKaZVxZAYlHM3v958V59qgm44rsecnbCaCV74No7pMv
         HRzqXU1t+ihZZNX8bIDXxBqd86LRmffzNR1Ecl05hbXXL2+s2yWxfB7N0Igpvm3p7POw
         8FLLE4lIUb+34gBeoi6uioIWD5QdR4mNgpAJqf5P/qgOY67TLpgyoc5ybsmZ6duKc/mR
         qdi1Q0x669j8JafyyrzucKztWLyif36gZ9VTF+On0As4BszroM6pVRc99dseSEhVZs3o
         lLTg==
X-Forwarded-Encrypted: i=1; AJvYcCVEFT5CbnBEzV9N5zZhbtfCN6nUZ9IGy02Zavr3YnwvaDKqmOp0It691JhP9Uhx39N6nybCOIXOh19ijCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0qbgWYLVAQi3CEwdWw1EdiRu/wjRJA0KeY80pgvB4UQND9Y/s
	eRXjHCpYd1veKUhdh2heC3BF8ffow2P7Sx6mHTsHt2eidfRUoHADohJeojVZhK+hPtWZQDBS7Us
	r+WU1MGaok+pN8OpzkorVtz/T8xwMP/lxsgOLjsMn7p57wPuIage4GkNQjkhKOUb/6SQ=
X-Gm-Gg: ASbGncvIm9vmuTbxDAqeQ34Dg9hEo4xC8vgQdU2obGs0Hk/TOJEdO+CWUAeBZLfLIan
	2WtYpt0munzMqpJLtO3h14gPdXLjid88Zk1Cg2sxTP2B2sPtUudSKx+R4hXHYkeTOs+D8QW1HUO
	sdlI0FEvzY72I0O62UU5f8HM4VITeREMef7FGRu4mnNSNDizJo9PnF6jEIa5Ge8f1bXia5FOV0w
	OwYRnU2XBoSjpLKKKOW3wRy7Dc7uYj9wYRi1S8WJvZCyeT9AJyv5FAP67H7pjUv9Tz8v43AWrg3
	g+lUEZhdorcABezkmc+8dPA4GPuzDg50TI+mHnqdbkLoPqt/6DMJICxC8ONVvXYg3S9k+EtOzHW
	HqLP2eTqj1w==
X-Received: by 2002:a05:620a:2495:b0:7c5:99a6:a1ae with SMTP id af79cd13be357-7d2297b0605mr1872284485a.0.1749481021908;
        Mon, 09 Jun 2025 07:57:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7bagCShzpFotGW6Mdie/zxiNFAxlZeqZ3FisYsgQ5S/g+ilyc8bP5T8FnUSbm8hPil7YMIw==
X-Received: by 2002:a05:620a:2495:b0:7c5:99a6:a1ae with SMTP id af79cd13be357-7d2297b0605mr1872282285a.0.1749481021528;
        Mon, 09 Jun 2025 07:57:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b347afsm10911921fa.34.2025.06.09.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:57:00 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:56:59 +0300
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
Subject: Re: [PATCH v2 31/38] drm/msm/dp: propagate MST state changes to dp
 mst module
Message-ID: <4w6rtzhetxrco5ncynr52qeveypfpqkclh24kcdpfcn5u3v5at@evxsz3xdxfio>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-31-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-31-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6846f63f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=dJ-eneoFgqejyoFL2bkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMCBTYWx0ZWRfX/RziiSuL0rDV
 Zptgw8y5XrqFYiCaXh+6MDL4orA437iyE19FsAvZJaplz+YY5lg6tDVxbNJbQhE9cuviYKLZxze
 8/ptMRB+jMIeCozc7tvDm2LJOIqBCF6U2R7r88hmoT2H1CZiWW0U45PeD81tg1l6x/ATUHfjujh
 S4ebMhaLbFH8oadAeTpkZiZWKzpOeXX8ZWPXMVWkGOLwKU/Fzjv3G2NzXTwN8yNGqq87xAnfWbz
 fJrX4vHawwgygG3ffMnyoeAbrRdEhisE2aDm4vbOACXk0PmfXhpS1zErFUwFRK4eeXp9WzPwiz1
 j+9lp8z5O9ylWicb6QBTH10zowigdlkHPJnPF/Bh+//yynqpVG2CafIcqLO8Z/iYMeuEqx/Z2pm
 VdbE5FBwYIJezzZPdAzGR4UyMYUfwoABrkrzacs/AkxH2FjU11HhTnuxPubnNNaUhyFyPb2D
X-Proofpoint-GUID: XXVJCvGpjP-Dnac3w1ihrSTCC-9vRNWp
X-Proofpoint-ORIG-GUID: XXVJCvGpjP-Dnac3w1ihrSTCC-9vRNWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090110

On Mon, Jun 09, 2025 at 08:21:50PM +0800, Yongxing Mou wrote:
> Introduce APIs to update the MST state change to MST framework when
> device is plugged/unplugged.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Hmm, who is the author of the patch?

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 323d1c0a9efa4fa30ce97317e873607c54409a11..9dbcf4553cad70c9e3722160a87403fc815765d7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -29,6 +29,7 @@
>  #include "dp_drm.h"
>  #include "dp_audio.h"
>  #include "dp_debug.h"
> +#include "dp_mst_drm.h"
>  
>  static bool psr_enabled = false;
>  module_param(psr_enabled, bool, 0);
> @@ -420,6 +421,17 @@ static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
>  	msm_dp->mst_active = true;
>  }
>  
> +static void msm_dp_display_set_mst_mgr_state(struct msm_dp_display_private *dp,
> +					     bool state)
> +{
> +	if (!dp->msm_dp_display.mst_active)
> +		return;
> +
> +	msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, state);
> +
> +	drm_dbg_dp(dp->drm_dev, "mst_mgr_state: %d\n", state);

Yet-another-oneliner? Noooo. Really, no.

> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;

-- 
With best wishes
Dmitry
