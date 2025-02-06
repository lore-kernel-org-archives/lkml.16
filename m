Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B305236425
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852454; cv=none; b=T9skjnxgvG/q9L+xSyWkCSCgNMDma98KG/ibWWAIHGR+OBAl/IEoTgDFEfIw9O1glxUoQVcCBtKIT2JMsucAoLbvRSiaHeOuQpHrfGFyCEIpQmRTRSkatGOkJouJB+jaWtphU+xp9unfw1jRi00vhDldNqbL71I9dcU1rF2G4co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852454; c=relaxed/simple;
	bh=TsM6cjP5exs6iulgzLG9GLX0YUqpxbzphn+dl/t4bxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h57bYfRxPyEx0Hh7KD2Z6ULJ/KNlAupldAS7C/48ixEgk9z8TtfO9kbgqnuImP48uWmFYVdX7rnTIi+zDrcFfOJPZu/6dp6EmXXsAOsUdc6F/NNQvc3yK/Ifjdj1X3yX450ytquIjHDnVWm22k7+K29bxeG9az9kQwtTSXpXkMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DV/k8PEC; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DV/k8PEC"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcef33eeceso1568406a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738852447; x=1739457247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwFNLRKVl3GLa/eUZNAIfbXnJp0kf6uNNAcjv2if4lE=;
        b=DV/k8PEC9STRFd+pKUIzhcYu+i/XR1KYVBXpygoMgko167E4w1bB3NA00o2OYEZK6v
         i9mmdKHfvm9kIzQ+SEg5ptgqL7tvltMazS+ZzkRLxA6skejT2ijBWSl0/Eu1z1bHVlrv
         b61Tk3fsZ2wD8PfRKiJLhksTAWnQ1D9fUaCtLGzkSxBc564yvDvBVcynsPIEion0iyP9
         08Wa8qzD8gSKhgqhm9P4habhTttMhChB94laG+M6LZBkngUVgB6z4iTZ5ZeqEF4FO4YH
         VzXm9nD7EGcMsXp34eVb76scVdeBOVeQVpO2sncuOzxsRHNpBzeTCx0KLUavb1hzL1DF
         jopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852447; x=1739457247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwFNLRKVl3GLa/eUZNAIfbXnJp0kf6uNNAcjv2if4lE=;
        b=ZrHHa7hTM4y7fRvAzkiBIGTKlldLRv+iRtFw8qirlxK7ZH3tlSgKRf6EcmXAMnN+UK
         YkT7mq2DBgnWk7j5r/9vJ8GuG5bhPb7oUPTGP22lSzv4xfwLjFPC5r36fd51EksQVEhD
         Ka3EgqA5YS1lQ2D1k5liNiMmFbDn80R14g2t0kw57mu1e1vNgo5iJ2CuyPiYeNPqSNV0
         t5C6SQaC9y1LTQdNJWGmEN15i5z0QApgWibfDokwAVwcs3PcxlkIgu4fF89c3gwn/0Pm
         dUU6QIU+kX1Su68y9Z416bpSHqSRAQnB8Fix56YSwU1biScFkOZg2qYf66tb6wZ1bnQ3
         +x8g==
X-Forwarded-Encrypted: i=1; AJvYcCWYTnDajGvQB0MMX/guMj7cAsFv+eh8Y/lmustC4j9CJAPlbFsMou+bv+MFbruKePMO0Gdmp2hn/4300OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQMLxhDCrLGZ0IOnaeTyelNeH2PsuloscXikD1Ns28RlFB2AF
	VkG8HpLdKCe23eQY3Dw+9XQIlU4d5BrJV4agIs/XULiVRmPv+n7t5lCClyfsYqQ=
X-Gm-Gg: ASbGncu5dnk6n9fRK3s57oUiULn8zm27DdmkyUvdd/cEuuK/CBs2W3gEQkQ2ji74dF7
	8k58ltmYiDYVKe/Qv7Qg1Ak4OS4C2cboQNoVX3ThsEGTdfFFNTDXPfYbRg8j+UpzOxCLY4tqRUi
	+W0smmOZtHWgohM9CPMqqag7GWMTIOvUK2c7MtZaMZ9jeN3sWiUJLvJwKGJivK8gfcoxoNfzxGb
	DEPHzep4lKMRE3YsNcU3edsbdxyr56YSR4JJr4SbAs5kutjSRZUZxAuTD0YA8T4zJIpkrJxrA+M
	WPfeKVrrowRJsyEdr2rCcnaq2g==
