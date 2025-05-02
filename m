Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A9520297D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225338; cv=none; b=ssHrkHyysCWG29Utex6xfDiOokij+Ld/C7rNVEH9HYIdoJR9dDt9jZ1MFVqm/IN0N4NY6/ua3KwtotrR2iHIYjlhQWkbocUtvZaMCvoi4V2DiP/R883L/oDbmTD8Cdl/ufpr6wAamWnjcR0a5yZYNXUpqF5V9E7QbAx3myUBUXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225338; c=relaxed/simple;
	bh=HIvoANCYobIgEBaeF1o0L3N8Y/liT74RM47L1xXFkN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQMjktYwCgNx2Os0mBaSwgADTflXGkAvr0jdsRis3wmVco1tFxtq4m9wTpVH/cGiU0xDXlUnluPy3TvDRcWktbnIay4f1fuhuN07sEM+/RF7BeGmbIZohZ7fyexuPQ1JlnEjqCRtMTXVpjDQFy/K9oSl6y/m00VAdh+FwcjduHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQ8JLnKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQ8JLnKN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAn0t015700
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 22:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SuCVsDN6g4TFy2W7M3iJ3Plk
	T8Xwqrsi5URWt0X1wqI=; b=bQ8JLnKNZEpvENFCL6angT79ippzHBQMcphYQ1va
	DY3KUzWc1BJbIMfVp1kqy4SdhEe/n+z5BS8DffimnnB+uGh5QIMsztMXGbz/d7H+
	P2TeZn23s6KCyTl0ExHijlsMe12COcBNSRH3BDygToDHUc7RT8VhLlp8sWrLB2wz
	0ZiCX15HoG1l+igrrqS36JLkcIqlB2IvnPIFN3RyTD/Zblhvr+hQmDvz6sMPFHZI
	+l0i2oUzLgp3xnHLzM1QBWWMtXIUwRRK0CjzkOFQwKUu/4NgF1y3x7AEfWQ1NVhs
	AyzgJ8bouC+Y1D8TA2GrU+BvvCzKoMzp0Nj2buVE9SIkuw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u79jgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:35:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4769a1db721so65576971cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 15:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225327; x=1746830127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuCVsDN6g4TFy2W7M3iJ3PlkT8Xwqrsi5URWt0X1wqI=;
        b=J7QG73t0gRaZk3tEQdBpkEiVtShL5L4MUxtl9IIZtjuOmP6LDN0rICn81iwnhotV1a
         VxsnmEmBj117aKFX4Y/mhUhFNJlgmt1YGRwOACDcCvJ8YTzGoECjJupy9TpRoBcWXX5w
         /V1EqHnje8FWU8MHMWfbCgkKA7FVyE2tihflARgDJ86Sx6VZ4Tnt68V+lvhe5nsTjwJh
         fHUTbTFs4E4z3b8qu6QyXl+9CWCJkdw53b1LaAt1vLS1Gm5nWcHBzHTjW/gFARU2FV+J
         CM7iNMAwU3NbUf8lUphWWvGWJPzuvoD3G+sWpi2syku2pzX6EdoyPbWnUt5BXPKaRM8W
         LdnA==
X-Forwarded-Encrypted: i=1; AJvYcCWNVMluQZAQ9CM8SydCIkluPrHk4zH/AIb2rVSZTD3WxxMrLYcWVcCzy2bcgANNUZ5IUiyRG/XnURrEZiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HtbDRyfOscAV+FE5naQNwjVYC/FyWlB8fACDJ5f18xGuixbT
	YNdn6X8l4tei/Xttt0qyunDEq3IMs4oO0k8+W1HL8gsK+dP1CCaAw7AQexvQp8I7uV7gilRLyPn
	zi0bVin2WdxgwVbyTS+FVLwfhbfKeP57xoamv96aBM46PGpX6BI4CoAwhU73pheQ=
