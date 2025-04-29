Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77B32C17A9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928706; cv=none; b=HafIBC1ziMegwZjB3We50Iq78HLz9xG/i4ITL6HV3Dbk+9Op2JT7a/T9PD+rjzQTVMF9fY+ppfLAwejXpiRGPyuQ7/CNkmZdQJEZe/47dGBvtqvvFvU4YX61Fipt5wzTRtL3VfHQmECn1cO1CzLTrBmk9gaIpNOmge1X3MX1MGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928706; c=relaxed/simple;
	bh=baK6jno6CnUVkoUHnmEbtLiQyefylSMvn3JT1bVnQnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9zUiSnI0MQqsmSX0NUGTmvt5OCQdqvcSOjrHjBScVr5IcrEVAmOc2YbItBnmJ0n2AonLMWPuhJJn+5upsZQrxlIpV255mRntObwHdcJjBXDqRtbG2JsM45Ssn8A/MdeAehxLfM2fqX8FlxZoO+XOcbFcrSmbO7JQIUZcTzlMFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzPs8XHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzPs8XHl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA45gi000499
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rPfDc2j4zIQ8zpqodkBZ1iAk
	HQ4HDml1Yp0gv+Nadas=; b=ZzPs8XHlsSBUiBDfKYd0oHV2su9LS+ytFBkNoqVG
	bYxayKJka7L8CEF+zZBzwkBZrVtHs+5HoJlnjR89+8/pXRRb00kgKWlMQblCjceL
	iF+AMIARq6cARt+S+DtW2UgGAjW+F6xcZJoByZnrztocArqJrDf7PT0FkEd7JmRy
	4Ww4RbEG35i9C979Q2b9CFZ6S2+w2zX7PdrjNmn6b+dwAoSttiXBY6fuNyFxo7R2
	WtXpCCJw9J7othlkqxEmZvRyevu5rWkscV6Aec7KQEVCZ0cw2cgXZWEP1ZKu/cN/
	VZIz8Zx2rUZwHYem/pxYIFJVjyUXQ+He6bu3T4x9wC81dw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mfdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:11:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c543ab40d3so932979585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928702; x=1746533502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPfDc2j4zIQ8zpqodkBZ1iAkHQ4HDml1Yp0gv+Nadas=;
        b=oCHvstcDQR3oz50Pbi6RSikpm6gw0im+TkwBAj2ZRtcjZ1Cl2QGwPv8HeVXGVQFh7V
         LoOynSsto0Nxe+/4bNjYIUFK0ArRTPbCffPTlXMdBxaSXOeWawGooCUMIzS5nRPiUEro
         8jbKjl/DI718oEZ6tixBNEuE66hEv/YIQ970mifhtRSVTrsCAP3HPd1CVlJoJRX/M86E
         VZMZEv7tWRrLkM0bEpD4R1Z+oKu9u43KaV1LvmXZM3i/c+XKMK9njredQWjJNcdyFttF
         wV0P/hVRKOY1/7FM0nhwzUDn4Q4oJb7rN8vnANSXUySnOoURpYzW7+ZHVvDOQm4mkmuc
         PsuA==
X-Forwarded-Encrypted: i=1; AJvYcCWMTMyAYY4/5t5fbT99za29v93pwziN3D7nA3TAGilLizllMd2d7GZimop/D17Ee+C0hEOv0eoLl09qW7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza8gdlnFxuxhKNr+80BxD2dFSC86VNipSSPVh2Rjj7exLPKBWh
	Al937UwaW/2wioDECzrMqg2ENQ/YFhDkvBNUzowcdzEZC4hwGz+iaNBY2Eg8ejRtXhFPQLMnkNj
	xfItR5AcgReC4XtcuyHfU3SiKlLrZwbkTPp7LZ9gkxbW6v37Nc+UoD887ep/Iq+s=
