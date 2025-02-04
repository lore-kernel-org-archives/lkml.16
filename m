Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86914A0B5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691485; cv=none; b=St7vT+sOgx1ols+RXGm4Zsdc4QKGY6Ny8NhBssifqeqc3Xu/pt0ZRHOPXI3E6KbgPXcCUfJrwVqH6jwFhqrIKUDc2ChLhWwkkUBSp9C2cheFy5IaqNcZrPQigwn5iRI0AJN392HoX7M2sCnj71lBxJDpoNMRHXeAu/5PHHA2lWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691485; c=relaxed/simple;
	bh=cnVDw3cjiTiITE/daar9Zm40VwWIQl7hZdv7otL4Pqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cislFlQ1QyDn8RB4IMa6leJsYV6qiih6Qb/90Zoj46LtjbKF7dTVcKnlZoQFSIOMhBQ6xnJUJXHDq6XLbJ5zc+AB0m93y6WoAUgxJxnrCvyCtlTX3/uuCI0TofqxdJ4jP/Xbhn1BqGD6i2kS6SS5AaBfP1yex8xUhiVqp/7mgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1/jOhPjS; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1/jOhPjS"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so16625919a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738691483; x=1739296283; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJBCZCZOW0Nr3S2dBf3Ccdi7LHIAyDv3WEEqT47xNDE=;
        b=1/jOhPjS6pf+W20fb1GcjYdiDWN5HdpE2S0vLirwJfGy718IzH6xtL1W+tmqZPuMaL
         kzSdZvIcKhMvDAbo/ltGgCYAWxGuaZpUsD4K33WF5CpyrHSTrE64c5CcTv18R7brghkY
         lV1J3xCNa+svXWgkwt9j5nOyk8kuKj0LPhFN63hTbatz5GKlfFYbCZkXcko6MFWoIqY6
         5zehV7AN0fcO6yVwCkjPwhoqXjA4YO03cBdCEOhBmWT3JjbD/w825iykT2ErJLx3Qa5z
         +kYEgnAY7Ruaue6CEUEy30gmpOVamJPC+LJUcQCYCJAvlDvrL5VJcJ9rPOclNRYsM1IE
         3VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738691483; x=1739296283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJBCZCZOW0Nr3S2dBf3Ccdi7LHIAyDv3WEEqT47xNDE=;
        b=fb7t3GUPdMjUuOcFCgX9dGLi2dioWESqG2MfM6D5vPqgyerynKwyz7vRi8jXD+Rd95
         HtcwT23te6X7mT+K5sucXlP83eFgAM1uaR6OpftVotFstM+fwbSTjbPzcwlHCz3OFAo6
         WetKcMLFJcY5mMWT5gYy5UiTE+d3nysJ8ssd8AZV2MBiZHtDS0AKud62I188NOCIyQh4
         T0Es9FD76LMFy0Cnh9T8zFmzbUjSCfV7fgdTlON+P2UUR0MxEIU/0p205zMAZqhPjnod
         wXj7PC7Yf226UQPobaP51b9qFHEPrhhNcmX3bp5hPsfNSaBEkTxICws4i+6fXeUNLEAf
         p3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxtfqu//b8V1CKLtms1rgL5iFVVipzBz4MqR2ph59fdL+gU4cEv0W5qjcHVqXO/WyOH/6swPEyjAoOnHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWXJN+jnHRGpgGwZZKFaVjunY2FyTpZ/yRRKwC6xcHusAqRpgB
	rtQJSL+JhHJJ7UVjGPOrZPP4ogl+BOYp3DWtDp1OSuKEblQLM6aH/+loP+if3m3lE9E+UkgIFIU
	3cw==
X-Google-Smtp-Source: AGHT+IGfINEwrz7O16xYGuZacZqT3ThJZwrf5SKDT66rhhbm+GLjfpsajy6lPHn6HcWelahD+5PNYyDHyjQ=
X-Received: from pfbcw7.prod.google.com ([2002:a05:6a00:4507:b0:725:e2fd:dcf9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e15:b0:727:3cd0:122f
 with SMTP id d2e1a72fcca58-72fd0bf3f5bmr38314134b3a.9.1738691483337; Tue, 04
 Feb 2025 09:51:23 -0800 (PST)
Date: Tue, 4 Feb 2025 09:51:22 -0800
In-Reply-To: <a7eb34n6gkwg6kafh7r76tkwtweuflyfoczgxya2k63al2qdoe@phmszu6ilk4w>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1738595289.git.naveen@kernel.org> <dc6cf3403e29c0296926e3bd8f0d4e87b67f4600.1738595289.git.naveen@kernel.org>
 <30fc469b5b2ec5e2d6703979a0d09ad0a9df29e1.camel@redhat.com> <a7eb34n6gkwg6kafh7r76tkwtweuflyfoczgxya2k63al2qdoe@phmszu6ilk4w>
Message-ID: <Z6JTmvrkrLpaJ1nw@google.com>
Subject: Re: [PATCH 2/3] KVM: x86: Remove use of apicv_update_lock when
 toggling guest debug state
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 04, 2025, Naveen N Rao wrote:
> On Mon, Feb 03, 2025 at 09:00:05PM -0500, Maxim Levitsky wrote:
> > On Mon, 2025-02-03 at 22:33 +0530, Naveen N Rao (AMD) wrote:
> > > apicv_update_lock is not required when querying the state of guest
> > > debug in all the vcpus. Remove usage of the same, and switch to
> > > kvm_set_or_clear_apicv_inhibit() helper to simplify the code.
> > 
> > It might be worth to mention that the reason why the lock is not needed,
> > is because kvm_vcpu_ioctl from which this function is called takes 'vcpu->mutex'
> > and thus concurrent execution of this function is not really possible.
> 
> Looking at this again, that looks to be a vcpu-specific lock, so I guess 
> it is possible for multiple vcpus to run this concurrently?

Correct.

> In reality, this looks to be coming in from a vcpu ioctl from userspace, 
> so this is probably not being invoked concurrently today.
> 
> Regardless, I wonder if moving this to a per-vcpu inhibit might be a 
> better way to address this.

No, this is a slow path.
