Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674711DB546
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357611; cv=none; b=dClzgNJdbOsCy8gfzvl0vx2tWblL4WNta5eHhmux8WEZJ73TP/AKkMMivmlDLmEYCWWhi3m+Cbh9eMTTSSUb0IbmQIqmYYGGI7kQDCpS2mHYPZlw7Awoh7k7vGVU8hp9U6yrO2kOOIJZ/Ad8xJugTcZXunM0oGEGrfR/wavDyGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357611; c=relaxed/simple;
	bh=aIjrTRfYLTnwXzF4Ma4qQ1u8fmM6UfvdMIVIuCbYWVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVIs2UxSuSr4DP9WorMMixr31Y3ibElql1bsAdIg9KK43HtN4vqYcj3QujVoUmmR29FhGM6od3JOCXiymnL6MOEt7DwrybD7HdMh9EfyWFVPUKSnlD9kvUT9o4ZjX5J8xlnGTPSIlBXMWZox1o8kh/k6yVOvD6H33a1nZc+wdn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtphLaGg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtphLaGg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDRJ8L007858
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=24PF3SFV4aF/I5PNNy5sUXlk
	8zbFgRz6F2wRsCqGfKU=; b=LtphLaGgomv71Qud1M0r1gRUMFeNIETUSYHC2fEO
	ugMClcLtJzYVfC8oxCxaBuXAa+/F79TexG9/MbnrbhZYSv82oLMH9jleqUDASwa8
	4du0JCExkXIul95b5LYJ6Miej/x3ISxQulAQ8pjhho8N1eMS/wfmNLj2IJK5SF1k
	FUQ49j7XpurpyF8/ihBpJbgTkX2s70t2Cea7QJwA3jVJRdhgjuA7AsOqWhTwiL+S
	Q0DkyaJuVpCLe4tfsZ42h0oew3svMBrfKoyWHElrqOnQ9etZNf6f2LLmrjeKQcHa
	b3tAPJ10f+txRFE6/Sw+YJAPbK+ObxybrMCKQfxM38nw4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bjgh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:00:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c572339444so584400685a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357607; x=1743962407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24PF3SFV4aF/I5PNNy5sUXlk8zbFgRz6F2wRsCqGfKU=;
        b=dnyj5WJcdnQ3YSS4fHByepNLoLoEjKQD3Euefom2wHf7IZ3+7SZmDvQ5vIc7Uip8mE
         01MLRXbVFWx6m9ARTBsre7CO7qu31Yxu/oncgMCz23xVK2J7ASDXWu7+mocobCYpFvkW
         NJnkQ3iUY7YRbLqeRmI82vN2EeM2dsGrrlF4IONiLgtaKe2v3ouD7r/+BsfmF+2nsPxG
         Tb3HxvxAu17gLX5BK6yOIkqL+RUnPAHcM1eMTJnl7GdaaVuIjiEUhwsgweCOZpmJnDFf
         bLNRD1j7Bgac7y0y5j+ML3uqA/exzaVZcrD+L6WtCQI1gCCsUgIq3KUHKv7Sr5I2AQCB
         s11A==
X-Forwarded-Encrypted: i=1; AJvYcCVbYVCWQFnECICW/xpFWJKvdh6QqNOlucj1qnhTZLRraX3vNOIOzxwWIiUTscexPNyuYBUlPazx3xnicSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJiHp3u028lT1HoNaE1qKb6g0iKUe+ESr5wYoxmbA/M/AI25+y
	UHIblqGAuSj/hktnNapbRKjMXeWDQ4iA9D3n4uZ7HdqNMeD4LmdC5sPpd8kqEJU2ijI/Jl49nbx
	+prWXFFzYMVJZc/5Gb5ohpjAKC1Z2qOpFEa2/KQ5UkFaKEGmpgkH1vcqFy1lcyho=
X-Gm-Gg: ASbGncs4mTB+TTuJqdOm0VHIPNebCK4QrWSUK6ccpjTTXhjWRDApiHwUvi7glGUTaPE
	lS/1chYVSKgaG8NRuO/AaaDi4iwxdNPF7MhfSwIVB6WOxRuc7Ni7DrnFldhWOtUw9j/L6aJ8Eqj
	Be2Vuvho2o0/rznQxcHuOJOMJD5CJ4T6gFcMZlVjaZ9apbjynT/JNeyl9FQKbddGsprWN5bcHDI
	Ir4rqKapfI4RjV4hWIVcanw/qiqnyL9xmPvZah/DwkwaCbZbC6FK3cy8DSRfKfTnvA+SO2JeDWe
	6Y56j4aE2tIebeQNKHr8hSAwuXCdIa34sJoQexCQykq/OiLnATSdLh7RduNRzD2GKTtlWEInHBP
	1Vgg=
X-Received: by 2002:a05:620a:2589:b0:7c5:a25a:f0f3 with SMTP id af79cd13be357-7c6862ee9dbmr1121948485a.8.1743357607150;
        Sun, 30 Mar 2025 11:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqc6KixdPi8yajOw5HWSKDcoirObGS36mBZyNv/+8GZf2e3lwFx6IqpQQ0J7cxSsk8ShQWA==
X-Received: by 2002:a05:620a:2589:b0:7c5:a25a:f0f3 with SMTP id af79cd13be357-7c6862ee9dbmr1121945285a.8.1743357606843;
        Sun, 30 Mar 2025 11:00:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm945700e87.26.2025.03.30.11.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:00:04 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-hdmi-cec: fix inconsistent indenting
 warning
Message-ID: <bz5ceiwgnmmk6lfj2oy4b6hvgf3rmn5llx55ircwq5ykmcd26r@pbz6bcl73swu>
References: <20250325074654.3669-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325074654.3669-1-hanchunchao@inspur.com>
X-Proofpoint-GUID: 0NAsM859G0D7im_MzSVf1ZVSlsQkw9RV
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67e986a8 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=F_93P0QhAAAA:8 a=EUspDBNiAAAA:8 a=DgU9KTSelz5mwIVLWmMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-ORIG-GUID: 0NAsM859G0D7im_MzSVf1ZVSlsQkw9RV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=697 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300125

On Tue, Mar 25, 2025 at 03:46:54PM +0800, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:336 dw_hdmi_cec_suspend() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
