Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B90425A2A3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805894; cv=none; b=oeCaXZytCARFML5YUs0Z/WbUDXI6zBJ/L7Gfe63uACUwce5Ug9/Vlq4675iab/9NwMQW0DKBhKUc8AOH3F6h8Ntk3+ep3MU19GQeaxsPD5JNkPwqDCnZuiaLzs4Sha0f2d8n0F0R6/8FIgxtRCWxE0Y/4WHog+W1p0AchYXEvKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805894; c=relaxed/simple;
	bh=TrpLjI9MpzqQQnwGMH7aD9a8yeWdnD3EyQrey7s3Vj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtuq01Ls22eW2XlfU3kzulGPI7nJJaWB1nsND/v+9qJeF8vCBUMr1Acm0lkYLiRhnqp4CZJn2RhMnZZSVcceEFObdn0LxYW43xINt8xZxCK+0JDce/GbY0FHmcv1UZYOPhqU0gR6Od1MLjwTQR2lQnxDP6SUDDYzqK+RGgKXErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/LpIvVf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/LpIvVf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEJHCr027754
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wVRFCalVNNE/Ec1WvsF4J2kOdrYCtJerJyzK82nnhc=; b=g/LpIvVfbDjAqVXz
	hb2R8nOcq9LexBZPOj//w010jShxxa6OosmwmL7EpuPVNmohHBv1sfYJI3rFLD49
	9BvV6Ki/5Tqwt6WJ5SwMsq+Ywyiv+JPIrKgrfTbIUQSP31PMB8Jm8XuzX1UFo5h0
	3LzGKnNywph6kHnjD4nwh6FQGny9eIPeRQcnM027WiiHv9MNMySwHaXDLK1HVD/V
	TZYGX+PttOnH7Yq8EVSbkz1E3S84Z3AhLflNZLdfzVdznPvgErMWYYKGCwTibchn
	FOHPXsLMsZdtXKN4m2ygFZ4t1Id3euuKo7YPaqjj73sQvG6BuLZVXAkB1KVJLJ5I
	hXbIOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec2682r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:58:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097fd7b32so1188199985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805891; x=1751410691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wVRFCalVNNE/Ec1WvsF4J2kOdrYCtJerJyzK82nnhc=;
        b=sYjQPiRhOmf3p0NEgBxe6Xg2TQJwLOSrbzNWnZnPnCpHZeGrvtufO3ggohvwX6ZR1P
         uUaO4nWFDtwYmzor/e/IAP5HWsPMJrKs+pMJ2/4hcL6yaBA7YEM/LRGYXGFRab4Q6qr6
         EJ8fHe9Lcj8Jdpz/sZqA2gc16+ujEpNJ0b3LHDO6l0nRnsTwtx4icDFXSrQIdvNgaeyh
         83Uwt0sAG9ZAUYKrX0OvlrWBfpSzHfDOHR77BTTfFNZ0vEsT8Kee4gbEJOjIbcM7SEd8
         QWGSQfxTKdZT0yL/9sp1DEFiRxycPwESU2oJWkkzk/GSOjEM56WtF3IuW2r4oVdkwdcW
         bChw==
X-Forwarded-Encrypted: i=1; AJvYcCWfZQ9AYwhU6/RgRNUwxFMe8/FOo0F3dY85PfRVxfkGxiNw4W7irCzcLzDcBOj6J6yYtFnMBVC1yfkb3H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQ0FV55airKh4Oer0+uGFuNgbOeVwCOPg/JfL6gyQwbMy8xcQ
	FFs/WMWY4aYlY9621XDks48EbFACKcRMPwGvtl8QJ0CYTS6LkhX+Q12QOPNIAv82B0A7DAuWrX0
	eFv64iVzYa7eBd8h0XGw9b8fQcsNm9MrQKN3JWLU8XK6jJej4lxHg0oRFmbr39LgN9UE=
