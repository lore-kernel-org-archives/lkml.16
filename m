Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B4E1624D0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255485; cv=none; b=l6TTUeuTXRzBfmdofxU2qukWDqQEm2zcVp4+cYsArOP54uA6PBZEpIPhMhROJQL9RpY9ElNuRhgAENCtZQeR3xv+3PRno4eL7LPWP1vw7belZn12cbfrWp6fZkBTFC4XGmQ+4J2MZxCOAEoB+znk+PafaMvcrxxwu6ZAuRoTISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255485; c=relaxed/simple;
	bh=Gx9WFrUrUoZRLHEwwMdCx9g+x1arq+e2dFMezx9kXks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4PFgTvmjKtUpyQZaDcWyXOZ2mVpWlT30B1sWANfLBn+lNfV+r7pwt2gH8IxV8+GCD4p3thbw9MHHMeALdtkCa6eKA+LprxIi0yA+fSl3OgwarSN6mHC2QXX6PISSRuiIlRxiitGjZLBy549QK2bgefznSnlAbMcY1ktQZtO4V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jK34rGyg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jK34rGyg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDr8Z027515
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gWsEAg4HSwu4GGjiQmNBc1wl
	iCEzGfllW8dB+2zMyBo=; b=jK34rGygpV1o07wXXl6YeF0vzGw4keYdNUvuz0l8
	W5NeniwiH8v6kreY8SDngQ4qrFdk3bb7jpdknXBLs5WeFJ5qYvFPVCaSLtl0gQfL
	lRu6HAuGHp+1h2B+HvISGD36MpywEsT/c5VaZS3hA1olsGQQfnxHeA+0C03xmUc1
	sGl4HOEbloZSWXVf9h6JpO4p2MFV5q3y2bAsQ3iE9mPoomsVokgQc/7h+r/vXeqo
	LFTFQROtoAr5TU+s9TM16hWBRPmW7aCH9PZEdGBksrItLcoCF6C5tOjW6sXB/3Oz
	blagRcwYHbCnMB818sY4NZNMiBJKDlCAuKWHSaV4JEKumA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrnk51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:24:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54767e507so62555285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 20:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255482; x=1744860282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWsEAg4HSwu4GGjiQmNBc1wliCEzGfllW8dB+2zMyBo=;
        b=aCaCboSnnZwriS0LGO+5cKDOdT8Dl5u8ZSaAlbqZbQ/Qfsldy9zmcCYB+7GKUKm+kU
         25uzqemPrafwJMQLqNo2wy2f9MzuiDROY01eg8622rIA0z3powN8sKb9Fw7eeMUAte9Y
         ZSx1NUj4IrtMqcguffjlzytHnsuuCpWzd1YXanjGD2uuj9jS5HHLQaCTB6mxLYYtrFHS
         Y2wZbCIcTURH1/vc7KEGvZQuRecsZ1QiyP8/VWmRG4/ee7KvQVnSfYfJWLIajIHkv0HF
         rQAATIZR30n+lOxf+IRGZE+BhJVnLUpQlOhGuQs1lhzdN9JHyHkha+VctsmBUGfozTqm
         ksUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/l4l2fjXaf/ysXwnU4dSOLN4Ibj03szr0n4Kgu4gYSkYZvF9lR/t2AbCo92avEI9apu2yeO+vuK4qTQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPhmnU0q+l1mvTrZyi6qUGnZyISBdiWH3xP0pVEKEvioDr4ag
	bWNFzMXGQa4ZYunGlo25phC/+2TvgwJ5vu5JhNxMOCAuSqIRohHTN1DTrK0aEmFQl9L14gkzOCO
	qNEVicEiL3Yefpsih67iyVgKPGWdGq4XycuEuE5HG+av1ba/+voXMpbqujYY98uM=
X-Gm-Gg: ASbGncvDYgDDQDyA8wEEW4TsoNwWfGqjJHc0IT9aRbt8PlfQKa6kbdIFYdpkOoMqkxY
	Z4s7s5BYWLY0tvJ63KCHasxbmorlsuhZTaNyO+uh5UdEj7+cNzDl1j+YzoQEG2LRBB7lXHX2v5c
	GomxLnTrvKAYBlJFvjNOUhEqbWaBfsvSm8k2s/GaBJS27131OmVTwPt4KVNN/cVKtSf2bIOIWbd
	wA50X9SnaVW3121P1+pA+3tgUE55JwjnAyyDYyIbvdUOllY61eWMYuJx7rdtL7wHZtOELtEloXa
	4VZb09AYuy52SueH0H7s+tp71nv5NzQHRwtzlYPMU4oIoySr4nauGrInInVAA6SERxVbhR+ubvg
	=
X-Received: by 2002:a05:620a:2596:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c7a81b1440mr115716185a.43.1744255482332;
        Wed, 09 Apr 2025 20:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGlA5AopMzhf0UWMU4MO9jamnTQQKqm2/O52vXr0UH5bQxSqNZx1x6dmOamtRNS+T7GE2a5A==
X-Received: by 2002:a05:620a:2596:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c7a81b1440mr115714385a.43.1744255482061;
        Wed, 09 Apr 2025 20:24:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d239708sm27155e87.85.2025.04.09.20.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:24:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:24:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop undocumented "clock-names" for
 parade,ps8830
Message-ID: <clljtvvelqdmmz65r4eq77atejxbh2r36xvaugdxdq3lz5y7ci@gxnqrrdc5xob>
References: <20250409204950.1521733-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409204950.1521733-1-robh@kernel.org>
X-Proofpoint-ORIG-GUID: DZ4PnlL0fa85DINgFgO7qoC0ERiIO64o
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f739fb cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y5MgIiWDlmAYqCSZY10A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DZ4PnlL0fa85DINgFgO7qoC0ERiIO64o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=648 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100023

On Wed, Apr 09, 2025 at 03:49:49PM -0500, Rob Herring (Arm) wrote:
> Remove "clock-names" as it is not defined for the parade,ps8830 binding.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts             | 3 ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts    | 2 --
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
>  3 files changed, 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
