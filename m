Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406AD148830
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750813911; cv=none; b=X9wnK5asLAxO70gUv3mxVabdp8WrHN4KmGhuVzPvYDuzqfs5tZYwN6SaB4xW5mH43XabJcrW/H9p98FKqhEam4o9Ssq+Hw4PxWEVAE/58v6CuyXO3gZ3TUMURKqb3Molk83z2R9sjNuS9mnHPFcYkr8iUWI6XGQAhNSlJMcQ0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750813911; c=relaxed/simple;
	bh=wqsuhFeoDa6JCzt/ztaQxYh2ykTOoBR+UKSAXqeGY6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFyDkk69qMPgtY2qNu0FrUzXmxmBHX8e+CoTwPmwcVVKqbeOgY54+pUncgcNT3qYGLkZdE4bVSJ1aO5ORFBimYFKsIhQeLDpRb4lt3LAmZJe7+hf0kXliXoPVV4V6VPK6gBbEqQh05Q2pVn/vpeDN8iKu0viJCPY0cO+yJllvPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQr468Qa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQr468Qa"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade30256175so1053081566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750813905; x=1751418705; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lyY1/4XkISIwcvjIG9xP2V70CKcNPCDYCT6Z7R9Jz0=;
        b=HQr468QalJlGFmOxcOgFu5kGRxRvvBZzS70qZSyzaHQxzLeYrbLj5PkpMRBkgMvISs
         ahXFu550zRexw6QHyUbI6wgN7vnQxZwL3HD/PP7kMlQDjSlG2RWSHnH8CB5bUnFe7Myt
         J07ts1e9sihc8nJ4MHJYCnlSCPQxd+cYF/gZc7RbuIkI36bOC4JXYBXPcPctiJE6rjFT
         aly0TPwQtJwsw4d1SFawQUli8fYvfTsEAkzp+NNuQRhw1EJdt1JhpRSLG7jMmQhB7nN1
         7tV65t5mBS8HsUNUlIWSFT+J+N3yiHk0259Bpi/Tci+QrgFXRygkRsHKMRUNtF83ctP0
         2o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750813905; x=1751418705;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lyY1/4XkISIwcvjIG9xP2V70CKcNPCDYCT6Z7R9Jz0=;
        b=kFA3ziy7sHCpl/Kgt5dK5KFSwvp8qRNWDT/YsPD5TUH23dhazoc8g4bFPhpbnk+W6q
         X7/0gyx31z71zabi4RdQhs6qxG2vFPwx7ubDQXEEAXAvi42ystYXcAbNODKwGSwDJx3h
         yP78QgMvs96Mj3psTqx3kZkrkcs6amIUXI5gheKzLgYUibZQbhB1H6+vOXDtVl1RZDhn
         xFZP7aGVYdNmUlVs4VgwX/w6hJjwsT5Xar3gxuR026OtSD8RyJNN7YcpDv50Xv6UNYwb
         L0dTKWSJWwk8E0ZG3/RXoVyEhRkhz7kW/k91RCsfcCEnv37uywR5/l4vMse2lSVJUI7x
         Tdgg==
X-Forwarded-Encrypted: i=1; AJvYcCV45ShEYMXmYIM3LhRPwfelY+/9RESa0n5OVR2OZlc657rC91TCOSGfhC9x2ye/+SvYYkIpILT103aLpN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2XiCQqUFharZ7w5VaPQN/Qnjju+ChSjMLvzLy8nffrliPJvWG
	5dcLpPRB77sjclH6b36CsbvGxtbIBUNz9M6+3xonsYzh9n+iiMGm7vOL
X-Gm-Gg: ASbGncuXrLm7MtaaeyV7k+Y9gBhmZGIE/HyczWCy6gC9176bQDKC/J1iHReJHh3C4yR
	vA31mfoaZG3MLUcToS6PIyYBHVr+kY8/VvUmpaXruARJN/dp+xRhJHExx9YcEGImbck11cpHGwQ
	HcyKyAnSomq+0vDSm5P3mmlJJ5X0ZyeF0Xl5F/dGgIdMBNQZIuCWJhc5UxoDgCrmCIvpUIrFi9b
	STXbO/GaHn6QMu/iMNM2gdPjzu2P+Ax/EvI5+yHnG861NWS3/+MowXch8g1wRvVfk9KoaujAV3F
	2XgevuiG9/50pV3hYFelXI+MoleSZ4fLzubFts/Nj/czz6ykIA9k+1iG55x/Us9Y3lMZXH1C
X-Google-Smtp-Source: AGHT+IFLAmx29NavZbv239W1gzdZmTcw2tAykCTpUwRFpZC1YrPYZxXJIajZ9rR+HIqgWZUKGcmtUQ==
X-Received: by 2002:a17:907:cd12:b0:ade:9b52:4da0 with SMTP id a640c23a62f3a-ae0beedec57mr97958166b.60.1750813905241;
        Tue, 24 Jun 2025 18:11:45 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b75bbsm952860466b.130.2025.06.24.18.11.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jun 2025 18:11:44 -0700 (PDT)
Date: Wed, 25 Jun 2025 01:11:44 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH 1/2] maple_tree: Fix status setup on restore to active
Message-ID: <20250625011144.n7rb3fejm35d33oi@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250624154823.52221-1-Liam.Howlett@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624154823.52221-1-Liam.Howlett@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Jun 24, 2025 at 11:48:22AM -0400, Liam R. Howlett wrote:
>During the initial call with a maple state, an error status may be set
>before a valid node is populated into the maple state node.  Subsequent
>calls with the maple state may restore the state into an active state
>with no node set.  This was masked by the mas_walk() always resetting
>the status to ma_state and result in an extra walk in this rare
               ^^^

Nit

s/ma_state/ma_start/

>scenario.
>
>Don't restore the state to active unless there is a value in the structs
>node.  This also allows mas_walk() to be fixed to use the active state
>without exposing an issue.
>
>User visible results are marginal performance improvements when an
>active state can be restored and used instead of rewalking the tree.
>
>Stable is not Cc'ed because the existing code is stable and the
>performance gains are not worth the risk.
>
>Link: https://lore.kernel.org/all/20250611011253.19515-1-richard.weiyang@gmail.com/
>Link: https://lore.kernel.org/all/20250407231354.11771-1-richard.weiyang@gmail.com/
>Link: https://lore.kernel.org/all/202506191556.6bfc7b93-lkp@intel.com/
>Fixes: a8091f039c1e ("maple_tree: add MAS_UNDERFLOW and MAS_OVERFLOW states")
>Reported-by: Wei Yang <richard.weiyang@gmail.com>
>Reported-by: kernel test robot <oliver.sang@intel.com>
>Closes: https://lore.kernel.org/oe-lkp/202506191556.6bfc7b93-lkp@intel.com
>Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
