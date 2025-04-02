Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6F2AF14
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743623554; cv=none; b=pJO03DYuwP2JLtDAdusEySp5Xl9WOXkZCNVzp0dUteXyIIFlq0nucxCZV/zl/XYlwSSDJ6/9Suo2lwu6RgANUOB26V9PnDZI15JtEnScw++tfeEmUjYAWTDk64cOvn7K9GfyMQauhw5BuTqICOYc5MKecaAIdhTCJrho895tsgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743623554; c=relaxed/simple;
	bh=IB6ZkuoV2vDr4OXC5s+rpdDJA4ldHRMYJPksYO0FIKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXTYRzPBjFshnW2ZAIXSRiY0jjiw6bI9VQcP8xBKeoc03Cq7fxOPE+eFUgdlxAxdn6c5pmDtRnY+aoefhnt9DKXusGbSuOE/XD4c/tzW/3EpgSXo/aCfBEZnqdB+4CBV2mfeb6mOye07OMSLlW9l/lC1SrNs6C1kGLQzFyi2Dxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W713Yh8X; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W713Yh8X"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so305245a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743623550; x=1744228350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mZya6J5BpAGmb7b1zJX3sjNEF08P/OfzkmyDGESG8aE=;
        b=W713Yh8X2EVFO2Rh9tM7SVcrghK8l6noFiTTLzhBmnYwpMTAagS1CCZR/cLbO1oEFj
         dCQCY4o2xCMFIsI4bNLclvQSrczTtdKTPGRUJrDzD+hvFMKAeQenQWYQSaEptGLy6BPc
         FVSXGOyCa/RWzmSmgG7NHRUmt1QM9Ll6NbzH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743623550; x=1744228350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZya6J5BpAGmb7b1zJX3sjNEF08P/OfzkmyDGESG8aE=;
        b=GfmCplBdTZCIp/CPRVtpoxUTzyoJ1W0yVXMUFk6NMl2xR6MxyXy0xaVxiMmna6lCq/
         DKe4B39gPPE89R51SYnDHXIf/G5UIeDz3vHb25YBtse5WlGyX7K8FDU/waXAmcHU1Wja
         MWLlVHZxpcTam57jCRQBdVWLeMqEYbuxMCZ5WLUM+Bkfbh5i61hAdflaMX4ufVe3bITy
         1Y6LY4Rps4euYMWeyTLmXpgLFvkM/yRGHXVCItrIDfsLKog0rspl6l9qIetCFscGKyk1
         CsUXfUnzZSxrPFGtFr+zioksAo1rHKJ/BB7qmOUM/q8dTeM2N93rco9rSTnSA8j+K9iX
         hNag==
X-Forwarded-Encrypted: i=1; AJvYcCWnGd31YIQN5764cyabZRRCJikTYXsdQe2/f8yg4Bx2zVgmsu4Pf1d9pn1gIWVdyfDQx5aABog48tbtluQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4//geFerKRA+q8nRfFldL002RMDWs5zn15T4xYg42zznta0Q
	EHlLbiPxMFgwxRA1l0xGuyNAx+zv5kHgHV2Q39PVeiBKoADSlnKE1Ykjf5Oxhcaua7NLA9FFKkH
	9kAw=
X-Gm-Gg: ASbGncvunQIH5pGMCHkzqXhomkJTKIfqeoxpNhA/rAYl0R/T4MXmU9/MmRfb1flvoDy
	273dqmf8+CsHtc9kV6saTJ+ShZhkum08ThFz19xv0eQVcIsj2TlcV5CfzgPnGY1W++US3bTQvNm
	lZhYrl399CB+AkSGgekMcQYiLl8sJLo9jWdLWdAzfMrAtRpoFJTbFnxxHB/ZqlJm/CP/o2X+Db0
	xqkChm+mVjtR7vGrImbEZaXGgOf2PHZmYklWcfhVoTtAyyQycyDfkJyvj1SP/KJMKdD55q8ylD/
	cCHo63vFWlYypNOaNqEwJGurk1X1tzDUHckWCw3NLhWTVYhlbjVw3u6tLGkCrzEe/FkgeSwuBFr
	tXirbus4aBvha9I6L3z98Stx5bvIbVQ==
X-Google-Smtp-Source: AGHT+IFV/fyLSplnVtH8K8wj99Yk+3bDsRH2mCkjkYIoOPpqrfQkMkigv8T5oiFurpY8yFXzxwZrgQ==
X-Received: by 2002:a05:6402:35cd:b0:5e6:23c:a242 with SMTP id 4fb4d7f45d1cf-5edfcfd4ef6mr16099670a12.18.1743623550196;
        Wed, 02 Apr 2025 12:52:30 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922bf43sm952281666b.6.2025.04.02.12.52.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 12:52:29 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so24330966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:52:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAdzxoYA8lV7hUdweLcdfYKUUCcSeTv0RNvs5JZcPhPPYjDgXBPpGx7se4TSdJJCo5DQHahTcilUkeEJk=@vger.kernel.org
X-Received: by 2002:a17:907:72d4:b0:abf:4c82:22b1 with SMTP id
 a640c23a62f3a-ac7bc165ecemr3759866b.32.1743623549115; Wed, 02 Apr 2025
 12:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-00cAEKkfvyNto2@pathway.suse.cz> <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain> <CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
 <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com> <20250402154435.5b0aad22@gandalf.local.home>
In-Reply-To: <20250402154435.5b0aad22@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 12:52:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcYW9Kf6Yrua_+RqB32RB9aVnvwzzXEC_6sdWinA1AoQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jrl8WnpKeV4q8-2bLWoylOrfuY_gNAau7cMCrJgPdXdDxuriSrHzWABTOg
Message-ID: <CAHk-=wjcYW9Kf6Yrua_+RqB32RB9aVnvwzzXEC_6sdWinA1AoQ@mail.gmail.com>
Subject: Re: [GIT PULL] more printk for 6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 12:43, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I would also argue that it's good for the actual ack, because it gives you
> a link back to email were it was likely acked, in case you want to confirm
> it was acked.

Let's make the rule that you can have your useless Link: tags for the
pointless patch source if you want.

IF YOU ALSO PUT THE ACTUALLY USEFUL LINKS IN THERE!

In other words - don't make me go look at the patch submission and be
disappointed.

Make the *first* link be something useful, like the *reason* for the
patch in the first place.

Then you can add your pointless noise afterwards.

Because no, "it has an actual ack" is not a good reason. Nobody cares
about the ack. The *reason* people look at the link is because
something went wrong, and you want some serious explanation for why
the patch exists.

Seeing extra "Acks" is not a reason.

           Linus

             Linus
