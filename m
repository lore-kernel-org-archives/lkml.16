Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C32512E8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699518; cv=none; b=P6vaGJZnUe78qfXo3vH5rYOoTGrKNTQKLv4nHNuv2SRu7QY7h6a6byfDN/DPPaOVx+OB/qv9lr9OcTDJLG70GV2kpcdVz1iiatmLsqjFD+o70Udel3cHklz6N+GR3BEedWKi2di586sEw124i+LB6MGmvdHFFaQnLcAVIx1JenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699518; c=relaxed/simple;
	bh=0NqP9DX0HIFTHJ5NTqQ8NX8tz7pAXi+EU0H/s3W11A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPeaM27n+MtwEMHTAF/L7PapbnpBx723vxbOPcq6Isi4eQg6cJa1wvuQNJktpZlJpaJon5UrpwVcuMnSwyg+oJGbzB8BBnBinSWybMdy9biKUa2/r9szmHqHN5/zVr0AGYghHpCHS3BB3SlQ5vI4N3Zm8Xe8NtxCsad2HMz92yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNU+qUAW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNU+qUAW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533FVG3f005671
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 16:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2dgaYl8vSEyVZKfiY5f6DaHX
	ABEmfyq9Tw+8HuhnSmA=; b=WNU+qUAWNmje9omgjXxYfLmJQw/XEVK54lJ5+htd
	TLOmOcIDoOmVxS3SgmBPWSw3mTm8NEerfMeAQtSzfQrnVjX/DNYOcy4JxTrP2x4l
	8EDKsBLLbpWUH1dY/yQr+lC/acpEfWIl8rT52C0cSnMFsb1iWyM8R8viDwwcVs3j
	9g8jDIRNCZ/9ZK1Hemo7Ogr8PQKFrDHinY/ovo8cIxrxu+76goS7IukHc05YZikW
	9M4PeeISRA3FNt68j6rncXGnyz4pmsbnc8w+aycMuX8vjJBjvyhpMC9C0ibHHpeh
	vgNXAyJFinY2jg/lDquunC09vi1zp77HBrBSTObvm1Ed4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxbf59vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 16:58:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f7210995so227288085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699514; x=1744304314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dgaYl8vSEyVZKfiY5f6DaHXABEmfyq9Tw+8HuhnSmA=;
        b=q+boExV3EWmYAsLhe3tGbXPk2S0GF+MJWtTJ5ujL5BrxHpltxsgXPenjcrEhu7Lh7m
         tu20KN6Wy9K5aONCO/oMis0sfTddrVdF2GmFhyk6rt+Gax9FwqxPA7gTSa/9fjevM2SX
         Bbs88GAY5J61hKOz6Y+88rKsB3o5T+6DVSWpI0Xx+AM0eI8fJUe20S9oKPx7CFYVq5Uv
         ZRTNy3Kbk3MN4zZzxP3pnM5E0XSQ3weVDldqtZEqfkNGknwpEID9P9FawKjFpk/bZj/g
         XZTIiYZmr1h/BlpXkXn710IX3z42zcXHsIS+wv6iRWteS5Oyy1GWcHwdU34DEpy47LQS
         0fvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcwphaKBsVcvoSncXx+novrpdTrxh+Pthyhvxnfgp2NVAtlTH62/re+be/ikNlK7gHHmkLNZOzdCFswr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCkym3sy8ut0RE95Lo52yU7lnjfbTKD5YndPQwgZDvW87+/RVJ
	p2aWJ3nll7Dq1QvrJzyve3YQyYDGcoY80F9nNVc1SxnXwXgMrHvU7l8/MLBafK2z4L423uRkvCM
	F8oY13j3UepDj/ouOMHbDX8cDdZUCPBlf1Ho/lbZ35mkfsMayPGWYm8eAoupC1c4=
X-Gm-Gg: ASbGncs+WQL6yMpv0L0FGEOMxEp/TqmB5uKmzGXwWa5zYeg2XXePDmy3Qiea+a2DYIE
	SbtSQn5j8y7cTM6MPWZ2va9F1rgHeP6i0qQVmeIOjjNk7mQLi55r14c4TQkq1QWNWkPcdrRez9G
	M12v58AQMj6TleKOWbykHVbHca3SVX7qbujs8GE1AjILNazJCvEHBDcJ3uCtKE+ZBHuH8lKw0yY
	0MgmYTtN8Z6tcbMQxf2wE2LiysdnDo1dDu7cP1kDl8P/GKbWs4rEjZxWmviobW9Kvb0uN5KHWPB
	DaoFkblr+1T+meoLxiRa9mJ+dKczRzK3jl/Xfl3OmbOD3f7d6Nww7KKTVITho7lyRalBuJ1n0j8
	vk7Q=
X-Received: by 2002:a05:620a:bc9:b0:7c0:a9ee:e6c1 with SMTP id af79cd13be357-7c76c97dd00mr614497585a.7.1743699514698;
        Thu, 03 Apr 2025 09:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0uBZIG3jHzySQ8GZoSAjqLW25E9Q0leBX85z1dcbzKDboOpsSrNL7fP8dDkKIc7LiUKdHBw==
X-Received: by 2002:a05:620a:bc9:b0:7c0:a9ee:e6c1 with SMTP id af79cd13be357-7c76c97dd00mr614494685a.7.1743699514351;
        Thu, 03 Apr 2025 09:58:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c25sm204051e87.115.2025.04.03.09.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:58:32 -0700 (PDT)
Date: Thu, 3 Apr 2025 19:58:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Message-ID: <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
X-Proofpoint-GUID: tGnHDWgeQybn35EnVRq-qYwtmMwJWQuV
X-Proofpoint-ORIG-GUID: tGnHDWgeQybn35EnVRq-qYwtmMwJWQuV
X-Authority-Analysis: v=2.4 cv=F/5XdrhN c=1 sm=1 tr=0 ts=67eebe3b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ICs8RiL17kISZ0AAbrgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_07,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030085

On Wed, Mar 05, 2025 at 08:49:37AM +0530, Vikash Garodia wrote:
> 
> On 3/4/2025 6:37 PM, Bryan O'Donoghue wrote:
> > This series is a re-up of Konrad's original venus series for sc8280xp and
> > sm8350.Why this is enabled on venus driver ? Why not iris driver ? This needs an
> explanation on was this even tried to bring up on iris driver.
> 
> How different is this from sm8250 which is already enabled on iris driver ?

As far as I remember, SM8250 support in Iris did not reach
feature-parity yet. So in my opinion it is fine to add new platforms to
the Venus driver, that will later migrate to the Iris driver.

Otherwise users of SC8280XP either have to use external patchsets (like
this one) or a non-full-featured driver (and still possibly external
patchsets, I didn't check if these two platforms can use
qcom,sm8250-venus as a fallback compat string).

Bryan, Konrad, in my opinion, let's get these patches merged :-)

> 
> > Link: https://lore.kernel.org/all/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/
> > 
> > The main obstacle to merging that series at the time was the longstanding
> > but invalid usage of "video-encoder" and "video-decoder" which is a
> > driver level configuration option not a description of hardware.
> > 
> > Following on from that discussion a backwards compatible means of
> > statically selecting transcoder mode was upstreamed
> > 
> > commit: 687bfbba5a1c ("media: venus: Add support for static video encoder/decoder declarations")
> > 
> > Reworking this series from Konrad to incorporate this simple change
> > 

-- 
With best wishes
Dmitry
