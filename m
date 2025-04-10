Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334B91EF36E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325187; cv=none; b=f2cgG+KWdUdzgiW5tBTNX7fYTZiGgKyDH+E45F+BRoi6emChzjbic/XMdjupNqu9m4c71C6bA6uEwE1kwkRDFf9kSNXWDoD7/uI8GaSEZpMWF78sZ5zLighG3oQymYuDv7EbPqvS8xbPfYCOBfpGejkK6hAuWUNjebpB9UgmWw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325187; c=relaxed/simple;
	bh=YmCFDoL9iZDg3SRZaBAGc0PjSdnU6jsnbXLYOOXUbaw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=apwiLx6XInYURsfPjWMZeFjca8l4hqGNUsACWlZE+VmAvvq7rM8pj+0LhJtJ8ZodJm0IqREPaCFhr7+2R74oEmypXX+XyYyOiB/9R19papCebaKxr5gAgGJIZk02jrcJAeydA0Np7HXGchYgws2Wgk+BIKt01ReO5QYmU2Hx6b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MQUbxQiX; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MQUbxQiX"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73720b253fcso1024042b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744325185; x=1744929985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX97bkZKpFPy5xuLXUIiDRhHreGm0Xwqb9mTDR4xSE8=;
        b=MQUbxQiX3ssStzbykFMOCIrNI0B8EcqjchM3nwcjZnxC0ZsBd4+JuREWJUYGT93m2y
         m2vhtnNYcnegoWYL9BEQ3HjhUGFtXdL4m0kTPscvvn/KvuscvtmmEGaSVVDYte3bOEZH
         TwhYgGvkdCm6qr3gv3+HCeQDqEm99o2IXasy8U2MwV0YqMtv/43Ry2Ji07/ebdw7aJEs
         fOsD9yyBtNhABOtHKrnn9m2+O8cdx4iF+58Z98KRMplYPeLT5ohZZMXqn9OEwImU/nOS
         AKq0nWmVZm573YlC5xDD4vB1Qr08aMtoeEyqRhjc23tHj0wXCOEwq+ExaIurOhbMCCCY
         +6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744325185; x=1744929985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX97bkZKpFPy5xuLXUIiDRhHreGm0Xwqb9mTDR4xSE8=;
        b=XTGs+s3XJpYGL3n6ynz07QJnBQw1kk4Qd3nCPBir0iphoQGUWdPe1o8MntaycPDcYE
         WbWAYvdipNLoVJyQ9mlJ45AdQDbQJhUISpQe0uiR98w7J/gNCrdSNOmEMtQSvuE/FlqO
         Z1/7n70iLeKjuM3BJz2eO4roaflwLzb8/rk6nMoRjpZRA0I37AandLU6dC7kA0LwrHIG
         /Gb7axZMlvB0xW5lZBAdAOhIASdneHtqsE2FjSw3Uah8PM54aHZbZzlsguQ8WuJg99Bc
         RPF+uZn2weMFt4ulHBFDHs+NwJLFqMiebIsWyR4gn82/7B8FGA4J0FFHj3nhjQIH6sJA
         ONgg==
X-Forwarded-Encrypted: i=1; AJvYcCW3jFsmhk8VRbxXfDrLcQJS03qqu0iSXboU+0Vkr40TVuh3I7aRbDb3LYuBQuLNb5mWcCp61qBkHTQLsB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxwbsGQ8sEGVr6alvQG5E6Wp2bTuNLArbC9UZdl2KcmHtaRbJe
	XrDH2VtOT6wZgxJnAhR/ap21DIn+0kVNQiDmV0ng3COcd9ZmWkBV9Iyz0GJh98Imz9xNHuecGdf
	zpA==
X-Google-Smtp-Source: AGHT+IErUQcuKQMG+QE/xHfKX9VfVJ4jH6YJ1sswtPqmJwECRvTlgr1Zksw1ClJWP142PFOFgl2zvB8x9Ao=
X-Received: from pgb20.prod.google.com ([2002:a05:6a02:3414:b0:aee:900e:e3d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a34c:b0:1f5:8655:3282
 with SMTP id adf61e73a8af0-20179995d9bmr813528637.42.1744325185451; Thu, 10
 Apr 2025 15:46:25 -0700 (PDT)
Date: Thu, 10 Apr 2025 15:46:23 -0700
In-Reply-To: <5ca74373f6bd09f1f0a4deff8867cfb07ffe430d.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250304013335.4155703-1-seanjc@google.com> <20250304013335.4155703-2-seanjc@google.com>
 <5ca74373f6bd09f1f0a4deff8867cfb07ffe430d.camel@intel.com>
Message-ID: <Z_hKP7iw_d3JgHbI@google.com>
Subject: Re: [PATCH v5 1/3] KVM: x86: Isolate edge vs. level check in
 userspace I/O APIC route scanning
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"xuyun_xy.xy@linux.alibaba.com" <xuyun_xy.xy@linux.alibaba.com>, 
	"zijie.wei@linux.alibaba.com" <zijie.wei@linux.alibaba.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Mar 04, 2025, Kai Huang wrote:
> On Mon, 2025-03-03 at 17:33 -0800, Sean Christopherson wrote:
> > Extract and isolate the trigger mode check in kvm_scan_ioapic_routes() in
> > anticipation of moving destination matching logic to a common helper (for
> > userspace vs. in-kernel I/O APIC emulation).
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> 
> > ---
> >  arch/x86/kvm/irq_comm.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
> > index 8136695f7b96..866f84392797 100644
> > --- a/arch/x86/kvm/irq_comm.c
> > +++ b/arch/x86/kvm/irq_comm.c
> > @@ -424,10 +424,12 @@ void kvm_scan_ioapic_routes(struct kvm_vcpu *vcpu,
> >  
> >  			kvm_set_msi_irq(vcpu->kvm, entry, &irq);
> >  
> > -			if (irq.trig_mode &&
> > -			    (kvm_apic_match_dest(vcpu, NULL, APIC_DEST_NOSHORT,
> > -						 irq.dest_id, irq.dest_mode) ||
> > -			     kvm_apic_pending_eoi(vcpu, irq.vector)))
> > +			if (!irq.trig_mode)
> > +				continue;
> 
> Perhaps take this chance to make it explicit?
> 
> 			if (irq.trig_mode != IOAPIC_LEVEL_TRIG)
> 				continue;
> 
> kvm_ioapic_scan_entry() also checks against IOAPIC_LEVEL_TRIG explicitly.

Hmm, I'm leaning "no".  kvm_set_msi_irq() isn't I/O APIC specific (and obviously
neither is "struct kvm_lapic_irq").  The fact that it sets irq.trig_mode to '0'
or '1', and that the '1' value in particular happens to match IOAPIC_LEVEL_TRIG
is somewhat of a coincidence. 

kvm_ioapic_scan_entry() on the other operates on a "union kvm_ioapic_redirect_entry"
object, in which case trig_mode is guaranteed to be '0' or '1', i.e. is exactly
IOAPIC_EDGE_TRIG or IOAPIC_LEVEL_TRIG.

	u8 trig_mode:1;

So as much as I advocate for consistency, I think in this case it makes sense to
be consistent with __apic_accept_irq(), which only cares about zero vs. non-zero.
