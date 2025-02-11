Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF51EF0A9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265670; cv=none; b=cTEYRyaEvtIIoc8HwrlWh+MPvWxV7ETpOnzB6kjul0CmZxHxegXL6RlqB3Ag1oRV2Yh5E0m/u0oSjXe4LXQLRJsTd1aw4t5I4qEKbnxRWuWJ1QyxUwzNidmBYgXuMbOhSAjLSCsBWFyhAEfYE0XJt1DkBtz8+Pdh5HTVmpvxD18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265670; c=relaxed/simple;
	bh=GcWfSosCoF4FUpxhA3mbRbTcsH6nrQeOhILfVtt71Oo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQikkzc4TmFmSqJ4ioMjt+yircOcw24J8qJCe+3H80OfecrR1qzNDNRcVUPUGX+q6nSatv85f5EQ/JJf710PFmIMNgkc2mMq/Tk339Blbwa0kz4C3TDDGJGem+oCkzpU3bAbZS9Ge3TS25Tr6PXAiNkpRZIs0FWPEQpjCCzuGhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=I+0lO+Ex; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="I+0lO+Ex"
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A771A40144
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739265659;
	bh=U64CfSm4srCsWUzG3+CxHvNhRpvC2/rUcpu6NW74+lE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=I+0lO+ExNG7HUQShYsbzzp+yfdwvSIl0DrR+fIFuVoLilvsziruTqkLt+7q+3NpoL
	 FdWfQ0WEXJHPhmwh24yXpmTSlYxxawt1rV0gXqVQwJYjhelkbRO6C5V8bwMm/YaKmh
	 9PhwLl9vzBHKeCiNQqr1kqExkRhKTgCCoDLIR5skKc2XEYSTdH+sooeJYWKmSOjFXU
	 xMI/KTUf1Ei1ZiKloUEXhvz3HMFkKnSpA6Je2nqL7kbvAvF+wZwlbYiuz03+v+liY6
	 jYcb5L6k9Afin/A6lwysWr+wLdas1MUTgyv9WWKVXLaWZtW8Z8QkeDgbw6b5SI3spm
	 FvBSrnlwPzK/A==
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-308fefb2bd0so922011fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265659; x=1739870459;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U64CfSm4srCsWUzG3+CxHvNhRpvC2/rUcpu6NW74+lE=;
        b=f+coRKntld/lFfCIBuupP1WcnyabY5FXztc917QPA1ZV5CPrNtj0ywxdSvqPh0OqMG
         evUU7aCcDrFaCvL/Y5wJ4/Lh5LY0zNiRmiLrjWUZdlknYIL4PuHQv5M4X8HUsC6et9CQ
         dv8sDsKm0U31od3JkL//90Xz4PL1+UhZa3MR/YcRJ5/57Pd4snbu7fvNV6MlkzWbyJK8
         daVfpoHrjm+4bPLmYQtAKydNKTGZNhk3m/s7SPDFCX74fpExfRhauZ6IDOXi+55Ld4B1
         cfqFMJZGuLuDTcaaZOGOy5ZyrFvoHB0VB09sAi5pwdOvcjGLgXcqPn2nTvS7wArIV3L+
         Kjhg==
X-Forwarded-Encrypted: i=1; AJvYcCVwptArpud7GpXoWmp4C4MrXyjWYJ2Dqq9CZ89ia+aBfKjkZ7pOusHoFsFjcgcPBUL/KjLb+of3rAtkLbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK18yoq2pKvJlmOE+4Fnp7mjFLtY+MSjfJ7XuRidEBYh8IN+cI
	/w7egRLQIaJ74QUDsCzfXPYO1ifS5G6NvWfOer77uUnkb23D5jyFu8nvbN3APiYU+Wuj7O+8RHX
	OkJwcw+Rrgz5b2ba9uuMCzYDQwNyJFDNqruiXhskQ+FzUUHMn2lLgYenFbaE0338dKtzT9pWw5Y
	/P5gXjosRvXxghtpkhlgMInie+0Cz7K8s5t4hYHtwHJ6dYmmM/HwVx
