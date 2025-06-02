Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C332C2C9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881716; cv=none; b=R2cYzXlQ7OwHiZs4M6+823riIzgwflDfDGW/X574Vl51ty4HuFkSHgPt39QSplLvMCLMXaPREyTncUrh66J47eT7wSnSBGWmRVFOcPpfIQ2TYH5E/GzNoTvdJSEujEN/o9w51ZPDRjY+41FL9NdkuH6rxKWNPEfrQ7HPnri4q94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881716; c=relaxed/simple;
	bh=ZYbCZFxl74/NYjE6KL73aTS+LrqBzygs2HsVGGtXHSs=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l1y8+XujBryZIcWmpLUPloQb2YuxKyea6O5uBRntRBKI4k442AT+PwVTnvPidtn0UHj291Pg5KXwEUTm/gNCVRb+G0ijtVmCxCnsd6DFvsLsgyfdLDk+hEdT9r3N8M+9zweVZAw19175c0QzASlM6fTUq7RAljHdyTX6YsIrH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W4mGe/pn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W4mGe/pn"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1283661f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748881713; x=1749486513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asVxBnd4UVpXaYjvPnlgoO+2ugPST2+ZKPmmHelegjQ=;
        b=W4mGe/pn4x+H+FTxkcPPJlEB6hK1kr+wm27FipZfBBUe8GRS8vo3VuQAeTP8do3xm8
         xTYdz8dfS2ywa3WS9dSXoZHU8xf/5//hASvU/xFs7fS+OFbdlZouho+jv3cELlg5TVQS
         5QThAI1ShVSMSpVbTGiAacUue/oiK4/gDoE7M/kDC7nZ2Rq/p2nzZNIm0809o1WxbDnj
         x8m/YGTaveJpFAkMNFTs1wuXLRxSzNfYc8aeA9VbnoD8cBQM5HendeLoJtkE5lD0N7Wl
         rE7ZanatpO02JBJw5UMh0k9LTXW5s2X0E0nQDXkqmJKNIeDEo3OSY2qub0YkzXZlZjDo
         7acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748881713; x=1749486513;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asVxBnd4UVpXaYjvPnlgoO+2ugPST2+ZKPmmHelegjQ=;
        b=SpQFPhVDOXUHZsEhTTUAo7fdh7psWkk+9noUx0ji5VoeKiq2pqR34c0aVtQg6c9KVk
         E3gZigxyH2q2aHa/qz8S5DibUtZjK9GUF5jMtWqSjzo1QCDA+0vqxVl/uU7goYdFt3al
         4ALhI28rxFp9wIyPXZyrCheYfmg+jZQbgwaIlpeC6/R/ELBr2fRy74WNM2c+nHHojmIp
         1qyT8X4YmoKRMwMQUt47xj1g4sF8xqpDGyM9c6n1L4NMTX7pxMVNXO8j/NLaatlgSanb
         6zAGZP1dTvmRSNxdZ1FB91IiLhHVdoA7XC5rJCekkUw08aWn1qRtRzzd8msaMg2mAASq
         5DPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUwqN21BR58mjfLEoHDy5sCttjIXmqoA+MIDTPVRQx98wUCCTuAvHtRgUsJ6dIb/9fvWpMzgrgzoDD6qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2UIIiT9FbLpdNuvjCf7T32PA7qFheCZK37TL03Mgni5eyoS7X
	cK8AEm7u5pO4usAumqRK/6AkPnYJZNGRxSo6osHpIXl/cr1cpAxUQWcGT9w9InBPgqk=
X-Gm-Gg: ASbGnctPDaNUUksiPdhFHyoR7Bwlp5EwLrKFef9JdiQSrrG0kc0EUNz/G7JTLN+r7uh
	ScLAY0rOdqW4PFlgeM87UMpycHmxOATlK80r7C9+/oycFQwHcKCbnSK8le7cnwNzO0KHAwfnV/y
	iqehlqSUAyMDl0rk/A+6JdfgjaE2KYJMYtcxDL6NkVtEIUMg2uceqvJ9C77zVl1XrCOjJGjWIyg
	EVHa1iR/j7XvoWHl5HETlLILzuZgvLni2/eIC8zMO6qxOhDtB8lAuGLR1jfM5+5MkubR9IRMQhj
	akqhxyTcstJi4ESDHcOJIlQa+SxK6faLlMrlCRz+91/FrlRSr308zk0/9Q==
