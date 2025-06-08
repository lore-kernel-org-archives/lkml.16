Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3061F8744
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749422167; cv=none; b=tWKDrucckQvQblOirSN1pX2gi/crEFgxC+UzPi2rTmW7VwSmh4xvPNUNqpkf0y2B/ykKWV0qvSJWcOB6ioqcVrUZd+PPXRkovEOyUcBpKIiDZGr6zPEBh9eox24kPmqSV2kHOt7ta+XUQ+vc5Qee9smCXoq9OKP+YCvqs3nuCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749422167; c=relaxed/simple;
	bh=cNyWJQnx24t95brsZbr1rwPoDXMMy6ryyshdSi+KTuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjjyLTI2wnULfu+n5RYi5vH4nKcNd+dcoeUVvMfk9AW8WoN+XbOH5+RGwma+fksSPJjA7lDP0iDINJ/FJHRZFtEXjQ5Nw8iaITSHp8f63ScgIelaJFffc2+9fNP5XTUxwL4qVU1yGcpBIZdN5Gx9g2qy6KByApjoShNwdk/ILuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BujmzGng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BujmzGng"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558MVSTE003793
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 22:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5UMciADcDBohw7l3Afqy21k4
	B5zDCEQKS7YSGnXaHgg=; b=BujmzGngVGPBb8uj3Mj5Gt7f1sKcye6En4vb5nnW
	5LTynp70edvk8QYYqK0naItmgF6aDsUQETuMaFYFa6HTLQm/sdCJIzlKs+NPW7IB
	K0UHG5oWKcP7R9RP1CnAh3An7oPjEhMa175nhsu7LHLAbKnPcTM9BPBcZPZhTxSY
	nOUzr+s3+Z7f3KjJDqJV+S+3pmwtowJG7yCIdR+FpvqAqlgFtNdEWwpkHtsy1+rF
	9jH5DB/mCetSuSuZI6PA5otnNaSk+tCmlMYWBkENEmxblRqTyLZ7vmLlrlTlIBS/
	71O+fiYLKqBIDxoKq9PWu5IlJ+PrlIAwBTC+17hUinOUcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j42jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 22:36:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so608431685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 15:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749422162; x=1750026962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UMciADcDBohw7l3Afqy21k4B5zDCEQKS7YSGnXaHgg=;
        b=M3faiv7M8opTJete4RYJdhqrMFqa5OTv1w8aqUZTCnpwojI47ZJrpsLV1SUGxQFVSz
         jnn8x+r+ZwtUH8tVVo1r0MeUHj/DehtAyudMqbBLkiWPC7zHu2YBoddRoYKgKjseL4OW
         qOnfECmnnE6vMpWkptraxoh4NgNYeQclztSZ5cwvjAS0xpf+Vrvs+AoHa1/+ATVCZJxh
         f5jgJTtf/kcOAoeJS0wVeU2oGOlPWOPPs+H9R5QvvQ3w2LHuGd9C+MLAxZJc2mUGdCSa
         TCNVTBOckN38rkma9Ckj3Zxklj8y2N4caH52LVvt/AAMxJdMUhT/v7De2P6qgx6IYhzR
         XU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwZbfudO0VdS8jHNo4t8Wu8HD4pXW4/m4IbOHT28FiHt752Vh396M/JxyRDXgxuCnBXu1+IVV48hC8yYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/mOJ/AlMVJshwKlsxpaUQTdQg3KtyoItZ9s4Hy52Ua7pVFw1
	E05ycSEKUCRwGSC+qNMxCYP/cCkWIEaTl0r8Qya3jovgznGxomCtQs4S4UNXP3QSQpfy0oUMVv/
	iCm9TUCqVDTb8DFWAz+M0ZYUshzdXb7uiORtC9QWNlQYgIZcaEOLgFte1fBe95s/f4nQ=
X-Gm-Gg: ASbGnct95scFQPAAKG/6BUSuJGmI0etBAPOad7HbhQeeeH//K404rjXu9ekCui8wS4F
	5oc75b4MZmv1+U4szH8qd06BLIm2UulNWfndrG+PjkIWPeZjy/4ywPO4nzd8b4puEeAl+LZeDRW
	uENYb3i6rS1pWdLtDZBiEpXQ55ZnskgmbkCtRNX/EuNzKK8el3W9O08dtEA0daRagA8cGRAqSGx
	+rEnzhX6Bybzv6hQpPSQkBMIoyRwiE0obKL/aYPjbYKcamecetr1hjzbKqdXqou/nBofk0yxDwU
	Ns4yRom7Nr6IbdKfT8DYI/n/FInlPbdZPDb783ARtx1s64fqcYtXXnkzW31G32JX+fcoHYPOiA8
	=
X-Received: by 2002:a05:620a:3912:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d38726d9f7mr1026518485a.25.1749422162519;
        Sun, 08 Jun 2025 15:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXlQeV3tbfCn8ZNJPWj35kb5AP7pQ1oBAPDaVCFROWwmvnWZ9k6Uz3+DKk6ZgzIutglpKe9w==
X-Received: by 2002:a05:620a:3912:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d38726d9f7mr1026516185a.25.1749422162205;
        Sun, 08 Jun 2025 15:36:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d0183sm899166e87.49.2025.06.08.15.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 15:36:00 -0700 (PDT)
Date: Mon, 9 Jun 2025 01:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <3tmpywm2ipqbdhbu6qga7eb64jk6lcqpqvatmkgwwd36qcqkip@7yazfvwlvwit>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4NCBTYWx0ZWRfX7k+fwXnV4nme
 gOmdH8CJYocQwmLccFQpETamWgyvNR1B4b/S9RhIP32OZRj4uJXa5dT9RfbRIARUJdijHpKpymL
 z2fQP3t1Jm3kx0iD0UCGnubxUIXc3cbQzUN7/AQSYJBb6L9T6tt2IX5VejiW6djpZrBBgJlwo9D
 bTbmKUToi7AoWiNDNMriLEcRdNby0bsTpotNyk6iZHuI/rJ3ym5X+ah8H75RpoxPUqLi9v66HU7
 J+//patfll/lPfy04bkwE8IzRsG9AwKonMNStoGi1hKHjKj7mLk+Ooh+0uG+MYVCl6CNmnBiMd+
 anGPKpCi718ji05iQu4P1QEB3Z3fOAAhUmL4v9JbTHCSUpqTS0ciPiJk3EayW1Oi3DnFv4+JVgP
 YzoF0JKxrAgScQTgIIx9xOjiFM73rf57tecrXYfTBGMxUrgwXefUlcT/GGxtpaAM3qi3nxNp
X-Proofpoint-GUID: p96t73CfXYLPvzKzueqYEkKncahsoV5D
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=68461053 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OnwjkJn3o8bp6UkAWykA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: p96t73CfXYLPvzKzueqYEkKncahsoV5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=995 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080184

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
