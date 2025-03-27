Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96217E4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102235; cv=none; b=fB4kbk5QevmLHpSZniuUKWzOaUUAt+oGdrDXFxNxAGvL2lbs/Dv6GPJRG4GS2c9V3lyxHNMoioW9ZF02cAKVJs0T0fnZcbHM/8DhwJKZwlCGXTUbc33aIoLcGZY0MU4gpqyF2Su69nPVtSQ221mSAVla1La8GgNyC5cItieCaA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102235; c=relaxed/simple;
	bh=ZV+lHTqy2y18sHJQYhQiUkM92LLosntDULZ7IsN9AuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nrh+CCaxaMgv0Z9F1J/mlrRRCCGEpiOQQ9vvhxYie8zsiD1AblJfHzqM5xh7pPTjh3+qwIPewzAeQttvbadXEgj3iBKpXmSw0ZoPOmuc9ej5dCd7Pyw2zOex5GPdSRa+9GCLArkWP7AI1okrsaLaL9vsZ2oos/tLbn2Zo+hW+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LvcGyQIs; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LvcGyQIs"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso208310166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743102232; x=1743707032; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eckh3c+xZEpUAPcGpuJWSWBJz7nrFu2WDtg6sHEX70w=;
        b=LvcGyQIs6gPfQpUEMHrayjJ7UlUEQ0U5OkBRo5yfvzbcv3G+DglnL8QcSKRLS/w4+5
         EdvLCk0Iv9F35Q+azDQisbvv1vMqkfP/fhScnl79uzivCKuudpCmokqZe3XjNxe18dnD
         e4LtNpS3AWd9G7KgeohMmuHENtHaimCN5WcEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102232; x=1743707032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eckh3c+xZEpUAPcGpuJWSWBJz7nrFu2WDtg6sHEX70w=;
        b=EvFAimHWIL58NKt32ut4oDQmgCp0Ha5Gl1sgm6jdwpeQnXbsNL5BcGH6kqVW8wmle6
         g6uvHmdpRRHxd/eldt/Hm4LXRYmTGHVlJ9BZTW5Mh9mAyjsZbgijQfGXhcNLUqe3lMta
         EuXiFl26t9f3fHJUyXXWWltqNJxZ3FS6hIpAf7Atb/6d5eSWpNGXP+Lgn+LjBubnzQUd
         3pGAMYZb0qw3vpZ3lJ91JencSM9BvlwP+87/s2y2TtOJI8npzQeLg2X2rlWBZgVxIBYt
         T5ZoUTHPanscuSp72t+hyY1w4JgH0w7JO4CGprz35mS+x3sCgJ2oORp+2V0xklPgyf06
         OQnA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Bx5OKlYWOfQNa6EIdTn8D1bAgQ3o0S5KrHWtcrJNb30c3sQVEH83pOcek0VUpMrSN0Bb7SCd3umR7Zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6jZX1+AcELcDiDExweGSUQ/l3KVX2SGuTl0u2ka6rlRdsTCcS
	iNvFlaCk8K7XA3K2BzLGTOAxo1IFp9qauMMvwuc/Ez3o/016moUduVDvUCbPiOWHcfZfGj2qHdI
	Vxl8=
X-Gm-Gg: ASbGncth6RmknUkwz225bKyltd6kLiSaGQ1KRi/uTtxiDdsSe0c3LTrUByLu65QKA4O
	VlYQSjKVBPJwZGGN+dBRGy7y5j8t7/elYJbbtahTBXrhXY12WCQduy/ZYKf0LC+2QIrs2FA+wDA
	TAFh/7PvDvSwKzAtREHc7y/vxbjIhoJvyBRiIy423j/bklId8kMEKw5lLh1Cv1u5oD5hBEGzc4m
	fna6ag+fWYZxM3/yqGwabZFl+2OOLMhTv2gTP8W41SrPxRWYiCZLrFzPcuAiqzZIXQ9kKMMx8UM
	oVj7Db9qPvfnrGKnjDAbek37vUrGNYwJm8e/U+xC2ijj8g75zlxZHYQw4+vZOqjQyr/39QP+8Z5
	5fdcas3ofKpI5s7ddg0U=
X-Google-Smtp-Source: AGHT+IE7HdeMJ2cXS62zLwoLEkhD1y4P9Bk/Qkq4cBh9gmT80B3LHz8Jx1+RVzFSR/s6OjKpTexaOg==
X-Received: by 2002:a17:906:7949:b0:ac3:d27:3403 with SMTP id a640c23a62f3a-ac6fae46e2amr409110066b.6.1743102231897;
        Thu, 27 Mar 2025 12:03:51 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196ddfebsm35063766b.164.2025.03.27.12.03.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 12:03:51 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so206838166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:03:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN7SrLINJwatcvyAM/ZBf22YdR3D4hS3pQIw+C75eV2SY8WxhYTtSY52SQK8UKCsUumBXl4geIqJIWyjw=@vger.kernel.org
