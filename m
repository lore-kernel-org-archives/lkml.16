Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216B2417C5
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184017; cv=none; b=j6IW/4oe3Ki9lO8qz5aD2Ufj9QUrgT0VoX4e2vwO5J6Eh+oa8LvrhxnvtKHYiOfmOnhIcthxY57XKJrjJynZlEZd4MFShTi1jySg806YRkZE861o+WRRTItQKftpaDQShEB3mm6gejD6CCVoTrnDfQ7zEODa+yvObaTx4hlddLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184017; c=relaxed/simple;
	bh=/47+sMA0JkyFBnR95B9nb3p/4mhJHYfJBzwuNp3cdaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqjFkJGfB+/6OTdGRW4chiDNzKKSQ+h6DHV71sUl//9SwLmB7sphnyXgnw9r6+9JbqtGLObphvd81XYOGlY8aDVVNBfGx2mTdYe8v7yB1zsraG5rejwy8qAqtIDyZ/FbwZeGKBvTIHburzM4gd5FPkNavHwe2gic0Iw632PBZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk/jsNsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk/jsNsU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421Mxig015837
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 11:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1zoogZ0mW4AaQa7oJlvbkJUvuNkb6MBNOT54+2ShgI=; b=lk/jsNsUuvJn+oUC
	GUrJtP8ak2oQDXtsr3fqw3ytUMcaQATxpYZZQuaLM7TtfKTa4GQjwjIkkO4UXJWK
	XW8qMwUyc8y/PnUCV/YYfmXxe/k/EEsjJeayFdapxHnYk+sG5pqh5VPrAiMxckrd
	Z4tHWhFXS5vE4pl08Y0+1z/Pgg3Eq48idLLLP0jtfTcfbO7fVIpF+s697usd5eA0
	QNlhh4Ys+9pzC1eMIgenRcRnX50RQ40r97JqnI5rJvyV5pAkOXB6i25al8MbnsSE
	XeZ/H/P9wsdJqLh0dXGiu2fssuq8LexUWUiy0BQaRW7JUl12H/EhWUeH0/DPT7UL
	ug8a6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u400e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 11:06:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c9abdbd3so188546285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184009; x=1746788809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1zoogZ0mW4AaQa7oJlvbkJUvuNkb6MBNOT54+2ShgI=;
        b=q+dedf3Q4FQkkJK4pN7edBjwX9JNY9Pb68P/SuB6yFMSosXNoBRIf63+nPcLtcHQc9
         t2aU359VNzUvVuqletm4yUN3upFyfi4aYf+iCpj8v+JrQsB0UzNe/fYaoatQf+gEvblt
         hA+IU/FafNcXw/eWUdojclKfH5UKXkYnP44AoUPiZZHX770+sXe1JwGs9yMMlnuXFr4c
         nUg3ztYbjCH1sTE7l18zrV41Ouyv4HUFqf4vBXhIKRXvMNHzcowQiYxTQB9gNSz04aXj
         brN3C+nuZyRrHf1WPzLvzV5GRtmwzbkPUPubjfYRyFMM1mLj+TTvkUKJuLG+Bvvy0y3X
         UwCw==
X-Forwarded-Encrypted: i=1; AJvYcCUNL1uODx37kxcR+wk64gqZXNZvkLGf1BVZpYDRwYXBEYc0wYuuQ8OsProQzhc7DkWQ6dMjGXNkldlUBic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/xCYRrG3CmToSo1qrk1NXrCeZ3qDMtmoKqZgJ6bEyY6QvHzo
	ystFr7dt+SUHySFB76r4iTK2qM6BBqzawSIhDN8H4gYjVCDcmOAEUO0Pbs12FX2/6kBgcRLFPnQ
	Sd2Oh+AfPu8P/y7opLs6Vr+7DIw2Zw6Q47u7HBTtNkbKUHpwtaSK5GXtJdkmX89U=
X-Gm-Gg: ASbGncuT6JgceWAYrGUQeI5BM8GBqYJ9hPoK8PGts7bRlpcgYoPJUfSE+VOkimnILTa
	Sv86dozGeK6J84fF/TXeLn6EQc6VUXHqDw5o26cONNFCMd2gpGL1n9g9vzlan9awZbzXoAIR0qn
	WkhD5MxVg3IALnApvfDcNJLJpiLP2WCXN0P5+Jsf9QYdAwV0JhdrJbDSgc4NuSFV/A6yQ7MgNks
	A2muYJbPqb8IGp5bIE8Wv3IV1TrorPUy1KqBG9jVLyJP7M7PkDUamhJhtbbrzW40salrEsEdz+0
	CwyNGJEubvCDIpS6Bc6rA1pU4ft8nWRpcrrRXw==
