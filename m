Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24405126C02
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749740; cv=none; b=niDh87aduYbaMu797qQpd1BizTHf9TRLfJZ1WwdvHmb8E+gxjPotcMTO/F0cjlJ+hLv9wtLDzlJnzsMnGDcFkrgmlxn7k/IElLX2bHej4+TG/Jcvhlm4bOebHhXBrCZNWlLtKd4msPq2FbKk/0MRzeMT0in3+zWf5i4XRDJN7aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749740; c=relaxed/simple;
	bh=8+r2FGp7NpPSlTBV3si+uV2IgqEpMlSZHG1cbkO+uo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6M3kjJax67iXsf73YoltdYvjMSV9uoO3IkqqWUhQDG8M1bYueLS0OMU5aEhLwMuKzMpb+zIHon4iFHL5Fhq74QUImfMUSuoHOhEJfKGc4eFh6PeViiDZr+p14tXGQgSgLLhIt63ilbZSl3dHe29WbNx3K81wUodo6IgQ0/1Xp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYVt+EkH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYVt+EkH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FItkKd013140
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mU9Ng0qug28Jh4BDCJoMLEhkmy5bjFM2h3Cuyk4xt98=; b=TYVt+EkHPDM6kZr1
	l/mvdfuKM+Cd566VctX17vyF4J8zHALt44KMIRS1OQRLFYbMFvKesP/8Yhrm/zFt
	MVa0Cvtryzmgz2jPKJ2vC0gI+f59CcheYIne87pVvwqSN7C+yR/GQ4gyp5RkPdUT
	du6KcwJ9Lpa86vDA6nw8EBfZuxv9lvAOYFoMNPnd8M35RhQfz13jMjTDAEmrqjFU
	TYW3I3UH8QZVjmzENTxG0a2kwTUTtC1nF4SferYRDgXAc56amifPxJSCFlADOXWa
	F0klwHCpPSecp9rVQaB+EICMC0WweI5mknXPXPA3u5Xs+3nZVqhtq7uPg+NMP2/R
	Qs7A5g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6hdcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:42:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so18304836d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749736; x=1745354536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mU9Ng0qug28Jh4BDCJoMLEhkmy5bjFM2h3Cuyk4xt98=;
        b=OatzQ4kQf1GLsLIOuMwhF4Rye1DM0e3cIOZ4xe4yrdMDsHex7O/ksZWh/Nlr0z+A6u
         rIusLLXa3szauvW0doeyRilxdiaP+hhSSV6awkSBJJ6BF4d0eQ4IYMlB/ORdCDgZDZ7y
         vFKNzKAqP1BQYhLC7Rmu767iUEyq2YZWelgoAgsTj15GvqTX5daN517bDQpgG9S0E+pt
         tDfHT2S1tO3ayymk7cF+SNdL+d0X2Px5doQjK5VSQRZXfVmEiy01FHDAflrfqRcmVOVy
         vYE5Y4oCrgmbtr1WwmYHK4SYLcSbdaNSmc5rqG368rHGlxPcbxoBCgeKY23MFsHNMUkt
         4zNg==
X-Forwarded-Encrypted: i=1; AJvYcCXoKbe333kPPpJhrVyqcRp7o52IZ+J/iM7gGKlYE5vvk/3WvvWEvGWZanB3cS2b8dYx+2p4T4ht1jDSwVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKTOIznPVF6K4Nce17ud5U9yY2eyKRaXhZqPoVb6MRiEcBIFHt
	mdt1onrRth7de5BPDU8EnqVzI+nLn9EmXvUGpreEdDan4KJMnTlGUzgEajqe+gx7Q4/0ftl9NsK
	1wLZ5m7uPazASaUA5OXlQeWnDaRSfOwa3OzgOkfXBrfPp9ubJGozY68HPb6sEGfw=
X-Gm-Gg: ASbGnculXqZ3GkmZI3XFK7LrxRTZcRaMI/8z7FXOLFkip+WzQ4aImSp7/nx7wLxZaBq
	ImuMvI1jgjeEsRBwBT6w646srS+Z/D0mF2ipg8VVnrEjSPYHKLc0idTGvLE87yStm4sOJkUMWjJ
	jYtcg/hLFjWTV1Fvy/aRpjsuUh6NlSURIxGUkbyE7whSm/3pnxwP0V5n2Dy1udilQKKUTP+LvcO
	Zd5+4pRTwLqiCu6HAaJbFiBqiV305zwnvZgnul2Tmr55bgIv2BhuJSRyOgK+ug3Mfb8s4ZfgT5U
	SHQD/g6ILoCDwNilv3OO00n0mFhRA20//fAWUy+pta1advw6lSmOEhuLNGHSIq5OVV0=
X-Received: by 2002:a05:6214:4388:b0:6f2:af37:d876 with SMTP id 6a1803df08f44-6f2af37db46mr1007446d6.0.1744749735940;
        Tue, 15 Apr 2025 13:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYZ8eiWZEjmrL8B6TQt0du9E9d6llGXA7T1hyo8KqVSDqUVr9v7jg73YZI0D4YR1szkACiMA==
X-Received: by 2002:a05:6214:4388:b0:6f2:af37:d876 with SMTP id 6a1803df08f44-6f2af37db46mr1007326d6.0.1744749735572;
        Tue, 15 Apr 2025 13:42:15 -0700 (PDT)
Received: from [192.168.65.126] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd223sm1163106866b.133.2025.04.15.13.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 13:42:15 -0700 (PDT)
Message-ID: <6a60dc5f-a5ca-4e59-803e-081f2bf39c37@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 22:42:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: msm8916/39: Introduce new UART
 console pinctrl
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
 <20250415-msm8916-console-pinctrl-v1-2-a1d33ea994b9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-2-a1d33ea994b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u85qJI5SomyXidQv9lF3upn0Y7WnG74u
X-Proofpoint-GUID: u85qJI5SomyXidQv9lF3upn0Y7WnG74u
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fec4a9 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=24vTPU9P1E0Q2TJVNyoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=723 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150146

On 4/15/25 3:52 PM, Stephan Gerhold wrote:

[...]

> +			blsp_uart1_console_default: blsp-uart1-console-default-state {
> +				tx-pins {
> +					pins = "gpio0";
> +					function = "blsp_uart1";
> +					drive-strength = <16>;
> +					bias-disable;
> +					bootph-all;
> +				};
> +				rx-pins {

A newline between the two would be appreciated

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
