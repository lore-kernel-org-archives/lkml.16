Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856C81EEE6
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190026; cv=none; b=ZmumgKMbC/1CT96H9eHQVy0uTLRjOZnrpYmoJ5N0v16zPFtU8QMOpgp69BA4QlaP1Kr45ydoS5bFBjWm2+XD3weC1toP3wImmfssfjfewD0hlt5Y9WfeV7/oy06EyTmQJxV/zeSLe4TNfg1GonvjdTUwDpzDc/nxchbBui/ga0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190026; c=relaxed/simple;
	bh=CUs4dA7/6BTxii3m1d76YX8eHpqNEmYeKmWTcHxidMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=UEUl2Fytz61gncKU8kIhr2AU2oiGy46vyif0Ab0R551k8YPPQtdxFBI9nI2Ze2XeL61EH1/XQ2wXUyrabgwYttk1Zya+M3APmet1kaOiD41c+BzIiBDwfFHmgqTVZzAM8bzrQYje1CgycKCbKuaMj9+8ob+cWpfMG7dxQ0qt9v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7m4h5ue; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7m4h5ue"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso125728e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738190022; x=1738794822; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwtTqChbi4zZdf/ZVEHKDcud1fzrA6/ZFVeSu32TP20=;
        b=l7m4h5ueTO/b91R7R2uelCpoBFKZ1YL7xdx51Mk8qKLZQqIzGNEm3KGuQ42FGzV8oi
         dwVJe0sNW6r/IXTaVeDLKVO49qNK1PDO2UZCQzQ5GdBMLG47ScfX/drEo04oIbLVHKKA
         5QouFeiF0Eq3YJpbWdbVnaM2wezrWHNNRcpNkbDydxQ1lGsF1UqzbDDqOCg2Kc96GaRS
         GDNr2WhYUvxW02XnZ+nP7vC2E+y3ELllnhfb72j03pZJAayi7xTPpIltYALKtStssaLl
         PSX7RmZGsq+dGxaPX14J9J/CtJmHvkQImXD8Mfo1efMaxB+ekigm2l11ZBBdFhMqxyUV
         qWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190022; x=1738794822;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwtTqChbi4zZdf/ZVEHKDcud1fzrA6/ZFVeSu32TP20=;
        b=wbTAPsEPn5DaRq9aUUNsTkVCg0Cyr9RdobUMPR3Do5YIrpIqBWW/H0a2aGZqyhiBNa
         e8mIoPkURQupGz3egQIrZ+CbvL204ZOOlWRsFsse9XCOSIVEBUrXKODemlQfRmV9cyzP
         UwsZe4QvHIWw/+xKf+i2wCFDm6NkyIRv98r7tN5bEOd910fhJGk07soiZUCitVaoq63p
         sh77xLsTZpH31GdskJyghPoVe81jTeGtk0aHNoVj2WohnOAyb2Tzt6lc+OirI1iDVfvl
         KIWdsy/yY8aGm9wTKNE2eFagUqDknwGpeWpTyEdH54hzwHrCivrHMJL0GQU1IkDZU1cn
         bdBg==
X-Forwarded-Encrypted: i=1; AJvYcCVaVWb5M2Zd5Pm/aCf803WonjnAY/dgUjFBKAx+cnb4m1hjH+IpxBhS4OAPD2dF5LX4hCmM31NBWuST0+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4OKYyVt5f6KeCOici4rPJih99SKYAIOQ2F4yxa+i9F5MUTjIv
	I1rJ2Y3Hv4rAs/Xl7Vu+4PRbSMiOvr1mKiSay3WVBeZAyodZqukiauhahQXzq3lh+cOpZUiB3jX
	CV+FDuMo2ud5dmm3Ma5+MKIutC+E=
X-Gm-Gg: ASbGnctfWJPfzM1tn0OKGWZ0Qrpp9MlvbnrpkBdW1/dMgoAVHWfkSJrcyg/uHEhhVBx
	5EvhtiRvDTFyEQgetKlxr9wVbrnr5fP6DKLBd/DI8WsQFXqb6UPKAniRqYtp8YFcOlAPFz2lIze
	3RuvSxxCC9b7OYLhatUViThFhxWwAhQg==
