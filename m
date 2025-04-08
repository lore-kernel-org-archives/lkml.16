Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D402641CC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113071; cv=none; b=R/o66SFX0ETKBR1UuIOAOHzrEDloNPUu71JXKuwVZAa1rPiB//9OqRl/PAomtxB1yLCfTModPLGdvsxq3tZb7KwNlIns9kUGQLHjlK2sGR/A5k87xpwk4QLQjAnsCMCxUK33t6G+CatelaHHDKt22TSHFJc06nw8PF7aHczypoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113071; c=relaxed/simple;
	bh=WrOT0fWauBjGgMOhnAMlyy7tZenwL+/tQlGQFVKiLIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNEqNLdsf8N5zIq5H+81gRP80sobYzVSbbLK/LLK5b1+zc1YilzFOT1ysKLnUQqoVyC3sxgBTOPDmjhPiX7Na4yTYCN60mht/kuno4OMADf3XMPHYIzzc0c5AOD1P49hmd+d3J0vzguvhceJ9Z/U5gFWBhkrMDz/odbkxMtXNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZqDagPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZqDagPC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B01CC008082
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 11:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IrjwLjYpiapL2b4NcQF3cUbc
	sBqpPx7YBP0rGh6mfWo=; b=AZqDagPCYqZnHbZxphYPaTvDUdzj//OxPJQF3MG6
	mYlop+sdD5AG/ebEqB+Xw4Ra8O2OP+DOHDdNZqZWBoN8cS9gm5P8nPodCJYsxRlc
	3zfq/v/qCqGwUjv7AkPRyYiJFEAI4o1jzG6nb80NYblysP1Ibr8cVRT7PnY/l62S
	dpLcjReSj2tolCOXRLw7ug8wCruv1zQq0cHNy14YKbFxRbGDaehHuGBqnMaxwpsE
	hdoPUH31p7k8wT99Fe336jhcdrpkHu6RrZYd+a9lE4PMeVrl7rcn1U2Kmsrvn4N5
	1hTnkI/HtLouIic4tWrocBXPz26dHNDYJqcDSvAt/pzZzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtaynv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:51:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4769a1db721so145032431cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113067; x=1744717867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrjwLjYpiapL2b4NcQF3cUbcsBqpPx7YBP0rGh6mfWo=;
        b=xOUF7OKxcT7sxgIRl3hvNmNtKVhSzSYT7162nC3kVqiSVL6DRqqVdYo+LUM0QD20v9
         4ne0Jb8y7Uf4Oqgj6VNeTmPtc5Ia6qFi5tBQUl1aLiYLxPE4qLq8UmJ7SUZo7WY2+0xN
         r5NpR1FqCtkyg6x0OCKe/pFbypc3tHK9bboK1NKbjYBNbJTs2yqai6F2xH46uG+E/qhP
         W5poE6LKVf4WSSHBmdN1nlX+iIUK0OxFaR1Dhi0uC+Vdk2h3d0Wz3c8Jz/JeT6/+zMZb
         Oj4WmbZodTpnjCnGXOEkoAVm42l/FLdjlBBE1Y3B/OsAMEUCEGTrHXB7RVCP7Y9oSEKG
         tTaA==
X-Forwarded-Encrypted: i=1; AJvYcCWMMIRMBh5OdcCYM+3/kLDldJbo/T9N/g2RbUcI/vrynbPrsjb44xfEv3xFh9W0Bjyy6j20fcrPTRA8UiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytKw2MoWQnmF1/j1PnBMGmek3Iypj3fJC4Fli3UMX6uGXrky3v
	R2cfdtHczzHaRR9D7xr8JlqnVB46D/haW40QQ2Pu7nDsz5kbJ4ajGGK+gWxGC8+ia1uflGec+BM
	gCW+9zdBCv7+BSTSZmFcR2gJ/w5l2MmKXwxSUTxzbzkVculP24HiiEsVFpdtDB14jaR26npg=
