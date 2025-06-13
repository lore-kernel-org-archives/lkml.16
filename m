Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFF2E11D8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824552; cv=none; b=Tf3ahIluBmg4Ir4dPdDfy4brjToA8va4KyZINlklad1jTe/s7IxtXeafP8nbb0uNgFbEqOfXPiTOQQ+/IEoWXn2jj9oHLsBvBRy2gfMj3wGhQPc6qPuhv5Yzi4E4csqn6LdSYWvHVMiU02Ud0XBWh72rt0l+HD7cHggQql5lvW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824552; c=relaxed/simple;
	bh=v7g5X6oc6sVy67+yYbMpBvVyIQv+ZrVA9HpSzTrgX1E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FBpaPEvYwIXJjZBK4DquKxx0G3JJODJnsswXwCPrxgtUMT/saCawgVl6GCzZjz2K1zYK3N6BJt1QH6jY08cSW7/EGdHozUkOFC/fe8dJsZeoWZEUScp5jXZ1j7RpkrF3SR7UScAYEFaf+zkt90cwYpuEQU5YYegn5dF8PpfOqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iauW0YWn; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iauW0YWn"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2f103f6074so1446059a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749824550; x=1750429350; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=91W4ixZhFhNMAfYX3G8GscIMxxtY559BEv8MBNtGYAY=;
        b=iauW0YWnQNigQAOill7vSTq2Y7djrgwbTi/EqXONjgN0zJMPplJ3NmV+tKBVG9gxMb
         znTmFCyYvRRH0YHTiLKmoBaiG6r4xLc52/7uWy4dqmoLszB0JK0ZZJUUFeYaF7O+07BR
         X0Gem67u1xWu1yNPeaJ3DA3Lj9wtoUHI3+ETkzK0ljarPt1LL2PRNrQd/oua1YLhs9f8
         mJVPx4+aOqI1K7eEIG19Rnbjjf0Lk3RjF0sfmriZ5onkjPEOa4+zWzWaNo35kFpWTvx5
         daBgApmzuVC7p6G5xz50cbEopgED+EXXQn0kyHceoVJMClxIMYwwZVZJe3XpfzG7OTff
         fGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824550; x=1750429350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91W4ixZhFhNMAfYX3G8GscIMxxtY559BEv8MBNtGYAY=;
        b=bHZ0xvXu2XOseOfoYlgi/E2XzAOXZ7hGbOOAmpux4oIipXLT7i/GDKemWqKaiqmWRm
         OCl/xrFqRLiLIdeWqUZu6Nk3562hLxERIUJZAiuQTpQk8ZCR56y8WxB2BRw/dux3ZmC4
         JYrhuiXAkp9Ntnd9N5AL15ZWK0vIIj5x1xnsEDZ4Jm12Ban9H7t3awLE2coY1+W53xNA
         37iTIhLy6MLJbPR9I160jU545dq7OK2Q5ipI6QZAz/g3ajgQK5eFnRhJufs2Sb4nr1xO
         tAU5YA1608YhkRdUS+Hj5LqQSachYJkoGUvT0uuIPKfEz9zae5UBWXa6OVy6M+3aWUz+
         mVrg==
X-Forwarded-Encrypted: i=1; AJvYcCVfrB1iMLEOztldPiZeHxIjrPixoOicANe93Ncjeu2qfGZAdt69M63wBNhTXz1RzVa0AFONlPSBn2fyEis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2QJck//naZqsmwYae+P+sSJ0ff8q9UZzshobIAPmBmi7GejA
	xOucV/UpIYq/FTSv28AcD8daj+lNsPLBnS5YStqUhAlCOZ0ZOvGVSEdQgyiM1E4RqPGyyB2Yswv
	drE0GTw==
X-Google-Smtp-Source: AGHT+IGpyPuJz3U+5aricbieZ1jJLQuCkfhwpHihQ66LxhmrkLx1ORImJi4+YWfYg5r/cDIEP9803prL9y8=
X-Received: from pgbbo1.prod.google.com ([2002:a05:6a02:381:b0:b2f:1e78:bfa3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a08:b0:1ee:e20f:f14e
 with SMTP id adf61e73a8af0-21fad00e70emr4624067637.38.1749824549995; Fri, 13
 Jun 2025 07:22:29 -0700 (PDT)
Date: Fri, 13 Jun 2025 07:22:28 -0700
In-Reply-To: <b73ef73a707faab870fa64f96af9e0c4de213043.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com> <20250611213557.294358-5-seanjc@google.com>
 <44cb77805d1d05f7a28a50fc16e4d2d73aca88f3.camel@intel.com>
 <aEt1aXPhivCJZbyE@google.com> <b73ef73a707faab870fa64f96af9e0c4de213043.camel@intel.com>
Message-ID: <aEw0JObSt0SLv_Rt@google.com>
Subject: Re: [PATCH v2 04/18] KVM: x86: Drop superfluous kvm_hv_set_sint() =>
 kvm_hv_synic_set_irq() wrapper
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "vkuznets@redhat.com" <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 13, 2025, Kai Huang wrote:
> On Thu, 2025-06-12 at 17:48 -0700, Sean Christopherson wrote:
> > On Thu, Jun 12, 2025, Kai Huang wrote:
> > > On Wed, 2025-06-11 at 14:35 -0700, Sean Christopherson wrote:
> > > > Drop the superfluous kvm_hv_set_sint() and instead wire up ->set() directly
> > > > to its final destination, kvm_hv_synic_set_irq().  Keep hv_synic_set_irq()
> > > > instead of kvm_hv_set_sint() to provide some amount of consistency in the
> > > > ->set() helpers, e.g. to match kvm_pic_set_irq() and kvm_ioapic_set_irq().
> > > > 
> > > > kvm_set_msi() is arguably the oddball, e.g. kvm_set_msi_irq() should be
> > > > something like kvm_msi_to_lapic_irq() so that kvm_set_msi() can instead be
> > > > kvm_set_msi_irq(), but that's a future problem to solve.
> > > 
> > > Agreed on kvm_msi_to_lapic_irq(), but isn't kvm_msi_set_irq() a matter match
> > > to kvm_{pic/ioapic/hv_synic}_set_irq()?  :-)
> > 
> > Yes, the problem is that kvm_set_msi() is used by common code, i.e. could actually
> > be kvm_arch_set_msi_irq().  I'm not entirely sure churning _that_ much code is
> > worth the marginal improvement in readability.
> 
> Ah didn't know that

Heh, I didn't know either, until I went to rename the darn thing :-)

