Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0518C00
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751177; cv=none; b=CBIBV+9IkbFcvTHuMuqBMPZk6Ncr+XuXoBXCqBR1slkbrlEem39jLOoJzHJpsDz7AbJsuLWkbjZ+6Cvr1/AuKZQtY75GHoqhwdb44YtkmoyW4Z40z0imRIpOkSUq3/QWnKvh0NCpSb8vTUHlM03D4PfMEtKQLhA4fR2LG0s3VpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751177; c=relaxed/simple;
	bh=6NK3tnnqwOsefuOmMDNLuw610W8Lqq0WNNuq6KVcXpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqctQjjTiPWbIZmcmKkH3fiX+RI1xiVYLuaP+OtGO1eyC9lxOJyOPFzhmUKs4Hi66cvIcH1775ie13HulSHjF3pLRKtRNZIGySZJb3bgjD8onj7wDULw4Iwcxhuom+EGzJmqRPMnZdEtVNBq6Ph/BKouKE26aPZw5OplBMY5tE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ASC9TwPD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ASC9TwPD"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553dceb345eso5573713e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750751173; x=1751355973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+oEhOHHx7fY+nLT2qN0EKVfCmE4uQzy+o05i8qDvec=;
        b=ASC9TwPD3bTcc8mgJLEIeH8p7PIodYWUYnnYUbYxrLlmaqbH5DH3yEXCH030vTUMxN
         JHIXhs08YbHPvnESb17/i4/MY0umqbZX9+Ce8lNkE7s9iC/ZlZB5EQlQm+qaSQQOLKoU
         L6okSLNxxvcjitYT7Km3sGpbOkGYdiSqH86TzXbmZJ3gjLYYUyKA41Ii5uiNuc6ZQg3g
         5IDo5tdivXSsLLdiYzaCTG8tfdqa5fQ+tpalIZei+0OtjIVe1VqRRpGgblCP/Ee1YpDK
         nwiLShOgqErCMwdKI3yQuJp2X1R73N2oa7kRf52UA/fUjUu/xc/oe1lMH4qG5UmnL82d
         +m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750751173; x=1751355973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+oEhOHHx7fY+nLT2qN0EKVfCmE4uQzy+o05i8qDvec=;
        b=Y5EEghT2eqeXzOIDOiWtfitosSXzIILy4UNjlKk5HUE3B2aM9rAL1YsZAds2OR0s+5
         ocJwsjEi+2XW1UxD+ZpMmM5McsZxf9yQd3Y67Vp+Uq8ynSz728ighnU9vmaNpPb0RNzf
         4k50pXro5BD/B1J0VrmEJ2mnEqpe2wXK3Af6lwXqwsMvtQqlB05Dqo6c/ArDJ+87tOCN
         aigjMDhIYzLXiz2fVPR9+urlgk3D6O2KOxVmzbS2agwIIhc7B82ptXvdRB3fygFFCk5S
         A4jFNYAzuaCHayrVkRi4CjwPmxk7vla7n29Q2XCDxLCvezJqNV0SQCUgOveUypaWWuKo
         LVqg==
X-Forwarded-Encrypted: i=1; AJvYcCVLTEqDRdhm/A6QvKwQX5z72vgptdD17xHCaHuXNgJo0MynExMA0gxB1LqPq+kkdwJTUlCBTBQV+F1Oahc=@vger.kernel.org
X-Gm-Message-State: AOJu0YydLhlQkS4eU1gpdtTwgFtDI4KPqo63zN8GFvKOr9HbgMG/cY5D
	DFyUzzR0q45cU8r0823rCItco8ltund6slcBvBUClm1sFiDI2DjSkfLKNVC3PdbNT42K0oc6LLn
	Xycol/FyD1dCcneqD7mOuQ7LBttJ2t8B1hVthD4QnFQ==
X-Gm-Gg: ASbGncu7ugs6cGQ16r6KF/dp2mg8EeWQ88EIXf85OmX3+7g+yCeBNCFyX8HN/x7qMzv
	o61zxBmM3fji++uBgeSRXzQLHzEqL4+zjK2r222iZOu0I7uSsimjzYoO0q/c1umRfq9qjKBbM9U
	YwOlK1GdSxIVtyKS6HjcKR9021KUgVHh6vXikuq3FDBw5q0/FHSeeyJ2Ht
X-Google-Smtp-Source: AGHT+IFeYUZar2HVowmkLYZSd2STiizR8hFaF4uq0hhzYEvud8WPf+pSSuVw8h7oTS5swY4X/pPSyhdh3F2k1DRwzJc=
X-Received: by 2002:a05:6512:3e04:b0:553:296b:a62 with SMTP id
 2adb3069b0e04-553e3b99018mr5116928e87.12.1750751173353; Tue, 24 Jun 2025
 00:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750234270.git.hezhongkun.hzk@bytedance.com>
 <a57jjrtddjc4wjbrrjpyhfdx475zwpuetmkibeorboo7csc7aw@foqsmf5ipr73> <bkql5n7vg7zoxxf3rwfceioenwkifw7iw4tev4jkljzkvpbrci@6uofefhkdzrx>
In-Reply-To: <bkql5n7vg7zoxxf3rwfceioenwkifw7iw4tev4jkljzkvpbrci@6uofefhkdzrx>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Tue, 24 Jun 2025 15:45:37 +0800
X-Gm-Features: Ac12FXz-Z4gUKGi6BIbRPkGEyqVXiKtjI_FOE1Vnun9s2B37mLTDpYjLgI0Qdmw
Message-ID: <CACSyD1PJ8tGbWpqyCx=dXSgZbhfCuXcKKX6_kmN17F6g+E9m2w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 0/2] Postpone memcg reclaim to
 return-to-user path
To: Jan Kara <jack@suse.cz>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, akpm@linux-foundation.org, tytso@mit.edu, 
	jack@suse.com, hannes@cmpxchg.org, mhocko@kernel.org, muchun.song@linux.dev, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 4:05=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 18-06-25 15:37:20, Shakeel Butt wrote:
> > > This is
> > > beneficial for users who perform over-max reclaim while holding multi=
ple
> > > locks or other resources (especially resources related to file system
> > > writeback). If a task needs any of these resources, it would otherwis=
e
> > > have to wait until the other task completes reclaim and releases the
> > > resources. Postponing reclaim to the return-to-user path helps avoid =
this issue.
> > >
> > > # Background
> > >
> > > We have been encountering an hungtask issue for a long time. Specific=
ally,
> > > when a task holds the jbd2 handler
> >
> > Can you explain a bit more about jbd2 handler? Is it some global shared
> > lock or a workqueue which can only run single thread at a time.
> > Basically is there a way to get the current holder/owner of jbd2 handle=
r
> > programmatically?
>
> There's a typo in the original email :). It should be "jbd2 handle". And
> that is just a reference to the currently running transaction in ext4
> filesystem. There can be always at most one running transaction in ext4
> filesystem and until the last reference is dropped it cannot commit. This
> eventually (once the transaction reaches its maximum size) blocks all the
> other modifications to the filesystem. So it is shared global resource
> that's held by the process doing reclaim.
>
> Since there can be many holders of references to the currently running
> transaction there's no easy way to iterate processes that are holding the
> references... That being said ext4 sets current->journal_info when
> acquiring a journal handle but other filesystems use this field for other
> purposes so current->journal_info being non-NULL does not mean jbd2 handl=
e
> is held.

Hi Jan,
Thanks for your feedback and explanations.

>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
