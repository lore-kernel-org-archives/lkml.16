Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC7224240
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748905838; cv=none; b=nyoR6sqLGxjCTqU6CTpiLxz4OJk9NuTWVk0LUvw5EFNVh02TOa2DqJD+jgwQfy2LwazxefFKACmEVY1gzRAVIIh4VoiFZv/i4478tnQZCviqE/vESUxPTLJu3YNQ2QSM7f/PAEENpbARQfd3V1wlBwiwTZJXAb0uuOl/bVtcDpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748905838; c=relaxed/simple;
	bh=sQ35O2PGhdv7k8uhPXRH4ecLIzJt7xdi1vpvvGUoQQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hl8TeVasI8Xxzkuw5rXn9F3IaPk5PwHE7bKf/GTOQqqm3DWY4r7Pv8tE2ibQcUPIbVfNQk9GS4/Sd6wJZFeZoACPiWqGloiTs6uB8ctl/IWUb7gY9kakQn3vfxDtA3MYIwQs0Q3byh54E+f/nlFTr/u02ahV2+ktFkImEwNZU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OWyOWBeX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OWyOWBeX"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad572ba1347so732885766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748905834; x=1749510634; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aOLrDZGyl5sP1KOU7rG3gZEOIkcCfBad5MOiWtWXhg0=;
        b=OWyOWBeXaK8J3Br0wQPuiT34QzV0pXfegJnqowAfhZjV1D0ShJ7Spf27ni2SXy+Y1K
         iobs+cfZKcNsobx+VVqkZ/QfOjyQr/ZSFed4vFBcHOQga6dIbC1nmQImHd0vKiwP+jGO
         H9A7HCMZpLukAfi9/b9kWrhf8Ifqp6MFYu2yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748905834; x=1749510634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOLrDZGyl5sP1KOU7rG3gZEOIkcCfBad5MOiWtWXhg0=;
        b=q61knzACsq4P0g3tI6PfBsgDerWln+2eGA2irM1VWx5NHIqp9bGO9H+VvHdzz8X/aQ
         wW13OhHMY9jGSMhKbj9mj4mzkCzFYDs3swLlMgf6omFOIjzli13g57nZkp2wOZ5DWP4G
         42tkCPXk/N7Z15qLJui7aVxDsaJ+nySgiZqgtujcFUwAyN689wa45wI4lW616KBDq90W
         7LIiw7MWDRZ7aawQIC5YcMwUJLsq08dJobzB8LXHZ7JSL2amFni22e2CSq9lWMY4waNR
         JtmaVvCKMwClKMiPnT0wQKBHrZBNEyhIiwVFZnTowmWAWIVkLEdxdv9QFLarv/e9wvZ8
         hWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh6rOXjxisemhO03yUwpHFI5YDJyifQKAu7ZG5KkcLT5La+vIroPpO5fzkndjIukz+DyaXOiSZzQr0WUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2i0UmwjqdBfiReREL46Qd+8IcYtVvbVyzjB2NwVSSfzdc3drs
	qrIS/JMrNgrHOOU00erRHJhq+luEjOAfJ7hHnqiW0PzgeGJx+z2u5zjTj/1bDaF5rpj1rzRQpvh
	56rZhoj5jYg==
X-Gm-Gg: ASbGncuklvBgBMQzxdDpZJplhKuf6mlvACqZjFW9ivQKb8lNvxUq60F/QXTTj6Z0Z9Y
	60mDl789d0GSn51KUEUT3kPEQjyfzRHlubGIoxNURHU2UHscfHs4hJ+Uq91Dv7brhrBB+iMSDlr
	NW5TTIyjmgKS1j3g6tiW5dsAFlCHb091YIpsQf3Om8c/5gKeDXXKb9b//2B1YVQczQauT2UgNRb
	mm3HnAWoZ0aO7tDl6FTkESYIaX8zBujS4aidCIjUxaQmzXRgAwTXWuoEyPqpYcsRt8Wu0TGOk2x
	0TQsBRsQQLH3LFixiyTfUPI/3ujg6xv48/8OV9SOruMp5xyK0gG0AjJhxSPmzMvQefnh8NMpsmR
	vKqUIA5mdCio9mqVqrvV0dpXP
X-Google-Smtp-Source: AGHT+IEbhKOn6e6Ui3P8+oyqkuONK96WdagZF7vDncAOzKKg3oaoS81EUsR0lNKeXQ47zXIKwmxR/A==
X-Received: by 2002:a17:907:940f:b0:adb:1eee:a083 with SMTP id a640c23a62f3a-adb495141a0mr978235666b.47.1748905833917;
        Mon, 02 Jun 2025 16:10:33 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d850d88sm864596566b.77.2025.06.02.16.10.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 16:10:33 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d54bso8890915a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 16:10:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKyjwRmWSLS13XeOvMD4L/U/AjHLoivmG61xFzWQEMK22jQTzOcNzWZO+6r9J9cd37fWybZmVMw3sERO8=@vger.kernel.org
X-Received: by 2002:a05:6402:2743:b0:601:68ee:9641 with SMTP id
 4fb4d7f45d1cf-605b75295fcmr9602756a12.10.1748905832611; Mon, 02 Jun 2025
 16:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602144201.301974933@infradead.org> <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
 <20250602154943.GB30486@noisy.programming.kicks-ass.net> <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
 <20250602215725.GA39782@noisy.programming.kicks-ass.net>
In-Reply-To: <20250602215725.GA39782@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 2 Jun 2025 16:10:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=whOEyTJb6MAcy2ojN98RrEzU5TW031sGpHMhMMFAg5bnw@mail.gmail.com>
X-Gm-Features: AX0GCFurnGJMYiwCtzh0zdwgyPO26K49bE_HPAsMz5DRqErXcI_u2aXFy_48n6g
Message-ID: <CAHk-=whOEyTJb6MAcy2ojN98RrEzU5TW031sGpHMhMMFAg5bnw@mail.gmail.com>
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 14:57, Peter Zijlstra <peterz@infradead.org> wrote:
>
> So if I stuff the asm macro in a global asm() block then GCC ends up
> looking like so:

Better, but as then the clang thing looks like a horrendous disaster.

How about we simply make this all *code* instead of playing games with
register numbers?

Why not just push the arguments by hand on the stack, and make that be
the interface? A 'push %reg' is like a byte or two. And you'd do it in
the cold section, so nobody cares.

And the asm would look somewhat sane, instead of being crazy noise due
to crazy macros.

Or so I imagine, because I didn't actually try it.

           Linus
