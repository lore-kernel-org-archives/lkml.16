Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93642AF10
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748323725; cv=none; b=BI/X13blddlaKjWQGRKbDxM5Za7B+dEABsEpfbQsSB2+ZnFj+iZ2fOr9uMOC/gYxuca9WnJ50pY9af2yRJiiJxhVlGVGX1u44NTGOQZlmnVPvg4TcXzms7nyPYA8XI7vwy9a49qx51YqEcU+n3ehfKL75ASkSyHQFS0oq2zT16Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748323725; c=relaxed/simple;
	bh=1Sib9gBMl8hnWPq2xz0C25YBREla2zAHNdN1LcPwDVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKg1aHVWSJA7kVwN4BRwAjaSWNbXJ5rE7VKuZ+JhG3gNOIFO0nDJ88hr2SzBZ7cub0LBVP/AJKh88cXUAyj6yJL1O1bR+dxLVwVgyZIFZtv+RG0joR474Y2hONKmUbQJPerYZKtUm6Ya3bnBPCu0kBV6tfZAtx3c2kAFq8maYwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z5oE8IYb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z5oE8IYb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234488c2ea6so17088645ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748323723; x=1748928523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aMPUq7D6PukAbWgN0eC3EH73KmEOPEeZrHNJC7dBZq8=;
        b=Z5oE8IYbwTHYNBQWEXkZnSghcLm0bxUSAUl/Wdm3vzQmOtC98jMd06Hsqu3hAyzkVk
         4h0qzi1jUwflICqVvllKisH5TaVS2G8rfpgsGKvBWTBc2bpDUAtcKbrOeYR72BLw5HpU
         LcCb/Vzj/RpaY0M5vVtGPa1jnsAm7rF6LW3pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748323723; x=1748928523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMPUq7D6PukAbWgN0eC3EH73KmEOPEeZrHNJC7dBZq8=;
        b=CY9kF9j80NlY3eGCUYv1r25nS7vM1PRL62ISbrnT4tZ/gskeu9boiPtsoKNxKFAgTr
         eMueB3QEQyQ7tDU93l5NPeyJbbScxA0IAwHyS17gsD+PgmrwZ3LajCO2jOoIJUrjiC77
         VH+qfRAPue1GV/XGdg8K8bPUVFgqjos57Tiif/yjFdrPK3MjRaYQdLA6maN1fnzDgQBS
         d+wFqiPWymybALR4PvO/G7lNZar90TjZXUbd8nmHomcmb+S3iL1g9dFODsx6R4BT0fRF
         su9ijKCIEQKyxbmDPKRfwDOYkdlEHi6PpknbjKMAgKryCLoq0YBJpk/Eitvu83ssNS70
         ND2A==
X-Forwarded-Encrypted: i=1; AJvYcCUChXYSaMIONPi9jt3qbBruFSmN2A7tZZpK+F2DyUAR0b3Qgx9CmcYGqcRT3yzrys817nW4hpr2Z0pAoSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7X+B8FIS9hhoLM7prtnVqYN/U5U0Oq7jmVYxtLP7g06nztKYR
	AmNidAgxDAsLUU1i2GhJgGaMNDNNj4RCzKO9M3Wuzkoo5qixRpXkLUEyL9UtFUNrxcwbMYizve6
	48FA=
X-Gm-Gg: ASbGncstDSFFMt4AwNSMhoegJuALuej5RW9Dn8PuWBOZzezWiZknTdAAKCwxZH83URJ
	Tb7kZDT00393QDcZiMH7ZJ3mHpshw4iMMrD9KOTPe3w74M1eA5kmoqA3UngDUSwP+uge7o7igce
	R4JciPXV7zJEIGZ6dKnKuiFS3xko/T23zyzlPkUN0OSEyyTrqRKHbuFYCaWgE+JSFvRRYUzB8hS
	5DQGXOg7IECcErcaqm9Q1ayuZNfwkKnw7unzazEL96zZ1kzksxpb8p/hN13+9nsoDeyZ1xdWcf/
	sSxeogCukSxl7zNpMefwEYopOHLwZtmPtWlNH/sXUmH1+2UY1XK3i8g=
X-Google-Smtp-Source: AGHT+IEzAcpd5IAd/5qHpi0TBrWgDvqlGt9jD8mtQVODpolQ+2SSc4qm1HBo7vCFZixFRyqqMGV4pw==
X-Received: by 2002:a17:903:4296:b0:234:a139:11fa with SMTP id d9443c01a7336-234a139147dmr5707465ad.3.1748323723167;
        Mon, 26 May 2025 22:28:43 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c29c:b6db:d3d9:3acf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23444765fe7sm35561665ad.0.2025.05.26.22.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:28:42 -0700 (PDT)
Date: Tue, 27 May 2025 14:28:39 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Amir Goldstein <amir73il@gmail.com>, Matthew Bobrowski <repnop@google.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] fanotify: wake-up all waiters on release
Message-ID: <yo37kh4b27m2v5uddoorxmuhxif5n56hrc5h7ndl5btghiovdj@lsriah45m5ua>
References: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
 <20250520123544.4087208-1-senozhatsky@chromium.org>
 <bsji6w5ytunjt5vlgj6t53rrksqc7lp5fukwi2sbettzuzvnmg@fna73sxftrak>
 <ccdghhd5ldpqc3nps5dur5ceqa2dgbteux2y6qddvlfuq3ar4g@m42fp4q5ne7n>
 <xlbmnncnw6swdtf74nlbqkn57sxpt5f3bylpvhezdwgavx5h2r@boz7f5kg3x2q>
 <yo2mrodmg32xw3v3pezwreqtncamn2kvr5feae6jlzxajxzf6s@dclplmsehqct>
 <pehvvmy3vzimalic3isygd4d66j6tb6cnosoiu6xkgfjy3p3up@ikj4bhpmx4yt>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pehvvmy3vzimalic3isygd4d66j6tb6cnosoiu6xkgfjy3p3up@ikj4bhpmx4yt>

On (25/05/26 18:47), Jan Kara wrote:
> > Another silly question: what decrements group->user_waits in case of
> > that race-condition?
> > 
> > ---
> > 
> > diff --git a/fs/notify/fanotify/fanotify.c b/fs/notify/fanotify/fanotify.c
> > index 9dac7f6e72d2b..38b977fe37a71 100644
> > --- a/fs/notify/fanotify/fanotify.c
> > +++ b/fs/notify/fanotify/fanotify.c
> > @@ -945,8 +945,10 @@ static int fanotify_handle_event(struct fsnotify_group *group, u32 mask,
> >         if (FAN_GROUP_FLAG(group, FANOTIFY_FID_BITS)) {
> >                 fsid = fanotify_get_fsid(iter_info);
> >                 /* Racing with mark destruction or creation? */
> > -               if (!fsid.val[0] && !fsid.val[1])
> > -                       return 0;
> > +               if (!fsid.val[0] && !fsid.val[1]) {
> > +                       ret = 0;
> > +                       goto finish;
> > +               }
> >         }
> 
> This code is not present in current upstream kernel. This seems to have
> been inadvertedly fixed by commit 30ad1938326b ("fanotify: allow "weak" fsid
> when watching a single filesystem") which you likely don't have in your
> kernel.

Oh, sweet.  Thanks for the pointers, Jan.
