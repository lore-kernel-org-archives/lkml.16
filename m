Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75393FC7
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747561666; cv=none; b=BYCVeSGyrIhx7hEb17Up5YRwss8/oCBRiGk9SCWJ1oe8JVs1o0iih9sFQ++QfhzTs/8ICJpH30Bva6PPhpBmjT2J081QRz582g4Y3HgLUHVroTSyLhHkjM1CioLN3TB0sHyuvpPBbbyA2YImyjDVgPc+xcUmyQxoGhuoCvfQkrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747561666; c=relaxed/simple;
	bh=rAWk0ObpbdF7fJAs5+S9l8yft96BfgYKO2qkzrWVQBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjJ87L6dZFXAmziLoDkz6gkwMlk2y1gGgd0nm8GR2N4KamQ2iLkukealBsBE9Xe7cMPs86Xjztmg9Gu/WohFy3lUYpp6RUX43JYqcAiTnwOKjTiSSj7yqjakLfgnvAKbJsrU2qb0vyeTmWAgqetwlmihjhoaXuVBNFwWNYTj2s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1ob2VaQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1ob2VaQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6YKBY022105
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TFlU0fSZgntNkoaZyg/NsxA2
	mHRMkBsFVOawTRTvNFA=; b=H1ob2VaQRI9r5AAOWB2Ea5Frzx+JtL8rCY9MiJmK
	nQ0DRiOiiaLUuxUNM9rgl/LO0rFBhhC5oXquNkKd+hKJISw5oqYNKs1pC+TvzlQA
	LKzbgv6Z00HM1O4coXxfnicNAyE6/EQbjAqaeEnXEf3kG7PJbmpvq1zquYI9Qjhd
	8PUHmbJG11lurGuVbXOEDn3WfOYv6EMhZJHRVYfi/ZmdaH1xTdKv9gD6+6URK3Zw
	pP1U10hBwQ3jxNNPkjCozKQOw/SoTlxx/x3bhUJSy2hscWy4bs7P5ktCdu/kxL0/
	RKBrF7AP0YeS2LMJPp6HcZNNe6DVLEFhJ7G27RrovTwAKA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhtfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:47:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f6eee4d7f8so90794756d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747561662; x=1748166462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFlU0fSZgntNkoaZyg/NsxA2mHRMkBsFVOawTRTvNFA=;
        b=lWS1LU9GQGzYntvP404qmqSqQ/CvpEBt9BLMay3BxX896Xp2eqlLRgwMPjn0AnLaIw
         QVD2WcvrNYBM8ft+k6V7n16I9SguNypzPLrTTJk6ZgtNkMLNc33BAW219OnAY7lM+s9p
         S7OPql0eE8M8B9gfwpTwXEgr2bbUo8ml28MjmnThw9vxYpUFJVdIjg5NFyjWy+sUOHcH
         nsmu0GQWrXu7UhrD5VqWTQOoGQO96h0M4wzVBGtNgjo3n8QU7gkNssrGLkoY9mj2JDX5
         Qjx8WxSWLd0dOo3OJ/pnDOEgwVFUkSWZtOunCl9yUAM0DSGSOcOe7070W1X1lTOsa4w+
         479w==
X-Forwarded-Encrypted: i=1; AJvYcCWNc1Q3ELv5ZsgSwq6Z0yN9gKhYHykU0flTpinyhPzrqfuo1POS5ReX+9/Mm73sC+HQf833+1MdOGWOsA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNulgLbnC8lk84tQvwSO7LHt3tc0WL90fnwoEHGPn1HebrtMdT
	IVEJYZCMmMQFFOqEDbRezhPSwQQSBFJ6wlcoVSTixD77XD2kskEgGFXBoNn92bBfFABbMPfZLhk
	vK6XUvp0peyFVlquRK8MPQhwoI9j4X6bVTMUgOblH6KWGXski2lrw6DK5phxys4liKIQ=
X-Gm-Gg: ASbGncvT1GNdooSK6uV5/CqR+MbTpLN3Jj+m/1SwZ3ZQwNNCovepeWxMQ0V5WdvMoRC
	n36I5uKYr+2njNaCX56TwxyoG9zm/CmWp4MyBhIPjxrJJrgPw0HmxgzVE4r/NZ31zHBChi+ZnWk
	SGHIeyK8RPNHAnuDiWDL380LmyG8G+v1PJRYcLiFS2lpINRobLTj14sBKZMBlSpsSPCk0eny3dY
	AQxi24wL6Zr5+XhzlNF+4CujHG1qHIjM+BjROiFeogfQY8pVfgV/bP3B/t60FYRgwuKFFuy7d/m
	YRHlk0JLL7qKrWxjCYlxhGq6f/eJVXeI/pPC7FKNpTHEY0i7PFD+tw3xJKjmMpU4h2N+cGTPd6k
	=
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f8b2c845aemr142878676d6.22.1747561662433;
        Sun, 18 May 2025 02:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETeYU1lKZj8FbSxpmtHQ7ao1CaOfNBSNhCCtY6clLi/oJVGUTSIlf3QIwNUZfc/juiBKD4BQ==
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f8b2c845aemr142878466d6.22.1747561662111;
        Sun, 18 May 2025 02:47:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fceasm1374479e87.60.2025.05.18.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:47:41 -0700 (PDT)
Date: Sun, 18 May 2025 12:47:39 +0300
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
Subject: Re: [PATCH RFT v3 07/14] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Message-ID: <wwty3mev3cihpyo7utwoe4aspeqf6hzuo45p4xbr6wali7axjc@uqwhsgqcllzh>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: Si8rpSSIau4DzMkwoyjY3uX7D56JNGbw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfXyzUpUfnqkWxX
 1qEWr77bJlZn8DMXpYaJ2HFgiK1zh7y32S7l0rDzj/zy7YMxb2VxMVxkmWNFbFE1shAA5MbEOSg
 3jO2VorFGBLcxV3PoL6c2YFwL9ZpT3iyKc8LwVMHYgRXuCKGal6NZYmwj4D0P/52ESMnrCQq0aM
 QS+C5isk3M8NJAraG5uToLdbdtLc0wv0kOsw8HUXQki9yb7z95ujoMXXUo71waXcRGCb3kC/glE
 xdBsu/58mV6wprIQi1Pet1+Avm2KDxb64D3ibwizI5v2sRlm7VYHoYfAjd6pqPk8vmv8+qecCWz
 qja725jV8xkYJBwHe1xjEwJWP6GFipCk0zPhXGhtG4sBUnDIJLIzXH51vPq0b54IgyOFoG2nVVt
 /Oqia3zA7IhLLK6avNQtWrsnV7JjU/P3+6FAwkvVi6zy8PgkxZoRJBfc+VW0l5k3xGIS9JMR
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829acbf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Abfa49PQOijBjWCf-xgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Si8rpSSIau4DzMkwoyjY3uX7D56JNGbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=964 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091

On Sat, May 17, 2025 at 07:32:41PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".
> 
> This commit is intentionally cross-subsystem to ease review, as the
> patchset is intended to be merged together, with a maintainer
> consensus.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
>  include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