X-Gm-Gg: ASbGncsGVsL6YufZDRcJ1OfiaOj4PfKx4NSxLcCpFpY6xxIme6j9iYVfnrKh+UJQ/q8
	ZBo9YqfXR23VQgiDUVpxyEUstExRBpinYIfqkss6Dqioa+DIUScA5EVcWv0AqylwDp14mXVk1BP
	2Wl/mvHtW1cBVNZX86jlqAIblCJ4VwEA3sQ5GzFYC/MxPwr9fEvk8UhgXgEtCBVH/ycq8q2dRLW
	EeqUGTCnoEy4Dhspnj9diEiK8WA8OjeVPnIaGSHZmQNfq9Lr31DQ+3WZubAF7MgnzgNnbXLe4Ca
	iKZz23k8z94tzToXf2fc7c5nLnVRvs7A9VYjFKkJxN+cyLcFjapGj8yf1xmIdbuFKZtXoyMNQhI
	=
X-Received: by 2002:a05:620a:d8b:b0:7c5:f6be:bdae with SMTP id af79cd13be357-7cabe6a77e8mr347149585a.20.1745928701716;
        Tue, 29 Apr 2025 05:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkEoObvl5ITpCCRC9WTTdJ8+eec2qadspvMIHzjKAj6kGxUV25FPfPKOPPn0iY6tiCGewDRg==
X-Received: by 2002:a05:620a:d8b:b0:7c5:f6be:bdae with SMTP id af79cd13be357-7cabe6a77e8mr347145285a.20.1745928701382;
        Tue, 29 Apr 2025 05:11:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26dcdsm1855850e87.33.2025.04.29.05.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:11:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:11:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <oxckk4kizbml7dy4uvcb2hhkl4f72dp5axmtkwhk4duevhlpbs@4pi3roor6pp4>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810c1fe cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=L7NATBzoXS_OuuUMTpMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CwjmPSwB6O2sFpYu0iYV2wJtU8FW4Tmo
X-Proofpoint-ORIG-GUID: CwjmPSwB6O2sFpYu0iYV2wJtU8FW4Tmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfX2wPTd6jMBwZn FlFDsQNjZGKk2qdCMB8OTZxwp7kPlrMBNJKekUJdszVtMqbgLRQtaDPrRWBmNVfXNqZ/GDaDKjG x8D0ns1sAI/6sS0i7p+Q/r5mYM3JLPtCsgWQzsrFyL8jwoNa3fBqG0HreJnB+VrGn66TvGcXvzG
 85+Toei+orNSe+Rz2GqbjPSmSnko/Ar3TS5ZEGbahKVl+S5p5fgJ1F+C6CJciqUAVLwf1AmWMTY qLFl0t3X7DfLTTbhlqdzxWWt9zxGWpy8MZt1hxe8/e4PxRuZBodep8lWCKFZGpuW8Fnuoh51fD3 r5Psfsy+3FcBmM+GKIVQWfr04Yw+qniKPeAuKfSZX/Yc2KhnGdjv74hG5YE51ZBVehmAgy9LzP3
 TAlK8d3Oudj7jwF/jKygYpJ3pnpMxWTaZ6EjLT05DlbL1J2UZZy9P+Yxm1jOQFc8/3sMGxcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=768 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091

On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> It all started with the support for CRD back when we had different
> compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> is now figured out at runtime while using only the DP compatible.
> 
> It's almost funny how this got copied over from CRD and spread to all
> X Elite platforms.
> 
> TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> beyond X Elite to newer platforms.
> 
> Functionally nothing changes.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (7):
>       arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible override
>       arm64: dts: acom: x1e80100-qcp: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-t14s: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-s15: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-romulus: Drop useless DP3 compatible override

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                        | 1 -
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts     | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts       | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                   | 1 -
>  7 files changed, 7 deletions(-)
> ---
> base-commit: 7e69ad9a1f7ba8554c4d3d1ccbffcccafcd45c2e
> change-id: 20250429-x1e80100-dts-drop-useless-dp-compatible-override-db8562c6b7cd
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
With best wishes
Dmitry
