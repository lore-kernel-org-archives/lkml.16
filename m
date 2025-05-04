Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D312A177
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 14:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370127; cv=none; b=RNg5Hu9Gw+HbLOD2yHoewb4cTFPB2RDYhaPbpyRXsXu7BMDAWZdr2mR6J2YfjnmhEdtrHqjXgxVz7WjCScD2k340GqIsKfALbf5DkumtpkeB0wvjufRuPbgYmsbkvACgyIqWXwFm3GS+CqDtxnX4ju/p32Vr9ufs8jLTNXjvBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370127; c=relaxed/simple;
	bh=MS/B8ZUUNnsg7IJuWoWCIHTMuL7RXXREXTteuwgvw64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K76HBBx7qM7JxWBzC8cqQ2zEtZXMjXLff3/CA+c2Ak85Elfa3TRoBfzpq5TcrXXCT1knU3FegtADAXDnjrUjcvdDuArj9JBrV/AoRqclPhtrcVrkf4sJh1DMTOD+sOzghR1lvd1wNyBw6mt6D1n89dbg46uCw1uDfppYulDiBoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku6FPO7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku6FPO7R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544AX2Mf028978
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 14:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nz9orLHhAFXVJJfjTniAzAzW
	Ii/GRqSx8BItJUY++IQ=; b=Ku6FPO7RFhyfiyxPf8xse/PunAF+dhK3Bw7BU2qH
	E9U2DF7x2rHuXvwiOVu151e3cym1E6o463zLJmpioMI0m8u3bIzPus7AIutDKPFm
	hRC4h/OELUts5plSb+jVK/kkM5DB6omkA/n3KKXLMJINo8wbN5Regc10CLiuT7Y8
	NSwyuOrs0HskYS3huRDJ5U2VMrw4dMvSWiyw6ZofQps9pPs3zfbBPXTdmBlxkblJ
	C/OpSyiRRPLuw2z+oJLM47xfsj38Km7fOPzemt1y0Z1vrWOYnean7Sexv0FZcOht
	lq22PTCugNf+/YaDayl9V2af6jyeLV5XQ+q6yLRRFGYFLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n1x7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:48:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so637484385a.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 07:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370117; x=1746974917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz9orLHhAFXVJJfjTniAzAzWIi/GRqSx8BItJUY++IQ=;
        b=H88mao8x4x+88hIGBKE3VC3b7EFMAGOq9WhOoxqBfGAClPMtqHUYF6VQB7s5Clv0Hm
         Mg1GDGm5AQmFZtIdqjRveMVf8Ci3j6+24R5b+iE3tIjrKTdpjmPM77XJ+yK0VnfV0qBC
         WbLm1LRpAetdMh17zCqxfk1EEVSqjZZpRdhwQcS4UsVgDgcpUReJs8KE0tHbLM+sk+nb
         OLy+/iNyIOseVSm04+FJrVvQssFcKWaABFvw6GPVWNopEyVaijti797cxeTBVw/4SOGb
         nbSMpZZVU4R2J/s9VSJdDJlrI4LW/r6sMLSNIj/Wnux8kNbTwurcw1V7NCc2uYby11Wm
         bkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVtix7taK+3p9XbR1lTHe1n0C6JJQesfTMsub0EzW1b0dHICkv5Vn1HR4N/GeGyWzwT73kCSZwMzhHBRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpECf65/0F8xtzrqFraeXOh7wh3Xv0Jnw/PUZu4/8kLQ+E8kMG
	2AhpWd5SzAXu+WJi0Uef+v/Nfmb/YOQljcHqL+mrQWua0HxpyLyw6e+f8ycme/mm6Yh8ICMVe6C
	pmw9v+L3pemi3CloqDjFw3ZG6m1DsNw0qaX7xg5AL5XZUoFcMSrq6FQrbC55on0Y=
X-Gm-Gg: ASbGncvDXelt+Dn7PAmaIW2ufxa7cX1WB4EiVluvnpMrl1YU5DlLr2CsIQOpKfMWuow
	iVDNgGStFM753VXSC0idCbFVdVtX4fuRGQhPiS2pFJREL99dhU6OFLEjRJfBqNS8lCt84wCEfjI
	LJHikD/AkmPhjnZVPJsIUGgRIKu2gPGqrJdk46lqOuwX/BRj9m9ofwGSRLNKXWah4YtgTSXFLEE
	uGO59V74RLe5LLO5E1J8/B07GWF/z8kcAqEliaLQE142fzBcRDbPEdk1bafWhvC+SINGtGiK1qo
	2EaxV90VYKRDovwoYZlttuvYHHjlRs/vzt0TEv6rXa9WpuQFQi8tb5Zo9l7Urzg6205TIgWLw3w
	=
