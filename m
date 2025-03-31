Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29225211285
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457734; cv=none; b=QvqDPJ4vcy9qk7KHthfMRp8hA0aF2oEsscW36s0MlY9NRzNVPmWcUpAH2ISZRAmHfPaqpNzSxmgoJboaefsuU7Dj1QUN298RL7HTS/6uXXzXqIpFoOPYp8MhNH3UukzXBzkhFMK+EnRobrc0oCjT+MpBKjx5Jx4HzhrGyNo4oqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457734; c=relaxed/simple;
	bh=j8Q7TMqFjaeqW/xIuzrmGgP0NSuXMv5i+6zPVRBS2as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsJhQB0tiEmmdHtGYjdvxKZjKm3YBBtLVRIwMxWZTTKFGv+EIjpOXeuMH1K7+c52BUbsRzaXGELB+zBgngf0y19qwDb+wGpF1WpAE9zp2MTl0GEDCDS5QQiOh0ksvzcpKIU69mljToFwkEHc1mLDl5FE5GOeCO3XhsDzS1Kodq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNYhjqEK; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNYhjqEK"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c05fd126cso41918151fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743457731; x=1744062531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYmC+MB3Ga1Qxmw+SnW2boDawQrt63Z6297wM2q9/LA=;
        b=CNYhjqEK3U6gc/Vf9M4LG1dyy5ySuUIZN81akn7s9jzmE2CWy+4gtSoxdTqZnGN93I
         LBULJLcb2+H0XqM2zw2XBL1+Ma14QssoXiGrtGyx7qkKG1htIr1a4AEdVi/XBhy0ipJq
         jx2f3ZVp4o7JBzHzZH9IIodjkYZM5U5J9R7mlTU8XV93hWGIIl8jdzWbPfixBXytzZf2
         g3lVr6jsN49cQpupKUPgjRro46z09ZiM1QmiD7npb8yioR9IJEgcTnc+ltG6OLaUg/Mf
         ZKd/mC+2Z9rhTgcqAItyvHFz+ewNrDM9VJvq1WcdhkKKQ5jrfjgsgorFnavd/+Akg3m7
         /FnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457731; x=1744062531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYmC+MB3Ga1Qxmw+SnW2boDawQrt63Z6297wM2q9/LA=;
        b=l8rvE/KjGUK/8ScURccdCKgk6cnoVSa6QYeSeCUyJBlZeDHuNdXv6Uqsq1Wob7LWLi
         5OwRFp9jqHhepM5DCtcgCp6gIJ+C4kQ4J688kwAx9rXH4qNAnhq3RyLSUboNRwkwG90N
         aut6VPLNfjLj9zrV3k8qMoQrJgav267yeBG82Eadn7U8p0Wo94R8+kRl+q83IDX3vVg4
         VKn+yo17sJLzWG1J7uB3hxfcZxCwa7s8qjPrnuRm23sAq+Ud96R3PF83McLrOJEu03mC
         v0kh8sBbfytTPUGn/9JKC+/XufKrhPviWL3l+vXL9iNvRnm4im8hVMbcUl3THKjj3ASa
         o+fA==
X-Forwarded-Encrypted: i=1; AJvYcCWqJAhjgGON1y46lzO2RN1Mp6k1MtCQy3joQIeJ0HtIM6ZM4v/f4fJG16dknzkj5VgEqHqq19t4tXV0EcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYK+RFhrbv52PbpWleKv7TmWrazyRmapZX2KIGhLWXK7LWaUd
	OgMr2N16ZhbdqOAxFynI41BUeLCo+zpyQvz8jnlkntqrsX8MgMrMrDpUjXIGOJTdQvl3Gj+GdzF
	p7fmU0HuIiy2kJz2sfPiOuk0ybGv90SuXJ2iKX9uzKSWYbH1cZf4=
X-Gm-Gg: ASbGncvkcHp9KFUBMzlMzz7uZdejI+wP3teIggcv+SJf1V9ykL/BzdkgalI+xQuHTfO
	3m7f71Um9WqH1UHfqZqNvzMK5t6QbRpSs7I2cPmn2Oa7LGvsez2KAo+qbx1nGzkQD7qvsnxpq4G
	WfVRlkqFNN9PmEoRJlVnVPGVk=
X-Google-Smtp-Source: AGHT+IFKrtOpiukzpK/NrtKRXlopAJBo1cfKVww6Xl2T8BzgUQUIQAgouqHZgZnMK2jF9lW8egUD6eakV7yGdbX7O68=
X-Received: by 2002:a2e:87d8:0:b0:30d:e104:9ad1 with SMTP id
 38308e7fff4ca-30de1049debmr24835581fa.38.1743457731171; Mon, 31 Mar 2025
 14:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
 <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
In-Reply-To: <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 31 Mar 2025 23:48:40 +0200
X-Gm-Features: AQ5f1JrgtZIoLPjqTsdbCrOeKTMwv3zR0VqKQ_FWWHTP-zQunZfEAsmN_dnyhxE
Message-ID: <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
Subject: Re: [GIT PULL] Generic entry for ARM
To: paulmck@kernel.org
Cc: Russell King <rmk+kernel@armlinux.org.uk>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, frederic@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 7:00=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:

> Once you are confident that you have all the needed "noinstr"
> and "__always_inline" instances in place, could you please add
> ARCH_WANTS_NO_INSTR to the list of "select" clauses for "config ARM"
> in arch/arm/Kconfig?

I would love to do that, I'm just not sure what this really entails.

Surely this patchset tags a noinstr on every entry point from
exceptions and syscall software interrupts.
Documentation/core-api/entry.rst is pretty good at explaining this.

But what makes me uncertain are things that are tagged
"notrace", such as void notrace cpu_init(void) - surely we
don't trace, but should that be "noinstr"? It's even marked
"notrace" but not "noinstr" in arm64.

cpu_init() is called from e.g.:
asmlinkage void secondary_start_kernel(struct task_struct *task)
OK should this also be noinstr? Or is that just implied because
of asmlinkage?

<linux/compiler_types.h> will resolve to:

#if defined(CC_USING_HOTPATCH)
#define notrace                 __attribute__((hotpatch(0, 0)))
#elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
#define notrace                 __attribute__((patchable_function_entry(0, =
0)))
#else
#define notrace                 __attribute__((__no_instrument_function__))
#endif

which I read as three different ways of saying "don't patch here".

Which is confusingly similar or identical to what noinstr does, I do see th=
at
noinstr pushes the code to separate section but that in turn might
be what __attribute__((__no_instrument_function__)) and
friends does?

Are they equivalent?

sched_clock_noinstr() is tagged noinstr and sched_clock() is
tagged notrace, so there must be a difference here.

secondary_start_kernel() is tagged "notrace" on arm64 but
not on arm, should it be tagged "noinstr" or "notrace"?

This kind of stuff makes me uncertain about how this is to be
done. A "noinstr vs notrace" section in Documentation/core-api/entry.rst
would help a lot I think!

Yours,
Linus Walleij
