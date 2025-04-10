Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E181E991C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307313; cv=none; b=IjyMu6UgH1Y3l8LsgTuTuA50tcro+uH5B6s6Sd2bwmdCK0GpW8KUWA+eWRAojxKZMyYpGhd/pIfrIY71yboSJYrOWiE5pcElyTEV2Frr9DiWiVHntSSjaIptwuRDWPja4XS8N698mjQr6ceOv3BjPFsIe1T7Sd/NIXERVBD0Bu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307313; c=relaxed/simple;
	bh=9kFVBt0xmNJ1O3N7xNDOXpsY2sp5HC0wOX9IKhNyfoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGGFMTWLAt3veqRQmXnhFyYUpHkeRxR4RyLi8e33TV41ceH0EVtsdAv0CkUOhfHnXT9dJNfcUSBxkRtc1d4O1wctYlqm+ZOOcX9gaKdHapM3nubG1ANRmUoEyM3vpG7gODpxYnBH2KiY+U5fC7kEC0I93HDv9b4yizsKZ2+MFXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aI58SX/i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aI58SX/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744307310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OqvPNxA7jww3BXXOwYN/gaN85wuxZPgfj7tUlo1Pygo=;
	b=aI58SX/idbEzEvUEiv8X/hBd0ncnShY0jawuPsFO/aIiR+b7XVOv+JlisFmt6ADFiWuytZ
	WIOFqiJjFEWyuQPIycwb2azDFHwGR59R5koWWgLt58jH4TzEejxs0FEYN1aVHauSFUHNnn
	qdaLTgcF6MAC8XQvVfxyjQKG95FrjjY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-2vUhezOZOlifvZGwm9m_ZQ-1; Thu, 10 Apr 2025 13:48:29 -0400
X-MC-Unique: 2vUhezOZOlifvZGwm9m_ZQ-1
X-Mimecast-MFC-AGG-ID: 2vUhezOZOlifvZGwm9m_ZQ_1744307308
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2241ae15dcbso13148255ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744307307; x=1744912107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqvPNxA7jww3BXXOwYN/gaN85wuxZPgfj7tUlo1Pygo=;
        b=BpGaisvhWH/r7RtP1qu/+QkTl03AaTjdbocTkQpp2WLojZlJuZKhTNiHgNAVkNE4pD
         eJ4UjypRXHHJZZFAUc6ycBTrgCOEErLyaBGJPFwfl/L/1EGgmOfl0Kw0jLQnJ2aYDNtR
         Ovg2YnZ47GWJ7BeKAN8zpZtzu84SfFcjCpQIw+VWX/jwaG40vFz6jv5jlW0JXnKRoGfM
         8RLsncBx1oxZPGd3YgbUERfT5j4NbC138z7mnCMG6Ph/8ggMGZCzMkIOTnB67zUmVC9d
         RUQh1Fi36F35ufX1nLsKbr7bc5GHzHCto+INXhG90pxfqFxuf2d83/V3/LeD+n0mQQlH
         xABw==
X-Forwarded-Encrypted: i=1; AJvYcCUYHIJyLUcpQTVuxBcNjyEiD7wV+ha1w3DZErxs2Hb431ckARgtxyiNnorzrEQ+Jbp82u1hOBOLfffr0yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YybFV8q6YGg75lsToc1YBdg/JvQNupmbCZoMfhkyjsorzFvi2/c
	OgZek2oOpeS9YYQnWNRDcDKh9RjHK7tL/ga4bSRmOcnce4aj/ZAHENdWHfkpaIdJ8ZKTp4sT96t
	TN8AnxNfT9D/9L1fw+P1md9HGU8OIQ2q41tel0aSUHT/cpe3VrloEp9nbQVcR0VajyNXuGxhDyT
	CtgZRNRlWfpTdboZjllPCSx1YavmSUUTz7cjwTFxOi4FKDT30=
X-Gm-Gg: ASbGnctJHL4Syp2qgGQxtFfQErMJl3DzZ9Rypxg2dq3/zZxTbUbh/D9JsP/N6wdJLOS
	tY9A+5KdDhF6K/qnPIvWbhLkuKcdhWM1+pzbjTYvMIRuEf6WKSsMIQqW7ZLsEHhiF2XQ=
X-Received: by 2002:a17:902:dac9:b0:224:1579:5e91 with SMTP id d9443c01a7336-22b42c5ac2amr51880075ad.47.1744307306737;
        Thu, 10 Apr 2025 10:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUo1DbI1h9w9OLlDnjq5RZSX9CGytc55kczInpUMCnGZepk9T1FYX3YU4pw1A+DuQV82ASCx1d3eK2A6PEVwk=
X-Received: by 2002:a17:902:dac9:b0:224:1579:5e91 with SMTP id
 d9443c01a7336-22b42c5ac2amr51879845ad.47.1744307306483; Thu, 10 Apr 2025
 10:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407182104.716631-1-agruenba@redhat.com> <20250407182104.716631-3-agruenba@redhat.com>
 <Z_eGvBHssVtGKpty@infradead.org>
In-Reply-To: <Z_eGvBHssVtGKpty@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 10 Apr 2025 19:48:14 +0200
X-Gm-Features: ATxdqUF2qSG62wdzI_CXx71qpQw7c7dGZziC1q7bbQkSEqifIFryfqrjJnWzITo
Message-ID: <CAHc6FU6NHxG-Tn+5tn2zy3QJFVruOM6tG7DsDi1sF+vDw4Xr_g@mail.gmail.com>
Subject: Re: [RFC 2/2] writeback: Fix false warning in inode_to_wb()
To: Christoph Hellwig <hch@infradead.org>
Cc: Jan Kara <jack@suse.cz>, cgroups@vger.kernel.org, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Rafael Aquini <aquini@redhat.com>, 
	gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 10:52=E2=80=AFAM Christoph Hellwig <hch@infradead.o=
rg> wrote:
> On Mon, Apr 07, 2025 at 08:21:02PM +0200, Andreas Gruenbacher wrote:
> > -static inline struct bdi_writeback *inode_to_wb(const struct inode *in=
ode)
> > +static inline struct bdi_writeback *inode_to_wb(struct inode *inode)
> >  {
> >  #ifdef CONFIG_LOCKDEP
> >       WARN_ON_ONCE(debug_locks &&
> > +                  inode_cgwb_enabled(inode) &&
> >                    (!lockdep_is_held(&inode->i_lock) &&
> >                     !lockdep_is_held(&inode->i_mapping->i_pages.xa_lock=
) &&
> >                     !lockdep_is_held(&inode->i_wb->list_lock)));
> > --
>
> This means that even on cgroup aware file systems we now only get
> the locking validation if cgroups are actually enabled for the file
> system instance and thus hugely reducing coverage, which is rather
> unfortunate.

Right. Is checking for (inode->i_sb->s_iflags & SB_I_CGROUPWB) instead okay=
?

Thanks,
Andreas

