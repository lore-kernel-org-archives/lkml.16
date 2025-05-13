Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251032BE7C0;
	Tue, 13 May 2025 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747164377; cv=none; b=LHyOAmxlW+qDSZ5kaTyX1K2L6tMqh4cX8I1o/umaIWY0b59f3JJ7tYhhVJizB2J3tXG57I4XxfIFVjPrjwkahMUjpc5CEwu8JRIvQVs3j28/QPLCYxUKiYLKj3Fz1JW2T55j8NDV17X/kT0zBmgnG4z4gmTv0OnNFyLk1p2aPnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747164377; c=relaxed/simple;
	bh=RKDG4ggmfAhUs/yqnjs5vHKHQdE7nfQdUCwHC1FIHNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpis0OEmekcEAIYFQxi6+ptaLQH/WKz3n/JdiP8DSw8JLpy0D3W9EqASpSSmf0eBBm+USL//D98EOaCu9zh4BqfH5Fsje0wjdVYMmAheIMNbczJp0Yvk4AKaX4b7wnHUWnUu+MY4tp9wscI7eQ5sw9zsHLLMaJkOY/mxoB+IoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Af4ukGz4; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Af4ukGz4"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad212f4030aso871582966b.2;
        Tue, 13 May 2025 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747164374; x=1747769174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6aCY/0HEzR6jdJQTZkp+sBoLM3YKZJzgLvNBNO2LNkU=;
        b=Af4ukGz4nDbdK4l9CBOUHUKnififM23xxqDCzy3epFSk4nfnqYe2nlFrhCYoORv2+w
         KYLqzdd3kEVC9MWX/b56AEnx0niPPj6ejfmy9/iie15E4ht7Y0CBKHqWu/7jSHmEA8Ui
         360C87hvQ2uLYNtA3It8EDMmk0EvYneJqwMMjs/YiwnFsPlnxKS7vWKHqAm3CoYR+Yfx
         j/Zg/Mrfk8ajEXVmWLYEQWCs/ACHyO0lUnUX3JwZP0QPTc7UiCnf8iNVY2AkgKHMzIDq
         wJHCPMgKo0DAaDJq5hX18I5EtK+s+PytZQQ0QgVxHg/0x6UXuPVI/pbDmO7NY001cskZ
         2KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747164374; x=1747769174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aCY/0HEzR6jdJQTZkp+sBoLM3YKZJzgLvNBNO2LNkU=;
        b=fX7WXF/7vnrybEX/eEMHzXccGHiSSsZ+yK7ls2CriPqwLRkY35gsxhZ4i9/jrg8uPA
         7P9Gy5zkG5OsRJ8vtcPX8vyOSIv9LxkeSvZB2AchBtN4g8FBNvBa5myRm+K1YRuAogl6
         o5VXKXlSdZ7hw+tU8xBpt0DRC5k8nGh2O2REGh/8oUDx+3Ksb7QrFiezzzUnh/O5yko8
         l2j7PBef6+shWHhGGr0DTo2FXBtlOZ8V1AJ3lncC2uJJm/bzKWK8Z+oqw3/A+ep9tJTE
         DxVeUc8sFl1PnjH3JqgC5LuIYEHlTwi68+Yi1jD2Ym9BCfJ6hLMu1MokfJsprBS+cn05
         pDQg==
X-Forwarded-Encrypted: i=1; AJvYcCWRNydH+BEco2vrj2Zq27AU2aJHk7FTa06GJraDo84cTELFHnaBhTDnf4L+BOZ6Gt+OjKuNp8G6Va7dYjc=@vger.kernel.org, AJvYcCWym4+Ya8gqHS5Us6KWaJYkuCzJ9OHC9+sUKfnLgMmCgc3GAuTrvls52CLYJS07qDo4aMWrm5t92WY1@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7EfVYrPzLUD9VCjRcy8QrvSvGFwTN6+ra7yyGfTKAWN3VOOa
	/+AjvDFPSnTozlu1GlgFYzwDoE3ziDlwpZW/FP+7OCBdowDsYoM=
X-Gm-Gg: ASbGncsf+q5kZeq0QqfHDXZ1HTytVumpOxuBjv4VB2lgmatCnU89uZuWjbNAtqH2Szd
	OvfoVUqm42Pvgajo+FSPPCKCqbl7MQO02I+i9WyjY/5g++OZpbzcAZ+dGNG95NaIMNc7wNhU7rd
	KkIb/Ci8JLCrPeXrzb3MoirPPEPC3hvMLT6xuxFYFuoP7rCnwaULeN+ID+PurMK0YMW78RKOXq0
	7kFoG9qy4PvAZd7FXArCtAcy6WoLr7MflqBuS6NgCYfIGIUyG1EBQ2lFIxCJxvyJ9V2p2sESTNT
	Al4KSyYklPhNRx4x8bPaA3ULaNdCXMzO+bNTEA==
X-Google-Smtp-Source: AGHT+IHN/ZbAtYxfjZ3dG2Ebs6Z6vnVEDlTVNPBRqnQoQMwdzIhe3JDqR2kNomkhNXUYKwLfJtx2Fw==
X-Received: by 2002:a17:906:730a:b0:ad2:1b5e:c008 with SMTP id a640c23a62f3a-ad4f712b339mr87172866b.14.1747164374171;
        Tue, 13 May 2025 12:26:14 -0700 (PDT)
Received: from p183 ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd37dsm818953466b.124.2025.05.13.12.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:26:13 -0700 (PDT)
Date: Tue, 13 May 2025 22:26:12 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <da087640-494a-4803-b770-10758393bd80@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
 <77f03295-df5d-4bc0-9a61-5be829969662@p183>
 <20250513041249.GF2023217@ZenIV>
 <0e43117a-d92c-4563-ad2d-de6cbd02e986@p183>
 <20250513190429.GH2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250513190429.GH2023217@ZenIV>

On Tue, May 13, 2025 at 08:04:29PM +0100, Al Viro wrote:
> On Tue, May 13, 2025 at 09:33:34PM +0300, Alexey Dobriyan wrote:
> > On Tue, May 13, 2025 at 05:12:49AM +0100, Al Viro wrote:
> > > On Mon, May 12, 2025 at 07:08:53PM +0300, Alexey Dobriyan wrote:
> > > 
> > > > I split them like referendum ballots to see where the consensus at and
> > > > not have big single discussion thread.
> > > 
> > > Just in case - consensus would look like a lot of replies in support and not
> > > simply the lack of replies, right?
> > 
> > Well, it is l-k, so absence of NAKs counts as OK.
> 
> In your reality - perhaps...

Well, if nobody objects strongly, and maintainer agrees, then patch goes in.
And if patch went in, then it everyone else's problem to undo it?

Right?

> So absense of NAKs on l-k may or may not count as "OK" from your point of
> view, but it does not mean that there is any kind of consensus.  

Sure, but I can't force everyone to reply or vote so it is always
blurry.

Right now it is clear that Greg objects but I personally think
his counter-argument is weak.

He is basically saying that LOC count is too much so Linux should stick
to how things were always have been even if "old style" is objectively
inferior.

> More to the point, if your... suggestions would go into D/CodingStyle,
> replying to objections along the lines of "where the hell has that come
> from and when have I agreed to that?" with "why haven't you replied
> when I posted them to l-k?" is *NOT* likely to be well-received.

Al, this is not Debian where they vote so everyone knows when and
how everyone agreed to something.

If you wake up one day and see "struct inode" renamed to "Inode",
you have all the rights in the world to be upset about everything up
to and including not being in Cc.
