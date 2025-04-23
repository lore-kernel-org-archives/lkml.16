Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F4E1FECBD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745447845; cv=none; b=RoDdpJGz/A/9BuwJhuifMmRUGgMpYOI23knXqCtDtN8GO6aOHY9a2GLZRhEndyMTfHcodiHlZUHv9HxeSdc7o4pxLXVifMlJtt/7ORFTLWdqpn0L7mQ4BPy94EIga0Bh+Nnz9n1Aeq83g2iUtFNqZqpD9KZHx6UjSj1gYwdY4pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745447845; c=relaxed/simple;
	bh=f/2jw2XBjQTuc26C5bkIdgOj0nEQeC1a4KOOfGFsUrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ii3odwHGrJv38juujgIl8zAVP5kRI2j0f49sL4Skf/0y95gsDjeyDBvRfvQs57apveoLprtdTzATAz8BB6HpTM345DNmgEAGLV2E82LvLy4b5j2iR1X10VFWhJ8h+l4Zq7mOzy0GAA3hmy9lAFaixbcQQgts+fIN98flWmKbRv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXIDg7LD; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXIDg7LD"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d2fba8647so367794241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745447843; x=1746052643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nz+gipDjmANXat/46iFhAh6Yk8nUwnIL8n2w46JbNo=;
        b=aXIDg7LDhpL+qpZnwLSRGVY3XAa9+czQqq6Z05XF2lMPQpa2dzhC+WlpvJKZU/wKYu
         kGpdJ6CjWL6isY6zAypEZkdkrRzKldwlaqnVQEy0BTZ5GgbafN0Or034NeXAnISnd2WA
         sSaFjD02FV7sQMJV832wvQrNzJ6Pxd+0id5tzuzYI+QOZ7SRDWElEBQNH2F3ui7JfxRk
         XsuLZJZfvocdxkE+lfEQ+SKxNqbyNrL/Hi2IwdCrm1R+1xA924OhmT2e2YHtjkiCdwtn
         kUh/Ne6lw2c/TK6KabnuJ0ah/+X43wxBJobqP1AyWWvAN05d7pj9IoUXaTfzc4Mve1AS
         sNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745447843; x=1746052643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nz+gipDjmANXat/46iFhAh6Yk8nUwnIL8n2w46JbNo=;
        b=ZblxwvHGFQvAZjeJk0w2u6YGpakGNZEgDY5tUnR4MFuPds/ksLcSbZKBxaZ5yyhrIk
         VxSBsA8y3x2t8Qful5ifkoK4dXi0gO61o9p2qa3CZyr+oknlqT8sdJHhCBLUjpFs74ss
         /0ARvpXqXtQwJ7nsxxr9o3C4uWS4onxrIGz7g4sO12YMvUpaC55QoCyiU8kSp0gu2dj0
         wk8gan3v9w6Cr8K0ltSwmPt/3AFnf7loMVQ6SkUCnIvQcZ/oH5z3PqnhucQfsXoD3zwq
         rNbuL58TwJ/kd3ZCoafFyApRnoQSdXsiIdh8MhJeN1ivfnsAU5SqqNH8PQ/7yVzsADti
         Fetg==
X-Forwarded-Encrypted: i=1; AJvYcCVOPONiR0+IUnZTRl3djHQlNaQP9NLaMwP5dGveQa2vkM8CT5JbSpXi4DTLpnmCC2F1fPC8231S+F8uRao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyU0W8IXDzNfmhGQ4LEu/wF5QyKPtB4v5SyVtWFjPRAFGkfvnK
	DC+68kdH3QCQJTao486vFKhhuzd1Pie3cAOx10tYZzYTk9fBAuv6+/1N5OVGl4pWwRr0jz+HdBs
	RT5fyDDwJD5qg+Oy9KJibd59K/g8=
X-Gm-Gg: ASbGncvo/bkoEDcNR0XXoUjND8B6Wnztx/VqL2kOaubyFE1t8w+/R1VKa60KnPEsGpW
	B+ND9almgsih5lt6hjGEPkILhembcLudySg2aOP9P+6pwOt3Ni2FzvpVHpuFrHeCdSwrjIQGlOu
	AYrPfRCz46rb83ignv4XdYN9QDfdqGJ+dvUKdH3aicWM5T8Xmkt0CE
X-Google-Smtp-Source: AGHT+IHI49KmhaFnzTJnRm4xJm2Aet7c253pNW/wHNviVly6fNSvQqCW25sHSp8xGsWqLRlJRP+9TlfgYP5nWK4UgN8=
X-Received: by 2002:a05:6102:2b83:b0:4c3:6ba1:3aac with SMTP id
 ada2fe7eead31-4d38cf2f542mr835602137.3.1745447843065; Wed, 23 Apr 2025
 15:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423060621.632581-1-alistair.francis@wdc.com>
 <ed993f55-bdfc-4376-951d-9af4a4f461a9@suse.de> <CAKmqyKOBOCV=mU0BRdZu2vPzx-+3fkp7qJXiTXF7dPM35eXguw@mail.gmail.com>
In-Reply-To: <CAKmqyKOBOCV=mU0BRdZu2vPzx-+3fkp7qJXiTXF7dPM35eXguw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Apr 2025 08:36:57 +1000
X-Gm-Features: ATxdqUELk8bpIDMoB69M1_GWUpYFpptzfdIs_SlWACvuN0IwPs0Ca46TI0LrsUg
Message-ID: <CAKmqyKMby=+0-dwCeVGYS5rPqGqS26yabbw1K6Kg_j3NdGXMLQ@mail.gmail.com>
Subject: Re: [PATCH] nvmet-tcp: don't restore null sk_state_change
To: Hannes Reinecke <hare@suse.de>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	csander@purestorage.com, shinichiro.kawasaki@wdc.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:47=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Wed, Apr 23, 2025 at 4:21=E2=80=AFPM Hannes Reinecke <hare@suse.de> wr=
ote:
> >
> > On 4/23/25 08:06, Alistair Francis wrote:
> > > queue->state_change is set as part of nvmet_tcp_set_queue_sock(), but=
 if
> > > the TCP connection isn't established when nvmet_tcp_set_queue_sock() =
is
> > > called then queue->state_change isn't set and sock->sk->sk_state_chan=
ge
> > > isn't replaced.
> > >
> > > As such we don't need to restore sock->sk->sk_state_change if
> > > queue->state_change is NULL.
> > >
> > Good catch!
> >
> > [ .. ]
> >
> > > Resolves: https://lore.kernel.org/linux-nvme/5hdonndzoqa265oq3bj6iarw=
tfk5dewxxjtbjvn5uqnwclpwt6@a2n6w3taxxex/
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > > We could also remove the `sock->sk->sk_state !=3D TCP_ESTABLISHED` ch=
eck
> > > in nvmet_tcp_set_queue_sock() if that's prefered.

Actually that by itself isn't enough to fix the NULL dereference. We
still need the NULL check from this patch.

So I think this patch as it currently is should be the fix

Alistair

> > >
> > Please do.
> > We cannot influence what the network stack did, so if there ever were a
> > modification which caused the ->state_change callback _not_ to be set
> > the whole issue pops up again.
>
> If queue->state_change isn't set for any other reason this patch
> should also work, but I'll remove the `sock->sk->sk_state !=3D
> TCP_ESTABLISHED` check as well
>
> Alistair
>
> >
> > Cheers,
> >
> > Hannes
> > --
> > Dr. Hannes Reinecke                  Kernel Storage Architect
> > hare@suse.de                                +49 911 74053 688
> > SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> > HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
