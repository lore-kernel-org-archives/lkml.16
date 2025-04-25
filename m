Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5622156E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572668; cv=none; b=SM0Ks924eKlbZ+ytq6nvhg0IsTWrtHPjSLkPUxGef2ZVnOCx11Nt+8bb0H7GMLT7oEGCmmnTWCtesqgeLnBQ/EpTaieEBf+FZPeHIbNqXsvHvHwMgLRpcDjsIOtrlM/pguVenx/j3R1ChvDWJWiVNI/H/+SUd7TFqqYtiD8wa0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572668; c=relaxed/simple;
	bh=Cgy/ew99CTAyh8TT8GWMGcHdWQLx7SIMZeGyXxuUhzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+9Baok5phpIm1FtrevmhwausRENuppWcoujKuQYJ9ucDHeyM7w1OIvtGDdfZ3igJArY9KC2DaKEu4p/8Le+5nHSolt9Jq+OWB0cZoobr1xRZehT84O4VwDXfdf7Rq9DnAneVTrDlRuqVD36dULajRpT2Vp8nibryLQCiAB9hjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muQgx57P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muQgx57P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7MZ030818
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WXe0NlKxDZrPju6112EiKpqV
	yTfdsUulvcoDoYo4cFQ=; b=muQgx57P4ZWorYmED8WgvUdhFZUiUPW3sy+uF3p3
	OGxNlsoyze28sRkhibP53thoMwaQZQaQCERfHqLKYWPdBxy5/M7lXAHBmvChA3II
	mZMQuFQhIBWMsSDWRhs7lwAPUfy/9rwZtp7ImX1bLt+JQsZ9etmMoVsDHPuaJCdu
	7vczfLWkRXhRPc303ABefG7k0w8mj7TMxDhumG+JmQDkOtbZpHVZIVYczdNfe8J9
	xN6+cOkvpKOfHBv3v+Noo1QC8mKihj7XCpMu/rpEzERng9IqyBJFyqmEBHnPApYs
	PZ8ZvpRuFKZDjGFeQvwpKt7HeAhRPWvdSCC9IKTEmWXMng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5gfqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:17:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so365514885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572664; x=1746177464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXe0NlKxDZrPju6112EiKpqVyTfdsUulvcoDoYo4cFQ=;
        b=ManH4WB8R8CD/4rsv2Y0CPXNY5REzolC6yBIfspYO58FuN8pn17N0fbVNDogME+WoN
         LlSKqHW9CcusOgf1FT8CdIwZlldBFLRLFA6wUN6jbGDEAOLdrgXaBhvj58jMfnuO7LHp
         6UBzFVim7zVOwhfgiRxrgps4hKER4jBduAUUhLzXrcP/OsgxbuMJCoEQ9WG5t+L4Cnjk
         xM4mTe8K4UuuY1vqHvHLegwegXd101b48hW/oe3D052s3r7zvYu8/meusVp/Bh0J1+KS
         mKFszIDcMs8IZa+y6OdieVj2Jr17QbRYvHe/ioLEYBXixl9TBqEiNpasLRVsFbXa4iBL
         vKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaj+csOLqYZWEkxylCHLO7+UKU48OmSucciB3uFrO4lgcC9Hf2P3RS6yqBOos/6eDROwUGHilOpou1l80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEvzm32sEa6Qj8nMFj/jy9tFnhwsWO8+rywTUWzZM1CM8f6AXe
	4N0oFVKnwLXeeHlZybHTS/x1DswrKb5DINd5I53z8mMoWXn7UvRZgd0GFyIumYIFh5vr/kD9TGL
	yoE8p7wz81aQfXhuBuOPpFWCAvLa7PizSPFUxNmCJ8SSbl1LhRnGAlLNjYVfqZJU=
X-Gm-Gg: ASbGncu69FkEnvWrMkribLSmXoGPeQfPZQCOsHldaXlxdmMOXfismTA8o2F1I3XpkBQ
	0/UBOFqFLHdrviEI9329/UINLxCF4iGaBMxUWKX26DxVlbD2g8KK8CHrf33BicXmIyFodIsrnFh
	zvaux51kNsK019cTJHIT0jmTg4b4DxFneUay6ir4i5JjkC2EmOjR195n7FtK/kqL4TscpAxqzXj
	EGvK83NqWL+p3aQBp/evXZsVzjmgbvPSnK0v66UWS+oaXqqprDXoHTfIw/CN9NLBgn5wX/sLo69
	5SSbzlE8ymsRbm+FPJSwxrjlK9l/jwC3ZWfiR10+h+y8omyXV2RHyaGXy0R9QBzAuUsla81b3hw
	=
X-Received: by 2002:a05:620a:1b99:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c9607880c8mr280227185a.42.1745572664420;
        Fri, 25 Apr 2025 02:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZA3Q0DX1qcrcU6Q5IKBtyc3e5N50tRXbXJz2+iHVhL5w7s0njAeQLwBISLkAKAlk5TRfUGA==
X-Received: by 2002:a05:620a:1b99:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c9607880c8mr280223985a.42.1745572664115;
        Fri, 25 Apr 2025 02:17:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d45sm6437751fa.94.2025.04.25.02.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:17:43 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:17:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up
 DisplayPort over USB-C
Message-ID: <dfjrssqxny7wwcrhybbgx7fqvibvwxvkuba4sj7ufkadpfoqme@nwvcjyjrn4ze>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
 <20250425-fp5-pmic-glink-dp-v3-4-cc9c2aeb42fb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-4-cc9c2aeb42fb@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NyBTYWx0ZWRfXz6dLMUdSbtXi XaL8+yMh/fDKM1u70mK9Hf0LKG9H/Lg4wPRwQXdleM2TeetJw+QlnKxdEAtsN/ibFLAv9lJr4rN gz1jryzdafiBaP3Tlx6+QT5qOYOyWZ0c1kM7gmmCNBlgJBKHdKxtp+0KB/eZDTYSUN0eV3zjflX
 ABtkpv2YWDD4BkzL8XwH0hMTIPhpHsoYQ0hFfz6XDmzPKFepik9vBKUhf3HLZ6UswefcaUIKkEz 2Qs3ldFDybrRhL/yyG/DvxEl0OpJOXjqd3gQkZlg5r2v+cBbgtvJivKzuIpkJmYHKpNzUj5v8Vj blO5y75lEgBPWgP0EG/0AcgrcPUHhnpUO1i/exJX1z5CRyXCWZstx4NVhsizCeaL7lID1jJP1jp
 RM/BFR+tdZVZNAs9cTC9V+dp0+5HFJ09rE92aFSAkIB6zIKw53/wjlYHjkoPSo983Lb9tUoS
X-Proofpoint-GUID: vonWRrifW3xxu4UvA5ME4OSyzfOex7rS
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680b5339 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Df21-P5Y2jz7HsL4rSgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: vonWRrifW3xxu4UvA5ME4OSyzfOex7rS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=495
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250067

On Fri, Apr 25, 2025 at 09:08:15AM +0200, Luca Weiss wrote:
> Extend the USB graph to connect the OCP96011 switch, the PTN36502
> redriver, the USB controllers and the MDSS, so that DisplayPort over
> USB-C is working.
> 
> Connect some parts of the graph directly in the SoC dtsi since those
> parts are wired up like this in the SoC directly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 ++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 +++-
>  2 files changed, 57 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
