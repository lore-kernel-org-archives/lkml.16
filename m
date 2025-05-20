Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C05724EAAA
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776854; cv=none; b=MEOaNO2RZViP1Z3cB9aZE/a2LwctXGEo8A4qNPylTnH6wu3NgqFB1vxL+kJv2Wa1JLbo+g1hAEcmKQkcbeP2tZk0rK7D+1rWNNU+XV/QpPMHySVn3+3NDVg4k098oa/XqNYcRfFVKd4j4G5VJBP6UEd13ggDfvyaO4lK4v4wg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776854; c=relaxed/simple;
	bh=XQ4XgTPmany/RGspy2GIBUsx+iMe+wfnu4fIItFaIuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBxh4CtGfH/zF7PDNhCZnFKP0n5J/W0kVxDlSbh+3cti+lBBsUVf5Ji9pyvYmpR7l+VkVMhu1+IhvGmeE+3Zm2rqtccO99jeRcAvtlz3TRLk3XxwjpuzxtKXIqwhiEMmTGEKBZTgC9hhynGXN1jnkHoiquf2aQtdxMwAPT6IiRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdW/De8M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdW/De8M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGf6Aj017327
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D574VKMt13jRsGePvduMNvfO
	E6OLnznj8lfsesnTXk8=; b=GdW/De8MpxDn0zQX+mtIuRKwqszlFpcT42Gt4VkP
	m6SickPJt/TgW8jDQEmthU+w/Hw6eKXTIbm+cY8C+2t6ofVQsCbjPr3A1PWNa++t
	FYsFCdLt628G1Ew1zy9wCWzIjCkZ9fWklOTXchPX4AEcFnstX/QOOlzvLNuLgHwy
	nNv2F+/LsoLMxRZFciErVbY6tMZ71+X8fo2xYfo0XCp6CiM72Hwn9yxEv5jM7jS0
	cOJyEnZPuNVuqLcR9PqtNSh7AkRbJidv+OanZuNSfu88tQ3kaKVrmCd982CEzpe8
	b/vwYrnkSSz4NAcB7k1Ypz8Wh0iFAlnwovEAy2IyERT4Yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb0pjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:34:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990722so1089849685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776851; x=1748381651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D574VKMt13jRsGePvduMNvfOE6OLnznj8lfsesnTXk8=;
        b=Z/SzlAM/ey/SWwAC4cqjg6P9QW0FCcU9Mymy/Z/RsqSdzHexrOJ1RmbsTJwylPHa+f
         v0Ix9X8JSpN8x4rG+IcowrzqtVzfTLrDTix8QuB9jax5SslkS04XvCxTyF1BmxTYvdjC
         bNAsJyy33v2mA44YK4oqcGi9j0kde/d5wGMMt6+C7xDQ7AIVX3mj5FnzpvNy2hWIPhLC
         9Xw7LmpxIIhqzPpGURlTCkED7HGKje3atTremClvCMyGdz3cKUItB8FapYBRX/OZkG4A
         XZbzjuQ/L9LcWXQYB+gdFdr4Np0ocHzGcW6wqFSYyc7JohwGV+mmcAJbaO27V+Ry2snz
         FG6w==
X-Forwarded-Encrypted: i=1; AJvYcCXKbqjsA/ujOgNtPRpe+VyONzVJEBdHnAAPlTTHbRChVV5qtiPROtUMWClk2bQYhsnSUKhTdf9z9PIeLbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDP5bWQIEaQ54LFRGCoGvhZCocuB15egcXBVPWW0g1G+qmDk6v
	T0gGgVAhk1R0EgthDnhW3eiImnb5t11VhRtiy2+2/0SvNrGjYMfKcA7Z7gXRbyi/3juKVbGwgEU
	nVPSFk75BNXnaQYx2SS5+P7ku8s1eOW5Au5ZXdaB8omBr4aWiILsnN01qjLt0zfmngBg=
