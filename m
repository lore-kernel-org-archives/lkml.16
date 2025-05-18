Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574FBA957
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560279; cv=none; b=Lu6fSzcgFRn+JIrqPGq/mbLpg3J5huT8brizPLDzHEIkGk8V5aZFRTiyLUZpjA+MdOD3fwbIBtCF4MvFLb4FZbntwhQTGld5XFtClzmaiKkoEIcalLyBj97hFmIsB3X5/EIYWmqLiX7u+FoDyES2XXmTE/fv6sRjn1Q8shtPkT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560279; c=relaxed/simple;
	bh=PhHK2FXoRq2s0pTtxUn+yOnnS1G9sDM8RBCPRarSPVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx5AsF3UT1Nuq/StKkHikZs2rFVc1P+A+GGrUYSoT+hP73yrJxomwMOK9KVoHBRqcmLeuXR697moiEgRbferGGx4oETOFkDj97iOWSmDbATyn94g6b8vmxXVYSG9NhdRRom9kHPj4Tl9Lbo6srwX+k5s27OMOLwY8amDEo4T00Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adQzHKR2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adQzHKR2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6YKB0022105
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cassb7i5I8/SYZylgZkn2Lai
	Ek52xXRH5Ohypr5QZYk=; b=adQzHKR2kXA8BIRR3Kai8lgmv8my4rTW8F5Lo9Mv
	84JOrGTiZpixym+d5tEvtAyo7J6ykla60xAfumz6ZiZ7+eRiiG6HGx+sgX7IJ9zd
	MObM+pANPBeKL6/tq6uPTi/vHqnY00uCnzekngAgHiTPnfrdbODPI6NgnbJ/wEX0
	WSaQC0/y5+UbQS1wACa7oHoXvdmC00V0/RJYWvbmYrVBXU6EQSP186e8vfCPBRzI
	4aSPvVRG8D3fka2OiH07bZVhM354RlDA8dt7/9sO380ED17t6aDlJWGID79XkJHp
	00BaJPN7fYgUxj1H8g/TELlPuVKYVtzAE9rsO2ig34bdQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhssn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so1086333885a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747560276; x=1748165076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cassb7i5I8/SYZylgZkn2LaiEk52xXRH5Ohypr5QZYk=;
        b=Fk8+xdDkJl91xi+yUTTCHZwJUaneMt2eLwryeq79mTqt/DTek0eQT57tBxQJhGn2ZL
         XmHF06rSHXQ9Nlxz6W6IQrh8CZ2zg9O4Mf1nfepjSSU9eR1abbies5srlatYszubsCmQ
         d5Ff5JR2ptMwQaoKSkfpNoGuY8CG61w12oXqMUalItIQBf1i8G+89foJWbJ3caYHhpKF
         92umt99nmJ+EGtS1gENFYupOtrBMAv7bl7/WQldTfQKsFxQUikLZKaPCqw1F4kiMBOkj
         /WROKGzQNkSTfXy5jKXqh9aBdwxuz57jPIdWcyuOdXhNpZXwJd4hYt1Uxe7s6aB6mbnr
         6EsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq0+1SgnHibLzC/GTquercbCeJJxFTi6NiOuM4SXvml9T++u/YfIJWLxbQRWSx557VEcbVHKEtRt394lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YybLooa+jBUyvkLVAq4/0VknGIBnvTBDa8lyRqEWKRWDlyE2Y+T
	wkSKevku+9HF1XpTeIK8Vy7Dzagge5bzosN8fqa8Z7BBMUMOL1JVH21K5zmKy62RT3e54YMDmRa
	IB46gMm+bdHYlwp55n5eqgtW4ClqhaWovHTGy7XqrMz/8cb+nrV7TwmgEIfmlCsepV8M=
X-Gm-Gg: ASbGnctd3DFqM1VequQnYLDsZX+pJnoGVcFNjl/rh8RXB/Yu+s1W6sAKfuGoo88oYGN
	773rYlWsp1l2DpBeL8dzvP3ZvlZdLVN8iOx60wrM9qspl2RmNRZx5aajjZW0D7aSeODT+r1W3ag
	f8bfdPFjylgdJqljA6/Rt5mZMxsWEBlQ3CUhHhsNt2Qb6p/OX3GIrzGmLm3YY3rLrKLQIgu4TJe
	jTwUC62ZOlcCx6ImAwkKCqoQtrcB2nDHbzeJQ+JYc0/2840tAgpW1wlncz5xs9Xi/0wm1/eflUA
	WN2PCfYEJWS3uGoZHZ48QHXhiKBZfAqJEhFLLW6Ivh1/GqF824TQeGlIPLzRFJy2j+pYxd/1dXI
	=
X-Received: by 2002:a05:620a:258a:b0:7c5:9fd3:a90b with SMTP id af79cd13be357-7cd47fd378cmr1294152985a.47.1747560276185;
        Sun, 18 May 2025 02:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC5ZqsVwWr6A16sgKTeonBBfbSpuGBerXLhUNTVdBGhWSe3zc15GZX5mKJSEeRqdCHfL4ZFQ==
X-Received: by 2002:a05:620a:258a:b0:7c5:9fd3:a90b with SMTP id af79cd13be357-7cd47fd378cmr1294151685a.47.1747560275904;
        Sun, 18 May 2025 02:24:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701b684sm1359006e87.148.2025.05.18.02.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:24:33 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:32 +0300
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
Subject: Re: [PATCH RFT v3 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
Message-ID: <aza7hgcraahr56qhmremmkfqqvpodgohzmn6iogwqx7x424hny@fopwt6tk3uyu>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: UgRdTKoF_S-ivE9QQdWEsFt0vk4RuwIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfX4EF432YTvJ32
 IGKuPsPUeT/0rSEGqWWjqNXkE+IEbn+s0XTCwnMooftAsyETlZYe58+Exs2BYyQ1524h2guLnlz
 G9g/iXK4h0b/o17ZdWecknRFOLWKOKfmI8CFIMfVP2jH1CwQiP7AZN/OTzVhT06NbVtVUiKBGm4
 gpjhKfpWTWa3CTtavMKx47pNS3dngkM71dNqlm43f1MI+p1SfUO1SPc3IZGsOI2sp71hSNn3MLj
 dWikkBqPPsPlO4jLsW+VIQZDUGfAgBD1UX+lFfHNHfZn7qayECIWnmGG0Xyt23WsfeqWz/B7YjK
 9PxXWXzb1RyxgqTfB7e3MvfDUZY0JZGkqIzk+F6lwv9l9Is7A/GyQTUtpYfiKq6gxu4ykZnY4BJ
 mhPNJ0Nd5CmDY3HVQbtq5+/b5HBrhvEowKfAQU4dCug7isDxk+7w0njUaHsacPb+G1DQNZhh
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829a755 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UiqBTq1rjkrdqcEHUKQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UgRdTKoF_S-ivE9QQdWEsFt0vk4RuwIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=781 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180088

On Sat, May 17, 2025 at 07:32:39PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
> as a separate field.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
