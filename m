Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED21CB518
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010818; cv=none; b=DVXlHr+IZWwwf6dyyI74XxHpTb9gTgb1kyjLjIan6BBjKENRgHF0M9/jIG+vBdm0RVSkMa/jG7XCS6MmIe3QtBgYgQZfseQXgAvNsFgeAtM1SQtL51ehSb5KwGqS3gUD1+XEf+L7YoyLp376yHMqWe9vN+6YKxqBPQhDksHwjf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010818; c=relaxed/simple;
	bh=M0JM/iagUnyNnadh7PX4hbYGXfsli6u0A5pI6J9XwVs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dussb7Mo1zpxVZ9rJSWUfMqC87xL6hm0Zz/P1oDAJi4HuxTinMYOiT7O2qQgNHLNoU5B66nVrV9fhf3d4NcQoRIeAyPRi1eWD4Htr9z3YIAJBPNRSlMTwKORZwFSq+fHiObjZGUNqLNukFCTA+/UcHoqgWZHbEt1Tjt8w+Xh4wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UGS2n06M; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UGS2n06M"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-310efb64693so23256a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748010817; x=1748615617; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uvu6aXDIrLF08vsxpzyNfXk0GOFzmWSaZdsX/BEX7c=;
        b=UGS2n06M5/05ZUKItqdnuGPEzmo5dJVjlLUB3D1caODAOB+jKIETCgx1+O6aUiA/oQ
         5GjzTv57ve4j7q1asD/bPaXFmgO5NYGTBtTLcDvAPBAG3DAqg44DGdk+0cnkZbfeuuQU
         dZLfRz+SnHakvMSmI3Gymt50xhywAhJ5KngCpXd2KLIVFsIsjqdL3MvTd8fRUPgk6g6f
         crqHNuEPL6QBfB0KDZ/NnT1LhGXZoMrA4vi/zvcONk6CNlJqBtcqkjyZall+guv04GxF
         mq6QAIwK6HRjTPYTAPC9X9gyhLz8fI6BTod4q+GdXgVfaYg2icFqxe3q7huE1eA9CEgh
         bquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010817; x=1748615617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uvu6aXDIrLF08vsxpzyNfXk0GOFzmWSaZdsX/BEX7c=;
        b=ZdlnZF408/xC4ZwKYH0jXliGu0ubpMmziTzfCxw2dZnjAtkbzwe6DndHKrDOODLSYl
         lxbyv3jeu3KK40hr6lwWEaAXik+ff0RAsudnQ5E5zF/YeN/j+RYMRVZPJWCZm8BiB4dZ
         wnCmge/eMG4+dWPnL63KQ/g+D/GTMMKdg7iJVlZOMEszlZcFQGAq92tLxc/cS4xFVz5h
         2qgqKRzEgDTtid+RGcu9yVw6mX8+ioqf7NNlZ8Ql6ZLghx3/t5SFd/n9mdM14hxhvF0K
         wHtQXndev4wC6vDJgXSU3fpPt7DgH4c329fjqupWq/k0F3N9Y63+PdSdp50C1VG4IMyv
         W6xA==
X-Forwarded-Encrypted: i=1; AJvYcCWQLJLaEWcw6A3Khob0EcHXS1y8aRTtVFuHAprSmSynoOXgNqr7OKiZitCFHUay/noh/7EwvQL8bjld5GM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6Jy1qlH6YwwOjURZOwwkIX2x7gREi3d0QxSC5wwokqu9xgvw
	QLQ7cSQS652902hTH/XMOCAY8dg28V7PvZ72PZudSibIO7si6J+9XP1qBtkJZi6exvSfVnERpPw
	4A46/6Q==
X-Google-Smtp-Source: AGHT+IHsZ0QnOLBFT5oLqgFlsou+V6RqzdnkAMpT1uyTVqCC/FSYHIecluEf4Yy5p3wiVYxCHPutaUGV15c=
X-Received: from pjbmf7.prod.google.com ([2002:a17:90b:1847:b0:30e:7b26:f68b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1846:b0:301:9f62:a944
 with SMTP id 98e67ed59e1d1-30e7d5ca287mr50858908a91.33.1748010816755; Fri, 23
 May 2025 07:33:36 -0700 (PDT)
Date: Fri, 23 May 2025 07:33:30 -0700
In-Reply-To: <2c52daad-0b64-48a9-8e73-d1aba977993b@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com> <20250522235223.3178519-14-seanjc@google.com>
 <2c52daad-0b64-48a9-8e73-d1aba977993b@amd.com>
Message-ID: <aDB-2lcq4jJm9-OV@google.com>
Subject: Re: [PATCH v3 13/13] KVM: selftests: Add a KVM_IRQFD test to verify
 uniqueness requirements
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 23, 2025, Sairaj Kodilkar wrote:
> On 5/23/2025 5:22 AM, Sean Christopherson wrote:
> 
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	pthread_t racing_thread;
> > +	int r, i;
> > +
> > +	/* Create "full" VMs, as KVM_IRQFD requires an in-kernel IRQ chip. */
> > +	vm1 = vm_create(1);
> > +	vm2 = vm_create(1);
> > +
> > +	WRITE_ONCE(__eventfd, kvm_new_eventfd());
> > +
> > +	kvm_irqfd(vm1, 10, __eventfd, 0);
> > +
> > +	r = __kvm_irqfd(vm1, 11, __eventfd, 0);
> > +	TEST_ASSERT(r && errno == EBUSY,
> > +		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
> > +
> > +	r = __kvm_irqfd(vm2, 12, __eventfd, 0);
> > +	TEST_ASSERT(r && errno == EBUSY,
> > +		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
> > +
> > +	kvm_irqfd(vm1, 11, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 12, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 13, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 14, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> 
> Hi Sean,
> I dont see any allocation for the GSI 13 and 14..
> Is there any reason for the deassigning these two GSIs ?

Yes, KVM's rather bizarre ABI is that DEASSIGN is allowed even if the VM doesn't
have a corresponding assigned irqfd.  The reason I added these early DEASSIGN
calls is so that there will be an easier-to-debug failure if KVM's behavior
changes (the racing threads part of the test abuses KVM's ABI).  I didn't add a
comment because the helpers already have comments, but looking at this again, I
agree that main() needs a better comment.