X-Gm-Gg: ASbGncsx1BqMxFFNX47i2PqdKeBI70TDnC5Sy0jn7rQNXVSsCBP10pA4cE2lderQf4D
	JR/Z4BWVyNIjzP7702Fgp7HWNHQzbX5s/ovQNwuzGVimCZt/RTe/ons7rmBPKq7P/gPu8wuiTLe
	x5Ni1Jh/igZjVv50eVeprNA92NE+AQ0+pllfdtRZECws5dpchhK7bYOsVV9Yviv/ZJtPjc/SVQz
	WcNd2icvoUzlVUs8QKB39CDs42SE4js3CAtf68uMndcSdFl6yok0zV7/4sWOB0MAeROfqQqjtpE
	VfKcIoOuO9s2PlbT5Iw9tvFE6+NAMQe5eJ/daCdwkPcVriNArfSAEtbi9F/iv98EtPhYTMghnhw
	=
X-Received: by 2002:a05:620a:bd6:b0:7c9:269f:b654 with SMTP id af79cd13be357-7cd47f5a35bmr2777821185a.27.1747776851189;
        Tue, 20 May 2025 14:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSKA2pBPWcs79Yb18p/rq2+59lyVGDqL6XxYthvFMrYyB1Z6dh1CSvcvBp1ka+Y93OnrlsbA==
X-Received: by 2002:a05:620a:bd6:b0:7c9:269f:b654 with SMTP id af79cd13be357-7cd47f5a35bmr2777816885a.27.1747776850828;
        Tue, 20 May 2025 14:34:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fd32030fsm565196e87.69.2025.05.20.14.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:34:09 -0700 (PDT)
Date: Wed, 21 May 2025 00:34:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Mark FastRPC context banks as
 dma-coherent
Message-ID: <tqddtxx25bi6xb5jilpbgfccn7qz4qkonmstfbpz36rl3pnrwt@u4lv2tn46e5z>
References: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
X-Proofpoint-ORIG-GUID: K1lPYyToT_l4tdfovNK9ccjKDPyzQqKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3NCBTYWx0ZWRfXxcMy+Fj5Uuff
 T3SUxqUO4MBys+y1pN2c7TMpb5xrRpXMMg0aw3FF+Q2QXcHwYeNEmQpBt2ecekU8mmPgMiP//XL
 rAI+H2mqpX+W/Ls2NxwoKYFvYYsqMgzcNYR9+dJbE5RQdx6dzwXApsbaWC6Tf0tkZ+KaRiGld8e
 EPKE1fboIDOrV7zWBSEI5SUbADZitgBWdq6UHOY41hrJpieVjfpc/SYOV2DCCBf2sf6uDDzpJse
 3tNkHv837zeR2EacCcZOeM6zMly9NQaL7Zq+P3kNsgBem86wH4aQIzTxraeOcfI7lGiGuXeTGlW
 4yC+TDPqnPxSBAO0rEKZqUnrIxjjjqr3JLdRbjgjEIaCUeSkcr+l+8Xl+5A30Wwx9Sxrdmmxfk8
 5v9CLH6XhCxSOF+5F+amUuXMYiG2r2g9UAgPm0oVMiy2XXA9CqUczRXE1eJbw5ZfKwo6x5Ra
X-Proofpoint-GUID: K1lPYyToT_l4tdfovNK9ccjKDPyzQqKE
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682cf554 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=ksxQWNrZAAAA:8 a=DQSoJIzS0BvOvZvfB4MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=522 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200174

On Wed, Apr 16, 2025 at 06:54:18PM +0800, Xilin Wu wrote:
> The FastRPC context banks are DMA-coherent on sc7280 platform. Mark them
> as such.
> 
> This allows LLM inferencing on the CDSP using Qualcomm AI Engine Direct
> SDK on the qcs6490 platform.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Are context banks coherent on FP5? On Herobrine? Or Nothing Phone?

-- 
With best wishes
Dmitry
