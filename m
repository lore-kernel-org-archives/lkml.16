Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBAB259C8A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747825836; cv=none; b=e1DiAlHADfwrRUYhBQm078vurIKRUl0X8NQmsBT2YYXZ7iXwDN/j3N0jk2Vjm9iyliiimMz7s2l3OsEXYK915bbBPs3nj/3Z1npvWwcQzOvlKxwYmX11jUmEeafXbBKjSedXzNFzWTYav7m2sMzu5HlMh978S266+xWsbjTGBtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747825836; c=relaxed/simple;
	bh=r0tEDMuNifY4eIhrrGR251bYu9GcL5CYI+Rd/T6ffVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O84wDW6TO+e3KOUkLbFMLfdgLbpvqSQhiQ2/6E3JUlGX24wjz47Hc4ZnYnI+3rr0K2fPaI+1a352T7zLUhs8UrZ9qQNvUKTOxJu6Ss1bPRMTN1XbWWzrXcZxNGoC2OoCx/M8o/jcoTR7xLiWzGyYt1/TrRiUt3rvFJ/4bN808Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=RURV/asZ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="RURV/asZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747825827;
	bh=r0tEDMuNifY4eIhrrGR251bYu9GcL5CYI+Rd/T6ffVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RURV/asZSRjDbvrCxPcnrturLqWT8NJHQru8KqeKF2ZmZNL7QB3O6Nyp8biUzql3c
	 4+kNHzaC4gYxosylMCj96ME+giaQWQfYyxHRZxhxuxUec+vFYNw9JQVVTbU4Bs7gla
	 d3zD3JCO1hRLoH3rOtiViaXaGn+5cMNq3I8Iy1NU=
Date: Wed, 21 May 2025 13:10:26 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com, 
	luto@kernel.org, peterz@infradead.org, keescook@chromium.org, 
	gregory.price@memverge.com, Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] selftests: Fix errno checking in
 syscall_user_dispatch test
Message-ID: <ac23d886-8b9b-463c-91e4-aa541351976e@t-8ch.de>
References: <cover.1740386567.git.dvyukov@google.com>
 <d11d91e0c27ef78affcef06e00d1cf4cd8747fcc.1740386567.git.dvyukov@google.com>
 <87v7sj3dlx.ffs@tglx>
 <CACT4Y+a3EPcAS4yB8c2d65+T3zXoTYwN6-G4G0C_JDWBEo6EOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACT4Y+a3EPcAS4yB8c2d65+T3zXoTYwN6-G4G0C_JDWBEo6EOA@mail.gmail.com>

On 2025-05-21 12:07:13+0200, Dmitry Vyukov wrote:
> On Sat, 8 Mar 2025 at 13:34, Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > On Mon, Feb 24 2025 at 09:45, Dmitry Vyukov wrote:
> > >
> > > Also use EXPECT/ASSERT consistently. Currently there is an inconsistent mix
> > > without obvious reasons for usage of one or another.
> > >
> > > Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> >
> > As Gregory said, this should be the first patch in the series with a
> > proper Fixes tag.
> >
> > >       /* Invalid op */
> > >       op = -1;
> > > -     prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0, 0, &sel);
> > > -     ASSERT_EQ(EINVAL, errno);
> 
> > > +     EXPECT_EQ(-1, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0, 0, &sel));
> > > +     EXPECT_EQ(EINVAL, errno);
> >
> > Seriously?
> >
> > Something like:
> >
> > static void prctl_invalid(unsigned long op, unsigned long offs, unsigned long len,
> >                           void *sel, int err)
> > {
> >         EXPECT_EQ(-1, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, offs, len, 0, (unsigned long)sel));
> >         EXPECT_EQ(err, errno);
> > }
> >
> > static void prctl_valid(unsigned long op, unsigned long offs, unsigned long len,
> >                         void *sel)
> > {
> >         EXPECT_EQ(0, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, offs, len, 0, (unsigned long)sel));
> > }
> >
> > ....
> >         /* Invalid op */
> >         prctl_invalid(-1, 0, 0, &sel, -EINVAL);
> >         /* offset != 0 */
> >         prctl_invalid(PR_SYS_DISPATCH_OFF, 1, 0, NULL, -EINVAL);
> >         ....
> >         /* The odd valid test in bad_prctl_param() */
> >         prctl_valid(PR_SYS_DISPATCH_OFF, 0, 0, NULL);
> >
> > But that's not enough macro uglyness sprinkled all over the place and
> > too readable, right?
> 
> The EXPECT* macros unfortunately can't be used in helper functions,
> they require some hidden _metadata variable that is present only in
> TEST/TEST_F functions:
> 
> sud_test.c: In function ‘prctl_valid’:
> ../kselftest_harness.h:107:45: error: ‘_metadata’ undeclared (first
> use in this function)
>   107 |                         __FILE__, __LINE__, _metadata->name,
> ##__VA_ARGS__)

You can pass the _metadata parameter to your helper functions.
While it's a bit iffy, many selftests do this.
Also the upcoming harness selftests will make sure that this pattern
keeps working.


Thomas
