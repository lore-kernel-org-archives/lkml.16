Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BA23C8BE
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751142559; cv=none; b=jU9Gvb7QuxSRpKTkWxzLSGdMg3Y7CeMYFjILEFof1+b8lSKPvdoSoGKdvFijT/wuBSC8RYWI2OkmQbQInFO1lGU4xuWr55Y2eOkE+UH19JoiOHUP0KVfbgCDF+QcC03BvFuVsCmNRepSBLmzRsUN891ko6thq7tNuxRPphEoQiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751142559; c=relaxed/simple;
	bh=T0wlQmFGOGNhhDM4nvJ4qoj2HQjX26q7iV4fE3NtpmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2PAiSelImk8gNxiM6u0bZT/p+MtyWrwHEm/Ff2IOqgdSB+WOMOb6xsT0kGEtQ11XUA1UIoTKNyZErFCdLyE0XqBkFeGcrBPQF5m79IDsoOVY6r7ZOzwuZ2e/x5gOXraraPOnmeNeBOspG6sAuLFOxiVsW/aKgv+JuYg81yGNvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glTvALRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glTvALRN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SIOMq3009818
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 20:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvO1X/5dXnlpiXoQEi7OXT1hkUPrG5XDuzBKZt+UGZQ=; b=glTvALRN89kwe7ZM
	C2efvqcbMGvOhH2MfEqjGczEMxxYUkJW+Xg83zIO1Z9kTWcCqMFHV5YiFJUQ7/Iu
	alJKmnrfCZ2oDfCQ7YtRqTHa6xM8z7qbmE/7e3fxvk6sdbPp0mU72XhE5re0jL0W
	Ewcb7rFOjzVveZbHONBnc8TTpNPyGwjHH5eY6btgRogIpp7eZtT5NTs+pphTwOcq
	l5MFWyi2Vb212wbCnr+FB570W0r5jjHrXLN7H08PK1fh48RGcMm4Tafwn5T6M9kZ
	itQ83L7w7v2HPZw+es/xwPhhQBweJ4Y4hx8RYp1Xq8zVuKRH84s4oEE3M7NHTWP7
	jXgbKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvh9qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 20:29:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d44a260e45so213527385a.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 13:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751142556; x=1751747356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvO1X/5dXnlpiXoQEi7OXT1hkUPrG5XDuzBKZt+UGZQ=;
        b=WMI4c516CjobIlNA4C8kXJe1UEnL2vKu9Znoe4JWnNHP8FFHvqBCEHYYIiTZKdDrV1
         lmsRERw8H5wcGbxxzHjEI9WdAQiQTBqut+UNONzAuuUEW9FjlJwn5CnKhZ1x5U69e+kf
         RJzCIxtBD8qQ9kZKD/DGQ1ondDup4F7wCs1mNTYfIp3kDDWXQ+5VVEFgEf6b2GVoGMWF
         Lwu8BMUQi63+PrQUt0DxCwreinRuvKBmfW/jzSGuHRTFp6DG5ReTfJp2ErfTVxQ/W9zi
         wExMj8J3eycQIOMg813anv3rSDPtMEKujB8HxYk6m+PQ1RTafRqKssNlZnOdGTE+xkqC
         UpWw==
X-Forwarded-Encrypted: i=1; AJvYcCXh3AsGwLBclyR4+fs88bNd/0Dxkd0PqaIrJFOzlJlTcIIA+sLHlzEf+MTJpxVW/7TnB+6kNtugeSYn3yI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6YsrFIhv0a45C+yKjhxDiyn0Y7HYhg2NHjcqAeuachfdqeeI
	Tf3j7cu6iekGSHJl2m8fQTQBZJfPl9ywoe5B8XNK1Og2vZOAjeYwigR1BKM52iwcfBtOqf78Qnw
	1nzP1k/xF9CllVxFiA5acfMpCuopvJ30C1nGOY57uhogFB1A3rvFQtbx/xxEnUXUYvAo=
X-Gm-Gg: ASbGnctKmbyFIIG9cOOTYbeDn/zbKVI2pRTdrLiNgXz+Tb24QFHg3HErGnwExV5Bpdz
	Jx2cD+Dh5bR9AzjdW4YfoLDz3/x9e0vwIG6bSB2uNegqrqPNE/JDsMCYdks5a0rnvAw+TZfOQ2a
	bjF7Qxy6+UF6udgY9fY5i5jyUSeWL8SZPJt2ci3TRZeXU/+U74pcbw8B6u+q3nUI05XZ9ebz6G7
	G9v6Z3I31GM8dfXY4N57MGYGnHFDS0FSwD6dgJT5HJND9KfLaFHIW/GPmPfmWjwd6392YOvpqs2
	l2Vcb7NF67b/4hgAPHZq63sRnGCvybeLuwsz4RcVLEUmq6eV
