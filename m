Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2D204583
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873931; cv=none; b=EaoYZMkNf7v+Z3qnQcGrmcQc1+GHVdBMkgkhNU3Do2RDuNoK8mE+JgMbHsG/GOi2aNMQuW79qKeQwF+GQ8geGN1kSWMhFWc9md5PQXsj2G6dXGivt3UNDdRiF1PvlzT6RMZR80OcYuL2DP2VVzSpu6NUGOYYKBzW+vJE35OoMKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873931; c=relaxed/simple;
	bh=4iyX54oCBGEccZV7NFgaUB4UpcQsiWByq2oxmUaqGlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=soG4KZo1bYfSR7qpaKwlxhPOuyCxCz0gIo6HnZEzsgtxJakMXBCRxsVopA2SK9lT6G0TaLw4XJANfeUrHkup+KPuEwII/XeC25vftPKvPTIhKK85NPIDnZM/74XJbZjztJpRdUVnEPrkuyUQkBQhAdvzqIJoL18GXS/+Bbv3Z2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x+hzPssk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x+hzPssk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25d2b2354so782987866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745873928; x=1746478728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXxnMI8M/GtLF+9NF954ti8G8yA0onSPXV9Pub/d3Ic=;
        b=x+hzPssk6E5TBhCGflnXFqUj4cF5oNUlhSYcFHf+sTR/lVGLgHa7u0r0WcH2/bqPuR
         22gp0cf1/lbngdsKRfIpAzR3vmgVUMAKimaGucZ2CImOVo541aHPkByIWAL878tdpmKn
         AlskYVy2KqyRl/vLVbRVde+t8+nJgvrut/sN/uV2u1ytrLSrx3uK+edlA2XIpC/wzPb4
         Dqw7aMUKQ7bJPk3XKSL/IeMB4Mw+XY51au0aRwy0NRe9AOk2zx6YLayyIKmfXdWsBTFk
         hB8Xm7e9QKwftq0sTG2hRqkMuEHRzUMiEfjsT7+KjNHpayuMace8N+vb7L9QCVJ5QkZE
         adcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873928; x=1746478728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXxnMI8M/GtLF+9NF954ti8G8yA0onSPXV9Pub/d3Ic=;
        b=ghGHe+uLAPLCTKOA6M5+eFq54dbZL9B2xKvOyndqhnFE8wOV1GLwYdzhrUEybdz399
         MkTvqpjkUc6iVQHeqHxTMIWu4u309c3HBryX7MG0ZNnVwki8EVTPtSBOjqvpyiok7yaa
         dbdKjSEREPhl/znHliB6M5NE3ORFyRpAaoQapqcE7B9I09dIRSc279fUHHMXRQ48RQI7
         rMBq0uMQnfkXsDpCrYlVaZ73GvPDyNeTdRS1dkwjY5tWI29jne1b5V9o/i9YReGncqSj
         EvfZLdblepU/c7X7zFDIL//FncXoSM0JbOSBcoYCgnDTp4HLOwQsCrUySSerf/LoxrY9
         r/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnjkP8sQbvLzWoUTFJp7806des/BUQxFtxqzSqtTkIMdER5m7lqvuibYx3DaJDuoHW/+TQ00S8XiYDE4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm07TUTejgnjs55LrBEzF2Cuw4QG5tc4RevsVivJ0htDGaLczK
	YdQibNMEjeECoDXcWCXm3+7F0PyXl7fKcu7sZuQnySOzqZG2KxkOpJND+DvgjoN2oZ8a4uR2LQR
	4SGTR+q5iebC09oQXRHezRlP0EuArX1VAm1g=
X-Gm-Gg: ASbGncu2loIFA/emHqchOxe0zEzBCXbtGezU5H+bn+Zj6QnJwkV5L1nhLzy9aFplTR8
	G8GKJaqONwRB708cy39l9RmWuCHP7fweLHfYIf/wwg1gblv+uYXaYiUdv1L5SlGYLNWgud6mA93
	KoDZ3dO+Gcl9ys9Fd/TNk=
