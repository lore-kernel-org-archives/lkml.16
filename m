Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39B428DF0B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150604; cv=none; b=DeArqUaTdmghVxHTu6ZgkNB9qKgrgw61JYGiUVJT0lgMORTfVLMUbLCmemetfk7hQHbBbJHegnikwsl5boAYwu5DJpYjTOx61uwhgvAjoo6Ax+jD5bZXssiXajsSkLxV6dgkwqFr32ZEjUAKzjCHoe5Ob+APKOLAhIO9e2yIQLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150604; c=relaxed/simple;
	bh=g8+164MWQnwm/Yvz9p3c3pVZTgk5x0kJhrCBitVwXJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+ZfL8wJplWrKE4qbnMH/Y8nIqJH0VtK+6K0U0IeoARSZI5/lLEI08iPk+4lHm2Y9kzJHUAo3RvezE6WjFEfYWG7vDGf+3aG2D+kobXi6UYXi9506uxHY/7kf2p7Vite3dG1q2fiuF5W5iR4kPIylcCnWO5m5sMRVloZEow7kq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=V8x/SrQP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="V8x/SrQP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so42931975e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747150599; x=1747755399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L57om844kxS3HDPApKIBPPD4O1jfgBmX7JYFvjM39sM=;
        b=V8x/SrQPZxRnMnsHiB438NwCSZj0RCPgkyzK8+wWjLkWOs9+EtSoiVN9yDdeyOBNgi
         nGuQutR8jC7fhdCuDAF0v1RFiUCzU30tfRMf5+GgMZyuTXRzz7AbYVvnXZbl/2lPHSXQ
         pcKf2KodxzqTJgga+v7AnbYzQhqHAWSc2oy78R7e6jWSzp3nSvVgzXxbKJ2mYbZWkuT3
         Ou224kIHF/mNA244zMJCMu5G/I831oi0mgKBiM2XTGu6JjTQ77EOWSVJFmjO/nmzo/+T
         95qOeL1+RW+s5443TPpLEItNM8wu8RZwXQW5FZtG6Hc9B3l4+FpaPlJTplp0NZwtr3zD
         arQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747150599; x=1747755399;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L57om844kxS3HDPApKIBPPD4O1jfgBmX7JYFvjM39sM=;
        b=S62PycKDdxh4kRfA5lXO9sLxNeT7c/mxX8N8EOLJBxdq+8V24VFRX6qtm0gvWv21r1
         ilZG5uFuwNC79RZcVk4Bcafs4I2cZavEavXbFTl+fI7bJcfjzkQoCWPtVM0z3YzMnq9b
         7Ahi6BSQtmoxZM6spG2pem8ZHr18wcThdJQJlb/oreE7HEpyzCGItl5/HU5nU7rIwLvi
         buiez9ZdEgHqnQmvXQBtvy5tlpV4P1vymvWn+Ii32UVFunciBBjr8aJmoom7cc0ZWmeD
         yKSYXXGuy5okgp/OTw1gr6xYlNlW48cn3JwWV/Zzp10joV+YrW0rlx9biBRUl1n/Mdyd
         zT0A==
X-Forwarded-Encrypted: i=1; AJvYcCUtXIaZn83AtgCUdD3aVIgz4i9k5igo4HWhZnlZRTQDDrWkK91MqF0iWigUhRWcOJRyVWEb6+4Vorejt9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YywwJU7R0PTlJBvPpliKVSU/EvFMlqVP7nKP+oKsZI5Phq/hCGk
	2McO53ZB16h8dhp+GoO74aIUnDx7T2Gh8EMQv/c0M6/YAQ1vlJ2dozmNhUPj13w=
X-Gm-Gg: ASbGnctLiRlm4+mKb/rfRjGwNyk/GPuen0C2XlYePAsCALhRtN7GQQGtyFSg2K+EEoD
	ZFz0Rfv8ySGJrpq5LxIFCrb0mjW3YifpCyOWoDwHn7PUgYUFPNVoJhjGN6NvSK1MgzS1MzF/cze
	qZBykNL4l1MpgyIEwvoaIfJTx8y9FGqGj+jN252H6SM022A+gCAP+6Ui4S1DvSxsPHC7n2QmvDZ
	fv7+igkjftBWidtF21YU3HfhfCfFh7HRkJR+dXB4iZTOz2zJlkjG6DKD9hgLh602lEYB0LD2tHi
	o+i7RPsvXDMrsbFtVQy0oulzDL8W3C5UziXdnjk/SnohEPbcF/9Y9gZZNCQDcQfs/JA=
