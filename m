Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC7733DF;
	Sat,  3 May 2025 00:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746231296; cv=none; b=VDUNlAWB8LVf5RqySWJlICPTMbl0UfkP+WttMlO9DUCLQWF5tlXPuLfYx36gAHJVgdgqCeko7bGCKJfwB6C3qWeX25kS1BOHdJyfqVKnXeQ5dXORSl3oTIOvEkdO816UroeXmqIOs4zw7SrEJ7+8CUGHDIcps4vcy9AQ0Tr2RaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746231296; c=relaxed/simple;
	bh=MA0iae6Ty8QxGs89/b27UkwWdG+4I7Jz+B9qj2xph/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cG4jcIMcAt6Uq+mX+oqUhvwGshkV6cJZ5+GHbbQx4244gluTEujmxVAKGjlHwHB4nGfahnsOd5M7i1tyTzXL7rOz6Ld9Ov8v1Qr3q0ieOYz2/r2Ju2OIq3Xx4s4ntua/JAd1ZfvL5+uf4aDqCMVT7xqAzCRqBVhPNhhijjlvB7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5xclnIK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5xclnIK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c336fcdaaso32951205ad.3;
        Fri, 02 May 2025 17:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746231294; x=1746836094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0SWZFivnLy2sRTOiE6ju7U9IzRqpw2HsQtTRsT46xoY=;
        b=d5xclnIKdYJkVQx5ttTwWkbr5O3P+H2yz6UTPuiSrbXorUQyV0vQamehPa69whTQe/
         sImxvovGiqpSN7wutzauY8yOiVKtnpfl1sr1uYKWMMgrn2QD5F0je4LGzl/pawpIWKox
         Lw17PGeBTdGHG8ltWYt+81qM/224OZKlcyj1rQ9B15jd9t6jA5cpHjOjQ1CnY7WFRGEc
         sNH8rHSlLNsfFXlBPLeTlrIs1NLL8wU+8mvsjtmyD18KCVLNtJeEalIyxvyGlDPq3Dnz
         WmbIfD4nrFyKPMIztNGJrD4eJ/hixyzh/lYqVZgVXqEgWfumGGbuJC+a2psXFXMvZf01
         R/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746231294; x=1746836094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SWZFivnLy2sRTOiE6ju7U9IzRqpw2HsQtTRsT46xoY=;
        b=uP6x8IpkiT2Yq/m/vmYtQX2T2kT2QbEn86EDr3NlUl9IBH2mV9hRrzzFVebRHIn7JT
         cy7Rcd4pgsJfNpesI8yW+XczSgplFglfV9lzwumZkKOKPs+twt9X/mH5h5781sbMr4U8
         wy35Id6OirUsh7oKNd42pr67vkxEjtjge8N8JRziPAk8LmuoKsZd8FK8Z6ZArMmXTxf6
         cTRrNHlRbQ1ETcjy4sx7oSGfM2TRYbJHUR+jUyv7kcqC4QIUApogrUPJKSEN9xcu577V
         4mJlYIvaAnfi9iuyhjAe0/NJIObIZ+4UeBZ+nhmoFt5tjje+0/6sePj9cGeu6iBhcZja
         TuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPDW/ojQOpRpbjkIcbB4Wc+FSjQClr4nt/Q2hWFqMtau54mQyTV8OdVpTEhgF8z8Y1WcpOfwbiKkAz9Q==@vger.kernel.org, AJvYcCV6iH/MJyeOJL2bYL49JGyNW7vRYp6GzssfM4xFV0trsA4TXmcuRtIWxMe45XNuesm10TOqpjaIDWONwgAg@vger.kernel.org
X-Gm-Message-State: AOJu0YzcuzuI29pXwRg/xldOO8hvrnqUNNSiWJg4zWrI8WJL0hPd1QFz
	5u7fBbJCsgjAq+DRGv3d2qmJzJECVvRpWNIDyL213wa7PWe2y1o5U8GTug==
X-Gm-Gg: ASbGncs73GeuP6xtBmNDe398J1Xf1Vj98drgQdr8Vrhn+IffY3xXkfX34vSnkJsPuvg
	IN0Eu6yPbtOpR0SzsgqJu7pJ+W6BEytjLDdrPcWFSuPqgDUu1gPDJ/8zh8iqf3FI2IVjVT4U85m
	MFhwwCGY+RHo3CKI5eCT5+yLblT/6WZ+wIf+N6y7n7FezoTmLIIGPQAfZ5pY7TduNrPUQN8QCIc
	dQYIvCAaehS7DB0i0y9RDzPtc2/T1GEqJYAoTG5Uzo5Eljwi478W85ycwFSBpt9cs2LbbsUfaHq
	IZONJ4sh8UfrvY4W8sgFhrwSrZN61ctf91JWn0dM86Zejn3QLpsngtz2BZ7K9h3M5oPg1mf0KPD
	kDA+reqQwx9i/og==
