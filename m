Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE5288C88
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709170; cv=none; b=EKycipfpjDzWQ2JNuvHnSmfB4W/2ymEJ8JfTOhN/vUrG4CUoq9JSfKqW2SZ8P5KGg0gnEjbgbdyQiccT7T1nUi+t0dCh+h5f+ITnGhKE8LRnBEK1EG8B/7Fi6oPrAhajKtB7Be23IHW9k3JGhtYu1vtDSbpOSzVm/HRHL7aNTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709170; c=relaxed/simple;
	bh=/u5Oni1B7nlk9985eSb6XttI0rp4egr161AKqYs7Iqw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hAmMz2a1T2U7Qt7SHYciV+HLKHwEa5GJpvg/TOmCc7XVfv+ttNsP0yguqe4VzHuiGye5MJf9UEzw6kZ/dzL7ck8rQcokjs7iGSavr56ANx3eBfVk5OoxE33yIuoobkMUpz+VfTx48QSLB1e0HEeyc50mI9EtIztXy+i6HrDObSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPQxrmf+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPQxrmf+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so41806015e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744709167; x=1745313967; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFv4zzeDVFt2wFNfc+l1QeY2z3r5rZGCAIJcj5O71+o=;
        b=tPQxrmf+ZVjSu+cK4pwn+KgCUy1sWtXdltEtqNlEeiEZZ/5y9oudAUSxVRonip62Jf
         pExsTxKZb1kEjZxFy8cLKlP6praF11spaDZQ7blt9iceCL28gva8mudUKfERcmmDLfUJ
         BxM3kPv1LXeS5sCSupjShcfzoC37UWRhlt4x2VYbP2B9jevDB/QqxhK3MMS/8dweu7E4
         ivnnlyA3TkV1bx1x2+/auO/5w7VZgeh8ns/TJw7K1zZRmYgU8ogEJz+6BLzgoF6x28EY
         XWSclsPKX97hX4tnuPxcuI3V/KFmOVqDw+Vlx5duTidtx4PZKbD4dIg+yyp0ntFmveFH
         UcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709167; x=1745313967;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFv4zzeDVFt2wFNfc+l1QeY2z3r5rZGCAIJcj5O71+o=;
        b=KLMff7nmxPBRRo9l2bkHJxne0yfQjDuab2WSWujzZ3CypBSGJbAHONKF/U/mRYXu30
         IT6dv1XGLGUaPVfAwmQikFfb7LhXTKUb2Ch7pZiPyK+VF+M8qkMg5sr4vYzJWOCIoAXX
         CwLBY9VRzSCzdX8XptyZ9PxAikAD9Z6lix2BiirocRagsfEANLj6lCed+n7gExV1eYbH
         KHHv8if5PtFok4XuVr5cGy4bEszh8iUjc5NF7mpOsW/c2/1NOiJ1cvI8WkSdIg7vuAYH
         L03ly5Lttilf1z70oX92q9oZ+riMGG3tk/2TtvoNzMDQJRg87v3PNNW3k9OZX9sDbJ7O
         U/EA==
X-Forwarded-Encrypted: i=1; AJvYcCXBVJJyPSnuSdqyPYQP0fq+Ee3GkUb9GPnO0xtk6pKEIZp0UsoDb9w5ATgh8h96oXioQB5meM9nLPw8WpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXCq0yxFyUWhWVtc40eEUrzCF/A/prh33DcZVDynHvFKSgPcuw
	njLyhMtUu4wbhopDa3YSGYw2Qu1A5KOehBcctzosz7J7j0BMESrtzzM4vaayhZeqzn/Uww2Qwnb
	yCD+CoxdcyQtP3w==
X-Google-Smtp-Source: AGHT+IFeSEt4wIOY01EI6T4xsz1Ma5642UUs6D/RIhqS/zc7ZZbyi0t98TnaKTF3Edu8clmB7G4YeK1q3rLrMu0=
X-Received: from wrxn4.prod.google.com ([2002:a5d:6b84:0:b0:397:c98b:1537])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1887:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39eaaec7a7bmr11167075f8f.52.1744709167073;
 Tue, 15 Apr 2025 02:26:07 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:26:05 +0000
In-Reply-To: <20250414195928.129040-3-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414195928.129040-1-benno.lossin@proton.me> <20250414195928.129040-3-benno.lossin@proton.me>
Message-ID: <Z_4mLRn-piSzuuf6@google.com>
Subject: Re: [PATCH 2/3] rust: pin-init: examples: conditionally enable `feature(lint_reasons)`
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 08:00:20PM +0000, Benno Lossin wrote:
> `lint_reasons` is unstable in Rust 1.80 and earlier, enable it
> conditionally in the examples to allow compiling them with older
> compilers.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/33/commits/ec494fe686b0a97d5b59b5be5a42d3858038ea6a
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Why not just always use #![feature] together with -Astable_features like
the kernel does?

Alice
