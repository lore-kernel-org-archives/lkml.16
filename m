Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71B31FECAF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602027; cv=none; b=g5f15uoUEweCxSQEQtx/XN2C5CPDbFhi8E3N0UalqCpKJHwsT26BbEuXlv6mUv0Pp/4E9MgqP8jHvPICg/CCdlQ4TQypEyApCj2gyRE40nfcE3xXLbZ8RpM9y7NpBAON2Wt9S8WTrhe5lviiNhKyp1uWNPANh1GYvH4cH7RrpwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602027; c=relaxed/simple;
	bh=YE9G8mI28GW/5ukb5vBgVbGkCs/8fgzDRlzPwIB3S2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czi3KDq9+HdEDKxO55AGVWtNSQj398/2c3sPyntSWaoy5O+cswisB9mzhAWnx7v6G0HxK19XUL4uuQ9z9eAZ1NfiHJa5it0PW+oNho+R9O9G2ljXb0sVGF2BHphEvvfduUJr+EHbAzknkQYMmAsLgfQTVKknxaqr1BlTFQIrFBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSFUQ4ki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSFUQ4ki"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKG3d025258
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6atleiqSWOqhZ6HNJhi955CI
	NiLi08p3xHpsze8E6/o=; b=lSFUQ4kiv5h9xhe+e2zaqVS+TZXDcDsPQT9rkiay
	RUs0FJO7vPvjDt7Y/0NtkjwV/FJApSnlcGB+D5YcHMTV9ueUF4yldArVi4MnyHhs
	N3Ig5QOrMcR6VGl7jz/SkLxBNjMsBsfdZ46rRKaBvRj2rMIcTFSGTJ+9gpKiriNe
	a/MGg5JI629x0RdjzHWeTTynjPBMnmv/C1kyKYrwWk+rS9PKcxUi3V4Lrb8NqCeX
	W5rJ3lROmLD+PR7fjm8sIM7RYPIrnEq6WV/9TlDeghDR111AQ+VRhuM7nJXs8CAT
	MgRrEoRwJdYAS/+bmPtT40b113vxZF1x1JMxbHNaEcHBhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0spu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:27:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so312381085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602023; x=1746206823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6atleiqSWOqhZ6HNJhi955CINiLi08p3xHpsze8E6/o=;
        b=ax+uuV5wIG9pk6w2xmiAkxH/BBtzgQZLhgao/u0ZDK7S4J388XzAtoO9aBo9mnUSGA
         gNzlhZPEiOIdRAgUlo1gFtlm7/ecsnmtHUU8dVHz+DUOCLTuS10SPCosjLhsQBKq3PWE
         gIva4pwCfisR4p4cdsD/js+dXZhjLBit2ttmNP8u7v5qWh3llZFgnVskjSrEono0C2eg
         xG4xJmmC+IIqXpgJbBg7T6WbhRivuP5uMoxmtFVWSAIJPK/OdVT5aI2EXkH1V/okZeOF
         XCz+Z8Y3dlm4VklOCtDcKaU4AaByHRTa/BB81zN8RrCGGlzN+bIh2ufrhb7Tb3XSTEhw
         Z6vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/55tE7AU1/onVM/EhZS6uuMl6jnGKqrbh3pKWIx6P6HvxzR/AI7kZUKXz3hyGvQ21WG1zWtqfvV7dIKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16Z9j0MDGgxuPO/zivfzXxzefIHe4e/u0Xd742ypv1B36xP5b
	2fN92OeUzb698troD29vkiMnvSHV6S1BqKbfDXOC10t3cPsPTu0zUQIR8RUNGupzyOUPcAbyxd4
	u2i/vCYE6gRSUnhSQr+Fnz2laAnfo8tRguQ5NNYNMtcLhkxDDZxWqFr9NOED2k14=
