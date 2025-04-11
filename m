Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3342367D1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381637; cv=none; b=NvnCc4xPiZ2R2VnkubRFzt/QVHML0H+P2GfCOpVsKRDOe0DJfk5fSUs9XOUOS/ekJnC9Lr5VgITxxV5KIC2sn4wiORprpcVzIMfgrfNPTAjmsiUl+GaCuU2E6p8nl7QhIFDjHN71PUc+WB34PIeGTMtDmBchl50STQ9RydwCxZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381637; c=relaxed/simple;
	bh=0sSLM8Gl1SSfcycmM/UtlknnQ4e+BUVsux/kF0SISqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MclLhhwK0pbraSs8G7XppdwSC4krn6AmKXhdFboIwsL5z9oeqNtJD1H7OmqmUbUIuOFgclAvzETKVLzfjl0+eo26uLuQ0+/yQZnTwRzv5iqOxgKgc/ZUYMOoqchWKhuWzD9lGn90cFeu1XcmE3EfzNt2un0top6HhDVYFWX1Qs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eabWNFMd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eabWNFMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744381634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GP8/HtUHIEVDUJEVLPkaBWTUMFy21m2j5eMBYPZlbWY=;
	b=eabWNFMdwqiMKt92TIsvdOfWTwoTQtHcKO8v9dxovFp79sZOQONkC1rtTOL6WFVzfY5iVS
	nSjpccYrcrppCtqI+RQ95TMSCJU51aSbXK5KC9cMjm8Ea/Ed/FJRdCRMnPsU0+oJW2omvj
	5DvMoqpjhUg6b4YUGw5Zmpz1nmG761c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-9Rg67iVsNPSjQAxWbNzimw-1; Fri, 11 Apr 2025 10:20:44 -0400
X-MC-Unique: 9Rg67iVsNPSjQAxWbNzimw-1
X-Mimecast-MFC-AGG-ID: 9Rg67iVsNPSjQAxWbNzimw_1744381244
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so595542085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381244; x=1744986044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP8/HtUHIEVDUJEVLPkaBWTUMFy21m2j5eMBYPZlbWY=;
        b=u6wvTRKx+2Csr2eks//m4WhTeoItjLHjfRwIrl+dhEBXcPvlHo2s2n3EyJV+XCs88d
         5uXEYdJS4WbWHsn6sRnhE8tW0rEzz2isP4iSrIiK0sDOxNkjUa7hdjnPVOA8cfmOX+pM
         g9T+cmKbC1GneTTtYmZ+DB16hazjWGHZwctEQQd6ryg+7k7qf0U6LTYBxGZSXnZRvDLk
         8C2/EUk6XufgLLGif1fFmFRkHG7SDlgq1E0Mql89a28E9RLj17oT+0usVTPgwqKeY1dv
         adm/f97DTGHEk1tZLfNLyGAdWQLsqyAfubmYbPrLi3fxOg3B5ZkuRBfkPGwSMwqzKZ4f
         61xA==
X-Forwarded-Encrypted: i=1; AJvYcCU5mZZO4fsSaWD7yW8rAsaR2AXTUxkAsQ2twAx1sxCaD4fHry6RdLbTFjxnh3PiN1haKWbiwVX44qKBDzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznuG8/m8toiRObW3lmW1kpgO2Mgn1g2pJYXV9cX58115sWrc0p
	ALScBmDzJqy+FrD2VDFeB7djrbw26d9MW/lHgHqm2vyWbFMN44kkIrfLIDuxMRW47YyEPvTAdmS
	d1VEqFGmaXGe7XY+0XbYiA6naDdVx3t4roIEx1VQ0eHgLZ8FEDImsPkFJh1shMxU2AZu0+gCEUN
	qu4OM9l0M/vGYbjFWAlhikI3eF6zg8EgeLe/C+
X-Gm-Gg: ASbGncuXEeMCB20QzRNx7NronCjvElpDW/agPGiJTmLERin9v3CplL2GSYpfpOuZSUD
	fxwcJDkDyeZFdztp5wjh0kANLqWarE696h13l4k2in8dyICSCDZro5nn4pDkbI2Wz8Gmo
X-Received: by 2002:a05:620a:4555:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7c7af0e4069mr446713985a.34.1744381244168;
        Fri, 11 Apr 2025 07:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE87/SkmJqkCTFo3ondJGkFj0c7IjvtrQht+ufW53KKYYwMMEMEB+bhas8EXXkb6Qb8MJd6901LxjVSU8qgMcU=
X-Received: by 2002:a05:620a:4555:b0:7c3:d5a4:3df3 with SMTP id
 af79cd13be357-7c7af0e4069mr446710485a.34.1744381243833; Fri, 11 Apr 2025
 07:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cad2f042b886bf0ced3d8e3aff120ec5e0125d61.1744297468.git.jstancek@redhat.com>
 <20250411-umlegen-herauf-508fe182fffa@brauner>
In-Reply-To: <20250411-umlegen-herauf-508fe182fffa@brauner>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 11 Apr 2025 16:20:27 +0200
X-Gm-Features: ATxdqUFDVkes1gAHo_3pSyiyrwIAhhZcJcFcsj7AiggBUI7bmKdbRteKcHOEm_c
Message-ID: <CAASaF6yT=YbDfnwczWSEiEkn+evkWCPF0_MmO3OKCEmuFOG32w@mail.gmail.com>
Subject: Re: [PATCH] fs: use namespace_{lock,unlock} in dissolve_on_fput()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 4:09=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, Apr 10, 2025 at 05:05:42PM +0200, Jan Stancek wrote:
> > In commit b73ec10a4587 ("fs: add fastpath for dissolve_on_fput()"),
> > the namespace_{lock,unlock} has been replaced with scoped_guard
> > using the namespace_sem. This however now also skips processing of
> > 'unmounted' list in namespace_unlock(), and mount is not (immediately)
> > cleaned up.
>
> Thank you for spotting and fixing this! My bad.
>
> > diff --git a/fs/namespace.c b/fs/namespace.c
> > index 14935a0500a2..ee1fdb3baee0 100644
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c
> > @@ -1830,6 +1830,8 @@ static inline void namespace_lock(void)
> >       down_write(&namespace_sem);
> >  }
> >
> > +DEFINE_GUARD(namespace_locked, struct rw_semaphore *, namespace_lock()=
, namespace_unlock())
>
> I'll call that namespace_lock instead if you don't mind.

I don't mind - I used "locked" because it's easier to grep for, when
it has distinct name.

Regards,
Jan

