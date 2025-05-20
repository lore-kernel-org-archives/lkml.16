Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C869281352
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770752; cv=none; b=T0u4eiA4BRjzmFEg4u5COzlhYoin/9Cri+3qmKtRwzYgLeWZJALdcBdwOQqV8Dum/wkJsDoJ8ndwo50Vvhnj1XTMVJGLlb/1oWS/r9LgqjI3efSz5coXhfsaPIsYxbMvMEsCLdtgRs8+a4V3fRLcawb4VgeIAL68fQQlPQa9+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770752; c=relaxed/simple;
	bh=fhwrc1tbFQioZ+O75VVgYeJFQo/oxLMljz6u/pC7sPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBif8dPXMbm2SLT/JZjU4KbHAD7lAKAlfaHHPoXPyKQNlSjPmJRdG3e+O3WDGrRPKCJsUunijWJOKyx1qVEiGGtEzUZAxtrmiYPqVhVtJiMxwtOBdMvKdtymsQwQ2kXukrjItPEdo5WeXN520Ig+m5QUBa+s2sthCP1klDwD0t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTYOeZvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTYOeZvH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGhrlf009577
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YFL2XC8qzId5Dd6D3sundaqd
	2zkC9xDf5x4zzleSYqI=; b=KTYOeZvHmpbm0b1biMqZxWJQBdNnXPFYO9mTYhsT
	YPWuEUZ78DJEGA//OB9ZmFNK4J008bld10zwULWTbl5EwKlw9y3RyLVMPixW/vCo
	WxZaBXkqaa42wX11EirEuqi1VUen5YAMEl7+P5zwo7SxUqo0scO2tC/foTx5AMWm
	G0+4iT2ibWXTylRobSarSg9/5ivuAv7ywshzMgrDTsrppE/rGpOv4Hzu3aw7UlCi
	aSGrkcA5LHta2RWzukcQajKrbb9JchY4ETBoD9GDOOSbnVLIg693gmlLhMHSXYVt
	ZnU+vIE28wKqHw4XDzG+85Xw3j0cNT8CbzF+UVbiUZ/GIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0gfxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:52:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so996913085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770749; x=1748375549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFL2XC8qzId5Dd6D3sundaqd2zkC9xDf5x4zzleSYqI=;
        b=D/8qbGE1Jqubq2a/+2MOd/nMhNOsjLUCax8Em72CoKrAWbOvpqt/kMS2qjDrEng+PP
         EBx6UDmfeK/DChZDXZVwmWzgem3VIjMeFU4pZE5Z2vJajvqEeIzvmk+hMP8YSfqBtiXJ
         rLK60oW4CYGnoOcg/HTf6L4W5Dq4Whkrnhec9d96gxrSAiLAxIR2r0xE4tIuxmqWmpwH
         5GoYcu/9lRy/MLuWuS7KfOxz3xBulonFS0wLCOOa0QqZT6aMdqTnZVRY/fbK0cVtnRGu
         kwBu4M0AQQNhEEHFbW0An4x1OqqVWscoCIc0uH94bhGHKfM/0QlqK5zVo+P7Rfiteop1
         Iihw==
X-Forwarded-Encrypted: i=1; AJvYcCUF7+Ko7JYpt9Wy5mXZcQbq7InB6K5+VS2fmo2asIQd8y54mYzuYbVefZe0EMKQ5xwreytiQAJyXQ73qJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPL7O89Um0OplY9cX0i/SlAw2dgOjVB9y4d/HUag7EJNJsMbEb
	qsSCqTjvoANEnCGEtvzBl/fWYALX2T7dJaflCWyHbdKO3tiv4+b4yJhw0U61YjcLO1R2xNCjkzk
	12t3lCXJKJzP+PuNPVcCQBA/EBqLKT8e9IkFgj5gv5J97WDaE+2Pcd0y/SNJgnvGOXoM=
