Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB3F13D897;
	Wed,  5 Feb 2025 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781898; cv=none; b=KoUc3fkz/ihmaPs4xgYhRDD4/yLQo+BpwHBUeRSKp/+UesS6cY+hEk97JPycIZwAzomIfBdnbDVOe7oeoCK7bHgim9wcbvq4F0zvm7aLvfJKbRHIpEGBu2iYPhn44wi5gW+A7U/C85qyfo9KKwIYrDGZKr1BtGZMhPcVF/gpa8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781898; c=relaxed/simple;
	bh=gdy5cd3h4bVtyCWAkwap7NHW9h+FdHvkFYNDHTmIIPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtGRIqY9RW1y/858x0GxEbe2DzYNDTjXRzRWpcB7zZICr4UVpxn9ZLeqAuncXWHtX7B51p8w52Jwhdtw97ysoEAc0NFQadHdDTqvSvKWjs2lDyhJltCnWyLMJ9/gX1pzzMM+k3VnkNEGNL9x4M2qWIZZo6gHQl8BKWVARS4P6xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fulJmFL+; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fulJmFL+"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7157cf352so250390766b.0;
        Wed, 05 Feb 2025 10:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738781895; x=1739386695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a71A1t5rNrXw7gtQyGfuALjF7vqK5gL26+h1A6qZoco=;
        b=fulJmFL+MML7vJmbCZKXqEMbAugYfvy2zyZnaSczc+q1pB1hd/2BTVsJF3tUsKSFH8
         SRB6VLYLg0vpYtywNW+UCdABkgcqLefMloqyUOAvKHOP9OjuQQ1M7HNHeRoHqLPY4+1X
         iSx/oDVX8aYoQaVXhJtJWu6lppOcy6yDH37HpGWda2fnyVee+TvSEcSbovz2SloPQh6J
         zzbvv7r5pYeOLQlvln7aWi/Kor0l3VY8yPoyW6IGHBna97n7MIOyPHlEVbMxdAb7crL1
         4MbkjqG8cZ+jayX64jAHTGMjbTTvT3VTsqE8QuLBJAHX8x91yfFvnvtX7+sXIlMJfxFO
         sYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781895; x=1739386695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a71A1t5rNrXw7gtQyGfuALjF7vqK5gL26+h1A6qZoco=;
        b=HDT7aIlnpJzalPrf+/CTmr8pNm49vCBBs7/BjlYM07eGQcuiEKMyzaIwJXgUWI8tYE
         cU6KQp6vTIJshM6DPRRSAxyUmLWZ0nJp9SIJs1NQ9ohhrej6lRwOMOL4KztdM+W80W4l
         mCZrRCVXsnG1ijuXXb5ceQ3zJUJwwoHBB83eycTKbS9pMzSlYL8VBfzz8wsPA6pD6496
         es26BpXy6I7p0qHx1uJaTKV3emLQC4vVqjChr/MFbwc0U6SIDFKxaemFbqrcaQwNG7fj
         wOc6pI6tC0AHHyYl5OVCab7nFFxeRCcqBoBohh4XzMiLe3+504ztMwCC88JSVoNk98vg
         HJlA==
X-Forwarded-Encrypted: i=1; AJvYcCW3r0poOO3yrbTNM5hZgAZBkkLryZLgOIOpeKxvTnhjwawEfioVUDPYnwHX40qmZgMKGNSvMcZNan7UY8M=@vger.kernel.org, AJvYcCXZV9mXAVOngB8ZDCwuS/+qAIz5+nkTxeYzgVAFmUs+kAuTYcuT/O9vy84SSuXWSEv88OJvkbdflXjgV0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxenWcuB0xZkk3T8nh4iKmP9xjmFpmR4aiIK2E13tZdJeJbI6t
	SvSPrKqKm0447lS1PxHw2Smx45/Ucns1AbU7V+5ZyJFzRw1KEjR5heoZNW71
