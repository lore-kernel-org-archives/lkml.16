Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6FA13213E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531337; cv=none; b=EoMUZSDXN/ynqlQ6GBq1+t77vyKy9kgLmO2tOmzOmpVgqcqlGX6jBAT3labENLOjc60SpBb7yP+8aEBSz3gf5GVjs5FfulJdExQjMmrnxehAOqq47YISy/EFYgkoR7hjBNuvo2zkXZVT9wo8LtOOuGAp7tX/zGYcbAKIeFXKYsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531337; c=relaxed/simple;
	bh=ZNdVzpY/LUd9+IKYyg6TyrkzQBNOVPjKGBQAoCxGRAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTf1ZVJXPq9ixsn+7yULccqgG13yLqdU9/HbKqIp59snlnmVZw5plgI6suAEMvuBJZXcwNII67T1Fm6cfjevEHOSqLLTR94cSG/6hacu3XE5sTJjLswbTnYtT9q2IvYNJ40/fDQgPb+jh2IMiM5e8kehXhAUADbUgP3DnIUxjeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5cOLPW8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5cOLPW8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJnAKG026461
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vJjKyI0rQI/9msOKqrosK9Bq
	uNXjcnMHw9Fb+7VsjdE=; b=P5cOLPW8tJRX6P/90ulOi4MeADMGmK9LLjAGy7y7
	0oI+UnDh0e4YfWrxqdBohtrb1TDHB3Kf7H9wFjHG/keMJFsWqfoji1fYIMikm4SW
	XZIbBw2qmwVHrVEcQfah8A5qEelf4WPPY4nSB5MygvuPs21BV+zU1JgR/TcXsJ8p
	Pxc1f1gNOXV2HBUxDOlEePVL27A9uo7kWMsRegqPEQ5EEy4i3bOVPkDwoqE4JREg
	zIwLyeLbBnXkmfH550nYhtvfrszE1pVGbjxNLvAHZkix6ZzUBJlQs6cQC5iVgZAn
	5kvTW6mQTaQ4T8Unwd+A5UgiKTfF0y42gh097fPsfl58XA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh16w9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:48:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53e316734so257970885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745531334; x=1746136134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJjKyI0rQI/9msOKqrosK9BquNXjcnMHw9Fb+7VsjdE=;
        b=WtVKIcNw80d/dU2gCHNSTl5p/tnI7BUq4j+Gz/FmNYOY887x1M7Gp4IJrlpBK31oWf
         REYhcI7IYbcIcswDEVy1cJJ3ZQSy+nr6h6ei+NVlKc3AZ5UsSfBasvXqd9Z4ctlgCp/l
         e7CVxUvlrWVIcmTd89XG++QSrUJ0l5CUf55zO85JK3Hn1w7rKNBxGEWOmJyp4kiw9vJw
         Mym/OmafSYWse1sL5r1mGaUdGODobduHH/LqSDWO8t1nHiNzYzd1sChMBepNAqevkxdZ
         Ww8ifOhrWl00daraEUAPefqzQADU9+pM5yY16ywGFZdFERmx2Oqv5znrucAO3wnH64x7
         fmuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmOvBi6gfvJxO2MRh5StGj/hg1mm7W36oatHzI/mFNg4wvGowgDoUoV/c/x98at4uhl3fgipIiV7QnTqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNsu7KWMc2l7sp7xK/+KKwkA42auadESzRlVYdIg02G6SvIcp
	4k+ylJhzw/ilzgyH2ReSiL2bIPHFujOVN+6HW6+0h+EV+Pc9huDfOdYR07grmUJiDZqQH78tQjI
	sQjoxezL+H/ZWgXNL8BaDgHmU2Y3Af+pdFFxH6OoPHB3j6CwOC2ivvdw+dyqmuLY=
X-Gm-Gg: ASbGncsQw8prTaOrxXnTrh//0Zu8DxXlGa+2PtvMUvBfSwXUxHap6Xs5Ort8JeJP2wN
	tpDlx7bW2+HIgXJuo3zRpSpapyKP5VyMmTK5OxT4YCGsC0opyh1QO3cca82dnAVwSRQwhN31I6W
	EoCPURLsZbLCg2J+DfIt5JxmaFk4YKYP3TAHuKSXhjx+/1uMazF3kqlanEixFoJgPDBRzDIBMqz
	jC4lqUxzVr2G9ad5p0InV0QhozBAzqRayzR8wCDrLiuXkxm3EsvfM2Hpt+h1pu20c+6UzU1oXYC
	B3LYjdt38kx14qEHjVrul/d+XbDau3WTAztQXSHRjPRCGX0nIgMVDft4krj1xDa2Hf2AQ1E3Brk
	=
X-Received: by 2002:a05:620a:2a11:b0:7c7:aed7:907b with SMTP id af79cd13be357-7c9607d2caamr24642785a.54.1745531333790;
        Thu, 24 Apr 2025 14:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0qarO4qVaIHzjVmmbkwRDLZaton6bL+gzlVk0PfxAhAHsQF6WlByLxtZIfk0z6pubJzUsMQ==
X-Received: by 2002:a05:620a:2a11:b0:7c7:aed7:907b with SMTP id af79cd13be357-7c9607d2caamr24639485a.54.1745531333520;
        Thu, 24 Apr 2025 14:48:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca7fbbsm364985e87.159.2025.04.24.14.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 14:48:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 00:48:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <num3gu5gfpnu3hw7ofk5ado2hnmftgqw3jfzlp4pi4yganugvu@ntsyr6lwry7v>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-2-alex.vinarskis@gmail.com>
X-Proofpoint-GUID: ET338dipizIsqFMbfjzOsF6-ITqzJksW
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680ab1c6 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7ctMvB4_1dO5SEtod34A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ET338dipizIsqFMbfjzOsF6-ITqzJksW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE1MyBTYWx0ZWRfX048PKL8ixliZ hRKwcKr4TJSP2EahX+mK+DgFLR5cUnjJi0gbc1HB5FoLjffYHEfKIPvCH0vr3cSUO9XkSlXjYeC 563UnMjyEuw/rrZGRlRi9FqzJ8zjT4NNzedMKP2cnmrzSGJpBCv5wznM5JigzgVMv+rUl6UO/hk
 a+VJ1+3Uh/g6XzIk+C0kEEW3hq8GqSnaoEYuLTLX8D2qmm71a++p7ee5bZhzRZG4dkRtQ5CGEu9 Hswu+3dAHY4UH12+ZYaiPCDIg9UmK8ZEB3SSKclPwRQ4TP3hCWrQEvm9W9YiLyzZdzn/Ix8wI2B 3LN7Nu3PKZs3Rj4ONzuLwIgl5nI+CsT302eTE+Py5enKs+fAhj9tiFfbdbAmVphCTAYk2g+jrsJ
 pvN3KZN7Ih/APbPqUHuvofTDVcZHqpPabmGw7JQlavrd9l4hVwSD4tfpQUUW+LJLddfJkTnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=970 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240153

On Thu, Apr 17, 2025 at 04:10:32AM +0200, Aleksandrs Vinarskis wrote:
> Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> Section 3.6.7.6.1.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
