Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD82E62D4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743881494; cv=none; b=hUiT1c/RwoNbHkQBJ+pD4dL6cH9UDLyBB3FOijbgXqLWvQvH//gX/iN1I4uqhXcVq74U5qkKiEzh4jIza8c1ocBGv0O0TMl1PlEnfWnkPgHvvCPnpI/WW8EOnIYbIDV5pCzE+KkUbraJ6UVQtSdHZTzfHQxIl3WsgTMNXctkmGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743881494; c=relaxed/simple;
	bh=ckL0wj4wzzCLyhMDNM4zVoDN/rgXxLAGSMJbG2KJYHM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=b/Ty/LJgTKbjhO9UbWzc+49z1lCUTvf0yYOmiZkiuOFXEYCzTxBQyF2fkKnbrFb6nbiTH2+0x8TXU/SUSTQIpzP2CytcwGrNuFlPj9IVUgmUZDa88Y4czNiQLTSnxVGYuNFhgEV+Z8R1xatNQR52K8XLbqbHUuKVKNccnjorNHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b5a7981ccso263731439f.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 12:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743881491; x=1744486291;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnfN+OSgoeqXWHgA1gS+R5i5TDEDoO3FJ5IgOyRixwg=;
        b=VS//xZmVe6tj+QSyX+mxvDov603PilYGG5tmx8an47MH2SMxz/ik9jcLDlXDfgOVr+
         0HZycn2mdvBI3vuLKgX+y5jjDiG8CFVhkhrwiF6aRz/pu57TebQMn9W7fPXGBR4t2EWH
         esk1iWiBS03gGeMyk8rAjBuC3yx4NiPDu/LsU6rsg5mEOj3xpWzjhM1rsvhpqm71R5di
         C99Hian035ggi+w24ureOjzJJLemNwKzFtxPf+NXfleBhHy86Xx9Qwviy5qCDEiyJdHz
         YiVpTLHxC+WxFWazUxX/qRcuO5Bv2s+0kLLU2uIj3V4TDGRAybQPBszfMvmbjrlMfJFz
         MpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU6ZzdCu3InxPhJm87jjZuhyMpShsdKm1+/Nh/w+sg6xk74WiB6Oz/aGsqf/IdXf69f4rTsQOc0tygd+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxekPUBlmgW8oYl4XaTjLIOq6AdqucvnLU4pjSPZwK5bgcp2zaN
	j3dp3hZyWSJYyhNsOvUXi3NTFP4sUmXZPAK+erL/pWG7OQbQYgxUXx/gU5hWImApD6EmwR3kGgI
	1n1vXFu0VwOkGZNWeHCxHz+extMUMZb/vYj92cHSLtQyv9KDXRUba8O8=
X-Google-Smtp-Source: AGHT+IH4zdUDu40swxHd+oqi0UZ1gfIGTlaQwfyDjxXL3xNTGNIB2VQ11/7WDHiUKMeMsq1+h6Pljq14rJQEbGy+KFzmmcqKHMGA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3802:b0:3d3:f64a:38b9 with SMTP id
 e9e14a558f8ab-3d6e5876fb4mr74071535ab.15.1743881491392; Sat, 05 Apr 2025
 12:31:31 -0700 (PDT)
Date: Sat, 05 Apr 2025 12:31:31 -0700
In-Reply-To: <20250405193128.577856-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f18513.050a0220.0a13.0247.GAE@google.com>
Subject: Re: #syz test: perf/core: Prevent WARN_ON(!ctx) in __free_event for
 partial init failure
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com
Cc: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> Move the get_ctx(child_ctx) call and the child_event->ctx assignment
> to occur immediately after the child event is allocated via
> perf_event_alloc(). This ensures that child_event->ctx is always
> non-NULL before any subsequent error path within inherit_event calls
> free_event(), satisfying the assumptions of the cleanup code.
>
> Reported-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  kernel/events/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 0bb21659e252..153ba622cfa0 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -14016,6 +14016,9 @@ inherit_event(struct perf_event *parent_event,
>  	if (IS_ERR(child_event))
>  		return child_event;
>  
> +	get_ctx(child_ctx);
> +	child_event->ctx = child_ctx;
> +
>  	pmu_ctx = find_get_pmu_context(child_event->pmu, child_ctx, child_event);
>  	if (IS_ERR(pmu_ctx)) {
>  		free_event(child_event);
> @@ -14037,8 +14040,6 @@ inherit_event(struct perf_event *parent_event,
>  		return NULL;
>  	}
>  
> -	get_ctx(child_ctx);
> -
>  	/*
>  	 * Make the child state follow the state of the parent event,
>  	 * not its attr.disabled bit.  We hold the parent's mutex,
> @@ -14059,7 +14060,6 @@ inherit_event(struct perf_event *parent_event,
>  		local64_set(&hwc->period_left, sample_period);
>  	}
>  
> -	child_event->ctx = child_ctx;
>  	child_event->overflow_handler = parent_event->overflow_handler;
>  	child_event->overflow_handler_context
>  		= parent_event->overflow_handler_context;
> -- 
> 2.43.0
>

want either no args or 2 args (repo, branch), got 9

