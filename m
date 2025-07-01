Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298C927EFFC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388136; cv=none; b=DpUYqFB9BXSEWLugo/dK1lK/SkHaVajG+HXbgk0+hRnhi884kkuOGzeCOA/L+bG4JHh9ZKJ/q01q+oZUZSvNi++gxCzzhpzQQA31yci5RSXgh7Spw5CmLewCsrxHDjP+P6+XJlZzhzgAigtTfEOwa5SIP2gTh7oqB2ytI3BV0Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388136; c=relaxed/simple;
	bh=YuhJGORAh613fAJrS7istVlyL0AiBBpQmS7vJlip+3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hpdhh4NOsZBK+6HtvkYAA1RxYVZZ3HFynJhZs9JX3rACgaV0SJHY6kNIdFmkxrK/wH/yW3x96oW8bqNNjTyBMvIrrNuZ4DjEjfnKd9uRKuF/kOB6S978fzM/ewiGqr4XKS3CgZEnPD/mki07e3xUJARha1HGen25BXi/yZrlv0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H9iRQWCy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H9iRQWCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751388134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vw0CeK7q4A0Zgl7Tz8NsidMajuM4JFnR3OqNxAKfMlA=;
	b=H9iRQWCywV3ERYtOAJLRkgtb7uWbpftzVHib+FlynVsyVFFaYKMbtJWg30Tubfmvq8kne9
	6PPPX2HtvwcZbfxv9i3SurJUh5MDjjcGLlASeg+PBaokv/rq6VLWKnHIPSI/m5fQbnCbfR
	S4Ls8e06YguSjlVdKjxbuOpe+QCtsHM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-0hbRKIGtOnWzAl1mwfoAgg-1; Tue, 01 Jul 2025 12:42:13 -0400
X-MC-Unique: 0hbRKIGtOnWzAl1mwfoAgg-1
X-Mimecast-MFC-AGG-ID: 0hbRKIGtOnWzAl1mwfoAgg_1751388132
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6098216df4eso6066577a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388131; x=1751992931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vw0CeK7q4A0Zgl7Tz8NsidMajuM4JFnR3OqNxAKfMlA=;
        b=U5P1RjS5GGmtuKwKbRah3AX0laQ7YbNbRQc1re1OMX55kddWqQ/GpDiHFZDWj39OXA
         T3f76+yFZuET3UiH50vZs6kkocMK6rQket1gNxmUgBl4uoO20dblgdMB6BRIusTyDErr
         GmQoeiXbrpU6I9JxF934aDeS12m7wEugiUA1KyPbQC7qGCJ9ivpTnkF9DIBlbc2pitQh
         LB84nRjfPy4R614mwQ2wgUpw9/GVyNOb+W8sIsvU2Uxjfg6PF9mbvnGE/IBTXVH438KF
         I+85zqF8UBKu56vJ89YU2xAucnIgNHDX5oBtfBBJ/881jWlOLpn/UA2mQ+HBE0psR9qu
         g8yQ==
X-Gm-Message-State: AOJu0YzcGdAEff06yYDzMmeszJ0tPtyXIU6kz2rRS2kUIHyyDK+RLiNk
	6zK0Y8nT3sLmmNJSovmPymD9F0yvA3n+HUmPjl+9MnNAe2eR+I1AdkKHjMRLrBsmAg3zCsp3tQ/
	Zl5nJJ/H6fPMFC6gylDqgsSI/rB5n9DPiZg9x62FLhq0JNy6ihH9vNotUzMoCNop/EiyUGFzMGe
	vcA9cBAntMMKN/l/B3vXdjlnQGA0btVazmxJDHXaneo0AUweC0
X-Gm-Gg: ASbGncvwxvFVjcAgV2APJHEKV8+v97esW/s1LfHj0M4Dxe7ouJfNsEb7y5BaFFyk16A
	jcw4bOaOkAwRpfqPaeQK4JFbze6lK+b7znlZ8nB21LKUfM3CR1ugofYVSJkcvgcG2/dAPygqyCy
	hGTbM7DUeSOUEgeKJsYz6J2pQ/dzjl05SgMxA=
X-Received: by 2002:a17:907:7ea6:b0:ae0:b7f6:9d76 with SMTP id a640c23a62f3a-ae3aa343839mr512725166b.28.1751388131581;
        Tue, 01 Jul 2025 09:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7ahuDZJ0hseQj1gt954NIxdhtEGQDH5Fz4VFqVfnIlENRCGL2S9hGGBgO6x8A4Gxv0citTs5mUn7lFMlZsJc=
X-Received: by 2002:a17:907:7ea6:b0:ae0:b7f6:9d76 with SMTP id
 a640c23a62f3a-ae3aa343839mr512722466b.28.1751388131125; Tue, 01 Jul 2025
 09:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530200305.85319-2-jsavitz@redhat.com> <CAL1p7m53yJ-dpg6L2QVQM7bshWYXAxOJjrVGdTG8cDMEhNogyA@mail.gmail.com>
 <CAL1p7m4bK1LA6Atc4P0h_wC1Kb47Vzb93C8tmJtMiEBDLy6yzA@mail.gmail.com>
In-Reply-To: <CAL1p7m4bK1LA6Atc4P0h_wC1Kb47Vzb93C8tmJtMiEBDLy6yzA@mail.gmail.com>
From: Joel Savitz <jsavitz@redhat.com>
Date: Tue, 1 Jul 2025 12:41:54 -0400
X-Gm-Features: Ac12FXxFhxG4MCSSRZZALRtZQeKbfMMuWT5AGEznjBPbW34aRaCM4ExJFaWdOCs
Message-ID: <CAL1p7m4PzOvrAT70RVWR-cQ48-h2MZ_nms-SE_GsZ_GLujZXnQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] kernel/nsproxy: Minor nsproxy code simplification
To: linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:49=E2=80=AFPM Joel Savitz <jsavitz@redhat.com> wr=
ote:
>
> On Mon, Jun 9, 2025 at 10:23=E2=80=AFAM Joel Savitz <jsavitz@redhat.com> =
wrote:
> >
> > On Fri, May 30, 2025 at 4:03=E2=80=AFPM Joel Savitz <jsavitz@redhat.com=
> wrote:
> > >
> > > The first patch removes an unnecessary guard by the same logic as
> > > commit 5caa2d89b7f1 ("kernel/nsproxy: remove unnecessary guards").
> > >
> > > The second patch fixes the total ordering of resource acquisition
> > > in validate_nsset().
> > >
> > > The third patch implements usage of the cleanup helper added by commi=
t
> > > d057c108155a ("nsproxy: add a cleanup helper for nsproxy").
> > >
> > > Joel Savitz (3):
> > >   kernel/nsproxy: remove unnecessary guard in validate_nsset()
> > >   kernel/nsproxy: fix put_*() call ordering in validate_nsset()
> > >   kernel/nsproxy: utilize cleanup helper for nsproxy references
> > >
> > >  kernel/nsproxy.c | 12 +++---------
> > >  1 file changed, 3 insertions(+), 9 deletions(-)
> > >
> > > --
> > > 2.45.2
> > >
> >
> > ping
>
> ping 2

ping 3

