Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBF1A9B52
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749761099; cv=none; b=YTg+icxlvC1II2gBYqwM9kwwAiN3EVJVVyPdP1TheL0Uw+Md3GPdTf1MRbgKQ1Rpw87thw/SV0g4deuOFlR/YUXgP/VBK9an/5gTyfvzFK1AKH7UvuDNR4wggX3FLNbzbmPPoNEEaElwS+gFI76qjBlHdrjc4UtatCcSMl9vyZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749761099; c=relaxed/simple;
	bh=0shdeU3Nmns13gIvSpekGMtrKZaAuIpc2PTkyCP2Tbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRlNRXm5RX6dJ2LwP3i/gnq/XBoE0HMT7ynmhLJgP/gXWmcGdwCwNeLdYUOsnUFC2eNT3EdOVuRBhYhSHfhknZjou9Ow2U6mZQjea2osx9XTzyFr+u4a0dZ0bRFjass39Hct8hCyk2MBhHunApjmC8209zXEFAHYr0MT8ukP3iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I2iLAhFz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I2iLAhFz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2348ac8e0b4so18365ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749761097; x=1750365897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0shdeU3Nmns13gIvSpekGMtrKZaAuIpc2PTkyCP2Tbc=;
        b=I2iLAhFzijgdQ1YNvUeyvqvftSrEFW1ueLbsQMK8NMgetrYBJj7Fs12MvPJ7zbLifs
         yq0SZMlQb66p/GwBtC96c2S/vj+n/byGC/IwccATCNzh3ECLtciyKj+5tVyn/TePniAb
         R52oTb2kv0+g3xSj3bL1ANoWy1SFuhWqTi7ISqoArdOjj0I9pH8A+izFsDGdvhE6JEHn
         9VbBRTuGnjqfK23IPzFhmuNgtxCyzw75erN4u18qqlrQraVBNIsnzFgTBYg6oke6I9lB
         6hqiGgR8nCGG9NZU7zwDzKG4NDYaBt9nPoPJnwTCHEJ9Cry7Xe1VuDmfs4DW1a6Hf1zh
         oB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749761097; x=1750365897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0shdeU3Nmns13gIvSpekGMtrKZaAuIpc2PTkyCP2Tbc=;
        b=dFWYsWef5tqRUPqWQuNSDWUGz6jBLzpYkSnvbx/C9KSbiOKqJdxaEz79s1RKnswlcT
         fMAO50UeUff0mkW6vpPapKYWYwreIUdGelKQ5eUZbnAXUKAkK1w6ZtpL7ua2owtpPBbT
         lb6EJ4zizvChWKellWfC7J0VRSD+o1Vi6JBAI/75dPWKD5Szcg+6AI4gHnzAkpTXwavf
         p8kWZBecSth9BrKI3ONxx7jLBVtxydr6q5vsgUB2fbd4X3sZ9PPg18aa2WkbJNnJL8pQ
         jtj9dqNa3QaZISsjX6RFHGvPC5caycehBDQDw0uXs1zQWfA5ikS2DKGV146Ecfk6pvlk
         ANjA==
X-Forwarded-Encrypted: i=1; AJvYcCUQvZQ9uQJL+DamyCWaF+7uqDHf09ZB4smXwCINBvHwCpgkRrxrJF68OdrqFEcRANkZEFIWUKz1MIRnLZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvEPLegv2QgT87R40Aqp8Pejf464V7MfQhjNtcCyeQuehvXhzU
	bU0JlswXwFvGAoM9Pn6IIUCmewxbV1vQjo3ry38BF1Q8lKg54i493uZktnN37cE6FscvNJmKvVj
	bvS3bGi0FFOO8VPQw/SsUsoYx2t62vr9I8TOZcaGo
X-Gm-Gg: ASbGncuN3sXruJ8Ri3lARoFkUDnMSDZjdRCrj6tASIuXj9SbBwpCacQNLkGIVTHy9h0
	CPyZow9rfZqBAwOjLpMy9/QlVrg8xY5Klt5/Ey+NlZGZx8DyFMppst/ZmhE95ucVvDGLK/c/nqn
	0l8t/P+wMfYh1lZoAgZbCs2CBwSeHc168UbURmMA2zo9NPUrMOeupdhxLFcbM9zDoQauupQciO0
	Q==
