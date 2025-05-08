Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168D2278E6F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717172; cv=none; b=IUrFmKt43FiXTlp6Wc+/+F5dFJ4X9idadoY/ljTgmMzxoltMgj7MqLLrGwFZ/4hxHYG0pAJEWp57a/uKvD7LEzgjyRr0AtagYFtStoGzhC46RxbWeyy0YcvZNqFgb+SDBL/Pw3/r0kUXiCH5irbdqQ0R08rtKRYwBUeEZu5k3aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717172; c=relaxed/simple;
	bh=uatJ3LjI7n/uabCAjuIYn6Er8jrNtyMyLiYlf1tPvgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajoHUKDfWNKAmGzhWORpN8ovebEha0B0EZvHNHZpb04JAwfPgvtA8CVy6+G2reoGXzYPDQXjOXmllr2h6d0Oo5NoA4NT6kXRsZy7c3np5VU56mz+Bgzer6VOOe1aAziJiOnICnd5vGfp36HtcMBei6Fdcw83JEEn3kiL39jCPZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ALR3RiSO; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ALR3RiSO"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3fe83c8cbdbso428929b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746717169; x=1747321969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0GcWz7M9jCTD3vQ092kn0pMggWzRsyQcje+pdvcvTyU=;
        b=ALR3RiSOvovQUHBaxwz8WsqF7SzezW8W/FZBo/kj2mq31/wWkptzH0WBqK+FChs0za
         bvL6pFukOeUfKFySaqaX8NadHsBIIuWVko8XLZC+KQQieV1o74vlXpZ09B6EXvovdR7M
         xcdj9dtrEKZ2jCZeFakQCXeN+2AXVwrnVXg2gCLopY9V3IjuFqdlp7kAW/RwyaqQ+RvG
         6343ZXRI1D46mjcxF+jcJB6G1BmDEocYVUFkp869JO3aCnbDDE8jmeNlTJLdC52QJQM6
         hcdEDlRolzllAzdqRTM1e+1FN6+HsIvU5SZjgFalvguztRpj2KzjoiMd4qGAuPWYvING
         XhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746717169; x=1747321969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GcWz7M9jCTD3vQ092kn0pMggWzRsyQcje+pdvcvTyU=;
        b=oikPoClPs0BQRprypGzTK3zgWTaZ0FBoyyBkyrOLJmbMCBgqEqmkQUEBnfPCBUND1I
         iqCseyNNsGdPf7OAl51MiL9+LzFOT0ik6pvgOHSckSZUKW6d1+WAZso7CYW734V7R4hg
         /f0DteU6VDzkZCbBLpYaY/KT/c64Zf1V3jQlxqPxmplHDRk7rgG4D5x1H+RjKxFnPPyT
         cUXjSvfkqYgRNbulWjYsN+VPAqZIM0t8rMw0jLVNMeuwsJPvVXPxQ1uOmCDkIEwB1XO6
         NBzP8orTCn9HhZlnN97m2s+r+rlFboJNOxHTl03RZxP/TduT6t193gpsZFBBoGUooXGP
         hbsw==
X-Forwarded-Encrypted: i=1; AJvYcCWS0LbIqJFEn5/Y38xfq/haX1B5jIMWnwzuTtja/DLEKIwLfYJVRLC+T1vS76PEMr+GwDJDmEBcWwzL0eM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OYTlKKcJmW1TnOj1dWZN07JEEE0CnOWxiQWTZCs0CxYyctrg
	S3rsUCGAGNzJh/i6N5xKr2CU6NAxHwZ7OGV4VoyVVXyRveGjXjXxsqLSNMJObZbLUdOK+LuJmxG
	3
X-Gm-Gg: ASbGnct8nlxRkHA50JhOZSQeciQx3TiGrj0pxoRjZD9SvTpKgnplR2dNb1pnK4oUjW6
	OvTDYZD3CPVCv3Z8lDxIX6yR+WUOqevC8yW2uyGBHkV/NcSrogucqMHY3BmQJ0CJEFvEJuvHRy/
	TlGONBDfuIKFKcYk+7c2ZcrjE/0VEKWfSifUPDsREKEJxMPQRi6dRmcNLTtKMn8amBpheVE6D43
	xisChnAwyb/CCMOn5MsaCcjrEDc4dt3S6DyUojngmBaMdKZCDdgUwLPH1gKBni6bdbTJtI5wF9y
	aL399zni4OQ8fyfpZwDtZeoEAVqQacUpYqtn75r2PL9VUGfW8jijvIthqexk3TS1tA6yo6cZkes
	D4LPnUvlCmK+WJadGQeyE
X-Google-Smtp-Source: AGHT+IFrmotMhA/nMZAIEBB7GeHwIixjZIq4w08j6/K6MLvI6ZRzQvIIQBKip5mAFrzBQzYq229QKA==
X-Received: by 2002:a05:6214:e8c:b0:6f5:e0c:b203 with SMTP id 6a1803df08f44-6f5429e89afmr115651736d6.11.1746717158264;
        Thu, 08 May 2025 08:12:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a60eaesm705496d6.122.2025.05.08.08.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:12:37 -0700 (PDT)
Date: Thu, 8 May 2025 11:12:35 -0400
From: Gregory Price <gourry@gourry.net>
To: Rakie Kim <rakie.kim@sk.com>
Cc: joshua.hahnjy@gmail.com, akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	dan.j.williams@intel.com, ying.huang@linux.alibaba.com,
	kernel_team@skhynix.com, honggyu.kim@sk.com, yunjeong.mun@sk.com
Subject: Re: [RFC] Add per-socket weight support for multi-socket systems in
 weighted interleave
Message-ID: <aBzJ42b8zIThYo1X@gourry-fedora-PF4VCD3F>
References: <aBuMet_S1ONS1pOT@gourry-fedora-PF4VCD3F>
 <20250508063042.210-1-rakie.kim@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508063042.210-1-rakie.kim@sk.com>

On Thu, May 08, 2025 at 03:30:36PM +0900, Rakie Kim wrote:
> On Wed, 7 May 2025 12:38:18 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> The proposed design is completely optional and isolated: it retains the
> existing flat weight model as-is and activates the source-aware behavior only
> when 'multi' mode is enabled. The complexity is scoped entirely to users who
> opt into this mode.
> 

I get what you're going for, just expressing my experience around this
issue specifically.

The lack of enthusiasm for solving the cross-socket case, and thus
reduction from a 2D array to a 1D array, was because reasoning about
interleave w/ cross-socket interconnects is not really feasible with
the NUMA abstraction.  Cross-socket interconnects are "Invisible" but
have real performance implications.  Unless we have a way to:

1) Represent the topology, AND
2) A way to get performance about that topology

It's not useful. So NUMA is an incomplete (if not wrong) tool for this.

Additionally - reacting to task migration is not a real issue.  If
you're deploying an allocation strategy, you probably don't want your
task migrating away from the place where you just spent a bunch of time
allocating based on some existing strategy.  So the solution is: don't
migrate, and if you do - don't use cross-socket interleave.

Maybe if we solve the first half of this we can take a look at the task
migration piece again, but I wouldn't try to solve for migration.

At the same time we were discussing this, we were also discussing how to
do external task-mempolicy modifications - which seemed significantly
more useful, but ultimately more complex and without sufficient
interested parties / users.

~Gregory
