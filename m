Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5BD270572
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353055; cv=none; b=NZF79FPBeXxb4TQXUl1Wp2NkA0j1Ggs1yfx+/nquy87c/SojjVLSbknlBk+Ntn/e8scv1+WUu7FssXYJsthhiPszJ/OvA6xX4mEpmROFPBAI5q/ArazknkVsAwoNMytgwn0ImExhKqmiwDDRtllGU5zw9/QiXoNkFhtyhsaxzs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353055; c=relaxed/simple;
	bh=ifvf430JPDbe1qF9aTpOKg1CLqvI0uQ5QKpQwKYGJew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+/z4JNqkzWFokl7rg9RC/Fka1yiBeTF67CJzifer8NE8iDZPHPtOIluC48b4frTogthN35b1G507ojdF5uqNQ3TqatoT2vtL4GapfZrUo/WKtgw0tm7Vg7QDpN0l7m/lj7aYqtL0c6rpLKJhU776TBdaLZn0jag6JW9pMbdER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kkeUF6r5; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kkeUF6r5"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4774ce422easo28501851cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748353052; x=1748957852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DfXclIybJgrhp7Ns7X38FYQwzivRLt7u8VY7d1k9FQ=;
        b=kkeUF6r56r1zP9RpL3Q/2ownEbl4UPJupGILb4DBSKeLJCtI4IXpGzujBGEJ3vGVB6
         UBV3rdhvZriBrbJUSvjGrPzrc6OoM3EIHphMd7MSX/MoLPMGMnlto0O3KoybSFElNSHL
         WRgx7s2+PfPHJDBPQ2q1CYHvO9TtCCcX98Q00+RaGQwXrlQP70a7dPFHO2HpQAc5hdwS
         6MZAyN+QQsGY/RPZjbA90RMxT6mtfgm76GOgXkeTDZLun+L2bvrNidlIKtiIctUOD8fU
         9h1Wi3Zb0CG7gPCPCza4EGssgCEaibo0qTkthHNbP3Zcat9T40XuaTiBiJRWPrrVcik4
         /Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353052; x=1748957852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DfXclIybJgrhp7Ns7X38FYQwzivRLt7u8VY7d1k9FQ=;
        b=cCubbPwRl5jOb2DLz3iMOYAga7l6TPVawVrW0nO5UOz8WZhfN5n/c2Wi9tpdHJdbVN
         d2yVM2eB8rXaTnI7sqVVBeHSETqeChXWBOG8Fl4orFMS4MBpL0WF8I2KLIe88Stc5f/F
         cDZnTM58sekeN5zbmhrhMmDh+ttjjyBoBByI3/iC8aTysynlKCxc9BQS28RdoIXqrw06
         csSDdu4/toS7VJyeECpymnh+nxdTnGUlFYfx32PnafHSn0C81teOqKMCDWxtl8VHVbaw
         h6ubuz0b1vC/KdRvkFG+Eu8kdea7Y+kMLvw5qhgzE1R5peiQlHUM/RCtJ43/WH5V25vo
         EYSg==
X-Forwarded-Encrypted: i=1; AJvYcCWuEoUUbV5dFwE7dKPOFHh1S5xrd90U8AZYCknsPmJ5eC8oDt0LsH8CJ/1tceBURFZgfMat4aZas+U9vPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK/zd5iv1My1RwGf9QuViO0XNoFAsH+Qzb8PQshk0PkAf277eE
	JPOoSgI74x14XQF5+7D5L97uSqPr9XNLZUQaKLrakjLtThwa6NazQjscVpYhPE9VyO/vdujPFr+
	dXqVLMus5buraAE9qaC+9WjgHdpxzdX1OmQQQoZbQ
X-Gm-Gg: ASbGncsRf3gf/Iumbz3lDy3tdQh0gJ4++qJSJ0ELFJCQSOG5XGFQK0a+hPug0Rp4sUk
	KFUOVR8Uvmtk/6dySfTKYTT7gBjQQL+K/0ZzPt5UCil3JrI9M6dkKP8MHh2Sq4M4Hl5s3HMQ9JT
	2MEfE57xH9Ggh/C11Pvx/kFyFqg+WT+lZrkb6HvkVjI/JS
X-Google-Smtp-Source: AGHT+IE7m4Cq3bQJjOeyJAia21VMlshs95gl112B78zB/spj93HG+Zo7WNUPRTmVelhviwuo19ZaiquZWB2TPUAPtQk=
X-Received: by 2002:a05:622a:5512:b0:476:7eca:57e7 with SMTP id
 d75a77b69052e-49f46d31350mr213132041cf.26.1748353052042; Tue, 27 May 2025
 06:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org>
 <20250527-reftrack-dbgfs-v10-8-dc55f7705691@kernel.org> <CANn89i+PFJguSKfbiX1nWSvPA2S8O-pb7HxVT4+zkjMdD3meqg@mail.gmail.com>
In-Reply-To: <CANn89i+PFJguSKfbiX1nWSvPA2S8O-pb7HxVT4+zkjMdD3meqg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 27 May 2025 06:37:21 -0700
X-Gm-Features: AX0GCFsrSMIV6ani5r800MRwO3KbNjXkHyjYRDMotIUPivEBkfDrOZ2V5akOvLk
Message-ID: <CANn89i+qv8SsgdDv9PUG=Yuw1KMUyZC=_KqWdYOBL4p3nmcd1g@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] net: add symlinks to ref_tracker_dir for netns
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 6:35=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Tue, May 27, 2025 at 4:34=E2=80=AFAM Jeff Layton <jlayton@kernel.org> =
wrote:
> >
> > After assigning the inode number to the namespace, use it to create a
> > unique name for each netns refcount tracker with the ns.inum and
> > net_cookie values in it, and register a symlink to the debugfs file for
> > it.
> >
> > init_net is registered before the ref_tracker dir is created, so add a
> > late_initcall() to register its files and symlinks.
> >
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  net/core/net_namespace.c | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> > index 8708eb975295ffb78de35fcf4abef7cc281f5a51..39b01af90d240df48827e5c=
3159c3e2253e0a44d 100644
> > --- a/net/core/net_namespace.c
> > +++ b/net/core/net_namespace.c
> > @@ -791,12 +791,40 @@ struct net *get_net_ns_by_pid(pid_t pid)
> >  }
> >  EXPORT_SYMBOL_GPL(get_net_ns_by_pid);
> >
> > +#ifdef CONFIG_NET_NS_REFCNT_TRACKER
> > +static void net_ns_net_debugfs(struct net *net)
> > +{
> > +       ref_tracker_dir_symlink(&net->refcnt_tracker, "netns--%lx-%u-re=
fcnt",
> > +                               net->net_cookie, net->ns.inum);
>
> With proper annotations, you should be able to catch format error as in:
>
> warning: format =E2=80=98%lx=E2=80=99 expects argument of type =E2=80=98l=
ong unsigned int=E2=80=99,
> but argument x has type =E2=80=98u64=E2=80=99 {aka =E2=80=98long long uns=
igned int=E2=80=99}
> [-Wformat=3D]

Reference:

include/linux/compiler_attributes.h:158:#define __printf(a, b)
         __attribute__((__format__(printf, a, b)))
