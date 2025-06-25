Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7577328980E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842546; cv=none; b=MiofpPORBGZ32amzyRflFQni5J2pgCwfdH4AtuGyAk6g35XJKxu3pEInqGlh9omOM3pmuuuVfBEXqZTUG0Ajl/7Qmo/QFMCcrb/SPGYIS3k9nBWohsNrawF7BJMNj2aVrDYVVErTazXZroG+h4pA7EADZEov6/HDXpcVDRCkmPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842546; c=relaxed/simple;
	bh=ua23f12yKTPwtpt0JlvjEXXpjbyLGPgunHNRHKA0bv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdy63xH7E+bDywb4qot4qcutpktPjRik84YR3YYYNSINxyM4plmYSpYj1/XSCTpL7b4XZ15Zz6S/h9CLUN0nKa02u2q7XetpBj47933co49wzxBi6TnNeb7BUmBp76xIa24goyxJ/cddfomXKyCkGm6nRBqd1SBoUJRNlM1r9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNy1UpGq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNy1UpGq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2x95X024850
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMRNxJZ8smunB7DMnFgJ6mTwhifmu2C8+bZ8Rt2d4q8=; b=MNy1UpGqKsSGAVfo
	W3r8NIukSe45r+e70P+YD+Gsnai3BqvLiWiODAAa//S+OoIc/BX0B5ApZxwnH8kA
	BI3tldXlZSm7a2FSwHWygUSpMI1TqQ6JQHT0Vti1JLKcjj1rBLEY4fxbutZ2a4TB
	HTzNrm825ziKv9g1YaV3Av/yku6qQnu/bhVppvhYalC8gF91a+Huo1HzUe0igs7I
	7TsU/j1km7r5jkeGX5rd32ufpFsAcfqTwkaUuILieDpvWGbN9MiNMJedYJ4Scdqp
	pyGGdcp/1g54Zdz5ejcqi5pyvFcW55ohvkzG2t5LD5aHE/IwkhExYeb64b4Z8IXw
	96so3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmrw2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:09:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce66d7cso83530555ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842542; x=1751447342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMRNxJZ8smunB7DMnFgJ6mTwhifmu2C8+bZ8Rt2d4q8=;
        b=foBAyB7OKUI6DXK1pPl/F/+DsBC4hsFN9reZUc/cpWYcDZWYj58Ixv9yo8BcUvb0Ff
         O+FOz8acZFUe8aMJPhIkPatt4Wrs6/2UcLH2pj0W4TCNqbgxKjLerTG+J4ComhvS4Op1
         4NVGcnNRIdNN4iNrdmF88wx4yQa42OrNYr0L98o0Tbd3ClpHd6PLKAqOt8PGxgXY+zLM
         6lPaMCj9TV/TIgbN4BkE9TjujVQkODbfiWphI9fgwomu4vvJ8dfEmxbt5dSLQ88YDB+e
         d4/spW1Ng95xB03GRZQ/LJcVXytbHtZiyCrpa+O2duUE9VZHKnEA8Hp4U4sJfX4OzweW
         PDYA==
X-Forwarded-Encrypted: i=1; AJvYcCW5xuzbQQaqH6eqZ9sTqlQPoeN4DvLzWDs4vJqseFpJyBdbJcBuaK1xQswd8Wzd/iy2oVl/0TlLxPOlsCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmR8jt2r5GTEaFZD4XZ0LXXnU8wyPPFCKnTIAolWiYPoJk1dth
	761j2XuQmYzMiLHUSwJej6IZfeCblthIUIBwxh9Wx6k1brQ1dvboSKIcYNSloAd4aEo89te69tG
	NDTeA+0rf4HWN2mfy2YZ7usOSN1zddavx1SLZ9yoVDWLtO3VAm6DaX8E5xvcsiv1c470=
X-Gm-Gg: ASbGncsk7OSGg1OspQsFjaogbAAMNDAZ6D9ac2cg1AhzJnaKYsaYaWasqai9dlC6pid
	rZj1iQuwgJ5TVaQNHX7pF10RBuD1EF/8F2EmfJ8qsMGJQUrpatmKUbeZX7w8HMV8KnCc8ggRyEC
	orp0w7DS+LKhRhr0IUeNQJOfo49hQ4UiYqG3HfuErBFTJsrq89zW9kiOgKf9te7CkIj1zjrXIjR
	obko/nNQ68Ia4E2FZWOJNQHPdcBzCggIQjOQgPkxZ/XpSgQMSUPMlKV5mi84IqJLuAhbqdfU6kN
	hFLqh44EFfY/dOEJnNqUwl53AsGAGGTRjNanqRHIV1j3oYOKU8e5Ayy4SdmVmw==
X-Received: by 2002:a17:902:e5c6:b0:235:ef56:7800 with SMTP id d9443c01a7336-2382404d8b0mr40820645ad.30.1750842541576;
        Wed, 25 Jun 2025 02:09:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzZJUEV7/dwWDdN5l2PU08bFUS8+SGUQX9bvhOHDAS/otE06vi/IebhTFUfU1a9+dcws8jcQ==
X-Received: by 2002:a17:902:e5c6:b0:235:ef56:7800 with SMTP id d9443c01a7336-2382404d8b0mr40820175ad.30.1750842541122;
        Wed, 25 Jun 2025 02:09:01 -0700 (PDT)
