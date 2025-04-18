Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75962218EB1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996758; cv=none; b=V1aknqthQq/bQurpMIIpkT7y4FnHUZuXqWU7wrC4zDW8/ORd3mA08vkmJi+6T4PuSpN1P2hQ/WbBieJ6wgxNsFtxu/zXD4eMOAw45c1m6+CKu4VgG5QdKoj+mJ/oddkftmiZYgLF37AHIbLHoEUZLjdfcbLpa5y+HUTFQynd/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996758; c=relaxed/simple;
	bh=umH6ywsc4drx9G9NcplmJ0TyaUjkmwExCrK7GVRNt5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MaCx4l8Q8rDhEB43sW3xZu0k7UGk4F6JeBt0gTjsnX1XDf69Qd9raSmVor6LHH3dWkYTrJl9ZAw3bbJ2/LcVgqbV55aLmXKBMzNhTeE0VBoTOvvN7E27xGgBB3NNVMHHU21AxeQKb48BWivSbrBzIAcS/GEDkWcVh4swBtGYvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VT3MPZzZ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VT3MPZzZ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3086107d023so2074475a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744996756; x=1745601556; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JAMiTnJq5wGTimzHorBniJSJQObCz8zh4bLLKuMUOgs=;
        b=VT3MPZzZ3msHT1dZ/LgMoKOu7PthXRi4XQgX2oplccXQv3iA/oYjAnqreKsJhXDPvW
         NYgMmMwlg7bAI+OMZOSnJVnX6bYLt2cR6t5y9m2bYKaCAx1BdpBkB4P2lrQ9xCUu1YUp
         jK3SSdxDxNpzXm2vq8fVYMdylRQiXpRe9iV+rniQLGTdVsOeuiVAd4DPXGOrJBQ6ICZV
         mmkRP8hbixGpBm4htemOKsJOilwLR7qRNZNJ4GNVV2f7pU9HULWijOKsVgwy7/zUukkP
         OE3PGk2FlzbCDVDIaIw/5Ke3P/mjpV9XiKIMu1xlTL24VQzZ3rGb+q4JTf62To2r29mo
         PSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996756; x=1745601556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JAMiTnJq5wGTimzHorBniJSJQObCz8zh4bLLKuMUOgs=;
        b=rTo19G1WmgiPrsNriZTKb3nqnJjaFMAg4NwKCle2HaoRnWKvQW6f+6OArqyGS1APyH
         59EwoMkwMOoGCvyoECbDqCk9O4kMVPr12HzmwflhvpBR+A+aa10zTBzeOIvqXBYODt4/
         GG6iLa2jh35CV1S62kCy4UM3233norFjnQXYtdWSH3K39XwqnDg9ta/CEARhytdKUJgw
         a0Ys0GIP5J73BJfwOgozFqIQdwo7XJ0zZbhQdpWO/KF8MexTPbd1kbwp0b5p2x0YAqqY
         ZPywl9uiCmNwF7k2tinIr+RAUDz4ixWHH+7I1EqcWjyoqrwLwRaitqN0hv6NeD6WrjS+
         dwIg==
X-Forwarded-Encrypted: i=1; AJvYcCXwByW+e8SR+kXZ0R3sU2Swtv1HdSSCITavkvpeeO+9rrpkYnUjxsZ+x4E2rBq/Pxv3ZmLlSwx9QAf4uOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvFmFBC0c3kAO0DdmxJ+8kKe2ZcsyAahSuIiMu/y7zNNhMH+YL
	2PJDIo0hb4dgqvM6ipWqE1zG69FOd57f5ah7cIrYEAmjS8ptEhLKn/iGIp8UQuEvE0FgQHQ3GMF
	/bQ==
X-Google-Smtp-Source: AGHT+IFYpkpjQzZ7Z5ctAJdgsF/swLP7xsl0a2d3B1YurqSDpfIGlQl4nOWEChP8tGh5x1hWI4qHIsV7y44=
X-Received: from pjbee4.prod.google.com ([2002:a17:90a:fc44:b0:308:7499:3dfc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:37c5:b0:2fe:8902:9ecd
 with SMTP id 98e67ed59e1d1-3087bb3e830mr4814615a91.1.1744996755737; Fri, 18
 Apr 2025 10:19:15 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:19:14 -0700
In-Reply-To: <aAKDyGpzNOCdGmN2@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331143710.1686600-1-sashal@kernel.org> <20250331143710.1686600-2-sashal@kernel.org>
 <aAKDyGpzNOCdGmN2@duo.ucw.cz>
Message-ID: <aAKJkrQxp5on46nC@google.com>
Subject: Re: [PATCH AUTOSEL 5.10 2/6] x86/cpu: Don't clear X86_FEATURE_LAHF_LM
 flag in init_amd_k8() on AMD when running in a virtual machine
From: Sean Christopherson <seanjc@google.com>
To: Pavel Machek <pavel@denx.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Max Grobecker <max@grobecker.info>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com, 
	x86@kernel.org, thomas.lendacky@amd.com, perry.yuan@amd.com, 
	mario.limonciello@amd.com, riel@surriel.com, mjguzik@gmail.com, 
	darwi@linutronix.de
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 18, 2025, Pavel Machek wrote:
> Hi!
> 
> > From: Max Grobecker <max@grobecker.info>
> > 
> > [ Upstream commit a4248ee16f411ac1ea7dfab228a6659b111e3d65 ]
> 
> > This can prevent some docker containers from starting or build scripts to create
> > unoptimized binaries.
> > 
> > Admittably, this is more a small inconvenience than a severe bug in the kernel
> > and the shoddy scripts that rely on parsing /proc/cpuinfo
> > should be fixed instead.

Uh, and the hypervisor too?  Why is the hypervisor enumerating an old K8 CPU for
what appears to be a modern workload?

> I'd say this is not good stable candidate.

Eh, practically speaking, there's no chance of this causing problems.  The setup
is all kinds of weird, but AIUI, K8 CPUs don't support virtualization so there's
no chance that the underlying CPU is actually affected by the K8 bug, because the
underlying CPU can't be K8.  And no bare metal CPU will ever set the HYPERVISOR
bit, so there won't be false positives on that front.

I personally object to the patch itself; it's not the kernel's responsibility to
deal with a misconfigured VM.  But unless we revert the commit, I don't see any
reason to withhold this from stable@.
