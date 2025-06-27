Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780372D9785
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029671; cv=none; b=VaLG1sp0FMD+PvsmJSZ751cb+qrL89EPv/kvv0YWDSXVcz7cSx43deM6I5+i8nlMTWrYaIGNToloaasrbg8y45zbEECR9E36QCnigKvDwvR8lU3jXjZv8JIHcRTg9Jbhojwsx6sedAx4Ax2IsPbvgANnqdmt2MoqVGu9U9Ym4GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029671; c=relaxed/simple;
	bh=1HjGPrePx9BzLMqlBHVXd9mgOpoGcPi8zMxkRoCatQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyq04vuIcHmZ8z1qDSDZNnC6SZPgJryyEMH0PddafMcXTRDa1wyGldHWT/LkmJHPlnlo5qGXiNyP/UKQRmrXBr7MK8MkuYilu1ugJjtec9GAxaOIsYObMddQEC4G5vjRT+uou8mMyYFdQrxbEmAl0Ly/VpOaILq4dwxxhPmDvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYEXqRg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYEXqRg9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCTJ7N011462
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7B1mI43rlLj5MdjG05K+u9+5onCyxbic4JTto3iPdEs=; b=QYEXqRg927Z++bbO
	xOCZk4H+CYaAZfC1X5xqjlQBv9UQcCADerV5UxGLUsiceRYSggfkg1oqN2qqFpyt
	VhvuW9uy//eGFducA8i9ay091SDCyMibcRcli9g1RWkCkdEdUc9R/w92t2OnihzQ
	x3bBe1T+oCzakmBASiwvuTOjCZQW/WYKomBVs9tmv5gIn1afwjCwgCtPTzzYdP3b
	IzppQ4jdnnQNIWj50/yZ31JK0qi4tMIATnnTZy0zl7PZ7McnAmzXSpNVCWX4qT6/
	dFfXnG5r0LM2EaOfZprDvb4uJq2J1ovAFFnrZQ9/eRNlZt6dLXVoHNH9IoOWH70V
	PUFnMg==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgpuu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:07:49 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cf753423cso187509339f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029668; x=1751634468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7B1mI43rlLj5MdjG05K+u9+5onCyxbic4JTto3iPdEs=;
        b=Gln0nK6YhNcE+Z7XfPDlG+vRNPa3jMsJN5/3o7mW9C4YhT85sBNO74i/k1pS+dBHJO
         98qXN0S1ygQ3X9B98pcRnfG30duAS/kv48aLzOz29aKvxbvvzlXnTCLP+IbnoIW3s6z0
         O9kw4CYoRChdADI7goSbw8R83KWX6FFQfiRrslika1z0DHs1mn0spRkC1HDZQRMl2rqy
         evXHN3j2t6rrUybb26VtOQq3JvYdmUkYqYnR7oDlpTxAIspnaWzD2Um6gzNCZb1f+VNP
         Qy5xfvKEiyc8xPHPfZRE/g51HUjLD5ArO7v0Fp1IhWn2KAuyvmmwKhjMT3FQziKyCRtJ
         RHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtx+nEico8Ij1fQ0sJWFNwHnGHmlZ62/BjiDIl4rBvmT5gW40iNEMJY+zcUd17/Y67DDJsyDhjjw/zv9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRYPS/FZB05H8HbkUlLGcsRzI1jE7P89ICFLNtS/fn/DL7IkJY
	YmlwzolvZXSapaVadGYlu7FE2t7DFP+5nzUXB5Bl4g9FZ1pbVRJs7SoOjegnaGgnNJ4ycpx3fGQ
	ediQMshW6jJzzhM/Mdsq7kzKv3M32L/pDV5PlKEWFPumBOfewfWyI3qHzCARW4vFX+6Q=
X-Gm-Gg: ASbGncutx2Pz0eDmkI1chwq258DVPb5GB+WNfFFxxESxGN0jbeCUEvTmIwXxjVel25v
	YNhT6eb/hFPkhDRkX2MsPctm5Jb1z5v/Ps548ImeulYokV+xRUQvh+tILyfuCY2GzS247NNvImP
	OmPwEWsKPeGVCECDUhwr7gNRHg55k9G6GFCLcyGqMefuqvxT6+D7nJrv/yXrNR18rpCkO8OeQ3w
	Gav0no/b8tTdLIZYRIEEl0GglwSXOv+PeH7nNiYsOmACUBRgAFcGfr+iafOrRgNDvedKuPFPGSi
	tETM+wyi7b599/A4vLSbDMzp6XKGF0IfRy53Mo0zS+yQg4TCMbPk21TROcTXYfXDLZUX2wzv2RZ
	41Fp/AM5bTxqizu/ZntJg3OUI3XiYM+cycBY=