X-Google-Smtp-Source: AGHT+IFQpp/hgcePI2xWrpQ53G9VWOawnMErUaqEJq2tPNn7M+/QfKB23VjAX85ytCeOgogiZvSGZYySA5m/hlCuyso=
X-Received: by 2002:a17:902:d48d:b0:223:ff93:322f with SMTP id
 d9443c01a7336-2365e8c8cf4mr545805ad.2.1749761096753; Thu, 12 Jun 2025
 13:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609145833.990793-1-mbloch@nvidia.com> <20250609145833.990793-11-mbloch@nvidia.com>
 <CAHS8izOX8t-Xu+mseiRBvLDYmk6G+iH=tX6t4SWY2TKBau7r-Q@mail.gmail.com> <9107e96e488a741c79e0f5de33dd73261056c033.camel@nvidia.com>
In-Reply-To: <9107e96e488a741c79e0f5de33dd73261056c033.camel@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Jun 2025 13:44:44 -0700
X-Gm-Features: AX0GCFsbgTfnHYCyryWuORz2W8YB0hxZo0nQDPNGkYposr4yQdjwdikAQJMpVe0
Message-ID: <CAHS8izOG+LoJ-GvyRu6zSVCUvoW4VzYX5CEdDhCdVLimOSP0KQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 10/12] net/mlx5e: Implement queue mgmt ops and
 single channel swap
To: Cosmin Ratiu <cratiu@nvidia.com>
Cc: Mark Bloch <mbloch@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>, 
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "hawk@kernel.org" <hawk@kernel.org>, 
	"davem@davemloft.net" <davem@davemloft.net>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, 
	"leon@kernel.org" <leon@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"ast@kernel.org" <ast@kernel.org>, "richardcochran@gmail.com" <richardcochran@gmail.com>, 
	Leon Romanovsky <leonro@nvidia.com>, 
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "edumazet@google.com" <edumazet@google.com>, 
	"horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	"daniel@iogearbox.net" <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	Gal Pressman <gal@nvidia.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:05=E2=80=AFAM Cosmin Ratiu <cratiu@nvidia.com> wr=
ote:
>
> On Wed, 2025-06-11 at 22:33 -0700, Mina Almasry wrote:
> > Is this really better than maintaining uniformity of behavior between
> > the drivers that support the queue mgmt api and just doing the
> > mlx5e_deactivate_priv_channels and mlx5e_close_channel in the stop
> > like core sorta expects?
> >
> > We currently use the ndos to restart a queue, but I'm imagining in
> > the
> > future we can expand it to create queues on behalf of the queues. The
> > stop queue API may be reused in other contexts, like maybe to kill a
> > dynamically created devmem queue or something, and this specific
> > driver may stop working because stop actually doesn't do anything?
> >
>
> The .ndo_queue_stop operation doesn't make sense by itself for mlx5,
> because the current mlx5 architecture is to atomically swap in all of
> the channels.
> The scenario you are describing, with a hypothetical ndo_queue_stop for
> dynamically created devmem queues would leave all of the queues stopped
> and the old channel deallocated in the channel array. Worse problems
> would happen in that state than with today's approach, which leaves the
> driver in functional state.
>
> Perhaps Saeed can add more details to this?

I see, so essentially mlx5 supports restarting a queue but not
necessarily stopping and starting a queue as separate actions?

If so, can maybe the comment on the function be reworded to more
strongly indicate that this is a limitation? Just asking because
future driver authors interested in implementing the queue API will
probably look at one of mlx5/gve/bnxt to see what an existing
implementation looks like, and I would rather them follow bnxt/gve
that is more in line with core's expectations if possible. But that's
a minor concern; I'm fine with this patch.

FWIW this may break in the future if core decides to add code that
actually uses the stop operation as a 'stop', not as a stepping stone
to 'restart', but I'm not sure we can do anything about that if it's a
driver limitation.

--=20
Thanks,
Mina