X-Gm-Gg: ASbGncvKoD0aBwbN5V4XfrPpNr+rBkFAHV/i/IFRooYn1mWSCmDmfrqAFKl7c+Dz15r
	nPgf78g3U+det6ZzIbGQvxqlTfV6u3LAKWdtf45MojzOuEl9xsXHALBUSfV34QjH+a7F/w6+28k
	brR6Woi8Wx3vVprk2GtAlszIdNicGBj4rJ6D2BbCrRTXNNFkosflbcYERlu/zY6BK3XojM6lccf
	cw7L+kDIcPqgd+oQLkWI0NMdm8f/rLxRKrrIz5YUUMW6E5O+voeZ5eGzP1FX9oeFGJ1OR7b+5zr
	SD+ggfC4ZjLxXvbst14q6BpFYMdj8qesU+jHH/Y/US+PkVao+KdmwcU+vbkjUBbQ/TRfI7nIcXM
	JGtg=
X-Received: by 2002:a05:620a:4112:b0:7c5:5003:81be with SMTP id af79cd13be357-7c774dff6b2mr2505653185a.43.1744113067465;
        Tue, 08 Apr 2025 04:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF52By5kac/rDpLlGHlXOuogfyGJx+/C5ZLmzUghNaX2ahTZuISYrkP/rWOpZVqkkWN8uhxQQ==
X-Received: by 2002:a05:620a:4112:b0:7c5:5003:81be with SMTP id af79cd13be357-7c774dff6b2mr2505648985a.43.1744113067056;
        Tue, 08 Apr 2025 04:51:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab889sm1498254e87.11.2025.04.08.04.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:51:06 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:51:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: apq8016-sbc-d3-camera: Convert
 to DT overlay
Message-ID: <gbhlmjrkh2mavymxivli6c2wknlwlgt7nv3hch4yixufgmhldg@dp2vrwckqcoj>
References: <20250408-apq8016-sbc-camera-dtso-v1-1-cdf1cd41bda6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-apq8016-sbc-camera-dtso-v1-1-cdf1cd41bda6@linaro.org>
X-Proofpoint-GUID: dS6FJlr7_M6Q2fr8qI1BlBdR6l-qhYuv
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f50dad cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=j8Cu_9a8AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_dBoWylQQCh29UQNcWIA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=A2jcf3dkIZPIRbEE90CI:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dS6FJlr7_M6Q2fr8qI1BlBdR6l-qhYuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080084

On Tue, Apr 08, 2025 at 01:38:42PM +0200, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Follow the example of the recently added apq8016-sbc-usb-host.dtso and
> convert apq8016-sbc-d3-camera-mezzanine.dts to a DT overlay that can be
> applied on top of the apq8016-sbc.dtb. This makes it more clear that
> this is not a special type of DB410c but just an addon board that can
> be added on top.
> 
> Functionally there should not be any difference since
> apq8016-sbc-d3-camera-mezzanine.dtb is still generated as before
> (but now by applying the overlay on top of apq8016-sbc.dtb).
> 
> Since dtc does not know that there are default #address/size-cells in
> msm8916.dtsi, repeat those in the overlay to avoid dtc warnings because
> it expects the wrong amount of address/size-cells.
> 
> It would be nice to have a generic overlay for the D3 camera mezzanine
> (that can be applied to all 96Boards) but that's much more complicated
> than providing a board-specific DT overlay as intermediate step.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> This patch was already applied by Bjorn on Sun, 28 Jan 2024 11:45:55 -0600
> as commit ea689ec32bf0d885277d3f58450a85df5149c98b [1]. However, unlike the
> first patch in the series, this one never made it into the repository for
> some reason.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/170646395036.64610.14333204830178417809.b4-ty@kernel.org/
> ---
>  arch/arm64/boot/dts/qcom/Makefile                            |  5 +++--
>  ...ra-mezzanine.dts => apq8016-sbc-d3-camera-mezzanine.dtso} | 12 ++++++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
