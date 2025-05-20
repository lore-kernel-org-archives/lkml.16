Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABDF2571AA
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759706; cv=none; b=bcb/ggvLvwNptI7aSzGui0p5XKCufTUdB/b3iEfmliHT0Ln0KZMcWhWSPhykenIfDzjWkngcZx+91oykGE9eGBC4QRNlkbPWT+2WfhNevbSMDKqYfXsYdLAKYN5viEVcISW+Z9jcyNZHNS2PlI9SbrcO9bwTsnOIPunhz7MQ6rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759706; c=relaxed/simple;
	bh=VKOLyd+fTgXxi0xSU7seE7QvEy9DHjhT9JyUqMZjDXk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yja5wjFqCsZwdeClRvdAVIF3d9w/0d9S9OaSz5uYTsibzNVb1Td25HhGT+eqqNMcwqczk5EuiNFiE6KYh2K7FeqyNq8ovpOSRPZ04zzo7ker3cCdhPt0eLgzSIRnwTREGNrkn3Ulwf+d1wZdf8fdDUjDXsSceoHb3hx/s9TLG74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MAL9HM2n; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MAL9HM2n"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30e8425926eso6330332a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747759704; x=1748364504; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wcl6TqUwD54tFkNVg+Ri/3Cun2a33c9FWRAhj6V56jQ=;
        b=MAL9HM2nG1K00TOdPGQrZMeQdy+sdujtHwdyk8bwp0aI9KalteiNX67XmAIs4Osnnv
         kGHhYbzi+jamSyQHP+eJ6Rzoc/RMGbmcSw3r2BoTrXHVRvI+IWi42BVnVTHEC1/OKRjK
         NW1XeGs2QNp73agFaMJtZ2Qru3L2QYP5n3pR70PevR+yW38HV682xxBaYg8q/dhaTj3L
         uEeFl/I4p7gq/FewAVotkSETtLS87Zho26NA5PfOd36hOuAr73jHQdyz4i6PQGvraYnF
         FzI/zlktwm8WGshF3G0q9ByYjQVvvNsixDomALSjMCxjtR7JdwbksLdrV4OsLid0RcEh
         pbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759704; x=1748364504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcl6TqUwD54tFkNVg+Ri/3Cun2a33c9FWRAhj6V56jQ=;
        b=v6YRx5KJOkHHYOUB5rgri9dJiOdUVUL+z5eVVv2xbNjc3aS4BgnSSLwfiRbrhQ+sEb
         3bG3lWEpks1yXoXBf0sS4s1eHHICJGzYBAdpKkhmC3zEj6IrFTHuLmG+6AHt2CBHLcGt
         UkqbWs8zGlJzLy4K8fg2XoNmd+XXXH2Rj9qp2OdoEgp/RqBMUtoe1/1+sviVBIuYRB0Y
         JCm4ajr4xM/mj1RXJRIGn6cuw9iPY0H7bqTiBjAL8iUjuJcNGnT0Tux0nGj/iEtuZHzG
         e6XjUcqqo+bCLJ2k04flsP565nJyks80aWJnBY44Mnam1ARdptE2gSwI3r7D21EnRRfP
         CMMw==
X-Forwarded-Encrypted: i=1; AJvYcCWqZwRpMryzQOQgJ6LEAa1Kl/dUOw25uI5d+YaBFgr9Ci2TTpGMuT2Dfv/AA2laweJmw01uUZgWiRkAHmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyngPzsQK9MO/tI+AjfZeN35wMYQK6cAI2uAMLTr8rZ37hrife/
	rUEheDpiYDvo6z07jOtGsR8mPXMOStlFb8GreUb3cEp7y49vF+otk+ehhd9rCUWtyaPs9KqxENu
	AGA5OqQ==
X-Google-Smtp-Source: AGHT+IHWuapVqe0x+t6XHz6AnLhy46gF3CLB1xUoma8BHmFx0DTfNmTB/vRYZiHtoCJbxgU+GsCHbokk230=
X-Received: from pjbee16.prod.google.com ([2002:a17:90a:fc50:b0:2fa:15aa:4d1e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33c2:b0:2ff:58b8:5c46
 with SMTP id 98e67ed59e1d1-30e830f7b18mr26615931a91.8.1747759704142; Tue, 20
 May 2025 09:48:24 -0700 (PDT)
Date: Tue, 20 May 2025 09:48:06 -0700
In-Reply-To: <20250508184649.2576210-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508184649.2576210-1-jthoughton@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <174767770635.2666521.3146495513676301743.b4-ty@google.com>
Subject: Re: [PATCH v4 0/7] KVM: selftests: access_tracking_perf_test fixes
 for NUMA balancing and MGLRU
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, 
	David Matlack <dmatlack@google.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 08 May 2025 18:46:41 +0000, James Houghton wrote:
> This series fixes some issues with access_tracking_perf_test when MGLRU
> or NUMA balancing are in use.
> 
> With MGLRU, touching a page doesn't necessarily clear the Idle flag.
> This has come up in the past, and the recommendation was to use MGLRU
> generation numbers[1], which this series does.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/7] KVM: selftests: Extract guts of THP accessor to standalone sysfs helpers
      https://github.com/kvm-x86/linux/commit/d761c14d902e
[2/7] KVM: selftests: access_tracking_perf_test: Add option to skip the sanity check
      https://github.com/kvm-x86/linux/commit/26dcdfa01c33
[3/7] cgroup: selftests: Move memcontrol specific helpers out of common cgroup_util.c
      https://github.com/kvm-x86/linux/commit/3a7f9e518c6a
[4/7] cgroup: selftests: Move cgroup_util into its own library
      https://github.com/kvm-x86/linux/commit/2c754a84ff16
[5/7] cgroup: selftests: Add API to find root of specific controller
      https://github.com/kvm-x86/linux/commit/38e1dd578142
[6/7] KVM: selftests: Build and link selftests/cgroup/lib into KVM selftests
      https://github.com/kvm-x86/linux/commit/b11fcb51e2b2
[7/7] KVM: selftests: access_tracking_perf_test: Use MGLRU for access tracking
      https://github.com/kvm-x86/linux/commit/d166453ebd29

--
https://github.com/kvm-x86/linux/tree/next
