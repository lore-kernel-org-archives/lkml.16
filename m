Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768041F37B8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776180; cv=none; b=lurWsvRmOyVOVxRsNWVvrNkVGdz12cECcqPs6u6gCTd8kDU7jd6dJhJ7QreP+6IJ5r97UTDKW1tMFhO59q8nLfXN8ttQoOvjd6cP8jd/BvNpGBP4c4vvHJ7KBOMlP1Ecey/iL6q40crffM0vduL6irJx7sHJpQNF05wyollygVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776180; c=relaxed/simple;
	bh=/zqRrrqqb0pTdNiKgLzGOF9uN22u/ObeG06qZYq6zEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6hR6jMUkueqCGz0ItAJpG7wx+Ud4PWHVjN5y3mnswGRDQayO0noJkg38kUnAUHBltEXbdcK/4BPZEpTu/bQWaiJqub09rqCNSkvMa+T/9czpXJN4Qqz798T2bCwbYxgMeaIo1I9y2j6CvwmFkLPAiAnTDOp0CxpXWdwPqcyztE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=eY7WD3A7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="eY7WD3A7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-399749152b4so1256076f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743776175; x=1744380975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/zqRrrqqb0pTdNiKgLzGOF9uN22u/ObeG06qZYq6zEs=;
        b=eY7WD3A73XJUQU43t6G5I4czGoklllPACy4Y4psytGlKh26nHirRDQlzVKl+iQMVQ5
         hFKeC4EbepIdqtBQ0O8uKUyQieS5e4XlWhI8CTvs4fDI1DWDZqFn6+RjyCBb3aq4IERV
         iNIxHDg2vxEffRLR98fliI/u+Vwg3CUn3VMQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743776175; x=1744380975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zqRrrqqb0pTdNiKgLzGOF9uN22u/ObeG06qZYq6zEs=;
        b=ZyGaLTY3eiDGdDXAspRZZMIf51ZAoOMw2xHyJrpSXl8T+h0ipPq64BZwMMeMDaH+Mr
         qHY+f6BQSpxLz9c8zm1ST+HIKoPhgRsqYcc3h0zGlqgLpt/wOTholiQqR30ytcXlt51t
         dKbG/K4bsLGFpJDIkhdEX65wjrFL/7sdwkTzrq8lOkSxMoS3A4OcM7Zx13kNZl81yu0A
         DjAh6VPDevFJMt6b0mXzA3AWmVQJOcAzuSEvERcUoGzpRNcoouUxNzGrOv0F5WZ/VoHG
         fgltMWUQ07gjfvUYQKQLP387G4OZyLZ2CQCe10RCx+oTH8SazeMbEr5P+honx5wifP76
         1sPw==
X-Forwarded-Encrypted: i=1; AJvYcCUEWL7P3KOsnCMNXg7RKZhZmR6zNLtvMTXm5U5QP1RM+Z2nqj5/dAXh9hfBdHwWKCsQF2uLMNPZBtT8xy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4cGWZIr26Vr/RPV/2LcI2q3ZRDh7NjHYkfrSV8M+6xx8fb+G
	k3ABr1YJwf9qusegha34RWUwkSdrGtlOW00peFlKbeL1lB7CckAwRHmndexen2E=
X-Gm-Gg: ASbGnctcznlJTgt4uDjJ7gjv3oSMrAtOx1G7zifiSuS19ZeXjMg6nIG72Ve4IbIiV3l
	u0cB0zSteWBcr0wM4Xp0GXNnFHQvemJzaEoqFN1DJCoFAXxGCV5Oj0CE98mmvgf3N0PZ3TDoIB8
	M6eyb+krQcrOtLsl8tWrE6SUz1XkkbamAJHngRD5FD7VGU3K+eJIfgodBGxGWu2cbl8az6NFFxB
	P7N/3DpWBK1PJ1ieCvCBDlvQQW7V2PKfYh1FBLm7jlko3ZQS5vt6qfrkTWdpAmEBA+MJASZUQvT
	Z1TqUFcS/OplX/Ip6nl5wY4A7qQ6Zk4aV446C9aTnQfIip6NTMRl8/l1s9CWA9tXtjWsKTc25bh
	We1EAX0rziA==
