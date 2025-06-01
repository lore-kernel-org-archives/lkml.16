Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0B17A30F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763521; cv=none; b=Hbrx7r3PKeVllthWpCnBtNtnmCcEnGz1Fik4eRBC9D45gBLC94UxxxUQ/UUjBl2o7ZSAHgkoggkuXbweYaI+HzcAIcTSJiO5keu7mKJkRlUK6NZqjwL64o+6N/hEHjUmqIWGTmhsi7pjdPqbLotq3v7SGE01zvbpgZ5p+dKfkOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763521; c=relaxed/simple;
	bh=32O4/0F+zhtDfGoBLdogCW2cDiXYfp7xwglVUlmWo2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxnhvyR7CVpfnozbaGazabIslno9MzYUfkoI/eixwtWgzLAuhXx56kYvNLHYUv/59bEiDI55BBRtD8aiwj1U5XVPhbJhQg0AYdPTTu6/2FR0MIqzmnpJjOfJn+5+aSv2G/UQCRel0dls818dSvqhQ4nqJFi4qiLF2BVkMfEbhEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmKgqgix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmKgqgix"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5513KSWB006853
	for <linux-kernel@vger.kernel.org>; Sun, 1 Jun 2025 07:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=37SzpObJv2BUN0EHNjcl8wWG
	ZlSzPm0ZSKZ16R5wQ0c=; b=JmKgqgix9ewyUwVVBew7jkodY25b7kHj2CGoMLsz
	xzlh54lA5wM1Lgt9PRQPcwwz6Vzk7aOz5tIJEACrdxFuG9Ap3d10kBd0IzdTk3S+
	XfTeFyKBF/AHm2VjjXVf0XJDiYhCJNDM3F12Wz6Q7V/XHMAWq6lmExSnIAWzJ5rh
	hcUFfL48W1/ivPrnPb1TM6vBSjGNwMzySe0DMyRMvUUdX+3qq1G4Sofla1RaIMD3
	+JVB3bYh/NHe9lEbHTKHO0vrapKLc8mNbCoyt7UqMDt0fWZRekOTJxPdtWtNwwYE
	rLYYnexQzj8ptopx6ohDlC1yqtK7S6++5148t9dSDAbqkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytsdt0x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 07:38:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c95e424b62so694093285a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 00:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763517; x=1749368317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37SzpObJv2BUN0EHNjcl8wWGZlSzPm0ZSKZ16R5wQ0c=;
        b=s2frJ/18l47JRilnI6gMs/bohkk6qxd0vTNaYhCrSIaTsMlT6KTBT87443sTEIfEf+
         BydkqHONWmfoJ72nDnX663/OHAbHxeU+JZq8p7LxdyVQ+1qNoW78UT0saRHVZOnkuNXV
         Uu9+ZqAn59JCvmSj0PLH+z/8+nsSCPnboPjPFMQD7BEycmGTC2dqwtWnrriWie+47iy8
         8oGsrVpDXYBe8CR8N4YaczUGHz6xpwtYoz3KMO6TTWw58ijvV2JMwOLfXlDTGsmvhOT1
         fMh5fE37zWhUNzklchQo7+892ZCAGxdiswixArByBTAOMfgCGcNKi+nTTkF7sP+q13ar
         wePA==
X-Forwarded-Encrypted: i=1; AJvYcCWJV4pu1HQch8bHj2ZEbic2MjbpXSd0Njm2YBxIyTL+16IHgs94klH2eI1zYPsthGU/N0w3JsFgSa6bvq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqWDfXMdHCG8yIjERJhRLJH0kPqT3ald7I2DLwzt03n7/BpHa
	JPGU3NVyGnIddSjfSrbJz/0snO6f7fBIKWRng7cHGsjhnKPoevzvQ/FqOQHZWg+GKXivibfAuVo
	gKeWuVmMy5zFRjXrZCFl+WYXfwGAUCbP75foi76Tfr2b6sqGDJc9Gn25A8du8MqMuHic=
X-Gm-Gg: ASbGncuHfqxHq/IN8TED8jfsX3a3Ejd+Nn06l39RcvCBS8nWdXP2oAuib0s7RJJkSy8
	QHE7088Z5DUUMwZ2qRelAgfGiEuMi2pkdiGTR+uBAzyGuypiCfye+krKK1+Ywp6DQ5Fw+lDsmkv
	NDTfpMN5O74p2pPTtQSQ9bGjl7C6VJhJUaG7J5juofBwojOa3Y98hgFFUVqFWxfyEHYriGIVrUj
	u3x25BpV4IzOcpjxW9LSG0eGSV4DoGGH6LsxJFxdcvhzcX7ic4Xl8rLVhTMxgT/yFKAoNoDrVRd
	7A3jtI/xCSO/2S/Jvt1DP9GyJl0O8vOAlawh2osvTTckNN1WgZYwGbnU1UbS0oJUS+xAVYt8fGE
	=