X-Google-Smtp-Source: AGHT+IG3q+0P/fya6NFqy3RqY1DP7UH/Lfdz/0UaueHOOOGIKvrkCAj+SukVWU9lFNykW8MeIAuk4w==
X-Received: by 2002:a05:6402:4486:b0:5dc:74fd:ac0a with SMTP id 4fb4d7f45d1cf-5dcdb717885mr7451425a12.8.1738852447266;
        Thu, 06 Feb 2025 06:34:07 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.75])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf6c9f85bsm961629a12.61.2025.02.06.06.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:34:06 -0800 (PST)
Message-ID: <7c78ca62-bb7e-4b95-9590-ad21f1c6f171@linaro.org>
Date: Thu, 6 Feb 2025 14:34:04 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] coresight: Don't save handle in path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: quic_tingweiz@quicinc.com, quic_jinlmao@quicinc.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 suzuki.poulose@arm.com, mike.leach@linaro.org,
 alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
 <20250131163617.1730505-2-james.clark@linaro.org>
 <85bdaa4d-3805-4ae3-917e-7258a131741c@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <85bdaa4d-3805-4ae3-917e-7258a131741c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/02/2025 3:02 am, Jie Gan wrote:
> 
> 
> On 2/1/2025 12:36 AM, James Clark wrote:
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c     | 10 +++++-----
>>   drivers/hwtracing/coresight/coresight-dummy.c    |  2 +-
>>   drivers/hwtracing/coresight/coresight-etb10.c    |  8 +++-----
>>   drivers/hwtracing/coresight/coresight-etm-perf.c |  3 +--
>>   drivers/hwtracing/coresight/coresight-priv.h     |  4 ++--
>>   drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
>>   drivers/hwtracing/coresight/coresight-tmc-etf.c  |  9 ++++-----
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 13 +++++--------
>>   drivers/hwtracing/coresight/coresight-tmc.h      |  2 +-
>>   drivers/hwtracing/coresight/coresight-tpiu.c     |  2 +-
>>   drivers/hwtracing/coresight/coresight-trbe.c     |  4 +---
>>   drivers/hwtracing/coresight/ultrasoc-smb.c       |  8 +++-----
>>   include/linux/coresight.h                        |  2 +-
>>   13 files changed, 29 insertions(+), 40 deletions(-)
>>
> 
> Hi James
> 
> I removed the handle from coresight_path and placed these codes in a 
> separate patch. However, I believe this change is not related to the 
> CTCU driver or coresight_path. Therefore, I suggest we submit it 
> independently.
> 
> Thanks,
> Jie
> 
> 

Yeah if you've removed the handle from the path then we can do the other 
void* changes separately. Makes sense.

