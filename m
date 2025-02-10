Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E41BE23E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175500; cv=none; b=hE4ZB3tjnCSxe6KxygUn98CHngMhqvOjpr7uSXmAjf4As112Nglzurr5zd2/Z8pdY9mu09dBFkFz9QY18fqkmubS97q3mmNrtOBZcLYUJRxLo3KJSG4LK738mBGCkV56rHXk+BrJBiBnvUhShkhw76l809g1UnLMpmAHoxkYNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175500; c=relaxed/simple;
	bh=9/xJajeP2FVKMoXyonkzE3TFDAFOhuTedQ56pyx1gz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIXLsOg+jYtTT1QJJtfnQUctSf9uYsKMjXxonuHk3RLXh7oQp3qFxqJORABmvDWlPeN2WW45qf2GPWij5DoEJ2+fMMryuU1L5NwoeQywTYuySZjDZiQ8GTkKCgE+HDQt7An4c5Xh9j7YtrrMS0eTf9sopqsGX0P4UOnybxscK80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FH7kDVQZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FH7kDVQZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7b7250256so154104566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739175496; x=1739780296; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9/xJajeP2FVKMoXyonkzE3TFDAFOhuTedQ56pyx1gz4=;
        b=FH7kDVQZ0IgjNtrq8KMcakAmquzVwNT0Tz+YYEBZdB94sQrt0MQZb1lfC3CUqMWtgv
         9Av9jqBO8efoFvqdOLnIn8zh4d0ar10rgS4kK2FSKEPhRNwhICC4zkkeg32PQMnVD7QP
         7BE5Nbfy3fX7CmXmAhfgIS+HYsrhWHSTXgj2OUjoBals7pc046GXQpks6/bcnI7DQbAo
         55t0EjE0tRiwfLlo68ux12f61AfPN2bCdLnUKwSQsbzcSdP55RQQ/jpMxwjuA2D7a5+s
         jyQGfIKU2bRoSbFHNZgpiX/rDFKkDWy+UxNxr64rslh8bR4Tywxq/KNHu7xoqs1MmjaH
         WVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739175496; x=1739780296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/xJajeP2FVKMoXyonkzE3TFDAFOhuTedQ56pyx1gz4=;
        b=hr9k7sURBJLCWx9DQcJDhcMdxyWynpSPIUcQhTgpqEK4dwGx+9xhqdvwu8fmXBcv4k
         77+z/Kj6Mme2AxaTnpYkJslCNIQ6vOzneOy1Pv8t0z3Zm4EvfBJtDRGfLzPYF5kLmhsw
         gYAn3Om3DKwGIgfisgb7jmgdZ8zAOwSaq9kDQS9j6bvGHOIXPkZnAcyoSQNwhATLensa
         a8U9SVwtH7vyjKOTWQoeQA6Z+J9SCIx8WWF7NIjCapi+KvvzeOQkQUq6NRowRJTW1uym
         j6YCyDcaCFzlBYh2qKy26Zk5x0DTdwffo1o+BD9yAGsJJTFbe3bFgfeovyTr9SW+y5IJ
         9heQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb1edfWEgPBvZGoPljJt5ZtDtizxtyBWscqsq6V2l0Eya4+jSBljTIcdN/4chA8jAN7f3JO0LM1SXnxWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztYyNV+RnFGS2QKDG++l6ZFmcrVnPA3doyY8BAl7za38HIQKgz
	BzY8pMPgUogip8EytdBqBjMTDEOwFzH79pF+PSkf7iVHMjlIk/1Aiiqn8IOnxeUuYsGoIDoPS7P
	3LFo8vFXfm8JjUSqJTliCRpVVLKSuHY3q8F747g==
X-Gm-Gg: ASbGncu7dPQZRGSw0oz/l4MHUOnLMBL4oYqrrnVrOOp0hEIed0EYd/kFYAx+aghSWnS
	/6hSR6FVb9E30XwLIuBxATmVCddocxRdlfRoYCldi1DS5D6YbigWi/m4xz9M9Gf+edoYTC24=
