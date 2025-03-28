Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A2B13D89D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743128276; cv=none; b=nIlqQuvVrC6Wx4BRcxLVeFdKfH5DdR+iaKjvOvuuH/ubkkvNwfPbcCbzRuocH5+D7jQDKIKNG4iB1zEtzgGg5CApWXu/r6wL0pR2h9Cn/KQpY4ap2BCit144RF17IVsOh1iYoXUPrlqLRQfzlptbFQiiyJZs4WQN732HAZd2gps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743128276; c=relaxed/simple;
	bh=Gz8a2lWDh68k8Fs8vD7GDwx0RQXPkZI0YPSyF+bSVEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbtyK4QvKy9JBHn54LYVFNDJVEe1ba+tVxbq7Isoc9G/5yQKmX1GCmoR2DBd1qHEEYDefuQijswwipIyOSBxC1Md1gSsqGgTkMgaAHeSCJkPnqDpwnme38ZrYX8D74jQVJBeZXkZJ0kHu7/sLaXCo/hPPW6RT9lvFF0Ej/zkx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P3XGsjnf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P3XGsjnf"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac41514a734so273523666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743128272; x=1743733072; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RPZJmVxE58ipBTDGpUOh/5LdmpmjmFS9XlzEeuLLmA8=;
        b=P3XGsjnfkvfJPgP6Hkp/wGB9fmWeAyX4x9MmFMHWcgVVPPPzjWvZ5MhTNnhxlDJls/
         BtJqKjVkaihR0ZP48R6wxm3sWZ7KS4/Zo6DaDDlB5siW0XwMkwEWLhcGEQQpLZ7uCLcd
         sz+FUjjo7S6EXbros7/s7NxhUQ2R1nN0Ohs+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743128272; x=1743733072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPZJmVxE58ipBTDGpUOh/5LdmpmjmFS9XlzEeuLLmA8=;
        b=tS6CJQAdJrVqfs8BAx5xFnnHJbGisvGEo5vpkQMDlvAtE7cyLis++hBiMsTrphx08Q
         3zvNTXvb2FsJi/2AWwdYRU9IKuNTM/XaexV+q1NepW3zW8A7nDPydtg/D62icWknNEZJ
         gG4c0mcQSyYGzVqFo/oXvvav5B/AYm1pP/0NNIrPaouOT2t5a42a7EKV7I9ys3oTrxaa
         oXWkCpNZSvr00gZj64rthfVF3fN5TCyisRMCe4Wfs6qqQI88elgLblX18u2apCSCLDgi
         sPxsv1NKYgnxLfeXJtwAhOmPADU0sp+eJwTqRv8D8VfWFKbV36yLKB7BJf37ODPw5Bn7
         J0jA==
X-Gm-Message-State: AOJu0YxhUcSl+ctpXt+qGRopgH6qbnuNF0907+hr8h9iOkmzC46/1jbT
	/RjKJ3DNrPTDCjuLjv+DBNk4BTe4TN1SU5sjH9eOgz6XVctaXVsHedUDPyRlXVVWM/yMR1U7xaI
	PIEU=
X-Gm-Gg: ASbGncv8oZYBajj+y8+QBYvHaF+xV3a0a1aFH2VatYvwTrN9cdhrCYPFn9f738amaKu
	jyPqHhr17vrhxQoKhdlqPZCJ2wC/7q4WlcWGuwdjEIvcPdc57sMEU7mPurnRoJkTFXW5TH55MR1
	LrGVa76PQcQC8O9AmTQuytSzRTHkYbUhA3bJLiWZ/YW8pD6j7oA1r8KKjpeSXvVcmiqpmnYU/Rm
	GrAZWNCW4WvHh1ByKd+YHuKwuuPWnxIKGQTfrQHCaMrLsRvUSFfiLj3WlNzjVTnFBJvYzkJSTfg
	q2wZPzNsbmDDXzXJ/qodcvNaBx7SIaei1rmZUSMX2JZ6xTeHt/8tCnAS9glUtZFCKccHb6pYLiP
	0o6hb0I1CiiE6ftCl+3M=
X-Google-Smtp-Source: AGHT+IGjeGQGhYZjQFZHwzD818+9XEYNl8h1pMo+0pTZ9QLBoj0L/ypCFNBgTwVlvlQiag8GOEQUtA==
X-Received: by 2002:a17:907:9285:b0:ac6:d160:e3b9 with SMTP id a640c23a62f3a-ac6faed4403mr509131166b.22.1743128271958;
        Thu, 27 Mar 2025 19:17:51 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b0a5sm84751666b.56.2025.03.27.19.17.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 19:17:51 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so211134266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:17:51 -0700 (PDT)
X-Received: by 2002:a17:907:9482:b0:ac6:e33a:6a0d with SMTP id
 a640c23a62f3a-ac6fb15fd21mr603095766b.55.1743128271107; Thu, 27 Mar 2025
 19:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327171037.032bf7e7@gandalf.local.home> <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
 <20250327212447.24e05e7e@batman.local.home> <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
 <20250327220106.37c921ea@batman.local.home>
In-Reply-To: <20250327220106.37c921ea@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 19:17:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqyWvoDETKaiG9lijOdJ_vWG_LH2Cmmp2T3hmrn4a3Mf1Bl9oZ22DESos4
Message-ID: <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Feng Yang <yangfeng@kylinos.cn>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 19:01, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Let me explain this better. Yes it uses alloc_page() but that's just an
> intermediate function. What is saved is the page_address(page), as that
> is what is used by the code.

I understood.

But NO, that is *not* what is used by the code.

You literally use "struct page *" whenever you want to mmap it.

If the *only* thing that was used was the virtual address, this
wouldn't be a discussion.

As it is, you allocate it in form A, then you turn it into *either*
form B or C, and then when you need form A again you turn it back. And
you do so in a particularly disgusting and random way.

> The virtual address needs to be created as that's all the code cares
> about.

Stop LYING.

If that was "all the code cared about" we'd not have this discussion.

It clearly wants things *back* as 'struct page' again. Stop making
shit up and maki9ng excuses for your bad code.

And yes, it would probably be fine to just keep it as *both* in parallel.

But honestly, if you only save one thing - as you currently do - you
should save the thing that is more fundamental.

That's 'struct page *'. That's the allocation, that's the thing you
need for mmap, and that's what you *should* have used for
de-allocation too (even if I think you currently just end up using the
virtual mapping and depend on the VM code undoing your mapping).

Anyway, I'm not arguing any more. I'm telling you that this code will

 (a) not be pulled this merge window

 (b) not be pulled EVER unless you clean it up

 (c) you need to stop with this hackery

Apparently you knew it was ugly hackery, since you said "I figured
this would be the most controversial", so it wasn't a surprise to you
that I'm complaining.

Why did you send it then? Because I'm serious - this has been a
pattern, and I  AM DONE.

Next time, I won't bother to explain why I'm not pulling, because
apparently even when I explain, you just start making excuses and
making more garbage up.

Next time, you're going in the spam filter.

Because it's annoying that I have to go through your pull requests so
carefully, but what makes me truly fed up is that this KEEPS
HAPPENING, and then when I complain you just start arguing about it
even though you seem to have been aware that the code was shit.

            Linus
