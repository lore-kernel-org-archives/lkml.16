Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C5929D0E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743893846; cv=none; b=JkSG8cSbYYTiy8AJYb1c18VJdcciDPUXE60FM8kfF+r+n9yps35koHm2ZxRh1h2Caf3Hn42tCi/KzJe6kgDSkIqbXJPT8jjjK+9J7Z5mGA6a3oMdajiu0UsUkru6AEIxru/Gg/SHgaGttoCX5Fp8mo3SzQzmutkUUqH/GiFb81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743893846; c=relaxed/simple;
	bh=OaUj98Ihu1TvRN3obu6/5oCoG00q67ljS8R9KAGjCOE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=tjgMR5t6G3ZoBNaREu7xeX9ob6Kow2AJs+2Ml49Z4PCrtAB73XFy/V0moNC/836NeeZFCxGBV8BpSnRxWqyHJj9UgMBNMECDHVg7JIGlcOj7YZbPMR3FPQOlIfSeSLCw7QrdD8KswC/XrsSThYATCNgfbzdgLwtj0RMU40y4lEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce3bbb2b9dso34276885ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 15:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743893844; x=1744498644;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DaTSOE5GJyRrrBDGDLDx3gVpCKM9YKcEbQcVrlfaDbc=;
        b=c+PkocxUeLl37ncblZFgkm+2f/pdY6uXndLlf63miyMnwpl8musR4qHV1zR1mZIDLl
         XEVm3ke2SCROMtalpDJ7OxOOKShkrG6ldMj2O7tyq28icpKc0cq2CiUGcO3XI43OsdI3
         hw7GunrBwiQEO5H+RMaiiGdbysZiri6h4gTx5yipxT+dXOi4G7/Ke0Y0aLVYD22CIdLS
         ZwjUMYU6SO5sAnobhWNm/e/Nz8oTTx2pN9WYI/uk5zfBbVQ+xEJmDKbCTOOBFA0lIoKN
         2X9ShfxBYmZI6aH4Hp8VywHoT0fIegIDYsTWrZA2vJhA5fYQ7vyy8SQsOIzfl4MW25Uk
         2zZw==
X-Forwarded-Encrypted: i=1; AJvYcCUq6TQjrJxaXsMsp0fCvjKFJY9hAcAnGu56pmHKkJQcvZ9x0+uFlVzqoA1Xb7DPlC2k93HQV05eAuHzfR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNfyyWO6HL8NV0sXLL5NLVFgaCVUK9Y3x2lq7mpv8HUPC+GGb
	m1Yn3KzNF9lcsrCcS+tGUgzwxpabZF/ukv304N6r0y5WhgPpjeYT3SLB9KbYZRiWgk1yNhZhkte
	7aK6ulVkxl6CoI7WmQ/QUHVCZGqxXeQ+mQcj3h9VPsH2vsmQS4n0eNRw=
X-Google-Smtp-Source: AGHT+IFieXf3orSwTtkxHX/vZrkxgF+LZRhRZQQmCa/C4cuEZzcZ46nAvcQYzxSHGbCYRiA9CCRi5A0nNCxGhjHspHOaBXK5lw8b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2292:b0:3d4:3a45:d889 with SMTP id
 e9e14a558f8ab-3d6e3f74038mr77056825ab.14.1743893844081; Sat, 05 Apr 2025
 15:57:24 -0700 (PDT)
Date: Sat, 05 Apr 2025 15:57:24 -0700
In-Reply-To: <20250405225721.588250-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1b554.050a0220.0a13.024e.GAE@google.com>
Subject: Re: #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5fc31936081919a8572a3d644f3fbb258038f337
 master
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com
Cc: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> Move the get_ctx(child_ctx) call and the child_event->ctx assignment to
> occur immediately after the child event is allocated. Ensure that
> child_event->ctx is non-NULL before any subsequent error path within
> inherit_event calls free_event(), satisfying the assumptions of the
> cleanup code.
>
> Reported-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ff3aa851d46ab82953a3
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

"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5fc31936081919a8572a3d644f3fbb258038f337" does not look like a valid git repo address.

