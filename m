Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F6A26E176
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832716; cv=none; b=M9HOlNe7ecOVhFF0pDgbqwm7SJdYVH+G7LXzWDhOmf7+7Zm5IDTDFeF87A3bk6Hse2m5KfOhleyqAjCOfp+dfBTrKxb33VLd6my6bnnHiem7d0MFcoedxR8bCdYUlzRHlFtLxlkXYVr9yFsSO4h/TCX+zj+0aW+9p1nays8lSEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832716; c=relaxed/simple;
	bh=Lfpf9KYeMfA5ceSYrwIBAnFuALvnl9+DKzgJ8mT4MWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Um+cfWGU3kNoinOSq1DGnu/jU3cH1bIDJOJrakdSv+MmbWf4Wl9w75bQQtfc6kud6tzriT6ti9YjlFmKZAtvf9sYR+r20EWmL7sBLd1MXfqv8SC9yGLFzDipikLw7W7//A0hONx6SFAF5ghzab41r+oi0hbBRc4UmGuPlxapvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=lJv3nP45; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="lJv3nP45"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3dc82baf4eeso3641135ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747832711; x=1748437511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35BrxOOcfaPPTAO1IzcPRUrzrlbknsK0t0CSqi8oBRE=;
        b=lJv3nP451V3brqjdYQ0sNtrSdPfHwZaX14mdboLjHnmztxy0e3mGdA/C+Uw7jiI86n
         6iz5v9aTds9+13OxdG3bxORraVKewI9IogE4r1yCTatxT9sznTqwRjt+THlxduAtuw2s
         Fb1VQx9EEkk2UNRw/J52NBRnY5MGGmnNANX/0MMqig2uOFOpSO+Bq2PwWQp5/yQkaAYj
         EG7rEQEnjgFTYg3CrPELga/DznRE6HS/cqXdQNW46R9WStFKaoZqnwGx5vJkgyIsQsxQ
         c2imLcg+n9S5ht8A8VLGCRLthb2hdvvq1ZtjD/GrrN7qPHN3XvUXFUKIPPyb/QfVX5Dw
         fX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832711; x=1748437511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35BrxOOcfaPPTAO1IzcPRUrzrlbknsK0t0CSqi8oBRE=;
        b=Fc080S1zbpzd7pD8UOW6/OvRjc7sBr7jnwznu4iHvwJyD5w3V4DAu+J4WPPWwyYwrp
         zwYXL7UnacrGgvVKbFIYIrRM3y78PE3TpjWEmhxSLY6EE2wISjLtYEU3uRaT1JrhJR3J
         A1GJc3bdx95RIcV4zyv09OSyP5pYnlnPuQwzJvt/0sSsbmYISWJLyYQ6VQFIrPv6H36A
         RdHdHyxAY/V4PDZiVFapW30QIs8w+aZuuIFstaYZmUjqHPEWusfvu8xhdWzXAhwJU8pn
         9M7LLdEKESTe4QQYUdqyNJu4y8WR9XLBAfCWyz8mihRUlhhjpUH9rLP1/rbVL3ht2V3s
         RgFA==
X-Forwarded-Encrypted: i=1; AJvYcCVZBhuio+1TwFB94HeDyueTRPlT7VqdzFhEXwgi3qnRbELOMLwI54mK42lb+XIJNM/BZp9wsyLx0XriZsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjpgixx593HPAbexA0q2TH0Pavkgw41w48VGE805rHt7SK8YiT
	Q4zwEhw/Guydp0XjCuMhIG0oOcQbZVltnvThsl71yHTUdgXsEFwNxlzJ6SqhyyH+Az0=
X-Gm-Gg: ASbGncubccpmzTXn8D/Ql6BMGK3rW3kigNvqHwL5OUqP84sid1lZ8/pr4Ih1YetozVw
	u8vIBA4EnyJwcIQMgzraiK8X/OyWTkyUig2snvJuOCLPEcAyteJ1HtCgeuSdi+ttlxPBHJBtaHF
	IzOXt5XCU/4RuN0DGpOTBbGif3rJQrl9iZpblEOTCOB/I2I3HVkVzkEzvITLNf/nDBeQVyaUPQV
	ueMeunmxLtaoRFLHZbIEiVfilYgn4EZWsml+k+EnBd7dErpY0WdPMoQXCehIuOQ6+W2cMI6+Gcs
	Q+Hb+WVdITQQ4hNTXHifHFqSOSnCnTnqMt57AV4O96g1XK0=
X-Google-Smtp-Source: AGHT+IGcH4WluxWWC65gYTzjzjjMrU1aL2mLMIRkk+Pdgbz31x5IxzPpCwTODkjM4dvMG/o0xVSNlg==
X-Received: by 2002:a05:6e02:3309:b0:3dc:7cc1:b74b with SMTP id e9e14a558f8ab-3dc7cc1b9e8mr62729035ab.1.1747832711001;
        Wed, 21 May 2025 06:05:11 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db8443a37dsm28496795ab.53.2025.05.21.06.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:05:10 -0700 (PDT)
Message-ID: <0779b400-b99e-4fa2-8b18-de06fb4e77cc@kernel.dk>
Date: Wed, 21 May 2025 07:05:09 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: printk NMI splat on boot
To: paulmck@kernel.org
Cc: John Ogness <john.ogness@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>
References: <a93e1a96-3685-41c3-8979-472b20dfca14@kernel.dk>
 <84a577t590.fsf@jogness.linutronix.de>
 <c99232fa-e861-48ec-8438-028e61d3b744@kernel.dk>
 <36ccb46d-5041-47ce-b419-f49ccaeece9b@kernel.dk>
 <fe455126-7b33-4246-b626-44ef33013765@paulmck-laptop>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <fe455126-7b33-4246-b626-44ef33013765@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 12:06 AM, Paul E. McKenney wrote:
> On Tue, May 20, 2025 at 02:41:40PM -0600, Jens Axboe wrote:
>> On 5/20/25 2:18 PM, Jens Axboe wrote:
>>>> What values are you using for CONFIG_RCU_EXP_CPU_STALL_TIMEOUT and
>>>> CONFIG_RCU_CPU_STALL_TIMEOUT?
>>>
>>> CONFIG_RCU_CPU_STALL_TIMEOUT=21
>>> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=2
>>
>> This was =20 btw, guess it could cut a bit too much...
> 
> Just confirming that setting CONFIG_RCU_EXP_CPU_STALL_TIMEOUT to two
> milliseconds is more than a bit on the aggressive side.  ;-)

Sorry guess I wasn't clear - I had pasted in =2, but the setting in my
config was =20.

> Setting it to 20 milliseconds is OK for smartphone-class devices, but
> to the best of my knowledge, setting it less than 21 seconds (as in
> 21,000 milliseconds) has not been tested on any other platform.
> 
>> Changed them to:
>>
>> CONFIG_RCU_CPU_STALL_TIMEOUT=100
>> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
>>
>> and complaining is gone.
> 
> This makes it take the default, which in this case would be the specified
> CONFIG_RCU_CPU_STALL_TIMEOUT value of 100 seconds.  Which is an unusually
> long timeout -- mainline these days is 21 seconds and some distros still
> use the old value of 60 seconds.

IMHO the settings for these are very odd. Which I guess is fine for
debugging kind of infrastructure, but fairly nonsensical in any case.
But not really that important - looks like RCU_EXP_CPU_STALL_TIMEOUT has
a default of '0' so not sure how on earth I ended up with 20 in that
one. Most likely from not reading the help entry and hence setting it
similarly to RCU_CPU_STALL_TIMEOUT.

-- 
Jens Axboe
