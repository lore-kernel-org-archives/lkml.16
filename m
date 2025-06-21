Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAB11DE3D2
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750497237; cv=none; b=e/Irjo0aFpZfAJSpWSFt+Ya5SYzJisFDmF+Qu7LLkG6D+suUrs7mM3Fs2rSt2dkj/ExoVETJKA8ZlWor/j4MyV0wKwbe/wjKwMsmP/uaJZ2jsTuN1OzDyr0zKlo1EoBxI0jloSz3p01TCf9JUpIY/u9Ey0KE92Hj6zoo3Cegpf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750497237; c=relaxed/simple;
	bh=aNZPfi5MEjGvLVYSe6rsKjxWfVWTq3w5CLVh+Ha6H2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGkZ8EVJdygOrYTrtXrHa8chAJtz6VHYO+RVMpbasxZuqN7U8+Cp8rOi7PEuXPughLheEHTWoCpf6vU2ay1dBhYE+xPquEfR7jqnn0XeX6sDGYoVBKxMc6r6AKmgSMCifWcVdsWIqVU7ky7YuL2axBpBUKIZIaTaBZzfN3YAjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQbKvmyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQbKvmyD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L7pd16024660
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdrgCuFyZGhrHzoOCbhVdJmers1s2mC3v5Ga2/l7EzQ=; b=SQbKvmyDx+aE++sV
	597nL58TAVp2oDiYX2t+tZdsqDGYK5MhIdE0i2goMfP4gVwE+uBkbGgCwclzD8Ia
	Gj2O5gmDaon4/qVdb2nLNb3DPDg4iVR23pkdeBdrCpImshyQd8u+0NBDrIEqEBBY
	l7UY0TbWEMqL/9N9h969wqes70RcwvlIB2M91XLiSos1EHPXLYs42X/Ocy9DCH2O
	uo/zlVQt/KbppTQd1mvN595B6lf1reqbfADckK/L+aQYoF2dTbYoEAwKgpa/y1s8
	tXoSZJ5bUT0xF13cfc3eTrlxb/dOJAMQW6nwZmfNuOpBYEzYCIVmFUwjZzoesk+j
	ppGm1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47drq8g2y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:13:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso79386185a.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 02:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750497228; x=1751102028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdrgCuFyZGhrHzoOCbhVdJmers1s2mC3v5Ga2/l7EzQ=;
        b=WDGWsx6qLDnwag8sBqP0gzCIfSQnrJVS4z3hg5SeBsmfogdo9U4bPAcEtSRpIZqENc
         GhA1M/S1D2KJGvJC7XiSuqpOQ6qgScQ5ojULQ/Yb0Hg8cac4+y8f/IjhCSig/+B1TqMl
         8rj4xeoYDCBBvHjkZ3J5mir29xGw4h+WbISNYgh3WELjyR2mfCbJ1vKMbZOXsou69N1P
         dFxfeMy2l+4zZB4UGdOxD90Ei5+RxeWzaRhRnft/FbyFhRo/MO4o51ByrtA/bUKobF/F
         sl9pd549LeXk0xJlJaC2kshr1giJekL4IBJX/yufv+ex0jmjP6EFy0w6lcP3s0yKhGhe
         6hKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL1Ff/Fm+1Ym34ICxZ1lO9wFOjv4mYnZwKp0VQlKW21uTQqdq/B18pMPShmWmbd6WgHXQxE+V1Su5gmDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIICQfvG+4rD7ufPqMaIJhKBKLRa+NtWsCF9QldStSHXiETFxG
	ZuMJcpfFTCpi2Kq+FalyVTAjvloPXhlBwExyTuq+L0a15lWgBYzofBSErFekZVgROGd0lwn9HJA
	3iDu2fFLRj7Yqx8+njImi4ehlu6rh99YaPqhdTilVX3YtvoenMJTuJeMqi36bbRWVNXQ=
X-Gm-Gg: ASbGncs7FSleyexryyubx2R3ozcchjV7AEJvYEEL/5kJLzM2OMWt48NlCSzUXAOxUlU
	fxEwOAy5MHaknBX09YvRAF625HPmk497cGmyO1ZVd2vqoJJ4lbmadnojuQish7BzOgSIIl7tA4+
	1iqhAlBunOmK0bwHl1s+Pd1bEIyrFbqTEzG78HZQioGlWb0O3oe20iWOfVxJNzadQbEBPFaXOAB
	2N9VcrfF48ISILAFkkOte6ckSF02XXlB7ij8qXTtHst5m67CsneS+n6rZ0eZ4vort+9p0gRiK2g
	51fHpaB2d+reWvyp7s7B2Tx9G7hFt8HEn3i/UEpi5+RwO5RCggUjtUpsmfTuBu0K2+VG0sDVMr4
	3Ig0=
