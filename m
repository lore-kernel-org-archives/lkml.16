Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5B1F4CA9
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268748; cv=none; b=Zl6vBb5J51Voy4c9uUl3ZGvaGCNgB3J5mtV+e1Or1wGyIS0MosPA/J/oTFtjFFbHsvo5bpNDXJm3ZN8N2zrDI+DMIrSQE9WF6x3kC6z6bCw7Fzn1XpXIYOJ1boRnoYUetO8RN+Z7i/5CGCCvj9Pkfo/5vDIC3zQiGOjsvDkt+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268748; c=relaxed/simple;
	bh=6+OF96ZvcdBZbh8f87OddI1h6FIfuS45640JpIgYjc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tA8c0QE788kT3GTwgvFrSPLDoGmk1/ZyI72P2+RG21JtHFhP/mYgi9A6URTygRrH0Q1nAeI8awy0W6cC3A7lMzlMb+bBpEhjHJqB2W3ODj1svw6PVLA206dJWBJDhcu1ePmiAr+BTAaMxtU5yU2uo4tO2QOMM8IpQasog+c4jyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=emRo0/4K; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="emRo0/4K"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73972a54919so1679372b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748268746; x=1748873546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=keZYuVg3Ji9nxR/kVakHi2SId91Gq0LmTLUBvehcguI=;
        b=emRo0/4K68d86YqqOTrad7IeqWlRlXBV9oPcljpj6+tuQlbHIMevu6H9bWRzhBfqft
         XhhND2VGWhjoksrOcdIob5uZ34OqD4lrRkaonRj1o9p7MVMKRO7WhvQWX7HQRKC/wxkU
         bY6dhi33B7h+lKnr0PCtSYGeJ7S7tuXPD6Su0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268746; x=1748873546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keZYuVg3Ji9nxR/kVakHi2SId91Gq0LmTLUBvehcguI=;
        b=m2ktWktHPQOQ6c8MxhF2Bcx2G8qpDioNqaXp7LyXT0LeN4TSUfwuctGF5+rRjbcthh
         aXmBaXJ1ANmNMQsg+oH6CssZESZ/DMBla6WmLncC8Qw3rhBLvWgZDvMO1tiDzqPvgFyn
         BadXedMJKgbZvzlPpcOevguBf8xsmPFxUIualXXl96C3wLSyaun41DHFzehlWdn7LDS0
         aYv+6r3FxQSd8lpFj1NgQ6Cl35kEiM3g6hhrMUra4L3E1aYK3X9SiNiAPGCoirvOZrAK
         8aG79Jj6/4Jnw8IsZBl50O1n2bCZC2ETiRj+XrVCC5QLMENXl/7VxBGKI7XqtTyHPwyK
         i94w==
X-Forwarded-Encrypted: i=1; AJvYcCWzMpRipmjogrgWT69nU7rZo/X4pOYm41XXlJqNyYF9LqqYL8ww8eJo1NIHrf7LlLvHD+GRTBjqPGKFmGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbF56Nz99uUUXaNRzss15ZykckeEQqlO2zb1R307CRpcS+rPSe
	RWDhipLJW2BQJZDXKGCfeafBEtfORTE4h869jCCy9c4tmk+EAxD/lPpf4MUNKmmCb+DGf9mmPtm
	/7yQ=
X-Gm-Gg: ASbGncv5zT1QLApsA8Jt0/OYyTTX7mph5u9NbESbJW9daBoFYNsYjsLNhf20vIt8xVF
	DhVC4CnrmrPkIFljlBQcBjiKYzTZwvLPRMy6+ShWT4YsvuSPNEbjEjp/N+tTSAVjirc/BhgUO5H
	LU9+Z2GpCWiUvlLR44fQlzjqL37uwZYzPvaB+D7vnBICpwYa6pCOxY8NLa92W2hTsL7wJUbONBu
	qJLgTORHtUGaTPTLgylNaQ5jKCCKEzvjnFl7ok0hadhlv0Y/YrxYomQ0xRJcxyiMcUcuRrqW0gI
	3mKKs9oVmrS10RBnUn1g+Hs4o8GIMAxjthBFmFN72Bme10vzJTbH/2M=
