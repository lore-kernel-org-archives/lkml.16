Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A079C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747268488; cv=none; b=sRAsDCYtLIwCMrnP1VAlchOZtFvpoTA8RWMrrnT+l3y+VzZNTwlSVgeVrRU2lh5kmx2JVoyI5ctTSjI+gsyQw7wBfwFAQ3EOtrWFGWRJRjjCanbhuJpN0BKG1tXgiz/7C0xe5vRf2323tsU1pcKaw5SuJ6o2fwQjsS0P8ipsZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747268488; c=relaxed/simple;
	bh=MHGclyAX35xo0Oi1MTvmAyO8ClYxGP9jyCf99e7/ITw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZueB8bIEyhzd3K3wzgy0xG00Err2ML5ExoVeAoqraIbpKr/0Efi3B0M2DruwM/n58fomM6jfOpUY08LIUXVggH1VIxly35Qs6w9Yrotnw4ZFeaCV7A1oH6O1ywlny93WvhzB7fY5082imc4dUGl5L25/xwEtkY4vEa6xv5F2A6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLulVig3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLulVig3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EK2mGe002581
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u3T4zfjmzH1nVAi6lbmvTDJy
	/YQD5ld+KCby8V6tPYA=; b=kLulVig3aJALtC/8rTwm3evvJXj75+9Wr3w/d3d8
	yvl4wCstpHvGIEko0hndxmmeIsduyCUaOSFzl6FSZhyYPcco2xp3tGr34VUggFU2
	FFjTJOERazcfZ6pWqe5ZaC2BkKuBQePD49aE89xbVK6F3hRIarvGlReZ9dF0pf1l
	5+joO9xHjgqZ5cyi51kNzvA96cs0YNrABgqzj7Dz3ffxIGl3nCKFFG/G5TSmNNvJ
	oZiZ8JwOlZOPWdOTzDthUxhzLx+rPiaEXk5G6xYGA1f3R7+D9/SJHP3refOz6GUv
	RnQQfMHRoQwYcGyFUGlcuqFe/mt7GKSC8+j8WTyghmayRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex4e1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:21:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caef20a527so106667285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747268484; x=1747873284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3T4zfjmzH1nVAi6lbmvTDJy/YQD5ld+KCby8V6tPYA=;
        b=tOyX4QXY9XRY5/KWLwWlFFuMsZT8dZgBM/zJVYfFhZIsfFVBoTfirh8MsYuOqQrA2H
         PkFm2TTUMHJZElnC42bfWpEBOwIuYGq9NUWgBRuB/n4irrm5V0A0cPo8Clq0U9sCGLD7
         9SfiIqoh1Ev3OGwkS/XH9YS+dfbC5tthbovVHpFlC2ObxR3MwO0vAj7mSkw7miUVxKo+
         8QO8I/WD+73rLLcewCd3ibEybaK2XxuK1hQ2HoZEGC6Qop+62JXaBFxoTymOA/ZkN/zf
         3cxKvxf1T6hpeRGPL7CRq8F3qhfh01vzMtpNEpiWdLjup0zA8t22g6XO5LIisL9MfqAF
         fUbA==
X-Forwarded-Encrypted: i=1; AJvYcCVzgohMGm1rr51SArnGX5R0vk2V8prOkqU2+eSgwP2m6g1m5UHQXncTD5Nc1R41SwJENazPoUyECrimAwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+PwMSRKpMspmVvUWlTuhIc6MAi0N9c+9/x7kgcrNIIjd2uXd
	ntqJtYbzV/5Fxt0N7xZLi6owc9dOqyX+wTuTxxFwNofp41OhzmfpcvVWxmvBSAao94XUHCB2k7Y
	ZKtatBS5tiq7mXio4sWV9sm0rUjYJ1wfowZ/s6Ycm/jwIFOq6duZInLvrG6nM2pg=
X-Gm-Gg: ASbGncuEiHwwu4Hj7twTlqJFf8HzChUGV2d0CvzuGKysvFRDPEbVQiFuC4yntLsQnMX
	BNOmjbE5Uc1f7V3hLXBsDEfDk4KusF9tuUAuyHVDy++TOLYR+OonsYNXi4eDNf94hUzO5ucFV0i
	35wHMZeYNGVUPVfuQMp5CXuZIP9YvV7pcOopdoMV4YLkwk/XJVlMRiMvRltvlU/7EJVx3eJUms/
	ABKZ3iJqnjkzGIETq0+H1A/mTmHDFrscNuhBtFIb+LYW+EANaEG7JaURuF8A0kvgKyOYGqvOzoh
	iXQGSuF2Oisap6MaCHn8dAx01KYFHdoJ4LJtEqv4U/PkyLfERyJnvQmS5ZU/+HpVdPZClcZFowk
	=
X-Received: by 2002:a05:620a:29d2:b0:7c5:d7c4:576e with SMTP id af79cd13be357-7cd3c6997d6mr59894185a.31.1747268484544;
        Wed, 14 May 2025 17:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxthZgaaCEtgMWvPOufQHVkJCtJIfpyoMQ85ENiwc8/TTy112uu3WYn6gbXoDll+GJBh5MXA==
X-Received: by 2002:a05:620a:29d2:b0:7c5:d7c4:576e with SMTP id af79cd13be357-7cd3c6997d6mr59891585a.31.1747268484206;
        Wed, 14 May 2025 17:21:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fcbfsm2419532e87.50.2025.05.14.17.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:21:23 -0700 (PDT)
Date: Thu, 15 May 2025 03:21:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW
 catalog
Message-ID: <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMSBTYWx0ZWRfX9It1kuB/8fX/
 3vII2dBU5xAQ7Kj/b+6pRBOuGR2H0lMxn1g3h9GLf/zfa/6H45zKIYMedmaIuilUEgeFk1l2VV9
 5GaNk/JXxragxae4/sONnww+R+yFs45CXy/d97xHDuuJBw9ilfx9qT5Stkwel+3ucAH1hkkqxaF
 AzL5aZ5xCyEe3kmt6JSoVy3r9VhhW7ztCuckmYfH/hNRuCKytHm64aFRLCf/meRqe4qhpeLekC4
 at1AySQyCu8BeFGrGFzw/t70CjWV+XBVrNnEZmECmH2juWU1QFFZhUeOj00EmVvbsyT7q0WTGo2
 UCrNWJPf3RHKeMqfGeqadBUmcZ+C09rVO+aiImtUSmwKCzofnispw0m23yvgHA+cHjAhIKZYJBc
 YY6Pal2oTfnaV+rBfLdO7O3SOqJuu9nYM3oZwVRN+QXQWpUV61RzjvfIPzER/iLMrI70iWig
X-Proofpoint-ORIG-GUID: yOo3L1to6HBn6TV_rXjPHdld4S95CtnK
X-Proofpoint-GUID: yOo3L1to6HBn6TV_rXjPHdld4S95CtnK
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68253385 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XNzoCkbmTKmYsmvQHroA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=962 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150001

On Wed, May 14, 2025 at 04:52:30PM -0700, Jessica Zhang wrote:
> Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
> dpu_pingpong_cfg for all chipsets within the HW catalog.
> 
> Note: The max supported PINGPONG width was 4096 but increased to 5120
> after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
> of PINGPONG_0 specifically to 8960.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++

This needs to be rebased on top of linux-next, otherwise you've missed
dpu_9_1_sar2130p.h .

-- 
With best wishes
Dmitry