X-Google-Smtp-Source: AGHT+IGOyelpELUrcOaJAvR9wIXmVNLb4kVyS6Bj3YvQoR4friAxcC5mv6fARKTEWbb74RFaxnK/H/YGZe2ubcspY0I=
X-Received: by 2002:a17:907:2da3:b0:ace:3643:1959 with SMTP id
 a640c23a62f3a-acec4b404d3mr117462266b.7.1745873927652; Mon, 28 Apr 2025
 13:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162> <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com> <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
In-Reply-To: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Apr 2025 13:58:30 -0700
X-Gm-Features: ATxdqUF4QkWNeHvPaIyn2o9vl9GR7lp0ClD6ieeSP_GVkSD20WfrHb3VJY9h8jg
Message-ID: <CAGG=3QVJWRNUEAm=bbszJGvAwT-1Fka4hd-0R6Uszyx8WZ3zQQ@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:34=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 28 Apr 2025 at 11:08, Bill Wendling <morbo@google.com> wrote:
> >
> > This situation is one of the
> > easier ones: "do something other than fall into the next function";
>
> Note that the "fall into the next function" is just something that
> objtool notices. It *could* be "fall into the next basic block of the
> same function, and objtool wouldn't warn, because objtool generally
> wouldn't notice (there could be other things that make objtool notice,
> of course - things like stack updates being out of whack or similar).
>
> But I really wish that clang would look at a "don't depend on UD as a
> code generation model AT ALL" as a flag.
>
> The whole "this is undefined, so I'll generate something different"
> model is just wrong.
>
> That said, there are certainly graduations of wrong:
>
> > but there are far more involved examples, of course. And even in this
> > case, the compiler needs to know if a "trap" is okay, or would
> > returning with garbage in %rax be okay.
>
> Honestly, the least wrong thing is to just NOT HAVE THE CHECK FOR ZERO AT=
 ALL.
>
> IOW, just generate the divide instruction.
>
> I can almost guarantee that that will actually then generate the best
> code too, because you'll probably just end up sharing the divide
> instruction will all the *normal* cases.
>
I get what you're saying, I really do. I'm actually in the "playing
Wack-A-Mole(tm) is far better than generating code that accidentally
launches the nukes" crowd. The fact that the compiler silently
generates something wrong is horrifying to me. The compiler has a ton
of options to allow for "bad" math, but they're mostly (all?) for
floating point operations. It has some for integers, like the -fwrapv
you mentioned.

> So the best model is to literally remove that pointless and stupid "is
> this a divide by zero" code. It's pointless and stupid because it
> literally just makes for more work both for the compiler AND it
> generates worse code.
>
> Why do extra work to generate worse code?
>
> Btu if some religious nutcase decides that "I will not generate divide
> instructions if I know the divisor is zero" is a hill they will die
> on, generating a "trap" instruction is certainly not inexcusable.
>
I'll see what I can do with this. I might be able to sneak a patch in
past the religious nutcases. The fact that we have the two flags
Nathan and I mentioned could indicate that someone will be amenable to
the patch.

-bw

> Generating a random value for %eax is WRONG. Now, that said, it's
> clearly less wrong than falling through to some unrelated code
> entirely, so it would be an improvement on the *current* situation,
> but that's like saying that getting shot in the foot is an improvement
> on getting shot in the head: true, but if the alternative is not
> getting shot at all, why is that "less bad" alternative even on the
> table?
>
> The "just execute random code" is clearly so bad that it *should* be
> off the table in the first place, and I don't understand why it is
> what clang does now. It's just crazy.
>
> And yes, this really is a very potential and real security issue. In
> the kernel I don't think we have this ever happening, partly because a
> lot of configurations use gcc which afaik doesn't have this particular
> horrendous model of UD.
>
> But this isn't just a kernel issue, it's a "anybody using clang to
> build any program that might have security issues would be *insane* to
> think this is a good model for dealing with UD". We do more checking
> than most on the code generation, so we actually had tools that
> noticed this odd code generaton. I can guarantee you that 99% of all
> projects out there would never have even noticed.
>
> And who knows what cases we *don't* find.
>
> And obviously hopefully UD doesn't actually happen. But that's like
> saying "hopefully we have no bugs". It's not reality.
>
> Using UD to change code generation really is a truly horrendously bad
> idea in the first place, but doing it in anything where security might
> matter takes "bad idea" to "just don't do this".
>
>                  Linus
