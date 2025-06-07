Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE6EEDE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749306168; cv=none; b=Nn1bbMHWjdP4ZBfPIsOsRBJF05HqCjkz/GcPuazQDgBNQkyzyx/jAyd6clqzi3oVoTNVhZHnwCgt7QXYLbrzzv9EStv+i7QdEkWfJlVOsnEtXh+0VEZ7X5kKG4j0az4ci/veHe/3UOKny2M9/+D4dmsv51evuoWMGgfuHBve3Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749306168; c=relaxed/simple;
	bh=WhjK9a59bc6p2SEI8qtTVAnhoS+vb0UzkU/ThcA6PmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgKEU4F/zU4zLOXoyzA/7E4brB5m1gRCwmgWElOoKwI/2E2KIzG4nABLifv5NgVx08iE0HQscbUOIohY5PL1drzh2isoJUWMysrssYtX9OLXC6ebQFF9fJtolzt4sxT9o8cq/iLhPDmJ/8QdJdvRoPH1uYiPKSW5/VHInsJa9NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Afi0sFLQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Afi0sFLQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so4883776a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749306164; x=1749910964; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X256oqzY0uXwBHeq+Zf7FeZKobDc6se1DrH1ve9LTYg=;
        b=Afi0sFLQP6a4TkAnmj1BFMIx8v60/fuKdtLXDZd7VJ7TXvOe9Qaj+G8ecpp7pqwqj4
         sGCIBQ6Ba7ouo11SWN0i+IEcLJwHolWP6a2gR9252MvBUr4BB2jEk96YUZeM5saxBto2
         SrCeJZmI2FDVTBxN/KvAMtqmfjVTXpt1gaRJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749306164; x=1749910964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X256oqzY0uXwBHeq+Zf7FeZKobDc6se1DrH1ve9LTYg=;
        b=ssKTsonZFkcUZJPcyngaX87HanS4Xs3a1HpgMuLzFR8IkKFnswefgTZNn/zV15wZnW
         3hUb0rh59Dx+FEKid+8cv8JoiMyTW5EPSYfgbcaKeqdO/45c/5kNeWR55ybNRtLEZqzr
         eFRACWkhKyaEhcCK3poymDcTUNYmTSI0VTo1C2y6+yFS9f83b2yerZHM/ZHM4sqYns2f
         YC2iu6kkGbTvbIPVabMGrD8YsHzkCoqYpUN8JPZefhy2gj2FVHrfj6FB+Mlvg2jSFQVY
         00cNEh02Ffm3wDvHNWVwjKg3LaK9rENCexaIDtIdMvrsA4n/6cZGYNHCeB3NL1Kg+QTI
         MzPw==
X-Forwarded-Encrypted: i=1; AJvYcCU/hi6e1smR/rWidYxwBrEb0BXL3jPMCUWAeAaUdY5ZjOpfTRsIikdTTkR4MGbw3xZp9UKpmyMzbgEDtSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTKGMDbHyb1Osm1FknBBbIurqM850nH18qWxlVqZBsmKi4Yw8U
	aMw+HRj6PA0c5UHZ2USFAm44QUrTej8xkwitZL/dd9Jwyr0vnfzM75OVAodsq8ez8Pz2i0KDc8l
	I6QR/w9o=
X-Gm-Gg: ASbGnctyj4hifx4Sj54nlmZXxjU2SYwwI96XlPYIHZXQPkKV6Z/DLS74RlUn4yaayMP
	eondIbwL90aVH8hNZ4tDgoa6nkmvYf5zzvGkRiMkn0JCHmJui8q/sYQOQyiqvu7t3W4o5Tu+Hr3
	mV85kNgJ5DRNEpe6KFP6FKIzkDMk4HT2C85n8nh1s7uUqjcJ1v8t9S3ZZdBVKyEHTi93naVuFtH
	luCwgCy+cughtb+9RUxZ1LdzAVEnodd4pbr2eSakTjWWtXz2xMa2J+GkjE92HklNMrI947Ddiaq
	ocKKpqptXQqStty7B9T+t2nrKmydsgzEHguLuLxNAMWquz89xNngNHdfHcCelInD73aHf/eUHCN
	mNRX8iyzJK7QM9d43RcT40F92PmaT0NXc7/0=
X-Google-Smtp-Source: AGHT+IHGmddGFs9/jgo3QzYbSSXvxQ21KANuCQgkQgoXq4WgIXd+1jtzaDVN6/7cVdVlGhDp9fQuNw==
X-Received: by 2002:a05:6402:50d2:b0:605:2da5:8483 with SMTP id 4fb4d7f45d1cf-60773ec9198mr6185435a12.13.1749306164453;
        Sat, 07 Jun 2025 07:22:44 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077836ff6csm2446022a12.1.2025.06.07.07.22.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 07:22:43 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so4883722a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:22:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8kMiSHr7KbxSB4m8Ez0jKzzCyw9wcucCxmEPJn2ejlyAcPUyVBBQ8LhYGk6M1hzZF0NZMiN5JJNlAa+U=@vger.kernel.org
X-Received: by 2002:a05:6402:1ed5:b0:604:e82b:e255 with SMTP id
 4fb4d7f45d1cf-6077285cb5fmr6133955a12.0.1749306161715; Sat, 07 Jun 2025
 07:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607094224.104791182@infradead.org>
In-Reply-To: <20250607094224.104791182@infradead.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Sat, 7 Jun 2025 07:22:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjP2jDPcop24tz_9xs=cPUoCgMRHG8gkkEW8DJvD3HJcA@mail.gmail.com>
X-Gm-Features: AX0GCFsdn9Bs0MIWa5xRQX3H4S9IPSmleSHvn6kAT7DpvgEdxkb3jbzvg6rG7C4
Message-ID: <CAHk-=wjP2jDPcop24tz_9xs=cPUoCgMRHG8gkkEW8DJvD3HJcA@mail.gmail.com>
Subject: Re: [PATCH 00/11] x86: WARN() hackery
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Jun 2025 at 03:05, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Slightly less mad this time :-)

Looks a lot better to me - at least by looking at the patches.

So I didn't actually apply the series to test out what the end result
looks like, but from just the patches this looks much nicer. Thanks,

         Linus
