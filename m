Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DADA217F35
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779604; cv=none; b=g8WzHoXvf3yx2v9TOiHT7t7pE9VIPfe8BdkblxXU2at9dGEIaCJvFFB4EF/cJQR6gTCJGbgPwmek76PfrsR/KmKrSCeUzA06mRHWSpm9ejVWMWdtuDY1CFo/6VPh0cGtEYZtP7LstvOo6lQBNmqMeMq0b0XBcqIqIUrVCPxwr1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779604; c=relaxed/simple;
	bh=yAGEzQUXdc/wVqTOY22PEJhqYz72ZGCmkjww4aZKXSg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ToxYVjptOq8yk+q+jpV5ye4id0QD+bBZyPCYDmB8hTmDY7IShstWlrQoGwv8b7rLVzO581niJr5wTkFMIXTrDNtEl7O18u8sc0XS4W5aZLCXpPe6LGO8cxMz4JOICVK7DlSVnsVhQ6GYndRAbcNgU9K9MV2cY3/8BXci5dxH4F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yPSITkon; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yPSITkon"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b0e5f28841dso4229463a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747779602; x=1748384402; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8HKYrw1mX2rWYU9hhnTeFvSQNlJmWd9SuBazr4xA8xE=;
        b=yPSITkonmFP/ayz7YCCGBVhCVQUG2m+821CZclbqmtnFUpMXjJMylWsE0Tgc+5QN9j
         cqTwHYCKEnuGxBrK1c1cFPhpAZLv7xyImcDrIx+VazeSSJjtLPe0H53tEzF8774eZLy9
         qyN3wA8T2oR66rCn/0e36FioO7VaLMnO4TdISsixaD7zGSr1Vid8m8LhigiMgPuFpgk8
         qTjUuAsvCl+0xmno/l7HSBB7jgLGyUQuUT3QUQVmdH+2390tQQLaUNat2bc1EpQ7seDG
         Yy6aSKlWrHMGVQF7En6gUlcaRQUgQoMCw8IK+qZULVUAy54yIQXqvvMiCvckhcFFmeMe
         sNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779602; x=1748384402;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HKYrw1mX2rWYU9hhnTeFvSQNlJmWd9SuBazr4xA8xE=;
        b=mR1BqbXb1QIbyRvn8rb0iqDJIDavuTgz1E4hmeMM/7bCiCeVzDOg7T4g52VislPOMs
         H/SeEiQhn2MUbsDYZndpxkxCnhJX/6+x7T1EB1Eh1Vb65k4KoLZsOEBqE8iGTCRdjyVL
         ksSp7ux10cqsGPDGqlxH4i+r0M4S2wcZJEcGgTXiJvoKtxagwRSs0MW++DrheGNlJ2eU
         n3B6Ul+yLmyz3KI8vq3GuJr2pwrIx1kJzA/oATNsZA+qr4EgfRfbIoTajYUIFUTqz9Z+
         IIg34guYExxrWJgCRQ/IP1inRPWINVN6xJqZVTC6HE5yWRAZ276Rf/xrsTFfh+XWHQrz
         Gd7g==
X-Forwarded-Encrypted: i=1; AJvYcCVt2uvLuCbR9mhT2T4ITB3mZqxwgFqQG8YrYdJR/tOBc6MrWsByeTsE03bFIM5sgJdgWrLkiucPvFf3Bu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy7Mo1ExaZ1VV+FhSaJDMTPNQZ6mpTYF3GoQc34wkF/6jR8ZKY
	ISC4Ui4J+W0vM3xUapINTF93xVZXEspwLUebok7E0e4y1PmHdN1NZ4wlhSZPmwueIn4IkGn0cHX
	8wSMtFw==
X-Google-Smtp-Source: AGHT+IGm0Qd18FrnDfhlG7/JjUl4lMpy15ihv5+w3UyMikyFwPD+eN8+5DcFhlZu44RxRjwOsuD2Z657iBM=
X-Received: from pjoo5.prod.google.com ([2002:a17:90b:5825:b0:2fc:e37d:85dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5188:b0:305:5f28:2d5c
 with SMTP id 98e67ed59e1d1-30e7d558d26mr28473120a91.15.1747779602268; Tue, 20
 May 2025 15:20:02 -0700 (PDT)
Date: Tue, 20 May 2025 15:20:00 -0700
In-Reply-To: <20250520191816.GJ16434@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com> <20250519185514.2678456-9-seanjc@google.com>
 <20250520191816.GJ16434@noisy.programming.kicks-ass.net>
Message-ID: <aC0AEJX0FIMl9lDy@google.com>
Subject: Re: [PATCH v2 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 20, 2025, Peter Zijlstra wrote:
> On Mon, May 19, 2025 at 11:55:10AM -0700, Sean Christopherson wrote:
> > Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() to
> > differentiate it from add_wait_queue_priority_exclusive().  The one and
> > only user add_wait_queue_priority(), Xen privcmd's irqfd_wakeup(),
> > unconditionally returns '0', i.e. doesn't actually operate in exclusive
> > mode.
> 
> I find:
> 
> drivers/hv/mshv_eventfd.c:      add_wait_queue_priority(wqh, &irqfd->irqfd_wait);
> drivers/xen/privcmd.c:  add_wait_queue_priority(wqh, &kirqfd->wait);
> 
> I mean, it might still be true and all, but hyperv seems to also use
> this now.

Oh FFS, another "heavily inspired by KVM".  I should have bribed someone to take
this series when I had the chance.  *sigh*

Unfortunately, the Hyper-V code does actually operate in exclusive mode.  Unless
you have a better idea, I'll tweak the series to:

  1. Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() and have the callers
     explicitly set the flag, 
  2. Add a patch to drop WQ_FLAG_EXCLUSIVE from Xen privcmd entirely.
  3. Introduce add_wait_queue_priority_exclusive() and switch KVM to use it.

That has an added bonus of introducing the Xen change in a dedicated patch, i.e.
is probably a sequence anyways.

Alternatively, I could rewrite the Hyper-V code a la the KVM changes, but I'm not
feeling very charitable at the moment (the complete lack of documentation for
their ioctl doesn't help).
