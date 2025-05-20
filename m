Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B03B254B17
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758482; cv=none; b=Ti03AIbX4x940kBP3uijNSd2EKIYXwfLNh7aJAJHZDMvLPTW9AE3fN3drvgVvBldchrt4H4Pyth35hXxou8HyDPl8wVGuQvppVBh6xwJrMhcBZ9RXGluwU40loxUR6ZDuYe6+ANvLgY7VjPlbS4Xnl++wlgF+x9n5YnJ9TRjJQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758482; c=relaxed/simple;
	bh=zpwGDhz9rNuqBod4PWnCiwUX3N0nb1RnjAyBe0DAPYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D32e0Xzitj562DtWpHn7RD8QVXBFDnqAaodw2+aWw3PfjZB5Ge6Bp6MORmrHsmXEwM2Grisix3LhYr/JBE1T1oIZzXR5GfsnGPcAC7sUE2fKW99WLf+aeiASyPemFWPSzq3C2FeFMb9Wkt7HOHLeHZqHZnYwzm+skIRt0/iYY+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqROJ4AD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqROJ4AD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDjwCQ022850
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWkE6wrfAiys8X9HQrhID/AOg4udR5WQhCtdwknEz8w=; b=RqROJ4ADMDc/egCr
	IWrOEx5RYW4X9XZum8bGzVp0XFdWIMAJrqrEhS4wuCS7wtiV+Ywu9ORD77wPNHjw
	WctM/m+clvQJmLdVjQh715QeiSltWIY22qxmn6WnVNYBD07f2Y1f8qMiqWxGCb/X
	neT9mT+6b27O9fBydUwz8KffzOfNc4lpdDmUD9fdQYwYvy7cJ0fpUs6z/nzg0mlQ
	jJ/L2Aq+rPO72/0Wye5YWvjU+XtEWDFVBT0PL78mrYOcf3KBNo8ky4+H13RbNI2x
	2lxz55GxzLNFkngYlsex/CXMFfHuDBXsYm3mhLZAVWfj6D/x7JZGzjWyZ1RBMk1R
	jJj7Ow==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041w03m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:28:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22aa75e6653so41372695ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747758480; x=1748363280;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWkE6wrfAiys8X9HQrhID/AOg4udR5WQhCtdwknEz8w=;
        b=gzMn1Rvfpi19upQ/JVsm2Ap6cGHJuJTXtJ7QOKbevPAak96K4CZejNqvWU8KArIfg1
         o4fP08Q/OxbVavkY/LCT92R305dG4qVuTHF23XP/VNfQTtFSNrXBLbOhqF4ouwN5tT7m
         /RHaXk9dbnqBwmP03FhhwTEZpEXP16zOrkCkvu4OUF+KtGd/MiFI7tzFXZ/IGdPYY+RG
         oZ1lVaq/saLKuc/UzyZJeUFHbCXZCea+5c8013AI1+ciRVd3Dt6tE0Wa+Xz6Gu48b1s6
         pEoGkClTWfOtokNGoNzpZaUbAN0nOgTkeN+qKkqGNAv5ZrLDPNxQ2O+s53gogpPZR5WE
         kEww==
X-Forwarded-Encrypted: i=1; AJvYcCWnkTMwWE5HxCCLQxwj0s/vKgILq4qIYpnCQfHETIEHo1DCtk6HRaemBtQFAR9eY5tcrpem9/EmJscom9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYKpnqqzlb1mRMZEqxYILqvjqGbTV4GxHxVzSZmxhYEJIu1dCt
	C971rMjD2p8ePoxkyDYzQEbmYb8xaQTJi/yq2tsn/FJlmoFIEOS/9Y/JuVaj9v9S3Swx4FvErRK
	NtpzldtjS8NM6dzcLS5J2kCal6SE8Ulv7xfkbknT5tkJvt4rHX43HUV0yhpID1f5zPYw=
