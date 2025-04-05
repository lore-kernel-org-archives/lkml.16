Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98717A2F5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743893314; cv=none; b=sXYf2df/dhVw5zRs8X4IDNxUXpTRpiJHJ3ztlM95Oh39SSGr3jneVBWJHjf4GsYRLMJ2kI3Msd9xaIPRpczAw5DiRQMA4t3WTBMIgvS0zYhJdQUsySL/WqFy3qqdxnjZ3PdNdO+FrF2TxsxZfNbbcGyofmgPZT+F/juVSESQR6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743893314; c=relaxed/simple;
	bh=zzB17LP6gxs7/bxZ4VZ+Gp0oXsYR+lPPQ1QjFAb0rYw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=SohILFAQPj44LbLtdrERWrEhQD1nVEffctHhU0JiKSQspGuGp5g3WHSti0U8zqxloDcXvP1AdZxafsRBYY6vGKXkN+0pgj8RYmzEvZNYbw5b7oMTqLYK9QEd2/vLbLYq1tVTlePxKATgt2h2NCi8jAjy12wv0ehL+zaAuAnMBtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85db3356bafso775445439f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 15:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743893312; x=1744498112;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAjsCltuj4j2unUXr4QFgr5SOAVliNqy7F4WFCbV3dA=;
        b=sT/FvYo1e3i7LaFhi5UdbLGBz3vyTnJd5j111D0ug2EYE3xFOo7F+Ah/Hz/OotvXBk
         zqwp0b56zeReIPsEz5Euf4spDTtO3duA3vvZdRVM+Wlrg2ViuEyH0XXsBW7Sal6FEdrx
         gCWSlofGRlipr8oJWDZr058XlacSGQK2WwKyZZmyCDW3aCc/z6J+0CdMNsuc9gB7UAzd
         IdYfJ3z0w21gQnMkepM9Q1AAf++g7C5NHBpHx7z9r/GAwIiRhBo2jHwbf2V3KHAYJ3Od
         niSiQ1dabIaqG1el5n2dZYm2uhmiGO0ccAc5DE5H879+lKGvigSdjTILFEyE3Liaw6uj
         m1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUzkEG/F6fM4LlAwh9vcGrTQU2CSMrOdP0gOowz94okC1vY/O+Vbs9s4RMaHFcTRz2whs38qG+308m8XPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHa7yIjo0a9sH1ntex3cQZl00JeajHpQshmiyZzOqGrKwLdecw
	5VGsG+C1oYR8l0K3Yb2GQ8w/yfkZfL/et8KFvSDWit5cCZodAxe50I6TOHFtEiUy4kDAerY8md7
	tf/7HiR/Ko0KxCd3iD/5AzLBI1NlwCryIsZrl+kdrKleaL26F8ze8FCA=
X-Google-Smtp-Source: AGHT+IGPXYJphfKBvNbT7CUJ05Sxmbs1gPJPeCuUYu7leOTRlq9/bcSmGprc1YT0klmVLA/M31UIZK5YCY8lNcmmdI4noMoiN4eS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3082:b0:3d4:70ab:f96f with SMTP id
 e9e14a558f8ab-3d6e3f06875mr107252475ab.8.1743893312593; Sat, 05 Apr 2025
 15:48:32 -0700 (PDT)
Date: Sat, 05 Apr 2025 15:48:32 -0700
In-Reply-To: <20250405224828.587944-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1b340.050a0220.0a13.024c.GAE@google.com>
Subject: Re: #syz test: git://git.kernel.dk/linux.git
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

want either no args or 2 args (repo, branch), got 10