X-Google-Smtp-Source: AGHT+IEgd0SvosbDtG5aqA6fEGMHeRtGwuqk9eGUdkzCMgP4ejY3PmNUtMUj3UG0+tHrpTpFjnbn6A==
X-Received: by 2002:a17:902:dac2:b0:224:a74:28cd with SMTP id d9443c01a7336-22e10367e4fmr71487945ad.31.1746231293592;
        Fri, 02 May 2025 17:14:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e174db5c6sm7918155ad.0.2025.05.02.17.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 17:14:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4e0827d4-137f-465c-8af6-41cc68ddaa8b@roeck-us.net>
Date: Fri, 2 May 2025 17:14:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suspend/resume failing due to SPD5118
To: carlon.luca@gmail.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com
References: <92a841f0-ab20-4243-9d95-54205790d616@roeck-us.net>
 <20250502230753.616322-1-carlon.luca@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250502230753.616322-1-carlon.luca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/25 16:07, carlon.luca@gmail.com wrote:
>> The timeout is observed when the resume code tries to write data back to the
>> spd5118 chip. It originates from the i2c controller driver, not from the spd5118
>> driver. I have no idea why the i2c controller would time out in this situation.
>> Presumably it should have been brought out of suspend by the time devices connected
>> to it are re-enabled, but I don't see any associated message in the log.
>>
>> I know that others have tested suspend/resume support with the driver and confirmed
>> that it works. It might help to enable debugging of the i2c controller driver if that
>> is possible. Other than that I have no idea what might cause this problem or how to
>> track it down.
> 
> Hi,
> 
> I recently bought a new machine, and trying to hibernate results in these messages
> from the kernel:
> 
> [  195.176483] PM: hibernation: hibernation entry
> [  195.200054] Filesystems sync: 0.005 seconds
> [  195.200760] Freezing user space processes
> [  195.203723] Freezing user space processes completed (elapsed 0.002 seconds)
> [  195.203732] OOM killer disabled.
> [  195.204506] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
> [  195.204512] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
> [  195.204517] PM: hibernation: Marking nosave pages: [mem 0x4ee2f000-0x524fefff]
> [  195.204924] PM: hibernation: Marking nosave pages: [mem 0x8b93b000-0x8bb7bfff]
> [  195.204941] PM: hibernation: Marking nosave pages: [mem 0x8eedd000-0x8eeddfff]
> [  195.204943] PM: hibernation: Marking nosave pages: [mem 0x92fe3000-0x92fe3fff]
> [  195.204945] PM: hibernation: Marking nosave pages: [mem 0x944ff000-0x97ffefff]
> [  195.205340] PM: hibernation: Marking nosave pages: [mem 0x98000000-0xffffffff]
> [  195.210276] PM: hibernation: Basic memory bitmaps created
> [  195.212709] PM: hibernation: Preallocating image memory
> [  196.875538] PM: hibernation: Allocated 1013859 pages for snapshot
> [  196.875544] PM: hibernation: Allocated 4055436 kbytes in 1.66 seconds (2443.03 MB/s)
> [  196.875547] Freezing remaining freezable tasks
> [  196.876843] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [  197.559071] printk: Suspending console(s) (use no_console_suspend to debug)
> [  197.771716] spd5118 1-0051: PM: dpm_run_callback(): spd5118_suspend [spd5118] returns -110
> [  197.771734] spd5118 1-0051: PM: failed to freeze async: error -110
> [  197.979717] spd5118 1-0050: PM: dpm_run_callback(): spd5118_suspend [spd5118] returns -110
> [  197.979739] spd5118 1-0050: PM: failed to freeze async: error -110
> [  199.028103] PM: hibernation: Basic memory bitmaps freed
> [  199.028080] mei_pxp i915.mei-gsc.768-fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1: bound 0000:03:00.0 (ops i915_pxp_tee_component_ops [i915])
> [  199.029101] OOM killer enabled.
> [  199.029104] Restarting tasks ... done.
> [  199.088935] efivarfs: resyncing variable state
> [  199.326219] PM: hibernation: hibernation exit
> 
> the operation aborts and I cannot hibernate the machine. I fixed the problem by
> blacklisting the driver spd5118.
> 
> I see that the reported problem was in the resume operation, mine is in the suspend
> operation, so I'm not sure if this is related and if the logs can help.
> 

That must be something different. If normal operation works (the sensors command
shows correct temperatures if the driver is loaded, and it is possible to read the
SPD eeprom), maybe the I2C controller is already suspended when the spd5118 driver's
suspend function is called. I don't know how that can happen, though. I would expect
that I2C controllers are only suspended after all its connected devices are suspended.

 From the context it looks like the "sensors" command was never executed. To get
another data point, it would help if you could load the driver, run the "sensors"
command, and then try to hibernate.

Thanks,
Guenter