X-Gm-Gg: ASbGncvYd9NPVj0GBjTXMwXMcgSSJTBkyeznXC61LFDpVV2nrScEk8elpH6LxPh+t+3
	pmG/O17Kh+lJh4B23/QmoN6TQXQ5yuKXZHtuu3BK6Q/qanNFmdXnd2W2JVOr3J0ApmjWcmvPo/S
	ld0BcwmcZGh5vvTDAJzo/o0bVwQ5on5VL2le7nXIJffPWltAGokrcr1mjy0ZRJbfhAWmy4UB6Uq
	UTX65+KGwAhVa+1VwVjGOeb/zgx+igsd9d5HJjRYrkjacM5/3TNdzEt/Xy4DbyXRV2qL/f3S9RH
	7+UlgVVsoP3nbns0hlI9gWWjcJXsgySb1XaSSyM1BECJ
X-Google-Smtp-Source: AGHT+IGHOcq2bEGp2OnqU9INvLV5JVgfAV06LBKYqVqWEMm9zU6Sr+3w2aBLE7MIY2wLnbC3eeLt0g==
X-Received: by 2002:a17:906:6a29:b0:ab6:d4ce:5674 with SMTP id a640c23a62f3a-ab76e9dc14amr34325066b.26.1738781894675;
        Wed, 05 Feb 2025 10:58:14 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47ceadfsm1152656466b.51.2025.02.05.10.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 10:58:14 -0800 (PST)
Message-ID: <2226a3d0-37b1-4018-83d1-8f5e9853169b@gmail.com>
Date: Wed, 5 Feb 2025 20:58:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] ASoC: SOF: imx: introduce more common structures and
 functions
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-2-laurentiumihalcea111@gmail.com>
 <Z6EeZ4lgKVHCee3e@lizhi-Precision-Tower-5810>
 <db81aa4e-dc1f-4c6d-b58f-82883622b0dc@gmail.com>
 <Z6ONWfIycA0oHEB6@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6ONWfIycA0oHEB6@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


(snip)

>>>> +#include <linux/pm_domain.h>
>>>>  #include <sound/sof/xtensa.h>
>>>> +
>>>>  #include "../ops.h"
>>>>
>>>>  #include "imx-common.h"
>>>> @@ -74,5 +79,417 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
>>>>  }
>>>>  EXPORT_SYMBOL(imx8_dump);
>>>>
>>>> +static void imx_handle_reply(struct imx_dsp_ipc *ipc)
>>>> +{
>>>> +	unsigned long flags;
>>>> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
>>>> +
>>>> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
>>>> +	snd_sof_ipc_process_reply(sdev, 0);
>>>> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
>>> Are you sure have to use spin_lock?
>> not sure, this definition was taken from previous drivers. I'd say keep it for now
>> as removing it would require some more testing which will take some time.
>>
> Change lock type need seperate patch. analyze is more important then test.
> It is really hard to hit race condition at normal user case.
>
> You can check if any irq handle use ipc_lock? If irq handle already defer
> to thread irq, mutex most likely is enough.
>
> Frank

ACK

>
>> (snip)
>>
>>>> +static int imx_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_power_state = {
>>>> +		.state = target_state,
>>>> +	};
>>>> +
>>>> +	if (!pm_runtime_suspended(sdev->dev)) {
>>>> +		ret = imx_common_suspend(sdev);
>>>> +		if (ret < 0) {
>>>> +			dev_err(sdev->dev, "failed to common suspend: %d\n", ret);
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
>>> does pm_runtime_force_suspend()/pm_runtime_force_resume() work?
>> no, these functions are not called directly by the PM core, but rather by the SOF core.
>> Using the proposed functions would result in the SOF core PM functions (i.e: sof_resume/sof_suspend)
>> being called twice in the case of system suspend/resume, which is wrong.
> Does SOC core should check it? I don't reject this change, but check
> run time pm status in suspend often cause some bugs.
>
> Frank

No, IMO this sequence is chip-specific so it shouldn't be handled by the core.
