Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F2125522D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192221; cv=none; b=b/ami7ZfJxs+xIIFQZzVpi7qs/XCMX9hmC7Jy/8HIVFzbAc51NG7jGvB7oMFLRjQr4JJ/YmeX9RE+a3d2/aHQGCr49Oflp9Hz6GAIPAuPbo5bvZcCrUr5fAqYjSNRJG84aeh9fqmpnskQdIsG9xThlSBKYuTY7nI4RZHYXx7m9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192221; c=relaxed/simple;
	bh=TI944W7nwE+JxQxg1F7X08i1fzHppMSOwPw+Trs1xc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0+4DtjvyEg+uot/pdn0t+vxlZUgb1Pki3YQCyUa7IF8QD3hidtp/Cxd+2KOcrSfm0CB7oeNXC1NlZtiSLHekWmRlAxDLQc9wNfHipu+mZmUkZhD0Y8XIUOGARCzVxljcpzqG/SI9UDGMO3roi875ICXkodxLxomd28Xb2yZEK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Dp8rs+mM; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Dp8rs+mM"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so3704694a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746192218; x=1746797018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI944W7nwE+JxQxg1F7X08i1fzHppMSOwPw+Trs1xc8=;
        b=Dp8rs+mMv0Rw228WlFHQhy5XmGU7heWHSO3umWFcx80hUIy3EBbs3232ob4JTHCYWG
         PClpshxNKWvGA/H4VtYh8JKjeAVsCof+utJA/7rNvUYJ87WkwL06BlowAMdfcfrpQOov
         RpDW9mx4ub3KaAgJVhR7z3VQzL+U8oW0WvU4kJcar/NhrqETZIPzgZmbK2+7quYeBcou
         iKLGBZ/76Sd7Srql+MCZA3gdPUasoF9i7r0RHARv2hgHkhjuDpaJlAEV4qjUk7jrMU+M
         1E+iettliQWT9RWUgRo3020LotyC6mDbdZt4NB+NGxlck0SUrPH0vav2elY8ykjReglp
         Mu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192218; x=1746797018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI944W7nwE+JxQxg1F7X08i1fzHppMSOwPw+Trs1xc8=;
        b=svG+FLZAIzdbj+cWgvectEP4Dr0Fk8PbVPjla8CKC7QdBzUBH+5ErNscgE/RVGtbD6
         v+zJoUL5ql9Ih5f3mzQe54WMaosVfwae4/EayFgC9/oOg0gVrOa6kxgX5LJIGemhbdHe
         Ju4GDgfbrz10NVc4IeBdWacHXMPDJRyApMu9JrPejQdZd+Un4GuzYZ3LGTmzqkELo6eZ
         I0QgS4Ds1yDy5SgWOw/QNqcuR8JYpbRh4s6NCmuj6kJXvz7XavsVaFHnWMakP1e2IBrv
         TZFM1+OdyFuoUP75CslCunm5ululZkxWe2zrAZvzD6Ylj460t0ngmsS2CwuLPW+Gi5Uz
         TF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/nAbcD6Gtj6DUIbRl5a9knZ+gn15kWCmPLxSAritzpMlzBWyetONsAo4m6oaUVvZYQfiEDqpvzXOVMvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXIqtQJWyfNNb3us+XLladYAZpi55A6DpLXHos6tSurNAOnzbF
	4KfPK1K8PYqA4XwDEmQIOj1mRhZZxVtOTQv8B9DQusnaANfUsxtQVWu1qNej03L6v0CdYPQYYc6
	EKmNpMkSKM4Bt2J/T8TC+o4zdOgdmJ95YW9eZuQ==
X-Gm-Gg: ASbGncsHaWP+nZHUlk7gToKXqNXLvuic/lS0RpmXCc1dSQARFYQ8C8T2suwVO/tp7qZ
	GHjLDS5LzMOa3Iejgo4rKVwxK9mek/h93qjDub7iemzc/avrf3ggBzKPMpKaIanR9ckgSRVyfkm
	kSr2J0dJyaBuljsETqmS99Gg6yIgadsavbgLeP5uD21qjbJrn5sps=
X-Google-Smtp-Source: AGHT+IFMyBwKfK9Z9JbupOVW65Wu1o5h4CBMm18IpbZIZKZdg4iN1PfqUi4JSWYaN6Ex2glwgaL3FWCQNoPyPa9idac=
X-Received: by 2002:a17:907:6d06:b0:ab7:1012:3ccb with SMTP id
 a640c23a62f3a-ad17ad81de2mr316565866b.14.1746192217703; Fri, 02 May 2025
 06:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502121930.4008251-1-max.kellermann@ionos.com> <bbublxzpnqrzjq5rmmbp772w2darjoahlewqky7caanaknglbx@6wuy5nidsnu3>
In-Reply-To: <bbublxzpnqrzjq5rmmbp772w2darjoahlewqky7caanaknglbx@6wuy5nidsnu3>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 2 May 2025 15:23:26 +0200
X-Gm-Features: ATxdqUGF_rl8dKvOlXEfM1UTrLrknqY5nuPjMvrH0QUc55d01sVesoq_876Tmvo
Message-ID: <CAKPOu+_8cbUk=8d41GQGOvUrmG9OuaNVuSQrksDcUQMyFc4tiA@mail.gmail.com>
Subject: Re: [PATCH] kernel/cgroup/pids: add "pids.forks" counter
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, cgroups@vger.kernel.org.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 2:55=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.com=
> wrote:
> bpftrace <<EOD

Sure you can do everything with BPF, but that's several magnitudes
more overhead (if you worry about the atomic operation in my patch).

Your script is a nice PoC that demonstrates the power and simplicity
of BPF (I love BPF!), but we want to monitor all servers permanently
and log every counter of every cgroup. Later, if we see (performance)
problems, we can reconstruct from those logs what/who may have caused
them. The fork counter is an interesting detail for this.

> It would conceptually fit better as a pids.stat:forks (but there's no
> pids.stat unlike other controllers')

That would be fine for me. Maybe that's one reason to initially add
"pids.stat", and then maybe people figure out more stuff to put there?
If you wish, I can implement that.

> But I don't know this new field justifies introductions of a cgroup
> attribute and (yet) another atomic operation on the forking path.
>
> Does the value have long-term or broad use?

It's very useful for us and that justifies the (small) memory+atomic
overhead, but others may have a different opinion. If you don't find
it useful, we'll just keep the patch in our private kernel fork (like
dozens of others).

Max
