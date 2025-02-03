Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9EF204F92
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589384; cv=none; b=mkQp/XBfKOb+maQYlnATBfyeA7zRGsUvfc/r8sOSYyenGlIHO0FvyMIzmm7X6DgZT/FaSWJo6TQZk+bwCR2TObicoo9p136+L9ryN0aeEmEx7ddtDt33bLrFKnDP5hJfsmW1d0gf3nTlu2Bko/IQ3okiRQKzdxxsDTBEOe9X7tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589384; c=relaxed/simple;
	bh=lVKl3kx4LOWLOdcpJP2DwV+0GsdcqyVyFVuDMl+hqYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzUS28zFDQ/Otd4xxpnnu0+7sYUtX+yJOAoDjXjQAHZBeq4M2xnl2jwIoHq8+d+XQbgmguYTrne3Iw2BOCCVhXv8CViajM+rYCUmtG7/GBQlK3kNzVZkmx1xPiVYACzDTAsFJ+i+D0tBt4HdPA6120sV51jeEZA6Unp7LnVrsjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuUg3M3e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuUg3M3e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135O2xg000397
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 13:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+RL2ozw+/febQnNeAVtaJ+HN/3HKgx0Z3om8AmanNA=; b=DuUg3M3eBw8nIj/s
	AwdmZPDFQo04FYyMuZPeFPAa6IXKFU+VqwCdIwDmRiwCRKROSCUF1h8qTgrvg0YS
	6qPuCtsgbotsbhQXOj3KmlPogXQp+xc+zMfbMlHehhNes8BYbZN8g/tiLOYbpYKh
	q/wwRppy3e9ls9jTVB8ZeDnJSRCI69tKjxpPD0OIT+E6LWoZZDpDKUJ+E6JYV6HF
	iHCZ9YmFXqaLS62BN4O9zLXVI/pel3/IG5t1/LZtrh2X6DN3kYy29WGga/4hIU5X
	EMXr1EEUrP7IvM3spIbCz77WKnToKalqPkIRXomJs1pUx93Kt+Dq7CSPWC2+zTY1
	nRW4HQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm416jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:29:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d880eea0a1so9673776d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589381; x=1739194181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+RL2ozw+/febQnNeAVtaJ+HN/3HKgx0Z3om8AmanNA=;
        b=hSM4T61GGU5TiEC8JP5e0qOY/EgVbV9KNMJ2vtTMF0RG5ACAoVSh7FCbtKZQKZWzrq
         SoKmV79/fkJxOvyy7BtMbCNqoU0snki/ehtAg7k30J/CiZG46nUC+LrWn+CULGGXrIaw
         vHhPDUYsqBLLZtAbT4ZK46WNIxG1Vs/XM0X6UqluzWSr7xm1TaAwBC+4VeathedHlFrR
         mH0H1wQqjZ2j0RpePNCJcb0QxY0elECVct0IghbFQEHgJFvRxvsK2BRI0j2sqBeidEdq
         atdj3haWQnKoaeHktsaH7ylDLfcGWQTX4WTTIYybjAgwktRktf8lH8AT94U+0uyWkm4I
         0zUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0Qxbh8VbSW07UmSI1ExOIXC/DD+u7eAxvqvgG92n0o7nb108edT1KA15eoxOYvWP0cOgpgG5rHkpPOU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAnb7HPda4XfCSr6ljPxmcbPdNp2vhsVPCnVCQr75PSnH+zjF3
	902f+kJ70O4TzaxxyilCM3XR8diJ53Bw3eetdnbbDYJ+v34ouqdfKsVb0cbY5WkMTmjwwQzV/wY
	T0wa/jpTI1zu0AeUCmuFRgnDc9lbWPD0wHCM9II3cE+E0iebqADthTFdReEECDWs=
X-Gm-Gg: ASbGncvKOmUGUcFa6JfTQSzy8oLvtyapgLhWtn6qTnPEmm3bJ03RoA64wJQNKLgQTyR
	cMSBlI7ynZ4DZrLSar8NpzDUhJI/fi5Ein6uroxeIZogbxE2E3ZDg3I3gY8BLhPEYYB0OPXp0mL
	B3B6jn/ZhyITzAesni/VYkx+CpZPC+JIYFvwJvo2i256Tr3Nrfe2/Gst9sZf3kEnu2kwHS/QJrg
	G/U3pNDLVPgStE2O7F23wljclmmqoO7AgGtTzfzYtRJE7oEuM2YmT5r/sndvw7mqY0rC/Wmv1Nt
	gtC0No4z2HxHNyMQNqo2itdTUgancY63Id7MJCNgLTkCqb9KQ6TZlyFi8pE=
X-Received: by 2002:a05:620a:440e:b0:7b6:7133:b8a4 with SMTP id af79cd13be357-7bffcce469fmr1241937485a.6.1738589381090;
        Mon, 03 Feb 2025 05:29:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqJcImfY/LdS23wOZ2ikLyx+Xo5UzHIbJT6hfg9mJKZWoIM+Eqm2w5eWdyO1GH9DM21WJC2A==
X-Received: by 2002:a05:620a:440e:b0:7b6:7133:b8a4 with SMTP id af79cd13be357-7bffcce469fmr1241934485a.6.1738589380610;
        Mon, 03 Feb 2025 05:29:40 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf9desm769517966b.55.2025.02.03.05.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:29:40 -0800 (PST)
Message-ID: <34dd8cbb-3e1c-4c8f-93ef-43b041804877@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:29:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sm8650: drop cpu thermal passive
 trip points
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
 <20250203-topic-sm8650-thermal-cpu-idle-v4-1-65e35f307301@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250203-topic-sm8650-thermal-cpu-idle-v4-1-65e35f307301@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IwgZHr6mn4WWqdLbnZivXalUXMcgPrNH
X-Proofpoint-ORIG-GUID: IwgZHr6mn4WWqdLbnZivXalUXMcgPrNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030099

On 3.02.2025 2:23 PM, Neil Armstrong wrote:
> On the SM8650, the dynamic clock and voltage scaling (DCVS) is done in an
> hardware controlled loop using the LMH and EPSS blocks with constraints and
> OPPs programmed in the board firmware.
> 
> Since the Hardware does a better job at maintaining the CPUs temperature
> in an acceptable range by taking in account more parameters like the die
> characteristics or other factory fused values, it makes no sense to try
> and reproduce a similar set of constraints with the Linux cpufreq thermal
> core.
> 
> In addition, the tsens IP is responsible for monitoring the temperature
> across the SoC and the current settings will heavily trigger the tsens
> UP/LOW interrupts if the CPU temperatures reaches the hardware thermal
> constraints which are currently defined in the DT. And since the CPUs
> are not hooked in the thermal trip points, the potential interrupts and
> calculations are a waste of system resources.
> 
> Drop the current passive trip points and only leave the critical trip
> point that will trigger a software system reboot before an hardware
> thermal shutdown in the allmost impossible case the hardware DCVS cannot
> handle the temperature surge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