X-Gm-Gg: ASbGncsPZrrQqJqJqID9W2+ljmP37A0ZXxXACfQZs5h2Vj/dJYmquUCRDmXlpOBdAoa
	sN6BdK7aXVZIDbM6xK3SssKCL1bilkE06KuOsDuuUpENSkTSfy/9YUBP8/Jq+TG/oAQfOEjY2+/
	R254kupuMIUFHSeWy3Gxwo7yY+5hSiTtEK0camkTKNQTi+nSDG9R8C0DHQ7aBDj6caPg3CXzRou
	VUMZzMrjKHAPEwDf3uC5VGc77gASvh+Ba9ZIKfjTfmeNAOnoJTYnT1zW8t0YJmSEveUacWYZqlG
	B54hO/Y02xByIu/v2KlIT7W02/Y3qrNW3f0a+k3fX8uQ8mvhHYSoAQd54rRp86s/GzkRztq79VY
	=
X-Received: by 2002:a05:620a:4248:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd467ac226mr3064508285a.48.1747770748626;
        Tue, 20 May 2025 12:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEldE9RxymngN0SkiNE/w7R4kBGpcHXriCXVbNFCA/wbxlYIebBJIZ4sUG/sX2j3pgpIKH5w==
X-Received: by 2002:a05:620a:4248:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd467ac226mr3064501685a.48.1747770748082;
        Tue, 20 May 2025 12:52:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1637dsm2462421e87.35.2025.05.20.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:52:27 -0700 (PDT)
Date: Tue, 20 May 2025 22:52:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Message-ID: <ggx6kzto3qy2blhr5yiqhy37wmgs7c2hvvp4wyfuf4iclk3bkj@7masdrxeaddf>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
 <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
X-Proofpoint-GUID: UMqVZvC1LsIVMm4Z1XqWpJ20zgfFqZDU
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682cdd7e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=ngZlcTqnKCSXXy_N_KUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-ORIG-GUID: UMqVZvC1LsIVMm4Z1XqWpJ20zgfFqZDU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MCBTYWx0ZWRfX3Ai1bfXCWjU+
 Kzu9+PjkIUaXWwPFjZljpDz+/MBCI3uBf8QgybdBPFbUoxdy6KWDgMzlXxAFIrYAOnyO0kOZJiD
 ygjdRCVls/iuBosIkWp4w3KFgF++js2Rlum1FvK6lty6DGuTUlZ9wUrherJKRhzLsocQIwMeqfd
 YPzJvHgbaDuCX0R8xuR7M3FF/ygbrjehxeWQk3wZTI0K6t9+UvYb8gpDH18ODHU2JvwCJMeNUrc
 FA5uykAbhWQQTXFfpjoJz3LFTPa2+jrl7wkaLMHCzLuLVG8+/9p/AQe856OF9BsDAC+a/WFGiqz
 YOCE8e7OxMV8Raetj49KHOZZw25sjUSUD7LClM68Pdx8KpImifhZBaf45nvt5QJxbk7hCoX6ZG1
 KWc4rbRqvSlKvnS672qvP0/U8ufO1xNMJnrPRWF//ylGpOPhdPuvNBjkCNNZp4vK6jgXAZFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=787 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200160

On Tue, May 20, 2025 at 10:30:30PM +0300, Vladimir Zapolskiy wrote:
> Hello Vincent.
> 
> On 5/20/25 21:39, Vincent Knecht via B4 Relay wrote:
> > From: Vincent Knecht <vincent.knecht@mailoo.org>
> > 
> > Add the camera subsystem and CCI used to interface with cameras on the
> > Snapdragon 615.
> > 
> > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > ---
> >   arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
> >   arch/arm64/boot/dts/qcom/msm8939.dtsi        | 152 +++++++++++++++++++++++++++
> 
> Please split SoC specific changes from the board specific ones into
> separate patches.
> 
> >   2 files changed, 156 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > index adb96cd8d643e5fde1ac95c0fc3c9c3c3efb07e8..659d127b1bc3570d137ca986e4eacf600c183e5e 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > @@ -11,6 +11,10 @@
> >   #include "msm8939.dtsi"
> >   #include "pm8916.dtsi"
> > +&camss {
> > +	vdda-supply = <&pm8916_l2>;
> > +};
> > +
> 
> What is the benefit of enabling CAMSS on a board without any sensors
> connected to the SoC? Likely the board specific change has to be removed.

This is not a board, it's a PMIC-related include file which just wires
the supplies.

-- 
With best wishes
Dmitry
