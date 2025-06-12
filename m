Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8820D4E1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713136; cv=none; b=A935eVQhLgF1+IVZPlnGDGLKPTrnx/Q5I8T2v8Kv69eV6NThKHM/5IeoO0clwGpiEifo6pFDNWFM9iRB6+Syyz9Z6eb+eGbWrpU9Pw3PuA3DiHLGPIMPjbSMiGvv8owwEmlwJURgkhhkHXus23N0WxxiubXBNh4VtE4jFhJofi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713136; c=relaxed/simple;
	bh=ur9blTN+fSDyxSNvmsKgVelNyCknt1MsnEQUweyXk10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZ1/4FYl3vDTGO53ZjgYKrYgXrRM4axvMnXm7gSlLwu8mX9z5cF0Xf1ioxPpMcIxQFy1w3HaCziIuKprT7+E+H5WSiMvX/yRrVxfla4bKtZAjn8CUKoxwWRIfOkhmQo1ZnRuU6UeXhFAWCrnGDrd9klYc0WoO3ECEVLn7HnXluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LxVlust5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LxVlust5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749713133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIFNGdl55UNkNcCSJnLvJTDzJi2fG6iDBcZL44c6Epc=;
	b=LxVlust5XAOgG1iIvqLkQOOONDikt8XJE7ZlQTdmgYlw0jFM6l+R7JVmFZdCCM79x1sudu
	lrncj2F5lRobn3vEY/WX51bsMwosK/BG8m3BoATtiHxso9kV0hVrDKS4TPDbqgBpt9HNj4
	Z7OSDw68eiSuYvV81Mq66PSYCTYat6s=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-M-cs-eR9PTOuq27mDuqclA-1; Thu, 12 Jun 2025 03:25:31 -0400
X-MC-Unique: M-cs-eR9PTOuq27mDuqclA-1
X-Mimecast-MFC-AGG-ID: M-cs-eR9PTOuq27mDuqclA_1749713131
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311d670ad35so691838a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713131; x=1750317931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIFNGdl55UNkNcCSJnLvJTDzJi2fG6iDBcZL44c6Epc=;
        b=rzQOJCd6lJ8EXnYk7ZQFgnZsZtHTpvIVC2OD86E4b1GiGNA6nLh9YJuEjSDyzw0kCd
         lj9celxpORuhtRWtKIiYXyVJrF3ejMA9CF/3lD5GGDERCaLZRectN1Y7//6iLEeFz/Fv
         B4W91kL/T1UL7lVtCw7pwu2at2GLmB8Cc4Hh8cYWJ/PbJtspv/KL32KEV+ki0b07zHi3
         YTlXxch4I2S1pymP2b76SMyGHB3Cu+ZGkZ40ut2lxw21oo7PMRGSNh61HYLd+S9efzpu
         4ftxg49qFjhUx0iZUOhvW7ASAy3RNkauZ3W4tydiS5w1AQNfXMFgWsgJedM9QGduxaLR
         5O6w==
X-Forwarded-Encrypted: i=1; AJvYcCVlvrBTYchkHYyRiTr4nhBotreqzuDksgabLQ/mEv41EDlznZ5f82ld04VDShQygTzBD0JxNbZ+K7dR+50=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUNyC+kcVVDApXpwlM4tEJGP/tEulvtu7ie0cZuTo3rfFy+FxR
	2c2S0H9G389FjoWWG28trUw3nxyYTT0vgQ7n8GPTitlGUfUHG2UdWudEr59SC50xIfgDCWcI4KZ
	0r1n/F6ZLoXxXaYoa3j6FCMosXbOXZusi5j6tHXnD0MTaCSNx6zInVEN1ATVnkatz5fe8LG3DuK
	MuZyg1Vg5oVNiCqTVVSWOxP42EbpZBQQMkJC6Taqmt
X-Gm-Gg: ASbGncsrTMBqI8jKRMdVQg8EujCQjO21p+lbNRwH2AT6hOl1LHl/Ktu5IkqCEnyTFqt
	iZk0Q3bYibM0irV2mtN1w8uSuLAY3gmbSQvAEDk3yICnF0qwJCJBrXHAd6eaM0oZIihgI7d91+D
	a9xw==
X-Received: by 2002:a17:90b:3a86:b0:312:e9d:4002 with SMTP id 98e67ed59e1d1-313c08d2a7amr2927537a91.28.1749713130829;
        Thu, 12 Jun 2025 00:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsn9cQekYcoWU3hmfR9nZcFgm5yG2fmnWGf0A0tOWhrHNUnC4LDJH9grLMX433snr/rMDLwZSQaKfwa5hMM/g=
X-Received: by 2002:a17:90b:3a86:b0:312:e9d:4002 with SMTP id
 98e67ed59e1d1-313c08d2a7amr2927511a91.28.1749713130441; Thu, 12 Jun 2025
 00:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606115012.1331551-1-eperezma@redhat.com> <20250606115012.1331551-6-eperezma@redhat.com>
 <CACGkMEsoC9g5j+GDaQGaRdGZXaCorfgP7mdhsk3cOg4BFnCcpA@mail.gmail.com>
In-Reply-To: <CACGkMEsoC9g5j+GDaQGaRdGZXaCorfgP7mdhsk3cOg4BFnCcpA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 12 Jun 2025 09:24:54 +0200
X-Gm-Features: AX0GCFvci-W3cksqXjkQxoSVAR1GDsfAe_M9pONGx-R3lnQEy3g31a2aAJARTwk
Message-ID: <CAJaqyWe_R_59mm1i3UE=MmrVfYCQsqP5=EvHC6Ax234zibFZew@mail.gmail.com>
Subject: Re: [RFC 5/6] vduse: reset group asid in reset
To: Jason Wang <jasowang@redhat.com>
Cc: Yongji Xie <xieyongji@bytedance.com>, Cindy Lu <lulu@redhat.com>, 
	linux-kernel@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Maxime Coquelin <mcoqueli@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:33=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Fri, Jun 6, 2025 at 7:50=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> >
> > Is the expected behavior with vdpa_sim and mlx.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  drivers/vdpa/vdpa_user/vduse_dev.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
>
> Should we squash this into patch 3?
>

I agree, I'll do it for the next series. Thanks!

