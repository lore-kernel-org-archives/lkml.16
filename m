Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E6D2253AB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277558; cv=none; b=MB9qYSyjK2VfShuN7Z8A1J1Xzv30tNbreUgx/aogB/lYqee2YGTSFJPjndsDMwnldu6DwqcCnP2L3dVAmwf2WOIhQ9B/a1KYzdCCzrTFuSaJ5h1zqbON50sgKPMXgFhxL4QX1MMPtz81Diu1PjrDR9eCMXECxwCOkhqJhzBvO70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277558; c=relaxed/simple;
	bh=qqVroYbCw/qk4BzecjdxS8mEuj1JbPnhJa8nZ2QrHKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grlR33HlpGUlemgPmC5i3eb8Hby/SHBC1fnneC3F9z6sx4kRQwwedYVkYwTLYjlVW/yBdossHLICPk5jv0tdRZS2LE6vUPxJLnx6E6TmBUOqtnxXlxDqNLJtunu/DCYpByxKRQStZonTgceUHYf7/YLLThdtuRB3LeL/0Qy0QVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=edJ3e2ph; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="edJ3e2ph"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d54214adso29190925e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751277555; x=1751882355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XXGe7X0iZgUmvVFaQXoM7fBhG4zn/0blC4O6KCudJRU=;
        b=edJ3e2phVvGBqn0hROhyeYBcmmEpW7/FXv7euCceWCAX/9mopX9eHYD8boyxMCO9FC
         PLNon+p3WsLY74RCi9H6hyhmwL/26qrHYHlXLJ3aLlq3ByhJzpgs6nZDE93cbztqiL6q
         7YpXJj3sgBmxJiW0TQYrO/8xE5NT/OmHCuCJ3LaVquJ+ROR0Su4SUeaQoZN1sl7MHoag
         Ye1S+mZ5i8il6WVyXP0l6cph5BPka547jkbi0aNDdA6+PLi/uFUfbIFBsNhxrXEgJd3d
         BPfMR19uFI9oGADnv3RqjAy4r0SHZ1Ks8Fbvd8KdzMpscZjEuGM059gSL78HHEkQH9q/
         FnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277555; x=1751882355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXGe7X0iZgUmvVFaQXoM7fBhG4zn/0blC4O6KCudJRU=;
        b=XeUB0ZGr55bwj1eyrR+Ro62u8+/sgjNVZUyv9s8dQpymkdFMSxU3ZGfPOX/xlpUGhN
         pdw3LautU1zjjOxsCJ0z2fEWfB4HqidpTIkX+OXl6pS2LbdNLj8hEdfwt7O/tgJ3wQzv
         ulKDnjfaMTLMi/mkXawlyenIurhbm263NcJSVXzEstoS1gg8FJZhYzPwcix/6rmThBSC
         FyHPelKXpgi0gKTGrK6xQzHafaFBaZONQ9o/5sYTBHmqzRvYO6OoeIwlC8H8T2sBrdWg
         J5qilTEIQoJ3c/WmCGjUW2uH/oaICX/ISV2CECui6dnmOIimrUU/BYdhtUiEQWcsbKQf
         QJCg==
X-Forwarded-Encrypted: i=1; AJvYcCUzJwwhQ2NVKj5Fc/o0d1tu78WWLHT1xs3sc0cXLynk1oBC6NCqeXHQI4SgR0iIg4hWcvBiBF27rfsgPfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAsUH+twIMD2uG3k/JewXcrlHCjuN3b/4dQ9Ly2LCsmjS7Kk+F
	WmXjszlTCc6F5kifD2ijdB6mixg4LL+MDPfR16T0423BcpRiQONWxuDlG+ajFXu1og==
