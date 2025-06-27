Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340C294A16
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027209; cv=none; b=t58J4nvHe4gwouJGYbG47pj9Mr3Kg2hgbb8dw1SKtXWHdNp/+/NGPeqnhTXxnH1z0HRX4RMk+U1zlqC57B1TihiinLMNhHsgwS3iRI9/AaAjv0FRWHcClGFzNB2onZSlTFmTtgm8LC0j0y5c7P45GRHPHpL7PKvkoCyDipCE304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027209; c=relaxed/simple;
	bh=uvLf0GSmDfBqWnfb8F3nJPftkgEoswcxXdrp9fik/Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAIMht9yH2oYAn9PaKEt8yT6U+6ElliOx+w2wCqvKORTHf/JJxN4SeZWD/tg08p1Wu7uNO/iwIbAjZR6MuOR9RZ5nyoVNIA0LbFuNB5SOC9mZJLYoAowjZ9hb16QhHM+kLg36HxQoeRf4Pk1yrYcS2XearhusLaE+45HwsnAXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+4QH8Yj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+4QH8Yj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMXBj011364
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YW3xJyw4MXHu9B0GBzc5gHoDvKGTsk+fsKdR1a1sIbA=; b=O+4QH8YjgyPItHjb
	u8d63KLj9Wxt0oJLsOq+kn5tLQxNBXLp1EZRjfpWs3BlP+TqGIwvSU8XygJ5yyFX
	ChFVIz6cafe0XdrC6HHiWqALXr4Zt7bdhx37EMErB0JXSXBc6EpKRcaajgw3Xyhx
	hO7VnbClwmiEz/eX0TELvbDeGwSXb8Oo6iEat2o3v1lS1sKGONLqWtoFz1bF/pQS
	mQ/tj6+OkwiokbEFbir3jUeVakc1+HmqNdJl0DkdMRRsm8T3ZZU7NLSEL5vs7GoI
	MMYSmW+OrbvVvBkAOB1iiZn0LUi4LIB7FqxSfjVNcwfSsM658NIbRQcpBcOU3cCJ
	0KystA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgprjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:26:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb53b1e007so5154796d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027206; x=1751632006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YW3xJyw4MXHu9B0GBzc5gHoDvKGTsk+fsKdR1a1sIbA=;
        b=WM4SOy2+37tLXAwRhkSWrSvqhFaJpfiWqG+hCKFtxKixPIYgsF252rwa0zzx/delgg
         3ACZ+BHZ2F7OSyOLAgbzNRUmz02ftLnJt0ogevEkQEckROIppaX4PFpKXe0eg5DmXPg/
         INox8dEZep9w8h7PPPoTUX1mUwyY3/6lb56Yl2ykzdNieNck65wsrKSPDb9VanAHsTnT
         nxj4xjA1pwIe78j9z9BPTKWyNN4koL55ZBlpL3rl79ATzeDsjLe1O5i5CvX70FGWwkDo
         SF46oMQmFFtxBTAfGT3BiNEFlRZ881DNbG5wmyVfviMU32SEcBcY8mXfGhg1+YQWUTHp
         QXlA==
X-Forwarded-Encrypted: i=1; AJvYcCVAJnQ04T6lybC+NAZa+nhpr+G3yAWKwQ+2AtUrzEb9QGtNHdA3jca9791/95MueHWAqehPTAbJqxIvGm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Anx+hYWtTXqwoLCcqxCAswc36MocRDYjIHoXUoxLpuf7MgQb
	Ua/HDdLN4CU9hw/+//xn4xLD/SrVVuZRAHgxTLftnxyEU/1Ebp8CHV2e3RlessxmQeK8dI3WX4v
	RET5vanKCTsELlUVrpV+U5zYz6V6c1GoD/cu1OV6fBaoRDpM3Wk5SXfu0sU4mpmLJknA=
