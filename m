Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953F32E6D11
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947279; cv=none; b=cqJiMcmt+69ovIN9Q+YgGntuExtai4A3Qyu9royW7w1DsvgUXNLWA4v004ccCctBBvZY5XYKTXNcisklSoC/I19PjY8YCllEpHPlD2Tz6/zrdfvLE945DHNabniChiLW4Sn4+eAsHL7J2ggbEFj/sSnKpa7qiGpil2+D1gTURuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947279; c=relaxed/simple;
	bh=s6jU1sXHDJ+SIoAkRoACgYHE64C6JjBjN0FDZ0zZu0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akZP6i4OBUxXX1OptenIwYWlB3B1oYL0OCheHXm8iEgf7KuqNIZ8xQuHDZ5H82BbSeVBbE+2T35uJKQ+2Y9D0fKVGKi+W0krt5t25lp1bDcFlShg1QR5RlJFJSiMLHxwCJLnpAjkq7zyiyyjybzFZq9aBIQO0I0/t2166W5INRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpL7jRUL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpL7jRUL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA1nZR014014
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+N4R0U7vukwp5S4+1i/lwayf9jQJ9BLGw//WHS7jJbc=; b=ZpL7jRULjhGLDwRs
	MAmpKaoeoSmWlqe9/a7PyhzJHJ+VwGGACGaCmHSeSB6HQo1BEtogAmHvnr3g0hNG
	QB8LWpSZnBeGzS/WQ+32obgzML3KN7THZ57WLydhVHV8q0kr77rkym+6gL+FX8YP
	7fV71sZFcDefoo5wfRGYmGvhfLj+9VNBBlCXk5W1dIXvuYsTpXkyxfbxxQdeGvcJ
	Yrlrj+5clm4orhqwzvaPs14ix+QK/FPB5NoDv4aQDVw/x/tYxGep6kz4TWTdjibQ
	RfoLKESrMB+/c9KAERe/EkJ7Z76XWsOzSNI1jX0qlx0bieHYO86h3EC6PPYi4wZG
	7Nrmcw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm224ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:14:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso22743085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947275; x=1751552075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+N4R0U7vukwp5S4+1i/lwayf9jQJ9BLGw//WHS7jJbc=;
        b=KbqS0hAv/apx5QsrWf/zesdzREK/zGITX6sPdP5VoZ1/BaT2mBhHCWrL0A2Gk/PEkU
         8Ej83squofYb45av10C8L7YsWTM/VhibOsdhVLekkMpd7lyiDlKr2XqWHxwGJRCokhdL
         Kz9/6DF5R+ZFw6O6B8+7Us8TIc8SxFjcaq4QGpCHH/HEzbubhBcybwMG8Wfo7EDP6n2W
         HagfnM7DCc+rwjktN4tnzL/AeE2a7Ss/BTfTmGfRwpdbppoCwNB6W1ZqtYergdIzTYUk
         G5+5enD0ZtKBEdFaus4J55C3Wlw5XcU9yDNkKOE679V4g8Vil6sUg/3rG6dqGaTQmPL4
         3I0A==
X-Forwarded-Encrypted: i=1; AJvYcCXaDXb3v+joKwkJSI8ePkEB2SZ5CgbQXwFpQN7EusI/wwXSn3W550UMKPGbky3OSOUXGSC2+nLsy9MYEJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0iodR3sAaLkyZrIaH/xzGppCeUVakgwhIpV2JlLmo2JwaO+i
	sojPrhq/KYRRibotJXocypC+wNxRoR2yrr4Quohfm6yEsdSTGvADphrONDOmdhNT3zFaFdFYnkU
	HvD/qZCcBp5OsHeNt7w6XpPFSEcr1er/8NBMk2UKX9C7qqyzuaRytiZuapv64fgvCtQg=
X-Gm-Gg: ASbGncuJ1NnhiEFKqqZUN3naQcIGqCUQgQFkciHtKZTRivkVMlYaVdEK/ReqxD1g7Pc
	Br1+8QEejGlBCgQOYzWhwsrMaGlAy1HHc9OaaYj/qJraNvY5oUYCPKIDU0FkzkOhRIhNykZkCzb
	ASbMYPFHFS/kWI42856X4b+iJiUUgFFbYVaVN00Z7uLDEkZP1X0VTEGSQ7VN54E2eK/YvpR8cnc
	DAsnE/nm1LRfzeOadcDQJ5PA7hY+5W8vceY0N6CfMkzUr8XBPmdyhRVmxugCLiDkeVdEX4Qh68o
	c2emk3NUnh4RgxKO0kA1sO3a7WdHS2H1hfVx4zPLuciTaVzXSTRiZgW3wDVFlSPg7ZmSebS9BMy
	A40Y=
