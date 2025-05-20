Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2282517B9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775597; cv=none; b=nAYY6oCc6K3yLXEnRGfeUDjmtx/bhk3p1u5g7/mwzWEpzIWHsuZjgeMWpG27oyrybxYXVm+DSOXP+SFuyDwefsn5BPgfYLbjSplHDNEIMFObjzhUf0vVWif3Raz6LWF4KYBO6zL7Qsu4KQUm/OfbrRlfI8wJ5aqEJi+zfmB/YVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775597; c=relaxed/simple;
	bh=L7MRy5nZLEPp08rfjDttlaHLh2aLDq/Ts8Q00IzSj44=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W74f1S/Lh+nveiaq8KAWBnLuRGR7i8DcJob5xiQE/PCPmEl1c9A8fIwpu0ACgeeuxHuMHdkwUSpynURCpYMhI/SATwSlv87zHA7H39hFj03qkwmjx5uYr3k6Z/zlXmrqogs8ELw+Q2IGQRBgqmJ5Vn1wXrH5tLjgB8/FtVfTZdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gc4gETiT; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gc4gETiT"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cec217977so32065385e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747775594; x=1748380394; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6k8y43kbW69Cj6+ls8AarnJHecZRyEQvRb7E86pWzI=;
        b=Gc4gETiTPS/XYn9nyUJWyg7vNR6Co825XeWJBoNA04ugAu7vSRaeFahDtqs9t3HyKV
         8SAykQSeWJ2KcdKeOlGwfdbqJWIQUrYKuWislmt28rCREpFBTHZsR6P/QRE/T952FMZ4
         ov/rlMTNjTz0oCLZdRXtygcqfJfZG42liZaSrEKTSphTOEJ6BaqMsFKZfIA+KDmpTBlS
         UZpiSbDa37gtwbd/2tucboLZT/HvjMaHUq7NJXQp+I8GpzojwuwKzJ0Ky/KSWg281DBu
         L3tMJjTMhqgHmyYnzQ24gEwoxiEfT3DzF4wGcUZ4J1cytJ4uIWgpWAGviTiEmHwdvx7H
         3DWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775594; x=1748380394;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6k8y43kbW69Cj6+ls8AarnJHecZRyEQvRb7E86pWzI=;
        b=UFtkRGvqEQOd5CWxhZrkjpOEUD1BwqW0UxuswjEau731tpDTQ/YZ509qwFW3vm/UJA
         fx/oi2E8CkD86yTxhFDFB7iNmQJitH2WxppgopHqy2bkytwG+7CFQBjQLF2r3AW2pRFF
         LPi6upMIQDDmg4TlvWeLMFJv2c2tJ7Kfe75frBSEAvIccNM0YU6Oackw9Rn77DzwY68V
         F5p/dObM4+FTboyAPI99naeJQGnNj+nbsXSQABt75N9Z5/vqfuUz9GLpbM5VDVJm+WEH
         3nhVn82jnAt4/Le8rTphlikNasxdJtEmR/3d3eU+WDhZXH1w+8ehZZ4BbJFxTTnq2+7F
         mqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNvnU4pYiTF7DNLVP7wgjIOillG/grppa0UTSVUIM+J+RS6sFKSIve248JtJbDtvwIeN1sBWxTT4WN6Fo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx77LrGdE+rQai4WCy7eMjVtDeiSzhiNIYAfVjxeTqK7Tx05F1c
	bsqKsvWUjS/4/iihp4QxTsF226oTMrfyt6FNYc95mR+7WmS54K59184vUulcbL5SS/efv/j/jbO
	4oB40ol5A4zhpS31NZA==
X-Google-Smtp-Source: AGHT+IEYzt7HhRWU2PItDewLmZNHUanVmZTDkUbAcKrucWyR7kx299ej8ln1aBKPhh4PGh5FlDEsAD4HjFpbxro=
X-Received: from wmhu10.prod.google.com ([2002:a05:600c:a36a:b0:442:ff89:efb7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c82:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-445229b431cmr98895075e9.8.1747775594095;
 Tue, 20 May 2025 14:13:14 -0700 (PDT)
Date: Tue, 20 May 2025 21:13:12 +0000
In-Reply-To: <20250520182125.806758-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520182125.806758-1-ojeda@kernel.org>
Message-ID: <aCzwaCkENAiaG-As@google.com>
Subject: Re: [PATCH] rust: remove unneeded Rust 1.87.0 `allow(clippy::ptr_eq)`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, May 20, 2025 at 08:21:25PM +0200, Miguel Ojeda wrote:
> Before a change to relax the lint was backported to Rust 1.87.0 before
> its release, Clippy was expected to warn with:
> 
>     error: use `core::ptr::eq` when comparing raw pointers
>        --> rust/kernel/list.rs:438:12
>         |
>     438 |         if self.first == item {
>         |            ^^^^^^^^^^^^^^^^^^ help: try: `core::ptr::eq(self.first, item)`
>         |
>         = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_eq
>         = note: `-D clippy::ptr-eq` implied by `-D warnings`
>         = help: to override `-D warnings` add `#[allow(clippy::ptr_eq)]`
> 
> The backported finally landed indeed, thus remove the `allow`s we added
> back then, which were added just in case the backport did not land
> in time.
> 
> See commit a39f30870927 ("rust: allow Rust 1.87.0's `clippy::ptr_eq`
> lint") for details.
> 
> Link: https://github.com/rust-lang/rust/pull/140859 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

This commit message is worded in a confusing manner, but the change
LGTM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

