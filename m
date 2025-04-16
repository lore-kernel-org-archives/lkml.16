Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175691E3DC4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765751; cv=none; b=VEjAT0HOsz973/916sbHJ2yyLPD5mxRm/kkQocSCencFvxlCBjy3SwY9LYl4wY8yRPweYJBVsBdvlIAKk6dpxtroTI9CazuZqTHhznIH8epwfRLxXei1w9SM6E/K6h6wGmuTfLaNk++PrJSnSAoShxsurPLITzzu6TmwCz9dNo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765751; c=relaxed/simple;
	bh=90GOVhsjwFiXYK/QyRkXWYdRMy6wyktuaZoBVjZFbdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjlCRr14vkjFJKCzIIKP7xDyOPH7I0q/wf+1skVZBovati9P1jBDDWr+Q//KNf1bJdOFMJYNLgpI/+gp5YP0ldyOm3NSTwwxMnnlqNSKoU/BdpGckyaN+YdbMqjqLKkt0JxO1bDjPYIwRksaUEMwliAn8cv6FJY6u4Lp/2twNTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gb5cyd+I; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gb5cyd+I"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d46fddf43aso45272215ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744765748; x=1745370548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yHH7/J+j5oNxpctk0DsReMy2glTgCxz7YjjDhBFapIU=;
        b=gb5cyd+IXHv5Ep+DnjFjKOt97GUICa88/OiJWLK7KVdXahFC0LQwnp3l5QoGHFz/D+
         V25U/Qh3L8fwKszxdkhMZfzw9/jAYbypTxeFkQqgElzn+GRw9Bm2rnzmwIgqKLuq9U3N
         vVz910zeNcYZVOYMnrSWM/lcyVCQsvRz4r8w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765748; x=1745370548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHH7/J+j5oNxpctk0DsReMy2glTgCxz7YjjDhBFapIU=;
        b=KBLVNlOKJawrI1/qT50QxGPbh3ZxCCOLmprcsB39k+oGvgxSLOE6coyw/YDzVQbMif
         G9KrRTuY1oSy3Pe8aAjePj+CA2UenuxHApQpvLl7jjiI6LRRNFqzcHjriLovxUPBRucL
         TGb2/U2kAL3rCIFc7Cjo3CpUZ9mugpJzJRmJnfGChjE1UM9+vYkSCFQZLbmoJxz0c59h
         n4HRZ2qSYLFkem72whzR+LZg2wVNQW1gnti2pUdTaUsqnB2sdncDC3Q3Upmz6jKfa24k
         tr4b0gj9lpPZhyGX7La2kUVBYnglrqsj10Xb1gaATW6AsTfVnCiGhpXv7Q0P5rMmWhaM
         hD/g==
X-Forwarded-Encrypted: i=1; AJvYcCW4k9EKHf0OsbZWkl03A9AC6Do1DaDH8IsQWSCGvdGcphqxqLJgqi6n0b3+MxDmUhM/szOsRiVI5gvyrd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+50YlbfK5AC9VswGQ82PzCH6rS73cVgahWytzIkRD5To4b5sf
	h3ppl8A6uWo2B+uen1eSVgnSSMH0fvjodmzyRUA+b2i1qgrB0kL7Kb+eIFV2pfk=
X-Gm-Gg: ASbGnct6Ki0IBFE5n9oApEXbOGltHHuRCI+6xVaj2AsoYUYRa/cy+aITFZA3roEfN98
	FQgZdnbZWFcllQWpX/fqsZvFj1GXegzA2Ly7jrjCQBf9vOpELzDlwbDCKcDBbLb211DXjgtdJrc
	LE0tZIakGeL1hmi3lJc5sQOgOG+43YKzzSBFVEndZJJ24WN3mKeme2aqazTElJVtjymCbif7Ki+
	7fsrxVqJn8hvgkK3k61nFE0fIy0xOtzi38b8/wggP5nkjGLrQTagCxw8I7gFdPasdPfaKVDdFs7
	CQTEy+ycr9/Thnx/NkNQ84+bsLWTIialb2nGzrTds6EptuC/gs0=