X-Gm-Gg: ASbGncuDhvNN/KiyT5zqMzt3lu6df/+TrK6l3y1AxNC6VF/DVT4fZFzG0a2d38av1fd
	Hu4+WS+gkzIVJs1wxdiRqbKRGmXBhduhmhQ7RgQ//170P5ncumC2Dykx+g9FapQ==
X-Received: by 2002:a05:6512:3581:b0:545:8cb:2183 with SMTP id 2adb3069b0e04-54508cb22cfmr2090718e87.29.1739265658886;
        Tue, 11 Feb 2025 01:20:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuJMSQ/TqRY+ByJfSTG7hk8lOXnBPzeFqbVF3O5Rk8LKphBVZBFUQ/+lvWBZ+XFIrTHvdv/73i4M6xhpprmoM=
X-Received: by 2002:a05:6512:3581:b0:545:8cb:2183 with SMTP id
 2adb3069b0e04-54508cb22cfmr2090695e87.29.1739265658468; Tue, 11 Feb 2025
 01:20:58 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Feb 2025 01:20:54 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Feb 2025 01:20:54 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <6ae4838b-f7b5-419d-8659-7b8779a74adb@ghiti.fr>
References: <20250205143903.413959-1-emil.renner.berthing@canonical.com> <6ae4838b-f7b5-419d-8659-7b8779a74adb@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Tue, 11 Feb 2025 01:20:54 -0800
X-Gm-Features: AWEUYZlZSryfeuoyf0ZVN0odSbkSu51s5prPv-mgznTC7yy0Fa37Rsfs98SEMSw
Message-ID: <CAJM55Z_X4A_FO1OrA=3jC9+uYhs-Pe0zFSxavFJv3orOka9CdA@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: Use of_property_present() to test for
 non-boolean properties
To: Alexandre Ghiti <alex@ghiti.fr>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org
Cc: Steffen Persvold <spersvold@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	=?UTF-8?B?TWlxdWVsIFNhYmF0w6kgU29sw6A=?= <mikisabate@gmail.com>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Alexandre Ghiti wrote:
> Hi Emil,
>
> On 05/02/2025 15:39, Emil Renner Berthing wrote:
> > The use of of_property_read_bool() for non-boolean properties is
> > deprecated and since
> >
> > commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
> >
> > a warning is displayed when used incorrectly. Fix it by switching to
> > of_property_present() as recommended in the same commit.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > ---
> >   arch/riscv/kernel/cacheinfo.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> > index 2d40736fc37c..26b085dbdd07 100644
> > --- a/arch/riscv/kernel/cacheinfo.c
> > +++ b/arch/riscv/kernel/cacheinfo.c
> > @@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
> >   	if (!np)
> >   		return -ENOENT;
> >
> > -	if (of_property_read_bool(np, "cache-size"))
> > +	if (of_property_present(np, "cache-size"))
> >   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> > -	if (of_property_read_bool(np, "i-cache-size"))
> > +	if (of_property_present(np, "i-cache-size"))
> >   		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > -	if (of_property_read_bool(np, "d-cache-size"))
> > +	if (of_property_present(np, "d-cache-size"))
> >   		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> >
> >   	prev = np;
> > @@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
> >   			break;
> >   		if (level <= levels)
> >   			break;
> > -		if (of_property_read_bool(np, "cache-size"))
> > +		if (of_property_present(np, "cache-size"))
> >   			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> > -		if (of_property_read_bool(np, "i-cache-size"))
> > +		if (of_property_present(np, "i-cache-size"))
> >   			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > -		if (of_property_read_bool(np, "d-cache-size"))
> > +		if (of_property_present(np, "d-cache-size"))
> >   			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> >   		levels = level;
> >   	}
>
>
> The same patch has been on the ML since last november:
>
> https://lore.kernel.org/linux-riscv/20241104190314.270095-1-robh@kernel.org/
>
> And was already re-sent once end of december...

Yeah I saw that later, but it would still be great to have this applied in 6.14
so we don't get all those warnings at boot.

/Emil