X-Received: by 2002:a05:620a:2905:b0:7ce:fc0b:d39d with SMTP id af79cd13be357-7d098762644mr2116927785a.6.1748763517378;
        Sun, 01 Jun 2025 00:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkEw9tJvV3e2JkfLgTHh/B0SigBZSQ3+0EwCWmfBTY+NmPYsvevOwA+4J9ZxZSpp9/KrAkSw==
X-Received: by 2002:a05:620a:2905:b0:7ce:fc0b:d39d with SMTP id af79cd13be357-7d098762644mr2116925985a.6.1748763517034;
        Sun, 01 Jun 2025 00:38:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910f44sm1214247e87.115.2025.06.01.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:38:35 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:38:34 +0300
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845: Fix Venus OPP entries
Message-ID: <3xoxpgysxhy7coubc74vgdfyi36o22eaofw76ta7o5v5gmp4e4@3agijh2wapbr>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-5-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-5-54c6c417839f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 79W_SN5qJz1-rfo5c-amoUXnWsMIl4gm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MSBTYWx0ZWRfXw0YAwgOIaOg+
 lPRIIPRTnOasRkW/XrMuz3xc9s1hHc7OWwo5ZPwO6LDlkH2B9LBOwQlZAQvyr3wl37ayQr8KNR1
 OMA+rPtlbQUwo/C7VFJDFvXXdcoQqQWA+XGQqErKwjBVTjAkkUsOlOlHzWs4NNPcf7w9CVuxyt1
 DfIiPB4rf26I74YQVPXFYKkDsDjWJS8lpZt+7cmxeC46igWXnf3hqpSsy1dYGJ43CPqdHz58bMu
 4aKQcb2SSpMtUpfi8WLY/mCq+EiPa+YIm8wRjp8nYgp451bFj8In/0ci/nRDykwq4ubFzaFLL3w
 Gjzut9iuHU2cW2iFWjR3TwlOLCoGJm7LVC5tel6+MP69IbfXBtqduwbNSZongSVxI8zQwCfrYII
 xt4+UEjxKXYc9nvsOSJHWAMpcyhFPUyXbSQkfBUEn3srgOMhwPZVD2bYyxCvSrJtuM3943oY
X-Proofpoint-GUID: 79W_SN5qJz1-rfo5c-amoUXnWsMIl4gm
X-Authority-Analysis: v=2.4 cv=bYJrUPPB c=1 sm=1 tr=0 ts=683c037e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=SHPHT8z8tTG74PR_iSkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=893 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506010061

On Sat, May 31, 2025 at 02:27:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make them aligned with both the Venus and clock drivers. The existing
> ones seem to have been based on data for the non-final SKU.
> 
> Take the liberty to move the opp table subnode to retain alphabetical
> order while at it.
> 
> Fixes: 137154871cf4 ("arm64: dts: qcom: sdm845: Add OPP tables and power-domains for venus")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 3bc8471c658bda987d6fcff3359d63b367148e89..7d22ecb908cd4dd792a36beaee0ede061c5abd0f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4254,14 +4254,6 @@ venus: video-codec@aa00000 {
>  
>  			status = "disabled";
>  
> -			video-core0 {
> -				compatible = "venus-decoder";
> -			};
> -
> -			video-core1 {
> -				compatible = "venus-encoder";
> -			};
> -
>  			venus_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> @@ -4275,13 +4267,13 @@ opp-200000000 {
>  					required-opps = <&rpmhpd_opp_low_svs>;
>  				};
>  
> -				opp-320000000 {
> -					opp-hz = /bits/ 64 <320000000>;
> +				opp-330000000 {
> +					opp-hz = /bits/ 64 <330000000>;
>  					required-opps = <&rpmhpd_opp_svs>;
>  				};
>  
> -				opp-380000000 {
> -					opp-hz = /bits/ 64 <380000000>;
> +				opp-404000000 {
> +					opp-hz = /bits/ 64 <404000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>;
>  				};
>  
> @@ -4295,6 +4287,14 @@ opp-533000097 {
>  					required-opps = <&rpmhpd_opp_turbo>;
>  				};
>  			};
> +
> +			video-core0 {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-core1 {
> +				compatible = "venus-encoder";
> +			};

We don't need these nodes anymore. Please split into two patches: one
fixing the OPP table and another one, removing subnodes.

>  		};
>  
>  		videocc: clock-controller@ab00000 {
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