X-Received: by 2002:a17:907:724a:b0:ac6:ecd8:a235 with SMTP id
 a640c23a62f3a-ac6faef94bbmr415071366b.28.1743102230511; Thu, 27 Mar 2025
 12:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0ade43454dee9c00689f03e8d9bd32a@paul-moore.com>
 <CAHk-=wjbahY4JjLCXNT4o3xVq2cejqBG69z+MNfHsN9FQBnbOw@mail.gmail.com>
 <CAHC9VhRExVqdhHqs0njs7NY6bFg0BfcE-gMpS30HW9O7MSDfWQ@mail.gmail.com>
 <CAHk-=wi9m8-_3cywQCohJQEQtuQ+teS4gOtBkWZrhFWzNy-5_A@mail.gmail.com>
 <CAHC9VhT3D7X=4SpO5xbYm=JUwJqTa7tn=J6QMDBV96c7VBUw4g@mail.gmail.com>
 <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com>
 <CAHC9VhT5G6W7g9pB3VM6W7wCEJjWfYSUWNgWF+rRiQ4ZQbGMEQ@mail.gmail.com>
 <CAHk-=whwQhJtafHN4B1w-z2Gno__xLHS4NouKKHrYNTYa8kz3g@mail.gmail.com>
 <CA+zpnLeK2Ecj1mBod2rFe4ymd9eXiJkbyYwFh4Yrmck3DVB2SA@mail.gmail.com>
 <CAHk-=wiBH8FBL+pnXui8O-FSdyoG-yX81mUF9bsZcC6rR5ZtgQ@mail.gmail.com>
 <CA+zpnLe_AOpS_F1UBNOvN3YRswUSy_3=0jjUAy4GPxEHYumD0g@mail.gmail.com>
 <CAHk-=wgJ0gzYJD+MghfVW-YeGLW6sLU5soFY13KWmPAxobk5Mw@mail.gmail.com>
 <CABXk95AqgpqGtjzK2o=mxWJg5RUZG80dAEaKF9JdUT6n5eFENQ@mail.gmail.com>
 <CAHk-=wh1refm6JkAB__TmC8OBJyNdH2DmNQAbvcL=tKepkHrYw@mail.gmail.com>
 <CAEjxPJ6XnBmbzH44YVQxxv8WOyPN7N81fpj7OYonEOTB=rn6wg@mail.gmail.com> <CAHk-=wguzgJu4p_khuEXKHmh-6abSN7xLJdCTuyVEfjsopY7iQ@mail.gmail.com>
In-Reply-To: <CAHk-=wguzgJu4p_khuEXKHmh-6abSN7xLJdCTuyVEfjsopY7iQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 12:03:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4H3j3TYWn6KSgznUsOXz8vfHMOfTNmFvjGr=hwULWsw@mail.gmail.com>
X-Gm-Features: AQ5f1JqA5bKkmZKwxCnmbWV1-xhL46E4nM7-YF5EKDpJAQBP2OdnLsbOul3uyVQ
Message-ID: <CAHk-=wh4H3j3TYWn6KSgznUsOXz8vfHMOfTNmFvjGr=hwULWsw@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20250323
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Jeffrey Vander Stoep <jeffv@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Paul Moore <paul@paul-moore.com>, "Cameron K. Williams" <ckwilliams.work@gmail.com>, 
	"Kipp N. Davis" <kippndavis.work@gmx.com>, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nick Kralevich <nnk@google.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 11:15, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The best fix would be to be able to cache the "this doesn't have any
> extra security rules outside of the regular POSIX ones" and avoid
> calling the hook entirely. That's what we've done for the ACL path,
> and that has turned ACL costs into almost a non-issue.

.. just to follow up on that, because I tried to look into it, but
didn't know the lsm and selinux code well enough to actually make much
progress, so if somebody who does is really willing to take a deeper
look, please pester me for details.

But the big high-level case for pathname lookup tends to be the calls
we have to do not just for the final inode, but the "every single
component" cases.

Which is a much *simpler* and more targeted security check than the
"any random permissions". It's the "can I use this directory for
lookups", and if we had an inode flag that said "this inode has no
security policies that change the lookup rules", just that single big
would likely be a *huge* improvement.

Because then you don't need to try to optimize the security check
itself, because instead the VFS layer can optimize it all by not
calling into the security layer at all.

And from a "this is called too much" standpoint, the "every path
component" cases tend to outnumber the "final file open" case by
something like 5-to-1 (handwavy, but not entirely made up).

I think the main case is

   link_path_walk -> may_lookup -> security_inode_permission

where the special case is that may_lookup() only sets MAY_EXEC and
MAY_NOT_BLOCK (for the RCU lookup case, which is what matters).

So if inode_permission() (in fs/namei.c) could avoid calling
security_inode_permission() because the inode has some flag that says
"none of the security models disallow MAY_EXEC for this directory
walk", I really think that would help.

I think trying to optimize the AVC hash table lookup further or
something like that is a dead end. The cost is "many many many calls",
and each individual call is fairly cheap on its own, but they all walk
different hash chains, and it all adds up to "lots of cost".

Hmm?

                      Linus