X-Gm-Gg: ASbGncuOtqHxIv72MDMsiilYCfBp6zSAdLKcZhegD2kBReNlijeMgqNfRfaDzZRKEwI
	9U8NwxbXUptlLmOcPKMtQwDD3QYslvoKzVRU3ssk/K1kxsLXStAgQXRDHrF63sAOllJs+ynoBUN
	ezEQCN/g36j0DohVc478s7BDonTrlCc+xuEjxoM9DGbPbkj4NERkYUDUCZm4edLr6Wccxmd93Yx
	1kWqil/eB5txjTiQ+AORDuCwGYPQ5KIqAEK/KjVOiFNkQTTheDRwR3X8g4s2fXehV2rgn7XKhjw
	3i8RAIfZzn5drm+pPzAjKG5m6xpmW5b7DfUHyAYsB6JPH6PaORd2PiwYQvpvWCGwChmPD0PPg7C
	f6P4=
X-Received: by 2002:a05:620a:25cc:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d4439e23f5mr154618685a.15.1751027205909;
        Fri, 27 Jun 2025 05:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/bh4wpr7MzQxlOHz+0jxOOse9nBDfqf6PABTa8SnfEnGAbDpv0Z1SKZKQLrLB1c23nS+QmQ==
X-Received: by 2002:a05:620a:25cc:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d4439e23f5mr154616685a.15.1751027205192;
        Fri, 27 Jun 2025 05:26:45 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8319e706sm1467294a12.47.2025.06.27.05.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:26:43 -0700 (PDT)
Message-ID: <f55a057d-2cdd-411e-97b9-5ede1300a4e9@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:26:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP
 CRD
To: Johan Hovold <johan@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
 <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
 <95c46d39-5b4a-46dd-aa73-1b3b9bf81019@oss.qualcomm.com>
 <aF6NUeNLPrR5vqEf@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aF6NUeNLPrR5vqEf@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kt2sCTBA4qXQzKeSAsJ15DsOgbR9pqMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMyBTYWx0ZWRfX+g+V7+aEAde0
 T16lKuZcr7JYt6wFqELuryJNjv1DnqHEU7SncXNhStO3S1UHgMYSOOw+l5ONMGl7CuhP3KoRz07
 /y2LFLKzGJu3pAyqRNsyA41KtOlTMBY9BL/oDluscsP6G2G5DUoREuswmijRs6ZaUuCLggQj50T
 rgXkclHZuL5CRJ7WT1f16hRgipWrNhkaFyc1rFfhOY/LmuZptE6HZDZ1Pk8bHFLA3HxNMjeuP7Y
 8VtBvEWBvAvG7YZTSHvuLiyzUYzrlHjr8hsHiE4l2q+BzXT100CMO71BMTGdEm8GxAX8iGjL3G7
 8urjH9sGPQRP+nfGLQUgcswZONYp9h3yE5TH0TEptR18NzygFTuJ8oHqaN/QhT0NY1AyqYZPbs2
 eoJl2zf5SBEIo+yrxAQAXJwAt4XcfwoOcmQy7fAVPbnLCnYhH13PeSg12ATbgfIYJbvUOrjR
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685e8e06 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=TYFmBxuQ-sYf0sw0Za0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: kt2sCTBA4qXQzKeSAsJ15DsOgbR9pqMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270103

On 6/27/25 2:23 PM, Johan Hovold wrote:
> On Fri, Jun 27, 2025 at 01:54:37AM +0200, Konrad Dybcio wrote:
>> On 6/27/25 1:34 AM, Konrad Dybcio wrote:
>>> On 6/25/25 12:53 AM, Dmitry Baryshkov wrote:
>>>> As reported by Johan, this platform also doesn't currently support
>>>> updating of the UEFI variables. In preparation to reworking match list
>>>> for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
>>>> variables.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>  drivers/firmware/qcom/qcom_scm.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>>>> index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
>>>> --- a/drivers/firmware/qcom/qcom_scm.c
>>>> +++ b/drivers/firmware/qcom/qcom_scm.c
>>>> @@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>>>>  	{ .compatible = "microsoft,romulus13", },
>>>>  	{ .compatible = "microsoft,romulus15", },
>>>>  	{ .compatible = "qcom,sc8180x-primus" },
>>>> +	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
>>>
>>> R/W works for me (tm).. the META version may be (inconclusive) 2605
>>
>> Looked at the wrong SoC META table.. the build date is 05/25/2023
> 
> Could be that my machine was not provisioned properly. Do you boot from
> UFS or NVMe?
> 
> My fw is also older: 01/10/2022.

The machine has UFS, NVME and SPINOR, however the boot log definitely says:

S - Boot Interface: SPI

Konrad
