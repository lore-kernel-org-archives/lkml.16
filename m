Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1112F50
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763791; cv=none; b=scjSPKSKYMusSeuFMMPQburdiJeRkwd3GeVYxgBsG43ZayIfjsl9xiNfzYTdn2+6u/3/JOuuIRnRb+PsX0tAwq7whE+acOEnV9LC4VUl4G9EiHVk79Dfx8IQXvBgHdSWEVM1mGg8Nu6WQc7kKmqB+IFpIG93V+NiTIksQ8PDND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763791; c=relaxed/simple;
	bh=J1aNWmKuavb0kwWBmJp5bJMNxf1U8ThBEg6w/MJfTOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUkDRg5RLWYqcAwjWm8FoGx1ChJYWlgzwxHfDjQeDpQdvYVcnNhKDPb+ZvDHJsMO6lTUxmjC/od34r4eydkmDo/EHrZn9/cjevKOM1wSDvH9u/FGprIo2RMO1iSUhtY26aVQwJ8tEBC1+NJHXvQFJY3RMz6vDRGTXmzHpgBCFMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojywdJFd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojywdJFd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5513u3pe026584
	for <linux-kernel@vger.kernel.org>; Sun, 1 Jun 2025 07:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qcZlYbP18rNVn9xrHBhrX597
	iuAFcM787JfJF7Y3HqY=; b=ojywdJFdqUrwe9IqRREaDaEtCgPvj5wGXqEEK066
	VSphZLbLQzUaI8jegxmVEWdpXQLdauo8tbXfdW+BWFjYBEBXD8DF8cKs1+/k1JF3
	MIpyr8DiHnYVH6ooQY6ChooygN57QNAbVreQqfSLzW3XdOkb7JviiEDvpQS6EHDF
	xATWZvhhPCgLIh7mHAm88PknryTGArfPy455GblXXCDXBKSUuhA6/GYDly8JsDPZ
	Zc+HakEdj761vI7rCSXRc4MKdDH3CJV7F/6LmruSp4ezkFrJw8kjVeH9Shb4OWLE
	0XrnJGCfWFkvRP68r/oOu6TWdb6bUWv9kvpMl6TYnZ++4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw21gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 07:43:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so596337385a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 00:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763787; x=1749368587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcZlYbP18rNVn9xrHBhrX597iuAFcM787JfJF7Y3HqY=;
        b=dllh42eIGqsxKilS9+MnVOXWaHvU1Yb7Jg03TR8sW4B71seYM4FyX7qsYfLln1frkU
         4WU6VHGFNSe3IRgREmA/nMLAeEZ4bhAO5zVWa9Ho3FvjxmG4W7f11ZnPChDJuJffEW1f
         GGiUzx5+2e7CEiivkY4Gyfk5vrRT7TE5Wjjgo+pf9LpR8+qABHKhm9D4oGWJsQo4qS/q
         nl/nde+SZFe35Op0JqFeJzjk2F0PE4Ba2p/VD0w8hU+EWAr1uAe82qB6H/ThR95E2dgB
         qVpDHKTiCDdnqB7Jj4hu1i/hFWZzb/9YT4s2HlAI69E80w0wa3ll6gaB5RZW4luNyVGj
         9csg==
X-Forwarded-Encrypted: i=1; AJvYcCWFTBJr/gpoRDheDieDn1MGl48xCtRjmUjbYMT/q6j26dntl3vk5ZfXp8q0RD83NJJcfUCAphC3nZuEKgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/urNRrxq46+HAIGZsOTUfcFt+4BP6hqlDuiBXkjTRaFgzxNf
	kJs1K37TukKQedOCdgT2UBHaRQ8oy9ZkzplD97fyx0L56DBql5dAfzYllHes8HNf6YnlfvKzIZh
	4p7EbpLgSv766NEJwUlqRw/yd8/4q5PiaeEmUJvDncQjW70IeS5uKDwXkPuiQ9zYOCtk=
X-Gm-Gg: ASbGncsHb0lHPPJUcIh5xrsPoenBp2418S2rTEnA3tUSrv57xNaEAbwqE/WBToB+vBc
	6b0paiXFtla0pUt1W8qyzomy4D//T7GGPP8ujS10NKjJGeB4DuH3fhVtKWB0YQOgUDxKh7Ae71K
	wqCZCWtSk1pO4+rfIK+yjoOiPaB+cenHAWeF+vnYY3qins3dj3i4xVR17LQj9Qk9E3wt0DIr7hN
	qRjPH8W/i74zuZ136NH1OkS6MB4/lltE8yOCe/xc+Z+RnU9qT4OczHu2BLeg3h1jEyFvqMx03Hc
	LrW6vJtQYl4ca8TcLl+NokaSP+S9CbmAWYQnGY2Vnxnt7yx1g2d/xuQxqkVZMPPgqbreIfE4k58
	=
