Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09CB228CB2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997014; cv=none; b=cRwHOjc/Yl0uYRsZkdReN2nNWhu4nZ1D3xEe86R8ftTeNLxdYOXAcloCcUKXYuhQcXB9IF4fRPTnQOiORG3TEDp6LRyeE7Dm5BHYPw8cOuyl7rIjRk7ipkdyPg+H9xXcnaeWWXxgYCciqOJrVRqbWHUw4Lmrs9CdykHj/pTh2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997014; c=relaxed/simple;
	bh=ZiDp3mO3sMfo9g1+QqK7V6IccxK5oqxhhCjDFpYu+yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joAOaCQARI47gtgs6PwXCzyjxBn+ppXdKU6NPDgIVZtYGf65TX3FB2mbuTB7QPV44Vao2cSzWIdTGTKrrOKiN+KwndhDfZj1jkHYITgU24/xxb+ziBCo1K8KsMOLPhPmRC5q642NoeomKZsPsqeBWLZR/b4qASV28QYQyJlomuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blRBdVfd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blRBdVfd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N4NTGX024764
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iEMzP+5FE+zKvD/hVaBar5L9
	380xOk0G1VKx9PKO9B8=; b=blRBdVfdPhndERA5iEFRLF2aB2HeRYBY1FGHpQfb
	ADrRlAB2Cuh7xp+n1SUczNsMGbLv6t/tw/w0+Tk62cJxKt9ijqbn8mXjuL/tCG3n
	3t384YoMBXTticbN4rB06KsqLmx4DY40AwFocC5PuGpP3EwvMiZV4g0BnLh8OZsq
	ti462CQ04oBvuJoWsgF0qwwaAAJ3rGlQA5WOWB46kEmV88ypZ8tlwtYZip9PukIQ
	rGw6EordPJdHU3y1kwzYoEeLaONJaH5RtEBBwrKOP5LC/p+k37Wdhl3U12J+9aYv
	UncboCN281sd4qH/YhfqlmqpH2RSfOP+XClEkOCDYstEaQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf51msm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:43:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c0a83f9cso121645296d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997011; x=1748601811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEMzP+5FE+zKvD/hVaBar5L9380xOk0G1VKx9PKO9B8=;
        b=ior9XBS8YxQVyyvAXgPuvyp8gmoYSohTZUuubRTdYclijrxeZ5jxW7ryFwNU/MhsuE
         Gd2NEmyquZPeOaq9X2EhtXW6PlKc9zQEW1/Pywl+Dzj5O3cfAWBVW0x0wPWgYOgVFAuP
         SWwYhT8S7dipjT7cw9bO+X5n6KC2Bki1+TUKv0lYZKATe2S0kLkAiW3iGQU3HOd6i73i
         5dgPBTnErML0DnzhpLRmDoOsxbfb9IcZ7R+44p1FdlPgSz4HiCR3xKO/ZVSSXm2fT3H8
         WRUjzDNHFq646XYNTbIZem9emmDm0OD4Nzn3qG12QCUNuuNR+VeCeIwByuJ+5t+A7BSi
         dG3g==
X-Forwarded-Encrypted: i=1; AJvYcCVG+ngyRXKt8SkMvVxNztROUO4IznDSxeun0aF083IXsuIMuhTVBVD/QXTytPsiFZitxvrvrwjZFcALpiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqgGiEvrZMBkf9Jy8nAgQA3F9xKK8crOeySQSvJljMQDbdmfDQ
	04gQrMd6LqyNOHyNMc+kPBg/cGNGlI8jXDZL4M/bl6sdDhh6Kz0DWhUvHbelbLGmi/ETNu+Eb7g
	hC6ZH/VkCRMKeUYP01qvpKxffORIhbH3R4XM1le8cl8IcLCRd2BCjhhJ9P0oiF9qTVTI=
X-Gm-Gg: ASbGncufGZihRUkGN7PvkcNXlA9F9Ty6BPWTmnRX1IctGOMiUXl9PUdXGXG9UkVS2oU
	I6ZXSjx1uxKFkEduqs/w70CqK10Dsn6/2CgUfrWOWDi/Ym5BZaxXau/MFPCBagrIVgDaNNUn07W
	3+SiCZv6HYEoWVa5xDWHoPdoZ3GeTrks0tTKNm5xdqDH53rr+ihnvsIpj9N92gHCzLQRURYMYc/
	Icg44lQ543+Ne2isCorlRmUBetOXUPHOUnCCYbMEtF2PQI5it8grniohZXrJlu+y1ZN62almsAW
	4basnF+baDiKjz5XSTD+prWJ5uoRUE5L6fZh4hXT0sn2XB0yEb00LmLeLBQ1dNPbDOpH2CoBwfA
	=
X-Received: by 2002:a05:6214:ca2:b0:6e8:f464:c9a9 with SMTP id 6a1803df08f44-6f8b2cc7d70mr442359096d6.2.1747997010826;
        Fri, 23 May 2025 03:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwxUzBuSM7MlJkdoDJAusHv/lJtCwWU0NIU+aqlho6PFa3OqprXhTnIwm14NKC4PymbSBonw==
X-Received: by 2002:a05:6214:ca2:b0:6e8:f464:c9a9 with SMTP id 6a1803df08f44-6f8b2cc7d70mr442358656d6.2.1747997010497;
        Fri, 23 May 2025 03:43:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1624esm3802842e87.17.2025.05.23.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:43:29 -0700 (PDT)
Date: Fri, 23 May 2025 13:43:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add missing pins
Message-ID: <et7we4wunzwj2c5zg6mynpgetd5vr57elujsczbsjwkviaqrlo@op7z42vpsaq6>
References: <20250523101437.59092-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523101437.59092-1-wojciech.slenska@gmail.com>
X-Proofpoint-GUID: -5sW_BZ5H1BID_iVKoP5-OveWro5K372
X-Proofpoint-ORIG-GUID: -5sW_BZ5H1BID_iVKoP5-OveWro5K372
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NSBTYWx0ZWRfX//DkyZlmh2Bh
 EMexmdTswniLLyOsl+cfPsnYAFerU/xc/TKKld35A+ZNPcXlTiyaG0K3Ol10QdQ231NotZg+Fcw
 yqVR86d0ph5UCKzRq7uAnkPxxYeqGCxat1Xe8l0Lhd+BlrVj5I9Mjwejap1HKZc1To5BC288ktj
 1UtrYupKleHrdofzrNrZ1Er62x6z5Wt7AmCLqEY0MxHPM8E1oPGWFTbWP/rovRgcczBPuaStUAo
 vPGk1tQUaOMzORjhtfJXxK28OZxCjCfNAwiFF/1+pw06IWGaKj0DkBIIkOi+XFvkM1U78J/zGEM
 kWpyJtiGBkP06zZBMNXHB3F8d9oAbN2wgDyZw/X86RCG5j9KUvH9LRJ7Xg/nFKZylDNSMK3iRyO
 y7J29OkN1MZySHYYJOyJX0HMJaNKciJadb2JYRrQ5RgjapVLXdL8ja9dlmwTfCugcMTA2ZmJ
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=68305153 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3Wf6-wXKAYLzd_tvBgsA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=869 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230095

On Fri, May 23, 2025 at 12:14:37PM +0200, Wojciech Slenska wrote:
> Added the missing pins to the qcm2290_pins table.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-qcm2290.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Fixes: 48e049ef1238 ("pinctrl: qcom: Add QCM2290 pinctrl driver")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
