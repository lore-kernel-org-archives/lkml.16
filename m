Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5822C283158
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664569; cv=none; b=mu2t0tUxa3KlZiAQtZm2irQv025GPpZrn0g/DB2nXTohuIsILq9eWrXsAmbCw1JcxrwmppfTq0L9qsTVW+MWNlHHmqoQIdTOoUMiVm6uS0q6STMc+Bb2C3YeIFD10qKa7gQxwflF9iW6Vo++YQRDAc8mPM9askB562oNhINM5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664569; c=relaxed/simple;
	bh=gGOOJfhDZ5SegqCN1QGtjb+q4IT91xtxsNde8Cw0vkQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jY5esgGXcH3jIUHOHiHaA2kRB+Gr6kXvfpvhD2EAmzprfY+6fc9uKucOZtWkBH0HqzE3zvRWw0bTpVCnQIYYd0S1I6LbFyWzbs2VR6Y2RGCc4eSvV6ZcBeu0q1PzaJaYM6mzuXcrn5iHnbldZARSeJZDdF6QvPajvTgU+rozcE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NogNvhQR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NogNvhQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747664566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gGOOJfhDZ5SegqCN1QGtjb+q4IT91xtxsNde8Cw0vkQ=;
	b=NogNvhQRymDymT1lpvG8ffXU58OXvr+OYixRAmDZs2ydYb9sdyTdzQtW8dqmES1eg/xg9u
	E8Dtnmat18X/TI+YA+VK0lz9ORtZ4FJNnex6H/WRpprraJXdtsHlprQVvTM+fed1xheGoG
	Z3iwAaMFgkkNuR3ebo6Bs326BXXnmM4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-bly8XJqJPwuwH0krk39WSA-1; Mon, 19 May 2025 10:22:44 -0400
X-MC-Unique: bly8XJqJPwuwH0krk39WSA-1
X-Mimecast-MFC-AGG-ID: bly8XJqJPwuwH0krk39WSA_1747664563
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ea256f039so36041835e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747664563; x=1748269363;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGOOJfhDZ5SegqCN1QGtjb+q4IT91xtxsNde8Cw0vkQ=;
        b=wsVEQBim0tCLkApXFBuGtlKHIxEspYJo/OrGI/8jswVkA7bu3LlDKg0jfPmvTNaFbj
         NPiGtJM+nq4rvBY7WgTXJ9MLn/M8Mjh8VL1o8JO7sOyjW8Gmeftr9WQd6bxH+DOW7cgI
         UtK1yh1h/83OBMppA3fiSyTBbkRAPk7sf/VM6wPfdPqAzbH3GBkJVBNukwIezBGOD8fO
         Fx3e8R/Nnrm0RfE+sKpNk3bN+a2Ir1A232ZUBId5mkoj/68SiCeyH91+gL32K7ZGWW7X
         nPohoKmmDgmxQmA3i+8IOzE60Sb/RV21fC46BlsB5pPY4KRJAxyLIEXwDhacRFrR6qpZ
         sQig==
X-Forwarded-Encrypted: i=1; AJvYcCXVCwq/KIVkAAxl+PJjjGNTJiv8DDGxGYTXD6JmB2H/IcGbzx/aUaYniNe4bd82jwQJTaKbQTcLEU7gt3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTxwUrGVk3VBOrmJsTZMTXw+F10bbj7z/OfCaCPsalGKuO+KDe
	1kVqlTuyc0oZI+dEPisO/65kestSjl62+PlXUK3Aa8OXy3cLpbezIIBU/Q3bk0j1M9j2jG3O66a
	iW9KaktYU+HE17kvnVk7xeLr8G41Za97jK9jp5q9tMQ1qse7ttXnJlvt1kiCjRFEcpg==
X-Gm-Gg: ASbGnct0s6FID/PxKLS+TTRAsIDGaxpXtRU2huUiOk9dTB8EWnkzQzlL+iUfm6GeUWY
	0D0JjXMOfJH+Q3uzlhw9o2wOQBIV4CEoYsUIriHdOvokK90fP92MjoglAi5x470n+CN7yWO74In
	IMPBXuWf72PGWfV/nPN4n79apQ3SXEFdYx7PtF2zJZgyKEFp8j99x5ZEShGLFVKJUbVKLR4un2g
	V76x3G6sJr2KtVlPHKlxFdiTN1Z3WXcRe2uLhs/X4PoAGGnv7Hi5MN3eiBQNdTZvGpMsyLEm3C0
	uncaSMrEP45mF4OkVvbUQOKGeZLILUN6dU6zswMIejbhAZEJtgyNFTBqxExCQaGTW6sdP6GU
