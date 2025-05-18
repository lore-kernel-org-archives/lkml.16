Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B1610B
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747562250; cv=none; b=UFb+7yLbO/9Fg8TUA6inyb7ySdUjoiUG9snscOXxafFTOA2FFmOlnafZReYoWB1DZfQHSIIFTURWv6LY5m3om/IPeE0DiMvsVSwVviCZ1kSszBW+cth0mjYUCKSn2oHGHWir5qGqOAuSbLvneEby1i1MKJC2LYrViq25TafiLmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747562250; c=relaxed/simple;
	bh=g0Q07u/rXiKtu5NIG4+5VhsYIiUztvKDg/4XRdi7uhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4QWcX1UAnsxAW4ze9FcHX5lHmIqIHnz9o91/r8RUL2+vR+I2ssKejFTMeYmerUgDmhLgB3hC5iScPwzGFcXJ5YDMsWlKmNRC14rcufVWrV5EPKkeK12S6HeH3655+Fk6K1W2FhtWnadEm9qNjphWg+RCRAFh9aiyJ8AdjOeuy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7Nev6nw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7Nev6nw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9ZnYG002789
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xtlsK26IRXZ/58NCN1CWrrVG
	lERGjp9AXyiJ/lMq4CI=; b=n7Nev6nwXxcRCXVjKKHTZtKH9pIzHQP5lZTR/d8+
	xt88ESg/dqQq14Sx0fgGt1fjz3nZUbII1KYtAsG9NIjPXK8xZDnfB1YQndTsf+rG
	OV3kJHVtMBhQnNs5363lk3F89YkbndWyfgWb8ummFF7L/FrR3O1vKrXuOD8NZyFD
	5mZuLi4cZe1Kei17TlD0JDSR2w0nfqUx83FC1RQLHc/l8+xYat6Drw/1o+Is1Y6Q
	6Fm4o8uzuiR8TVpi9Hj28HHuvDk6aQQGduyKqB2uiig0X+/s11P9zL6raZUdj4PX
	dm4c+rxmxKlvs8JMww3lhO6Wq4q5iS4iAsbYudh1Carq/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmest3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:57:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so660750685a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747562247; x=1748167047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtlsK26IRXZ/58NCN1CWrrVGlERGjp9AXyiJ/lMq4CI=;
        b=UE8l56MLHus67QB+0Pq9vdEEyHTnPSXablShXc2jHsJvthdrY80NYfq26oaI/xD+hV
         gsh2gDVEv6Ec3arnKmaXqu/XwlWOB7+ewAYmZCj7EJdJuHwc+cWzrYxAbpGNgOdPkIFn
         JPAzCJUeDYpE12AlDmT/2HkKTEBiJOVXM0JUAAzxeuTPTw/hRq0qprsAYztuJlqNK+xA
         +2lEGsIuxe8KN+I50gIKZJqwXekupdD1X4GD0K/e5Twda7U3VNzcRQ8mLLpZs97EnTis
         nyYV9rdnHCLkBBNNQPmAhzyF8/pjFkFJLV9ng99gfs0CJ6kDV6WMMC7SDLkO995Shh6Y
         Ddlw==
X-Forwarded-Encrypted: i=1; AJvYcCUWU/7LVzoCLqK+SMbfStcm5TaCGSMe2uAgGqY1nOwjJOWBxJvx+AJ2fQuGirMxo0ZvYAiJjUC6Ae8gEmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJ7+2v/lfllEqnex9+FfIwkpQUIoOOLAhUpEcX+0VzY27G1Ud
	mDJdLBVPU5RsGaj6quTpGEy1KboUwbuiHzJ6+f78K7GxCvTp5y0shvUg/tc87n+QPoLdg95m0Nx
	mclvx7KjtAhB/vwKpRgU4VzJ8m6Z+yFjGXYP/9zoZa7jmvtbTFiOt9YiCSAuUQZZ1NkQ=
X-Gm-Gg: ASbGncsysO7GgnOHDUWWjRGeMO175/fgJpXBylRjA8oM02HpW4XGBVt+pmb2kyCce6L
	PxRvKBd6wxVxHmuX/k+CTew6wYOPs1M5mwvamjFEd22Kmgs6jO/RsgLIkVotW5ZXNDCzwXx8zDU
	7zExxC6JImzNk/Lia9LfK+VuG6wQZ0NxfrqvEPF7PsKEeYU3vg22dKV8gYZPk7t8ty51igzT4RF
	kgsBblyCIFlW1T8pRksmjP9MQ3NZowgxKR0LA9bIWqbqC/TaXQ31I0Y0DXQD36A7Usx5aDBpfrh
	hlGaFALP/dAajbSbjGI5WcWh6iqxoKn1FV3cdxdugky4KKpQ0WJ4dMfxLkMuGt2iD1f9lSJ3rzE
	=
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7cd46779caamr1359733485a.43.1747562247332;
        Sun, 18 May 2025 02:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ5pBjRydjX6p8CyddzYdMdBy0D9FOBBlqON0ng7sKi7sHV/ur38csJo7tBnlIEVgInmOAjg==
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7cd46779caamr1359732185a.43.1747562247003;
        Sun, 18 May 2025 02:57:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e9cb4d69sm1260695e87.21.2025.05.18.02.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:57:26 -0700 (PDT)
Date: Sun, 18 May 2025 12:57:23 +0300
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
Subject: Re: [PATCH RFT v3 10/14] drm/msm/a6xx: Simplify min_acc_len
 calculation
Message-ID: <cet4mrockbsa2lwrjmpvqfffhlk4r4xzbfoiffuohz37oaklsj@6spwjrcyxf7r>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829af08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrN7u6T5calBdp3Od3AA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OiTp74Mkjp8w2eri3iC7ZXjzidGTx-U4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MyBTYWx0ZWRfX2WnyY52/zSFg
 XJdkHlgeyqBLXyDXBbuDFmMx7bHKLirUNivNZzzxk+PXOwIJHU5+kmXkFVcbXWqkIHPjBJ/rxML
 Ln7hMrgIJEekwtku43+x1lupnF+obCXA2LNC4GUkz8MpkKE3JS0Uca46TCKbP9n/j86CFaT67BF
 h8Mu+kXuGphyBv5sGpYPCenqSvmO8Mqvbr/mXPszgX3eiCbk6kGR1pWTfncR3+WaDo6EkOK5O5l
 NHaMXB459RsvnW3+YB2PGgv1G2+798/9Kg6nXjKWmK6berBnGRVkZuxN5R+8pI3BvMQ01iGYJFK
 aFHJTbFbD7T+sJ1ZIoZPqQjJtYyv9wGPXHyvcur2lQWxySlh7dkUmVYUe68++2UN9E5//ZQOyQj
 kH6QMDnCJ4Kk8plcf/J4SMzub5jiKtPw6FOclJ1z36CVHqtYTIr1HCH87W6vwGebYegA8vE9
X-Proofpoint-GUID: OiTp74Mkjp8w2eri3iC7ZXjzidGTx-U4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=923
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180093

On Sat, May 17, 2025 at 07:32:44PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's only necessary for some lower end parts.
> Also rename it to min_acc_len_64b to denote that if set, the minimum
> access length is 64 bits, 32b otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

MDSS sets it only for a610 as there seems to be no UBWC support on the
display side of QCM2290.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