X-Gm-Gg: ASbGnct8yVK9j5XVyy6+/Ny9wxvNGBb72Nfbter6O6bn+xeAD7hyUuBUEsCGjmCuRYt
	aqF5BvaUn1FnDvCJSgUkfFV3HOXGNArzClhxCSwl2yNiFd11CJyOpPAiW8MbMIwx40q575G54Bl
	7ZU2IHjN/MyyzOdJ77OpFL5iJlC71R8h/J5pGtzkplPuY838m11oajq59vlLzwm3KVA63qX3JyQ
	3V+Bl9ruMjt7FCN+TsYjrH8GroUOPR9VMv952YVh5KO3Vuh/DnS+q4SufIlXubKxXLQMnFcTePB
	1yajgeGp4DS3d+SiM2G86V4ZyFhZ7s+Ird1bcywoAiBSf6reJ8rMYMXKtiz7Xd9DOOo=
X-Received: by 2002:a17:903:22c8:b0:233:b397:1a38 with SMTP id d9443c01a7336-233b3971a69mr1035225ad.2.1747758479747;
        Tue, 20 May 2025 09:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5eCXMwctL6VYRhnYTfMJUpfPRTT3rczhB1NUrHqOcjFwE3PZOtwEroBxliG5kQjGn1ipa4A==
X-Received: by 2002:a17:903:22c8:b0:233:b397:1a38 with SMTP id d9443c01a7336-233b3971a69mr1034885ad.2.1747758479312;
        Tue, 20 May 2025 09:27:59 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm3393195ad.254.2025.05.20.09.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:27:59 -0700 (PDT)
Message-ID: <748f0908-75e8-4712-86ad-220174c1672a@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:27:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 5/5] wifi: ath12k: Enable IPQ5424 WiFi device
 support
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
 <20250518-ath12k-ipq5424-v2-5-ef81b833dc97@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250518-ath12k-ipq5424-v2-5-ef81b833dc97@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzNSBTYWx0ZWRfXyLSUP7/KvqiZ
 hsPLeN4uBin8AWEIYtsQTo1cG4NrGeGXSKI7tC4+kNG598d+gfRCEHYHnavg79RA096bs3JEO9h
 U/jSa+D5VyGpAaSivSRsXq5jSNFgU5Pzj5GKuuXlGMzuhXlleEfUV2HH39vPIjZ4OQ01FOZTVUf
 c5CotWjVOCWzcbh4t4PcoKmir/5fKA4ITLoe/OehxXEo3rZrIJAt9t8l0A93ZpNIPPoFk82AxpC
 07PSjWUn7SCGEzAhmExdZnET7BQkex3IASRmAG40DuZ7ROuol3vCCdLWvjglSeIBIrde+f4iQq3
 nh562PYBZkh9COBbvk4WaKtps1+aimuXzlul75uCmvz4+Izwfc5nueVeo2QzpBp248IAXaObycQ
 v0eW86CCT1A7uaAmAwh/vjgCfxEccYmigQPM4ta4u7tJuUCTyb0Gd19UHWc9OBq2V17WCPi+
X-Proofpoint-ORIG-GUID: CzTpbhW-UHaSOZKU1Yx2T72v3DuuLRg7
X-Proofpoint-GUID: CzTpbhW-UHaSOZKU1Yx2T72v3DuuLRg7
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682cad90 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=b1i3P6Qac5NO7_78IJgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200135

On 5/18/2025 11:22 AM, Raj Kumar Bhagat wrote:
> @@ -1008,24 +1011,19 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>  	if (!ab)
>  		return -ENOMEM;
>  
> -	hw_rev = (enum ath12k_hw_rev)(kernel_ulong_t)of_device_get_match_data(&pdev->dev);
> -	switch (hw_rev) {
> -	case ATH12K_HW_IPQ5332_HW10:
> -		hif_ops = &ath12k_ahb_hif_ops_ipq5332;
> -		userpd_id = ATH12K_IPQ5332_USERPD_ID;
> -		break;
> -	default:
> +	ab_ahb = ath12k_ab_to_ahb(ab);
> +	ab_ahb->ab = ab;
> +	ab_ahb->ahb_data =
> +		(struct ath12k_ahb_probe_data *)of_device_get_match_data(&pdev->dev);

seems like an unnecessary (and incorrect?) typecast
ahb_data is const struct ath12k_ahb_probe_data *
of_device_get_match_data() returns const void *
so the const void * => const struct ath12k_ahb_probe_data *
promotion should happen automatically, without typecasting away the const
qualifier

