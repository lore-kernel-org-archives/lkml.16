Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F920F07D
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555703; cv=none; b=IEnVmq4kFnS7RjWajdVffd9vt6lXVhN95EPqoT93Z6/TUcbcCERzXGXbh0oYM+jgPWq0GmfnnEfRK6dmE5QWptXIt6ZpOEJJlRn1pyTFYVpaln9jUNZIuqBHLpUMQ0TskBs3c8X4aNy9IkgZYQ2Oy9E4rAQqw52z5FL18b2JjL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555703; c=relaxed/simple;
	bh=n6QxhVFvD78Eb5h5bdklatPHcyTUyt2qmyxhnZWoMBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8dor2XBD1Ro8x16mQfin3/JmqVDMu3Vd/88ux5Z6XmmFqnKuWWI8alwQlsilgcX1Qp+TSKNqbEVRzzjVZDstnEVdfdAxKQ5bGtYA+6Yge/8cLTSKyCAQHdLK0qexK0lvgXuCvnYsjRUhiZi6F34Nv0w6bxk//Yk+PyelSwFaV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6HQGQUh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6HQGQUh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5LVWE023906
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 08:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wmWqtYSiIFN8TosqyDerhHbb
	O2ZOhkYbAGNp4xpMYiY=; b=C6HQGQUhpXc8KLqtA1l9WP/2uGyK7EJk7lv1rd0N
	EQkn6vk5w0uCA78Pq7uzx474JdTOB8p4OlWmSldjVnOOU3OZCYASyaTxihBxArtv
	N050OZJX9XvpjH2Dhtn1PyIClIkwFwWokPqnmLjsJfWPuhzRrE0eAfdT6BS2MKOL
	n270SXmG3K19GEGIJNtZfPPPCzjzucDYtMNo2HN/XqS7Bc3PCkwB1WVCnoeTG+7g
	OMYotGt9Vch9NOyoDE2egQHJQazTKdAsqW8srx1HZK7aCsR68YCH8SOfyyoowWuK
	4ibcx/vRKNYnEQcxLCFQ0APf/fE+Gy4o6xIfplLjNl2VwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9mmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 08:08:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53e316734so670218885a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 01:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747555700; x=1748160500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmWqtYSiIFN8TosqyDerhHbbO2ZOhkYbAGNp4xpMYiY=;
        b=wCPuJ3RNKzN4UbelqynjH5f0N03Db/osMyfRITdUeavMPA9Zv3Ap/Udr0YQ6SkHwWG
         oY2EzCC/v2qPHZ+jsUdTn00SHWObmWmmJlVQc0pj1LFGDa068MKCox39IFtH9qA3MBY6
         NPJX5u7Yn5WEORX9T22ZulnNvH3XGcRtvkG18p/RsQb/LvxTqj3o08Imv5+xC5BQVUwb
         rwDrh+gTPoNm8bPxeNUIRQ7yZ/oc0xg+Gm0BaBv+Lw+eBUDFlXushywRW+gX8v9AHOBO
         No+dgPBE1ltxdrh4TG/zvEFasGmWF3JnGK7CZ3AWr9giKks9Dr/yCfmL0y9iurbXIFzC
         j96A==
X-Forwarded-Encrypted: i=1; AJvYcCXpzVY4qPqpA0/3E8G6B0ZHISS00fcg4yAu+W7tbz6EkrXdmFstj8dRIyGp+bz2am6tYDswyhUPTsY9BS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbs6O9+K0RlApYOWdsCxNyUZGi618PetY5K4idytSDGh/B/DGH
	na5sD9oPdUncUvUgIXsceUyggOwlIJao/8KlPVvNurk8Mlwut16L1lRwiIJLQ+N6+JujJbKjq4E
	0LWGnidCjqZS4ANdWHfAXPZKFfipbHyExMtZNLm9M6o8U+15MixkeRIOpebNQCIsKviA=
X-Gm-Gg: ASbGncv7qw77/gwF928olFlQRW1zGkDsYTRL5HYKqPJVkn1uOX+x0UFqYo5PRiCzDQ2
	8yVLyWG3FTt0rVQ4DGKcn62swat7aqlWzH8jsLQB2DezOPhjAg9M/hbuhu6RkK22ggUT23+s2Zq
	8hThHow9gUoslD/t++bnv7lUApECz7MM+zq6rhlAKjE1083LX8ThmLx6AtAiZ+eZkqbOBDgn5ha
	ps2+cVWGC5Tt+EqiFKFMcPulH/9KZxZa2K9coOHMKr3gmy61K2Y6PN7W3JY9D0xoYwSHf7ZKVqt
	ryPbUFzbWG3r9qkY70CN515Lo++8eNew49Ovtk53mq5hbEmOFOvo2LPghoaDuoVyZH/v7XZiUbY
	=
X-Received: by 2002:a05:620a:4015:b0:7c7:c772:7442 with SMTP id af79cd13be357-7cd4672dbd2mr1169449985a.20.1747555699846;
        Sun, 18 May 2025 01:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpEy+h/hpndRg9Hlf+YjYTRJuStQXJvvaWu5c4pVbmVGiqNrKl8iWNu/IBEEtYb6kfTo7iZg==
X-Received: by 2002:a05:620a:4015:b0:7c7:c772:7442 with SMTP id af79cd13be357-7cd4672dbd2mr1169448185a.20.1747555699497;
        Sun, 18 May 2025 01:08:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f15fc6sm1334178e87.29.2025.05.18.01.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 01:08:18 -0700 (PDT)
Date: Sun, 18 May 2025 11:08:17 +0300
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
Subject: Re: [PATCH RFT v3 02/14] drm/msm: Offset MDSS HBB value by 13
Message-ID: <5ixkozv3krh7z7ebebunx5afbvuv3qr62p33ycbtt7zsoahshc@6go6plbcwaa4>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-2-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-2-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3NSBTYWx0ZWRfX0BLEN3fWwKq1
 FaLulITBrzB/05Q7N8zKqWEmO0HbhXa2Sx1CnHc6cRvX+myFhq1e/638tFbZA44g35lORngthlH
 phUZ6B59xqj3ZE8aNz6/4TWF8+R+qIgND+1JrjMsRlMG4uCLhvmxcfC4aSwDzX5ygs54KQLIcG9
 cHXGcNSf27p+HVPYeBWoX/PNv4ItG0GO5aXpiksTG/+rCjNGIKPACf4KQCm655XISs0A4t4bIM7
 +/I+6IS1qvJWCiL9eQniI+j1b/8AyDItWy1rlvaae9zuJWjeNPT1kvqoqVSYEUGu9hemsx0H6lV
 V1u1GsTk8vQC+CfMWk6BYn3UZ+ZjuKcuSEhdOHbb6GB2FEVJhx7WjnmPScImGQvD8qAs05Ktx40
 Ldr1s+78DHGecfgalfJGMltJ5mQ9qcT1xseCy4Tl53N80xfxSGO0xODfahpPo8sllqT4Wqj9
X-Proofpoint-ORIG-GUID: fLwlEEOlDHc3C7TTvN5gT6DId2Ms6Wzb
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=68299575 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JTEDtJd_13X3dLxXeFUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: fLwlEEOlDHc3C7TTvN5gT6DId2Ms6Wzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=767 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180075

On Sat, May 17, 2025 at 07:32:36PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Adreno part of the driver exposes this value to userspace, and the
> SMEM data source also presents a x+13 value. Keep things coherent and
> make the value uniform across them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 50 +++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