X-Received: by 2002:a05:620a:2b91:b0:7c5:5edb:f4d5 with SMTP id af79cd13be357-7cadfd6deacmr738566685a.2.1746370116868;
        Sun, 04 May 2025 07:48:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Dgpdh6IEqM0qU7DKjeXny5wWp5zIHm1UOfoTiG8Z9nNyeCEmHvi/8i4uuwqAFPEvneWPzQ==
X-Received: by 2002:a05:620a:2b91:b0:7c5:5edb:f4d5 with SMTP id af79cd13be357-7cadfd6deacmr738563885a.2.1746370116555;
        Sun, 04 May 2025 07:48:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202b18e4aesm13074681fa.113.2025.05.04.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:48:35 -0700 (PDT)
Date: Sun, 4 May 2025 17:48:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dang Huynh <danct12@riseup.net>,
        Alexey Minnekhanov <alexey.min@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm630: Add modem metadata mem
Message-ID: <lapjaf4edsuvnw22khjiuzhtiwrxfyiijcwj6piw5n5yby5ik3@r2jvfgvx2gqt>
References: <20250504115120.1432282-1-alexeymin@postmarketos.org>
 <20250504115120.1432282-2-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504115120.1432282-2-alexeymin@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDEzNyBTYWx0ZWRfX2zZ9QbfIS0O2
 8bNKY3UuFg6ar6a5xgVVPk+771+nbPatPRxiSDoZr9eBu7IhmYq+ouEbAIF4i+cmnF4XjlpDjIq
 a4LFp4y7VN8vAohc/PARa16KqmFuT8G1HSC59j1uq/Mxh5iUBrndEyHLOG/Srzxbz/r+dkn8K2W
 y/VGewAFTzPTIl/A2Iqk6azPk4bLyhnBH/+qJ9jL8wMfkFHs4Q4WzeWsiiL9UjHO0VsNYs6eXH6
 hDsSo0K2FdvoyIZ32GlC/uY+vzfJL/SbdLahZjyAC9rEyWxdoeJJvhD2Jr3p4LXYwAGTsvv/PlS
 QeiCduEeoomO1gCy518godNQk8RQX+tysHJsjSM7Be1qT0mQL4GJH9u46pIW4d/JKWOGu1CiND5
 pSnYvz8w8CajrcrTBNQ4uUHTh40njRo2bPTI/2+IVtiAhKrw+bq7ZfqtL/sRQIGPoRucA0ah
X-Proofpoint-GUID: _tDLX6DqJQ4NUWUHYlF1UBr5KjHMuAyO
X-Proofpoint-ORIG-GUID: _tDLX6DqJQ4NUWUHYlF1UBr5KjHMuAyO
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=68177e45 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8 a=fVfY8HrZJKPJkriw-6cA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=673 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040137

On Sun, May 04, 2025 at 02:51:18PM +0300, Alexey Minnekhanov wrote:
> Similarly to MSM8998, add and use modem metadata memory region.
> This does not seemingly affect device functionality. But it fixes
> DTBs check warning:
> 
>  remoteproc@4080000: memory-region: [[45], [46]] is too short

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 2d3820536ddf4..8b1a45a4e56ed 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -509,6 +509,12 @@ zap_shader_region: gpu@fed00000 {
>  			reg = <0x0 0xfed00000 0x0 0xa00000>;
>  			no-map;
>  		};
> +
> +		mdata_mem: mpss-metadata {
> +			alloc-ranges = <0x0 0xa0000000 0x0 0x20000000>;
> +			size = <0x0 0x4000>;
> +			no-map;
> +		};
>  	};
>  
>  	smem: smem {
> @@ -1056,7 +1062,7 @@ remoteproc_mss: remoteproc@4080000 {
>  					<&rpmpd SDM660_VDDMX>;
>  			power-domain-names = "cx", "mx";
>  
> -			memory-region = <&mba_region>, <&mpss_region>;
> +			memory-region = <&mba_region>, <&mpss_region>, <&mdata_mem>;
>  
>  			status = "disabled";
>  
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
