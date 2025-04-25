Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE0233702
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619035; cv=none; b=nWEUJXn9zfkZuIb068o2fpi4c3qzVCQUzFMm++vQ7gN2QOSNt421IVOe2YWgycg2CCSp60vtHpArjj0uF8piEz5wZy77fDmX8k//RMRhVQ89bMCT+RfpApeOjxfehL/vnYZ8A8LIYser75yZHrfzonnvWmcpljJakOuFgREIwrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619035; c=relaxed/simple;
	bh=aimnY6tUnV94o9RMhPjhm6dvNWiap2zaXUs78GC9ue4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UKqSVes76Qd3weFJAyfIkOt6//SAgMJ+bRFgoNpa+D00etY7Po9MlrgF8pwezrZ6dIGec6qhT4TekkqsBmJZPd+I4YpCVEAwnbY6x3mHH7wiWJ2xZK2mpmuNGFPNipkBCZSyjTBuYIra6vaPqDE9q9yZzNtWwR7QHjWvQL89br8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=daJe1wps; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="daJe1wps"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0e5f28841dso1604552a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745619033; x=1746223833; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4LgaQ1GuAUWP/kw7PddvzqxjqGh3o+JtvV4OkUBUe8=;
        b=daJe1wps1Ozklx5W+J2iyk0OddGhNcj5xcZ9HN4J1U6ZY62U0Vi1+hofDXtPL9OciX
         4rflYit7WXV8QWNj5dghU40uqd0bvGgtx96H1+BwzV7wUSTmHYJMQ697eqJhl2cSqbMW
         R835WVWUb9PgxKes0TlVtwiBhKk9OOyR9UPKsAl/AX95chJme0LJdC2tkz+BYxvSve4D
         leY0nnuSK2+uWKh+T4vzTsn/hDYx6spTeEvY9QMnGbMWc+D7qYvAzHwG5cNxtRPWX1o+
         lNAChxPAuz7BDWOjsLC83BkLNc6S1tn7cVTCzc5bzmd7WCKT6oi3MbuvYYpqU0AectHF
         kt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619033; x=1746223833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4LgaQ1GuAUWP/kw7PddvzqxjqGh3o+JtvV4OkUBUe8=;
        b=NuhgUsBc/8bzGPWuwbIVdtNvK0yOw5Qmn5cHiblDG11peQbI25x7QMTObk+Pj30bMD
         N5+qubhkncpFAQijVUpQDCFWhJLucJnNePZ625qU6p2bKKQTR6o2cGOUnMyXzeUqS/xL
         +UEqab4z3AwNb+q6nrw819DK+5GAgChSXteTfuEfPwohpBePu+2gZO2RawGb8IRdYuAZ
         S4C6g1Mcea/MAEvSKJ23k1fa/vEvgtNnO75ExJ4L/B9vueNAEpDT2HDBQji0ghsfA/TZ
         qrcCp3eDHRcaXRn8KZWjvPGUhN3IcjO/be7j1t/8gr7MMDYBd7Du5PSxSIkaiPaR4QBK
         Q5FA==
X-Forwarded-Encrypted: i=1; AJvYcCUNvIR7mrvHKkkf1TKRe1XIluKLh76q+plLMZCVRgyGbvRGEe5IfSYF/HSJYzQlHHBIbI4hL+Imknd8fH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0FRFSPtsLVMUyH6DRRPb7Bx8mhk0RuEbVEPGLyrUfS8CuyvQH
	c6aRn83sTD7dciI9eb+JfWxb+LTZ/BfYwUjBRMvYizfyGSgD0oafHaRDnmHV58QsbP169MQgTyE
	gWA==
X-Google-Smtp-Source: AGHT+IHcSOCDilduu6zKy2qslrDSQQbZGnCFwZnVCF+4bEL6G4X94qzFQSwcH21tq4LeS9ZdDdCRP63DyQE=
X-Received: from pjbrr7.prod.google.com ([2002:a17:90b:2b47:b0:2fa:2891:e310])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc2:b0:2ee:44ec:e524
 with SMTP id 98e67ed59e1d1-309f7e8f6dbmr5194411a91.35.1745619033277; Fri, 25
 Apr 2025 15:10:33 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:09:00 -0700
In-Reply-To: <20250324160617.15379-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250324160617.15379-1-bp@kernel.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174559664970.890368.7017242957436567888.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86: Sort CPUID_8000_0021_EAX leaf bits properly
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Borislav Petkov <bp@kernel.org>
Cc: X86 ML <x86@kernel.org>, KVM <kvm@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>
Content-Type: text/plain; charset="utf-8"

On Mon, 24 Mar 2025 17:06:17 +0100, Borislav Petkov wrote:
> WRMSR_XX_BASE_NS is bit 1 so put it there, add some new bits as
> comments only.

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Sort CPUID_8000_0021_EAX leaf bits properly
      commit: 49c140d5af127ef4faf19f06a89a0714edf0316f

--
https://github.com/kvm-x86/linux/tree/next
