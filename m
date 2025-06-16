Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6E26D4C7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063693; cv=none; b=Y+4W4N8c0mtwl+gMBCZD/2+sjbvIp+b87aDK2Jb4ccUQPnxweSp7BmYDVADQGhg3tU3dm6Dr6E8W9yIuSyB1vTkHfsRW3n/t2mF0TqoviceolBoyOH2bwX7uNEfCEaTpi8D9HvQXGqfCl+kHFQG5cDuwCfG4s8Xyg4MUSVfn4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063693; c=relaxed/simple;
	bh=DrGv/t0gdja4YyUbnvE/2AmaBViJfnwtbz0D2rU2N0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpMsEqOBqOfl8MhYy+X20uOp4lhHTfoKphiLJEtQjxBC3s8MoasZUrySG4gfWiJdcCw89gg7bbbNou3bdqYqs56OBoJN7ZMnKEmYsaGFe7kcbAXFZLvNuldAsluTrNOHeO2rc1fJxYRsdqTpauf6REonyCYouEssHImlojo6lL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y30ocp6R; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y30ocp6R"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3105ef2a071so42493291fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750063690; x=1750668490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrGv/t0gdja4YyUbnvE/2AmaBViJfnwtbz0D2rU2N0A=;
        b=Y30ocp6RPBBY96BsWmfqPvcktpuFOJnWTLiBf6Dm9K0Z9k0uERyCO4kTBNr8a+C+rP
         SwqF0eIHLcg5ruU08PWNNc1BZN2P7F4PIzrduYMKC9UpuPLzJdRF43cVN5GlXirVVap/
         0VXv8Ne5Vef5z2CbuIUvkNxuQucg9NM1OMYdTk+kssRTPjiS/rsQbIaWcFqGCUVvg9df
         R9DH4ImgDtkQgSsZdUfw0fpkLT8opj0JC0lnwLYQVVXxuZ3PvL25+HNWr+nqaRL27JGQ
         WwFT8nEMG0KkHX4PsQNjNbopHRJXmE4MR1llpdr/6HhB4hpy4kIn+aVzIjeG/h0OQRUQ
         T6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750063690; x=1750668490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrGv/t0gdja4YyUbnvE/2AmaBViJfnwtbz0D2rU2N0A=;
        b=WVg17nf3kZk59G+U6AaEj04p9W61TjicY+GOvRbtcJAgIDED74zkqYGlGhGppKN1JB
         k7/zDlFLiACMiCbGhhNxGsvdh/+pboE97LuojBowf5K8iZsmNNwznh1bXovOlm/L/fKe
         nzVu/J2GyTQ0E68BHYdEXzwSBCQ8GkZNovYHEnTd9OqDgHIdZEHQO5e2dxgz4V17vCix
         HXdXYMjcyq8KzuBOmWkbIAGdcQkvYlUGpv9+UHZxq7/68/UINNigw7cqp5i0ojBvOxrx
         l9Pb4DGNMwCJToyrvxNhF7Ldk86WJO7a2AFcVCjW9c4TnZe0T+brqjBwCRYFlqOx83gW
         wdXg==
X-Forwarded-Encrypted: i=1; AJvYcCUgrA7UbKOG6UDmuJ2x5YHtIeaGqyslNvhoArgwW1gbKk3gnMTCbp3pzaNwUhP5Kk8dVtrrDcoPdiWCE34=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjcR112pt5wFB4P0ftLlQ+8slkYmTiTGVIVROAvJTNxpGrQcQg
	egSukzZQWnaOnJu1A+7TsFxVRLuBCCmkqiIwAKVblppZFDhfLwwe0+MlfH3R95eyJjDyFlvTG/0
	JagFxu/5IK4JVvxz7yLg+b2mxmI43m74=
X-Gm-Gg: ASbGncugwZNI46WBnDfJxOfbYaY5Aq39IZwW3fid7amOBCtVfUQ6OZleRjp5XeqCt1B
	RRMjko1WyU7hGaVkZlFztHE/mMV62iWLYai9DHFaNjZVG1CXYGn5Ua3jrzT4hmBrwOOn27eUwTT
	D6w5LfSpR7B0SEt4+YvKsvBJ4j+OTDhw4KkWqHJwfL7PQ=
X-Google-Smtp-Source: AGHT+IHScaDdY5IcJHSg0gKTcs9SxJxqatQurhkW3HvTnt+zdpYbSH8IvPkY9DjO5WcfgeVpJtOKSgYuzZWgbXm8O60=
X-Received: by 2002:a05:651c:4018:b0:32a:6af3:aead with SMTP id
 38308e7fff4ca-32b4a4080aemr11366111fa.16.1750063689934; Mon, 16 Jun 2025
 01:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616083611.157740-1-ubizjak@gmail.com> <20250616083944.GC1613376@noisy.programming.kicks-ass.net>
In-Reply-To: <20250616083944.GC1613376@noisy.programming.kicks-ass.net>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 16 Jun 2025 10:47:58 +0200
X-Gm-Features: AX0GCFsnOq1eoIcVM99UqD3JLPDnssfWN1GAl4OGdkVDJo_Ovb2sQMh2ewtNTHY
Message-ID: <CAFULd4YQe=xb2-GH8EHLyiNQL=uCBZ7QAqmasyroT9ZhPoRRwg@mail.gmail.com>
Subject: Re: [PATCH] x86/asm: Use RDPKRU and WRPKRU mnemonics in <asm/special_insns.h>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 10:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Mon, Jun 16, 2025 at 10:35:57AM +0200, Uros Bizjak wrote:
> > Current minimum required version of binutils is 2.30,
> > which supports RDPKRU and WRPKRU instruction mnemonics.
> >
> > Replace the byte-wise specification of RDPKRU and
> > WRPKRU with these proper mnemonics.
>
> What about the minimal clang version and their integrated assembler?

Yes, it works with the minimum required clang version 13.0.1.

Uros.
