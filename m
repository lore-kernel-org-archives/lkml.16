Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6412B20E005
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613680; cv=none; b=pXmpeT7CiBp7Qb84+WSwcyqsX6wH/qtKFBGw38tdIyMpXSVdIQePVgcgFgrutLIst4c1f9vWipv/kubnCFvKIQNIGHlmg1CE8jw06G5ZM3NLfxc7ZiqQN/q9mv+JmpJM29i5FHLpQHVvLMykfDuxbdMyrko13uF/Wsur/uxj8OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613680; c=relaxed/simple;
	bh=mN/SA7cybJrXxsBWCutgmdZPBRjmsXSS3+VC0dZT/vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc8Xw4tsfzfBS7VkTYbpgQN8z/3fTA6iFam6yJqriS7VU0OIGQog23JKeMjrv+qmfm04E08+Cu1ZHBE3p5TiIDqPcN78LTDwtAHaVlEuzstGhJeasJqZz4aMC4nuayi/NbIxwABogHk78Gk8+ViFvyyhBMKvcPitKHgb6s4dSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPtQmXVo; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPtQmXVo"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so1083788066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746613677; x=1747218477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=;
        b=OPtQmXVoJmlB7jZKrSK31bjK61wQZOLxHyCnVBTgRm+13gRkZd2HtAnymC8nxqkWH/
         f8eTgLH3lq5QO/8J0dvYIfWHvy3zk9lUn/+kEpPvrAyx9IvQKvQ3abvKLn8OcwS+8oa1
         zmgMv5mSb6AmuZWdRbusC36OOolhq3DC5haJaRHpvKXLJAGWCxampxtihHvmVayTDJeT
         gOODWGTGcZgFo4/GM6yn/arAzd7ALAKSUvrvt2CJVt9Hc41O9OmZ+lmp++Kyt2IGr9+q
         f7a+MmuWHFsMBB+mytXTSeKM7OCXZqhKbGwYezmq503IeAbOCJV6GAvZVIgzRI23Zk0V
         N8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746613677; x=1747218477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=;
        b=wJDxEQKHFU/lcMzc603OUpLNqSmRygz/uRZ/frdKF3jwEfnkdtgkwqYv0VOANewZNa
         UTgbxfVQ/GSYXDB/IGVgQ4mtnH0jFsniIbLeyJD2o4kxDxX1BaZqdwhha51LEDkgWmBG
         fsFvBha53uYJuKs51tJv9j19PqccCl3v61HVPqLLWbBNMQbgl17AwOzelahUJB8J/9/q
         HpX44aZn3K/HL6/1zFKpP9uvDTvS0ioUSyfwQYXPbS8aadQapl73KeCcCqmxcLM+IOLM
         kxkVdSYLPHvPROIC8Qz/ZSilhWFYwO2R0pbNRgsVD7LoePIAuVn5MSBy0hA21GxY8wXD
         jGdA==
X-Forwarded-Encrypted: i=1; AJvYcCWwoONQ2z69X2ukMAa0yVNYNgcVX3aiWuUc/lvTB8y8DAz8lVuQvkS0lMTiIRcgn4XBMzLy1eXssCzVJcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXPnoHIHHmK56bRSRnbkotfxkkl6lC4heOi9uqf8GMa9a8fzc
	43gEqa39JIKZUaeM13kmuq4leUU1ijhKGQcQmjaU/piGnvv7n0APmGL+8SElywg=
X-Gm-Gg: ASbGncsyNdCMsVYurTokAWVsgfBiCFv+e1XmLtYAnsTpac015oEo5dcQBFm+KA1Aw2y
	RJpT54F9kapJdC9mijtdrWpxaZ495tawiakg8JsVPmNnTF4zjHwBqAgb8WDHPNFUcPeccBIJJYN
	n8gyUxFs69mPlaH2BM+A+aDxVOUXJF8WDL7/fxN/qep1Xho6XyX8zOGeG5f+bXj8PNBqAVLDqQ/
	9KhS4qbAyD7dH2H7zHTnnzzZzdWkDZJVWf5XLr+/uIjq3aVX/UIgL2mP473MZSWbS4O5Z1ZUXh9
	6FT4Q2toi03+sMKmLR5z4MQ8kOIbykqg6Thm9B4BgQ151cYD
X-Google-Smtp-Source: AGHT+IGcySqujnpgP/KzWefd3PmSmn8wVFheaUVYXa/h4ueAk588Gd+cTopnd3x4abbh2j4LBSSshQ==
X-Received: by 2002:a17:907:1c9e:b0:ac6:fe8c:e7bb with SMTP id a640c23a62f3a-ad1e8e2bd6cmr275060366b.55.1746613676715;
        Wed, 07 May 2025 03:27:56 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950ad15sm881835766b.154.2025.05.07.03.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 03:27:56 -0700 (PDT)
Message-ID: <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Date: Wed, 7 May 2025 13:27:55 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <87h61wn2qq.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/25 13:18, Thomas Gleixner wrote:
> 
> $Subject: ... See
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
> 
> On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
>> Add function to register irq info into kmemdump.
> 
> What is irq info? Please explain explicitly which information is exposed
> and why.
> 
>>  
>> +void irq_kmemdump_register(void)
>> +{
>> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
>> +}
>> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);
> 
> Are you going to slap a gazillion of those register a single variable
> functions all over the place?
> 
> That's a really horrible idea.
> 
> The obvious way to deal with that is to annotate the variable:
> 
> static unsigned int nr_irqs = NR_IRQS;
> KMEMDUMP_VAR(nr_irqs);
> 
> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
> kmemdump specific section and then kmemdump can just walk that section
> and dump stuff. No magic register functions and no extra storage
> management for static/global variables.
> 
> No?

Thank you very much for your review ! I will try it out.

Eugen
> 
> Thanks,
> 
>         tglx

