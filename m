Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4BF29405
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495587; cv=none; b=R1g80KPaaVRyaDzTp4zQtshdImYjcorMXuL4Sebc/m1QOfF+BCo8U1TG/UvIMLIFZuUak8JNlGu0d67yRcdc55LTwzMn2U/GFZ489iWNGzeWU5Z2iRYkT962J7bbW0qLcUYpKRQfzcUt9s+9giFtEU58RjzH6GihHT1cbeKDYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495587; c=relaxed/simple;
	bh=VzWE95JHu+6ps8xODaiUXmqGRdbgYos34f1SFJJi3sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3O1WU2n7lTve3qFS0YMvq+yXGgWK85Z4I/R3QF/C2GU555MvSvhRMMks4rRUofPTJJuBx6T69Z/f8zFaiu/ElhvQjX/9rkBN93WJGEWzTSWmEZGiDZ3Pp86DIQ2JDNlhUfXI/59mCEwwrCeIgC0E7mSjkyP5R5Xu/xEz3P4HII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiWQDaVX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiWQDaVX"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab771575040so1237729466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743495583; x=1744100383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwtHrPoTP0MDyEQ74ZkW34WnWGYPrTsvxWZOlLCWzQ8=;
        b=fiWQDaVX+xqvrxycgYJ0yA4uPM+xgyPS+oV2ku2ze8dNBRIKjNeZvRymbNvg6F/hTx
         1zxefPKvHtdrYq6K18ITeLGzxTht6fY0p3IKE+5HxO4rrDG5LarVwWG+jMMl6bFSb3I0
         MuB1OKXpZfJ79twyVzYXiLI+rHhV10hkdjUkgwVMQdFdQ9mcW8oKvzpLPXtCPrHsZ23p
         ILxjNmFOpnFScyXSLWuAFWMPCgLfu12bFlJqmyLRtP5fWSax2mQImwJcqHSql1Cfg0QD
         4ThRMaqXPEOu48eimT/kmTv36TI+dNEu4j5BWZUuDCGqRyWgKPVRNR8A8wtm1E/QW1bo
         VUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495583; x=1744100383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwtHrPoTP0MDyEQ74ZkW34WnWGYPrTsvxWZOlLCWzQ8=;
        b=MD6+8ju3zIbssJkAH5YSXswAvERqpt+/wrPAV1ki25MVRYAO+SQBNGDJQRkkWF41P4
         RW4wuYnH6j/UovJJ7W35LwL43yoWR5r53LE6j2LsbmIAe5OzKSt508gRvez/IfJKtVay
         DrV6nByv2JpbiGh4kygq92WNqNRhQrHjP3YxNfTmL7+BwCcS51qo6j/Da7TlVjynZsme
         7HN6WhkGx6679cn555DP3uRnax+4CQ8AXJ7jIP6UFRi30/N6nQ0g6fGRQbrJTxlvUTtt
         OdXZZ4P3T1U+12VakpwMuU6zZ7QWMmC4SpM9noV9N7hT0E9TXXIt/nuI48tI+hHrIJs8
         WAFg==
X-Forwarded-Encrypted: i=1; AJvYcCValtX3KTLtlrdJwidmrAMnLLT6IeodxqRSh4H+wlsfSq+5GgQ9M0FoULLnlIYY2tzS4yzeGzMNp1VrFtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywX4Ha8DkGbaAVG/BJ7hYKquEElMPcfuRJtZejyv6OqQYprBq+
	eu+7d/NMhstelbEYqVbqcTBilPdTrDTm2BPjN24Y8pCTQNezt5Ba
X-Gm-Gg: ASbGncuNYvD+RDmfEM9F056Wkqj4vBPDNZMKgThVT5A8JyblB3DLSVLKjUUZOcn0bEt
	VqVwgT4BBfQR24k214FBoIWVZy8g3QgtX8ObYo/d1It3uhaLYlYtVVMZSeRiHx09nzOi7dETDgW
	duU/gqLiFao4/wZrHb86k5aL7yJdUdxnLs7myrVHSH8+STCJBQFAOoEfwCrstO2DbmzyORnV60r
	bctUxFu5T95AtJh4biyXlU8zD1wBypSQ9mfXc3AknkE+LbPiRKTLEK+D/zOH/D8wYKWny+FMz68
	bDAvghYYa1FMjdlJZ9wu88ZQrSc1hEBpfrhfmwJWS/sN2QaTZmJgi5Th
