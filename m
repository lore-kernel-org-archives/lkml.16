Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F5827BF76
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143766; cv=none; b=LNHqP8v/Xpo0+4Mpp7+3nsFHTMmf+2yzzebBAUfu8+wf3qM2jExP5AfuglCP54C3ZjQ0lFj4o5kpQSdEJ9sasZ76u+B5ntkCqvMU21GmYj1gCG1L/+3XwQgr6sYR1b7YC+X4juacQsBPsTCX2OHW3eATWyfLVAb+mDz07TckKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143766; c=relaxed/simple;
	bh=BsygIKSp4Y3uOUd9YvjvTHCT2OkAn7HB5ddVxCuXJEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GD/6+svThKXu63IKLIudi5ubjYjcyyeJARsS4AkRNbRziEx9cZvxvOYDpwTOIYwWj6no9bZh6v8wnC5C5movnS7qa2/GPKuFbs6Qi+k9XNtBnyJOIaW0ncpIriaqsy4B5RcLVXnIBFHvHsiHt5JC8ODs6E2IeTx9BsLrr/JWAD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MwAyXaEw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MwAyXaEw"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso954a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749143763; x=1749748563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPVE+qJAV6lF2hHXHMzzV+2De3yTj5blSt0gISYXzwA=;
        b=MwAyXaEwlZ7Nxrxm/X6cB0znXJd7O7WKJzf2NblihAy3Ww9LpVGuJtoIsh4BW8CRAX
         1Epaq2CeQzEsTahYiq0LArwfoMvR3WlIuTUvc3dBJYzVdWkaeOc5HP9h4yiDgMkHTphT
         cdz/srYV1XFjAFAcHK0iC79USIKJTN/kyKgrV/koT3pUbLuIXO6E4nuWycE7JLE/G/QP
         3w6oXGuOH4dRw5cvDXnru7LfvM2Z+1yyZI8bSt5CEtBuIVY3Ad1GG8TdEoiiyjPGvN5R
         mL0Z6rShShxT7tIr3JnrIdQP8FGHF2KOAHbU0PNG2i95oblAB5Dajimsf6tin2zbkZ9V
         qYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143763; x=1749748563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPVE+qJAV6lF2hHXHMzzV+2De3yTj5blSt0gISYXzwA=;
        b=kca4vxoN8M0G6J02fitrUy70dkW8bS3UV60HtVy74ACjNZz9ZA91dLmkyyR0SR8oid
         THMTgcZRmhw+3Y7Ucy4pkho6PRSGibUnfpAPH1j+9RT7DYmXlZxFgOQf6kTnAap3xm/V
         IffjWVD9Sr6SLGAFVFC/7ctq6CkjDPAyTbJm9hYQb2xmqHZd38wKeIE1SjYAXFHoHE1I
         wzOqt5aVeG/XSKTzWwXU3+fqPy9Ej4ZXV36OaXXMGZrQbFRcDsRIzydlbNlhHJZqBP9P
         sFgEzVnAT6O3TwWtKs01lIWO4AkVhlxkbiAopTJJOmGCN9t3+7cI8nGoR/VHavrUmv7R
         5NkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKj553+V3RCwW8E5h/noc9rnWiyc7TM2B6tMhh923NMAs227EbfABGpB0nvqDjX5jdnznuy9U9fjpSxMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVx615u0/HTEkHvHXkD4KOjs5kZzECMvS+Nu92ZEcVRtp7bV7
	MNt9coTANjn99OrTnokUrZS4WmEzuxdfikTur9AJbYud/PkqviIJ6kj/OCmKqeca8sorTUZFZhi
	a9Fet2Hyz1CeoGmcXoBxfXKk0aTDKnCDgNlld+I3c
X-Gm-Gg: ASbGncsdLYRV7LQaywR17sa9JAxaEZImlknGFGG2L8v4QyQL/VKOULVOKEXemcIt8Vg
	P5jl15WnD8BSpGrPo9vLG7woe6HCAgqgDoyfSyDtp/LgJnY3X2/TV5B7x8HJAK/vVcsRuatK+n7
	3EQpNWGHfcaPOcE8n/WqEBqX8VBADxG8uQbJ3dE6mVNavMtr0QIatUPwm00bEJ2HNLA6WpSbUE2
	A==
X-Google-Smtp-Source: AGHT+IEsgNzktdJh8pc4Dp3J6fwwrOaLSQOcszvs7/V6sLuXQttJOIsOGPFSPRrS9VKP14E+I/IdyLbh1uIoYp0lGsg=
X-Received: by 2002:aa7:d9d3:0:b0:604:58e9:516c with SMTP id
 4fb4d7f45d1cf-60728a7df98mr100839a12.5.1749143762656; Thu, 05 Jun 2025
 10:16:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604201938.1409219-1-hramamurthy@google.com> <20250605081301.2659870c@kernel.org>
In-Reply-To: <20250605081301.2659870c@kernel.org>
From: Tim Hostetler <thostet@google.com>
Date: Thu, 5 Jun 2025 10:15:51 -0700
X-Gm-Features: AX0GCFvU2CbYecoDIb-s7wGpB4WkLnNVAMUQD6Cou3zqyUzrgIjk7T8up8uY8kk
Message-ID: <CAByH8UvMV94aVmmwb37f-wT8HpPKB3Nf8AF+67FM87XBz7+pww@mail.gmail.com>
Subject: Re: [PATCH net] gve: Fix stuck TX queue for DQ queue format
To: Jakub Kicinski <kuba@kernel.org>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, jeroendb@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, pkaligineedi@google.com, 
	joshwash@google.com, jfraker@google.com, awogbemila@google.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 8:13=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed,  4 Jun 2025 20:19:38 +0000 Harshitha Ramamurthy wrote:
> > +     netdev_info(dev, "Kicking queue %d", txqueue);
> > +     napi_schedule(&block->napi);
> > +     tx->last_kick_msec =3D current_time;
> > +     goto out;
> >
> >  reset:
> >       gve_schedule_reset(priv);
>
> gotos at the base level of the function are too ugly to exit.
>
> Please refactor this first to move the logic that decides whether
> reset should happen to a separate helper, then you can avoid both
> gotos/labels.
>
> goto reset should turn into return true
> goto out should turn into return false

That makes sense to me, I'll refactor this in v2.