X-Gm-Gg: ASbGncuAY3sz+koTmMbMwtOz8zo2nfIBLmFCkA9K3zWJ2gYkE9rCDnh1mfRqOX0PU0a
	7b47IFZf+saFCxqFWK3QqkhJ8GZxc1axwwImSYzU/X8SKuAMJ1rphgWcYkzWjNWLrT8nwd6iltC
	TJX2bxZCq+dVv8gIlWD3k93CA+rfb3Tg/hmK3YWCqbiMl3rMLiyi5PLxLmF6xWJjhGFMWDHvcpk
	oZsu4UfsnivKPXYdmH2baMsXVQ8aTTHbhPHGnx3KwjmMIAXk+n7Ba2bE2LWnABnsOE8nQN5CfqF
	mZIVBR8WU0nHLUVFAdUBX16MZ08yvz3ry5J8lV2EpBzQDPI+akeKxff9t95iRgbsIgv3GMVW60Y
	=
X-Received: by 2002:a05:620a:2a05:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c9607971d1mr452397785a.40.1745602023688;
        Fri, 25 Apr 2025 10:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfcY2I+rhTM4dIprfVROD5tVH+EAafw13oZ005cpJIfKjET5O8mPgkhb+t9ebqxFtJj9FPRg==
X-Received: by 2002:a05:620a:2a05:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c9607971d1mr452393685a.40.1745602023298;
        Fri, 25 Apr 2025 10:27:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d90sm8189881fa.93.2025.04.25.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:27:02 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:27:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, krzk@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
Message-ID: <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
 <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
X-Proofpoint-ORIG-GUID: qQG8awmo0X3aNhJ5ATIQiEvUC9jHyiCg
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bc5e8 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=QtrjCutIs_zDAuGvUncA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qQG8awmo0X3aNhJ5ATIQiEvUC9jHyiCg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfXwrB6fYU0MUVE NvzbBtPtIAzQpjzEnsbCh9A6Ya0qT+l0clypowcH2+g6TejNh/RfPWFPiT15RwdB+e7dI/G8K5N u2j1TJSFGovoqbYBra4UNqspSI/fdhkg9TV2fgPyLHms1ULddrdbbkyMz50f1hjzNJAmA9OdlVD
 ydTXbw6EmMCUIPVOel6ht9paoJOpp/GQCUzZGUFzsSdaMQ23+RTwmF+O6RKHbU4o/OyGkc5GQkw N+uVTQpA/0w+wYpL1unZfiAF98GMz7+SbObq7y43ZBquJoyULa3qL3g8BwOcIoMcYjTbQdpS0V5 GpSPFGgGSVibNS1VMLNGbid/87cb3C4rAlQB7JRPE4CakmXy99aNDP98cmaC1ZrUHKrLxg6hKhQ
 9wyAFb5xhUErAszhqWuG5XJ2k3K/qf0n1ggIgFlr9frV55W2Qroho/noF2dte+4QZMMc9aEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 04:17:34PM +0100, Bryan O'Donoghue wrote:
> Amend the names of the csiphy supplies to be specific to each CSIPHY thus
> allowing for the case where PHYs have individual or shared rails.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 06f42875702f02f9d8d83d06ddaa972eacb593f8..d63bc7dc951690132e07ee0fb8df7cef9b66927d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2486,8 +2486,8 @@ static const struct resources_icc icc_res_sm8550[] = {
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>  	/* CSIPHY0 */
>  	{
> -		.regulators = { "vdd-csiphy-0p8-supply",
> -				"vdd-csiphy-1p2-supply" },
> +		.regulators = { "vdd-csiphy0-0p8",
> +				"vdd-csiphy0-1p2" },

This is an ABI break. Please mention in the cover message why we are
allowing it.

>  		.clock = { "csiphy0", "csiphy0_timer" },
>  		.clock_rate = { { 300000000, 400000000, 480000000 },
>  				{ 266666667, 400000000 } },

-- 
With best wishes
Dmitry
