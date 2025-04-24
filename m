Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33AA27F74E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519842; cv=none; b=blIxQ4mVM0FljnWwDnYoGr59wFsWW6Da64uQlnAb0OOnd7Oq0t5WMwclnJd7vAYfmFXjtfuF6qb4Yv+v8LTdMTI2Nsr9sXeK2byq/SgPv0fnxNcpyWSGPAJKP7LiJ/nZ7rs5NKN2RBoNKJcu17o5dKhP9ZILMQmVUonUfFwijxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519842; c=relaxed/simple;
	bh=+ObrAILT9MkV5shE5b54uVUAUE30hCzzXTVkWGYXhw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmsfQZgqAWE6Llyh4XESMeybefctD6EQD5VRZEISGYQK7FyS/9JM83mbx/iMMtGSNzHJaYFKwyw4TS+JX/BDF5wYvXpZsmvvNzLM00Cu2NXENSiA+lFo9hf0gl6gXTrOfNLrjGbXnT6PO7tLjz+sXLMp+WJTRPkEBajSRTykYy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KEkR48Nm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KEkR48Nm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso5365e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745519839; x=1746124639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNqctYL3THrGPUgjPioxVFaahQ/pztGGq3mgBrGdeIA=;
        b=KEkR48Nmw3ARC98RUya/+7ej53CBzhGZXZN0R9eQHTvrufmKK2/FzYklC//bw3JciR
         yK9nYiEKti2OfipZrKXr5p7sDtaNfWYGKisfDTTUCdiaSg+Fjr7JC+Mxbs3WrsVdETJn
         CuekIjCAkY6kpM1bkcZHlralAJJ4mhl4F0kTpv52gOAUi7FmnXT7LwG3yvtde7IVv004
         qju9AU+8x2Xcc0XZ3tzlm3GlxmBYHsc1CzAe9ydNcNciqhlyMELZ5OdibRNnqAjo72DA
         rIQtFovm1ZhjEwjIoCp6tCFIcZnXmZiftsLuULeHe1LJ2L4uQ5BP+MApJ3EDROSEB/HB
         ySkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519839; x=1746124639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNqctYL3THrGPUgjPioxVFaahQ/pztGGq3mgBrGdeIA=;
        b=v5af+CXYt1Yno/l6jtlQ/67eTIGrXPjfrWTi9QD45MsBaJwYEYdW0Kld1C2JuXFNcq
         I/kWQ3pMFud+Wyl8h8KeytlTGB2VhwLPcIE4ED/1EOt0iDJP66al54FY5apC123Nm2BQ
         IHvM3I3LPM5mOcpYveT0Xmteq3cY2UUI72Ne7Ih4yemH41TFbA3apVlgjRo0GpehhqE7
         1z4RcohzRZYsuvzCcdjKFWLonyGkgHNFQqXqAQhMfLT1i+dMc8OCbUcfdCjg1cLO3Qdn
         OthIQpXdBpZHnCeUHYyCP7wm8x2FZtE5gvyFnTnrwI87vdDES/KvB4wh5cKtTzXbyDRI
         BJZg==
X-Forwarded-Encrypted: i=1; AJvYcCVNu7oMdgj9w66b+QxYBA3pwezURP4GRTcQPIPG4z1GCX1EjOrH877nDcDbuHmWANYwtVFUiLmMWKVot/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwibdbkOgYbvYI/0l6Cfvexbh2ZWNxYhmLy1IXD7Euh0bh5cSCK
	VirFu7Z3q97UYH6aqxwCfigzFqhYf4Hh0UPy1LuAmXxjWyn/Qz4uDIkEDfhI6uGFJ7k4c8Zpd17
	SfOg6wMg/Bf4hbVJLjTWXpGYFJIZAd7WQupo+
X-Gm-Gg: ASbGncudvAbchsnh2fyrMPE18XDWKUrRrKvtTOsrD1PA756zUXLcsrFGAV0hR7JCO86
	N6a0Rvjm+eUVw9xSxiQBVPihzDdyJm2aKk+1ihlCLMrw2s9GqtUQ7tH+4eV6R8ONU/ETi72VgWv
	4iQIwFletJEtiKG40ydNHvzysx0UgU+7I5M/1ZNzLIevSav8abz7/O
X-Google-Smtp-Source: AGHT+IEHp5xBpPTtWdZMCzH+i0q9BEJGwYBYE7/dAlz0v4nOND8LIunN0ki4CNECu8NBZl9yPLxj0Z18YNBl1Z62spA=
X-Received: by 2002:a7b:ce10:0:b0:43b:bf3f:9664 with SMTP id
 5b1f17b1804b1-440a44c1c39mr72835e9.5.1745519838948; Thu, 24 Apr 2025 11:37:18
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417204323.3902669-1-hramamurthy@google.com> <20250423171431.2cd8ca21@kernel.org>
In-Reply-To: <20250423171431.2cd8ca21@kernel.org>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Thu, 24 Apr 2025 11:37:07 -0700
X-Gm-Features: ATxdqUHZZkXp_HEGK61LJUBhezgIo7ojwCvAQNi8CpuLohtbOPKgVVzGIJimasw
Message-ID: <CAG-FcCPexBHubfzRcVUsBXRYkY0v-ricG-yqLd5q1j051cbEoQ@mail.gmail.com>
Subject: Re: [PATCH net] gve: Add adminq lock for creating and destroying
 multiple queues
To: Jakub Kicinski <kuba@kernel.org>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org, jeroendb@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, pkaligineedi@google.com, willemb@google.com, 
	shailend@google.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 5:14=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 17 Apr 2025 20:43:23 +0000 Harshitha Ramamurthy wrote:
> > Also this patch cleans up the error handling code of
> > gve_adminq_destroy_tx_queue.
>
> >  static int gve_adminq_destroy_tx_queue(struct gve_priv *priv, u32 queu=
e_index)
> >  {
> >       union gve_adminq_command cmd;
> > -     int err;
> >
> >       memset(&cmd, 0, sizeof(cmd));
> >       cmd.opcode =3D cpu_to_be32(GVE_ADMINQ_DESTROY_TX_QUEUE);
> > @@ -808,11 +820,7 @@ static int gve_adminq_destroy_tx_queue(struct gve_=
priv *priv, u32 queue_index)
> >               .queue_id =3D cpu_to_be32(queue_index),
> >       };
> >
> > -     err =3D gve_adminq_issue_cmd(priv, &cmd);
> > -     if (err)
> > -             return err;
> > -
> > -     return 0;
> > +     return gve_adminq_issue_cmd(priv, &cmd);
> >  }
>
> You mean this cleanup? That's not appropriate for a stable fix...
>
> Could you also explain which callers of this core are not already
> under rtnl_lock and/pr the netdev instance lock?
I discovered this and thought that this applied more widely, but upon
rereading it turns out it only applies to upcoming timestamping
patches and a previous flow steering code attempt that was scuttled.
Current callers are under rtnl_lock or netdev_lock. Should not have
been sent to the net. So will send as part of the timestamping series.
Thanks.


> --
> pw-bot: cr
