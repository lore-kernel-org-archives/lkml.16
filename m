Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390641A314D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041223; cv=none; b=pnhIoblErh0IqBj3eah4JosmhLZ7J5LNBFsnZoSJTOQS/wO536+TCLraEutLVsd6ADHUjHfdTAxfQwq6j1eLuBxCbMwwETfCV6vwySKGWdKR/8JJiUtTCelKGDshXhZ2CODxKuUcTDeDFeGUiTkQu37W4r6DZuEGmLP9H7+oPSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041223; c=relaxed/simple;
	bh=XwqHogSSry3M2xOy9mpJfC7RmzJCOdzUYxSsyffvog4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0/U/y+HFJCoiRLGmEQr9eDFpwL4rhTxSY8/5kk+jj/5c1Q0rINSu3brtIzMC7GoVeqVg1FCabX/Vv48lU5yQFUb9x2P4rrM2zPiYDjjYioRprWBqjImjZN8ryX0aHjZhq9rFb5R8AOXJ9dvrtt+Ek3ZHORSJ5l/NLlGK7y3K1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XE8jySfi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XE8jySfi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCdeY1017712
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byTdy4NUp80D6fRVNH608h/H8vnHagA3F7wro8Roi8Q=; b=XE8jySfiUhYk0olX
	fBwjxLXhjQiipLrhvUz0NEjqA1e6LzZ7Tc+Rr6rK5kSXqXQe0H+WdZ+zNDWDSplp
	z8rHrl0YsUeH2TJHEcaN21qXwHFiNmC/iemUmcjUp8V+CNEm93aCr07a4fFrIcDX
	RG6xKoZnVBqcEaL7daXbu3QtYPi1LNUhRjDx+qUNcbrmrlEynagoOdYcaw0GDiP6
	PQocKc6hLDO+umCTRSDXEztYt2CltF6rRfdks7+uFXod+yBerOSMWYJXSOACkA6/
	gTOYAshjbzXE5+ma5enEgwk33rZFMvzgeUxHwrbcd3ApBq24w5mtrP2fW87G2TaN
	UAJtTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5rd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:20:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so323427485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041218; x=1751646018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byTdy4NUp80D6fRVNH608h/H8vnHagA3F7wro8Roi8Q=;
        b=QJZJYAkjaJYerEuAYUa8hrE+bFnuODqXnb6kMbjmfLKcdv7iTXW5cGiGpWxh12JoFF
         Q5SWRV2rbb/OW1buYaaIP4AIwrkLMuq996hocotBnKNzjSEq3mVKtocC573WfoACIwbL
         ZzEgk8Z0E9dLetwPBOWB90dzPaT3jurrZ/LvqHhrmYb8Ktw3Fb6eaV42ou02n2LL1qHR
         dMw4sZx31xKvJGSl6joHTZWxW77tnONVl52dXeM1LZtYEWQChMEF0OH5Fllp3EPXEq9A
         toyLUhU3CYDDv2Onk3R6mPvnvKXdOkG+pjMjtROU5aYIBy3BoXvKRCm3uuj9ghpdx4k6
         GUAw==
X-Forwarded-Encrypted: i=1; AJvYcCWkWqWzVqTRTmZqRjTG69N+SB2obiosLRaD44Ea6JAmc3fHavi4OhLjdSGeOG+EOMbPkjK+baFAgatBZ/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXV0Gs8u5t1+XnGkoL2ikylfK/biedcMetNK2UkcdfsJcutOsW
	+HRY/Ag9lKRIef43W0c45kOXfxitD56Vx7M4b+JQIqPsZrGOjwc6zsRvj1DJTb6cV4dUAtSBQvc
	pGMu/9WBiMyY6dQHjZnNg09nTfsmZWq8OJBIobXfwgE2A3wsqcBLL7L34qV9ZBC+QKKM=
X-Gm-Gg: ASbGnctdAQ6cAr1YhDuMofE93JNKJprwdvqkHJgFYE95IWupCf7oJabuvUUFnvazael
	rIDG+O1tgF/HDmA/6/ZP+c3LgmeJZqjoz2H0EnC52+7J+MoFuEZFfW2oN1xBdGtqaLwQpXWCYSx
	pLWcVMxaoDnyEizgE0ZC/QN3hVu27k2/JLlKm29QhkcaTMkB8HqLfWSgKWTgAbwTHltgpj8VvTm
	bxPBNgS7dyIjrRauLy70tojbH5m+/I2CSgelwAr3aANT9WXxT3qdNpe/gRGKBZGCQR+a+rsq2gM
	p5JANIaRLFj+XQLn51kB1xScfIWHcYir2K+jYaRZwyqqjWGe
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d4439a6584mr581809385a.35.1751041218010;
        Fri, 27 Jun 2025 09:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5YR9jQmlbqJf/b3wtB+gkoIUeP+Io5gvMv3Z8vaeITKKJSuhEBtWn6NwiGA8qRYC/80SaSw==
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d4439a6584mr581803785a.35.1751041217536;
        Fri, 27 Jun 2025 09:20:17 -0700 (PDT)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm3127195f8f.12.2025.06.27.09.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:20:17 -0700 (PDT)
Message-ID: <c783a7a0-5fb1-4dcc-99df-433352dd9ee5@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:20:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org,
        broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
 <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mmPbJtLu8ZNTwPyEjFXXAvfpaJuVWZmh
X-Proofpoint-ORIG-GUID: mmPbJtLu8ZNTwPyEjFXXAvfpaJuVWZmh
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685ec4c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=yTlN0QwsL3H5k83FOakA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfXzBZ81BnDBarV
 21h4vlNd6mIpQjgaAe9s+RPZcwthmTIxEXjKa8mOaGzEvwlBfiykwkm8Zp/gC8MzXXbbMrjktwa
 JYW7t2EIUQtpGjwqe04zX7FISGPPjaRW1ODVGoVU6ufWfvZRNkjAfNLJeP5YPscK7huzOkgKuR8
 WPOvi+G+bDRlkUyUZcLQudPZiWujtWFInexxSGhONkzljxE6seTZROgho55oHVfXQzsJc2cH92y
 De/axFRYDS5x3/FgOKT8v0mCwmO9z7MuiGbfOR2zMa/zaNxqr3QLY9QovUa1RCPbDqGxuAZN4UT
 Ua+KXWyOvwzh7lQF/qIzK2XvC4jxmHgqPisBYtr02E+lqfHAOFOLBnCxTsJZloafmRft8rNiDMQ
 Hp3TIZ5ClMC8behG/AN38+glPtJjzDRjC0oPi+H84/LsgZElgHBlkNw22UJT6IEs9VCuEyYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=941 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270133

On 6/27/25 4:54 PM, Konrad Dybcio wrote:
> On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> There has been 2 instances of this helper in codec drivers,
>> it does not make sense to keep duplicating this part of code.
>>
>> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soundwire/bus.c       | 7 +++++++
>>  include/linux/soundwire/sdw.h | 8 ++++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index 39aecd34c641..58306c515ccc 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -1363,6 +1363,13 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
>>  }
>>  EXPORT_SYMBOL(sdw_slave_get_scale_index);
>>  
>> +int sdw_slave_get_current_bank(struct sdw_slave *sdev)
>> +{
>> +	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
>> +			 sdw_read(sdev, SDW_SCP_CTRL));
> 
> sdw_read can fail (miserably)
I agree, will add check in v2.


--srini
> 
> Konrad

