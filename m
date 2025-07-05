Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C7D218AA3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751749043; cv=none; b=p0Tm1J+P2eNi4qsM87EVF2+/TGRh9yHxY1s258IKjnKBzGrvx93BhwDT4VfuqtcRUVo/4xwKdTpA1GseYX0JLnTxWW1dqAKsvs6v+ap3D6dvFFg2BAlxsF1zTh0U7eYIjZNbKbPgeGKf7vThzahrQwpKT2gURvYlf6+9c2K4PKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751749043; c=relaxed/simple;
	bh=yd3QB9i6892Oi/RELZQPA7eTy1+ck7mvWaDjNXHvHaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDUh8ZzhQy1SBxVb9puhu7adBshYkm8XATQvFohwjhdrEhGsVEiefwSMxmCbrd/WHNvJCp7lOnmtBUP5VTEBzmJU3580HYZqkCSj3PZ/riScpaPV3M8fY42/SmlNV11F8hrUhL/JtCwrdrjET8prlghdrYo5f9ES1Jzv+CrClVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElYaW0ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElYaW0ug"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565KIbTi022330
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 20:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixkjiJJ5xJZnwXwbUy5Cg/AO
	bRkh+NRxwTSQlLi8b1c=; b=ElYaW0ug6LU0UeA2xfo0yGyIvfeLfPCN7rTkYyhb
	ZYFBtjWrj4+qPIfe+3wx3aDg3IwmwrOVgGHEeFA2stdx4Wo9EC2/JHd9bdcOL1+A
	NLd8cC/rrXyDIVVxTbi03o3+B5+nwRa3Y9fg5Adw83+ZfPYu2BCKSpGn9VS16mjI
	bYIM6lpbrvzryEnKquVFG+c5GFgYeEshxd4qEdkeShd82VqXZdREUA7V+nk/DJi0
	uzr61JCebhW9udhyFfXviCWrkduuMfxJQ2qRqcZ3amavnvm9p5tLGvKLh1OPFGVf
	EaqJO2k3bKAxt9hTG5D7GR+47BDd0rqIlF7Z2txQymKX6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveet195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 20:57:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so298233285a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 13:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751749039; x=1752353839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixkjiJJ5xJZnwXwbUy5Cg/AObRkh+NRxwTSQlLi8b1c=;
        b=XogX2KKUpcb1DYNsGZvWt580ySGaM/CAKcw+bQv1yNP+8zjLlqcq1Crkzs41Hu1s4X
         mR3F/TLFJ/RPPORXwF2Nj3wUvzmuhw8CFFYTx8nAxw10wQ4u8Oqg9B8FPyFeCeHfaYrt
         gT5zXfqLUDU1yaHT06PN0G98VNmxZnnhY+fg7yH6G/jB3ITvF4YYGh6Lh1JBV2d8db33
         OR3DgOm5IhXz16IgWsCxAE9fbYHLT3vB4FI/fMqyrlL/O2b0uvXEIt6s9mDHOuLf/2JK
         8CuUd9URXna1LtnP7quqdgO3g7Tl4F9INRKlxYnNz/9EyMIU8IgDvQ+PIip8npaAl9lg
         PSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXmuTVhtWPaU9CbUIAkHlGorGhFmRuHXOsW2b05qUh3nYnE8qiuZ354lCVtTjeLK6Kb25OqbH3jOAcudU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8QyvL14CjIXCXa2tsH6dwB6DHKFeJKFCMx9AJnWvJz1ufUlum
	CYRFgVmFTnbukhmepxX4RQVCR+V0Ne97iLAWouZCicJthrCn1hHkMHgh90+Zp6SNnyW5Of5FLcn
	2TF31T/G6dVIBTPG1EgI1070hMiVQL2/Q37Iyg4vEP+DkRKIprN80KpZYdjfU6mFlFNayHA1Yhe
	gvDw==
X-Gm-Gg: ASbGncvuzPbLFFbkK7bwVbBfKf0/Nryqc+wJwlcAfwNnHukrwIZqZkt0lrbpMWDPn25
	ylSp/70iPaE4kKKos8x8jjYb2agODrErt86GCUcXsWWfV14QKN4LbMfTmIvLwHfhDFS1RZDi2cA
	MhrBYWagm9yC5ee230jgpig3LlGmvwHuTHFwDHHGOXN4oQmZSwJ5X4q5S0nLPl2b9Q8KWmAFSKx
	v3AxUgWyYhcHzDZmBwtCGMhF1Ak/24+xaQhcqTUxy1hhxdnDrBymJOdzjhdXpK9hMO+E0FuKbcx
	bSO8aN8X2V53Egz9WZV7jqSihp+AJ50JtMfUgmgrIrbpc8ahFXOH9nih6WMPJSZNRuCTlwQshnL
	6LCIbdMmFo+5kdaVSFZ6VJ0FYgxM6OYVk/vo=
X-Received: by 2002:a05:620a:178f:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d5df10425dmr744839885a.4.1751749039453;
        Sat, 05 Jul 2025 13:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM59TkO8u8/py6MOdyXPISy6kh3KQYZz44Fii7ZoY06xkcbs1OMh+BhhFj9MBNEaem6Skz6w==
X-Received: by 2002:a05:620a:178f:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d5df10425dmr744838785a.4.1751749039059;
        Sat, 05 Jul 2025 13:57:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383babd6sm705164e87.32.2025.07.05.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 13:57:18 -0700 (PDT)
Date: Sat, 5 Jul 2025 23:57:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Message-ID: <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEzOCBTYWx0ZWRfX/mQsjcCEG85u
 fvPbm5pTdzuTWPnAjbJ+kxL0VyyiRmUmo3/Ttog59h40ixDOq77s9iG77sPIkeWMwYtwUP8G7/M
 EptYcZ3dVcUh2xZOy/VojiVPNQ0sPt7YUgMDhlWuPlmBhVB3/kk6iUHedGnlvIqwH1XJIgBW1IO
 QjrSju0ga9qT9dm13z42/jmVyH6jI0VVdM6h0gZt4Ml7RSZQl9P+84kzZa0rwhtWLVzrJosoQdJ
 VDwrzst5+RBtFeEBcjPYG6kTjm23URPNx6SUPfwZ9UMHqBsG0oYlJi7nyt3lb7m5l0G6U9QdrUC
 inVDnYIJ7KyEe8Sam1fNGyN/jOWUkfvWQO1n0XnXF9VyKWGTIfd9Q4vi+3qZl2XjdoXprlQHk5h
 A2GQs/Irtwupw9HcV6gDVUgHufOHpJQ+0M4tCMDf8wqw9tqbQQNwRt4iWjojoilNXc8q8W0m
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686991b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=l10-tqhT6-g9Bduh0oQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: mmKW_DNECOdJ2vGW5tjfPxEdzc4Ybge4
X-Proofpoint-ORIG-GUID: mmKW_DNECOdJ2vGW5tjfPxEdzc4Ybge4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=918 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050138

On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> which has cx under proxy_pd_names and is otherwise equivalent.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hmm. You are modifying the ADSP configuration in the driver, but at the
same time you've dropped CX supply from the MSS remoteproc.

-- 
With best wishes
Dmitry
