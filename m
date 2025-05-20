Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1DF21129A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774600; cv=none; b=nzTI63kppDvjcKH3E+1RnIvMfLluCcXuYRRktd8NwzhYgHW449sgORE39m6pLBYO1UZ//2JtBg1wGz/rkyYifeh9gRE5SneV6BznvTnI68JMoWabXt0omRHfssQtaT7WyVCDKZqwcWTom67KYa3RJCXBsQMfxsil23Nl3fI02CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774600; c=relaxed/simple;
	bh=aH0IejF+Zz7WEqLCyr8sG/+eKObXIHV+EL0wqjIpHMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRmXjMKcdR8/UtL8U2M4L0QAGdKUydUYfEsrszPI3srJSPkwAGdh7bxuWf/yLDmHED4LgKEKzmx8BYDiRjC7I+UTG/4YfcU0Q/QS5jYIcw1HeXtPXPaJLVn+lZv/3SBNuLgCRoYEnsfrKMeOjy8MjHZJh3GRDSYjjgcGWUMb4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8gLY0Z8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8gLY0Z8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGo1hl006197
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CP4xwurVbbToqKBRo2zAIG/y
	iqGnKWmP98PPEkImYEE=; b=U8gLY0Z8pR5SFnPRgOjKJG6Alyhq4VbwJO95rW7J
	9EZUy95ri/k7bsd9dfcod+7FpQktOdUAklg4vu6RAJzeI1P9KU1OAdags0FkzuLi
	pfPDWzJnIDUX9ke3CzgUii7CsDl9NyzJ/m4P7XF3roPeGYz1pTDYCm3TmjRQqeqf
	wTdR7F5qXyHs9Q30cYICSgRFPjBHM8DDDOP+ZALi9kezflkhdeid5Kp3XjeVIiRT
	kXamh1VaHWpa7KVbuarFOpuPeCKKUiAEGREH9iX28NXNwZ5sEkTfd4L7Zo1dcq1c
	ZH08EhLR1iHY5kMrqQjOr4PeBLBllKR4t7aZ4T6m6hWn8g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf00mm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:56:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e23d6657so32866656d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774596; x=1748379396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP4xwurVbbToqKBRo2zAIG/yiqGnKWmP98PPEkImYEE=;
        b=QbZpmXs1rqVr26E7F4y6+o8PrxuK0XQuOsCcoIkGUlU41D0vWhARLaeTKr4EXX76Vi
         DXHSLdqz/EbDeCZXq1IQLnfYnKjPF7YDvATrmqF7k08U3dvgDQ0o0BO7e7MD2blnEi8A
         ErpzU9b2XZp6jDcUmM+LmfvfFz2S9C9SJ0xBKh4EN8XGdkfbT9Fc1GG4O3djWl0s0rfB
         y7DDag+YT+Iek06oJV793Xzn8V5JUGXA9GEvuFuC2vwCxd/zGpk+bwH+OjB39CUZ7JwW
         pWILxcjI2Fuv/JfjkwvNpXa3ijqSnkfqC7Ecz9S1vfFOFhLbKtwYAR9BAy2LRr8oZEUE
         85KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY+CWhVFMIu6u/5lUNdIq8zVv5Q586GFOZ298NRT52mOSNzz662Oq/kLVtuG9w3gac8ZIoTJL/xen9n0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtUskFkQQmoGge314n/FacWwA9PUm/SiAE539teJvr2u3ysmn
	E/5jz+9aCLvCsywzNNqDCSuFzFrsyalMI/ATnk68r5q+HiUsOR+zQSO1xpWZbocOeb+KW4/ZMsF
	s2XfYS2fYNDeTVDf1CVUtIdiGqt18FutB84ymNip89ABoX0iyxic7bkR1AB/l0OCjMl8JhIw3Eo
	z3ZQ==
X-Gm-Gg: ASbGncuxRt5vVMuNNFkA3iGP0ZALMIE2O4f3yX1kaNBeiAvgzBm9CAol4eHMvmPyy+Y
	88E6v4ff7Iu/HReyJiXr9/pI8m14CDvPtbib6druQ7MMV6HvuxHOSVADy8+qoI4gFYZExCUs/Z3
	g1QwO7bgHhAuTrG36T4YFmW/sbgdq1KsY/E6OWePmzfcMpsxv732i5LkY+IdOGLthaiIv79Amoc
	L8zibKHzMXPG/t6NuAMUWVJxt+Tn6o8J/hThzvDnrRiOlBuZ7v9EWXEpscqNxsHU4hfkDLFJPon
	HsDXKv7X1jC6/TCEJ6dG19ry9CBsGoDbWcasRHCk9AIcGRVb3MrnE5iM6khvT/3DppcmGc26m7Q
	=
X-Received: by 2002:ad4:5f8e:0:b0:6f8:9b75:a62f with SMTP id 6a1803df08f44-6f8b086659cmr266190016d6.24.1747774596239;
        Tue, 20 May 2025 13:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFy83aHJuT/E6OBhfe1n52CIbQyDvRG65Dk2H4hxXroNmeP8X+zaXZZgMd9JBrOkilPmPJ4w==
X-Received: by 2002:ad4:5f8e:0:b0:6f8:9b75:a62f with SMTP id 6a1803df08f44-6f8b086659cmr266189796d6.24.1747774595898;
        Tue, 20 May 2025 13:56:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c0e6sm2479511e87.161.2025.05.20.13.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:56:35 -0700 (PDT)
Date: Tue, 20 May 2025 23:56:33 +0300
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
Subject: Re: [PATCH RFT v4 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <vfl5autirf6a7fg3ck55xh26rx3nbfkl7cq3kthwmffsfhdc5b@r6ibkyn2n6nq>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
 <20250520-topic-ubwc_central-v4-4-2a461d32234a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-topic-ubwc_central-v4-4-2a461d32234a@oss.qualcomm.com>
X-Proofpoint-GUID: 8QB7Zs-dOZkIEYjHkvEBbYE_TAiw4eU3
X-Proofpoint-ORIG-GUID: 8QB7Zs-dOZkIEYjHkvEBbYE_TAiw4eU3
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682cec86 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=93Yf4Y-vqGi4v4eIoEMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MCBTYWx0ZWRfX6Exe1Gpbg9z7
 rHBH05zL6Kn7sWn+BN6wpRtknOnQ/NJbCHB6PeHQ0+UOLfIzYVjDWv+ZuoRlc79tZ43rIUKU1M5
 7ZBE8zYaad2Ix32ed3Z3OGp9nXyUDjKCIVywoeTtZcBS+LzNTP8HuW5Rcwu+5IMGqFiT0sIlkvi
 4g0UyJk8cHGKoftv4rd4akER05PKct2hVQdjvZUMF45yPs+ZKu1CsrC/xS0v7X8HFkuQc9D27Q/
 cFrnfQY0oZUpnCL+LOWz3zTnKaJFiAnYZbNkCrSbuur/Txx8PpygnfFhzhLw7J7LzsJqlg5FphH
 KAl2SrKFJply6VFVDDZi3VI++ZNH1ci47gmlINy9nsVlDsxTf5yxBjk5SUplB1rQVmY+tFWvvPZ
 vVDnloc/YlzK6BOf/YN64yFPvrQu8jwuqatI3NSrTJ6eHhmk0Q+vi8BIgZs7925f1S4eeQcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=788 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200170

On Tue, May 20, 2025 at 01:07:09PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