X-Google-Smtp-Source: AGHT+IF2MeaNjouO8R0JM1et8QEoQLnG0VNYPnffzuMibc14Fpm6x8jD+8I3kdg8KrIHS3kDt2XsyPg6S66iF7JWajU=
X-Received: by 2002:a2e:bd02:0:b0:307:2b7e:6ba0 with SMTP id
 38308e7fff4ca-307968b8eb2mr17871601fa.6.1738190022267; Wed, 29 Jan 2025
 14:33:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com> <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
In-Reply-To: <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 17:33:06 -0500
X-Gm-Features: AWEUYZmqB9KaPVADJVSl0RJAzYftKo4819o4ffb3JmJnxzxyng6OqI0KWIIVhig
Message-ID: <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@gmail.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, geert@linux-m68k.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 5:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Tamir Duberstein <tamird@gmail.com> [250129 16:29]:
> > On Wed, Jan 29, 2025 at 4:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@o=
racle.com> wrote:
> > >
> > > * Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> > > > + Liam, Matthew
> > >
> > > + linux-mm
> > >
> > > Thank you Sid.
> > >
> > > >
> > > > Hello,
> > > >
> > > > I believe this patch needs to be reverted for now as it breaks the
> > > > user-space build of /tools/testing/radix-tree with:
> > > >
> > > > In file included from xarray.c:11:
> > > > ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such=
 file
> > > > or directory
> > > >      9 | #include <kunit/test.h>
> > > >        |          ^~~~~~~~~~~~~~
> > > > compilation terminated.
> > > > make: *** [<builtin>: xarray.o] Error 1
> > > > make: *** Waiting for unfinished jobs....
> > > >
> > > > this then prevents the maple tree test suite from building.
> > >
> > > How are grammar corrections going to the right person (but not the
> > > mailing list) while an entire conversion to kunit is not [1]?
> >
> > Very simple: the tests are not properly included in MAINTAINERS. I
> > sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-4=
82e31f30f47@gmail.com/
> > a few minutes ago for this reason.
>
> Fair enough, but from the patch:
>
> @@ -6,11 +6,10 @@
>   * Author: Matthew Wilcox <willy@infradead.org>
>   */
>
> -#include <linux/xarray.h>
> -#include <linux/module.h>
> +#include <kunit/test.h>
>
> ...
>
>
> -module_init(xarray_checks);
> -module_exit(xarray_exit);
>  MODULE_AUTHOR("Matthew Wilcox <willy@infradead.org>");
>  MODULE_DESCRIPTION("XArray API test module");
>  MODULE_LICENSE("GPL");
>
> I don't get why the huge list of Cc's didn't include the author who is
> in the git commit signers:
>  $ ./scripts/get_maintainer.pl --git lib/xarray.c
> Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:1/3=
=3D33%,authored:1/3=3D33%,added_lines:19/52=3D37%,removed_lines:4/23=3D17%)
> Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,commit_=
signer:3/3=3D100%)

I'm not sure what you're asking. I used `b4 prep --auto-to-cc`. It
doesn't know that test_xarray.c and xarray.c have the same maintainer.

> ...
>
> >
> > > Does the patch really need to drop the module testing too?
> > >
> > > What exactly is the point of converting one testing system to another
> > > besides disruption of actual work?  Who asked for this?  What is the
> > > point?
> >
> > All this is described in the commit message.
>
> The commit message says you like the output more and implies you like
> the command better.
>
> I've never used the kunit testing of xarray and have used the userspace
> testing instead, so I can't speak to the obscure invocation as both
> commands seem insanely long and obscure to me.
>
> >
> > > Is anyone doing work on the xarray running the kunit tests?
> >
> > I was doing work on xarray and I was running the kunit tests.
>
> ...
>
> You should look at the userspace testing (that this broke) as it has
> been really useful in certain scenarios.
>
> Thanks,
> Liam

For what it's worth the kunit invocation, while obscure, is
self-documenting. There's usage information that's reasonably
understandable embedded in the tool itself. I looked for the userspace
testing initially but failed to find
tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
meant to compile this.

Tamir