X-Received: by 2002:a05:620a:7005:b0:7d4:4484:751d with SMTP id af79cd13be357-7d44484b5a2mr1010011485a.18.1751142555718;
        Sat, 28 Jun 2025 13:29:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSOT3Whcrl+FmVnNtmxpGh+jILg5Cpxe3LRgOlWJS0A3oiXDqVWEhKK+QBec5lyQ1/s7BbIA==
X-Received: by 2002:a05:620a:7005:b0:7d4:4484:751d with SMTP id af79cd13be357-7d44484b5a2mr1010008785a.18.1751142555201;
        Sat, 28 Jun 2025 13:29:15 -0700 (PDT)
Received: from [192.168.68.102] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f23sm6248787f8f.11.2025.06.28.13.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 13:29:14 -0700 (PDT)
Message-ID: <4d003e4a-220c-40d4-bcb7-0f0ce3427b30@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 21:29:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
To: Vinod Koul <vkoul@kernel.org>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
 <aF7ZEi9qQxshnWed@vaman>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aF7ZEi9qQxshnWed@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B1-RC3Rp-vQHqJTsIxwm7OxVIEdzRyyN
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6860509d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1EDcOeGehylbRtlKsWcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: B1-RC3Rp-vQHqJTsIxwm7OxVIEdzRyyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE3MiBTYWx0ZWRfX4INMgiN4zUEl
 eR5W8m5Y+WcmknvaogYTas/ry8ycHQhhDUcfUKkjl1yUdtt/ZTW5Kz1ECuooxowFnW7HQsdvoqr
 M1l5Y4VUHQinYmmf4k89jaO998i3iWxA/CT7NlZupDiTXr1+n+EayHudwFdHMaF0OtbALRfj07x
 8rhKVHs2hN2xr5iHvWewwa43jM/Ov32xfzK3tlPwAshAMj8QlqwMKdfTmOk9ruesby576ZoSYOa
 gzB5uFG+yLAgwV2jc5l8fm1tapjNjpBCoHXaa7/ah3d6AEXKxPEWR9Rs8sEN+8V7G6lABk26hM4
 XRMpDybLUNrP8fJDVNbT1OPzKRJXT4JAA/If97bCguWhQSEiJs2k/dj/x8/RPfVLU9DJIdfsfvj
 RDmYINnjDEQ/dE9OKbYx4w69vdJNe9j39pVkQZMRekARL5OFwl9MfgK+IPhZ6umsGFPByrww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=831 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280172

On 6/27/25 6:46 PM, Vinod Koul wrote:
> On 27-06-25, 16:51, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> There has been more than 3 instances of this helper in multiple codec
>> drivers, it does not make sense to keep duplicating this part of code.
>>
>> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soundwire/slave.c     | 6 ++++++
>>  include/linux/soundwire/sdw.h | 9 +++++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
>> index d2d99555ec5a..3d4d00188c26 100644
>> --- a/drivers/soundwire/slave.c
>> +++ b/drivers/soundwire/slave.c
>> @@ -273,4 +273,10 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
>>  	return 0;
>>  }
>>  
>> +struct device *of_sdw_find_device_by_node(struct device_node *np)
>> +{
>> +	return bus_find_device_by_of_node(&sdw_bus_type, np);
>> +}
>> +EXPORT_SYMBOL_GPL(of_sdw_find_device_by_node);
> 
> Helper for single code lines?? why!
Two reasons,
1, there are already uses of this kinda helper in the current codec
drivers and even for platform driver has such export symbol
of_find_device_by_node().

2, sdw_bus_type can be made private at some point .

--srini
> 
>> +
>>  MODULE_IMPORT_NS("SND_SOC_SDCA");
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index 2362f621d94c..84d1a101b155 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -18,6 +18,7 @@
>>  
>>  struct dentry;
>>  struct fwnode_handle;
>> +struct device_node;
>>  
>>  struct sdw_bus;
>>  struct sdw_slave;
>> @@ -1080,6 +1081,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>>  int sdw_stream_remove_slave(struct sdw_slave *slave,
>>  			    struct sdw_stream_runtime *stream);
>>  
>> +struct device *of_sdw_find_device_by_node(struct device_node *np);
>> +
>>  int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
>>  
>>  /* messaging and data APIs */
>> @@ -1113,6 +1116,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
>>  	return -EINVAL;
>>  }
>>  
>> +static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
>> +{
>> +	WARN_ONCE(1, "SoundWire API is disabled");
>> +	return NULL;
>> +}
>> +
>>  /* messaging and data APIs */
>>  static inline int sdw_read(struct sdw_slave *slave, u32 addr)
>>  {
>> -- 
>> 2.49.0
> 

