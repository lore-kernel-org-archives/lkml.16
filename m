Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C18925A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236218; cv=none; b=MEXgiKBrukkvJr9FeWE9DwP0eqTpfwx1NwC6IpklloxwKDeKuvXClyWeO0cPsUyt34NU+oumGTRbeLa7pKOH8+eM/IUsKFF4dNkUK4fwTdypv/vpV/0CJEYsO3fC1ZKETrus10wlyfZfMY1Xr2Igk8yhZ6dzGTj3LVcmOV3xjp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236218; c=relaxed/simple;
	bh=ahGo0gZhCU3CeDsK6pb/bUJ9TVXFQfyAAc99pp1Tkuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L/x8hzY59AJ+m1M9dRmM9iJZq2pbHYVQAs41IRyam8DkbJDyLgbCjDQDTfElZPWxsOQjuWYBQ9srOPS1F+wclYVuKD6F+G4RsZ2tuaEibwBHVU8fSTpyoVzmhLi2LxjySv8FAhPYIejRqR234XL2viKTPY4e4BGO55nlQEei7W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C0zjnj/J; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C0zjnj/J"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d5600a54so55992005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750236214; x=1750841014; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikmadVtxSuGulRLsrZM3Z70EtlcT0yd6ifXpM9KcROA=;
        b=C0zjnj/Jq5Ot9UuLqUCEb/EDPpV9W1uaLPdukqNjp9YAlXYNhialfl0SAzuATSjC/6
         PQHCr4TM11edEu3uxObyYzXxeO6mRvoj3TOzJoM056TXWYHQzxCbh77dh9A3VhabaPG9
         SRXykbCsjXvEabRaJOqBzzF4bnwsIfttXbkfxkdo7gDn13j392q5hfNk+HpTibVRhGAG
         2RZHLhi+pLytdxBWJwnNDJZNhaNFBI2RuZG0RZlpRinuiseHIRp+MtFKqGwXvD77wKBp
         6tkQ42pIjA1JpcUUDrGToMXf8DqgdK/9ruDe3yt1s+utDvFaZ2ZWQcwkm1v5B7ItSVpF
         t6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750236214; x=1750841014;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikmadVtxSuGulRLsrZM3Z70EtlcT0yd6ifXpM9KcROA=;
        b=MnVFKO29fyB4YntgfSWlOvg6RDx97gzhd6YuZRrOWyr1aXYCIpOTItYvmQJCvPzz3e
         6Qo2RK2j67NWGAwB+IIwuubYwP7TEYSzY2NShJv1DihZvs2WWSRHhXWAY87eaz6v7JSh
         F3QMpXTlNZyCGOM5jnEs9UUxoEObSOS3Ty9tsGpqncfxUb8Zs2MCg4Arif+4u3Jo7ad/
         UwPXEjUXAjTyKmiwIp+VUKH1nis3kQVSD3JuHkMyfQom5v9/nxcrGlPrmo3khTMhP916
         HTUG4PcBngXJwF4SuFQl8F0KbfNKgpHKVgelXw7MJKCJhdiei3EjVkxxf2bm/WTBZBq6
         6AWw==
X-Forwarded-Encrypted: i=1; AJvYcCULExURX9Ov0M8bndQ0DKUeDLNeUDHpE6PlCAFi5HXm1MhErPcLRtE4TQxWoz9p/VgsngUrbzLdL/ScxFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZe6oCzxxs+EO02EsLaRskWXe4V85qYjMsDjib7Qq9Zr/nhATV
	b5SakAv1yXOZZMJ41bDcaxA6pjRfsKNj/6Nvq0fR3in4XB4xhHkQpMQ1o/qdB2H36/i2GroGvrA
	e3ZfMFrB6Lg/Zf5Z5pQ==
X-Google-Smtp-Source: AGHT+IEetsSD1WOYtNY17gx1HGwTCmQudaYjAErSn4cc8fGNGI5dUnFqbwBCgT/0uHY/f0RFOpn5wA9QwUUDcuw=
X-Received: from wrmk10.prod.google.com ([2002:adf:e3ca:0:b0:3a5:7b08:ede2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2007:b0:3a4:dbac:2dc1 with SMTP id ffacd0b85a97d-3a572e9a0e8mr14675077f8f.54.1750234895372;
 Wed, 18 Jun 2025 01:21:35 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:21:33 +0000
In-Reply-To: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Message-ID: <aFJ3DZbCwstu38G6@google.com>
Subject: Re: [PATCH v6 0/5] rust: DebugFS Bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 18, 2025 at 02:28:12AM +0000, Matthew Maurer wrote:
> This series provides safe DebugFS bindings for Rust, with a sample
> driver using them.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Overall I think this series looks great. I left one comment, but overall
LGTM.

Alice