X-Google-Smtp-Source: AGHT+IFml+AzNYNXdPMsjKRnKr8SIqb9NPuxRgmuQY6V1E11Gk6Rx5OhkWkHEuPN0PEic9EHObJEdA==
X-Received: by 2002:a05:600c:a44:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-442d6dc5328mr136024405e9.23.1747150598818;
        Tue, 13 May 2025 08:36:38 -0700 (PDT)
Received: from [192.168.157.194] ([213.233.104.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d5cf5d6bsm176202005e9.1.2025.05.13.08.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:36:38 -0700 (PDT)
Message-ID: <433f188f-054d-4f22-86bf-74b8c38f11f5@tuxon.dev>
Date: Tue, 13 May 2025 18:36:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUv6+KFuobDzzmKFOH6PvwU0RFzd1M9WrEZ-yzESBahkw@mail.gmail.com>
 <e77c85de-4542-44e1-af2e-f63f72602ff8@tuxon.dev>
 <CAMuHMdXFtBmjDu=1RS2MLNYzhZ0fmpT7+1QbA9p4LvoLHitOuw@mail.gmail.com>
 <53999471-277b-4621-abfd-b4c25761b3da@tuxon.dev>
 <CAMuHMdWa_GuHmw0wRjMJi8ydcn-YTapruWKfoX96FBZHhveQHg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWa_GuHmw0wRjMJi8ydcn-YTapruWKfoX96FBZHhveQHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 13.05.2025 17:07, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, 13 May 2025 at 14:34, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 09.05.2025 15:34, Geert Uytterhoeven wrote:
>>> On Fri, 9 May 2025 at 12:54, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>>> On 07.05.2025 18:42, Geert Uytterhoeven wrote:
>>>>> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
>>>>>> module has one or more MSTOP bits associated with it, and these bits need
>>>>>> to be configured along with the module clocks. Setting the MSTOP bits
>>>>>> switches the module between normal and standby states.
>>>>>>
>>>>>> Previously, MSTOP support was abstracted through power domains
>>>>>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
>>>>>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>>>>>>
>>>>>> Previous Order:
>>>>>> A/ Switching to Normal State (e.g., during probe):
>>>>>> 1/ Clear module MSTOP bits
>>>>>> 2/ Set module CLKON bits
>>>>>>
>>>>>> B/ Switching to Standby State (e.g., during remove):
>>>>>> 1/ Clear CLKON bits
>>>>>> 2/ Set MSTOP bits
>>>>>>
>>>>>> However, in some cases (when the clock is disabled through devres), the
>>>>>> order may have been (due to the issue described in link section):
>>>>>>
>>>>>> 1/ Set MSTOP bits
>>>>>> 2/ Clear CLKON bits
>>>>>>
>>>>>> Recently, the hardware team has suggested that the correct order to set
>>>>>> the MSTOP and CLKON bits is:
>>>>>>
>>>>>> Updated Order:
>>>>>> A/ Switching to Normal State (e.g., during probe):
>>>>>> 1/ Set CLKON bits
>>>>>> 2/ Clear MSTOP bits
>>>>>>
>>>>>> B/ Switching to Standby State (e.g., during remove):
>>>>>> 1/ Set MSTOP bits
>>>>>> 2/ Clear CLKON bits
>>>>>>
>>>>>> To prevent future issues due to incorrect ordering, the MSTOP setup has
>>>>>> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
>>>>>> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
>>>>>> from the RZ/G3S HW manual.
>>>>>>
>>>>>> Additionally, since multiple clocks of a single module may be mapped to a
>>>>>> single MSTOP bit, MSTOP setup is reference-counted.
>>>>>>
>>>>>> Furthermore, as all modules start in the normal state after reset, if the
>>>>>> module clocks are disabled, the module state is switched to standby. This
>>>>>> prevents keeping the module in an invalid state, as recommended by the
>>>>>> hardware team.
>>>>>>
>>>>>> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>>>>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>>>
>>>>>> +/* Need to be called with a lock held to avoid concurrent access to mstop->refcnt. */
>>>>>> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
>>>>>> +                                            bool standby)
>>>>>> +{
>>>>>> +       struct rzg2l_cpg_priv *priv = clock->priv;
>>>>>> +       struct mstop *mstop = clock->mstop;
>>>>>> +       bool update = false;
>>>>>> +       u32 value;
>>>>>> +
>>>>>> +       if (!mstop)
>>>>>> +               return;
>>>>>> +
>>>>>> +       value = MSTOP_MASK(mstop->conf) << 16;
>>>>>> +
>>>>>> +       if (standby) {
>>>>>> +               unsigned int criticals = 0;
>>>>>> +
>>>>>> +               for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
>>>>>
>>>>> unsigned int
>>>>>
>>>>>> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
>>>>>> +
>>>>>> +                       if (clk->critical)
>>>>>> +                               criticals++;
>>>>>> +               }
>>>>>> +
>>>>>> +               /* Increment if clock is critical, too. */
>>>>>> +               if (clock->critical)
>>>>>> +                       criticals++;
>>>>>
>>>>> If clock->shared_mstop_clks[] would include the current clock, then
>>>>> (a) this test would not be needed, and
>>>>
>>>> Agree!
>>>>
>>>>> (b) all clocks sharing the same mstop could share a single
>>>>>     clock->shared_mstop_clks[] array.
>>>>
>>>> I'll look into this but I'm not sure how should I do it w/o extra
>>>> processing at the end of registering all the clocks. FWICT, that would
>>>> involve freeing some shared_mstop_clks arrays and using a single reference
>>>> as the shared_mstop_clks[] is updated after every clock is registered. Can
>>>> you please let me know if this what you are thinking about?
>>>
>>> Currently, when detecting two clocks share the same mstop,
>>> you (re)allocate each clock's shared_mstop_clks[], and add the
>>> other clock:
>>>
>>>     rzg2l_cpg_add_shared_mstop_clock(priv->dev, clock, clk);
>>>     rzg2l_cpg_add_shared_mstop_clock(priv->dev, clk, clock);
>>>
>>> Instead, call rzg2l_cpg_add_shared_mstop_clock() once, and modify
>>> rzg2l_cpg_add_shared_mstop_clock() to not only realloc the target's
>>> shared_mstop_clks[], but also loop over all its existing entries,
>>> and update their shared_mstop_clks[] pointers.
>> I tried this approach but w/o complicated further the code I can't keep
>> track of whether the "to be updated" (not reallocated) shared_mstop_clks[]
>> pointers were previously updated pointers or devm_krealloc()'ed ones. I
>> need this to properly free the unused arrays. Calling devm_kfree() on a
>> non-devres resource triggers a WARN_ON() for each call.
>>
>> Because of this I prepared a new version where the duplicated lists are
>> freed after all the mod clocks were initialized. I'll publish it soon.
> 
> What about using in rzg2l_cpg_update_shared_mstop_clocks():
> 
>     for (i = 0; i < priv->num_mod_clks; i++) {
>         clk = ...[i];
> 
>         if (clk->mstop != clock->mstop)
>                 continue;
> 
>         n = clk->num_shared_mstop_clks;
>         if (!n) {
>             new_clks = devm_kmalloc(dev, 2 * sizeof(...), GFP_KERNEL);
>             new_clks[n++] = clk;
>         } else {
>             new_clks = devm_krealloc(dev, clk->shared_mstop_clks,
>                                      (n + 1) * sizeof(...), GFP_KERNEL);
>         }
>         new_clks[n++] = clock;
> 
>         /* update all matching clocks */
>         for (j = 0; j < n; j++) {
>             priv->clks[new_clks[j]]->shared_mstop_clks = new_clks;
>             priv->clks[new_clks[j]]->num_shared_mstop_clks = n;
>         }
> 
>         break;
>     }
> 
> The above is an oversimplification, as it does not take care of
> converting between mstp_clock and clk_hw pointers where needed.
> 
> Does that make sense?

I see it now. It make sense. Thank you for sharing.

Claudiu

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