X-Google-Smtp-Source: AGHT+IGKr+MQFIo3P82CvDwGJOrUXdKgu3VLF97KXOk4u98EuL08eGssm6MgVKcpdxdTXJ65fQA8AQ==
X-Received: by 2002:a17:907:3d9e:b0:ac3:25ea:822 with SMTP id a640c23a62f3a-ac71eac4628mr1240525866b.4.1743495582401;
        Tue, 01 Apr 2025 01:19:42 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::83? ([2620:10d:c092:600::1:2418])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196f561esm745920566b.175.2025.04.01.01.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:19:41 -0700 (PDT)
Message-ID: <84da7efa-4069-4a00-9f0d-0612e1edf12b@gmail.com>
Date: Tue, 1 Apr 2025 09:21:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHSET v6 0/4] Split iowait into two states
To: Christian Loehle <christian.loehle@arm.com>, Jens Axboe
 <axboe@kernel.dk>, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, tglx@linutronix.de,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20240819154259.215504-1-axboe@kernel.dk>
 <8380f7f3-fd9f-45a0-b66b-85ec0b5d0144@gmail.com>
 <48408728-f062-46f8-867f-61c6d91d410d@arm.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <48408728-f062-46f8-867f-61c6d91d410d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/31/25 11:33, Christian Loehle wrote:
> On 3/31/25 10:02, Pavel Begunkov wrote:
>> On 8/19/24 16:39, Jens Axboe wrote:
>>> Hi,
>>>
>>> This is v6 of the patchset where the current in_iowait state is split
>>> into two parts:
>>>
>>> 1) The "task is sleeping waiting on IO", and would like cpufreq goodness
>>>      in terms of sleep and wakeup latencies.
>>> 2) The above, and also accounted as such in the iowait stats.
>>>
>>> The current ->in_iowait covers both, this series splits it into two types
>>> of state so that each can be controlled seperately.
>>>
>>> Patches 1..3 are prep patches, changing the type of
>>> task_struct->nr_iowait and adding helpers to manipulate the iowait counts.
>>>
>>> Patch 4 does the actual splitting.
>>>
>>> This has been sitting for a while, would be nice to get this queued up
>>> for 6.12. Comments welcome!
>>
>> Good day,
>>
>> Did anything good happened with these patches or related work?
>> Christian>
> 
> Hi Pavel,
> so for cpuidle part we've had commit ("38f83090f515 cpuidle: menu: Remove iowait influence")
> for a while now without much complaints, hopefully that means it stays in.
> So I'd really like to know how the results still compare for relevant workloads.

Sounds great

> cpufreq iowait boosting is still a thing in schedutil and intel_pstate,
> and so far I've failed to convince Rafael and Peter to get rid of it.
> I still think that is the right thing to do, but it does come with a
> regression in most of the simple synthetic fio tests.

IOW, from the io_uring iowait stat problem perspective it got stuck
and is unlikely to move short term.

>> Reminder: the goal is to let io_uring to keep using iowait boosting
>> but avoid reporting it in the iowait stats, because the jump in the
>> stat spooks users. I know at least several users carrying out of tree
>> patches to work it around. And, apparently, disabling the boosting
>> causes perf regressions.
> 
> Details would be appreciated, I looked the the postgres workload that
> justified it initially and that was on cpuidle iowait which is no
> longer a thing.

I wasn't involved and afraid don't have any extra numbers.

>> I'm reading through the thread, but unless I missed something, it looks
>> like the patchset is actually aligned with future plans on iowait
>> mentioned in the thread, in a sense that it reduces the exposure to
>> the user space, and, when it's time, a better approach will be able
>> replaces it with no visible effect to the user.
> 
> I'm not against $subject necessarily, it's clearly a hack tapering
> over this but as I've mentioned I'm fine carrying a revert of $subject
> for a future series on iowait boosting.
> 
>>
>> On the other hand, there seems to be a work around io_uring patch
>> queued for, which I quite dislike from io_uring perspective but also
>> because it exposes even more of iowait to the user.
>> I can understand why it's there, it has been over a year since v1,
>> but maybe we can figure something out before it's released? Would
>> it be fine to have something similar to this series? Any other
>> ideas?
> 
> Ah thank you, I've missed this
> https://lore.kernel.org/io-uring/f548f142-d6f3-46d8-9c58-6cf595c968fb@kernel.dk/
> Would be nice if this lead to more numbers comparing the two at least.

Sure, but I'd rather avoid adding this type of a uapi just to test
it and solve the problem a different way after.

-- 
Pavel Begunkov