X-Received: by 2002:a05:6e02:1c23:b0:3dd:ceb0:f603 with SMTP id e9e14a558f8ab-3df4ab6aa68mr36335025ab.2.1751029668094;
        Fri, 27 Jun 2025 06:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1Fcg6f7qKMNrYzUxfeKnTHHm5N3qcjPX4yV/7MeF8kJhFcrBQH1magZpQ6jw8N55D4Fh7hw==
X-Received: by 2002:a05:6e02:1c23:b0:3dd:ceb0:f603 with SMTP id e9e14a558f8ab-3df4ab6aa68mr36334625ab.2.1751029667636;
        Fri, 27 Jun 2025 06:07:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ecf63fsm5663921fa.74.2025.06.27.06.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:07:46 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:07:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
Message-ID: <x6jo5xpvqlehij3rybcq26xehmeuzju2mgarnp3panag5hy3ao@fmtu7tgc3p4n>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
 <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>
 <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
X-Proofpoint-ORIG-GUID: dVfScWNWtnt9DWYsemtRppUqD8BQhyRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOCBTYWx0ZWRfX0w8FPgV3MRL8
 IkQvFBPBpIqkn943dgpD6/heSsEkiDGoB5QS9SogfG8poWNOrhnExEsuhnxEVaHCnvyrbzPD0g4
 LqQL6Xv9h6GnEajtyMWxyOpigaEq1981R+Uj5Gtj8mnym9nqqOgg2OX4OotofGxRW/FhN7ODGpk
 SmA9Fe+eVIwUTlWRz3+Xn0s2dV7t9WzTTDwug6vDvaB+0zHclkAUAQ4KX+dMPVscyhHWkWCvdXW
 7Nq6cdkSr7w1InwGDB2TvuNvJpFb1sobBlOv/DZXJGaKTN/BKUkNl5GOeK8KjZV5LP2VoXcQJSi
 u4YtnxYVR350A7HaUJb+77usFRgYOoGO0DgCz1moP5OAb+UfkwiMUr6qtS3hpZsNgrWs4oYf+rr
 zY+mB8AksFPutG2xC5vw8WL2Kj+ajV7JEIXaYEykTuB1UIE1qRS2bhvvAwY6MiaH6z9+MDXA
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685e97a5 cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=h56Vx8HxoSJ7g-UfYxsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=61Ooq9ZcVZHF1UnRMGoz:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: dVfScWNWtnt9DWYsemtRppUqD8BQhyRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270108

On Fri, Jun 27, 2025 at 02:54:20PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 3:20 PM CEST, Konrad Dybcio wrote:
> > On 6/25/25 11:18 AM, Luca Weiss wrote:
> >> Add a dts for the PMIC used e.g. with SM7635 devices.
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 63 insertions(+)
> >> 
> >> diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> >> @@ -0,0 +1,63 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> >> + */
> >> +
> >> +#include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/spmi/spmi.h>
> >> +
> >> +/ {
> >> +	thermal-zones {
> >> +		pmxr2230_thermal: pmxr2230-thermal {
> >> +			polling-delay-passive = <100>;
> >> +
> >> +			thermal-sensors = <&pmxr2230_temp_alarm>;
> >> +
> >> +			trips {
> >> +				pmxr2230_trip0: trip0 {
> >> +					temperature = <95000>;
> >> +					hysteresis = <0>;
> >> +					type = "passive";
> >> +				};
> >> +
> >> +				pmxr2230_crit: pmxr2230-crit {
> >
> > This name is "meh", please change to tripN
> >
> >> +					temperature = <115000>;
> >
> > Unless there's some actual electrical/physical SKU differences,
> > downstream lists 145C as critical for a PMIC carrying the same
> > name
> 
> [    0.085990] spmi-temp-alarm c400000.spmi:pmic@1:temp-alarm@a00: No ADC is configured and critical temperature 145000 mC is above the maximum stage 2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.
> 
> Same for the PMIV0104:
> 
> [    0.086556] spmi-temp-alarm c400000.spmi:pmic@7:temp-alarm@a00: No ADC is configured and critical temperature 145000 mC is above the maximum stage 2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.
> 
> What shall I do?

I'd say, use 125°C or 124°C.

> 
> Regards
> Luca
> 
> 
> >
> > with that:
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > Konrad
> 

-- 
With best wishes
Dmitry
