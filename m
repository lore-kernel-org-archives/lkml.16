Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB96D1E871
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832187; cv=none; b=MFo9Wex1PCpEC4p6f9mtB9p1vkokYjP9LLyVGGiyUQ4EhS8tm2AHfnpFu7s0mlaFjmzm3ZfSrmMwJo9oDeC60v8HvoIcIGm48zkY51mhYkhKhagtjSvdTwEfINP6J+NzTsorUehRhvFPGbtN1BmalgSUcu5nqR4GU1K3qUXg4DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832187; c=relaxed/simple;
	bh=xlPuueSQaXyTx+4IzMqTdEWHdFgIskksxZhypIg+SOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2RLJ69yuCUB3FbPsxg3JScBTKILTIQ7XzkqqiLdkF7QFwmMRvjvo5SVwZDULdWVlJSouIaJcpOITcKNYxXDQWttqiQ0H3B5SsUOuwCSy6HtWLXKN4SOwUXBKRwJjNuB954pUt2ElXvAe2frm+zMQmzmXhqlfJho+JVuPS2J6Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhYvSLHD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhYvSLHD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-236377f00a1so22591355ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749832185; x=1750436985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/ypjyt/NbZiloplOW749e3kAa0t1FCbJIVyOgIwQ5Q=;
        b=UhYvSLHDvN2jOBz0CEkh1tpwtJPqHgv8uJMqb7QxS923jJsWW50czTbG8KZh+u8Pn/
         LSPcWrfzSZgmtQPyDXN/jaXQU24D+oWzbEo7i6hbFdO25gK4wajz65Dd5S8MJaxvwvB0
         7AODv6lpQf2w0P6erJjX1w439E21+mvj6hQ2RZVrKS2JaN+bnV4UcD1ONwamgjSol7G9
         J7jBlS8N5UDgbdZE15dobKdemFkSWSXGrZGVsIj/uhdiSwHMVVf6FD2XGj7igYYUcXx3
         zvVs2aTMqTvDZYVTKqDsT4glbPxll1mBcmeBQq1DigswGLh5ww97aYeNFzPMhagrrKSv
         yTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832185; x=1750436985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/ypjyt/NbZiloplOW749e3kAa0t1FCbJIVyOgIwQ5Q=;
        b=E4W3mMz+VRygLxOJFnCwMxoYcAgXF+t23ZQclqT9bXi0sFkD0pkWgWbnllpkw8UB66
         0NgmXTeIcTQPiG2wBcCqW+uZnkcvTMVDkYjATOQpPKOuVzCPho4/GCu2+03UzEwthksa
         IRxYRFiywcg+4Z3ciQxpZOAxK2QMyEt4Zv9Ifd7Ve+6XsaH8VeME/XgKtoUn/MRnmklX
         CR8I4Yx+bZ19tT215nfV2gbogbPnEyd7NOn96lXRKaHji4JFDKxrl791Mfk6eaN65Uc+
         G0cuynUQpYz4Mm4B25Jxw8GcCwuuGDbZ170f+T1zkv4+R36R1prT0E5e6lK9san5awxI
         8lFg==
X-Forwarded-Encrypted: i=1; AJvYcCW4rf+shRKHmNJAEtYGo+YMCLmXW05wl02W6ItPCuM8n/CxNyZND01ptTNrIB5Zg4wjyxLpJfKDwhu/AA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRf+adxEenNOe41akq/S2CJIcP66OR5jxsktlsHvYNAQF0LOv
	MDX8hx7oOs6hr4xirTYOl9Vll4i3sPul6pIoe7wENiXChGOHQrVrXKYp
X-Gm-Gg: ASbGncsLfmm60Zd4Mvfc9NwfMkuQskIiLda3cp4CAdbOZ13inoVr+xou1mHnfGD9Jq+
	iTTiQK8Se58TZ1mPfgeiel/i5RMHrVlhnX9qmCI+2aYXsDaG+Oyajh38dcioQw2sVrm3H1zk83+
	PlTlibjLYBY+ZNIis4vbVY0O4G2/2jr+aTH1POCg2n+esy8LN26go1VS9n50MLZkA6u4/fVdRJa
	Xc0ogI+iROdqEUKt1Yw7nSWukFrOwXFw3rtO61T2imtvBQmKWqRV8zsukUiG3pQRi/GxbcAnNS0
	wksTjg1uiVQE6LksA3RoKQWxh8NwwawosIe4Er+kZf5xQEBl0CkkPB3N2nxQlw==
X-Google-Smtp-Source: AGHT+IH2Q6jNPlcyooCkJYo0Fcu02BJRlAAzKKPUGHXL14Rupr4ubntd70CKpZu4F+L3qRNas6M5nw==
X-Received: by 2002:a17:903:3c25:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-2366b137c14mr2651695ad.37.1749832184720;
        Fri, 13 Jun 2025 09:29:44 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c0besm16529615ad.42.2025.06.13.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:29:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:29:41 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: I Hsin Cheng <richard120310@gmail.com>, linux@rasmusvillemoes.dk,
	jstultz@google.com, sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aExR9fLgCNHOaBMS@yury>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com>
 <aEuw7ls9hieUv_Ox@yury>
 <87ldpvsyr8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldpvsyr8.ffs@tglx>

On Fri, Jun 13, 2025 at 12:48:43PM +0200, Thomas Gleixner wrote:
> Yury!
> 
> On Fri, Jun 13 2025 at 01:02, Yury Norov wrote:
> > This exact change has already been submitted by me and is under review.
> >
> > https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/
> >
> > I don't understand why are you undercutting my work, and moreover do it 
> > for the second time.
> >
> > For the first time you submitted something that duplicates my another
> > patch from the exact same series. John Stultz has pointed that, so you're
> > surely aware.
> >
> > https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/
> >
> > Kernel development process implies that one makes sure that his work
> > is unique and doesn't break someone else's development, at one's best
> > knowledge.
> >
> > What you're doing not only breaks this rule. You're in fact trying to
> > get credit for the work that is done by someone else. This is the
> > definition of fraud.
> >
> > I cannot make sure that any other patches from you are unique and
> > written by actually you. Therefore, I will not take your work anymore.
> >
> > I encourage everyone else to be careful working with I Hsing Cheng
> > and check his patches for uniqueness, at minimum.  
> 
> There is absolutely no justification for accusing Hsin of fraud or other
> nasty intentions.

No, there is. It looks like a pure plagiarism - a sort of fraud.

You see, in the other email in this thread Kuan-Wei Chiu complains
about the lack of credit, as well.
 
> It's sufficient to point him to your series and tell him that it's
> already been dealt with.

He'd been pointed at least once. Obviously, it's not sufficient in
this case.

> I deal with redundant and conflicting patches every other day. That's part
> of how open source development works and it's trivial enough to either
> pick one of the patches or ask the involved parties to sort the
> conflicts out.

It's not about conflicts. I know how conflicts look and how to manage
them. Check this example from the last merge window:

        791a9b25ce2e6ecbe404ee32eed8a96a17e52896

I work on kernel for over 15 years, and contribute regularly for at least
a decade, and such thing happens to me for the first time. If it's indeed
a normal workflow, can you please share a couple recent examples where
people submit someone else's patchsets in whole with different commit
messages and with absolutely no credit, despite being warned? I'll then
consider to adjust my tolerance level to such things.

Nevertheless.

At this point it looks more like a lack of professionalism rather than
an evil will, and I hope he'll do better next time.

This doesn't mean that I revoke my NAK, or willing to give him any
credit for this work. But I will review and take his patches in case
he'll send something valuable to me; with reasonable precautions.

Thanks,
Yury