X-Google-Smtp-Source: AGHT+IGXtFEq0vn/o80sZdyMig536wW0uYfX3nAPIABUZtcw433uxiDhYoEp8jwJYj4J3tJ/cQjAvg==
X-Received: by 2002:a05:6000:2410:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-39cb35bd8d9mr3189296f8f.16.1743776174636;
        Fri, 04 Apr 2025 07:16:14 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7225sm4452230f8f.26.2025.04.04.07.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 07:16:14 -0700 (PDT)
Message-ID: <4fff7dd0-70e4-4ec8-9ca7-7f7c52382d51@citrix.com>
Date: Fri, 4 Apr 2025 15:16:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR
To: Uros Bizjak <ubizjak@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20250402172458.1378112-1-andrew.cooper3@citrix.com>
 <1640cf43-8125-a562-91f9-9b306b863dc7@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1640cf43-8125-a562-91f9-9b306b863dc7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2025 3:14 pm, Uros Bizjak wrote:
>
>
> On 2. 04. 25 19:24, Andrew Cooper wrote:
>> Commit 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH
>> workaround, add barriers") adds barriers, justified with:
>>
>>    ... and add memory barriers around it since the documentation is
>> explicit
>>    that CLFLUSH is only ordered with respect to MFENCE.
>>
>> This also triggered the same adjustment in commit
>> f8e617f45829 ("sched/idle/x86: Optimize unnecessary mwait_idle() resched
>> IPIs") during development, although it failed to get the
>> static_cpu_has_bug()
>> treatment.
>>
>> X86_BUG_CLFLUSH_MONITOR (a.k.a the AAI65 errata) is specific to Intel
>> CPUs,
>> and the SDM currently states:
>>
>>    Executions of the CLFLUSH instruction are ordered with respect to
>> each
>>    other and with respect to writes, locked read-modify-write
>> instructions,
>>    and fence instructions[1].
>>
>> With footnote 1 reading:
>>
>>    Earlier versions of this manual specified that executions of the
>> CLFLUSH
>>    instruction were ordered only by the MFENCE instruction.  All
>> processors
>>    implementing the CLFLUSH instruction also order it relative to the
>> other
>>    operations enumerated above.
>>
>> i.e. The SDM was incorrect at the time, and barriers should not have
>> been
>> inserted.  Double checking the original AAI65 errata (not available from
>> intel.com any more) shows no mention of barriers either.
>>
>> Note: If this were a general codepath, the MFENCEs would be needed,
>> because
>>        AMD CPUs of the same vintage do sport otherwise-unordered
>> CLFLUSHs.
>>
>> Furthermore, use a plain alternative, rather than
>> static_cpu_has_bug() and/or
>> no optimisation.  The workaround is a single instruction.
>>
>> Use an explicit %rax pointer rather than a general memory operand,
>> because
>> MONITOR takes the pointer implicitly in the same way.
>>
>> Link:
>> https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
>> Fixes: 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH
>> workaround, add barriers")
>> Fixes: f8e617f45829 ("sched/idle/x86: Optimize unnecessary
>> mwait_idle() resched IPIs")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Thomas Gleixner <tglx@linutronix.de>
>> CC: Ingo Molnar <mingo@redhat.com>
>> CC: Borislav Petkov <bp@alien8.de>
>> CC: Dave Hansen <dave.hansen@linux.intel.com>
>> CC: x86@kernel.org
>> CC: "H. Peter Anvin" <hpa@zytor.com>
>> CC: linux-kernel@vger.kernel.org
>>
>> v2:
>>   * Fix the same pattern in mwait_idle() too
>>   * Expand on why we're not using a general memory operand.
>> ---
>>   arch/x86/include/asm/mwait.h | 11 +++++------
>>   arch/x86/kernel/process.c    | 10 ++++------
>>   2 files changed, 9 insertions(+), 12 deletions(-)
>
> There is another instance of the same sequence in
> arch/x86/kernel/smpboot.c:
>
>         /*
>          * The CLFLUSH is a workaround for erratum AAI65 for
>          * the Xeon 7400 series.  It's not clear it is actually
>          * needed, but it should be harmless in either case.
>          * The WBINVD is insufficient due to the spurious-wakeup
>          * case where we return around the loop.
>          */
>         mb();
>         clflush(md);
>         mb();
>         __monitor(md, 0, 0);
>         mb();
>         __mwait(eax_hint, 0);
>
> Should this also be converted to the new sequence?

Yes, it ought to.

I'm OoO for a while though.  If you fancy doing a patch, please go
ahead.  Or a maintainer could fold a 3rd hunk into this patch?

~Andrew