X-Received: by 2002:a05:620a:440c:b0:7ca:ca21:23d9 with SMTP id af79cd13be357-7cad5b1e908mr390997185a.7.1746184008909;
        Fri, 02 May 2025 04:06:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxEfw/oGZXNbT+wq9xh4TIiYE0dP+RWQJIzPOf851X459NKI0wxZw1jeI309e25HlZlax9AQ==
X-Received: by 2002:a05:620a:440c:b0:7ca:ca21:23d9 with SMTP id af79cd13be357-7cad5b1e908mr390992385a.7.1746184008501;
        Fri, 02 May 2025 04:06:48 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a099ae7afesm1820418f8f.47.2025.05.02.04.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:06:48 -0700 (PDT)
Message-ID: <0d094cec-0a2e-4e21-845f-977f3a77993d@oss.qualcomm.com>
Date: Fri, 2 May 2025 12:06:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        Srinivas Kandagatla <srini@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <aBNdCRk_fP2q1vxQ@srini-hackbase>
 <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6814a749 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=-0JhTq91CruwOFu3ng0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: diNqOFo6DYDGIIn-dghjWVQnUwmRFf8C
X-Proofpoint-ORIG-GUID: diNqOFo6DYDGIIn-dghjWVQnUwmRFf8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NyBTYWx0ZWRfX+Q4jAG/e024x 1TjOnJzFMrvehK9Asx3j/RPMks3LCGcQ9hYFGII/0hFN0nFaaXPjLZ3cUSCTJD4Aod6Z3LAUU4I QGdVab8icUnGjLggUB0YHGqdVGOK7jfPbatU6kxI0seT4W6PoG00sk5Rp9xu+RO7OsGHE9IUD2j
 0x4YqZuu6P5LrqjDI3qvZNrtsvTT+WFtCCQ+a+U6ND9pnDJXfnXv3NemIBxaO5XytaP9T0H2Qws wU0Qy27vJvZvLQTm/HlswC7HJAB467Y2Q4bLpevgzNTb4DnS3x4FhmhasnlXKtjoV8uV7+cJAps t4mTH9E+7NOLzGE+qaxCJB6OLB9X2gKyrPXgXeoB2aHInFJF79Q4N07uAdIUMzc8O+hpd0KFIK5
 tSsDCypCNzPqDSO8AuSp4uViJwYUzvMZdwBhu2P8cLnKVge+c4It6BfnWafVwPI095hmw1hC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020087

On 5/1/25 15:13, Luca Weiss wrote:
> Hi Srini,
> 
> Srinivas Kandagatla <srini@kernel.org> schreef op 1 mei 2025 13:37:45 CEST:
>> On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>>> SoCs. But user space ALSA UCM files depend on the card driver name which
>>> should be set per board/SoC.
>>>
>>> Allow such customization by using driver match data as sound card driver
>>> name.
>>>
>>> Also while we're already touching these lines, sort the compatibles
>>> alphabetically.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  sound/soc/qcom/sm8250.c | 9 ++++-----
>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
>>> index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
>>> --- a/sound/soc/qcom/sm8250.c
>>> +++ b/sound/soc/qcom/sm8250.c
>>> @@ -16,7 +16,6 @@
>>>  #include "usb_offload_utils.h"
>>>  #include "sdw.h"
>>>  
>>> -#define DRIVER_NAME		"sm8250"
>>>  #define MI2S_BCLK_RATE		1536000
>>>  
>>>  struct sm8250_snd_data {
>>> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	card->driver_name = DRIVER_NAME;
>>> +	card->driver_name = of_device_get_match_data(dev);
>>>  	sm8250_add_be_ops(card);
>>>  	return devm_snd_soc_register_card(dev, card);
>>>  }
>>>  
>>>  static const struct of_device_id snd_sm8250_dt_match[] = {
>>> -	{.compatible = "qcom,sm8250-sndcard"},
>>> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
>>> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
>>> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
>>
>> sm4250 for rb2?
> 
> Since this name is visible to user space and used for picking the UCM config, I don't think it's a good idea to change it.
> 
It is not correct to pretend that rb2 is sm8250 for ucm cases, I agree previous code was
already doing this, Good thing is that we do not have a ucm written yet for RB2.

Lets fix this as you are already doing this for other compatibles.

--srini

> Regards
> Luca
> 
>>
>>> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>>> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>>>  	{}
>>>  };
>>>  
>>>
>>> -- 
>>> 2.49.0
>>>