>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 11d5d5320b1a..253ef02fde12 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -272,9 +272,9 @@ void coresight_add_helper(struct coresight_device 
>> *csdev,
>>   EXPORT_SYMBOL_GPL(coresight_add_helper);
>>   static int coresight_enable_sink(struct coresight_device *csdev,
>> -                 enum cs_mode mode, void *data)
>> +                 enum cs_mode mode, struct perf_output_handle *handle)
>>   {
>> -    return sink_ops(csdev)->enable(csdev, mode, data);
>> +    return sink_ops(csdev)->enable(csdev, mode, handle);
>>   }
>>   static void coresight_disable_sink(struct coresight_device *csdev)
>> @@ -448,7 +448,8 @@ static int coresight_enable_helpers(struct 
>> coresight_device *csdev,
>>       return 0;
>>   }
>> -int coresight_enable_path(struct coresight_path *cs_path, enum 
>> cs_mode mode)
>> +int coresight_enable_path(struct coresight_path *cs_path, enum 
>> cs_mode mode,
>> +              struct perf_output_handle *handle)
>>   {
>>       int ret = 0;
>>       u32 type;
>> @@ -479,7 +480,7 @@ int coresight_enable_path(struct coresight_path 
>> *cs_path, enum cs_mode mode)
>>           switch (type) {
>>           case CORESIGHT_DEV_TYPE_SINK:
>> -            ret = coresight_enable_sink(csdev, mode, cs_path);
>> +            ret = coresight_enable_sink(csdev, mode, handle);
>>               /*
>>                * Sink is the first component turned on. If we
>>                * failed to enable the sink, there are no components
>> @@ -807,7 +808,6 @@ void coresight_release_path(struct coresight_path 
>> *cs_path)
>>           kfree(nd);
>>       }
>> -    cs_path->handle = NULL;
>>       kfree(cs_path->path);
>>       kfree(cs_path);
>>   }
>> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/ 
>> hwtracing/coresight/coresight-dummy.c
>> index dfcf24e9c49a..6f86d33efef4 100644
>> --- a/drivers/hwtracing/coresight/coresight-dummy.c
>> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
>> @@ -54,7 +54,7 @@ static int dummy_source_trace_id(struct 
>> coresight_device *csdev, enum cs_mode mo
>>   }
>>   static int dummy_sink_enable(struct coresight_device *csdev, enum 
>> cs_mode mode,
>> -                void *data)
>> +                struct perf_output_handle *handle)
>>   {
>>       dev_dbg(csdev->dev.parent, "Dummy sink enabled\n");
>> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/ 
>> hwtracing/coresight/coresight-etb10.c
>> index 05430d8931d1..e373b0f590bf 100644
>> --- a/drivers/hwtracing/coresight/coresight-etb10.c
>> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
>> @@ -167,14 +167,12 @@ static int etb_enable_sysfs(struct 
>> coresight_device *csdev)
>>       return ret;
>>   }
>> -static int etb_enable_perf(struct coresight_device *csdev, void *data)
>> +static int etb_enable_perf(struct coresight_device *csdev, struct 
>> perf_output_handle *handle)
>>   {
>>       int ret = 0;
>>       pid_t pid;
>>       unsigned long flags;
>>       struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> -    struct coresight_path *cs_path = (struct coresight_path *)data;
>> -    struct perf_output_handle *handle = cs_path->handle;
>>       struct cs_buffers *buf = etm_perf_sink_config(handle);
>>       spin_lock_irqsave(&drvdata->spinlock, flags);
>> @@ -225,7 +223,7 @@ static int etb_enable_perf(struct coresight_device 
>> *csdev, void *data)
>>   }
>>   static int etb_enable(struct coresight_device *csdev, enum cs_mode 
>> mode,
>> -              void *data)
>> +              struct perf_output_handle *handle)
>>   {
>>       int ret;
>> @@ -234,7 +232,7 @@ static int etb_enable(struct coresight_device 
>> *csdev, enum cs_mode mode,
>>           ret = etb_enable_sysfs(csdev);
>>           break;
>>       case CS_MODE_PERF:
>> -        ret = etb_enable_perf(csdev, data);
>> +        ret = etb_enable_perf(csdev, handle);
>>           break;
>>       default:
>>           ret = -EINVAL;
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/ 
>> drivers/hwtracing/coresight/coresight-etm-perf.c
>> index b6765abb0a26..0fad9968c2c0 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -501,9 +501,8 @@ static void etm_event_start(struct perf_event 
>> *event, int flags)
>>       if (WARN_ON_ONCE(!sink))
>>           goto fail_end_stop;
>> -    cs_path->handle = handle;
>>       /* Nothing will happen without a path */
>> -    if (coresight_enable_path(cs_path, CS_MODE_PERF))
>> +    if (coresight_enable_path(cs_path, CS_MODE_PERF, handle))
>>           goto fail_end_stop;
>>       /* Finally enable the tracer */
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/ 
>> hwtracing/coresight/coresight-priv.h
>> index 8e02a222b9f8..7bd43304f461 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -112,7 +112,6 @@ struct cs_buffers {
>>    * @trace_id:        trace_id of the whole path.
>>    */
>>   struct coresight_path {
>> -    struct perf_output_handle    *handle;
>>       struct list_head        *path;
>>       u8                trace_id;
>>   };
>> @@ -142,7 +141,8 @@ static inline void CS_UNLOCK(void __iomem *addr)
>>   }
>>   void coresight_disable_path(struct coresight_path *cs_path);
>> -int coresight_enable_path(struct coresight_path *cs_path, enum 
>> cs_mode mode);
>> +int coresight_enable_path(struct coresight_path *cs_path, enum 
>> cs_mode mode,
>> +              struct perf_output_handle *handle);
>>   struct coresight_device *coresight_get_sink(struct list_head *path);
>>   struct coresight_device *coresight_get_sink_by_id(u32 id);
>>   struct coresight_device *
>> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/ 
>> hwtracing/coresight/coresight-sysfs.c
>> index 04e76cc1bfdf..f9a6b838726c 100644
>> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
>> @@ -209,7 +209,7 @@ int coresight_enable_sysfs(struct coresight_device 
>> *csdev)
>>           goto out;
>>       }
>> -    ret = coresight_enable_path(cs_path, CS_MODE_SYSFS);
>> +    ret = coresight_enable_path(cs_path, CS_MODE_SYSFS, NULL);
>>       if (ret)
>>           goto err_path;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etf.c
>> index e6b07f917556..fdf1c2511d67 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> @@ -244,14 +244,13 @@ static int tmc_enable_etf_sink_sysfs(struct 
>> coresight_device *csdev)
>>       return ret;
>>   }
>> -static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, 
>> void *data)
>> +static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
>> +                    struct perf_output_handle *handle)
>>   {
>>       int ret = 0;
>>       pid_t pid;
>>       unsigned long flags;
>>       struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> -    struct coresight_path *cs_path= (struct coresight_path *)data;
>> -    struct perf_output_handle *handle = cs_path->handle;
>>       struct cs_buffers *buf = etm_perf_sink_config(handle);
>>       spin_lock_irqsave(&drvdata->spinlock, flags);
>> @@ -303,7 +302,7 @@ static int tmc_enable_etf_sink_perf(struct 
>> coresight_device *csdev, void *data)
>>   }
>>   static int tmc_enable_etf_sink(struct coresight_device *csdev,
>> -                   enum cs_mode mode, void *data)
>> +                   enum cs_mode mode, struct perf_output_handle *handle)
>>   {
>>       int ret;
>> @@ -312,7 +311,7 @@ static int tmc_enable_etf_sink(struct 
>> coresight_device *csdev,
>>           ret = tmc_enable_etf_sink_sysfs(csdev);
>>           break;
>>       case CS_MODE_PERF:
>> -        ret = tmc_enable_etf_sink_perf(csdev, data);
>> +        ret = tmc_enable_etf_sink_perf(csdev, handle);
>>           break;
>>       /* We shouldn't be here */
>>       default:
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 82a872882e24..2d0bd06bab2a 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1252,10 +1252,8 @@ static int tmc_enable_etr_sink_sysfs(struct 
>> coresight_device *csdev)
>>   }
>>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>> -                   enum cs_mode mode, void *data)
>> +                   enum cs_mode mode, struct perf_output_handle *handle)
>>   {
>> -    struct coresight_path *cs_path = (struct coresight_path *)data;
>> -    struct perf_output_handle *handle = cs_path->handle;
>>       struct etr_perf_buffer *etr_perf;
>>       switch (mode) {
>> @@ -1643,14 +1641,13 @@ tmc_update_etr_buffer(struct coresight_device 
>> *csdev,
>>       return size;
>>   }
>> -static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, 
>> void *data)
>> +static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
>> +                    struct perf_output_handle *handle)
>>   {
>>       int rc = 0;
>>       pid_t pid;
>>       unsigned long flags;
>>       struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> -    struct coresight_path *cs_path = (struct coresight_path *)data;
>> -    struct perf_output_handle *handle = cs_path->handle;
>>       struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>>       spin_lock_irqsave(&drvdata->spinlock, flags);
>> @@ -1698,13 +1695,13 @@ static int tmc_enable_etr_sink_perf(struct 
>> coresight_device *csdev, void *data)
>>   }
>>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>> -                   enum cs_mode mode, void *data)
>> +                   enum cs_mode mode, struct perf_output_handle *handle)
>>   {
>>       switch (mode) {
>>       case CS_MODE_SYSFS:
>>           return tmc_enable_etr_sink_sysfs(csdev);
>>       case CS_MODE_PERF:
>> -        return tmc_enable_etr_sink_perf(csdev, data);
>> +        return tmc_enable_etr_sink_perf(csdev, handle);
>>       default:
>>           return -EINVAL;
>>       }
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 2671926be62a..e991afd43742 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -336,7 +336,7 @@ struct coresight_device 
>> *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
>>   void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
>>   void tmc_etr_remove_catu_ops(void);
>>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>> -                   enum cs_mode mode, void *data);
>> +                   enum cs_mode mode, struct perf_output_handle 
>> *handle);
>>   extern const struct attribute_group coresight_etr_group;
>>   #endif
>> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/ 
>> hwtracing/coresight/coresight-tpiu.c
>> index 97ef36f03ec2..ccf463ac7bf5 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
>> @@ -75,7 +75,7 @@ static void tpiu_enable_hw(struct csdev_access *csa)
>>   }
>>   static int tpiu_enable(struct coresight_device *csdev, enum cs_mode 
>> mode,
>> -               void *__unused)
>> +               struct perf_output_handle *__unused)
>>   {
>>       struct tpiu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/ 
>> hwtracing/coresight/coresight-trbe.c
>> index 5005efd88a66..997d5976d2d2 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -1009,12 +1009,10 @@ static int __arm_trbe_enable(struct trbe_buf 
>> *buf,
>>   }
>>   static int arm_trbe_enable(struct coresight_device *csdev, enum 
>> cs_mode mode,
>> -               void *data)
>> +               struct perf_output_handle *handle)
>>   {
>>       struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>       struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>> -    struct coresight_path *cs_path = (struct coresight_path *)data;
>> -    struct perf_output_handle *handle = cs_path->handle;
>>       struct trbe_buf *buf = etm_perf_sink_config(handle);
>>       WARN_ON(cpudata->cpu != smp_processor_id());
>> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/ 
>> hwtracing/coresight/ultrasoc-smb.c
>> index 9be88394b3bb..1574b5067206 100644
>> --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
>> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
>> @@ -213,11 +213,9 @@ static void smb_enable_sysfs(struct 
>> coresight_device *csdev)
>>       coresight_set_mode(csdev, CS_MODE_SYSFS);
>>   }
>> -static int smb_enable_perf(struct coresight_device *csdev, void *data)
>> +static int smb_enable_perf(struct coresight_device *csdev, struct 
>> perf_output_handle *handle)
>>   {
>>       struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
>> -    struct coresight_path *cs_path = (struct coresight_path *)data;
>> -    struct perf_output_handle *handle = cs_path->handle;
>>       struct cs_buffers *buf = etm_perf_sink_config(handle);
>>       pid_t pid;
>> @@ -241,7 +239,7 @@ static int smb_enable_perf(struct coresight_device 
>> *csdev, void *data)
>>   }
>>   static int smb_enable(struct coresight_device *csdev, enum cs_mode 
>> mode,
>> -              void *data)
>> +              struct perf_output_handle *handle)
>>   {
>>       struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
>>       int ret = 0;
>> @@ -262,7 +260,7 @@ static int smb_enable(struct coresight_device 
>> *csdev, enum cs_mode mode,
>>           smb_enable_sysfs(csdev);
>>           break;
>>       case CS_MODE_PERF:
>> -        ret = smb_enable_perf(csdev, data);
>> +        ret = smb_enable_perf(csdev, handle);
>>           break;
>>       default:
>>           ret = -EINVAL;
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 87f9baa7fefe..a859fc00eef9 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -353,7 +353,7 @@ enum cs_mode {
>>    */
>>   struct coresight_ops_sink {
>>       int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
>> -              void *data);
>> +              struct perf_output_handle *handle);
>>       int (*disable)(struct coresight_device *csdev);
>>       void *(*alloc_buffer)(struct coresight_device *csdev,
>>                     struct perf_event *event, void **pages,
> 

