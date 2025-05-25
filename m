Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD36D1DF26B
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748179783; cv=none; b=llMQQgXaqyXDKpJJ48/8WyRbagzihkjvMLWc49DMI3opC+auu1IQg/4/tTCoydLS60SMCbUvaCbF/ECLtiVdoGSViZoSICztGM+BMXUmpbDiGhCR9xiXgQs17W3/4eom9pAo1maBW/LkSBSPJgLdQpXcR4OfoSAK6+OnIx4Pbjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748179783; c=relaxed/simple;
	bh=eaWoJpK3W453hkjc5jnsI+moiKr/YhzBYDg1O5Uip10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFqPhsKKfoB8afyw/9QfpThg4ZOqYtgYRS2kpPWaPiNREVAibNZKwE2VXhe4YusiXul+Bh6MqlOpsLD7abSjBOT1gZc/846umlgAGaTLxcG5ptIk2jnWaN9ICmh92c0RXc9q4dennCKQkjSz86OY5OBo9E3MfYGMQUmUoqQfV6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rw3myj1z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rw3myj1z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PAS3OB004852
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U1yZVFeRJvNQcYSjRSwy1kqD
	yL4Ip5Zqm7ZTvTLywdA=; b=Rw3myj1z2bpGxApIKajHhF0wjemUDquesZZY8Z7W
	b3Ekq3g38UHOGy4fXVbGt5ddPeiyi4ssUFXil1PTsfpifM9YJZ3Lj7jxXmM+QZZ9
	BViadp18fN+m0xsQ8BRzJ55W8XdbARHKOIBmzlwJ74J8nZsU4A0cPUwCb5na4KAI
	SY1i8Tq5u2Uq3aHDRQAEbhA7HQ/S297Rh/O2mhIQkdIl6thh1ooDoSifZkK3S0XY
	4gb1f726LKF3XHsRQIZDZlGfxrPhBmUmuYPie1OQOv5n0V9LjNf2XSVbR8wHMwrd
	D4NBVzOl70LJzi8qFmFmFiiYV3ISfjOhgnFtwM4YNyNdDQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52ut4h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:29:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8d47383f3so25202786d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748179779; x=1748784579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1yZVFeRJvNQcYSjRSwy1kqDyL4Ip5Zqm7ZTvTLywdA=;
        b=RiErNKKmRyuCcoGJ0YwCzJV5UaHmt8OTH0UzF/3Ndj4Xo71beNr/xVS73RU2yR7z/p
         5XPPJ1CuXbT1N9r086RlBTozJH1C/VvDdGbYHmB3twUGyoalVKeBX62ChJ6gJPWy+Bhj
         qeghm3/pNyHbVdPnGlpaxGUKrcECJPb0q3fsMSfnKd+U9AlFrxIh2JUKg1zCYrLwhJcD
         4ZKriMoXC+buQ0Fk9uLvoJMrsTOasD4AsHE6H1QVz7pyG8A7Svnvbqhy9mejXCmwLa6k
         trsMu4iCopZXyf8x6X5rhPN3j0Pwq84KtnKigYKEA7Ico0oXbR3VVKsp2q/jXaq4UYbj
         BkHA==
X-Forwarded-Encrypted: i=1; AJvYcCVBMi708QnK7WLEOOz80oKsAy0I5npewFXxfH4cN12BBLH8rJLBe4dwNEdg6aj2MpzEW7YEhXdlTJcyQ8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YylQci41rtZ58qa1AaSHGdDiz+nWz4XFlXmWRzxf95QGrHwS51C
	Jxec0BwIqSXNhrmSHRYE4S59KfdxQJ375KNWMZO/rS+w3bHU3fhBvo4FTjyXqovJKUiTcE4biZl
	ELX29E0Oa13Z08goTExOJF1G36Xjd9fXRwK51iVBIu8gEGsfkeTW76BTDrkfa3VmVQ1k=
