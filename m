Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E18241134
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 18:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739040841; cv=none; b=pynHU7pq3xqspRj6fyBqGyQvj/57J7my87nKn3vqdqpPK6i0DcatdBRyTNV+Ey7d3jhSgcAEORdjXummtAILNwE3hz/pu/Gqpw9MJR6pJi5GnQhFZEjNYpdkOMk+3J5KtgHKTYyI572utPaIdthgR8v/9VagkI0tWWFAWCeDSv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739040841; c=relaxed/simple;
	bh=Ubo4wxDjAMDx2uw+LaC/zE4ZJCENcZS8vDOY0CHooS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBtoQe94Ey6KfPueaIxg5y3awFT+nTRN96MQuMyTPN9Z1h5qt15eDiYkHax670iP16TVR4+6cyrC/tC2Jysn7koZh1pzdAWNeDbEWobOOvpOKRBnp8d6WVNgaIGsdu94XoOa0TJsVcy6pJqIzjX3WoOTcq9YDLBxMH/wUBstXXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SnoT2QpC; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SnoT2QpC"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so4982047a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 10:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739040837; x=1739645637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kmbr0H9srSRz+vgiAYrxGsuDDOFMLeKavVCcXEyEunw=;
        b=SnoT2QpCFF1Frkeq3CaSKLhB5g1bmEJwFgDhUv/PjIQR6bMGj92Ea5zAiheO9ixQYD
         UfNJmBvZeCYzXUDvrTl3OR8aGbsQWx10WsnxYZhWQ3zPU/NMAG3wvumZQsifn10gmF3R
         gB0SPUtGzucuX67erdiybuH6hKkJ3qEqzXc80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739040837; x=1739645637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kmbr0H9srSRz+vgiAYrxGsuDDOFMLeKavVCcXEyEunw=;
        b=tNklhuPrTAYQfL8igyT8RFpOTEA1lKnD42mqs9frQzfz1PwgRZrZ5IBVxQNiaVkslE
         Wz6+BsCE/yBU+OA4hMLlomUU132ElW7woSY9SfGbYHAbUgbY4dhVDGjRSEvPUJ9zpCti
         LUYZOOJwgP0dCzroi8ZORgV3A8PZT+nmn6+8NFU4ncPAmxFGRe+HjPch5vuob8JmQaIb
         u5Fxyl+kjX8DxI2G8ikZET3fB+ShCr2p8Cw+tINKAyyNGLGhYfOqnKCmss7Z82zmSXSe
         lbL35/xMc+OussjvIT6pwaU7H+zvc7c2cMupIMH6dFOa1h5EyxyZfk7a71IahDLQBROE
         0FbA==
X-Forwarded-Encrypted: i=1; AJvYcCWDGwaTVZczA7JEWlWjwlB7PavUt/OAOiHX2OF4w9oxzyEHrpVoJooZfdJ8M+i4I4Hueq/GyiGmGF7TtlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgcUOvyZrLTqjBOD8JQ94WAC6rLm+MdP2hbeBLo6xLP1B8f9d
	u9gDmBOXSdcAujUKJ0pCANBWdLMXcXPox7GulOJKD7wga90UQpMxWxLGFi87taPMDep7RvpKPFA
	gT2jttQ==
X-Gm-Gg: ASbGncui7ZO8xAjDG5tPHq9opPpBs0CArwf+m9vjFO8Mvo0Uo+iTK33Ea9k/gq6mEzt
	B5V12VK8Xe5tOyJFhcfmhDFiIUfj/XO3fydmfgRZSqB33IAbJM+crvY3STsWhIZb3Y1JOFC5bov
	6VBkgjC9qVIdnsgF15cp9MATco2nPbwiK2T5hxp0gW+3C61enIBaxbtMixMw/6gpTw3GnJvpnE5
	/9UKvXKaz2kMlgoZbnWWstGn5CMOJYQwOhaJebfDB/V1l5IdtxLXrtXiocP5aHIAWVCJ3nXssPJ
	ru0SKhQXG35XLkr+MNxBx/wZn0R0/shpkNRnxLmYqvrLt4r+l6NpmxkKO7q7r9Z7bg==
X-Google-Smtp-Source: AGHT+IGD+CeDO781GhSMIgb9ftN+tM+yNSBbdsRKVnMCraspSfDClMlHi+5AURJyxzGSq/KUlVvMqw==
X-Received: by 2002:a05:6402:5252:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5de45018851mr16507528a12.17.1739040837197;
        Sat, 08 Feb 2025 10:53:57 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4aa38a1asm3281167a12.79.2025.02.08.10.53.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 10:53:56 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de47cf93dfso2560253a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 10:53:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXG8J5erV4s2oA58zYVtrJFjxwrLf3jO15UgRwXFEOruIhA80O4Kp++ccRMT40YwefDeZXdEMpe7esI3Ks=@vger.kernel.org
X-Received: by 2002:a05:6402:358f:b0:5dc:8f03:bb5b with SMTP id
 4fb4d7f45d1cf-5de44fe944emr19692649a12.5.1739040834771; Sat, 08 Feb 2025
 10:53:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208151347.89708-1-david.laight.linux@gmail.com>
In-Reply-To: <20250208151347.89708-1-david.laight.linux@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Feb 2025 10:53:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wicUO4WaEE6b010icQPpq+Gk_ZK5V2hF2iBQe-FqmBc3Q@mail.gmail.com>
X-Gm-Features: AWEUYZkQ-gaQUcuQDLlGCQM-u1tFXVw0-fJVfL4CHFsbbrdrsyXbEEev_pRAdtQ
Message-ID: <CAHk-=wicUO4WaEE6b010icQPpq+Gk_ZK5V2hF2iBQe-FqmBc3Q@mail.gmail.com>
Subject: Re: [PATCH next 1/1] fs: Mark get_sigset_argpack() __always_inline
To: David Laight <david.laight.linux@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Feb 2025 at 07:14, David Laight <david.laight.linux@gmail.com> wrote:
>
> Since the function is 'hot enough' to worry about avoiding the
> overhead of copy_from_user() it must be worth forcing it to be
> inlined.

Hmm. gcc certainly inlines this one for me regardless.

So it's either a gcc version issue (I have gcc-14.2.1), or it's some
build configuration thing that makes the function big enough in your
case that gcc decides not to inline things. Do you perhaps have some
debugging options enabled? At that point, inlining is the least of all
problems.

> I'd guess that gcc is counting up the number of lines in the asm again.

If that's the case, then we should probably make sure that the
relevant inline asms are marked 'inline', which makes gcc estimate it
to be minimal:

    https://gcc.gnu.org/onlinedocs/gcc/Size-of-an-asm.html

but it turns out that with the compiler bug workarounds we have that
wrapper macro for this case:

   #define asm_goto_output(x...) asm volatile goto(x)

which I guess we could just add the inline to.

Bah. I think we should fix those things, but in the meantime your
patch certainly isn't wrong either. So ack.

And while looking at this, I note that I made get_sigset_argpack() do
the masked user access thing, but didn't do the same pattern for
get_compat_sigset_argpack()

          Linus
