Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F732571B4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352937; cv=none; b=i54f5McB4wUGivd2tojvTfAPIP0blyLrzNjToGt462QbBnYYdvkqtDZAVikczJyzki67+cNYKnWme2VKRUfopYdWS0LP4AKamIJkO+45MkHRjmD+ak4gOA+5qTzKYwELll/waZyJgtUXXbcvkgzM/VvJ6elgrQzkXCy0lPUyyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352937; c=relaxed/simple;
	bh=csrCPfkr2yPaVIsHn8CbIDs2IqC/NPo8HB3iFxnD6wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nObAQce6Uquqec1yV78l5NxfMtsy0IE4dWR6MvyZalo1q64K2oU3vUH/PS++2/YN0SI4VwoFzn4YkDiuyOwtLCfs037zTlyi4j3ChMNNYM/UisYWwSeudxAK+YmCu2BcLnQw3ZB0rz38mR5SmPROosSfyYJKzHocPYtzAZgvDrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NOPhhuNE; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NOPhhuNE"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476f4e9cf92so21541921cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748352934; x=1748957734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEZyB1x1F+5CkjV/pim3lCXpXrVwiFrJ/FhH6JZPB9I=;
        b=NOPhhuNEMz85BpdPgoU2K5k0n67/jTiQToNGU6pJCHJNp1sHePRvs7Sk+bDTkIIwZ9
         ArPjLDBoxk5fPbF3D2779VWEKotkKG+GfKXQmVkPhugrPguqBJO/YtTvApH1T0dAyEsU
         ktvIOFWc1CmAfX/9pSdNMDrZvv8rQOOZRadXS4nRN2rPdZqvSVFGKU3N2b6+JCtz4s68
         3pANSLrcyP81I+RS/dQysnlOMJLSqeACh3Jt9je4/NfPMKJpfZHIEGxSUgayw38FwrT5
         Ew8Qoi1G71Hc3BZmPeNiWl/fF7J/Pl1BmXeZbD38abMuOpt5R/GS45tZRMS5syzd+ZQ8
         +eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352934; x=1748957734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEZyB1x1F+5CkjV/pim3lCXpXrVwiFrJ/FhH6JZPB9I=;
        b=lBW55Io0lLUJ3qLWgUAl9yIMfpU0F/baE1zefKQc8u3kySFcUmIHlddaccRyvskS+L
         wwWyAftF710HELtzvfp0wMc1OTNgif5SDaMOdRtBeXaYbCuNkP2i+w/WHTRDSaPx1q2A
         5734ykJbitXjt/pu7cZyP/gwf3hsa4nl8N8Or3dXkVVyr0QeadPoXNV83krh1f2CFPFN
         VAJBd9r1ZTTzPCJkL/AG7KwE/TgHtwcaf/Cm6KCpJvNchUuw2fFQ1GJGu+Mnib4Lw/kL
         J7LiGo3ncbehTGgH1KDA6ubXdawA7RPXbH5q95MEpRv3hOj0j3w/S2RJjjHMBpaqh3vG
         OR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkhI7mzcZ/4TEodNKIF7s3KbkjO4wqeBPMHhe6Pt2FFjlpvve3pQ9fEYh9UzAzivV2nGtxOfKmB0NuPNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwIAYIyQUdPvyTOIApa8tAGRDbsrpYda70twVNQOpCFihJM0j
	BGyQjTLubTu+uvojsrleRnJ0p1ip9DHX/hKRCmXujw4I+ukJqm1IhgVRHBr2FeKrME23/Fr0P7s
	y5/FoTKgEa+QNus9qhb0b64zI+9Lbyw6mXTh+MD8s
X-Gm-Gg: ASbGncs6vTN00hTR9sVHv1u32LoAJNxF/K3McfobQhTjOeQCXtzWh98ebr+TLYINsPO
	mZSXiaZf2k4C+t9C574g2mShwxkZpjE+LRp9Z2POj4LxnHRrrWTbIJmHZ4ZKp/HooOgrgmmbC8Z
	StJUW037frBWCaOO9uQPBMJteJ4wFGJCZmCg0zQYsIrTr4
X-Google-Smtp-Source: AGHT+IH8RlW6fXMU8jqYWLoBXY1sSMdePhK4LTMkNh/Wwj5ogOouIbtFkZUDwPHlAhRg8OJT0lxhqcW9paNA2rzLz9A=
X-Received: by 2002:a05:622a:4c83:b0:477:5d31:9c3f with SMTP id
 d75a77b69052e-49f47b04961mr211606171cf.42.1748352933955; Tue, 27 May 2025
 06:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org> <20250527-reftrack-dbgfs-v10-8-dc55f7705691@kernel.org>
In-Reply-To: <20250527-reftrack-dbgfs-v10-8-dc55f7705691@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 27 May 2025 06:35:23 -0700
X-Gm-Features: AX0GCFuUcYxaQRTirO6utZCvvEE-Lz0VFl_jzNkZ3QII3s7fn37-Kf5B5Nl9CTI
Message-ID: <CANn89i+PFJguSKfbiX1nWSvPA2S8O-pb7HxVT4+zkjMdD3meqg@mail.gmail.com>
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

On Tue, May 27, 2025 at 4:34=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> After assigning the inode number to the namespace, use it to create a
> unique name for each netns refcount tracker with the ns.inum and
> net_cookie values in it, and register a symlink to the debugfs file for
> it.
>
> init_net is registered before the ref_tracker dir is created, so add a
> late_initcall() to register its files and symlinks.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  net/core/net_namespace.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> index 8708eb975295ffb78de35fcf4abef7cc281f5a51..39b01af90d240df48827e5c31=
59c3e2253e0a44d 100644
> --- a/net/core/net_namespace.c
> +++ b/net/core/net_namespace.c
> @@ -791,12 +791,40 @@ struct net *get_net_ns_by_pid(pid_t pid)
>  }
>  EXPORT_SYMBOL_GPL(get_net_ns_by_pid);
>
> +#ifdef CONFIG_NET_NS_REFCNT_TRACKER
> +static void net_ns_net_debugfs(struct net *net)
> +{
> +       ref_tracker_dir_symlink(&net->refcnt_tracker, "netns--%lx-%u-refc=
nt",
> +                               net->net_cookie, net->ns.inum);

With proper annotations, you should be able to catch format error as in:

warning: format =E2=80=98%lx=E2=80=99 expects argument of type =E2=80=98lon=
g unsigned int=E2=80=99,
but argument x has type =E2=80=98u64=E2=80=99 {aka =E2=80=98long long unsig=
ned int=E2=80=99}
[-Wformat=3D]
