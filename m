Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A8DDA9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666467; cv=none; b=Bt6zP/drOUMhEaIJ+G2JEjFtBJrws/yf+1ESXJiGVGAYtn21RO45IrzXLm3OXk66nFBEeqEQzDESQD5bCDGf+i7pXigiucnnGv9B2fDaVVLckLZxbfvtdIPxyC2rXl6PFvfVtuGLOD13SUIli0IEVDgsR3cfe3Qof2lytqoD1sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666467; c=relaxed/simple;
	bh=fWe0XgwWCGoaCQE0Ze/b6miLO2cEZ4XihFTdgIZK7nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/ChCioKUmgp/5YLsU6wJxur903Iny0c2WmIMWUYo7TUDVBhxGAa8mcgYjjHyCcf1yKP5DZjqQr5Tmr/+Kf1R+rK0hpPDL3X4Hc1XC8BxDRda7qvPlsJxrQ59gTcA6g/aYzOCC/yCj0fSZeu02jWt3Y83mlPdeH0MZyzvg/5Mgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X6F9ZdLS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X6F9ZdLS"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so16867271fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743666463; x=1744271263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWe0XgwWCGoaCQE0Ze/b6miLO2cEZ4XihFTdgIZK7nc=;
        b=X6F9ZdLSz++G56fCsJWFb9ESdiRS5MxEFAjiR8Jmz3SAVlglfow+AChpKLBAp12La0
         8FS1HlsxOc/6iAaecjheSd76oSSGWA2qmpGPbyTCF/8K01uR4VOj3hLemjtsnL71Ckpx
         rzDBvyYHqhz4oOp1tPnYuKf+Dev8BsHwtXB9P4nF/NuMle7QTNIIMBUzbvPiXAJf/z8x
         JLAtRjc2nvyqHQXJaIsJ5CkDVWYyWTh+dmUUMVVD7zRIC8x62wat+uP+RymY7KvSACX4
         Ry+qUvOg569HAwoAqrCGIpzfIXBKTep33RCvCcvKszkdc4TlaBhlvvQ+eBRwEv+LJbvw
         anOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743666464; x=1744271264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWe0XgwWCGoaCQE0Ze/b6miLO2cEZ4XihFTdgIZK7nc=;
        b=oWi2Z2aZ1NRwSPhldpgs8Y90HFu99RLE/eNGtfxD5I0+Bp0kSLRjKQKOKv0U76l9Cs
         HgXJiPkT37LmEAMkSAyICnGEqoOLqwXOaC5VRzw8T8n6fC9aPT05TPf/eCHtEXd8GFiU
         7LBfZOfpHMwXg9ebuEuZsFRfsddx6hInxzlUJlkEzgxWPvxUh+rv+NIZnpcsQDjqtzsT
         s12DcKvhomZufouTCFGfF4DUxxyKjsALm/ZRw0yUZCMJSsGdDD1EpmKuvzwlc31EYuJH
         VrMCWvcfCt/6LCNFujVGYi/bJW4kvfxFnqbjp1sQ0tZDof9YAc7CR0bnHNvWeUDthhv3
         wPag==
X-Forwarded-Encrypted: i=1; AJvYcCUuqtg4O1Trv3TR7YWrGyCWby+tcVTDDOoa7MjChmx2IRZMEJuveg/l8c8nrTUMSXTo1aj+2+ytLtDE2MQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv2EmKMum7lAc5Pbr8I4511OCSocBb0vU19u4bhZGhk4x3wprp
	AQ9D66EoAwef70ViN0jlOK63X3im1Tyib97y6nQu7OaZdX532d8d6M03VRG6Ox7mZpN+fRrwBrR
	LN8rhxJ7X/gkHLdvDtC8Os/gCkZjQHouwF6tTvA==
X-Gm-Gg: ASbGncvY1tApvkwLK6ZUY3mn7NeBbLdt3ADw4ouNF1L94tnf+3DVWswfwTPTqlSUp//
	OSy86JX82pOEdh01Bmzfbg8JpaH/tIR8eP6HgqgAnBLz34sPK4rArqPNICXmf+ZqmrllBOie2Lq
	xqeCjzEWEvVV0KM48K6TdCNYo9PjGn0cPrYUKo+crvqfyicMgQFGQ=
X-Google-Smtp-Source: AGHT+IHF3RTQt7C8PWWKcW03kqyq+vB9t274NDs3XZDdekEAKo7i3dVAqYWB0kkOx5kesGqT8ATQ5REdHm0zDyHlpMA=
X-Received: by 2002:a2e:bc92:0:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-30f0064c308mr9536351fa.7.1743666463599; Thu, 03 Apr 2025
 00:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319064148.774406-1-jingxiangzeng.cas@gmail.com>
 <20250319064148.774406-3-jingxiangzeng.cas@gmail.com> <m35wwnetfubjrgcikiia7aurhd4hkcguwqywjamxm4xnaximt7@cnscqcgwh4da>
 <7ia4tt7ovekj.fsf@castle.c.googlers.com> <20250320142846.GG1876369@cmpxchg.org>
 <ipskzxjtm656f5srrp42uxemh5e4jdwzsyj2isqlldfaokiyoo@ly4gfvldjc2p> <4lygax4lgpkkmtmpxif6psl7broial2h74lel37faelc3dlsx3@s56hfvqiazgc>
In-Reply-To: <4lygax4lgpkkmtmpxif6psl7broial2h74lel37faelc3dlsx3@s56hfvqiazgc>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Thu, 3 Apr 2025 15:47:08 +0800
X-Gm-Features: ATxdqUEqWWLBNL7_e1hPcDJGh82p0lp3vOrTz9-0gyPLg0SnpQkWNGC5Tw6uG5U
Message-ID: <CACSyD1NisD-ZggRz0BaxUdJ9so4j-sKPZi361HJAum3+bHO+tQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC 2/5] memcontrol: add boot option to enable
 memsw account on dfl
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jingxiang Zeng <linuszeng@tencent.com>, 
	akpm@linux-foundation.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mhocko@kernel.org, muchun.song@linux.dev, 
	kasong@tencent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 9:42=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.com=
> wrote:
>
> On Thu, Mar 20, 2025 at 08:33:09AM -0700, Shakeel Butt <shakeel.butt@linu=
x.dev> wrote:
> > However I want us to discuss and decide the semantics of
> > memsw from scratch rather than adopting v1 semantics.
>
> +1
>
> > Also we should discuss how memsw and swap limits would interact and
> > what would be the appropriate default.
>
> Besides more complicated implementation, merged memsw won't represent an
> actual resource.
>
> So I'd be interested in use cases (other than "used to it from v1") that
> cannot be controlled with separate memory. and swap. limits.
>

Hi Michal

We encountered an issue, which is also a real use case. With memory offload=
ing,
we can move some cold pages to swap. Suppose an application=E2=80=99s peak =
memory
usage at certain times is 10GB, while at other times, it exists in a
combination of
memory and swap. If we set limits on memory or swap separately, it would la=
ck
flexibility=E2=80=94sometimes it needs 1GB memory + 9GB swap, sometimes 5GB
memory + 5GB swap, or even 10GB memory + 0GB swap. Therefore, we strongly
hope to use the mem+swap charging method in cgroupv2

>
> 0.02=E2=82=AC,
> Michal