X-Received: by 2002:a05:6000:2907:b0:3a3:64b7:620b with SMTP id ffacd0b85a97d-3a364b7643cmr8161672f8f.20.1747664563249;
        Mon, 19 May 2025 07:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhm3Ek1ek9W5ZPiXPoMxMaNS8+WO85TNPGle0guQyL6BxmyaWcHjQ9mb2dbC9GE6/77M42Eg==
X-Received: by 2002:a05:6000:2907:b0:3a3:64b7:620b with SMTP id ffacd0b85a97d-3a364b7643cmr8161648f8f.20.1747664562806;
        Mon, 19 May 2025 07:22:42 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a7d6sm13030988f8f.30.2025.05.19.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:22:42 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Florian Bezdeka
 <florian.bezdeka@siemens.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Clark
 Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-rt-users@vger.kernel.org, Joe Damato
 <jdamato@fastly.com>, Martin Karsten <mkarsten@uwaterloo.ca>, Jens Axboe
 <axboe@kernel.dk>, Frederic Weisbecker <frederic@kernel.org>, Ben Segall
 <bsegall@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Peter
 Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo
 Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Xi Wang <xii@google.com>, Juri Lelli <juri.lelli@redhat.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, Mel Gorman <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>, Chuyi Zhou
 <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>, Andreas
 Ziegler <ziegler.andreas@siemens.com>
Subject: Re: [PATCH] eventpoll: Fix priority inversion problem
In-Reply-To: <20250519094543.m4bNJP6X@linutronix.de>
References: <20250519074016.3337326-1-namcao@linutronix.de>
 <ae4985d3b157e31c667f532906cb6ff55633141b.camel@siemens.com>
 <20250519094543.m4bNJP6X@linutronix.de>
Date: Mon, 19 May 2025 16:22:40 +0200
Message-ID: <xhsmhbjroade7.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 19/05/25 11:45, Nam Cao wrote:
> On Mon, May 19, 2025 at 11:25:51AM +0200, Florian Bezdeka wrote:
>> Hi all,
>>
>> sorry for top-posting, but I think it makes sense in this case as I'm
>> trying to merge different workstreams, likely working on the same
>> problem showing up in different colors.
>>
>> Main goal is to make everybody aware of the other stream / patch
>> series.
>>
>> We have colleagues from Bytedance working on non-RT performance
>> optimizations related to CONFIG_CFS_BANDWIDTH at [1].
>>
>> This series came to light while searching for a solution for a RT
>> lockup, reported at [2].
>>
>> We heavily tested [1] during the last month on RT and can report
>> success now. In our tests we saw read-lock holder preemption only
>> within the epoll interface. It might be that [1] fixes more potential
>> issues in this regard.
>>
>> Today [3] (= the patch I'm replying to, see below) got posted.
>> Linutronix reworking the epoll infrastructure.
>>
>> I would love to learn how/if the combination, basically [1] and [3] fit
>> together.
>
> [1] fixes stall problem involving rw semaphore which epoll uses, but it
> doesn't fix the possible priority inversion with epoll
>
> [3] fixes priority inversion problem with epoll by stop using rw semaphore,
> but it doesn't do anything about rw semaphore
>
> So I propose we keep both.
>

FWIW I'm thinking the same.

[1] fixes the CFS throttling circular dependency on RT but also improves
tail latency when CFS throttling is in use (so not just for RT).
[3] is specific to epoll but gets rid of the rwsem which is a win overall.

I need to go get my reviewing hat back on and stare at both...

> Best regards,
> Nam
>
>> My understanding right now is, that [1] fixes a CFS issue, throttling
>> while holding a lock is not ideal on !RT - but might cause a critical
>> lockup on RT - while [3] is addressing a similar (RT) problem in epoll.
>>
>> Best regards,
>> Florian
>>
>> [1] https://lore.kernel.org/all/20250409120746.635476-1-ziqianlu@bytedance.com/
>> [2] https://lore.kernel.org/linux-rt-users/xhsmhttqvnall.mognet@vschneid.remote.csb/
>> [3] https://lore.kernel.org/linux-rt-users/20250519074016.3337326-1-namcao@linutronix.de/T/#u

