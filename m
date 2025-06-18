Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A2627F016
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233914; cv=none; b=t8Sqx2TBdBFf3LccjM9MtkzlLxdEISAdL4ttOm4ihkPBNSd8VRHjSDaj5MbgjqgM81b67LtGoLRM1KgIg/Hterqgw1nYF2zQyH/bd3NDCRNttSBPPe3AWXP8XUJJUsrl67L+W4ZmQ5sqwgOdPVaCFFYzZ/ehPCorr+s4rIhl/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233914; c=relaxed/simple;
	bh=xmSXUMfykh4nw/YifTvTlA40+QuG0magFmHqx/bM1SQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eZX4YArXC5FAhjrkN9S58E0+CzB4ZEbO8ZnTXM5PpZXHIr11gzDb4vAS+ON5wu2h49cIElEcmUIgziqBX3x3AtlrRFTsqzbXo9gzUb7ahGkiztmHRzEuIRJ02/TatEVA8rV4fLn2ugvuAFUYIdrioRvy/LPkZYwyD4tt4qHl2wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2U2RLUO; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2U2RLUO"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so42682645e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750233911; x=1750838711; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Reyy2Vo/aUVZICYuurjbtaW+Kc54btuPia1WyJEBiCI=;
        b=H2U2RLUOiXehAtddQtSGaxhpxAUmwLBe6LtUcnMVbFkJzL9sS67sSjuH2cvIukQVca
         h5j3huv15csSZ8oIzLzNRL3ntYgUFAhTIwHA76mm7xcLtvkfeQvRqLp4Ico8lvSfIvk0
         4cTDJanaPDZusm7/knqfmhdL9MUKbiWwgQwUj2M4yZE5o4DisxVW08trda/HqbLWq8t9
         dZKTrAzvPRxi3TA+yU2hRPa0tY7JwcT62fY+Nh+xKo+8OvB11Yph5pROkzADBFX18UUf
         amjJMFWQ9OFTwgFtTAoXXiw0OVCItin7Hml8NK/oMLZv2hcTnqlX710zd+ON66KCCiQ6
         YvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750233911; x=1750838711;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Reyy2Vo/aUVZICYuurjbtaW+Kc54btuPia1WyJEBiCI=;
        b=eA/b3FppHSscXhhorwNH+Z/UrR5q4Lnifc2TDedbqILqGipzrrj/73AlNODRTxT3yg
         qdP8qYHpmyN9owJyc8KxdO9KmfSKm46S9blPCEBdDhWwa9kUtcbnyBBMQ6vRvOr538ob
         BTW/SPv/6Y1Jx7CBXpeNIT3HlafM0j6Wp6XYGLJAhVN5ZkA5y4ftYHx5BLZjlVKSN7tt
         ntiBTShpZcfEpeUimHmnKQPbj/U3PzHIMqzsr1vy6WvLXXjdkq7MGrjR7uCzsrNKJSG+
         OSK3fqjV++NMq+QWo/P5azG9Krj/3IyiJUZfrzFKbpCFLEXlo2iNPLlvMePHZLXeM6NF
         wTcA==
X-Forwarded-Encrypted: i=1; AJvYcCUEYq3UIkBO6xrJXYaVqxrVEkPoHqFP2S5ylpvqq3en3hG45khHj2qyPqzMNiNqgP2DyJ5A1LVPwfi788E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4c20FBXpT7I4C/0hnv6dGk42/JwaMIlRABhY7N+unsT89LJld
	rPdzjUSa6Vs+LFgqtkIK5Ji4/GcvuvwPxWZIP0pyx9GojifNNs8MnFpM9QEO7YQ5rdZu+qIo359
	+k4THds2gUsUK/n+8mg==
X-Google-Smtp-Source: AGHT+IHZzoCd5qIoa57TZulv3M1zEGEaPrbzkY3TQYkZxGA8ZmuxEDik7fsdLpNZuWn5aXvctdP9XoTIAiXPWQY=
X-Received: from wmbel22.prod.google.com ([2002:a05:600c:3e16:b0:450:dcfd:1870])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6095:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-4535627dbe5mr41001925e9.8.1750233910920;
 Wed, 18 Jun 2025 01:05:10 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:05:08 +0000
In-Reply-To: <20250617144155.3903431-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com> <20250617144155.3903431-2-fujita.tomonori@gmail.com>
Message-ID: <aFJzNCCERjKHIVty@google.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 17, 2025 at 11:41:54PM +0900, FUJITA Tomonori wrote:
> Rename the Delta struct's methods as_micros_ceil() and as_millis() to
> into_micros_ceil() and into_millis() respectively, for consistency
> with the naming of other methods.
> 
> Fix the commit 2ed94606a0fe ("rust: time: Rename Delta's methods from
> as_* to into_*"), wasn't applied as expected, due to the conflict with
> the commit 1b7bbd597527 ("rust: time: Avoid 64-bit integer division on
> 32-bit architectures").
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Why are we renaming them? The stdlib always uses as_* or to_* for copy
types. In my mind, into_* means that you want to emphasize that you are
performing a transformation that consumes self and transfers ownership
of some resource in the process.

See the api guidelines:
https://rust-lang.github.io/api-guidelines/naming.html#ad-hoc-conversions-follow-as_-to_-into_-conventions-c-conv

Alice
