Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA321D3EF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461162; cv=none; b=JjU4MBupmlIOUqu8D4OI+SW1Ld0SJLYKS+sL7LqGgvAWiitTx2yMrHJJXgActkE4rG7D3H15cbzKvMaZ9Ifyj2reqXDP41XT71Wgmx7F6gUIXm/x4IvjOZ7vbRAACd295IaDxDSqjBvPvTDdtwrqy3TQS0jq0meDPftgfdTr5RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461162; c=relaxed/simple;
	bh=6EB90aStD6oZtCtsMlLsrlS/zerOaqvnwH0RivSpcTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3ahwf5xPurMTsSyZTw1oiv2rEroaSOtQ9ptpS2aUwJ/WFkOXmBp1U9Hl/5LYQDf50SYQo7tdmqOxlaYSLESsKRZwUJiU1plI8fdhCGWBhuqxchYsNKsYsIyO4MDRzBRrPibniS2tZqyrJzQ+7cSGYz2osiHfuEEhlMR1VyE8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WhZEsf61; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WhZEsf61"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso19466366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748461157; x=1749065957; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m8e2i44Gr0oyZcRxefHfwT++nWQEkaT/mt94UZHEUYc=;
        b=WhZEsf61zNhCjjU0QNczwqWWRA44iVpI8/qqcLlWSnaZ7nwf4ZPBKvExD7iUENeXws
         TURi+9glAM3buO7a6xwBvyybKE0O1aTUfikSNeCoE/Nl6JqmvrRFF0OzsVLhH2UDOC3E
         SFaVhiKEaSHjepzy1PzWN7JhXigx2KMBcUHqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461157; x=1749065957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8e2i44Gr0oyZcRxefHfwT++nWQEkaT/mt94UZHEUYc=;
        b=ZMPnCfAhlY2T9sq9vJBUbyuzDDAYxdb7I4JxP5VbaKK+K8JAtGrP8ZGoy51Jcq3ePb
         ZeH4U9yV1CaqyR9WqIdAa+v5+rXBGItH3I8Bl62sVLotEGHRmi98pPAP7Sf65X+2u5Ov
         /A4eifxU+LxSgk7jMV2Fu8Cl+aRNEoxCU6rVVMhor76948t9/AXisYIRU+IksdwxVDbI
         42SBw00Zr+mfd9fNwivIWA24QAi/sKok31eVCoQJ6TR/EG+jmkSIUItufxz8zevHYkt7
         XOxHZmaNNLcO1N5yyhSHfiOvKShXy1DRWe/ws7mU9PcJFNIhdjypVGfLFycvbJ9vLB5K
         MzDQ==
X-Gm-Message-State: AOJu0YzDWAAo9sRGK/Qoe8C7NgxJkJWvOuFARW2HOzLQDObRaadlKx6J
	xWC0F62CnNpzxstAcEI3rYbpsouADLRpXPPDA0Ab/ekkAsEYB5GTMsTK3N6L8XRogDCGAsH19yu
	s3tJEngw=
X-Gm-Gg: ASbGncs23uN3LQvKn1ya8GNGf3pBpPoDCPvPDxV86gThzBx+47P4LbOwtEj6poV5waL
	Hx6Qw2DhXNEeuoRe6I3djIL58tAnw85EzxjIsH7DxXLcYgOJMVjojTFocvqYMx57ZZYTTGLGkqL
	i3lJAyYnGGBSYarN8vYQw1Fx2vCqNlfYBcPKbRGDmVST3UQSCiIddOBQP5lm0dCC+W3ysOlS1bz
	os/iw74T/hT4N5E95dqfkwNXXU2iy6e7LzGzgPlEK0o7TKaoiQhodpX7P2tgUwG5bzc97zHrKSE
	Mni3Yp/kuDHbObebya099UipvGtkuEo2uCANAoRpq3I42Kj7Q0zqURCLGE8MZ318VUzFmHJaJ7u
	QKTmPMuI5EcsTX4A8Hzu1ji2nFg==
X-Google-Smtp-Source: AGHT+IGxjrqCrwK9gD0dj3t7+Edxgrci8lZRKirMp5zTKQ+DwiXhwKaqCqJJ0KU9/GtZ9fLrCxd/nw==
X-Received: by 2002:a17:906:99c2:b0:ad2:4144:2329 with SMTP id a640c23a62f3a-ad85b1205c3mr1707412966b.7.1748461156768;
        Wed, 28 May 2025 12:39:16 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19ad3basm160222966b.6.2025.05.28.12.39.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 12:39:15 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad56829fabdso17001466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:39:15 -0700 (PDT)
X-Received: by 2002:a17:907:971a:b0:ad8:9dba:fb35 with SMTP id
 a640c23a62f3a-ad89dbafba8mr449137366b.40.1748461154850; Wed, 28 May 2025
 12:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527141706.388993-1-cel@kernel.org>
In-Reply-To: <20250527141706.388993-1-cel@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 May 2025 12:38:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wggC6PP9ZNwKY7sEzdsC7h8qySA7pjqAchrYowniADUQg@mail.gmail.com>
X-Gm-Features: AX0GCFuQ-K3drbs-6E94wWPS_IuA71tVG9YGA_q9hwV9_Skek2OUDDsjT8zlJ6Q
Message-ID: <CAHk-=wggC6PP9ZNwKY7sEzdsC7h8qySA7pjqAchrYowniADUQg@mail.gmail.com>
Subject: Re: [GIT PULL] NFSD changes for v6.16
To: Chuck Lever <cel@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 07:17, <cel@kernel.org> wrote:
>
> NFSD 6.16 Release Notes

Pulled - but I have a silly request.

Can you fix your kernel.org email sending setup so that you have a
real name, not just your login name?

This is not your fault, btw. I think the kernel.org email sending
documentation is actively misleading and wrong, with

    https://korg.docs.kernel.org/mail.html

and the 'getsmtppass' output saying that you should do things like

    from  = "[username]@kernel.org"

in your git config (or mutt settings), like you were some kind of bot
that didn't have an actual name.

Konstantin, can we please get the kernel.org documentation and
getsmtpass output fixed? We had somebody else who also ended up being
nameless (Ingo, I think) due to following the documentation a bit too
slavishly.

We are human. We have actual names. Yes, the email address is
important for setting up email, but it should be

  Real Name Here <realname@kernel.org>

not *just* the kernel.org user name..

               Linus
