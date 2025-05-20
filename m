Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F7E26FA60
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771428; cv=none; b=a0y4wUJvTHrbRCUl33LbMLh0KiKklzEtyezeOxu/Dgl9mf5RmQUU2BKh43Z4E04v+CdHxc+hai9uDfl64tufTmfTmioi9E3hj80QQlF9I+YW0PGUNSrtYn8Zh9lDyUbcCAiaTUCKLeUipAAkyOaDMMersZ+cYT63hK4hU6/ELPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771428; c=relaxed/simple;
	bh=Jo58uY/+5x29BKtnLD8ifhHMZfOyVH/5wLfRg+pPINw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jC2gA0z4aOCrmkRK6S6azI5C+CDJKFgXffzVyf9Rbe0//b/l+XS8/AXXY6DMF/NMONTJclbexAwGxZD28IRgFoArS27BOECAmGz1jtTgNfxFICXAP9K2x5Y9WlQg8Bh8b7zS/huGPCOB358tc7R5ektqd/OuS4w1KYnvTFcdj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrXcPbEO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrXcPbEO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGrxmd013210
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZzFtqYN9pw9QSLrS0tK+ki9d
	IS1z5CdQtvo1AHtdQc8=; b=TrXcPbEOTR2LWK6jJHP1OxQTiWc3DZ0iCxKyg/bh
	HHdt0rW/ld3/l8WrX6GFPoKbxPjU9XtQ7uY7H6z8x22pmlGaJrz4XbXjB4wurLHK
	/ylSSYvjKOFVqn2N7BY5jtSTS1W2T3kXb443Sg04wWqyCjZs5yXtjB5GDqgWCs7C
	OQojcc6499E+MEkeubqGc0goE66j65zoqd8WOsyLYwEUjAUdxboavgF3KLYHJdxn
	FkBblh9iVjSjCCTJ9OjmExdYSk7js3nZkATtCL+DQL2mba3FHOmDFuhyvpARn+Xc
	mjKHLvGsXzylIyy/XzAT6w6UWc/hnAKeTEA1zzbVdA2yCQ==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf00h8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:03:46 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc78d55321so19688365ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771414; x=1748376214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzFtqYN9pw9QSLrS0tK+ki9dIS1z5CdQtvo1AHtdQc8=;
        b=i7sWb79Rvfd75QooIiQf/oVYblKRiIyrh1D2iM99uo40AwB4+fLmRcTbvR+vCEfLtk
         JlNfEFnlAvulV/64StGriBPG9UJC0hCmPaujNswSK0gPYSB8o6vNrQHn5Accttij7nyo
         zIpfzAALPU9Bqj2VwJSQuCGTWlqqrsONRLRvhh9o7Wgs9t2SVIXxHiRV82/Q/jJp9IYq
         IOzff5iXXbOxX/BmckNk3PPpHdejtQWJevd8c7KB9XG5urSzeICp68vKaK79RrHJmd1W
         WxeqvqpEFZHFBGRHUy4fQKw4xXQKmtvSbNuuP6xtWNQR9sFhESCtUawZLb7hLH4Obm1b
         jK1g==
X-Forwarded-Encrypted: i=1; AJvYcCXRCrtXB2vN8iHtcuawdnAj4XEXNZ+LNWs6F3K7AkjMp0wVjCYPZCqxpI/H+lQ5Luvmw9ZEDazbVOVmfa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVWuCxOdRCJr0x1pZrBsqpox9bT1fcWl7OSr9gw2DsB8t+Px3u
	c4JQ3ME3DMubcfHLiFOROyl6j0odSCt4sxfV4wT7dE2BRX6NrDQdppV2gzMb1Y8eIZKpzlxJTPx
	uuPVD+6il7ywDbKOKNkggheGNgsPofqmalrUz8nticZjnpfu/qln+gstBpFyVwPDIqgI=
X-Gm-Gg: ASbGncuA+KoZj5iEg+DszBzbBo+JQQZEguTUx4xJpPcRQ5XsdxC6MsDwSzphYq6Sj5z
	t4i5ehQJgFka7vnDuH3GT369l1e1Exigr6djzS32wwt7WmJUQ7oC0xwbkctGkDeu9ujOfkW0/F3
	OjQMJRWFx6VYnIUDIPw3BOq3kdniF9qLKRkuRWtdiZbT3F8fs1h4KQRfHe/DUKOrJMJuAHanY0J
	mlcaBqV8ur2qj8OwKj9V/FabkMOOQEc0PqjTfmSaFMcki/l7eymmIebj2MAryWReWoso4UBnOdw
	Q9GKsD6PoQJhtaj57An5lNsG7eE24J9cMLYqVDmix9OoaY2t2zcLBDgNs9rj5tbI+GE3RHbT7M8
	=
X-Received: by 2002:a05:6e02:4515:20b0:3dc:72f8:eb5a with SMTP id e9e14a558f8ab-3dc72f8f6c6mr59168345ab.8.1747771413704;
        Tue, 20 May 2025 13:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkMQW0eEqSL6CRJucy/8YPsL/wGcX1YlADkSUGzyRXsUQv1razd3w2wbK/Q+8G6RL1s8s8Aw==
X-Received: by 2002:a05:6e02:4515:20b0:3dc:72f8:eb5a with SMTP id e9e14a558f8ab-3dc72f8f6c6mr59168065ab.8.1747771413339;
        Tue, 20 May 2025 13:03:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1608csm2506687e87.8.2025.05.20.13.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:03:32 -0700 (PDT)
Date: Tue, 20 May 2025 23:03:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <3fbffse4iqkegqjheeptnmsofz7fasqgnpbhhbzlzibv5qjxx6@dft4vafwlkfr>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
X-Proofpoint-GUID: 54HGRZLdOI_Pya-91mg_xTuHs7DKMm5Y
X-Proofpoint-ORIG-GUID: 54HGRZLdOI_Pya-91mg_xTuHs7DKMm5Y
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682ce022 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ZElDdoEkwM7Icc7ClhYA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=HaQ4K6lYObfyUnnIi04v:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MiBTYWx0ZWRfX5vxtLrds6h8g
 LFlh/kmyhfRb3gHJ199TdYyLUVJieW5qvoq/ePl3Fbh7PJx/QMM9SJsu+jAV/X8FDgQk8IobOaV
 m83th1KySvvKgwKng57mc2XxnhRAV83OfVYldC9LqiDBshdms5dx1jdceOrntnpmN/RlFnZfxNY
 akxjga0+4IQQmxe3VDz2PSUAG3Aj9IJpoDMZTo7OK4C6MZH1MDIV1WOBqHd4ydSCQegQOZMXmUb
 QRr+HH+L8My7Whln0+BCHwvP2/2MJoKshTCAQw+1sii2ji+k4nIOwz/nZTmHPbxHJH4S0SLsiSY
 cQ0okx0tjDMjOx7OYRhx7LpNQOhJkZb6ZW8h0j2WDGHwlgUpydp8sECTye74WSMFJuuqXqxAZGf
 62JwHKh09XYP0cex/9MtJ2HNnfafKYzUMMzIhQywePOLiKXHVmsAdRd5mEWxNHYHERTTAttA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=737 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200162

On Tue, May 20, 2025 at 11:56:16AM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.

No WCD codec?

> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)

-- 
With best wishes
Dmitry
