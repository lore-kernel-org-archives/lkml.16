Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77229B765
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744756204; cv=none; b=bId2XGMD5WxVPfFRq5H4qbejBhSSlXSOdVn1+rJdeTTxMpEgC97457UgRlewg+ddGtYYGbaVb01qQv/ky9Qxc6mtCERKlktesRf6eebgVnTG+2txlvvYwL4MgR4no5z6p5LQZyn44vuHNSQV/nmOzWgKEYeR2o+uajnbgBNENgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744756204; c=relaxed/simple;
	bh=wKl3MM7FXDzCDATGbgnx129JDnwh2WSwaUp/wsX1kZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqREaxTsP2hDkaIKbNHrLC87fJQpFfT+pBaJ/oasrtWAhq+1RHiGut0SnvYsEgKjNMpCmBhDYXEExvTUMu9PXDC+sqU92aCe7EAS5IRHGvdP8riFO//QjczT5LN/Q+rzq9CfiodY3AWkiwDWzknbGzP1AGF2O4Rj7m6aIyTFWrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K9jGjS7Y; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K9jGjS7Y"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85da5a3667bso162666839f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744756201; x=1745361001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxv2Ry9G5/Mwctn9/k3++kcO0+SDSPIiurKACbRUHSg=;
        b=K9jGjS7Yk4/MsHOMT3xJkdOUxlFpb31ctqRHVGSYl1bBsfQcrMxN+EmfTHC6pvamd3
         2Jy5xjPSqPvgcwhs/uyT/MDwoqe4lPngJjQzuDBPBVSEdmEH7sNe+oh/9DXSmyggp9t9
         E9I+zqT+YORTrC5PyfO9KUwb/y0uF3AXgvxng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744756201; x=1745361001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xxv2Ry9G5/Mwctn9/k3++kcO0+SDSPIiurKACbRUHSg=;
        b=NHMt3sDa3tUSIGRMq05vY/ceo6HmYBnUNwlG322mDMcm211j2OEehl8TseIwunA/Pf
         MLqyLyDcX/YMFvpcqCDbyKZl5/yLIqSya6gNlC9/Dtr0eBTa+DjgLUZmU3pZtW7aQuB+
         LYNGCljinXkAcjR2qTRSTtUcwAY1lvEe8PDrxK8YeZ5xT0T8jyBpP0VYlzX5WNe2Pvgb
         OIuqFqBwAndWl3yUMYGpUBRxdLzxOQ9+4S4HqlXcqxyecShrwc7GHaTEEXaknswrI9uh
         0DSDAabCfsvOiOBuUz/tFsBOjgThn1ySrDmgOzdjwSzyvFKL0NcM3OFNghytrO9Eg8lA
         PO2g==
X-Forwarded-Encrypted: i=1; AJvYcCURWcIKVbOVx+zw7idRSktYDKpTwCkhpVQ9HukbYuYWr/PYWNPFn/qhIw6+8lun6KsTkdDCRcMiRJ28Vec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IE5yaHj4sd/a+o1xM83oZQ8m4dWBhGeghwtloVXljbNZszw/
	hAGsn0GcIk6FIt5BQ6wzYWsTTSr9tXTLg19akhbof07chItDM0a+VYKu5wWNH4E=
X-Gm-Gg: ASbGnct57RvIV5mRAwaTG6/BTaRFbeubvjMkbPQvGa3rk5O7ouCLjELHaMLq7ToWcoq
	BrNzueGwBPoAX03NJYvXx5Z777Qt7WvrwY/pFO+/qL6bPS/pL4GjAmN1nZTiUqHmxaiRUg2xHMQ
	uhvF0VV0R/Zgdi5uySY6a91xQEnMuCVtAXq9vpdRWB/nrS3wYvabMDleK2wENJQMxucpkGNtsr2
	/1XfCiW4ZbjDSC6/iPdas8ve3JfkJQccX94a/TguXCIj5bEsP/8T0nweWUvy44c76cgCBszj8xh
	/x5V2sN406moJy+qQCz0MuCE+wmwLvuFa41QMqvbkbi3EixvfjQ=
X-Google-Smtp-Source: AGHT+IHOZ+RTZXy6sacBuLPEHF8OMXx2BT/caUmTINLpWXbREX/h7NcMttc6rjPSa8ER+8UQlfvK6g==
X-Received: by 2002:a05:6602:408a:b0:85e:1879:c708 with SMTP id ca18e2360f4ac-861bfbf4ab2mr131533439f.1.1744756199733;
        Tue, 15 Apr 2025 15:29:59 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861656c8f96sm270650239f.34.2025.04.15.15.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 15:29:59 -0700 (PDT)
Message-ID: <88a4052c-ac37-4958-af2a-a3066e8b82bd@linuxfoundation.org>
Date: Tue, 15 Apr 2025 16:29:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors during
 kunit run
To: Borislav Petkov <bp@alien8.de>
Cc: thomas.lendacky@amd.com, David Gow <davidgow@google.com>,
 "x86@kernel.org" <x86@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
 <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
 <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>
 <20250415180128.GJZ_6e-B3yFuwmqWWS@fat_crate.local>
 <8b08e040-fee7-4344-8ba6-bbbd4f73e318@linuxfoundation.org>
 <20250415221702.GMZ_7a3meDh4e0L11s@fat_crate.local>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250415221702.GMZ_7a3meDh4e0L11s@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 16:17, Borislav Petkov wrote:
> On Tue, Apr 15, 2025 at 01:06:49PM -0600, Shuah Khan wrote:
>> Does your arch/x86/realmode/rm/pasyms.h has reference to sev_es_trampoline_start?
>>
>> The one in my tree has it.
>>
>> arch/x86/realmode/rm/pasyms.h:pa_sev_es_trampoline_start = sev_es_trampoline_start
> 
> 
> # ./tools/testing/kunit/kunit.py run --arch x86_64
> ...
> 
> [00:15:36] Elapsed time: 58.840s total, 2.096s configuring, 53.170s building, 3.487s running
> 
> # cat arch/x86/realmode/rm/pasyms.h
> cat: arch/x86/realmode/rm/pasyms.h: No such file or directory
> 
> Could explain why I don't see the issue...
> 

I see arch/x86/realmode/rm/pasyms.h on my system. It is a generated
file from arch/x86/realmode/rm Makefile

Here is the target information.

REALMODE_OBJS = $(addprefix $(obj)/,$(realmode-y))

sed-pasyms := -n -r -e 's/^([0-9a-fA-F]+) [ABCDGRSTVW] (.+)$$/pa_\2 = \2;/p'

quiet_cmd_pasyms = PASYMS  $@
       cmd_pasyms = $(NM) $(real-prereqs) | sed $(sed-pasyms) | sort | uniq > $@

targets += pasyms.h
$(obj)/pasyms.h: $(REALMODE_OBJS) FORCE
         $(call if_changed,pasyms)

The key is how and why this file gets generated and why the reference

pa_sev_es_trampoline_start = sev_es_trampoline_start

is added unconditionally even when  CONFIG_AMD_MEM_ENCRYPT is not
enabled. I think the logic should be fixed to take AMD_MEM_ENCRYPT
enabled or disabled into account when this pasyms.h file is generated.

kunit test run starts with no config file and generates its own, so it
isn't coming from any existing config.

thanks,
-- Shuah



