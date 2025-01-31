Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EBEEAC6
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738334198; cv=none; b=cKk+A1wkPS/786b2CSmdZPliedS8LsIuuH3AnbFiRjfAhBaRhqFDS9lCTOaYwTQL6+XxtENfl2LpowT79cQh1v9/4mJPomIrpMWG6hQAUyfzYS7mPnVZ2jFrOo2h6bxgo2Jmu1BwDJjXDqkrl4xAp1p92Ni1fpTXdlR0JPgT8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738334198; c=relaxed/simple;
	bh=tM9vE1hvQFxGftbHNk++j2LOyxmGvLANGlaA8puxZeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmgBPSGCyERHCIu5VEr3vaKB956g4Mub7BiTEpvrsm6tH+G7tey5Ev8qiBZsw/mrGomYPwMr0amGp7PhcvgpGkFoJVAuc+8e/ckYQ90bvarQ5bQggfC4Xy7wl6mWBn7CsVLJiJwhpbtoJk3dgWc4x3WIMivLSPoknY/hTcbdeTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=HKw1ePHU; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="HKw1ePHU"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C46AF3F689
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738334192;
	bh=GgR4Fa5C21+4PsGqKpSTdU+09I4aUV4hzbnQq2b5Hjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=HKw1ePHUupdVWEf6AdH4yqqw7l5g85YpRGduYIiNCI9V1DaeyhVPBwXj9/PzXp1FL
	 Hw5b+IqZ/7wMsvWoWgxhUEEddthPeUX56Zo7Tt/cZV8oBKbiPyDb/Aa79g5/RqLZQj
	 AwbJfwUvdTx9ds2yAfF6uIeP11K8dhBkahnUwF22x2tIVfuzJE7PlWAJ1yr0JC/aRg
	 69BpjmeT9YpyVhGJsHVeeQ1lhtm4VnGJb67LmL06PRerIObosjlRFcEIZu9UTUKl6M
	 MueNfBKvO1zTPDnEW6vWXDUfPYS59/LOViT7DGOR+H1yOCNiYJaTE26IcELwEnq0yx
	 GZTQxNeiRr8kg==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21648c8601cso37652165ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738334191; x=1738938991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgR4Fa5C21+4PsGqKpSTdU+09I4aUV4hzbnQq2b5Hjw=;
        b=OjJwgQr7eVV3jTTvXp7Di2OTjiKN4nK/srTFH6ICq3Db4UbI6psnq5EYqXMjPHpSgj
         0kOJ/od8+wBWT7XG1Sqk1NsrV3YRGE6G4skUK6b1Chd6PV6kvKHC8E7hGbYyqE5M8KA8
         EIf9RlvNuwHsjWVfw/GXjuPDvQX5yEX3deatP7AXbZxjroWqKU9stmh4nxaJE7afMbJH
         cp2cJt/OjqMZgbbSgO/csmY+l5oMjKJUYbCE5HQdOgPhSfnlAQwwR2PEKDKLgkAR3+mi
         qXrBI7br8Ft20uOkavL6AMJSEF6bPfTajptvY/tG0PGO/QoLaHkl/J5uJoaKn9PMGoMZ
         3ZIA==
X-Forwarded-Encrypted: i=1; AJvYcCVFQ4tyXyYhGgaZmTUDj/IS5NBHCINeYxyo1cEntTFLf11Zab3cdSFuxVH6FGFoY6+y8GeUnDDc+hKs76Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6ZeLZ3vJmo1b59e8J0kUny4eB6fn9nLdjO/2vWtFSsodey36
	LMi0V9D7i8C8WMBg3qYl7l+CRP9kihFTVS2wydgjF5FphB1IrkGjPwBnSjzzb1QNdvsrmoOnMly
	xbq061Ho5Tf1V2BFIdSwh6eklEqrFuYt6oEa03QwGajSECZ0Sn8+Z+dunmwOPh1wrfl+AG35pKv
	4WFQ==
X-Gm-Gg: ASbGncuvZrSBKXeZ4RzEk1rsrI+7THNjqKJ3zUf5g+TyB8QmTfp3hdqVPbbSQ3f7SwI
	e8tGMrTBRCBSy6DVI3QoNMhQ3TSVqQoMvktlJJVJ2EEtUPGsrT7RbDroUK5OqnEcfDgn0WaQRKR
	BP3wH+j7gn3RzJkCzCh3py4Y7qgk7ogYhVsZDwVBq6nOX0Mrust+H4oeBn9Wsh+Mqghwfr5FkVR
	G/M28ZIJGyMSrlicmYnGPgXkMJVpo+K3Q9KHjBJPkN5LKKmfw8IzZ1z4hxgLLF39TlmzaeZ6nCf
	rrg0xt4=