X-Gm-Gg: ASbGnctZdRzUxXtRLmQYq42SJ2Dja0r2LtOhv5Hlisa2a+n2Gq/ZEOpmCuObJAvuMg9
	yspPq9KVGLNrPcAl42KU3sU0jBPGzP+Vo3Z+aSe52Y55vPYhaCUJsO8j9f1APG60W/xSjVInPSQ
	/kBsfOmi17NFLfqLwT8Yky9M6uFsxvQCVexPrMNBc++MpibXxbUKZyypLnM2G7Tepkt73+E7xAY
	SLube+QoH8Q6F4ov+IImO+WpgN6blcvDGWqpNjQnF4lW6AfjPD4YEbS8I5ZFqvBlwdeOgyOc1jy
	L4xX35JrFwVmiob0CakYsM19c5lZ4XD2yXUR/KM0NjZ1JhdbRVijjxJA4523safcz0ceUbQ4OmC
	s7kztvHz7VjnGwP9NHra9F0YL
X-Received: by 2002:a05:620a:1a81:b0:7d3:8dda:3eb4 with SMTP id af79cd13be357-7d42978e85cmr119678985a.45.1750805891113;
        Tue, 24 Jun 2025 15:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9dsENZOYptEEis7mF3P+kVAQrXssLynZ5FNmxoRHHAjhjn6zoyLuq1me+biIvSDfoEoHbrg==
X-Received: by 2002:a05:620a:1a81:b0:7d3:8dda:3eb4 with SMTP id af79cd13be357-7d42978e85cmr119676285a.45.1750805890680;
        Tue, 24 Jun 2025 15:58:10 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41445b2sm1975823e87.26.2025.06.24.15.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 15:58:08 -0700 (PDT)
Message-ID: <c208ade0-0540-4100-9075-a210d2ab9c5c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:58:07 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 qcom,subsys-name property
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
 <20250624225535.2013141-2-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250624225535.2013141-2-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MyBTYWx0ZWRfX8LFqkOTYrGE+
 kHKk/9Nl52TFpvXl7SKrOiT848ogqNef3MBeEyjSogUET3bqvDv70FzsgKmDrt1xOvGpCfEyAC6
 tSZ84/BHgRYHI41YrU8W33jznML7vBJqjKD3z12W+uvYrxI8D8ddBnSo9ex5EGvi5P7eZMlsLGv
 Axs1yTxOKs5VBVBqSAOGHSRGP4Z0bUqddoMQSvbXvIBg9hpa5W5HFHsoh7bdsUDCaYvON0LQVG8
 lrj/u1pFSKcPwPVrV9xWed1BTzyisuOAwXtMvq9Cl8cDah/GyNyI9ZjFJp1wUoEVfTR34hHUBls
 qb7nMIE/mG+jg3WDSIGkDG70a3wZwVK2hwCMHvam8JEmTA99PZaZ5VTuw6cGxi/detBe+/JJFcz
 YY+WmiWCKYqYNvjBB2MnuFnTGxrKUXMxO8enG2DnkznL2lGJem1ksCzaR4FXB4L2Gxtk7tOV
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685b2d84 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=SYwsbMu0la4PIs3mC4oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: AM5UDZjEw0_qnSrFgWdqIPFpHMAuM58u
X-Proofpoint-ORIG-GUID: AM5UDZjEw0_qnSrFgWdqIPFpHMAuM58u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240183

On 25/06/2025 01:55, Anjelique Melendez wrote:
> Add new "qcom,subsys-name" property to set the name of the subsystem in
> order to get subsystem restart (SSR) notifications.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml         | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 4c9e78f29523..0d1f30fdc579 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -49,6 +49,10 @@ properties:
>     '#size-cells':
>       const: 0
>   
> +  qcom,subsys-name:
> +    description: Subsystem name used for subsystem restart.
> +    $ref: /schemas/types.yaml#/definitions/string

Why do you need to specify it in the device tree? Is it not static for 
all existing PMIC GLINK implementations?

> +
>     orientation-gpios:
>       description: Array of input gpios for the Type-C connector orientation indication.
>         The GPIO indication is used to detect the orientation of the Type-C connector.


-- 
With best wishes
Dmitry
