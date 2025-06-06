Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B870823
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227440; cv=none; b=LlVKNhrYyJEas8YNWxmP/fvJ5QIsKtk1zHfqkhbniF1gICzqbtGMQPkZay6+bgxGAeIrslaPjVPYiqnGAUr07UB6LTA8uMtEP9xhxMe5KqNRNd39PoevXmHkP4jNOxc7ZPHnJYh5HkX1ViS2e/RVMRjCPDI6KIOayeqI0hgnbMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227440; c=relaxed/simple;
	bh=If3SHFV9BXuXwcKjic0mO7s+6R902Ahr/7djWF8FbuQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kc2WCqlasOcnNEPYpaApSonxOaejyoi2M6pgv9xj8ZYIwQQBBYqstN8Tj83daO/hmyEBLJpEO0GcCXvmbuAlZzFHVIs1mKvypl90P3dc13tZQwO2NrhxKtx6hg4wWqnHrQ0fWm/iBNv5obWPP5gnjb8IuhyPFOLrd3K5j1cd/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mJ0ME9Hw; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mJ0ME9Hw"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so1962654a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749227439; x=1749832239; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeZDoSbBvqkhPAnxH1AxtEkHDzzgin1oETJTbTd+Zhs=;
        b=mJ0ME9HwFOS8xYirpNsRajmu0+OhLCrV38244snO4KUQm57GazPQ+1wEaoX2dTsVKg
         I/o9dtxMDYmzTdl9v9CtOPEjDmPfY802gpo/DQSevPANV9YKsgDKpb3MexBEH7Lrk390
         At3wgzt2WA/GDAK5/64gblGtLOpD83I2FtoXZOeux/3ufexRsJwSAuwXxx/VhNEJZBIM
         CToyOAx+vBxloNnqAMGLabtV2rvXR0WPt94adzXCHZMIMplLl1xB2CyTBbCpmxpDLHFd
         OiZQ96rJTjO+xmy2yx8vgk6/+lSvuOqHV1EGPkbcdMh3+mjuFK/hEnwxek0310H+b2rH
         vv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749227439; x=1749832239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeZDoSbBvqkhPAnxH1AxtEkHDzzgin1oETJTbTd+Zhs=;
        b=iXZw3fbp4N0xfJWxwdRkbUo7e4olSwvR2ZZnnaL44eHAslUjCuyFRRPdHXNzMrdKMh
         Z+pspOldlCPhJYpSzQxoXblT3tOH1V7+Mg7XBvvqQ2vCCRIJLYX3fpKy9XMjVJp0Oa6a
         TuiNzDjEXc5JCMHXs7niYMWntosyFF0FFjj6WMmJzdwOMGykBGsyNmfcfu5GUZ+DsQHs
         +P/fnW9N1AnWX/K0kDoY73uY2uCxizEGrcEOwgYRYOm2H4B2evLIZS1WnaURgz92tB0q
         idfN7tyL5m9GOmGMbBcuz5dgXF2gA2ap4+aRHD5Ff0atdKc4McAwSJxxIroXMfksUJkj
         pPsQ==
X-Gm-Message-State: AOJu0YxvYMMsxbEL6DY+b6Q57AFpJbj3vpJj9Mx5ibdkmk6cJUjcmIqV
	Z3slBB/ulxh4hXjkl3bM89eZYjKyzak63rvHI2g8IP9PRtbdMMMhw74dXr+E/nG0Hppye4bkE6A
	od9NqPw==
X-Google-Smtp-Source: AGHT+IHke24X9i3QXxhH+WOCf5tN70TEkBtw4F1fB6ZHJgw9mRBnHIQUbobGqbQD12aEDHqeBnktZkH7jjw=
X-Received: from pjuu14.prod.google.com ([2002:a17:90b:586e:b0:311:ef56:7694])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d88f:b0:312:f0d0:bc4
 with SMTP id 98e67ed59e1d1-313472c04b5mr5729832a91.5.1749227438821; Fri, 06
 Jun 2025 09:30:38 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:30:37 -0700
In-Reply-To: <20250401161106.790710-21-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401161106.790710-1-pbonzini@redhat.com> <20250401161106.790710-21-pbonzini@redhat.com>
Message-ID: <aEMXrbWBRkfeJPi7@google.com>
Subject: Re: [PATCH 20/29] KVM: x86: add planes support for interrupt delivery
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, roy.hopkins@suse.com, 
	thomas.lendacky@amd.com, ashish.kalra@amd.com, michael.roth@amd.com, 
	jroedel@suse.de, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 01, 2025, Paolo Bonzini wrote:
> Plumb the destination plane into struct kvm_lapic_irq and propagate it
> everywhere.  The in-kernel IOAPIC only targets plane 0.

Can we get more aggressive and make KVM_CREATE_IRQCHIP mutually exclusive with
planes?  AIUI, literally every use case for planes is for folks that run split
IRQ chips.

And we should require an in-kernel local APIC to create a plane.
