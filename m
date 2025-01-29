Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F9019D898
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 23:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738192700; cv=none; b=EI6PdBI2W6xvHYQFLs3wjaSWJHOHUnc+VcTOMAJhfAMjQ1SlMdmD9OltCJLV3lWpjCiPE0JisYWRsrjNl2hSrB/yfRRjr7gDpHzRGPzJzTR31TMvjqVmwSVW6XPYtNA43IET+lOUdqbJrc0DcpCnE6ngc0iAXSAs6hU35UjX8MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738192700; c=relaxed/simple;
	bh=FdEplspGb/XzeqvULRF38GqEzrZONYVPkHqs9CPH1cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpnFzxCVZ9ACfZQk9qLs+8n8ntsIy23Lbsd930/BZmN1HcsqJcwp07hWejZ+J482vco0NQA6CG9bPDah9u0nB7P+BxT5akhjsVpz8o9X//+hZ57ZFRWcNF2Yz6fq/iyN/GgJ9BeFUUP8rS0gjIwGCwfDN750z0Qb2VvBNi1BU1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gngCyIkL; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gngCyIkL"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30229d5b21cso936471fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 15:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738192697; x=1738797497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvpZ7PmBrG3gp5YeFE37+hnKtxRr8CPClHcCzrd1MIk=;
        b=gngCyIkLsuqIu7ufJ3ZHCy52y2JyU78n3cNTG8/U8917/mcGKJSWHRKfl+qUVB3AvR
         DWPx7SrufAJcbLHsVDB30qU28iiuGq1JB343YRMRAYj6CWEqZ1k3QQ9HXhLOdGdD3buK
         NstKl0pxFtn8nr9IdZxjqy5QRN+kr95spEo9zTUOlhf6j072NH2idtQTpPrOuDrMBI2+
         dvybMJds4PXcxG2a1zCnx8iV0p9L9g8mnm8j8hPDZdwlGrVsNzrNJi0pp5g7pcyKk1CX
         FDv6OJa6zxwILnG/ffk5PbmaDLYc4XVVIh02fzLS3zru6uXYTxt3P8o++xPzZ4zu0GwE
         MC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738192697; x=1738797497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvpZ7PmBrG3gp5YeFE37+hnKtxRr8CPClHcCzrd1MIk=;
        b=XftA2ZaXoLz5IP1odCh3lVpKxoHHUUyLtIJIHT1/8dtqakJKphh73w+U2uJTCHrM2h
         pUjTIRJvEQlrZzNeHxfgKWOE6PZa4H3MmNz+zvCeOzdo6Y7NYkOuoNyZO4hrjMUPY+CS
         qHCXadyseNsH25E3wzar+p9YketlujO8/U4BKZ21G8Jlj3DFrk9pexB5eCAKLuiQb1Rk
         EBO1SZnXnzYTYLqWK3zcz3vz50qkvCcmhVX/Tly2Mp3Gkr1YlxFSeBV4IkMh9kW48g5w
         m43Zq88FA0sB9Chl7Q+pxzRHrcEcGKv9ERxgM6rVGYkc0twhQzCQgmTS72b8Hex08TIK
         /uaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjpP9a37DDIO7+kXzH+lLcxq72b7mQjk8bWuVKnqTREk0FAj9096SArzLQwN8DIk9fRs5QUvHcCzufBpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRO4ZVX69LOppvcI9Ll519djNMdgQl6nx7ibOOocPaOS/0Oq1Y
	t923cxTkWQgjvHIMR3sUcnGEa/abn6Io6gJKBJXXCAf3PbRmtVQkkhaMJRbRaZQV3zt6ABtdUpw
	b8EgOnqnp1kHhpyFRR5QODCIWAiw=
X-Gm-Gg: ASbGncvxaDer32v96W7QUuWa2GbHvTPg/AvyfNHSAcL6pUfdLE/agozvCgkOoLu1jxf
	l3OUX/bFXYce/ziM91tqzMfSl10MOcQb2BGEhZfAXhm3krTiDtanOex+hYwuO/229+sE6ufxb5w
	aiBZ0myurGeAKBnjiJEGbGFgwUrvo2EA==
X-Google-Smtp-Source: AGHT+IHaAKHEaFfIIrl4XoFSnnfGpYvAmUJGb3+mGNwMi0XiBaSkv8xOXbNKQLBjZ1eD0DTNqyAy4nr7gh28RazKqW8=
X-Received: by 2002:a05:651c:50e:b0:305:d86a:4f01 with SMTP id
 38308e7fff4ca-3079696b37fmr20071361fa.31.1738192696891; Wed, 29 Jan 2025
 15:18:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
 <Z5qzk_92KU0xoLcP@casper.infradead.org> <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
 <Z5q1mkliUUM5Xlod@casper.infradead.org>
In-Reply-To: <Z5q1mkliUUM5Xlod@casper.infradead.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 18:17:40 -0500
X-Gm-Features: AWEUYZm6-Axfuwo7gaO51xSLYv-t81bl89X3xorrqlt1HmTwF2QQ0EEOzVieTek
Message-ID: <CAJ-ks9mPzb9DzteGuUSnUpasnTfYLTgxqvqZ7njWGgWqRtMe7g@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Matthew Wilcox <willy@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, geert@linux-m68k.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 6:11=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 29, 2025 at 06:08:22PM -0500, Tamir Duberstein wrote:
> > The whole point of tools is to liberate stupid humans' brains like
> > mine from mundane tasks like working out who to email. The tool wasn't
> > wrong; it did exactly what you told it to do in your MAINTAINERS
> > entry.
>
> Tools do get things wrong.  So do humans.  When you take your hands off
> the steering wheel and the car crashes, it's still your fault.

Which one of us is driving in this analogy?

> > > > For what it's worth the kunit invocation, while obscure, is
> > > > self-documenting. There's usage information that's reasonably
> > > > understandable embedded in the tool itself. I looked for the usersp=
ace
> > > > testing initially but failed to find
> > > > tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> > > > meant to compile this.
> > >
> > > kunit is useless.  The test_xarray.c module is useless.  If you break
> > > xarray, the kernel won't boot far enough to load any modules.  You
> > > haven't thought about this AT ALL.
> >
> > I don't understand what you're saying here.
>
> Then I don't want to see any more patches from you until you do.

Yes, I see now. But it's not quite true; the patch was itself
motivated by the difficult output of the tests, so I did run this with
kunit in a state that produced a failure. Your point is taken.
