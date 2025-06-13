Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE5818A6DF;
	Fri, 13 Jun 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828322; cv=none; b=lKWgZyOED3Pj/Wi1bP2kTpphnBhXcYlASW/gBnky7mQqLM5upySL+7U+pS8Sr6q+oHTSdT2O1umG8F+P1shdTBo3AXTPrp6Ql2kgoir6dYWI2A/i9KvkTneULS9N/bzBsvKu5ufDKuDHlb12txWCmZyZbkXQqdbGHKkGqtY0gak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828322; c=relaxed/simple;
	bh=x0q3aAgsaGr1YImdUr5Y7Vj0uSBEzksUJDuAngb1phQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PmYQyey+Y19QYZJ2luQqrx1BlsUeKyWPO0A9aDD7khXOGDdrjaf41AolfGK/KC4IC2okhroNjnXx/F+76phLeI6L2sepr4f5y0XHv2+FXX17fqLPFZFR7S0k2EQwFEOTUFrV2zmzJ45vqqKxeaRqT19gMz0oWbUGHMQ2anKKbHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0V1xnaO; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0V1xnaO"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e817b40d6e7so2121270276.1;
        Fri, 13 Jun 2025 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749828320; x=1750433120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLBwQeoFr9oCLfiw/yHROpbDBnE11hBXVxYow8WnAKg=;
        b=a0V1xnaOAu8NHUISjEJbOfEEhBxr7bVd4y4K1QY+xb+CsH67HXGu3DO2WHZtxtqhLX
         fe5lfdd2D02bCj3HZEpXzeAfIdIqJDm2YTBgKhwt8ENB1qAnYzICdVVZ1/NrBzu9xG3I
         O6JIFZ84NmDQNePoSeeMe0pqE40j54pRTpiBfzWGrBY/m7gV9KMNl30NDTrgh7TTNjJA
         EKZekYmZDJKWI3q+Wyji4/aiX6QvP9phcjf5o5Ynh0a67KRRnir8WErEH/aLTf9hL1vh
         JhT6paozdOPDZAqUK9tRX7GDOax2jEsbemwZ7IJuXl2urAUDZecenwkKT9DoxIpNFbSN
         BXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828320; x=1750433120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLBwQeoFr9oCLfiw/yHROpbDBnE11hBXVxYow8WnAKg=;
        b=tpehwPg8/X8vb/VmtPf/qVu5dFb2lPP695WnXUSvoagxBwXmsNJkNyRS4YiByM9RmL
         oGqaBtTCjPbrAztHHFP2wF4WDzOfDtUKx6242cIHBPvnm4g8VBZugaNmh8MmoHZi1OMi
         yZitInD87kHSsOsgKrDmP7ih7h9ZcDjExe0UcsTn0Waf80yZBkuZvXG3HNTwUc42T8BF
         GIQ6DEblf2cv83TJtnwEyGU8grkNPg4UPi8pK7uOh+NkS9JyqRFpj3XunBPYNqCFWOgR
         whe+kvyi4B7jtVyz8i4R4qy3zOZm3RQySNWLfI6t3knMf7e81PZVmacJNoDME/+ctrn6
         iKgw==
X-Forwarded-Encrypted: i=1; AJvYcCVaDiVEmQMuLBbK6eUhNZgg2DAR9XfZPu9wIPmp+N0ni/OwP1AsTN57cuM1hONmwtgC577on8Fo9RS38y7L@vger.kernel.org, AJvYcCXNHZh5nfyoBsRCnrFIcSMxsVBSX8g7+Sc0jCcKYpcHrcw4GLO9jZgnMbrS/KQMhzyZFLuT0WUjroY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfaBweEM0ezucGlLiFru7DAZtpxHMEAnf8ViScLr7W9hDu8kJN
	W6wHeRt23xLdIrNc03h9of0d+F4NYLY9tlXpxpUx9K4nA1LTf5Dq4Dlh
X-Gm-Gg: ASbGncuLegFc+DYp8YvfjHEZygSfuwyGW1awXa1jtCG75ZdKlbF0yYJTN30OcJsm9MN
	Wk39rEa0gHvKYQP14ihZEiD1KtX7a3AKR3X3oOuW999GNF2kHPb1P2sXqHBKoz5OJhcJHCHHmyd
	CNiFJZuQszZYYl+WrWL7H6V8chVMHuph8+L+OMme9dM0IO2bT7hlrsQEe7Gc0w/muy5vemYJ/w9
	wOL9UJR8hqj2fMM+gYytig5siEFfLIf50c1npxMuus/ej+fGMXKBE5G54IkrOWxK4PheYrFDzX6
	ZEFlaDcOy8acClS4lv4OXddHf+Do6wnA8tptbvHPUlR1PBZM4kv7Jv8+tkzb2Q==
X-Google-Smtp-Source: AGHT+IHXDiLtYHaZndPHQeLdgKaaAgPSkVlO6f5fnt8QbVgvy/P9bE8XmqcR3tg67nBnU0fusVEqMw==
X-Received: by 2002:a05:6902:1ac4:b0:e7b:3d15:10f0 with SMTP id 3f1490d57ef6-e822ad5f1e5mr140623276.31.1749828319830;
        Fri, 13 Jun 2025 08:25:19 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:4b::])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e0a6d0fsm1156117276.25.2025.06.13.08.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:25:19 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: damon@lists.linux.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: Re: [RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data across nodes
Date: Fri, 13 Jun 2025 08:25:09 -0700
Message-ID: <20250613152517.225529-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250612181330.31236-1-bijan311@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 13:13:26 -0500 Bijan Tabatabai <bijan311@gmail.com> wrote:

> From: Bijan Tabatabai <bijantabatab@micron.com>
> 
> A recent patch set automatically set the interleave weight for each node
> according to the node's maximum bandwidth [1]. In another thread, the patch
> set's author, Joshua Hahn, wondered if/how these weights should be changed
> if the bandwidth utilization of the system changes [2].

Hi Bijan,

Thank you for this patchset, and thank you for finding interest in my
question!

> This patch set adds the mechanism for dynamically changing how application
> data is interleaved across nodes while leaving the policy of what the
> interleave weights should be to userspace. It does this by adding a new
> DAMOS action: DAMOS_INTERLEAVE. We implement DAMOS_INTERLEAVE with both
> paddr and vaddr operations sets. Using the paddr version is useful for
> managing page placement globally. Using the vaddr version limits tracking
> to one process per kdamond instance, but the va based tracking better
> captures spacial locality.
>
> DAMOS_INTERLEAVE interleaves pages within a region across nodes using the
> interleave weights at /sys/kernel/mm/mempolicy/weighted_interleave/node<N>
> and the page placement algorithm in weighted_interleave_nid via
> policy_nodemask. We chose to reuse the mempolicy weighted interleave
> infrastructure to avoid reimplementing code. However, this has the awkward
> side effect that only pages that are mapped to processes using
> MPOL_WEIGHTED_INTERLEAVE will be migrated according to new interleave
> weights. This might be fine because workloads that want their data to be
> dynamically interleaved will want their newly allocated data to be
> interleaved at the same ratio.

I think this is generally true. Maybe until a user says that they have a
usecase where they would like to have a non-weighted-interleave policy
to allocate pages, but would like to place them according to a set weight,
we can leave support for other mempolicies out for now.

> If exposing policy_nodemask is undesirable, we have two alternative methods
> for having DAMON access the interleave weights it should use. We would
> appreciate feedback on which method is preferred.
> 1. Use mpol_misplaced instead
>   pros: mpol_misplaced is already exposed publically
>   cons: Would require refactoring mpol_misplaced to take a struct vm_area
>   instead of a struct vm_fault, and require refactoring mpol_misplaced and
>   get_vma_policy to take in a struct task_struct rather than just using
>   current. Also requires processes to use MPOL_WEIGHTED_INTERLEAVE.
> 2. Add a new field to struct damos, similar to target_nid for the
> MIGRATE_HOT/COLD schemes.
>   pros: Keeps changes contained inside DAMON. Would not require processes
>   to use MPOL_WEIGHTED_INTERLEAVE.
>   cons: Duplicates page placement code. Requires discussion on the sysfs
>   interface to use for users to pass in the interleave weights.

Here I agree with SJ's sentiment -- I think mpol_misplaced runs with the
context of working with current / fault contexts, like you pointed out.
Perhaps it is best to keep the scope of the changes as local as possible : -)
As for duplicating page placement code, I think that is something we can
refine over iterations of this patchset, and maybe SJ will have some great
ideas on how this can best be done as well.

> This patchset was tested on an AMD machine with a NUMA node with CPUs
> attached to DDR memory and a cpu-less NUMA node attached to CXL memory.
> However, this patch set should generalize to other architectures and number
> of NUMA nodes.

I think moving the test results to the cover letter will help reviewers
better understand the intent of the work. Also, I think it will also be
very helpful to include some potential use-cases in here as well. That is,
what workloads would benefit from placing pages according to a set ratio,
rather than using existing migration policies that adjust this based on
hotness / coldness?

One such use case that I can think of is using this patchset + weighted
interleave auto-tuning, which would help alleviate bandwidth limitations
by ensuring that past the allocation stage, pages are being accessed
in a way that maximizes the bandwidth usage of the system (at the cost of
latency, which may or may not even be true based on how bandwidth-bound
the workload is). 

Thank you again for the amazing patchset! Have a great day : -)
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)
