Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD27481CD;
	Tue, 13 May 2025 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747102689; cv=none; b=gAMR2n99tcZjGP9Vf7QK3Amo7wj3ZwIwGLStLSwKZ5nKkzyGBxhvFyYt1LKdUYe11Sxst5aSTE0Yz4R4C0Pm2sQrhvZ8P/hGo+LXzQ/Y4t++fzV2UQsW6e070ucYpmdaCwWlGRIiLxwTahAnawzbbq3w1ujfbDBEoM2RiyvOk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747102689; c=relaxed/simple;
	bh=Y15f7IEtt9rXqsTkV3YqLAxLn76VHVB02FtETBO82/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X508j29BxEjkTDzmX/AAabXpmYRFi5G2Z3S8KlPzXoptQeptsWEiDWGw3+qdgmFp0nQIjupJlnHHykc4gOtwSSKHv/6IMzriU5PEe44aB5GADN7mW4uPbygJ9x0unpHpwbkPGeiFhHTGiivyKcDz7GOX60rYLc3ZGLm+tyKRbeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK9tjrOc; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK9tjrOc"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3da7bfdef33so42299195ab.1;
        Mon, 12 May 2025 19:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747102687; x=1747707487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLKMnDfYVqso7RzyW4CpAm0ri52f37D0cWbo211Q0SA=;
        b=cK9tjrOcp6EUn9DvuvAiWsNo6OfwfBLfdC2xxoAU1Rj+7/yg9BAWvceWtklgIysjI4
         4hVCmYZ2jsWFI6JIhieYnC9tG1v4iGNbpk4UA7qdFmOi2EoF3l4B7YtK7gZkPuy3srnc
         XrpD2L57usQeOHrfzwzvN5w7nDp2tBEZaQ6cekvKfNmwFoiE/MVdb25z6Al9ohz5gW3Z
         9/BnylFRU2DIlLdkVyiswE5bxeMFXJexYvNw4qHKlLld10og7IGkdDVGGyaGZCeMJiBt
         I5dkGvJ52hFdr9l495uuwL+ejirliCEo8R5Z3fPN6hXP9zKEqb+OfwYSsX7feuBGxy5A
         7idA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747102687; x=1747707487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLKMnDfYVqso7RzyW4CpAm0ri52f37D0cWbo211Q0SA=;
        b=SkI6iK1WJTqzhQ29Idg0AMxcvIKcc+ZKDzy+HhPUDQI0eB7i2pOcUrc1Ave45iVYqW
         Llp9lh8EssLTuo+791HKSHbsyOGZnHjO4ulNcBsha4TNg0+7iicvgn9QGGp02Jwuuo4R
         ze9BGDivyeMUxyJLtnf5Dbp5UybpSfBjqDhoAlpJ8vHu1kbI3dbxa8o6p2kKJwk4c7Jb
         ktlExTSUICo/MDP2biJi0c+vJvNIfyD79DNMhv6fgwu1Vb6jAQMWw/4MwEW3pJiNdrDv
         nCmD4gMD8qjeBSgmcV3za4NKcC9QL9mec71G4KkXIcktYscQg9posTDLEy1mhNfSv9Mg
         r6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGvM/yCCkFHQmejXecEBGQNvqIDhsQiLc4CcPHyyw82t9yM0fjDFtAChGTIXoAgpSLs+4IpP7BazvCY++5@vger.kernel.org, AJvYcCX5lYAXLKmPhF92hyqeGUL1l9eLkdEKAptQrcfL4owGcp99e+GaIAWZwU6nGu9TLWp+B/vyIUe6dFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq6f4pXSnV62ZhiYaGaxegMfrXns3IrR9tEeWTiEm/CgwWtws2
	mWYUGL449q+rfzBueqjQMr3zEdzPAB9nfQLESiyd0B5eF9TGbd1OtbyNO68BQPZMo8KbNAf9yb1
	CwsJElalbKrDV0DlgvNvRkqBvsrI=
