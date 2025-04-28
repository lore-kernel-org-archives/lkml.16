Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73422951D8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863717; cv=none; b=LgRUIVyInCo5ywCX4gehJ2a+g2EyXKSuIUlwwECLegyVNXB99yJ+zv4uRX1p3a3SBBnGxYWZhA3d9fj3xwJbIZV1m0S5Vm1qDEZkArlum9uR6U7LMBz+tOfNfEp5mI3E/sP2zOJak4SY0GTFTzdqF1zgLoq5tlGbUa5ZJR3H7Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863717; c=relaxed/simple;
	bh=ObSXFlGsDpWRV8E/7b0vGadnQXgzqYHgpaoAoCxwOYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UiHuDb/0GLnRzv8hYs2RB0QVgZXOV+vFo1aW0cRAsJInWNT8JLymD/X2/AQI4Ft7DaN59cQzWMf4KIKD4mwwXeKgMJlcOUqpWJbGs6y0e/G59F+uLqzqK58IzkeYmrgZaNszDegVSYBxvhZu8i2kbhjVj2sJRz1hlxx8TGMEVmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ivBnIanV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ivBnIanV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb615228a4so1080973366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745863714; x=1746468514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObSXFlGsDpWRV8E/7b0vGadnQXgzqYHgpaoAoCxwOYI=;
        b=ivBnIanVI2tEGlHEqnJ+eWtTUkl+nJCpW7PgpDkWPhdriYRt9ZnVvgY22zw7lpYEPK
         CQxmjx35T3j+jrUt6FY2Yj9CMnCGEZl8JDdKl2WbhhRTYMtRwRxGcbeftuq8sUv9rqup
         pIr1TOAAX9fA1ivQSxLPkRyKgn6+P6PVjBz77o3H+X1jAkVL+PWPZWWodgoCppWT6G5y
         qQ19f2etoFkQdr5rcZIvm4zvzG/Xkh+kPO6BPYZgg8yjWixB1mKxxqSiqkssSngG9zwr
         CFRpRyM4JqsC2VCCZXt1VQfhdxrZDOO/9mnPlCMF5DzpEL7tGkOU/m4MPPEVs3yziWec
         Y4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745863714; x=1746468514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObSXFlGsDpWRV8E/7b0vGadnQXgzqYHgpaoAoCxwOYI=;
        b=NrAhNWRv2I8/EE5eJiT8YtFXIAs+0E0raHB1HU9rd+Bx8RFsczcUvFS/ez0+PjgvYA
         MjRyUbe5GM7FFwy6cDEh8lG0FqiQkQw7rV/yHSu1c8fD9Y5VWoUG/rG6FZs+wfeajbZ4
         5Kb09fcDgd9d/RMharb4OKr7+foNbZYe2kH/7MFuCW0G5TVMYal/aUlqxjOHCOBNUlv1
         o49v/W33zvo/BMdZTLbP2YJ3ASd+ibmYEVdplrIwch/xOeuvhocXWjPXEsLpXA4bXPq7
         rxdc1i267TI3JKxbG2qCc1K/r3b2CxFZLsjM7s2cYSBDH21mEli+smeskSck/XK5lf33
         Pmiw==
X-Forwarded-Encrypted: i=1; AJvYcCVKjFtSNn+C1i7SJJW/o1TDO294u60oRG6mX/7e3UlYQhYq9yJkP3K+ZpK2bETLU3SFxpAoI7qTTIrQhXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5YTu9e9E6CRctEBw5KXlK780lTROnaaNTjRC+hO3CYAe0vE60
	ZWEYru13gVs9I1k9PM6IwDrWAqILogw/6dUajrlFyIBjsmF9wCdacV4XcRPZixuTgxL4BhH1aBs
	Dqo9Y4AQETBhPmtmtsbLDx6gvTHetpMt9rq8=
X-Gm-Gg: ASbGncuT4U4G9oIQmH+9j2d/7G+cXsjhwj193YGDTeLI6lmrGci0q/1wiigHVKBWgf4
	c+y1KHPtjOphL5MVZbuVrWQgzrXNxcmOBhUlvMK97ZzVVKiu78OehOD4npff3fqL9RqlwJf8DMw
	NGItdnTldmGmVelkpEQFQ=
X-Google-Smtp-Source: AGHT+IH17lQSjopDcYFAF6vUXYSB4/G8Ck6PNpMZfMLiwEZdqHhhJ7KrtjzzJEVPEcYGZn8hDBoMJ8c6jyFfD4ISC3U=
X-Received: by 2002:a17:907:940e:b0:acb:1165:9a93 with SMTP id
 a640c23a62f3a-acec69a7894mr16522666b.3.1745863713696; Mon, 28 Apr 2025
 11:08:33 -0700 (PDT)
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
In-Reply-To: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Apr 2025 11:08:16 -0700
X-Gm-Features: ATxdqUHdkMoNTiG3otQDMcEbh3e1opeHpcZVUMb0X719K18pydkfuXGdraIMEuw
Message-ID: <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
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

On Sat, Apr 26, 2025 at 5:31=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> So please. Clang people need to get a clue. Yes, we care *deeply*
> about performance in the kernel, but a C compiler that thinks that
> using UD to generate "better" code is a disgrace and pure garbage.
> Because security matters a whole lot too, and the downsides of turning
> undefined behavior into random garbage are about a million times
> bigger than the "I can remove one integer instruction for zero gain".
>
> For the kerrnel, we want to disable absolutely all undefined behavior
> crap ideas by the compiler. It's why we use -fwrapv and have for
> years. It's why we disable the idiotic "strict alias" stuff that
> should never have become part of C. And it's why I want that "turn UD
> into unreachable" mindfart fixed.
>
> The notion of "optimizing" unreachable code is crazy. And the notion
> of thinking that "UD means unreachable" is so incredibly insane that
> any compiler person that thinks it is reasonable should have his head
> examined.

I tend to agree that generating bad code in the face of UB is bad;
there was another, unrelated, instance where Clang silently generated
bad code with UB.

The problem borders on the philosophical. But I believe the argument
is roughly "generating 'good' code in the face of UB is a never-ending
game of Wack-A-Mole(tm), where we don't actually know what the correct
outcome should be." ("Correct" implying that the compiler could
somehow divine what the programmer was hoping for, or at least get
close to it, but it's not possible.) This situation is one of the
easier ones: "do something other than fall into the next function";
but there are far more involved examples, of course. And even in this
case, the compiler needs to know if a "trap" is okay, or would
returning with garbage in %rax be okay.

-bw
