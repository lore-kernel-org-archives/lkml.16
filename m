Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00121FC10E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778047; cv=none; b=TrN61Mf9zOeC0jUyK0gpLl1V4X2FDMjID4/lZ/pwl66+GbRW30r440jp83P5JI4FYMZk9qtAF5SRw8IL52xpdGSCpzRbQLbl/QogjPBcquWXP2FRHNvdDe7crGJXhhv5tu64k6R30oDs3mEamDGo4hBOBa7m/8RCnO2gPh20Xv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778047; c=relaxed/simple;
	bh=970ezek36sjIWXHxxKSkpZRujwn3PK9qIFqn3uHzVlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gk5KuvsNQ8jOA6CqJ0Hhu2syV66kLnmFXyMdmWUdAyTs9ZRMo7CaScAC1F0hH69HNfmZDF5hZqihYiPRCSeLohsK9nfcsEAw3eA6HArK0b34pZXrWf92l1wtouT6EMdKqnaMFOOOeXZvow9DrqigRfHzyc1U7+2ftYiLlvZ9eVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ+8esyM; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ+8esyM"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso2306049a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 09:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738778044; x=1739382844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np4ftru1I9LNGUJpROSYrAynMNzztpYVqqVw5kq6jwQ=;
        b=DJ+8esyMJlODp7t90dC0rqU1mABZNWbPXgLhLqppIiUCC85utPFqd+cGZzFxMRea19
         CT7IIGOgdCmiLYj/zECJ78wvzRNamMvFxgSAo6tCPVb1T0lfeq3dzA0mSEE+T5NqzYUA
         zbSVD0OPkWwanCuirZ0FRboatDbtiUFSdwMMaSKf+MDE5sSE2n0gBNrFMvMUAjbK7GV9
         Q/CZw35uBAkRYxsxdeQn3rkzRrj2IlOYRTOrPqQaKWVexs75hH/qgBp5U00hAcBlRsmR
         HDilCup4/bOZc+A8TRwAP3MML9kKL/fwvHXxNVddhiAIAk5hhZwvTqXqjf178IdMTKU6
         cppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778044; x=1739382844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Np4ftru1I9LNGUJpROSYrAynMNzztpYVqqVw5kq6jwQ=;
        b=aXCO1NrmBSKiSOnXWRe2sWm4WmXQWZkW7ANQb2wwLYkVODY4usFYtz5STLOkCWts8W
         5TJQ+/bwQK8bigvO6vMi3LNLvaXlHb5+iiwRoz4IkTBovEGLlJ//ORZndfX01SvpSrlP
         8CAKvAOpP/qxlrXy+Q/KfcN1RxU5brlz8sOmgtEsN8APr4nb3U/1kGXtKsznx71P+2o2
         YBoDPPc/HZVczN+LRkO7h3Ym4JW36CfZzTV0OeDZ6riSFywshYBWKVrFlKcb0oxMt7wW
         EoMCQ761uCLb1ISoJilqPYZ8BVLF3houc5J+xhIz2M1KhNs5X5++BHFNS7hf2tq32TPK
         LRzw==
X-Forwarded-Encrypted: i=1; AJvYcCXIKNhRRxgpWXKllxn4YT3bEJEvYqbIQ8l9oPojlSKayGMcRuSxGcFy4lRwMevMWnzOuA7RImI2UJ6IQCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDjdPT6mDPVJeSeBCbw+PA/ji0XPYHtIGldxK4FK1LS05o5QjR
	d1RXeKHTJtZwQGexiccvr2Ul+zBCGEN8Rx0JQm5R0WRymZDnxhTDlKucjjOQopz/HqjAwFNOPdD
	2md/qeNZWIjOttSoZJtIkp/996G0=
X-Gm-Gg: ASbGncsxx/Z48geXfUlpfNr7XA8hYMcpEEZ0XAh1LuELgwtLajX7OahIanRP23VNfeg
	HUq3R5akICqrwDN+l6sTd5JMflni7ICy4MmS5ImLGSjq7sXGl8qw110qwxNO56Z8YjFh2MBY=
X-Google-Smtp-Source: AGHT+IHHMLn05Nj/+hMzbI90ilYEL2XlTSR/WIIIZEaG2XZIilXn29yD7z7FkWfF3Y3OSIXpZhfxgLYe7W133RDROm0=
X-Received: by 2002:a05:6402:1e88:b0:5db:f40f:1a5f with SMTP id
 4fb4d7f45d1cf-5dcecd343a1mr190698a12.15.1738778044014; Wed, 05 Feb 2025
 09:54:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205175136.GA8702@redhat.com>
In-Reply-To: <20250205175136.GA8702@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 5 Feb 2025 18:53:52 +0100
X-Gm-Features: AWEUYZkWqMDewS9uln1v_8ga4J4p3gKOAr5BnpoVvOwZTii7KY5RhUlZGHR0LLg
Message-ID: <CAGudoHGr+8fi14FnfE5K9k=EOhRXvpjw9BP1E3vS861ob0vE3Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] exit: change the release_task() paths to call
 flush_sigqueue() lockless
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 6:52=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wrot=
e:
>
> Thomas, Frederic, could you review?
>
> Untested, and I'll recheck this patch tomorrow, perhaps I missed somethin=
g...
>
> Mateusz, this patch has minor conflicts with your
>
>         [PATCH v3 0/6] reduce tasklist_lock hold time on exit and do some
>
> WIP changes. I can wait for v4 from you and rebase on top, but I'd like
> to show this patch right now to simplify the review.
>

I'm still waiting for feedback from Eric.

I'll rebase on whatever patch which lands.
--=20
Mateusz Guzik <mjguzik gmail.com>
