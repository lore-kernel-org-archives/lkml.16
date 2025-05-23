Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DC1201034
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984707; cv=none; b=C+Ime/BLTqq1cV6ulkzrGJbKVvKj4NEVxLkJJaM8xJPYJsSNF0wxz53AlKnyGl2NRcgeB//6ru+jQfAkIdJPVYKtM9ioxHmzECsWbOTHHiFUkMkCVaqB/M+vfngzPJhHwTsXvMm2R88LQNtOzGB/xxlChIL83/KomoTZNrNxYio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984707; c=relaxed/simple;
	bh=lVYMphes35U9lkXFrf4iNVcCwNEwl0JdKp5SGA1MAAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OG807dw3jx5y3X2fk+8x8D9T49V7l9VE/C4bVnTmtUwt9TZxg0W6Ik+UbSCm85UvaOJJqLyFV3OUFY8x25VZnJD+c5pfs0u+D40IYcQxz2M+zfIFx41bZP/S72SXjDSglwdU6RcxA1gJMDfMbtUDiWaSufXwUqS50uwFBXzDWO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EIza2Uyo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EIza2Uyo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73712952e1cso8038738b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747984705; x=1748589505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nT5x4R3EOROpWwoxoCqfM0RYSyQwM4rLGow549o6NuI=;
        b=EIza2UyovrzcbuNvZzsMi3zMlV77+D2cVrkfHWEo4T9xYcXcvbcM1adPC1E3aDb5pB
         D5Duh+6McvvRWt+er4VpVERiq6UsathroscFUg5CaQ4aTkcg9ziqoLaDoXneRz1eUmFJ
         3tcxS/ipOqsHi5dG9prLDJDqL2PMyf8P9HTRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747984705; x=1748589505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nT5x4R3EOROpWwoxoCqfM0RYSyQwM4rLGow549o6NuI=;
        b=DKXPLzzau2nly7UbP2zkoLyGm1tILxF9xNCrUQgItJ0jcOlddZdTZDKBM73KOyEEJI
         tgOM9pSW8/Twln8NNrgRtb5i2/7WmYf1lkLuhVY0lj3i3Rlo/YDaEJ/zMItpsajRpNfW
         9pvfNqleWG4idRKggAK9t2KdSJN+V63VQJ8UluUxUprJE3Nzk7qt6LcuubByf0Yi/0Wf
         Y/bcMBRtw2KYwQy8oMvbBT0J4E7PmmtoxHB9BGGJ2EijcwrzUhN5vnktAXJt4N8fy3o7
         XB06zC0P8dMhk+E7WbRIQyO5MFMRhzqlivSJ/7sr6KvBvoRnMuG+l3+qrcyVKsKLcDJe
         4HXA==
X-Forwarded-Encrypted: i=1; AJvYcCVAR1CrhrTnZ2CHaCErWuzStwdZsuvW+Gmt7317lFsAmlJy4BaQwNZhY1xZTNMKL/0zkbKE5CVvMsLuiBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Oih/yxxuYF1yQnPWhxOgK7VYJh0yFgbYNnLsQBpHw8SxaAEN
	jJ9UBagQLCqV/9ylXvFz4Mq8O58e5Mg+MYHnDDbp/pJUkbQbwXoXOKCbobNkKfwkDQ==
X-Gm-Gg: ASbGncurnIxpZuttRGny8SgD9FFiWPKbqHYv7cZvZDtXd0YGrEcEgm8R3MXn41CIg1A
	4AvEoEzRMBbRgf8jRGcuItwUFcZ0WPFkw3iWozjes7M7qYw7uqFXUY/h6/POtT8j7tHLcEVQEPJ
	j/QKKWgWrNqEEIwUF5t+CWfohKuRZPNBVeeICmz3/bhQ5t0kbDskOdHxaCHmDSEjw+YY9G1zmRQ
	2JJgMeP9mtfSVO11vtX4qvH2PTxLliScQBghqhG3uJFHJym+tqOIAuNx+fWFcC3x0y83VEh3v0/
	7TF+vbD7l5lTr60nD91HfITUbrXKyJJuV/K8SNN0YqqhABiQfm6HsrmNyMqmukzZQg==
X-Google-Smtp-Source: AGHT+IFey4kxcjPV6xyVJcvfXT9T7AbAZLEUoMeC5l047BI9jzfUsoDQSq1r8kyTPBiYpRr594WLgg==
X-Received: by 2002:a05:6a00:3492:b0:740:596e:1489 with SMTP id d2e1a72fcca58-742acd736e4mr36713925b3a.23.1747984704781;
        Fri, 23 May 2025 00:18:24 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:17f7:e82e:5533:af02])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d7c5sm12716099b3a.67.2025.05.23.00.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:18:24 -0700 (PDT)
Date: Fri, 23 May 2025 16:18:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Amir Goldstein <amir73il@gmail.com>, Matthew Bobrowski <repnop@google.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] fanotify: wake-up all waiters on release
Message-ID: <ccdghhd5ldpqc3nps5dur5ceqa2dgbteux2y6qddvlfuq3ar4g@m42fp4q5ne7n>
References: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
 <20250520123544.4087208-1-senozhatsky@chromium.org>
 <bsji6w5ytunjt5vlgj6t53rrksqc7lp5fukwi2sbettzuzvnmg@fna73sxftrak>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bsji6w5ytunjt5vlgj6t53rrksqc7lp5fukwi2sbettzuzvnmg@fna73sxftrak>

On (25/05/21 12:18), Jan Kara wrote:
> On Tue 20-05-25 21:35:12, Sergey Senozhatsky wrote:
> > Once reply response is set for all outstanding requests
> > wake_up_all() of the ->access_waitq waiters so that they
> > can finish user-wait.  Otherwise fsnotify_destroy_group()
> > can wait forever for ->user_waits to reach 0 (which it
> > never will.)
> > 
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> We don't use exclusive waits with access_waitq so wake_up() and
> wake_up_all() should do the same thing?

Oh, non-exclusive waiters, I see.  I totally missed that, thanks.

So... the problem is somewhere else then.  I'm currently looking
at some crashes (across all LTS kernels) where group owner just
gets stuck and then hung-task watchdog kicks in and panics the
system.  Basically just a single backtrace in the kernel logs:

 schedule+0x534/0x2540
 fsnotify_destroy_group+0xa7/0x150
 fanotify_release+0x147/0x160
 ____fput+0xe4/0x2a0
 task_work_run+0x71/0xb0
 do_exit+0x1ea/0x800
 do_group_exit+0x81/0x90
 get_signal+0x32d/0x4e0

My assumption was that it's this wait:
	wait_event(group->notification_waitq, !atomic_read(&group->user_waits));

But I guess I was wrong.