X-Received: by 2002:a05:620a:2905:b0:7ce:e9ac:1b2b with SMTP id af79cd13be357-7d098777088mr2062374085a.7.1748763787274;
        Sun, 01 Jun 2025 00:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOBY5Oe/tfwV1oH1tsHLG6oXP5/nNOmMdkZvm/PaZNrN2uU9iYKQ6QZLPk3o21mpRhqXxz8A==
X-Received: by 2002:a05:620a:2905:b0:7ce:e9ac:1b2b with SMTP id af79cd13be357-7d098777088mr2062371585a.7.1748763786921;
        Sun, 01 Jun 2025 00:43:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b558e0sm10870331fa.63.2025.06.01.00.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:43:04 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:43:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: msm8996: Add Venus OPP table
Message-ID: <4g3y6no7yjufye7vnwfp4ylhvxghaqop76xuaubslerhu543ci@czy2tjq4rcfu>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-2-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-2-54c6c417839f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gZFxIyregzO47O4cVZfAaXp8RPFLtsGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MSBTYWx0ZWRfX4Kp1gUczpx4f
 Z6a3AYkWAtQmzJYhFre6VXb7AxnPY2LqRwMh4kwMDwWf7VQELsM+Dlm7iLjfJnoPgA3/MiXT3At
 Td6bRKoKVBrK6euIM0faDNHuqNXvhfPsUtBn9q0xwZR10bnKe3bsZK5Eg/lZgWnMFA8HY9SySvN
 0S73b745Tr3Op2KxSia7eFj2Ftut9W6RBqsPQIZVkQBv2wd123oIZO9rDVxoH4gnYRqQ5Vw/Y98
 msSHr8sWEibWvQul+HJ9Dz0WaaKcm/G664P5S8/bNc574lGW1IdnzsGrIENt7bH9UYxXqboEDkr
 lS0JP1cXZyT7x7D5YzswxVSanDo4+ncxrf0KaohZ4pePUjzW5zbryWhGPjWEABmXwOyb3n8jRqe
 J5qGgb5QCFNPKelt6SEY54zjcVGzMFoYMe9z0UxLMZKx7L6oLvT3RVkQmlujSC2/C3yaiCwo
X-Authority-Analysis: v=2.4 cv=WI1/XmsR c=1 sm=1 tr=0 ts=683c048c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-uWcgiNW1zdX3ju4chUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gZFxIyregzO47O4cVZfAaXp8RPFLtsGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=863 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506010061

On Sat, May 31, 2025 at 02:27:20PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the DVFS levels explicitly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 39 ++++++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index ede851fbf628428f5740ca8add65ffc05360cc62..7bb34e60739b2e561ff5fd9e19a6e617fb601a60 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -491,27 +491,25 @@ rpmpd: power-controller {
>  					rpmpd_opp_table: opp-table {
>  						compatible = "operating-points-v2";
>  
> -						rpmpd_opp1: opp1 {
> +						rpmpd_opp_ret: opp1 {
>  							opp-level = <1>;
>  						};
>  
> -						rpmpd_opp2: opp2 {
> -							opp-level = <2>;
> -						};
> +						/* No SVS_KRAIT/SVS_LOW */
>  
> -						rpmpd_opp3: opp3 {
> +						rpmpd_opp_svs_soc: opp3 {
>  							opp-level = <3>;
>  						};
>  
> -						rpmpd_opp4: opp4 {
> +						rpmpd_opp_nom: opp4 {
>  							opp-level = <4>;
>  						};
>  
> -						rpmpd_opp5: opp5 {
> +						rpmpd_opp_turbo: opp5 {
>  							opp-level = <5>;
>  						};
>  
> -						rpmpd_opp6: opp6 {
> +						rpmpd_opp_super_turbo: opp6 {

These renames deserve a phrase in the commit message. With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  							opp-level = <6>;
>  						};
>  					};
> @@ -2333,6 +2331,7 @@ venus: video-codec@c00000 {
>  			reg = <0x00c00000 0xff000>;
>  			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&mmcc VENUS_GDSC>;
> +			operating-points-v2 = <&venus_opp_table>;
>  			clocks = <&mmcc VIDEO_CORE_CLK>,
>  				 <&mmcc VIDEO_AHB_CLK>,
>  				 <&mmcc VIDEO_AXI_CLK>,
> @@ -2364,6 +2363,30 @@ venus: video-codec@c00000 {
>  			memory-region = <&venus_mem>;
>  			status = "disabled";
>  
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-75000000 {
> +					opp-hz = /bits/ 64 <75000000>;
> +					required-opps = <&rpmpd_opp_svs_soc>;
> +				};
> +
> +				opp-150000000 {
> +					opp-hz = /bits/ 64 <150000000>;
> +					required-opps = <&rpmpd_opp_svs_soc>;
> +				};
> +
> +				opp-346666667 {
> +					opp-hz = /bits/ 64 <346666667>;
> +					required-opps = <&rpmpd_opp_nom>;
> +				};
> +
> +				opp-520000000 {
> +					opp-hz = /bits/ 64 <520000000>;
> +					required-opps = <&rpmpd_opp_turbo>;
> +				};
> +			};
> +
>  			video-decoder {
>  				compatible = "venus-decoder";
>  				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