X-Gm-Gg: ASbGnctrkJBDTOuef71D+BibzdjYcNoRZf5+xvlNZRHrat+3UbeSNTmyJK19TY9NZ92
	g3SSIYc2XVcCWXTS46X+SLdfNTkO7VPe9uHjoincQt3xqygm9AutpensdfK1R/nqUFfICkjsKiz
	OEy4+UG14ucOULXCcOKabDujtWzPv+7d/2aoLsKsws6SoJPzPxT0c7eR/3ZeiXcVhQd6wtFJzor
	DDDyEMm9NgeQDAAgeg5grr0rQrnXP0GNDz2rz+WmcaarB0j0A5av9R/rz/MxHWSFswJVcQsMsBV
	mha0hAu983BUHiYE41Vyzw0MYSHGjKvS4w1gYdDEfxPeQi66N4n9Q6C+E319mCS9B12FrswaExT
	UtDt/mWYFmvjFcXg=
X-Google-Smtp-Source: AGHT+IGCHHE7WPoHAdx0Afz3qTyhSNNdcVu6Tz20xUb804a780XJjxvmzRwAbnAKyBU5edUDUB3dlg==
X-Received: by 2002:a05:600c:1906:b0:450:cabd:160 with SMTP id 5b1f17b1804b1-453948fceabmr105823845e9.3.1751277554978;
        Mon, 30 Jun 2025 02:59:14 -0700 (PDT)
Received: from google.com (65.0.187.35.bc.googleusercontent.com. [35.187.0.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5979dsm9915422f8f.75.2025.06.30.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:59:14 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:59:10 +0000
From: Keir Fraser <keirf@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li RongQing <lirongqing@baidu.com>
Subject: Re: [PATCH 3/3] KVM: Avoid synchronize_srcu() in
 kvm_io_bus_register_dev()
Message-ID: <aGJf7v9EQoEZiQUk@google.com>
References: <20250624092256.1105524-1-keirf@google.com>
 <20250624092256.1105524-4-keirf@google.com>
 <aFrANSe6fJOfMpOC@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFrANSe6fJOfMpOC@google.com>

On Tue, Jun 24, 2025 at 08:11:49AM -0700, Sean Christopherson wrote:
> +Li
> 
> On Tue, Jun 24, 2025, Keir Fraser wrote:
> > Device MMIO registration may happen quite frequently during VM boot,
> > and the SRCU synchronization each time has a measurable effect
> > on VM startup time. In our experiments it can account for around 25%
> > of a VM's startup time.
> > 
> > Replace the synchronization with a deferred free of the old kvm_io_bus
> > structure.
> > 
> > Signed-off-by: Keir Fraser <keirf@google.com>
> > ---
> >  include/linux/kvm_host.h |  1 +
> >  virt/kvm/kvm_main.c      | 10 ++++++++--
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 3bde4fb5c6aa..28a63f1ad314 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -205,6 +205,7 @@ struct kvm_io_range {
> >  struct kvm_io_bus {
> >  	int dev_count;
> >  	int ioeventfd_count;
> > +	struct rcu_head rcu;
> >  	struct kvm_io_range range[];
> >  };
> >  
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index eec82775c5bf..b7d4da8ba0b2 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -5924,6 +5924,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_io_bus_read);
> >  
> > +static void __free_bus(struct rcu_head *rcu)
> > +{
> > +	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
> > +
> > +	kfree(bus);
> > +}
> > +
> >  int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> >  			    int len, struct kvm_io_device *dev)
> >  {
> > @@ -5962,8 +5969,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> >  	memcpy(new_bus->range + i + 1, bus->range + i,
> >  		(bus->dev_count - i) * sizeof(struct kvm_io_range));
> >  	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> > -	synchronize_srcu_expedited(&kvm->srcu);
> > -	kfree(bus);
> > +	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
> 
> I'm 99% certain this will break ABI.  KVM needs to ensure all readers are guaranteed
> to see the new device prior to returning to userspace.

I'm not sure I understand this. How can userspace (or a guest VCPU)
know that it is executing *after* the MMIO registration, except via
some form of synchronization or other ordering of its own? For
example, that PCI BAR setup happens as part of PCI probing happening
early in device registration in the guest OS, strictly before the MMIO
region will be accessed. Otherwise the access is inherently racy
against the registration?

> I'm quite confident there
> are other flows that rely on the synchronization, the vGIC case is simply the one
> that's documented.

If they're in the kernel they can be fixed? If necessary I'll go audit the callers.

 Regards,
  Keir

> https://lore.kernel.org/all/aAkAY40UbqzQNr8m@google.com