X-Google-Smtp-Source: AGHT+IF+8G6LNZgvGtT9E/XTGEpuSUvuxgkYRbTxEhcuzH6CxHEUsEBBzVYErI3v884mpv1TxMSTXw==
X-Received: by 2002:a05:6e02:1806:b0:3d4:2409:ce6 with SMTP id e9e14a558f8ab-3d8124e2600mr18521955ab.5.1744765747926;
        Tue, 15 Apr 2025 18:09:07 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dc591b9bsm35565255ab.60.2025.04.15.18.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:09:07 -0700 (PDT)
Message-ID: <6775da23-c596-44e4-a7f3-64c602b2609b@linuxfoundation.org>
Date: Tue, 15 Apr 2025 19:09:06 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors during
 kunit run
To: David Gow <davidgow@google.com>
Cc: Borislav Petkov <bp@alien8.de>, thomas.lendacky@amd.com,
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
 <88a4052c-ac37-4958-af2a-a3066e8b82bd@linuxfoundation.org>
 <CABVgOSmXfoEonJ6w33sj1sb5F2Ak5Kek0AxskSmjq=d=D=PiVw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CABVgOSmXfoEonJ6w33sj1sb5F2Ak5Kek0AxskSmjq=d=D=PiVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 18:32, David Gow wrote:
> On Wed, 16 Apr 2025 at 06:30, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 4/15/25 16:17, Borislav Petkov wrote:
>>> On Tue, Apr 15, 2025 at 01:06:49PM -0600, Shuah Khan wrote:
>>>> Does your arch/x86/realmode/rm/pasyms.h has reference to sev_es_trampoline_start?
>>>>
>>>> The one in my tree has it.
>>>>
>>>> arch/x86/realmode/rm/pasyms.h:pa_sev_es_trampoline_start = sev_es_trampoline_start
>>>
>>>
>>> # ./tools/testing/kunit/kunit.py run --arch x86_64
>>> ...
>>>
>>> [00:15:36] Elapsed time: 58.840s total, 2.096s configuring, 53.170s building, 3.487s running
>>>
>>> # cat arch/x86/realmode/rm/pasyms.h
>>> cat: arch/x86/realmode/rm/pasyms.h: No such file or directory
>>>
>>> Could explain why I don't see the issue...
>>>
>>
>> I see arch/x86/realmode/rm/pasyms.h on my system. It is a generated
>> file from arch/x86/realmode/rm Makefile
>>
> 
> Aha: I've been able to reproduce this, albeit by not cleaning the tree properly.
> 
> - make ARCH=x86_64 # Build an x86_64 kernel in-tree, with
> CONFIG_AMD_MEM_ENCRYPT=y
> - ./tools/testing/kunit/kunit.py run # Attempt to build and run KUnit
> on a UML kernel (built out-of-tree in the .kunit directory)
> # This will fail, telling you to clean the tree with 'make ARCH=um mrproper'
> - make ARCH=um mrproper # Clean the source tree, but incompletely, as
> the original kernel was built with ARCH=x86_64, not ARCH=um
> # As a result, the pasyms.h file will be left in the tree, as it's not
> part of the UML build
> - ./tools/testing/kunit/kunit.py run --arch x86_64 # Attempt to
> build/run an out-of-tree x86_64 kernel.
> # This will not tell you to clean the source tree, as it was
> (incorrectly) cleaned for the wrong architecture, but will fail due to
> the wrong pasyms.h still being present.
> 
> I'm not sure if this is the same cause as what you're seeing, Shuah,
> but it seems plausible enough. If so, this is really an issue with the
> Makefiles suggesting the wrong make mrproper command (assuming that
> the architecture hasn't changed), or failing to detect that the source
> tree still isn't clean. Maybe that's something we could work around in
> either the arch/um makefiles or in kunit.py (or at least the
> documentation), if we don't want to rework how dirty trees are
> detected.
> 

Yes I am seeing the same thing. However, it doesn't even ask you
to run mrproper because it doesn't seem to think the tree is dirty.

So the fix would be to detect that the tree is dirty?

I just tried make ARCH=x86_64 mrproper and then ran
kunit.py run --arch x86_64


> Either way, this should work after running `make ARCH=x86_64
> mrproper`. Does that work for you?

I just tried make ARCH=x86_64 mrproper and then ran
kunit.py run --arch x86_64

thanks,
-- Shuah