X-Google-Smtp-Source: AGHT+IEnj1BcpJ/vf+pAvC7rpjR14xcF+qi7ppnzbWyoFsJ7umwlzIjI3S89j5znVdpJyi84NnWD9aI7J8X7UYSc4JI=
X-Received: by 2002:a17:907:1c22:b0:ab7:647:d52d with SMTP id
 a640c23a62f3a-ab789c6e8c9mr1295169566b.51.1739175495909; Mon, 10 Feb 2025
 00:18:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124075558.530088-1-neelx@suse.com> <20250127180250.GQ5777@twin.jikos.cz>
 <CAPjX3FdaxfzULnRjN7TqyS9uK_ZJSk2PRzLgQCLVGBrR0yKLGw@mail.gmail.com>
 <20250129224253.GF5777@twin.jikos.cz> <CAPjX3FdJynRY91N-1aJ0wOrMJY+cKvSuhLDPGAuCybEvSzS0KA@mail.gmail.com>
 <20250205164012.GJ5777@suse.cz>
In-Reply-To: <20250205164012.GJ5777@suse.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 10 Feb 2025 09:18:05 +0100
X-Gm-Features: AWEUYZkc_Fpv8JjNosljHxiWCONTtiR4ZS2YuiasqWFtTORikRUsjwqzlAensY8
Message-ID: <CAPjX3FfCgtUcrTiui8VW=bPC9fdrUqa65dCDeymk+=jnFOYWFA@mail.gmail.com>
Subject: Re: [PATCH] btrfs/zstd: enable negative compression levels mount option
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Nick Terrell <terrelln@fb.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 17:40, David Sterba <dsterba@suse.cz> wrote:
>
> On Thu, Jan 30, 2025 at 10:13:36AM +0100, Daniel Vacek wrote:
> > On Wed, 29 Jan 2025 at 23:42, David Sterba <dsterba@suse.cz> wrote:
> > > Up to -15 it's 3x improvement which translates to about 33% of the
> > > original size. And this is only for rough estimate, kernel compression
> > > could be slightly worse due to slightly different parameters.
> > >
> > > We can let it to -15, so it's same number as the upper limit.
> >
> > I was getting less favorable results with my testing which leads me to
> > the ultimate rhetorical question:
> >
> > What do we know about the dataset users are possibly going to apply?
>
> This does not need to be a rhetorical question, this is what needs to be
> asked when adding a new feature or use case. We do not know exactly but
> in this case we can evaluate expected types of data regarding
> compressibility, run benchmarks and do some predictions.
>
> > And how do you want to assess the right cut-off having incomplete
> > information about the nature of the data?
>
> Analyze typical use cases, suggest a solution, evaluate and either take
> it or repeat.

OK.

> > Why doesn't zstd enforce any limit itself?
>
> That can be answered by ZSTD people, that the realtime level number
> translates to the internal parameters may be an outlier because the
> normal level are defined in a big table that specifically defines what
> each level should do so there's not predictable pattern.
>
> https://elixir.bootlin.com/linux/v6.13.1/source/lib/zstd/compress/clevels.h#L23

Yeah, I'm aware of this.

> > Is this even a matter (or responsibility) of the filesystem to force
> > some arbitrary limit here? Maybe yes?
>
> Yes and this is for practical reasons.
>
> > As mentioned before, personally I'd leave it to the users so that they
> > can freely choose whatever suits them the best. I don't see any
> > technical or maintenance issues opening this limit.
>
> As a user I see an unbounded number for relatime limit level and have no
> idea which one to use. So I go to the documentation and see that
> somebody evaluated the levels on various data sets with description of
> compressibility and says that levels -1 and -15 can give some reasonable
> results. I can also reevaluate it for my own data set or take some
> recommendation.
>
> What would IMHO look really strange is to see another 1000 levels
> allowed by the parameter but docuented as "no obvious benefit, only
> extra overhead".
>
> If somebody comes later with a concrete numbers that it would be good to
> have a few more levels allowed we can talk about it and adjust it again.

Right, agreed.

> The level is currently not stored anywhere but we will want that
> eventually for the properties so limiting the number is necessay anyway.
> So this is a technical and compatibility reason.

I was looking into properties as well and I have a draft using 8 bits
for the level value. I think we can stick to that for now.
