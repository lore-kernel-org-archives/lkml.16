Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345C7227B88
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 01:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076184; cv=none; b=QCoC6yxncb07+kK79Oo+qmmVZ7t8vRClL8LR08eos5qBRi5868gzV+UDMk+NFL/qoa1KbP/8oKw0NfKBfACJmTnnPc9IMVN7llQSgnOYyfOFYhmnkdMo2U45wW3OQX5mzvgSYbqsMJt3OCTJpOkikngjqdWX9zILbB8HMk6LbuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076184; c=relaxed/simple;
	bh=nEJ7IeMB1pLQPS7HDVGT39wEVuaOk/TR/+LKE0Wu/Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jD7YnOPhfchCUuUR2CKAQsX4YrxElDGOG2CZBIiv4PkqjQy2lh8G1ziB5pP4x4R/6fFlh3Y4T3d68407RFFpUy5w+/dNXTvKnuFA6K809sKFy0zer426XIAnx++k6l10bgdInb1tdTRqCDVXNOYTkuCCrHISigIBojP3wHJEXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pq4K+Nv3; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pq4K+Nv3"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e900a7ce55so75564366d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 18:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744076182; x=1744680982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmYGxUgrQ82dA8PHdV+90FiDG0aLpfmprlVUbx46r7Y=;
        b=pq4K+Nv3Rk+X39a+riUgoIErOqbJEPZVNrbFLRZz9W/p8r8CWWctQdYvv/7Kj4LKuL
         s331/PwsG+S1r+gR55mIu4FNAXGxbdd07DH6wx245Av1XsBqEG5XbaFM5/eOqqStRaEm
         9Jg7WOPZSqaROchKFIoGFaUJz6jlLT8UTwSPenDUsK3XLpoP2cERzJ6XeaKhdFEkPDyP
         zO0ZqEzuPxPjva91p4yllAJEUCU3RueOMcEeCE2ZC2jxay5xezpjnV2ktzitcy5jNJmx
         p/99qP5Hy3w48uZkhAx2EvBWBEt5j9mSiBDBLvfr4Y9pEpwl1cdScsN7GhiwhpVnH6eN
         lQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744076182; x=1744680982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmYGxUgrQ82dA8PHdV+90FiDG0aLpfmprlVUbx46r7Y=;
        b=OT5Y7Eu6UW4iqFJB+vJTuqkDAGPk4bc1wLdOiXmMX2mO/pWYh35VW8BDE2FQWwd9To
         DSWgfg2mXY4KOI9pjTZxOWPB3B6OHffLdT//ce6WynJRjCwONcxla1jOX452csxl1Q0H
         nDBHI6Rg/wRNfZwflQ0oiH5gGWbL+VZCC2Mz8jySBTO1Kwp65/EeYYLM+vRq57AJd0Hn
         sFqcG/9AO8HLJ4ZyErD5fuVBceSnlR7U9gF2VdhW+QG1oiE8vGDGoDSVXRReRoLUpiWH
         LmhgisF1Zd6Qe5OrdDsLavn7pUIsDnScJX7XP+vvp3xFcevQQT5Xih+/u+JuE7+Aae5J
         1HgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/mP5/vDPFmf6zwEUZbRNNQknRWNjKlPoMAsQoQ7p0oFX0YcuqnWtF0fH6f6/LS/1gx+nCYJF1nXV1ids=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dQnc/vzRejufAI8vpU9yBLC/x1yj/sIBgFBAQ7yz+WkonrOv
	67BkzVvbwSol08+jbF1J1oECzUAHCVsY4r8RUiPBmPZqA+pA7mkWj2pCbjz+qRWRbyYe51raOUq
	nuEVOJJiLwR9q59T3Q/FozLr8QW7cFWJJBbp6
X-Gm-Gg: ASbGncscTLqqRNxAmzxipRPiQxrrakAsV/MzLuI27sXlAWfOyhcSRDGOTQHXsUvoqbq
	emu27pkqr7mh3qn8QYoYHrBimF3+4J3eBAAZsetJk3XFnF4/AxQoCt5XPQU+dokzw/7o4Us1mrs
	IpH2fVLJDKegeyza6y0Aq8cGdG+4A=
X-Google-Smtp-Source: AGHT+IGE7L6K2QMo24UqIr1fpMgrGODBEyetBl1Bfu2uk/MMku4VhABQhxdcMPcqYNET2tb3hCHiMzuMHgQDS2/xYL0=
X-Received: by 2002:ac8:7d92:0:b0:476:8df3:640 with SMTP id
 d75a77b69052e-47924902cd5mr197638761cf.7.1744076181898; Mon, 07 Apr 2025
 18:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325041350.1728373-1-suleiman@google.com>
In-Reply-To: <20250325041350.1728373-1-suleiman@google.com>
From: Suleiman Souhlal <suleiman@google.com>
Date: Tue, 8 Apr 2025 10:36:10 +0900
X-Gm-Features: ATxdqUHfO2onlsArzyfW1NxAljhVfz4BWtBD_kvxEBCJNEXEDMCEMYaVJWzrz_w
Message-ID: <CABCjUKBfCe_iAU-9THb=OENFuEE5JMkSN0yPpHQsVo-S6WYViw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] KVM: x86: Include host suspended time in steal time
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ssouhlal@freebsd.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 1:13=E2=80=AFPM Suleiman Souhlal <suleiman@google.c=
om> wrote:
>
> This series makes it so that the time that the host is suspended is
> included in guests' steal time.

Friendly ping.

-- Suleiman

>
> When the host resumes from a suspend, the guest thinks any task
> that was running during the suspend ran for a long time, even though
> the effective run time was much shorter, which can end up having
> negative effects with scheduling.
>
> To mitigate this issue, we include the time that the host was
> suspended in steal time, which lets the guest can subtract the
> duration from the tasks' runtime.
>
> In addition, we make the guest TSC behavior consistent whether the
> host TSC went backwards or not.
>
> v5:
> - Fix grammar mistakes in commit message.
>
> v4: https://lore.kernel.org/kvm/20250221053927.486476-1-suleiman@google.c=
om/T/
> - Advance guest TSC on suspends where host TSC goes backwards.
> - Block vCPUs from running until resume notifier.
> - Move suspend duration accounting out of machine-independent kvm to
>   x86.
> - Merge code and documentation patches.
> - Reworded documentation.
>
> v3: https://lore.kernel.org/kvm/Z5AB-6bLRNLle27G@google.com/T/
> - Use PM notifier instead of syscore ops (kvm_suspend()/kvm_resume()),
>   because the latter doesn't get called on shallow suspend.
> - Don't call function under UACCESS.
> - Whitespace.
>
> v2: https://lore.kernel.org/lkml/20241118043745.1857272-1-suleiman@google=
.com/
> - Accumulate suspend time at machine-independent kvm layer and track per-=
VCPU
>   instead of per-VM.
> - Document changes.
>
> v1: https://lore.kernel.org/kvm/20240710074410.770409-1-suleiman@google.c=
om/
>
> Suleiman Souhlal (2):
>   KVM: x86: Advance guest TSC after deep suspend.
>   KVM: x86: Include host suspended time in steal time
>
>  Documentation/virt/kvm/x86/msr.rst | 10 +++-
>  arch/x86/include/asm/kvm_host.h    |  7 +++
>  arch/x86/kvm/x86.c                 | 84 +++++++++++++++++++++++++++++-
>  3 files changed, 98 insertions(+), 3 deletions(-)
>
> --
> 2.49.0.395.g12beb8f557-goog
>
