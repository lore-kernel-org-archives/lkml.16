Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BE24169B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793917; cv=none; b=JvwF6+cd++0iZJNI5+ku9ZuE42d8ud90s6buk2HpfqcbsMe7cQZWlh/dQJU+6+XbG+zJ0CsE90A98rLcreLeSv5LwY7IGbtqQqTzO8G85q1BOoxrn8ut23kVAw1dXRAgbkuKSXRO+OVpRstRSKlXPkdEVBhzd+Eh4wXwoP/vWXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793917; c=relaxed/simple;
	bh=twptM5Qxux0nrd1AK+HItqru9u5lEnVGglh7RnVcqZQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dgfQw3O59BTCKkPaaTtHrsoKab4pVgtQUgvgncTMrFq2SMwgjdhAnoGHyCZH6M4BvGCWpuSRZg8Kc1XHYU9wiMNyItduyMoU+vJj4yKq6z29EcrxJfXkBJEJQL5cx5GUV6WBsQp1gnPpbCMiBtPp1FlhXAY6ctBHq0oz2zpxB34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yj/Bfpoy; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yj/Bfpoy"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so1120066a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750793916; x=1751398716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MbmTGb7rJSpyBX4d80hPoeJGIxezKRaodgXxCjrASGg=;
        b=Yj/Bfpoyb05A/K/RTk1W6rjmW+FPV/lHf49ttHk+WfBtVv3hRFyOXpDSa/h+q3XKY/
         PbXvzJ217Y+9TQjiRnKIhTXP48UH0NFFNAVkeKa+WFFWhPWq/qBpUOK3kVJltEtFKWEa
         XfJ9LsMF5PZ152+yInH/9XJABi3Ml7BMAs8pKsW5f7DJHfmqCddPa6AjR9mTwtcKubOI
         4Gyh0VukXMp6NnqRH5OwqYcZMljsSR+zhQsav+wjvo5rYdtVzrRxzSTslHYAv5NWEk43
         o0+7lVqSrlGgHGAEQTslgvTbCX694Mx7bjll+0U0Mriri88UAYweotkkuFxKYBPptxD/
         AivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793916; x=1751398716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbmTGb7rJSpyBX4d80hPoeJGIxezKRaodgXxCjrASGg=;
        b=oymcMFE9m9vZAxm9dfNT5Yvt88h2iDe9sQ9z/rmSIexHnzIKmC/8/f07uUlEy6SiQX
         IyxAcHc6n1swWfs68QfVqYTOMWmA/SH6lAdTE8ajwFXCRSL1iK3TSB1GVg6/zH2I3Yxj
         7D9dA9BhaKbc/LlbBpXFMVjepQBmV6wajqFfDgqekIzX7c8aKLxlZX0+RsiholDNvAaE
         6uGDJvcCEVcPHdjb1rxnhxcaKYD68iPCc+VfQnFMHbRTQZQdrlQemzcXHm3DVrvkYfZN
         RHVUImNvYGCmQlQ+x5fcpMmAyRJkAHLVug/QycjAMqB/Y8qo4sEhV8V2pVtduUg68goo
         1+fg==
X-Forwarded-Encrypted: i=1; AJvYcCUNxiC0PZmLRK+KyFVH/aOAc9yZalkRONjLeFkZTYrRNIB3SAqv3jLqwdFuI6WJY8W9rvkjDOgySK0KN68=@vger.kernel.org
X-Gm-Message-State: AOJu0YycYzxNklBbqdOxTry4LoCVFa0w46+Bkcmnipp2622AhDvjSPjg
	PBjq8A7KpngD4vnpJTk7Aeg3YqaMtvWBeH5TQ2txuMc/2/Mu28ioEMdngTS1k1ja5Ur5bZspWXi
	e/coIyA==
X-Google-Smtp-Source: AGHT+IGZwhCBQvNu/HBaFdGHerB63N3HJcv/7dELpqe76tf9E/2jghrTw8qT08hT6Fhiaf1CGBCMscO32hU=
X-Received: from pjbse13.prod.google.com ([2002:a17:90b:518d:b0:311:7bc3:2a8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2cc6:b0:313:db0b:75db
 with SMTP id 98e67ed59e1d1-315f26a365amr131836a91.33.1750793915772; Tue, 24
 Jun 2025 12:38:35 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:16 -0700
In-Reply-To: <e489252745ac4b53f1f7f50570b03fb416aa2065.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <e489252745ac4b53f1f7f50570b03fb416aa2065.camel@infradead.org>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079198224.513744.6336161745259606181.b4-ty@google.com>
Subject: Re: KVM: x86/xen: Allow 'out of range' event channel ports in IRQ
 routing table.
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Ivan Orlov <iorlov@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>
Cc: Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 08 May 2025 13:30:12 -0700, David Woodhouse wrote:
> To avoid imposing an ordering constraint on userspace, allow 'invalid'
> event channel targets to be configured in the IRQ routing table.
> 
> This is the same as accepting interrupts targeted at vCPUs which don't
> exist yet, which is already the case for both Xen event channels *and*
> for MSIs (which don't do any filtering of permitted APIC ID targets at
> all).
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: x86/xen: Allow 'out of range' event channel ports in IRQ routing table.
      https://github.com/kvm-x86/linux/commit/a7f4dff21fd7

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