X-Google-Smtp-Source: AGHT+IE/6WI2KivVtcqigFDxWcIixaZk/P043i67XFn0fms/YtaVN2Sy2lM7UJ380XQCwjA6vmU4+A==
X-Received: by 2002:a05:6a00:4601:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-745fde9e380mr13861627b3a.7.1748268745682;
        Mon, 26 May 2025 07:12:25 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c29c:b6db:d3d9:3acf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7461ce6930bsm1059957b3a.47.2025.05.26.07.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 07:12:24 -0700 (PDT)
Date: Mon, 26 May 2025 23:12:20 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Amir Goldstein <amir73il@gmail.com>, Matthew Bobrowski <repnop@google.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] fanotify: wake-up all waiters on release
Message-ID: <yo2mrodmg32xw3v3pezwreqtncamn2kvr5feae6jlzxajxzf6s@dclplmsehqct>
References: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
 <20250520123544.4087208-1-senozhatsky@chromium.org>
 <bsji6w5ytunjt5vlgj6t53rrksqc7lp5fukwi2sbettzuzvnmg@fna73sxftrak>
 <ccdghhd5ldpqc3nps5dur5ceqa2dgbteux2y6qddvlfuq3ar4g@m42fp4q5ne7n>
 <xlbmnncnw6swdtf74nlbqkn57sxpt5f3bylpvhezdwgavx5h2r@boz7f5kg3x2q>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xlbmnncnw6swdtf74nlbqkn57sxpt5f3bylpvhezdwgavx5h2r@boz7f5kg3x2q>

On (25/05/26 14:52), Jan Kara wrote:
> > > We don't use exclusive waits with access_waitq so wake_up() and
> > > wake_up_all() should do the same thing?
> > 
> > Oh, non-exclusive waiters, I see.  I totally missed that, thanks.
> > 
> > So... the problem is somewhere else then.  I'm currently looking
> > at some crashes (across all LTS kernels) where group owner just
> > gets stuck and then hung-task watchdog kicks in and panics the
> > system.  Basically just a single backtrace in the kernel logs:
> > 
> >  schedule+0x534/0x2540
> >  fsnotify_destroy_group+0xa7/0x150
> >  fanotify_release+0x147/0x160
> >  ____fput+0xe4/0x2a0
> >  task_work_run+0x71/0xb0
> >  do_exit+0x1ea/0x800
> >  do_group_exit+0x81/0x90
> >  get_signal+0x32d/0x4e0
> > 
> > My assumption was that it's this wait:
> > 	wait_event(group->notification_waitq, !atomic_read(&group->user_waits));
> 
> Well, you're likely correct we are sleeping in this wait. But likely
> there's some process that's indeed waiting for response to fanotify event
> from userspace. Do you have a reproducer? Can you dump all blocked tasks
> when this happens?

Unfortunately, no.  This happens on consumer devices, which are
not available for any sort of debugging, due to various privacy
protection reasons.  We only get anonymized kernel ramoops/dmesg
on crashes.

So my only option is to add something to the kernel, then roll-out
the patched kernel to the fleet and wait for new crash reports.  The
problem is, all that I can think of sort of fixes the crash as far as
the hung-task watchdog is concerned.  Let me think more about it.

Another silly question: what decrements group->user_waits in case of
that race-condition?

---

diff --git a/fs/notify/fanotify/fanotify.c b/fs/notify/fanotify/fanotify.c
index 9dac7f6e72d2b..38b977fe37a71 100644
--- a/fs/notify/fanotify/fanotify.c
+++ b/fs/notify/fanotify/fanotify.c
@@ -945,8 +945,10 @@ static int fanotify_handle_event(struct fsnotify_group *group, u32 mask,
        if (FAN_GROUP_FLAG(group, FANOTIFY_FID_BITS)) {
                fsid = fanotify_get_fsid(iter_info);
                /* Racing with mark destruction or creation? */
-               if (!fsid.val[0] && !fsid.val[1])
-                       return 0;
+               if (!fsid.val[0] && !fsid.val[1]) {
+                       ret = 0;
+                       goto finish;
+               }
        }
 
        event = fanotify_alloc_event(group, mask, data, data_type, dir,
