Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E1B21CC5F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748488303; cv=none; b=b/k9TG+OzUjHSAXLYkteDcGOx4fvjluOdj9GlJsBJ0Ea9nsPL9Um2KwzerDHJ1ME5RI0Mba9R+yGIZPXmApV0And0xLVoiDtN+a4bIWx4JVVAL8g6yxG5s53jblGblhB9W37YjU0fu8C2u8KUzyAYbvpiCKh7NvSpxnJiUB28iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748488303; c=relaxed/simple;
	bh=aaJ6iaqpBEkCCmxAISiX4uGVBDBfRGWsFdy29xehZXA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cwg/Mb8A2B5kLcJjDHhToc0Gj4hoqlthy512mi6G1VjQY32YmRq4diVjDbQcIX846m9hxKcOaT7nr4iZdjykSt3apF0CBoMqUFHIZR23ScOi3nv/FC/tgBmDKCySG3KuT1EFYAY5zre/oQawoUkyrOujZUyECmx4OQT99sBvtUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izhl589d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izhl589d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SH6vj7002027
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2vePQPOnLVdfdrggklf8PTNS1Rsknj1/JpGHx3svC8=; b=izhl589dsj2FHk+1
	RndQ2CwUNyWJqEVf0pgg+eCah8WfBYZCDkBgGTTIjRTYI/DAMJQSWiiSKTbHvgkM
	fUf/kn/ZoKgVdTcTxSgq+zCPMYrHoK7Yg5pFT1zOPlWEQr2e4JeeyxE+lgZVzmwt
	JyWBEVkhRtFr4cOxsICA7xlD6QNIscLT3qBOQuf1KqAVbtUQX4YuMbh2Ea5cWgcB
	7ptXNv+zuzp2qdcw8iIinwVOlNCn0KKzsZAYLJR34QB7NPq1rvTEVEx3oIiXkL+W
	NYs+ccXtg/WTNr7t9VCvrFRX9oYNNjOcq3WxjsBU1+MPRXoJ9+iIXu1DCPjDl6eC
	+rt6Pg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek45px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:11:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31171a736b2so704619a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748488298; x=1749093098;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2vePQPOnLVdfdrggklf8PTNS1Rsknj1/JpGHx3svC8=;
        b=p7DSBAvcjhIVuxNhit14ghuI++2ySL1SVOdgGHd9jjb8Kis3eom4G/IKraGhOitH3P
         h776mTgzZyaQ8qyzByDWnsu/SwGPu+3hebECde8lgf4DrrKMiCoyRhMCwSSOU5Gaw7g2
         jq6ubzyoisrtv47Fi42bwd4j6BgQUth5Zb7qyWV0365Iu4XYny94yanRyUpO13kQhBXH
         VFgyutr7VpMcl7QBwxLlNBNfP/rSUfYnsIAT/ac+7wV/ggDRoAYrCT/HW/E7AS6BT3us
         GfItx6DqXAIiEh32nxkRq+M/ZYVIKAHsDzeihUS6HIhOLXdmLG9ihGpbY7mUZ2RRTnum
         5W+A==
X-Forwarded-Encrypted: i=1; AJvYcCU5AuMlqSCNQXgcjYybfZhNDXBoUv5zHdQp+Ojy0GSOHznrcIIk2aGy4h6fKUHMzf4OxSAS+T2umFVrYmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/2vMMtgCol6Nof9BltYmdPYvGnxDMv7xX8IDXm42Ne00geavU
	gtWjXac36+X206pwxZ3GQ2Q2eMHPjFBrjlT4Daoxm51y0x+VKNWJ5gkrGsZkepDb5wQ5sZABlBk
	FVL4nq3PA6vP+XUhFoMmUcHfvKUVhqYkodMfhmTkFOunhTWsP7NZb8N3Lr/Vo6ewcewc=
X-Gm-Gg: ASbGncuLGefiJ+FHc48YNlU1utZ/zfCruVuWKbyGwGbINILt1wSGrVfhMX0ZKsTsA11
	ZLx2WutCIK2O88A1y+OmlHbqbFnIlyTU2HqrCVnoBsojAG6gxnNal1TNRDSsXAsrOrouSAopjFd
	GaHKVeiUuPf4NSev3GK9rk6zPQY43MiaMZ4tKQLjzgB/NQiC5FrW5y8Bz92vHsx8vWMb+2U7icp
	3grW1FulKcHQjACngfOR0q/fJlm4MHMNWnHUQxXWumIt+345xtGVTSf9wt05mfB7eF/1cEIDzcS
	GkHtYpZ5GR8dOWYXv3Y0UCPV9SxdL4U=
X-Received: by 2002:a17:90b:4c12:b0:311:eb85:96ea with SMTP id 98e67ed59e1d1-311eb859b73mr6274045a91.9.1748488298480;
        Wed, 28 May 2025 20:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0wLnjI8RBCVl1hZDa2G6VR0IFiIxWSSq9ghtff45z6KaBah7kcwO3pIxUpCV9np9pBPkN5A==
