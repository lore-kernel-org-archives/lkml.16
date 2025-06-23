Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E152D3A68
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701448; cv=none; b=lzLckWCvxzUGgE142dwpKgdCH1KLvIEVOSwvNNMdPhiIsNMZtx03twPqzDkcTF0ivBsthicZwUPzmst7+Aqa/4dI2EE3yXhoUVxGZ/nn5MYpdq8pnOSUQTeD+UZ8BtKi5QOJ5C2tzHzKHhIwRxwcKYAX9oPie42w90C3NOfng4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701448; c=relaxed/simple;
	bh=MypgoaxQdUfc7WcuXk/mSIK0CPcArp2bcJtmeZbzQq0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LuI4IR9HG31+xqSbHAiCD52GVCxBS7xkM344SF8fbetjkOeQVG8qxCGpby18VjHhV/DUtpho+CGM0djFQhRpMvmHsTbvahHYm3VZKxPZZi9WqNlKHyxVkQsOrh8rxp5/m7loKcvgexAI23xMIrYU638XhiSjR/P0OXN5NrCbDXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9Gxumgt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9Gxumgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750701442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvVG7t7on/8Z94XeGfz1ypiBNg9HvIA6267+9aFrvX8=;
	b=R9GxumgtUJkyFkx/feBERs35hGokjI+Xdz6pWBF7JwneQtDkP2Elig01HaNrUUNpX421Ho
	akrxNMBXTKM5xyqaY6eRI/fYGz6U83x+lyY0N1bSpU7dU0aaTaG53kBM9pYP3npjTWdh4Q
	ZrSelHDodLQdI/i4RCIzhG3vc16RY18=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-Z-vvw1j7Nf2x9LT7z8pxLA-1; Mon, 23 Jun 2025 13:57:21 -0400
X-MC-Unique: Z-vvw1j7Nf2x9LT7z8pxLA-1
X-Mimecast-MFC-AGG-ID: Z-vvw1j7Nf2x9LT7z8pxLA_1750701440
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31315427249so4437335a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701440; x=1751306240;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvVG7t7on/8Z94XeGfz1ypiBNg9HvIA6267+9aFrvX8=;
        b=V9qOCJP9hZjdwqKBTofuzlFT3P+m3JOqR6pVxnIPownZEBASPttRYRggeiQGgYulLS
         BsDl5OwU1AYT3kTqALN3RZlEjF4sAA93YN3ZIeyx/npswz3cTpyiqPN+RaVrcsvH85td
         /Ez0FWn321zUaLu/M6v1p0Ywxmbg8tCWoLcvQK7bEKtwURGeB3oeTMCZnn3vk+R9gFGA
         7AZIo+FnOGEVuax799rCcqbE9Lz+U6DQHX1Ppt8HHcQDEKo4/Ql0/f+BbCupiEsyXt5s
         mV/uDZ4HF5CYKi2vnqSEFOyiDgviU8GWTwVx57C68L8T6nT07ZeiSa9THl4s/aKBPgYb
         CRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKRyHnHEUjc6Ft9BYcxGGrdmRSygCHw+iIZZNitgjUyjGLIXMRky/VnRcxXL/PZs/zI1oDxsdUSjnbxrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoVNaBPC7ZNgF+wCDiDp2jjrFwJCYVKJPbR37PZZ0AP/mGxfvE
	MtfzIKmmBXW3ZiPywZ2viVH7/buxQU9YzwIdFFLj2P3uX+YxLkpBbHWuU/lVfful/yG+6R9uNwJ
	5fx8moqbYiFCZ7Q4HCeo/ONtT62eM8rD02a/TLQ3k3QHcoCysyPoUG5xUkyBDKKGjEQ==