X-Received: by 2002:a05:620a:44c6:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d42968f182mr425993185a.3.1750947275086;
        Thu, 26 Jun 2025 07:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc0t0Q2Mn9NfrI6NhR4IzS8rzupePtJu4DHDSHjoos+xGBqqXt7a01IDlkiAczEHK+bPfwrQ==
X-Received: by 2002:a05:620a:44c6:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d42968f182mr425989785a.3.1750947274558;
        Thu, 26 Jun 2025 07:14:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320b592sm44184a12.75.2025.06.26.07.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:14:34 -0700 (PDT)
Message-ID: <05a443b5-628e-4bd8-a189-7f5a7ccb7b2c@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Correct the min/max voltages
 for vreg_l6n_3p3
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
 <aabcf5d1-7380-40c8-896f-6ce37944e97d@oss.qualcomm.com>
 <CADhhZXYZGO7Ns6R4JEyrt43+HGBuVwKz8hRiA7cxeTfg6egVcg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CADhhZXYZGO7Ns6R4JEyrt43+HGBuVwKz8hRiA7cxeTfg6egVcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d55cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=5DgsPlyoPy4ad_e3mXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hpSHm56MmkYYrBrEtDOhSfEfcln3h7Ap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOSBTYWx0ZWRfX6TXR6vrifVnh
 Lk8exr+fzfdeHOHL5uJj6T5PDkusQIzJTsQpINV3ky+04bFwe/fvCWoHTwLDNDqJ/Yt8vEgPiFb
 aNcT25Y/5cNw9pEwdazM8LoD42wFnkIWY+yu5MNmZXPizgOtyPIU4uJVqQgWl7Y6FMS7pD+52C0
 boZrIugKtnPTzABFZuWuZXVuJNsFixYODAYTKkSD6MBpOq6b7WSJBaE5SCWM+Zm4bw8fCKNy/L4
 POoAUuhDuBF/AU2Exquv/SQtsmnrmVW7xVxIUHxGz26GJnWNvCHEGY6nqKsqBYpUs+C+RcRCIwk
 a+bCdo2gYNncl4dagVNgDaf7BHVnIWaHGEaPXCQV1EkfIVR/yIEcSygWp9D7ryc/49uNS6t3Duk
 OUylsiKyOpQP26SBVmedwU67RotvBeaf/FnNQUqEITYrJcZOuRMDaASPKMBHZfPmQfhZ7R0g
X-Proofpoint-ORIG-GUID: hpSHm56MmkYYrBrEtDOhSfEfcln3h7Ap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260119

On 6/26/25 1:39 PM, Kamal Wadhwa wrote:
> Hi Konrad,
> 
> On Mon, Jun 23, 2025 at 4:53 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/20/25 5:29 PM, Kamal Wadhwa wrote:
>>> Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
>>> configured at 3304000uV in different sm8550 board files. However this
>>> is not a valid voltage value for 'pmic5_pldo502ln' type voltage
>>> regulators.
>>>
>>> Check below the max value(3200mV) in the regulator summary for min/max
>>> used as 2800mV/3304mV in DT:-
>>>
>>> logs:
>>>
>>> [    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV
>>>
>>> regulator summary:
>>>
>>> regulator     use open bypass  opmode   voltage current  min     max
>>> ---------------------------------------------------------------------
>>> ..
>>> vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
>>> ..
>>>
>>> Correct the min/max value to 3200000uV, as that is the closest valid
>>> value to 3.3V and Hardware team has also confirmed that its good to
>>> support the consumers(camera sensors) of this regulator.
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>> ---
>>
>> FWIW it seems like 3.312v (which is slightly above the previous
>> value) is also supported:
>>
>> static const struct rpmh_vreg_hw_data pmic5_pldo502ln = {
>>         .regulator_type = VRM,
>>         .ops = &rpmh_regulator_vrm_ops,
>>         .voltage_ranges = (struct linear_range[]) {
>>                 REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
>>                 REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
>>                 REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
>>                 REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
>>         },
>>         .n_linear_ranges = 4,
>>         .n_voltages = 32,
>>         .pmic_mode_map = pmic_mode_map_pmic5_ldo_hpm,
>>         .of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
>> };
> 
> Yes, originally I was planning to share the change for 3304mV -> 3312mV.
> However, while testing, I realized that I would also need changes in
> firmware( to allow for a 3312mV max limit). so during internal discussion
> it was clarified that all the consumers on L6N can work fine with 3.2v.
> 
> 
>>
>> but if the hw folks say we can do with the lower value, it's probably
>> even better
> 
> Yes. Thanks for affirming.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
