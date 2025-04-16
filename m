Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BA24BBF5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845556; cv=none; b=repammc55NhO97r24jcfpuBXvsCm1vzWO/nmN/pv/4UcTM3KQ2akKg1Qo3uIFl4Loyl9OWFS2flTacp/2vOONO+QpYhawMACST/Xl0aj8R0G0s44KWTY7fY+piBRK4mlSG0/TwVC+jwLp0KZ0VmUdnJN/c33pTDIhc5bxFu3AoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845556; c=relaxed/simple;
	bh=9yqQJYjMCueMwbf5JSB+ALv5sxIVyPf0orvkUYx0qAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGSJa7l+Y0AYGS1+KE87OVFZy8EWwJ5r86kpuJ16WtdDMiINWjSg4Oea2/JQXC++v8C08jG4bHoNkgZn5vHJhtIHUPNqxXOsQNaNPJ3a+8jbasUnDq9U+aumasz+hGnLAUOOahP+PLD4P/Zv6AscbRoVaFInNVMDkR+PepgdlCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isKcqbjP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isKcqbjP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMMQUY000537
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lPOdN2D2GxjUoOAn8DxazkVb
	UBcosChdPZCm0x/++yg=; b=isKcqbjPdj1B+U3d6/lwTNFGP7pNtzyZPMsbGmcD
	yBUwTkJY7ki5BxgIZMYogs7OG/XJIcAXu8EBRzPqbUaHpOzImMSDYDjE/vtbb7IJ
	emRBE+5c6emYTv34rLrqyUT50ihPKHl46Fs9/abXlvON6gIvspjeKZvSXyHV+1vl
	DN8DHfx3Fp+wyDmBFMkDD7XitKXHtejAmRPHQMsT0rEue5Bt0XvkWdrG2GpMoaDC
	Py17yvSHsFrEbw89ItXmgixhgVGA6ZjJweqac7Nwkx/mulIUNW5QA5sZ4UqpydGs
	6V4lDRYocK9z4l0/DV7ADFDUM/NOFfSZxNz60aacfdOx3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vn5sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:19:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e91ee078aaso3647126d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845553; x=1745450353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPOdN2D2GxjUoOAn8DxazkVbUBcosChdPZCm0x/++yg=;
        b=FWntc4DmYNysgUKSZqcPtmxOfQUTizf4vQCfabj58KDTI9MI1wbVzCj54cpP045Jqj
         GqtQGfDNXqnLkFSb/REzJaU8mfjK6ci5+nQXxMT5Bu4JP6RQ1riQSR8x/x90rW+mjy+O
         RE2Cx0wozabGvEWcNwXmkg5PuP0go5jxNWAtyQ6aevhojU+rn+uoMoB9ib1U+cNhI/Rp
         QjHaUFnnXu3u+dob8/2JnlqMRQ8gI4mL3tHj4OLyGEgHWgxTjA1Z9VBasdhGwJK/kDYg
         eqEe5k18R1wD7xlmNitpZ0EwUldJwvJtMdajST0jzFqanpzvy9XJ5thT4pyOVljbJ+y4
         skKg==
X-Forwarded-Encrypted: i=1; AJvYcCXEVFqyleA668NlzmUFL8HtIkP+YKm1MdFl+y2Opzk9rscCLcbTtxdfYC9KrmcOvtRJFgboxNdcfKqwf3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxrcdMIzvE5S73bpJwvdKnwt0WTLJMujHLAlGTHZyLHL4CxZC/
	LA65mZ7RxMd/HAlHJ3PPZ4md2onWu/4B0CCrFkdPhxPUv3TbI6cK6GtrS+QbeWpwty+y6hV0liW
	uhZdsc4UlAbLHWJhFUFt5sAm/0nNh1rhJl5VPfrG67QLQLfb2vgPoab7JXO/O8f4=
X-Gm-Gg: ASbGncuITOsrgLtsBTOd1PVJuwdKRfdZdIBjitXDBxSTYyLKUEu3S14G6vbceI1a5zv
	dSWrk9uUdatx5ZlWKQQ+Nu4pjnul1KtjRa69ysk9ZGjgDpkzi6Q5bK1W7DsqrdWTWhoRhRby0TH
	udpjUYgZLGQnrem1HW99oVVTXs2dcFo6NmT2i+uK7YemSyL5Hu7C3iD7oRQQgcfyKENYbjsiis7
	j7ouxCSdqcAI0K4ZJp+0THsf9tCUi4tMEZknTDN3GChZX1+TxBsFozvbzHIovYmrVcKIZYqbSi4
	GMqmYL3DqIpPOHjJ1boT6m6nkc5TpZhPySVdJz+sXwrs6bfpLoRu5L6Y7EC7Zx7zAyxgWZT7SOM
	=
X-Received: by 2002:a05:6214:cc8:b0:6e8:eabf:fd55 with SMTP id 6a1803df08f44-6f2b305af6dmr55384086d6.39.1744845553034;
        Wed, 16 Apr 2025 16:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUGj8KXJI5k/hfuMcwByep+3dU/C//eMqavaVyCZMY9db41fx7/QT3SCEfUNFYr5xIkDR6KQ==
X-Received: by 2002:a05:6214:cc8:b0:6e8:eabf:fd55 with SMTP id 6a1803df08f44-6f2b305af6dmr55383796d6.39.1744845552643;
        Wed, 16 Apr 2025 16:19:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31080864bb2sm2487691fa.71.2025.04.16.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:19:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:19:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/34] drm/msm: Improve msm_context comments
Message-ID: <3co4r3aj6rhydqzg23dxnh3e5asrny5zrkzchjg2dov22tzpho@qptuyivzqv4n>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-7-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-7-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: KepyraU07EnCf_ToSELjnRqavr3quX3U
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=68003af2 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Xk0_UyW-TLBMhFL3eOIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: KepyraU07EnCf_ToSELjnRqavr3quX3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=682 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

On Wed, Mar 19, 2025 at 07:52:18AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Just some tidying up.

Probably there is nothing more to say.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry
