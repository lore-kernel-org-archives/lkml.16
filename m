Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDD524338F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575091; cv=none; b=uKLUUIjctYN6QL11FjJm7nYGgXChpE2vSgV/JyjcApuRmcUZXpwMuub793vYKqwKKBd4LMGE2lAPK66g+bZdPQiFB5X9fP5a+Nk7auF1Dvtv5P4N18DV+OmCGAFpiE2yT1hhlC8315ZTN7E3ej1NDbT4+iDyP7FLP6VrVrLyTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575091; c=relaxed/simple;
	bh=HlSQboCqp0PnQ00GB+6CCKMVwWcrMXPm6kbrM95SHaA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iDIUVsSClALjN0BME0JgPDC5gU4qB+KaPwxqJYzurBLsECrOWz6amFui+85/1fLzINHvhOfD2uSnhAqGLp4+cvN5Pe/OzAf2uRfWJMd4xdVADxYpBvpfnkMy15kwM3IHWw7YAdCjsnMlqkIaWcinqqjY70fWFN0Hl8AtlT73xAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SVbXxblB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SVbXxblB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d64026baso35479165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749575088; x=1750179888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn3PhM+6LELPC5xE451c7krwbXmvn1wLfXtY2hbkuXk=;
        b=SVbXxblBIqyRuydR4o6N4iLjEKdt7DPra47cQfq1vzeqCO6YtnSY9iiNodN4NOBLuu
         S0N9Pp3Hqc5L9DMinY9MeWkxtvR8Od/plmEZboa5v+9acUFSsBeNMan8kIPlLYJ+d5xq
         p6LKiUiWzrOMhfnFXbVTLd/oT48awtWtsKbiTebBnvau8cBak4TuCORRHGkRbXULTi3E
         7fpiv2ndhWTv23sfqQkzW8GfrgcF93rQQ3XqbtRTVFjL+oxtU9n0ErYEBRi1VNLm5+Hm
         0CdR8qm6W47gVbnr42gjb0MLelGq4vR4USK1a+TEI73VqwZALIfo7xqXT7V756pdE3So
         BWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749575088; x=1750179888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn3PhM+6LELPC5xE451c7krwbXmvn1wLfXtY2hbkuXk=;
        b=Lw81+pNLETCnPFDg+sZVH0LI4dCnT7FBCArhwROlGDH/m1NP8LZDEPBb2CXhq6javk
         ChgCRDPEIWhJKtMxb6qNQXi72jPliNAcyNCZbTumUVGiSCIyizjvCbbIUny5pwrLgWWz
         WYfvBpU6N8BZXY1WZZUxum834mcLfUDLXYPel9ZIEnZ9zreuMAvtS2eCgXWRWzCsL+Pq
         +42HN+IrO16B0C4aNbq5rQkA5O0eehhtTUCvluJ+7+P9M4Mkt4TWKe2zIFs/qTRq9F+i
         kQWqczNcG6fJ24O/NkkD/wKjmetRQYco99uTs0Vk+9GHofdZC2tlizVoxMeBMwz3mhpM
         j5iQ==
X-Gm-Message-State: AOJu0YwmnaKB8bjpRejHup8xNTfhaNweTIISJtTS0n0gvw33G7xnQFCw
	ehAaxoQv4e+c/eka/pnxDr8B0nZoU1LWZmRIwq2HVCqvKoIl0NeqyBVz8CW2F6TIhrV/D2plUcw
	QNo3I2lMx6y7R6w==
X-Google-Smtp-Source: AGHT+IGuoHKyepOKuCopPSY2XL0HemV9xoMey65JxzRCECFk56/te0vuTyrZ59WQnTjaRIsbDfaWdtinm9UG+w==
X-Received: from wmsr16.prod.google.com ([2002:a05:600c:8b10:b0:451:deba:e06f])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1552:b0:442:e03b:58a9 with SMTP id 5b1f17b1804b1-4531de836c9mr33031645e9.25.1749575088123;
 Tue, 10 Jun 2025 10:04:48 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:04:46 +0000
In-Reply-To: <20250313-asi-page-alloc-v1-0-04972e046cea@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250313-asi-page-alloc-v1-0-04972e046cea@google.com>
X-Mailer: aerc 0.20.1
Message-ID: <DAJ0LUX8F2IW.Q95PTFBNMFOI@google.com>
Subject: Re: [PATCH RFC 00/11] mm: ASI integration for the page allocator
From: Brendan Jackman <jackmanb@google.com>
To: Brendan Jackman <jackmanb@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	Mike Rapoport <rppt@kernel.org>, Junaid Shahid <junaids@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Patrick Bellasi <derkling@google.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu Mar 13, 2025 at 6:11 PM UTC, Brendan Jackman wrote:
> .:: Patchset overview

Hey all, I have been down the pagetable mines lately trying to figure
out a solution to the page cache issue (the 70% FIO degradatation [0]).
I've got a prototype based on the idea I discussed at LSF/MM/BPF
that's slowly coming together. My hope is that as soon as I can
convincingly claim with a straight face that I know how to solve that
problem, I can transition from <post an RFC every N months then
disappear> mode into being a bit more visible with development
iterations...

[0] https://lore.kernel.org/linux-mm/20250129144320.2675822-1-jackmanb@google.com/

In the meantime, I am still provisionally planning to make the topic
of this RFC the first [PATCH] series for ASI. Obviously before I can
seriously ask Andrew to merge I'll also need to establish some
consensus on the x86 side, but in the meantime I think we're getting
close enough to start discussing the mm code.

So.. does anyone have a bit of time to look over this and see if the
implementation makes sense? Is the basic idea on the right lines?
Also if there's anything I can do to make that easier (is it worth
rebasing?) let me know.

Also, I guess I should also note my aspirational plan for the next few
months, it goes...

1. Get a convincing PoC working that improves the FIO degradation.

2. Gather it into a fairly messy but at least surveyable branch and push
   that to Github or whatever.

3. Show that to x86 folks and hopefully (!!) get some maintainers to
   give a nod like "yep we want ASI and we're more or less sold that
   the developers know how to make it performant".

4. Turn this [RFC] into a [PATCH]. So start by trying to merge the stuff
   that manages the restricted address space, leaving the logic of actually
   _using_ it for a later series.

5. [Maybe this can be partially paralellised with 4] start a new [PATCH]
   series that starts adding in the x86 stuff to actually switch address
   spaces etc. Basically this means respinning the patches that Boris
   has reviewed in [1]. Since we already have the page_alloc stuff, it
   should be possible to start testing this code end-to-end quickly.

[1] https://lore.kernel.org/linux-mm/20250110-asi-rfc-v2-v2-0-8419288bc805@google.com/

Anyone have any thoughts on that overall strategy?

Cheers,
Brendan