X-Gm-Gg: ASbGncsCpcUdML7ExhHLnWOBiXJanRtjqiXL7YlR0Yr8XpAhHHWaETefO8cuaVU7COG
	6zV+do9DcobSFEmBIIwp1rSRdFdrDudueHfYuCH8iAsfH9GO3+SsTh6tTqKSG2cybR9bOT4bokT
	ji4L/LAUWFuP/fEZ9cYXPkl16iasjnjEaRzvzP81NnIuUysYcwEpiLDP7wswJ7LNtxp5VHI9AI3
	Jjy4MbtY3jGnfqffqbnMmIJy6KijEKtN2bzW0Yp8cDkXomaN0Cpcz0EaHYxDrxX8UJHtmBDXr2U
	PUSI5Y1ew2BpBJQp7ycmtKu0YhPkUZDjF3cLi2kyDIsTVJi8EYOLJvXpqJefjUK7YPIfyJaD5xE
	=
X-Received: by 2002:ad4:5b81:0:b0:6fa:9baa:facb with SMTP id 6a1803df08f44-6fa9d29d31dmr119711706d6.37.1748179779500;
        Sun, 25 May 2025 06:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkbpwaZtvgsmTH78n4o/WnBGy4bo/N4nIGiQ1UuOGCF+k5vRb0u19iuckAgsGqWbcLc4V0gw==
X-Received: by 2002:ad4:5b81:0:b0:6fa:9baa:facb with SMTP id 6a1803df08f44-6fa9d29d31dmr119711316d6.37.1748179779115;
        Sun, 25 May 2025 06:29:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dd21esm43457671fa.63.2025.05.25.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 06:29:38 -0700 (PDT)
Date: Sun, 25 May 2025 16:29:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
Message-ID: <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEyNSBTYWx0ZWRfX2vMs95l6uXOx
 GAiBWV6QwHoFFwZGQEID/0IN8l6bXWEEbyfp5K39uI/ftypiTj29PFGPsPHJlcaRFPXWD4G62C3
 v8VhsTFC7wQ5naze79qNJuHjAKoJoZk5tHDAoOQLwPtPgci98hfNj8bdc0TIC3HaiRSugp7CH2p
 FhWh22wZIJaAy9awk1kWwHQXHfcGqHffbAv9nDvX0bQlq4hknwELqoi/3zx5/LVp5gPtJof1HDx
 Z/S+q7N8K3n2dUDEUB1h4WO/5tKDfXRZsZEYEjBLz25zeGu/6IHARS/ZzPQFVEa9vbYGBXC3RnH
 m4EHqCGsJdLSNfpTD2CoIrFcC5NjXJ+80d2XVR8zayi+VbLqEmm4+X2S90TABksNRu8X7hmvl4k
 HxL8tQ0x2CMh6hnokxTfAzcWM1LhryMza3e6mxwOl1t0g9t65VKmv+moSTz1m75VyOTPSGoM
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=68331b44 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=wNxpgWlUGOnmd1Q9ojQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: _7dS4Ow7HIlqWXsykRuF0tNRMIXkvoUI
X-Proofpoint-GUID: _7dS4Ow7HIlqWXsykRuF0tNRMIXkvoUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250125

On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> 
> The maximum link speed was previously restricted to Gen3 due to the
> absence of Gen4 equalization support in the driver.
> 
> Add change to remove max link speed property, Since Gen4 equalization
> support has already been added into the driver.

As Gen4 equalization is already supported by the XYZ driver remove the
max-link-speed property.

"Add change to remove" is a bit clumsy.

> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5bd0c03476b143444543c68cd1c1d475c3302555..b001e9a30e863d8964219c8bd61bc328be71b256 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6462,7 +6462,6 @@ pcie0_ep: pcie-ep@1c00000 {
>  		power-domains = <&gcc PCIE_0_GDSC>;
>  		phys = <&pcie0_phy>;
>  		phy-names = "pciephy";
> -		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
>  		num-lanes = <2>;
>  		linux,pci-domain = <0>;
>  
> @@ -6620,7 +6619,6 @@ pcie1_ep: pcie-ep@1c10000 {
>  		power-domains = <&gcc PCIE_1_GDSC>;
>  		phys = <&pcie1_phy>;
>  		phy-names = "pciephy";
> -		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
>  		num-lanes = <4>;
>  		linux,pci-domain = <1>;
>  
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
