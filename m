Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18BB218AAB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607076; cv=none; b=lRjF6zkEUpRzDnUbiBCr/xc0eLe59CcE3attTNxOwHo/0S0exjl5+mwGEqihMx29q3B1aAHBr/nd9QmppJOa3XWOYyGdkDWJWOPbZIPCL0Tjv1NL3rty6KIlq4upyWftWxfd44wYjlVsRail/UK66mD1sKog8fLY6Ov6udC8hKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607076; c=relaxed/simple;
	bh=Xk3Sp6BJoGmDDVZX1C8dwi3cwfy3wAIPSXdwpAs9Yhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JddSKJopzxeqp9KXnQFWEh8blGw+Fw+ntvpEqYJiQaHEn4pU1Rn5Hnw/uFZaG4G6RmVImP9AJTATeNEcnMoUMZ8yCesNEp8EbuXIdWCHB1fOigXWhTkcZ3m96smDIVTnA5SP2r6Xpt67AO6T72mnSJu6hTc7nEzTmEPSuhtcsrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoZMyAp3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoZMyAp3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrGi011043
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9ycmtWdw1mtAhGHJSYcNQ5K
	fW5PbvOj2z5I1djYv/8=; b=ZoZMyAp3QbpTs1G2QNa5dWk+t0wtxLTj90QwHWzE
	Ah36hsnx/2wV6owXR4Ev7NebAXTosXxKxlut9mUxShTe4Nx6PAeEcgKG0tgOYSmw
	ViTgXURVp+NuvTeOYF4oDlqZTevuYTpAPL28fpVIxoQu6nzWP3ZSWEZ5t7d9puTT
	uvMc97BbPCMMctoKR1vxj+BcUXry4X+Re0Hp3xlWjeFww7XXjwBiJo8SsK7CdZDe
	BxgpSTl0PnFskC/guOAipes8sHkbZ7BpIXUDQGMDjajA66zsYKf4FxSJLFPkcS2q
	85gvO9tse5CJvOuIIsNTAZQyfBWkguiF7XLR8WwWCzV9Lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j69e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c77aff78so725520785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607073; x=1746211873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9ycmtWdw1mtAhGHJSYcNQ5KfW5PbvOj2z5I1djYv/8=;
        b=E39t2Iqoa3DCmvRdAhwrTIJiUja0Cb4iEa8Z3y60V1W4ewJsRdD0KWcZHQ5lMCS9Ci
         QvoKqZJL7u7Rguf4wL36d/r+8EWOTzFHnEqMiXUB4SIX/btAh+OcV3VK9LapGBhchI8/
         c879G3kQg3jIAgMhlEIoMjpveXsUB9BT/KGpdOqpbioo/5aV4tsOZprylXJtp2NXsWWO
         didFeLSmKuUuOrnJKbbXGeF9CPOb0mpIIBOMSIo475uDNoH2q9M/8N8Xc77DwKr+Mv/8
         nll5SQlSTAZKPa/FSTIOGfliI2Ucd6qxYJXpbwzHExPFQHAaPRf+nP3mOXvIYw7jKyip
         UHng==
X-Forwarded-Encrypted: i=1; AJvYcCWBkOYUSv47E80JCIRln1zGJL6NJAwfLAj3dde4feZ/VoK6hLvmV0HEm4ZSmS97tvf5tFDl76rvAwvsin8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhmQel2XdDbYGdnKA3rC/AYW0Qk/zEtElAYy1UXUjYyE/mioh
	TY7hXTgDDC1w+InisQttpb1bcoQuvMZeLcY/WkDbJdGD0H7WFqiA+CDIUKXPhdKSj2vUOKuQQdi
	VSuHQfHKmb6BFIpHIQCsME7D4xaIjlI3rtAbx968K4tqvcj6XVg3vwz7enPSIloE=
X-Gm-Gg: ASbGncv9b1WULNubasKjk3NDLYU1M0SKDV1Auh9Lv6g+GAfWMAIhrBSmUyMBjlI9AID
	rNNtWdP1ladIOP8hMPFYwtXIdgEPWbKh3etEImpvM0zKaVyNvZH/01VABJfVQ5ZKre9Igt1OqGu
	G4yLQPUgn7nLDuDfKlNcDV6FMROEZri8hxCs0cwTgrrhVHYsa2IV2jil//J4wtdW9wGl02JIb2H
	RH4tTe6YMDHdS3x9iKyVKjWD2l/wcgU1wOnLN6tIaIp5FrowoCV5L2amzQHF84N4yCBvM43ioN2
	Zyb5/KFOTAQj1L0KpXRW5h/QsAZjnE6BvJ3Te3TPZnIW6RIJmPRj0/CSmXaHVBvq3fuAJkcgeNg
	=
X-Received: by 2002:a05:620a:3914:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7c96684b108mr97522185a.3.1745607072869;
        Fri, 25 Apr 2025 11:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgCfAsOCyq06CGmOi0+/EEgnPyEjUIBFlLDUeeOlp0nhMgAvTxmeVrtGr4SRpqobWUin+HKQ==
X-Received: by 2002:a05:620a:3914:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7c96684b108mr97519085a.3.1745607072590;
        Fri, 25 Apr 2025 11:51:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258c2sm706677e87.32.2025.04.25.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:51:11 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:51:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sm7325-nothing-spacewar: Use
 q6asm defines for reg
Message-ID: <hr3sg23xifgebofy64l2zsybelsbl446c5e63i5s3f4bhotae5@6tl35nmeqkx7>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: nYcx1RsVbyA1onYONZ3m1mbhcOAsKv6A
X-Proofpoint-ORIG-GUID: nYcx1RsVbyA1onYONZ3m1mbhcOAsKv6A
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bd9a2 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfXyb8KXroadgiH tqZCGQT6jG0ETQJZ0gMEpFhHcR9oLyzD+guOQc1h9wbyJZEOgzI8Z6fN6ehwQ3vmY3qQocPKQ9y VC9ZjdnjunjSgl42THk3o711d1u31fqfo9b/SOxqaqKB42Og21RNI1JQ37URGktScZCJbe3raPa
 LrYPFfKov74FOrDcCD7gccQ5jN4L0sWWSuXZ6KqJa+9nhElphyFsjU7Xp6o3YUgI0un6708ruWP pItUXUjQJjOtA2gx3HM3JY1eYDOsU4O2PBwpmqCrr5OwvppfzUcn6PqA4Jq0qojojEZmDOE3fmA aemYrtyVjlDLlGV8Wd+OMV7Y1Jap7YF+qwOT7EAnDFCT6z0x5XYZmVH6kBxhc2YIP8olFMaE53a
 A2gylZjRAT4C4oCYJofGD3yY1+u2QVvQ0JSr6AAbLn17ql5bzoG2qUuRkMUE71EjBV9tH6LQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=560 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134

On Fri, Apr 25, 2025 at 01:53:49PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