X-Received: by 2002:a05:6a00:ac1:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-72fd0bce067mr17142889b3a.4.1738334190995;
        Fri, 31 Jan 2025 06:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ3NHrsSTb+l0pVV7sIQZfb9BdkAkZLFniGUqZPJU+lfTP79eq8Jv6xEPNBIF3S7kq3Zp/4g==
X-Received: by 2002:a05:6a00:ac1:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-72fd0bce067mr17142836b3a.4.1738334190432;
        Fri, 31 Jan 2025 06:36:30 -0800 (PST)
Received: from localhost ([240f:74:7be:1:12a3:6433:5e8e:7cee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a773sm3378230b3a.166.2025.01.31.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:36:29 -0800 (PST)
Date: Fri, 31 Jan 2025 23:36:27 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>

On Thu, Jan 30, 2025 at 09:47:47PM GMT, Bartosz Golaszewski wrote:
> On Thu, Jan 30, 2025 at 7:40 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >

(Small reply to the previous comment:)
Yes, I understand your point about why you think 'num_lines' is
unnecessary. What I meant was more of a UX (User eXperience) consideration.

> > While at it: there's no reason to impose a
> > naming convention of lineX, lineY etc., the names don't matter for the
> > aggregator setup (unlike gpio-sim where they indicate the offset of
> > the line they concern).
> >
> 
> Scratch that part. There's a good reason for that - the ordering of
> lines within the aggregator. [...]

You're right, that's exactly the intention of the strict naming, 'line0',
'line1', ..., 'line<Y>'.

> [...] I'm just not sure whether we should
> impose a strict naming where - for an aggregator of 3 lines total - we
> expect there to exist groups named line0, line1 and line2 or if we
> should be more lenient and possibly sort whatever names the user
> provides alphabetically?

As Maciej pointed out:

  (https://lore.kernel.org/all/CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com/#t)
  > [...] if free form names were for e.g. [1, 02, 10].

we would need a well-defined rule to avoid ambiguity, which could
potentially unnecessarily impose burden on users to understand how to
properly use the interface.


Regardless, the point is that we need to make it clear to users which GPIO
line a specific line<Y> of an aggregator forwards operations to. Since
requiring users to explicitly set the offset within the aggregator for each
virtual line (e.g. besides 'key'/'offset'/'name' attributes, by adding
'idx' attribute, which users would need to set explicitly) would be
cumbersome, this RFC implementation instead just makes use of directory
naming. I believe we agree on this approach (i.e., using directory naming
to establish ordering). Correct me if I'm wrong.

So, to move forward, let me outline the possible approaches we can take:

Option (a). Drop 'num_lines' attribute and:

  (a-1). Impose strict naming rule for line directories
  
         Users can only create directories with a predefined naming
	 convention. This could be 'line0', 'line1', ... 'line<Y>' (as in
	 the RFC implementation), or simply '0', '1', ..., '<Y>'.
  
  (a-2). Allow arbitrary naming for line directories

	 This would require a well-defined rule to avoid ambiguity. As
	 Maciej pointed out:

         (from https://lore.kernel.org/all/CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com/#t)
         > if free form names were for e.g. [1, 02, 10]

         Users would need to understand these rules, which might impose
	 unnecessary burden on users.

Option (b). Keep 'num_lines' attribute but:

    (b-1). Prohibit manual creation of line directories

	   Users would no longer run 'mkdir line0', etc. Instead, writing
	   <Y+1> (Y >= 0) to 'num_lines' would automatically set up the
	   required directories.  convention. This could be 'line0',
	   'line1', ... 'line<Y>' (as in this RFC implementation), or
	   simply '0', '1', ..., '<Y>'.

    (b-2). Keep manual 'mkdir' for each line, in the same manner as (a-1)
	   (as in the RFC implementation) or (a-2). Seems that no-one is
	   favor of this option.


    Note: (b-1) is a new idea. Considering what really needs to be
    configured by users, this could be the least burdensome and simplest,
    especially when configuring many lines. I'm including it here for
    broader discussion.

Personally, now I'm inclined towards (a-1) with the simplest naming scheme:
non-zero-padded integers ('./0', './1', './2', ..., './<Y>'). Or even (b-1).

Let me know your thoughts.

Thanks.

-Koichiro

> 
> Bart
