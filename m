Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EF4250C02
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694482; cv=none; b=CmIuVD1+1hgkfCsDUAkrqXWJQzTYVj1T/equhlm4dA7fIms0EDAGt+bs1px5VmCSkHCg2mtSPLxNLDe+YEttj26JC4aEfEc0SnqVTxECCzDLMrBIyRRzPBQHNacYYq0UaXgz1teWbltVF+/QX+oQmeHrNSry9eZxd+uiD+qF9Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694482; c=relaxed/simple;
	bh=ihBIHIzCOOjJdQRHTsYDtH3o52ZbhZhK1BO0NUjqUNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ss6daoeo9H99QSX0I5P4ABqFqwrX2M5YRSbgD2O19eL/C8JVksnVzqadvEabPOiREbPuQoPo6Hd9diDc9Ujdu4mvNH/kTWQDTGrP9Oph/zBdbuqYseEN7iWaR7zRspJOa3taLxJ2cg37JOLN5qmcsMxZYTR+VMrnxKbOvVsuXXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Phdpv3tO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Phdpv3tO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so7962065e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743694479; x=1744299279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYVPvQ2hyQ17r8XvbmqS/vvZYr2MQjVfoHgw/J/djG0=;
        b=Phdpv3tObnGkYF4HciiA4QsaRruvvbc/cgnc4OncC/+9++mFVB8ONvLVB+762xtdI2
         WQhzhXjJVqNZhxVHf1kJQRqtYzRBR+dQM2tjor6XqqJS6wWpkEWPUABD8837csgyEwlU
         KuNjtTOtEsnjpTbWBWJQ4djEtOyUy/p98s1lS4BVvLU2ep8hhx6I2lbL/RV4K48a6rCC
         IIdU2e5wHpn9rJWo2QQs2SegqExzSiOfEiBINxPwqaupQs7TgCNgxoCVzkJvgrXSu4EF
         EDbGto+E/U3e49V9LDdnU7MwzCDF+LF/MqnxyVH+K0MRUsI6jXammBbsql8lU/0HdLXs
         7b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694479; x=1744299279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYVPvQ2hyQ17r8XvbmqS/vvZYr2MQjVfoHgw/J/djG0=;
        b=Hva0k+rQpajcKZUEsdRLPbia6InhbL89d/DwEDomeN4xHUdVYY5hoglgoKUXIuSxhi
         yCgt33Dc9OD8KRV0F84BzV86bJwKWJN6aOrF7Lvqpno62ruyjEiyz/tzKZ7E5a/mFW2E
         SzDMMNDl+8xlyb4D9lAGScADLK9vydXAZJ9lqpGTJ9D4lDfoUstSJ2+04Vmou9vbyvtp
         TbEEAfvCrOeHtQYym/PCwdXZdwp1J1sDEB55YIAu/gveuLjb700EY4YFyP9nNDPWYHwe
         kzw3Be1VOqMO98cG4EK0WiFl49GsSk5k+ixt6aUrotGPXzF8JXhkujBtdtgQB46KVyDr
         GRtQ==
X-Gm-Message-State: AOJu0Yz5DrTOdJRZbwb5+K3RPLFPsouPIkWBY3kruloRmeGzZcCmO3wS
	V/HjtAS2hIJSb5ZO7CRdxo4oSKtI2w7QDeBi91qyMH3I735eq939e78fmhlVFMw=
X-Gm-Gg: ASbGncs3pYmH5QyDwATOQweWJs9dYhH6vtt6jd4Va2N2JfSoH1UqUqil477SKTGYYcy
	zIyiKDGW06D4e5BS6xU1K6qz0wbVeFaTzUKpBmAC4k7xREX9DT48e7rt6HVbsRI7b9tyypaXjq6
	/V36Rg/ELAo63C6qhUG2YXbiQJGDqs4CuipHK8xMAsKBsp5Kzoh9GNPPMDqrMt5BMt+Fte6TmJN
	AvIHusvtQEd4l2d0toehtFnXLwn8HrUJKwqBDVdxRujR0V2RDaO5OHS3A4+GFRZp33keQjHgm1B
	9UFQ94CSXwh5lM7WnaRIrB+v84cqxiyPT9yKnchAWkGcAd/v2w==
X-Google-Smtp-Source: AGHT+IF1GLYfokLUPVuBw3lvGqomQDNbeuY4jcUUttNX5JmUgF3n2OwVx9ZUTw42H8DNk3XpUJhnFA==
X-Received: by 2002:a05:600c:3ca6:b0:43d:98e7:38dc with SMTP id 5b1f17b1804b1-43db61d823emr217005995e9.5.1743694478761;
        Thu, 03 Apr 2025 08:34:38 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm21260145e9.19.2025.04.03.08.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 08:34:38 -0700 (PDT)
Message-ID: <b7c3882f-9691-47fc-9e50-267fef9cfc06@suse.com>
Date: Thu, 3 Apr 2025 18:34:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/49] x86/alternatives: Move text_poke_array completion
 from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to
 smp_text_poke_batch_process()
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-38-mingo@kernel.org>
 <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com> <Z-6PWWyopb86UC6y@gmail.com>
 <a64bc000-4226-4d5c-8486-a230f4ff5065@suse.com> <Z-6XkEpiXg4stqLY@gmail.com>
 <b0b87bd7-e104-4c9b-b9e2-0682dfef28e9@suse.com> <Z-6pQPDuNkshB04F@gmail.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <Z-6pQPDuNkshB04F@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3.04.25 г. 18:29 ч., Ingo Molnar wrote:
> 
> * Nikolay Borisov <nik.borisov@suse.com> wrote:
> 
>> I meant doing this:
>>
>> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
>> index 5b1a6252a4b9..b6a781b9de26 100644
>> --- a/arch/x86/kernel/alternative.c
>> +++ b/arch/x86/kernel/alternative.c
>> @@ -2587,12 +2587,16 @@ noinstr int smp_text_poke_int3_trap_handler(struct
>> pt_regs *regs)
>>    *               replacing opcode
>>    *     - SMP sync all CPUs
>>    */
>> -static void smp_text_poke_batch_process(void)
>> +void smp_text_poke_batch_finish(void)
>>   {
>>          unsigned char int3 = INT3_INSN_OPCODE;
>>          unsigned int i;
>>          int do_sync;
>>
>> +
>> +       if (!text_poke_array.nr_entries)
>> +               return;
> 
>> -               smp_text_poke_batch_process();
>> +               smp_text_poke_batch_finish();
> 
> I suppose we could do this - it adds one more check to
> smp_text_poke_batch_add() though.

poke_batch_finish you meant?

> 
>> AFAICS this doesn't change the semantics. I.e smp_text_poke_batch_add
>> will call poke_batch_finish iff the address to be added violates the
>> sorted order of text_poke_array. The net effect is we have 1 less
>> function name to care about.
> 
> Yeah, it doesn't change semantics, but it's a very small
> deoptimization.
 > > Mind sending a patch? It does simplify the facility some more and that
> single branch will wash away against costs like the CR3 flushes done

Given that poke_batch_finish does a cond_resched and sync_each_cpu which 
is an IPI can it even be considered a performance critical path ?

> ...
> 
> Thanks,
> 
> 	Ingo

