Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2B5296D0D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722408; cv=none; b=s8hO4eb12YIUbnTnPB9F/5nzerHuOFEo1DLe9v76nCROFPKUa3Z/g0E9b+ROz5lBuelOqp1OJeuYzrw4XmhSLsA6bEQVxz53oJbHAVpbwjR7jssnxBpnvjCf9Kf+9kYDyB/oAcE+5VN9UkbbirOjkEpYY7E2JHQSrDqAUbwgULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722408; c=relaxed/simple;
	bh=LRjzUk98Ay4rkH2g63a8V1YSrPWUfgx7kW6KTmPcAEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh3W5+G1ldNUUO+f7d1R/7oCMRQDe1TVQ6h5Po+8U3ypfxza9kELbdb6o8R9MEPF9RYHSRueEIMiI9V9JKYMpd/OAHBQ2ulKDIujNRE92DKjlZwVpIv/p5xG2ITZQe1u7wM1LDLLfKEf2cDvW6GL8ddiXJdd9aQ9QOcF6ZxdG1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2nHIshQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2nHIshQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGNU002198
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I2yqSqYT+BQkq6vUzZFGc3Cc
	/VnsQ5Jf54JehSpetyQ=; b=J2nHIshQR8meGGBMCwYgRHBSmviXNlhHcweEExP+
	7kE2ACr3VXl2bCUVD1I/D33Dmk2dR2UXHMd3C4bcwOhgsEVO5m6WCHQiAEu7/gbo
	Q+2XE32kgB2Y67nI3HwoIw7AlgfqdQLBCgKzT6GsXnrjR+nAb8oAVUCJ5Z/RsrMk
	LW63lnLIOk76b9XrnKQ3MO3t+VgtKLRy8nLundyhThVbNw/M8JlXzkmtJt14olvo
	1u0OV3JoZYGXdKFi/LL6fx4hG7W1xxrKwXsz58JtBhiC37vfx4jKw7e4bIqwLkHS
	MOx3nyQxXOMIZmwg/syCVtxAVaAS9dWFnElLaN9sNAJUCA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vg8md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:06:46 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5d6c997d2so52456095ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722405; x=1745327205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2yqSqYT+BQkq6vUzZFGc3Cc/VnsQ5Jf54JehSpetyQ=;
        b=WmM6X1Pi16WBE3UKEv04nFE1XhoByFr4jiX/T7ESE11eEnRVYjSas6r5LRHw6eeZ3v
         doogwyPrXn3ajdBwv9LEDQZz7c6OIoqrkWW/2+iJxWgFkGSUuCuBBlqyalpH36JwG53G
         QwwO/JpPs14mv7QJ6nlcTGIhS1j6a+ZfqfODF0EG3UM4slAHbatWEkwpXcJHoBBvhq7T
         i11nyE3acupDNirh7uDAcDTnnxik8fJutsjoQCpoxV5A8V+nHbDFwJ/D8iPgSBYjXo3o
         WiiFTkSFm0EoI6TyqWCKTKv79iFinbzO3UT23hQtFstM866q202LMdZ4qKNoXVzfDgGX
         K0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVOfIFUWwObnQEU/chrY4x/ia2YMa4oLPHSgXnEgtnmTKFO9WnT8Fnbd3CdDOw1yJxSW7rW4UuW7etWR40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/o0UQ3hwLmbyNCFPoUDqJIl++prIun6NqNAX3tDrFyaZFQvXe
	slVq5o2IkE265l0LJHQsAfJXNkUQG9gA1Zowwx4r3socURRZe8eHqDQbOhB/w/ZJsFK2fvI1T3H
	zheye4h4ChZ5Gwkb4Ernf9JyMe4JKfJoLBMTlLukl+iUVFNB6nIumrZ4lHXKzyvwtNWF+joslVj
	tm
X-Gm-Gg: ASbGnctCTeZh0Gzm6U08l+3pYq0is5gV1zfzBw7kAG4RE8YRZ4EJyBgNLnIk4ZHR6b+
	6AVcVyuvIymupIgv8t8sBqdFqskfcHX6UtMQhSC7178sdovAJ2qq7TWeCnG9tSRDrCYppC82w8F
	ieWOFMsuV0dSb+fnVytFVV3ZqcN6SAC9PX/q3T19YKNCep9IfldCNuJvPTRnorEn59YEmAxxyua
	c3hOgVNxMyBK4ffJ/FwbOCoFxa1Gc7kHay24fgqTWwky9TfrmL/gpsaMm+BytRJ98QVqgz/q9Xy
	R2qmrTcOo79Kh7zhNZWF1EWtc3ir2U83Avk6otYN74OX6Y2Djr3IPmt6C5nh0FpykgVTZfZCU1Q
	=
X-Received: by 2002:a05:6e02:3190:b0:3d4:3d63:e070 with SMTP id e9e14a558f8ab-3d7ec276433mr153251985ab.16.1744722404749;
        Tue, 15 Apr 2025 06:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyOdYuqVfRNyq0ocgQys9O5xZSGLeV0wJ4vgaj/T3BvgjrDcLaVrzlSZ7ZrvkI157Mweo9SQ==
X-Received: by 2002:a05:6e02:3190:b0:3d4:3d63:e070 with SMTP id e9e14a558f8ab-3d7ec276433mr153251615ab.16.1744722404449;
        Tue, 15 Apr 2025 06:06:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d12342esm1412252e87.50.2025.04.15.06.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:06:43 -0700 (PDT)
Date: Tue, 15 Apr 2025 16:06:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb@connolly.tech>, Dang Huynh <danct12@riseup.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD
 card detect GPIO
Message-ID: <p5hl53fvmjdcufgigobobkqkjgm3xxigsxbot74qijejx7ftuy@cnpncgr2krnz>
References: <20250415130101.1429281-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415130101.1429281-1-alexeymin@postmarketos.org>
X-Proofpoint-ORIG-GUID: H4q4DShmE9xkNRQvqhz9EVOqh5TWKY-Z
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe59e6 cx=c_pps a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=TpWtbmxy4yRKwG7gqU8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=Ti5FldxQo0BAkOmdeC3H:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: H4q4DShmE9xkNRQvqhz9EVOqh5TWKY-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=641 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150093

On Tue, Apr 15, 2025 at 04:01:01PM +0300, Alexey Minnekhanov wrote:
> During initial porting these cd-gpios were missed. Having card detect is
> beneficial because driver does not need to do polling every second and it
> can just use IRQ. SD card detection in U-Boot is also fixed by this.
> 
> Fixes: cf85e9aee210 ("arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD")
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

Please drop empty line between tags. With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 2 ++
>  1 file changed, 2 insertions(+)

-- 
With best wishes
Dmitry