Received: from [192.168.1.9] ([122.169.211.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839379bsm132437225ad.51.2025.06.25.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:09:00 -0700 (PDT)
Message-ID: <f1ffcfcf-b213-43ee-b6bb-a57bcb82c567@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:38:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <v7oxwbf6xjc2gxeviwe4tayovzasysqig5smk752an74qd2e46@q25ymfyru3ze>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <v7oxwbf6xjc2gxeviwe4tayovzasysqig5smk752an74qd2e46@q25ymfyru3ze>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t8phaCf_MdyW2v3G7e24o5G3Dp8upPF9
X-Proofpoint-ORIG-GUID: t8phaCf_MdyW2v3G7e24o5G3Dp8upPF9
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685bbcae cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Cd/wWaFLovbkbTNPkk+rxA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=BkUvjnVOG6HkTn4gpLkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2NyBTYWx0ZWRfX3alOGEbXSM4f
 yAHVoVT7pKMi8SbJjIwHSkt+K2+Ag406cEfoJv885qbTluN2CqL9B2Cqn9hhUxc6ANfDXpFRciW
 AjzmtpFmqoX4tV+AuyKUKWYt4x6E/rAC+z2INNM8lersss/mnpBq/lZ34WpkuJloVZ5lbnnOd5p
 6oZQAOfC5dNVsIHKc8IbuyR5Ztul6EVxkSqOnarBkP4VJrjRupwh5kNpRGoTzPCvQ8yTVH661/G
 6I0W99xKpjoBUvpOMBfg76PgXKiYh/JhHd2+jw45Bj25b+ey0yiihjp+W4V3miK7bAbZiplxUIx
 egqMTFCgyuPhhIXps9yzrAcVtfDEOqfVVjv7t62xxRfdkatbhLQ08XkBnERgXup0OggeEx8P0E8
 ESfQQUWxxUoIk+zMBhSkIHsMm6zSGUo4ffGQ+oF8GlahB2Z2yt64T1M4cmoCA52aT6TSH49z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250067



On 6/24/2025 8:13 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 20, 2025 at 04:00:12PM +0530, Mohammad Rafi Shaik wrote:
>> On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
>> multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
>> To handle such cases, use the reset controller framework along with the
>> "reset-gpio" driver.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
>>   1 file changed, 48 insertions(+), 9 deletions(-)
>>
>> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
>> index 13c9d4a6f015..b82b925c1f8d 100644
>> --- a/sound/soc/codecs/wsa883x.c
>> +++ b/sound/soc/codecs/wsa883x.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/printk.h>
>>   #include <linux/regmap.h>
>>   #include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
>>   #include <linux/slab.h>
>>   #include <linux/soundwire/sdw.h>
>>   #include <linux/soundwire/sdw_registers.h>
>> @@ -468,6 +469,7 @@ struct wsa883x_priv {
>>   	struct sdw_stream_runtime *sruntime;
>>   	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
>>   	struct gpio_desc *sd_n;
>> +	struct reset_control *sd_reset;
>>   	bool port_prepared[WSA883X_MAX_SWR_PORTS];
>>   	bool port_enable[WSA883X_MAX_SWR_PORTS];
>>   	int active_ports;
>> @@ -1547,6 +1549,44 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
>>   	.info	= wsa883x_hwmon_info,
>>   };
>>   
>> +static void wsa883x_reset_powerdown(void *data)
>> +{
>> +	struct wsa883x_priv *wsa883x = data;
>> +
>> +	if (wsa883x->sd_reset)
>> +		reset_control_assert(wsa883x->sd_reset);
>> +	else
>> +		gpiod_direction_output(wsa883x->sd_n, 1);
>> +}
>> +
>> +static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
> 
> Please name these two functions in using antonyms (e.g. init/fini,
> powerup / powerdown, assert / deassert, etc).
> 
Ack,

sure, will update the function names.

>> +{
>> +	if (wsa883x->sd_reset)
>> +		reset_control_deassert(wsa883x->sd_reset);
>> +	else
>> +		gpiod_direction_output(wsa883x->sd_n, 0);
>> +}
>> +
>> +static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
>> +{
>> +	wsa883x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
>> +	if (IS_ERR(wsa883x->sd_reset))
>> +		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
>> +				     "Failed to get reset\n");
>> +	else if (wsa883x->sd_reset)
> 
> No need for 'else' here.

Ack,

will make the changes.

Thanks & best regards,
Rafi.
> 
>> +		return 0;
>> +	/*
>> +	 * else: NULL, so use the backwards compatible way for powerdown-gpios,
>> +	 * which does not handle sharing GPIO properly.
>> +	 */
>> +	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
>> +						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
>> +	if (IS_ERR(wsa883x->sd_n))
>> +		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
>> +				     "Shutdown Control GPIO not found\n");
>> +	return 0;
>> +}
>> +
>>   static int wsa883x_probe(struct sdw_slave *pdev,
>>   			 const struct sdw_device_id *id)
>>   {
>> @@ -1567,13 +1607,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
>>   
>> -	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
>> -						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
>> -	if (IS_ERR(wsa883x->sd_n)) {
>> -		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
>> -				    "Shutdown Control GPIO not found\n");
>> -		goto err;
>> -	}
>> +	ret = wsa883x_get_reset(dev, wsa883x);
>> +	if (ret)
>> +		return ret;
>>   
>>   	dev_set_drvdata(dev, wsa883x);
>>   	wsa883x->slave = pdev;
>> @@ -1596,11 +1632,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	pdev->prop.simple_clk_stop_capable = true;
>>   	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>>   	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
>> -	gpiod_direction_output(wsa883x->sd_n, 0);
>> +
>> +	wsa883x_reset_deassert(wsa883x);
>> +	ret = devm_add_action_or_reset(dev, wsa883x_reset_powerdown, wsa883x);
>> +	if (ret)
>> +		return ret;
>>   
>>   	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
>>   	if (IS_ERR(wsa883x->regmap)) {
>> -		gpiod_direction_output(wsa883x->sd_n, 1);
>>   		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
>>   				    "regmap_init failed\n");
>>   		goto err;
>> -- 
>> 2.34.1
>>
> 