X-Gm-Gg: ASbGncsFUJd1ch1zw+OOexThakB5uhmQWteQzTUEfypOGxsXvIyS17xfYjbQFEJzkSZ
	vpssKOiw9xCQg7d61c7pQGwzXCoO+W+i+MDDAMu9MgcjjtQ23LIBdVGASJSBTeyJ2vPYMLERDTo
	vqGwFvQt/AqvWrQIK8SaO9+oVzjt341lU=
X-Google-Smtp-Source: AGHT+IHZrV11xKhvNRc45YPDoJYZ21wxCRrzMNH+0r5efWs4kXxPxtt4POkEup8Dh4SJQe/f/RyHu6/V0KUyz+9hzok=
X-Received: by 2002:a05:6e02:b2f:b0:3cf:c9ad:46a1 with SMTP id
 e9e14a558f8ab-3da7e1f458emr147177215ab.13.1747102687145; Mon, 12 May 2025
 19:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com> <aCIL0zZvf1fvTahk@infradead.org>
 <CAL+tcoCJxoiGi=Ea1KCG4_ri2=GbNhhVhEV5anMLyai6qg2zeA@mail.gmail.com> <70293376-71b0-4b9d-b3c1-224b640f470b@kernel.dk>
In-Reply-To: <70293376-71b0-4b9d-b3c1-224b640f470b@kernel.dk>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 13 May 2025 10:17:31 +0800
X-Gm-Features: AX0GCFvuvkDdWQ9CSVfIZkO1ROTmBr1D6f8sRH9qtaSBtCz33yVac35ipSpgmwk
Message-ID: <CAL+tcoC9ioDpM93nHpoUS9icqG+pZvZU6mCEz1HbCrENrPeKwQ@mail.gmail.com>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux@treblig.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 9:49=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 5/12/25 6:49 PM, Jason Xing wrote:
> > On Mon, May 12, 2025 at 10:55?PM Christoph Hellwig <hch@infradead.org> =
wrote:
> >>
> >> On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
> >>> Also note, we usually do not care about the out-of-tree users. The ma=
in Q here
> >>> why are they out-of-tree for so long time?
> >>
> >> We do not care.  If some of this ever gets submitted it can add the
> >> needed helpers back.
> >>
> >> This entire discussion is silly.
> >>
> >
> > I'm surprised how you described it....
> >
> > Now relay works like a filesystem which helps out-of-tree users
> > transfer a large amount of data efficiently. it's totally not like
> > other pure dead code. I meant what the trouble of just leaving it
> > untouched in the kernel could be?
> >
> > Let me put in a simpler way, two options, 1) just clean up, 2) keep it
> > and help so-called 'out-of-tree' users even if you don't care. I don't
> > figure out what the difficulty of keeping it is :S
>
> I think Christoph's email was quite clear, and I also said _exactly_ the
> same thing in an email two days ago: we never EVER keep code in
> kernel that isn't used by in-kernel code. Period. It's not a debate,
> this is the law, if you will. It's a core principle because it allows
> the kernel to be maintainable, rather than need to care about out of
> tree code when changes are made. Similarly, we don't have a kernel API,
> not even at the source level.
>
> This is one of the core tenets of the Linux kernel, and all in-tree code
> must follow those. If you have aspirations of maintaining the relay code
> going forward, you need to fully understand that. Either the dead code
> goes, or the out-of-tree code that uses it must be merged. There's no
> in-between.

Thanks for clarifying this to me.

At the moment, it seems the relay is still alive because of blktrace.
It looks like two options for me who wish to enhance the relay feature
in the long run:
1) merge the networking trace feature that relies on relay.
2) turn it into a file system

Seems option #2 is a more generic way to go?

From the bottom of my heart, I really don't want to lose any 'unused'
parts in the relay because there are still more unused functions...

Thanks,
Jason

>
> --
> Jens Axboe
