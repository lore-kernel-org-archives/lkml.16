Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7D72343AF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572822; cv=none; b=SAcALqY+d6me1XjH6uWOWVXLWNLl6qJruRfWd+/Ktin48RD67iSUBAIbiuyUZj8YrgLvdebn6B3gCKPrW9n7ltCDLJVEZ4XfZD1ZOIdfE1jd3eFEgeIw9kPYdKXFhKHMc6vFBLBoa3hzm8zpN9OhQh1J20vIxueWpqvMy9PRUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572822; c=relaxed/simple;
	bh=GlTrV0NWZcEDUHLVWg40j5KzByNVEFc76P93JZiWIzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIlpPgn6wJbYmCnBXyXLAHwWd1cW4mL64c9M4YcRcpEpQfS01/TEBJdoWnj/DQR0kVPsWelHw7a6TA6ljepw11HVWrd3+0B7+YoZmQtC7bpvgOUjjAeKWZ229lnpj7zPoQ2Qo7trDTD2hPM+vFdtp3dWAqs2f6yVu2rn3elcqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aF6ClIpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aF6ClIpQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TBDJ007414
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rMDIsHdsOYkyViUAsU0t/ePU
	SWOO0YxJOUX3cKyNhU4=; b=aF6ClIpQAYUrCzDnHYfaXzQmwyNulXHEBtEuHA7R
	oLdXml4MEUGZlFN1bhGbAzin8xp9PNjxOPvY8fm55P73h6zozQXKjFnu4d1bWK87
	p78nCwPMoecpSxRcDOvQ3qhzklOP6kTXISooEg9LjB3ABMJPHIAOiS7FOdKWqB4h
	4/wbqslrMQzCgnNDdUOgHQvIwZJBbPdBM4nBFkfSFILproO7iO6dVzLE230AKuqv
	NrmDDfIYzWprXypPDQwo/rVqsxldkAUsGMnoJWX5mx5m2qu2kY8nGW3PER0ss5d3
	Wo53ym5H/ep/vbCkOevCqO8F/JK+l+J4GZcF/4S1QK7WTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0rc1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:20:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c572339444so328761485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572819; x=1746177619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMDIsHdsOYkyViUAsU0t/ePUSWOO0YxJOUX3cKyNhU4=;
        b=KV/JkJRyCiUggtqTqhwT7dVhB9R9GZCfRa7YY+z+dqV7u7QRq6J3cJryB1GhzZSr+W
         iz7dzW8FL994dY41Wbt/RNmDw+ufgyDAGhRbYDfOproku9khLuOx/+FjjwHVO5KIrIoM
         xhSDokRBjabPJQbHYI6T4aTcfgz0OVUv4XLHUhulI5FqX9+3zNhOwY4pnqlZGf7aW5Ka
         zyjZyYKxPwdSDZbsjiD+58haEql0Px7KnSP/gLKVSOn5a+ozNUVmgfFt4H/UiSOXgtbI
         mT4mH1eueZhOAvL2QT/YoobMPlxCqo8wrHOtzfpnLNWUydnBCnLmLr4xpwGrR9J/erXf
         96lw==
X-Forwarded-Encrypted: i=1; AJvYcCW6nimiJ7GGWvErmWLovd8tvk7E7tu1KZgJ6JqrFatWSgAaGR0mj+da5mwvRWc/iIFWhtAykcUXErV/wso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCmrnAtNsskgoA3CvvZtwG6jJwOiodrpCemCgvRSGSSGPzV92h
	X77VvcadZ9lIIaIA/OHzcBc6biUBGHQ4ZPEYaEFZmZVFgjLXus4Xht90PHyIc/sIPD+ShnSGN7z
	P9W8Bcd7FiZn6fecicihI9r5LIJv0Fz2AHkHkobHv18GmczTqH0hsSR9lOE+T+70=
X-Gm-Gg: ASbGncv2lLHkVcWLsaK/jtTtnjsgZhX3x7lPXl5CI9NJmAi+fyO0dwkGuppDwZM0ZkI
	4c3Rh3kIHFj5J55E08xOVhIjrDEErYpqVtRDgU3TUl09aMUhQONyGcb8QDXqZBOFflPt9HirKYx
	gsIRGG5RR43ALc+Mfr+0aj3iJgWvaJyX5EuRJM/CAwJRq+9b28MuQ9hiLNrkTCPsu40hhM8KAxS
	99WJyBNBmN/bS6B+jQyYXNiDGe9wWE35UzVsVLVn01Olt74j7VjpXgpvzToCkpo4M3zu4EJRn2R
	S66zqkS0SHighaY8GEcKeT7CsoeSxBpHYjEE03/LRBtTePSYbWlAsceePZbqxq+LgdvgyJkvXnY
	=
X-Received: by 2002:a05:620a:2801:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c9607aa0d9mr312340485a.54.1745572818820;
        Fri, 25 Apr 2025 02:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfBCKqtUoVTfxHiMTz/laWIXb+vyHohQFKZ/KaREmisUEpTMfrdz3hYOCR3l6/Jaa+ylyp/A==
X-Received: by 2002:a05:620a:2801:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c9607aa0d9mr312336985a.54.1745572818522;
        Fri, 25 Apr 2025 02:20:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d45sm6445631fa.94.2025.04.25.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:20:17 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Message-ID: <jdeuodvsnlezbnxoucihd75rwlrigskvessdt3n3ufuppw7qov@ujjgimndcdkp>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-3-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-3-alex.vinarskis@gmail.com>
X-Proofpoint-ORIG-GUID: PAVbgR7i0EyGz7qB9MKPVR82WaJvgv64
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680b53d3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QaToclHOt1NPS2V0eqsA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PAVbgR7i0EyGz7qB9MKPVR82WaJvgv64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfX5Oy1Of6dZRO4 44hF9z+8wjbpZ+gAn8563qYkNjGCetCBl3B1rQ6GBoBhAEt0+YaXG2tu6oACAswvE/VVCCAv82Q opMsXTiOC55LyYSjcrSRFM+V+EkgsKrkYApdTY+XHR7xy1zjWFg9LjmOnrLG9VE+EvdaiURIPH4
 lMF+NE6Hkt/PzuO05Vz9QAYUyukko1BV7XGV1TayxT7iiMRsyWkH9NHZMaWCrhPFZh0jbrdQrl5 YpaBrvT3LmrTC1xkPrnYnWs43bmunfXvj3SOvdGyUZIbp2ryhWEzi3XpK8kLZ01aiugfwnXKt9z yoObRYGzPpPe/JlnIppBsULGw6V7aUJfUVj52carodKdSv+WTLt1h/7M42B2FyI7Dq6C3Sf5xq4
 xECPNkFyLhWEq1D2Rbb9xz/t5x4SpnQVhYIqY9OLqKFbwyGcjxXQjFBc1TLv9a5pV8dMGI64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=771 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066

On Thu, Apr 17, 2025 at 04:10:33AM +0200, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  5 ++---
>  drivers/gpu/drm/msm/dp/dp_link.h    |  3 +++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++++-
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