X-Received: by 2002:a05:620a:2b4d:b0:7d0:996f:9c41 with SMTP id af79cd13be357-7d3f98c09e7mr345903085a.1.1750497228293;
        Sat, 21 Jun 2025 02:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyIiz3szvGbH2qSS693ex8SUlj+1QG0R07ppmiIPkiWKJZke6knT/gDKybEOK5kP/nw/KbKg==
X-Received: by 2002:a05:620a:2b4d:b0:7d0:996f:9c41 with SMTP id af79cd13be357-7d3f98c09e7mr345901685a.1.1750497227887;
        Sat, 21 Jun 2025 02:13:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a1851450bsm2799894a12.12.2025.06.21.02.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 02:13:46 -0700 (PDT)
Message-ID: <29748d63-0166-425e-98b9-5cf52db583f9@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 11:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2
 shutdown when required
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
 <20250620001918.4090853-2-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620001918.4090853-2-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1wbuiZmjDxwOWDTMtyg_Wb6KSR2RP2B7
X-Proofpoint-GUID: 1wbuiZmjDxwOWDTMtyg_Wb6KSR2RP2B7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1MyBTYWx0ZWRfX8jDVraVzOZje
 EEHLyZFTyVgdcyMVsDS2Psw1ap2vgfWn2+LArf1bRk6ekDbQYDDGMgHc1637ggl0bmFIACZe8nB
 CJ0OmKqDvjGAZryDK3fWOFl+fc67Ba/Oi9CAnyYfS9EFowc1b5n8zc/pY9ZX1VHosuK3tP8UR/j
 9f6JqIEGUwAA4ftPI1vL9D3CUrmReniJtse94QpL2rf3vvKlvSByBc2a/ugjkGbKJD+nwVIkw53
 QGtNlohD+oG6yeO3iWO/dPPjpXJRTQ2+lPXjbb+iXfbII3DX26yb34Rk40HyVj9ygAfq1PYLUYP
 ev82RCtGe7gCWldNMs6W1VlGbDl20HMyslQNB/wUcYyPd5KWqvx6fHYaaMeCTYs4dBKRvE+2Si7
 qokOvpkk5nThbaSP8tAh1JJqfM5M1rWfvAu6nM6HbTOeJ0kRBzI0Vd2oNZpf9CpvUeDZxfYL
X-Authority-Analysis: v=2.4 cv=Kr5N2XWN c=1 sm=1 tr=0 ts=685677cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=buOH-We6NtgwU1KSyRcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210053

On 6/20/25 2:19 AM, Anjelique Melendez wrote:
> From: David Collins <david.collins@oss.qualcomm.com>
> 
> Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
> stage 2 automatic PMIC partial shutdown to be enabled in order to
> avoid repeated faults in the event of reaching over-temperature
> stage 3. Modify the stage 2 shutdown control logic to ensure that
> stage 2 shutdown is enabled on all affected PMICs. Read the
> digital major and minor revision registers to identify these
> PMICs.

Can stage 3 can be thought of as "hotter than s2, need to take
even more concrete action"?

> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

[...]

> +#define QPNP_TM_REG_DIG_MINOR		0x00
>  #define QPNP_TM_REG_DIG_MAJOR		0x01
>  #define QPNP_TM_REG_TYPE		0x04
>  #define QPNP_TM_REG_SUBTYPE		0x05
> @@ -78,6 +80,7 @@ struct qpnp_tm_chip {
>  	/* protects .thresh, .stage and chip registers */
>  	struct mutex			lock;
>  	bool				initialized;
> +	bool				require_s2_shutdown;

Let's turn 's2' into 'stage2', it's not obvious

[...]

> @@ -402,6 +405,12 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "could not read dig_major\n");
>  
> +	ret = qpnp_tm_read(chip, QPNP_TM_REG_DIG_MINOR, &dig_minor);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "could not read dig_minor\n");
> +		return ret;
"return dev_err_probe()" is preferred

Konrad