X-Google-Smtp-Source: AGHT+IGs2L/1XzdZ2AB3/IlWJKPRk4ha80Ut28NfecBS1pMRRz/GL0589ajmoLebc6Z6SCZFKSVLcg==
X-Received: by 2002:a05:6000:430a:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a4f89a47eamr10847999f8f.5.1748881712784;
        Mon, 02 Jun 2025 09:28:32 -0700 (PDT)
Received: from [192.168.42.104] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c91fsm15510845f8f.35.2025.06.02.09.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 09:28:32 -0700 (PDT)
From: Giovanni Gherdovich <giovanni.gherdovich@suse.com>
X-Google-Original-From: Giovanni Gherdovich <ggherdovich@suse.com>
Message-ID: <4b34814a-355a-49cf-8cc0-73cf843ed560@suse.com>
Date: Mon, 2 Jun 2025 18:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2025-37832: cpufreq: sun50i: prevent out-of-bounds access
To: Andre Przywara <andre.przywara@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <2025050824-CVE-2025-37832-e235@gregkh>
 <1db6d340-bfae-4d81-a1d1-dcbd7bc1294f@suse.com>
 <2025053006-multitask-profanity-3590@gregkh>
 <2025053010-legible-destiny-23d3@gregkh>
 <805e1a14-7f07-47f0-ba86-f326e4ecea01@suse.com>
 <20250602135141.0b332772@donnerap.manchester.arm.com>
Content-Language: en-US
In-Reply-To: <20250602135141.0b332772@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On Mon Jun 2, 2025 14:51, Andre Przywara wrote:
> 
> Hi,
> 
> I don't think this qualifies as a CVE, the issue was more theoretical. But
> I don't have much experience with what deserves a CVE and what not, so I
> can just present some insights:
> 
>>>> On Fri, May 30, 2025 at 03:57:35PM +0200, Giovanni Gherdovich wrote:
>>>>> On Thu May 8, 2025 08:39, Greg Kroah-Hartman wrote:
>>>>>> A KASAN enabled kernel reports an out-of-bounds access when handling the
>>>>>> nvmem cell in the sun50i cpufreq driver:
>>>>>> [...]
>>>>>
>>>>> The invalid data that may be read comes from a ROM in the SoC,
>>>>> programmed by the vendor, and is only used to configure CPU frequency
>>>>> and voltage in the cpufreq framework.
> 
> So "potentially invalid data read from the ROM" is an issue the we have
> regardless, this patch doesn't change that. And you cannot put arbitrary
> voltages or frequencies in the OTP fuses, the value read is just used to
> select one of the OPPs defined in the DT. If you want to attack the
> system by heavily overclocking or baking it with a high voltage, you can
> just change the limits in the DT. Not sure if that's easier or harder than
> accessing the hardware, though.

I see. Right, my initial comment regarding the ROM content was missing
the core of the problem.

> But more importantly, looking at this particular patch: This effectively
> limits the access size of the value we read from the SID OTP driver, from
> always 4 bytes to what the DT says, typically 2 bytes. But we actually
> mask the value in the code anyway later at the moment, so the upper 16
> bits are always discarded.
> Which means that as it stands at the moment, there is no real change in
> what values are used. I just did the change as it was clearly incorrect,
> and I wanted to prevent any issues, in case of code changes later.

Ok, thanks for clarifying that in the present form, the code behaves
the same before and after the fix (the upper 16 bits discarded
anyway). Your fix improves the code and makes it future-proof.

Greg:

given this information, and Andre (developer of the change) saying at the
beginning of his message that he thinks the bug shouldn't be a CVE, do
you think the CVE can be revoked?


Thanks,
Giovanni