X-Received: by 2002:a17:90b:4c12:b0:311:eb85:96ea with SMTP id 98e67ed59e1d1-311eb859b73mr6274006a91.9.1748488298115;
        Wed, 28 May 2025 20:11:38 -0700 (PDT)
Received: from [10.239.154.73] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b91c046sm381376a91.29.2025.05.28.20.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 20:11:37 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Google-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <42be0934-2e97-4d02-98df-b5a03195e8ae@quicinc.com>
Date: Thu, 29 May 2025 11:11:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: flash: leds-qcom-flash: Fix registry access after
 re-bind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250528194425.567172-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
In-Reply-To: <20250528194425.567172-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6837d06b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=m213F5Sxp9nYWYPwONUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kue_6s-ajnI6d0wuF5tO1Gb7m3QoGWsy
X-Proofpoint-GUID: kue_6s-ajnI6d0wuF5tO1Gb7m3QoGWsy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAyOSBTYWx0ZWRfXx/APN9f034DY
 T65oKEoG5/ewY/mE1/sw5SCHvsN8/xdaVTM7C4aRkQzYnc9mt8RwN6in4uIDB6W65yr24VN5n7F
 l1n/TkmG+bEv/kjARdgnkyu5OqFKkf/j4XlI1si4r0hvNdFpP0PobXyjSWGIV23Zrvcpv/POjaa
 U7k947trJ58Y76sIjMbeubcb5aCs3BVSi60id+wmMIWzRlDWv20Z6HfLvbqmkw8riAgNqTyIhoV
 UAuMwQBfrOrv1xWOORu7gNWvD3MnEe5WIUOgGpwPPZdhPPJWL4od7SvdDS01F193grW9gl2Odeu
 IAFwi7TOqwcDRvtOvnhFGakAUA9mcX28ayKZLN8xBMz2E8/9HpCcZTKRNH07lBQno9eJfuYoOzq
 5YNuuLUTIyyAOeCE+4QLJnU/CRQn2jRQMCokTABibJFAHitWovEmfp3FbUmUaimshfTWvFSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290029



On 5/29/2025 3:44 AM, Krzysztof Kozlowski wrote:
> Driver in probe() updates each of 'reg_field' with 'reg_base':
> 
> 	for (i = 0; i < REG_MAX_COUNT; i++)
> 		regs[i].reg += reg_base;
> 
> 'reg_field' array (under variable 'regs' above) is statically allocated,
> this each re-bind would add another 'reg_base' leading to bogus
> register addresses.  Constify the local 'reg_field' array and duplicate
> it in probe to solve this.
> 
> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This is a nice example why constifying static memory is useful.

Thanks for fixing it!

> ---
>   drivers/leds/flash/leds-qcom-flash.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
> index b4c19be51c4d..b8a48c15d797 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -117,7 +117,7 @@ enum {
>   	REG_MAX_COUNT,
>   };
>   
> -static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
> +static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
>   	REG_FIELD(0x08, 0, 7),			/* status1	*/
>   	REG_FIELD(0x09, 0, 7),                  /* status2	*/
>   	REG_FIELD(0x0a, 0, 7),                  /* status3	*/
> @@ -132,7 +132,7 @@ static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
>   	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
>   };
>   
> -static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
> +static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
>   	REG_FIELD(0x06, 0, 7),			/* status1	*/
>   	REG_FIELD(0x07, 0, 6),			/* status2	*/
>   	REG_FIELD(0x09, 0, 7),			/* status3	*/
> @@ -854,11 +854,17 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
>   	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL || val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
>   		flash_data->hw_type = QCOM_MVFLASH_3CH;
>   		flash_data->max_channels = 3;
> -		regs = mvflash_3ch_regs;
> +		regs = devm_kmemdup(dev, mvflash_3ch_regs, sizeof(mvflash_3ch_regs),
> +				    GFP_KERNEL);
> +		if (!regs)
> +			return -ENOMEM;
>   	} else if (val == FLASH_SUBTYPE_4CH_VAL) {
>   		flash_data->hw_type = QCOM_MVFLASH_4CH;
>   		flash_data->max_channels = 4;
> -		regs = mvflash_4ch_regs;
> +		regs = devm_kmemdup(dev, mvflash_4ch_regs, sizeof(mvflash_3ch_regs),

Minor: sizeof(mvflash_4ch_regs)

> +				    GFP_KERNEL);
> +		if (!regs)
> +			return -ENOMEM;
>   
>   		rc = regmap_read(regmap, reg_base + FLASH_REVISION_REG, &val);
>   		if (rc < 0) {
> @@ -880,6 +886,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
>   		dev_err(dev, "Failed to allocate regmap field, rc=%d\n", rc);
>   		return rc;
>   	}
> +	devm_kfree(dev, regs); /* devm_regmap_field_bulk_alloc() makes copies */
>   
>   	platform_set_drvdata(pdev, flash_data);
>   	mutex_init(&flash_data->lock);

