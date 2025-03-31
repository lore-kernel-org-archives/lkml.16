Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6FA21C178
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457381; cv=none; b=Bo3eVGUz8yoFLgFLcm1on7o19p1DDgCYhO59uNx2G+HmK3J5sRpwBFd2EHxbPOc8KUPOUqbw5MApLAKki+bVgCjqtHPfnrrAlQjJb88bWrkDCwAJ45AjwJHcVID/JWn7411O2Z9eSdno4WYcC8yI64ndrwVep6yJU8SCr8HzVfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457381; c=relaxed/simple;
	bh=Lm23pDBVwGuHLb5lixyGc1iJK3RuhTeNRxc+ez3eQY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JF0tNzRZGPV59OF9ME0SJTaDWbAvCmwOTHi9Vd8Z9n1KB8TGIDt681SfNqLbqql6FnfcxzbaxKvHf9glkK2Wj5t0UQgVN/leTxJZnAQIvjFGvuFFHoEWw4ED5c6gpUgUjIv3OQvjAL3Szv9Ns+opKTf0CrwJRmMFWqkRXD3kb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Tah7GTQX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Tah7GTQX"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so9209704a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743457377; x=1744062177; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MPuGyIJoDDjA0SSObIP3jFx1wV25IQcopdyUBR+aHdQ=;
        b=Tah7GTQX+lFoyKRrzi+6yl2dPRi39cxdosD/lBFo7V4dD5X/BByt9YsBEpbWc/Y0tE
         LQwr3jEz0cHc/fQqfZm7NXjOCn/pyr3XCEBs9sz84iFO7x75+UDz7G5l8CzagNfQA2kC
         6yQtL8SOTPp2PAIEp43lmPvVeq3qsr2IWpYCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457377; x=1744062177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPuGyIJoDDjA0SSObIP3jFx1wV25IQcopdyUBR+aHdQ=;
        b=tTreL29h5AuuBA7bNfVeuV7bVu8sRi1VKdUZ13FIcQ9RyXeMGNNfNFTNU6lOfZuT1y
         h0MmvJacQZ2mi7QYD0bAxgKQ2IE8I85orSrFbvIbhGVGJaYea3AIFstareKaKYFC6ylf
         A67yKOWDhAzxW/Zfl7ur+FKfkA9rM+kMrKDStyiXCCxJLxhsvPABAgxBXMNPWlKBmFW9
         J6IJcqM/R5rD+OXjVD3k/2JzKl2BY6lT6j9NH3J8uspV3XNY11UJNeCeQGjkSQizjw0P
         NQWzt6KpS4ir18X+lEvT8bHvw8J8oMm0xtt5z18lZm6YUuOmCZC4Da9PtSVkfCXpE2pW
         hB1g==
X-Gm-Message-State: AOJu0Yxk3KsFmAn6fk9v8vnI+/yQPMQ2EMUJL4AkOYzQHQ6fCs906+Xr
	z7zxfujrGgNTlV7tDr7qhgRPWTWuTso8E7aMazSKZJ4payHhtpT3XctBrpswkrZ4QIims3lSyIa
	1u+o=
X-Gm-Gg: ASbGnctFOUXbd8/dTCKuu/t6WPxcBS3ydjLZvxCVK5RgXcZZA3XuZ7oeC9mW3B6P4je
	ies43ifVqJdZOydP46B2U8xEyAto7UNRD2yWkjz8JXeKxiAQUdqo6UH0y0SZZkKNraw7uDWJvOf
	B4WXdTyE2OMiHIcs8IqJbDOO8Mz8ZwSMQVZvuppdvGnkg3lcHH2EkW9A1UY9QYH+J0UN7m5GzmS
	UpX4lkCz1XJEf6hzs0Hrc7XK1oIEzdgiIEHEfeOTySC3MeCSxtntyU3BK27NjNNOAed4S9eFGnM
	JmmR+inwdhQZr7TOOHoRnXUgExsEF/obJ7LGKzcQJZGxLP5TUk5WDtYLh2yAKjkU0s3QeZlP+xU
	Kd46NqtedJkYCfWYSQRY=
X-Google-Smtp-Source: AGHT+IGM4VCewRMrmLphsEHiM5GHlwXSF8aXEC/Oq5X8thMrTgeA3JRwkXhZM/hEk2nlfQX+7jAaOQ==
X-Received: by 2002:a17:907:9629:b0:ac3:991:a631 with SMTP id a640c23a62f3a-ac738a9a6b5mr853507666b.34.1743457377246;
        Mon, 31 Mar 2025 14:42:57 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719278dc4sm676530666b.41.2025.03.31.14.42.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 14:42:55 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso9001696a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:42:55 -0700 (PDT)
X-Received: by 2002:a17:906:c113:b0:ac3:8988:deda with SMTP id
 a640c23a62f3a-ac738be3371mr773843566b.40.1743457375081; Mon, 31 Mar 2025
 14:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331143426.947281958@goodmis.org> <20250331143532.459810712@goodmis.org>
 <CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com>
 <20250331133906.48e115f5@gandalf.local.home> <CAHk-=wi5pLoe3szxLREQGGJuWU0w_POK9Sv6717UH3b7OvvfjQ@mail.gmail.com>
 <20250331165801.715aba48@gandalf.local.home>
In-Reply-To: <20250331165801.715aba48@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 14:42:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=whRNxdkLC6Z91g-_RbrRsUo6K6+nvRWqccjsOycwUe_JQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jr_8h8f6PhcZPJ4rHbzRksFJUiGmqKEAvAP7bvcH_lEJ4Zf6XawSyFboTU
Message-ID: <CAHk-=whRNxdkLC6Z91g-_RbrRsUo6K6+nvRWqccjsOycwUe_JQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 13:57, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Note, this only works with RAM.

That's not the issue, actually.

The issue is whether there's a 'struct page'. And "being RAM" does not
mean that a struct page exists.

For example, using "mem=" on the kernel command line will literally
limit the amount of RAM the kernel will use, and in doing so will
limit the page allocations too.

IOW, all of these kernel command line things are *subtle*.

Don't mis-use them by then making assumptions about how they work
today (or how they will work tomorrow).

> I guess you mean E820.

Yes. Thankfully it's been years since I had to use the BIOS
interfaces, so I no longer remember the exact line noise numbers...

> Mike can correct me if I'm wrong, but the memory that was stolen was actual
> memory returned by the system (E820 in x86). It reserves the memory before
> the memory allocation reserves this memory. So what reserve_mem returns is
> valid memory that can be used by memory allocator, but is currently just
> "reserved" which means it wants to prevent the allocator from using it.

That may indeed be true of reserve_mem.

That doesn't make it any better to then use it for 'struct page' when
the MM layer has explicitly been told to ignore it.

Particularly since my first reaction wasn't from "that's wrong", but
from "that's stupid". Generating that temporary array of pages is just
bogus overhead.

> In fact, if you do pull my v2[*] pull request of the ring buffer code (that
> removes this user space mapping of the persistent ring buffer logic) it
> actually adds the ability to free the memory and add it back into the memory
> allocator.

.. and *after* you've given it back to the memory allocator, and it
gets allocated using the page allocators, at that point ahead and use
'struct page' as much as you want.

Before that, don't. Even if it might work. Because you didn't allocate
it as a struct page, and for all you know it might be treated as a
different hotplug memory zone or whatever when given back.

               Linus