X-Gm-Gg: ASbGncuVsjNSuvX0xh+fA+lsyjVLPqfX98kFucr1P4prW+vuDGfVoRi0vxAui82V3QS
	QaS2YGiG0vHMoWijF1g5IMKWZNCICvQ6H++snuk1IrvNVaSheWdnwS/vFSLOzlnHueN7ZL3SgVm
	wZ+kg72tBIpoiXhkp5hgAm3UmwzXzKTPBGej4CrxVJlThmRDEVZyUmZBRzFmK9PGXD/BHYChrIz
	MeOxFIt6BN0y8nq7aNmjK8jEDfbUaf74x+LtnL+mjpR0MKulmvsuXTpxC9Y4ZatsHwFuK0fAGlW
	I7HY/Lg1vIDbu1x0FreLOjwcyBSG2uz0/nulRToGwZ7xti8iAJ1POC5AnpHLKntTFHZTyGKtDfE
	=
X-Received: by 2002:a05:622a:5516:b0:47a:fb28:8ef0 with SMTP id d75a77b69052e-48c31a23f65mr71764361cf.29.1746225326971;
        Fri, 02 May 2025 15:35:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCBMAjKkyCR6eC9CmEoV6+y+5w+kEc9kjQxO9VMh2wrtzgWX679IWlyC5ahNpaQha1KzNuUw==
X-Received: by 2002:a05:622a:5516:b0:47a:fb28:8ef0 with SMTP id d75a77b69052e-48c31a23f65mr71763981cf.29.1746225326656;
        Fri, 02 May 2025 15:35:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202901770csm4948771fa.37.2025.05.02.15.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:35:25 -0700 (PDT)
Date: Sat, 3 May 2025 01:35:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 3/4] clk: qcom: camcc-sc8180x: Add SC8180X camera
 clock controller driver
Message-ID: <xyvuctx5w2cr6pi2ddjd5m5xqnirloflwkewpg2bcfn2neipe3@mzkis6iklj7o>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-3-6bbb514f467c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-sc8180x-camcc-support-v2-3-6bbb514f467c@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NSBTYWx0ZWRfX6l1NVW4SdWHB JAqqeutRFJHWL1wZzxFhzbv4vEWdoFkkYEZcMJaerC1TpCzD8ZoQ2A3zjy4sp2RcFMJANGTE0rT IDhOeW049HK8pRGZUUaxCRzGUDG6cRTDkCU+AmEr8Uys9swQT9+Z5rNBLTynorZccw2bllc+4ov
 0GzPg8TW7pndtX2ZJHvwkm8Yqa9swGHgoJ2HQG2Iz8mGfYxArfUj83Yf37jm8xTImWRaJW/o89j G4X5sSyhnfpGwErY1qRdWYx3zYm2ODWaSy3FKe6Upi+imJw84Nd8lPNnJeV7W+Q+dKMc+TE1Jei McnAuDQY2sIhohHsI+ITT9OkoQvx/nPANoWojjlf9R0EfVc+6yWu4xryVG4w1L+fKGRovUL07cY
 +E6plzOb+iW05PWxAm0wSHfnbj4ZA1JC2e3Fu0KD9oF8P9KmM9QbnN7W37VE5/o56wryjv4l
X-Proofpoint-GUID: hPFTxC4sO6I0FWOYbGWqX3QBTec1bs6u
X-Proofpoint-ORIG-GUID: hPFTxC4sO6I0FWOYbGWqX3QBTec1bs6u
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=681548b7 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=XyGygVz_FukL3ZPvZxcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=829 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020185

On Wed, Apr 30, 2025 at 04:08:57PM +0530, Satya Priya Kakitapalli wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SC8180X platform.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Would it make sense to merge this driver with the camcc-sm8150.c? It
seems that the blocks are pretty similar.

>  drivers/clk/qcom/Kconfig         |   10 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/camcc-sc8180x.c | 2897 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2908 insertions(+)
> 

-- 
With best wishes
Dmitry