X-Gm-Gg: ASbGncunum9yxra7W6hYSwQJ09Qz7EBJHjKh01ehi4C32TufLcjh4HcSRoMqnmd3KIS
	vedt/eSfmbi+fzLw4pbRKlZTcgR6NNnKkwxCgLmaTH68rC1AH9Az2M/rtXgxULsiTDid1kUWbxK
	9kWKtaSeiL5jI/Lh7wG8SWStqim7tqBPMoetNufuG8Wilt/Z2ob3QOGha8NxEWDiVb4o5LhcIaw
	NK5evc4Y6ExEhFb5ZX6oofPPW0RWcIGr9o3z7Vh8J0NuvjWhrHeFo2wR2GBiqMl6KVjgq5nMDYK
	/RMKZb7Ide3pLidIGRtUcKAs78OkUkQam+W9jBLzfmKz8yWaBoqaCF8yL9nuM6+eIDos
X-Received: by 2002:a17:90b:2e4d:b0:313:1c7b:fc62 with SMTP id 98e67ed59e1d1-3159d8c7d8amr17455316a91.22.1750701439955;
        Mon, 23 Jun 2025 10:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNPoLs6TXX0qmmN7mYQN6hu5HpWXSe5bcJrfZaExpIzIuj3lksPwM7uC9JUBolt6tpc/fT6g==
X-Received: by 2002:a17:90b:2e4d:b0:313:1c7b:fc62 with SMTP id 98e67ed59e1d1-3159d8c7d8amr17455291a91.22.1750701439617;
        Mon, 23 Jun 2025 10:57:19 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a24c3f0sm11177969a91.22.2025.06.23.10.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 10:57:19 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <509c307c-c72f-423c-b5c4-a1c5fdcac7a1@redhat.com>
Date: Mon, 23 Jun 2025 13:57:17 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
To: Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
 <aFmRQLv2RWbqX01b@slm.duckdns.org>
Content-Language: en-US
In-Reply-To: <aFmRQLv2RWbqX01b@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/25 1:39 PM, Tejun Heo wrote:
> Hello,
>
> On Mon, Jun 23, 2025 at 01:34:58PM -0400, Waiman Long wrote:
>> On 6/20/25 11:22 AM, Frederic Weisbecker wrote:
>>> The HK_TYPE_DOMAIN isolation cpumask, and further the
>>> HK_TYPE_KERNEL_NOISE cpumask will be made modifiable at runtime in the
>>> future.
>>>
>>> The affected subsystems will need to synchronize against those cpumask
>>> changes so that:
>>>
>>> * The reader get a coherent snapshot
>>> * The housekeeping subsystem can safely propagate a cpumask update to
>>>     the susbsytems after it has been published.
>>>
>>> Protect against readsides that can sleep with per-cpu rwsem. Updates are
>>> expected to be very rare given that CPU isolation is a niche usecase and
>>> related cpuset setup happen only in preparation work. On the other hand
>>> read sides can occur in more frequent paths.
>>>
>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>> Thanks for the patch series and it certainly has some good ideas. However I
>> am a bit concern about the overhead of using percpu-rwsem for
>> synchronization especially when the readers have to wait for the completion
>> on the writer side. From my point of view, during the transition period when
>> new isolated CPUs are being added or old ones being removed, the reader will
>> either get the old CPU data or the new one depending on the exact timing.
>> The effect the CPU selection may persist for a while after the end of the
>> critical section.
>>
>> Can we just rely on RCU to make sure that it either get the new one or the
>> old one but nothing in between without the additional overhead?
> So, I had a similar thought - ie. does this need full interlocking so that
> when the modification operation can wait for existing users to drain? It'd
> be nice to explain that part a bit more. That said, percpu_rwsem read path
> is pretty cheap, so if that is a requirement, I doubt the overhead
> difference between RCU access and percpu read locking would make meaningful
> difference.
>
> Thanks.

The percpu-rwsem does have a cheaper read side compared with rwsem for 
typical use case where writer update happens sparingly. However, when 
the writer has successful acquired the write lock, the readers do have 
to wait until the writer issues a percpu_up_write() call before they can 
proceed. It is the delay introduced by this wait that I am worry about. 
Isolated partitions are typically set up to run RT applications that 
have a strict latency requirement. So any possible latency spike should 
be avoided.

Cheers,
Longman

>

