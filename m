Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56790231CB0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619013; cv=none; b=rwK2CtHbhdyNo9LiFKiyERb9mGh6D8ZktgJtDSZC9egAEQ/J9xNnagMi+HHG5WQ88/q3sv97rJ2YEhANAfkP5UW1c8c6SEQRde4YJlKkxP7QkbP8DAXOQtHLMk+TlMbQhm0crb3Dz6plFDZHws5SgLet7k3+41aWg2w7v2hIUXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619013; c=relaxed/simple;
	bh=QDpNpdZSVvNzvd5MLR7pzG4I1iT2a6SWMqrV4UoqPjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CTBv6pjXi3IJkCVPy2tx7p6VRHXHwzYq2wno9zQZ6jdLBlLUjgiikcNv4AJSuKKrsFvMT+v+pRJKMuyjnQnBsc1ci2yd54jLMrhv8RwFfF4dnDSlCt95Wqi0dnjZjc5oIGGrW1JAExs8T9vgcJomlLToHdSFrsM/n86Rmy9fwEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L+LlPTpq; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L+LlPTpq"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736d30d2570so2356919b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745619010; x=1746223810; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KP7SMXC0UpOU8ebuPaD2r2QZRSGge8gBq4uVn0V+Tno=;
        b=L+LlPTpqPRnCx7GgCslDOfN2aYRsMKD2Y8PL3Xsi+CNHogAdOyz6RqJsvPKgeD+gV+
         LdkTFNPx+yCSVE+hYA70vT6DZNVzfb4DIJOqdM4odkc57y9WGJuVseU4IVp1ofvUk/T0
         e3HrtzV8QAffZmawffOBFCSb10QRL3Uyc3Qt4Bp96GX52vFslkxXEs+J6IjyhFP36qYZ
         5Jahtw8NJaI3FNJhSuh1BiutOfzFBJiPzHkqWhG+LYNNpVYifyMV5sFFETN9tX0IiSjm
         VcyQy5Ry91KjrENITxQRVx+UWwI0BlXjP4EFlBDo3POxxXODd3Ees+zPt053JUUSEhqM
         mQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619010; x=1746223810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KP7SMXC0UpOU8ebuPaD2r2QZRSGge8gBq4uVn0V+Tno=;
        b=JY1rPAasRhL/t0o1Z0I2I0JJ163Te0v2O/sfkKuDbmE0pOCwPLdwiWRgm4Vin5x/lj
         K7iuxXS6QZ0aZTBvWs0wyTgNcuicnkT3C2qAQAGK2FosyeGYASoJV+SaSX7Aznsq++Tj
         mydgnhvpPKaYgsbDTsVsb+soV8jLt6oTXIi3lomwLMXH4zh3QuwMC8iCe4MB+bB9idof
         A9fWcOy/9i++qzRsI398KIAIOd/STFwtqe1dPP7XcoIS1CogkB/x9OIHy8/ZPd3R0Ogi
         XzL6HrCGjdxWNwPPE1EcrvcOy54CUnrEemxzPcmMUPZUiNXdcGa7tBeJteOaJhAFR6B4
         OXOw==
X-Forwarded-Encrypted: i=1; AJvYcCVnSlvA2zfL4XAfqBLA0UfaiXRmnX87TT5HyFWbGP3bW6wce34VFeQVpY9k+XR9C5YlUKIb8cex2fjVHyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/jHQMWJVOVvapPjpozMI5e9FZda5cc0+QIXaBib4tONAwFvrz
	nRA83Ozj0NiE4FJJat6PjNfoF9XUqtSHQg01Df/5K+6m8DqHrQ/lunfJHh/UrhF+6siuK/dfuBZ
	OPQ==
X-Google-Smtp-Source: AGHT+IHlxsqOZTM+LSrc0NBMmc8B9QyOShS3ixyiaGAbKud07pM591093aslJMz7+/hiacjkdUWS8cPxxuk=
X-Received: from pfbhx20.prod.google.com ([2002:a05:6a00:8994:b0:73b:c271:ad40])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:179e:b0:736:476b:fcd3
 with SMTP id d2e1a72fcca58-73fd9145c92mr6310645b3a.24.1745619010562; Fri, 25
 Apr 2025 15:10:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:08:58 -0700
In-Reply-To: <20250414171207.155121-1-m.lobanov@rosa.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414171207.155121-1-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174559665447.890486.10602051835802598167.b4-ty@google.com>
Subject: Re: [PATCH v3] KVM: SVM: forcibly leave SMM mode on vCPU reset
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Mikhail Lobanov <m.lobanov@rosa.ru>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 14 Apr 2025 20:12:06 +0300, Mikhail Lobanov wrote:
> Previously, commit ed129ec9057f ("KVM: x86: forcibly leave nested mode
> on vCPU reset") addressed an issue where a triple fault occurring in
> nested mode could lead to use-after-free scenarios. However, the commit
> did not handle the analogous situation for System Management Mode (SMM).
> 
> This omission results in triggering a WARN when a vCPU reset occurs
> while still in SMM mode, due to the check in kvm_vcpu_reset(). This
> situation was reprodused using Syzkaller by:
> 1) Creating a KVM VM and vCPU
> 2) Sending a KVM_SMI ioctl to explicitly enter SMM
> 3) Executing invalid instructions causing consecutive exceptions and
> eventually a triple fault
> 
> [...]

Applied to kvm-x86 fixes.  I massaged the shortlog+changelog, as firing INIT
isn't architectural behavior, it's simply the least awful option, and more
importantly, it's KVM's existing behavior.

Thanks!

[1/1] KVM: SVM: forcibly leave SMM mode on vCPU reset
      commit: a2620f8932fa9fdabc3d78ed6efb004ca409019f

--
https://github.com/kvm-x86/linux/tree/next
