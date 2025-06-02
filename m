Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C01A76AE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852615; cv=none; b=C/fq16lWj1nAJdnu8v874uiD/awy5s6mPfWRH10qxRV6YT+k9+U/Te9fQcCOLDc9+qYIYaaA+/b0uzojKnRKii7A+yEiJhjMSym27yYDQeSAvJHTrFatwPOfkVf1L3m/Nj0g2D2xRpjgpWg1Gxm9771y3ymNyLVmvN3Jd9MXZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852615; c=relaxed/simple;
	bh=aOFhR3EX3yLRRRoq71yFEMxUXXHwNNzkpzLOUfRQOaw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oiQH1qi7TxT/ATaPc1g06ollPgob/j0nCtxXpq8ZIBmLHBerBMDyQs0kQidCfOZkIHIPiqSF5+L/9qeszbKJDVClfbogP3IflQRoToesLjma38x0LFthHJIi9CpTE2uUJlTCibDLsSCmzgkYmKIRDmksKZUltTs7eaC1I19X9Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3nDRB4S8; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3nDRB4S8"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451dda846a0so2977625e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748852612; x=1749457412; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aOFhR3EX3yLRRRoq71yFEMxUXXHwNNzkpzLOUfRQOaw=;
        b=3nDRB4S813caJueZIP9JU9H5y0uzEtMBj6OKd/sqIpP7J5Og9k7dPMXWJPpZSZ/+tj
         wpIItrCuOXxaljabS7a2ON/z07e3Lzxy9v7h2Ae29Dn5EoKagxpE13MDZwbwfBq9WhZq
         ENe+TyfFxTsrw5dX98gY/qyGWXmWOxDE/GjtmwzPWx3IO0OXc+mahx+J1ZWqqv9PJTCl
         Txwx68YpYQOBvY4rNDkR2i7P/l83ZQr0fAYfGeqk1tnVTXYPinZrRWwPc99MCdi3JIRg
         li9Du6857OSYauGrnc0uoyVS7J4eUDbssfX8lVYNObDGbuKaJ86g9uJUxykEyElUL7Gh
         0NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748852612; x=1749457412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOFhR3EX3yLRRRoq71yFEMxUXXHwNNzkpzLOUfRQOaw=;
        b=IcKx0TlHgONb7IX5xCMM1oNHqGRGxy4d7da0CRzkGWVGyCb1OsA2Tg2yncOI+WuNNt
         WeKAP5ywBKoNGS6J+f2OyLPL30QFyfIAaZq9Y/oJtcnzanildbTJrsQaHkb81QwHsyOQ
         kIVHFjH2onCqQMl1C20NZPY5rfIWX9TCXNSHfQhbK4bR0xqXRSK6ag+pb02UwKitxQh4
         p7pprC2ehG2F0RUwcfD1GYY+n+VFjb/q3p6iW/GQ/1S8JHT6CTNsl1tEIyIuT4f2OjDM
         NPkdvgeMw16YGhIrW2wMYgEsFG8MKOVaNapo0jqYLAAixU3AEHer5o5dJSj9NqpZuCMM
         LFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF/mFu8qBn7E2y0/tzW44NbhkezVithXpRR0qpQ7kJbaeBm3fXgel2lLv5yXKW3gNIQhZuphQHMVSsoqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3RDWTBVCjh+27sV6FV9oTRDd8lgoOtbSDeS4CerJG4jMw4q2z
	D9A3XGpdDwtRp2Zt6hZbcEymnnfEW5Kw4tEHp0UneUHJQhQOG0nJqotoMTw6ccmi36Vs9HHHA1u
	N/0DfvYyuDK6syGYvqw==
X-Google-Smtp-Source: AGHT+IHKQn3dNHTzo7/pibcNcrK9MIUCZDm7bncvSusd0pCG2ziX1ZvydZHhkUrmcJPXbtzry2/bfhis8pEKBH8=
X-Received: from wmbem24.prod.google.com ([2002:a05:600c:8218:b0:451:d78b:869d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470c:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-45126574a0emr66262915e9.31.1748852612551;
 Mon, 02 Jun 2025 01:23:32 -0700 (PDT)
Date: Mon, 2 Jun 2025 08:23:30 +0000
In-Reply-To: <20250504045959.238068-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250504045959.238068-1-fujita.tomonori@gmail.com> <20250504045959.238068-2-fujita.tomonori@gmail.com>
Message-ID: <aD1fgizC4FPT07vt@google.com>
Subject: Re: [PATCH v1 1/5] rust: time: Change Delta methods to take &self
 instead of self
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org, 
	boqun.feng@gmail.com, frederic@kernel.org, lyude@redhat.com, 
	tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com, 
	sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, tmgross@umich.edu, 
	dakr@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, May 04, 2025 at 01:59:54PM +0900, FUJITA Tomonori wrote:
> Change several methods of the `Delta` type in Rust to take `&self`
> instead of `self`. These methods do not mutate or consume the `Delta`
> value and are more idiomatically expressed as taking a shared
> reference. This change improves consistency with common Rust practice
> and allows calling these methods on references without requiring an
> explicit copy or move of the value.

For small values that can be freely copied, I actualy think that using
`self` is more common Rust practice.

Alice
