Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E31F30E826
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 04:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750395234; cv=none; b=khr5C2WWkQzdGAP3y4vNn3Yl1eTT2ntqFb1Y21Jqbfr5vFMnf0GitQZ6w4Re+ZTnL746VysySX8R3u4FWfSXQH4IxlnlLuHgFUItzVw+qSdXi9qU9KuP49nfjpwfMSbt9yLgicc2Duxd1kBg/+K02t7hKU8FZ18LshdS1TR0wJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750395234; c=relaxed/simple;
	bh=E/YiGHnW1wZQ5X/0H0XDdrD4sDL0PuYMkMZ0cU3VFVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0OXisMQhvRdmWYS03U13vbQtrCM36lfhsRN5zyhX+Fb5yV6/N0tsFfyTqIBs25mRjJpfU4ZUGjwPIfRfzVcUc1svmlkOLhKhhzfVejBz+UYYijG84/JwtH7/1WkFoRKxIK6FipGStruUMaEx4d1ykV9vI3kIo87vyXWbazhqI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VYxGS7kv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VYxGS7kv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234c5b57557so13829395ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750395232; x=1751000032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2G3dD31TRdLmU2kMFyJcNMrg5YHR0QH2/Tfvo3Rsac=;
        b=VYxGS7kv0WvICnF/14n2jOIJQ7K2q3TkVpgidj7fojgr4C4T8vd04Vp6eacnQKact5
         x70QzlIK7YU6UoezLZfoWwCbIXayGQqK0a6Qq6OX2Tg05Fi0CmjQyUxtTbJY+UmS+4pq
         hMbDGu4EdDWwlWImlDqTDy1ccuy5Ry+HdV5Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750395232; x=1751000032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2G3dD31TRdLmU2kMFyJcNMrg5YHR0QH2/Tfvo3Rsac=;
        b=TtRVQPSbfbHDtjpcp+gnnwV/tUHZfPmcsRpC/e+20QHJJs4701Y+EaDhK7wrzdgVCY
         kZ//Py0WWaY+sHXLEoFzIdFzksb4kQVCtNTqu1xCTU8mggJvMazsz6Fc1+E+xIYqJ1nG
         oRYKFlT5iLntpiVmrGh3GflK9WvgN1QnUBS7hXHbbsUxA4LsxNT/IjFSHb3CoWZC2g/3
         Enesm8IzfHWKdIp7mpvB4a25hSS3YSt4npF4mZIqqjWaWQBPDc96atwNL3lysUeWEx5W
         XfBloeW3NSoHWvUPNiDTm4HTjlQZfXrRRaaY8/rrJvGGh2+WwFiwMhZanA7WF47rt6RJ
         1dOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6mZgO2KTkKti8e9ZZa60YT+xAF2mo0MPC3tpgrp9gustlzQhao8G9RHxykH3JXmnveDkwtBpQWWahRSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzokZf01CEMK0dkPImsYAK4uqhYeD8DPQ1Ji2D4llAfuFn7KswE
	Gzr13XFCJ3DJBUYpny02Vf7R93C9DNuxg2X8RHQR8idS+gyfE5oRTx70BkSbw2gRQF2oM2PVJzd
	Vb9g=
X-Gm-Gg: ASbGncuNCSvERxPS+hen4CkTAbt1D3IzI+q8Z2dSqD6oYGMhIk31iVdTEQYcZVzaV7q
	ZtKfpLe5nRstwTxb9tJHDUG6Yg/m/n1ua/MUH0cP8znJ51WV4dJujh+poDKU6RLzgMtMDr1hT35
	eJPcUQjecHy4STviK9yb2szYqBdgw8YnQ8CJF/6g3S0FYBewTtQg/VBrFG8tGKPx8oDmx+ojfb0
	0VJXiqxV0mJIQmlj2gjYAU4TjUWVn191bY9p4VfyGmJz/DIO3yiRkY7EizCalIaVcm9tT6aOOa9
	gXBX1695rSc31begBup3CAs1nwXcA1yVBxHj+BnBPD3SnFIWtC6aCy6J8HbxhvN5hg==
X-Google-Smtp-Source: AGHT+IFk7B8k/GlrcRZRoZuXgJlsllcTVXF/E2PZN7eWGLXhECASjJTNH1UzB9LoljR7ceAwxCiMEA==
X-Received: by 2002:a17:902:e842:b0:234:ef42:5d48 with SMTP id d9443c01a7336-237d9980027mr24292165ad.38.1750395232197;
        Thu, 19 Jun 2025 21:53:52 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:e574:cc97:5a5d:2a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a854sm8018115ad.116.2025.06.19.21.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 21:53:51 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:53:47 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>, 
	Matthew Bobrowski <repnop@google.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH] fanotify: wake-up all waiters on release
Message-ID: <76mwzuvqxrpml7zm3ebqaqcoimjwjda27xfyqracb7zp4cf5qv@ykpy5yabmegu>
References: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
 <20250520123544.4087208-1-senozhatsky@chromium.org>
 <bsji6w5ytunjt5vlgj6t53rrksqc7lp5fukwi2sbettzuzvnmg@fna73sxftrak>
 <ccdghhd5ldpqc3nps5dur5ceqa2dgbteux2y6qddvlfuq3ar4g@m42fp4q5ne7n>
 <xlbmnncnw6swdtf74nlbqkn57sxpt5f3bylpvhezdwgavx5h2r@boz7f5kg3x2q>
 <yo2mrodmg32xw3v3pezwreqtncamn2kvr5feae6jlzxajxzf6s@dclplmsehqct>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yo2mrodmg32xw3v3pezwreqtncamn2kvr5feae6jlzxajxzf6s@dclplmsehqct>

On (25/05/26 23:12), Sergey Senozhatsky wrote:
[..]
> > >  schedule+0x534/0x2540
> > >  fsnotify_destroy_group+0xa7/0x150
> > >  fanotify_release+0x147/0x160
> > >  ____fput+0xe4/0x2a0
> > >  task_work_run+0x71/0xb0
> > >  do_exit+0x1ea/0x800
> > >  do_group_exit+0x81/0x90
> > >  get_signal+0x32d/0x4e0

[..]

> @@ -945,8 +945,10 @@ static int fanotify_handle_event(struct fsnotify_group *group, u32 mask,
>         if (FAN_GROUP_FLAG(group, FANOTIFY_FID_BITS)) {
>                 fsid = fanotify_get_fsid(iter_info);
>                 /* Racing with mark destruction or creation? */
> -               if (!fsid.val[0] && !fsid.val[1])
> -                       return 0;
> +               if (!fsid.val[0] && !fsid.val[1]) {
> +                       ret = 0;
> +                       goto finish;
> +               }
>         }

Surprisingly enough, this did not help.

Jan, one more silly question:

fsnotify_get_mark_safe() and fsnotify_put_mark_wake() can be called on
NULL mark.  Is it possible that between fsnotify_prepare_user_wait(iter_info)
and fsnotify_finish_user_wait(iter_info) iter_info->marks[type] changes in
such a way that creates imbalance?  That is, fsnotify_finish_user_wait() sees
more NULL marks and hence does not rollback all the group->user_waits
increments that fsnotify_prepare_user_wait() did?
