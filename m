Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5145A28030C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614978; cv=none; b=O1ejhbcTwAIq4DfJrUxphKWzT0cNomlob123Xcn/GRtOBGH0k2+WNop+YwORsMpVgEQtGAE1JbzjZodBMXVD63Ia2vqK7NkU0ww/59PLEoObUFXuTVIv7qRGcFxUACXZ3hNWAc554o1tUmKkkchXvKAtRYwLAMxtcFQFvJN0Kpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614978; c=relaxed/simple;
	bh=EyQLopdaeuTERfCjyDX1RB58tHyhweNO8CjnstLUYcY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hHZ+228drwu7/80pu44av0gtP1sObNVEydl4a2w6W59wEasm9Crhw8idwM43GozUE2ELkGDskhfqo76DE18jLp4KrjOs+s8Bwe1Vf4uP1XpXIWRcnkpay/PKsO3WpUqB1AVBdZg9cfRiL7hvTaw+DS2ahe2HPqq6RVKGtblSqJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yh0OHdj2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yh0OHdj2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so3068395e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751614975; x=1752219775; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=camNvxFIEl2ZnilHFyd5vJLomyvuXbAyAAA9+dCBwRk=;
        b=Yh0OHdj2x/5dobS3e0IYb/wzFPkD/Q/j+gomI/PCukTIfTUxk0NxPqmst+J/zFYtDi
         rbjo6S/jAgyjH5zmTL53J36J9Nzru1a8TcfZDIR4U4JcdothxycXX28ntOc14wvSxlMT
         Yj8t7j/4yIvkzqeYV/NAoNrdUJLDjX3TX40cAYE0YRa3mW/QzADjMvcn9Ul+QBtOUUWi
         fOazyaV2UiCprvYVhUQtIdXPUfP7fz88YRZi+9Lzd+zYz7GO0Kx5fWg8Ukgd197khViV
         YjrCnfMAStcbQNMk14kq7/KvNGMS7yDLj6Q6KyDfqQQxI/DYlNiFGfSI3ExzWwr83Leo
         k8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614975; x=1752219775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=camNvxFIEl2ZnilHFyd5vJLomyvuXbAyAAA9+dCBwRk=;
        b=uoSUD6TLVT4GF02fNM2h79Qo3MoEkkysouilDpDjS6WNGOxo53wyE06JGzKBO41Vxq
         FgacX76qfPlqtmlUmdhAIqHwD0clxufczPp5bFhprI7HIsIcrs+ivkzdS8VHilxadLEO
         DFnUcQWHAf2l8MOsykRZ4Zxv9YNquGVJ14IsZuc4/ept2PhXmKQbdhBn7pUKJ35jzI3P
         go0YVLkoYySE6FrmUoDnokMnF7BtH7393gGr0ux0RAM9AkwePEYO1wWEAZt3W8RdYd/B
         +rPIy5Bhfjg8/JHirxD+bjB2q7KAUiiLZc2l9aD0NiQ+N1j4b3RqvBs3h4+0NMpAGLe1
         baug==
X-Forwarded-Encrypted: i=1; AJvYcCVUx/CmIRvMcLCAWEwCjhE1tilUw4QbW/sgVVNf5OBZQlmDWD2dbWpzJT9qwP6+idvJXuSrgIhcsdNY3uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4wVPrQCL3/kd7Cho8YMnXkR2PhG6qYA6OH4/ruG/zkIEBc9R6
	ThYojdhE8Gg0eJMm+mDBKgIZoMygnTBc5r+mYOFAJU1ODOSUvrMyync8JFtI+O1juZTNu+8zUxo
	wcNVM1O9570oo1kKWSQ==
X-Google-Smtp-Source: AGHT+IEaYSraVJ6sZtkAl+0ugpmkdJfooBiBpMK4mkQLrv/OlSZBW7BofC2dgtjJxBr8tWhlM0xayMRReusEiag=
X-Received: from wmbfp26.prod.google.com ([2002:a05:600c:699a:b0:450:d398:f3ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8218:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-454b31134d2mr15309935e9.27.1751614974821;
 Fri, 04 Jul 2025 00:42:54 -0700 (PDT)
Date: Fri, 4 Jul 2025 07:42:53 +0000
In-Reply-To: <fcdae3ca-104d-4e8b-8588-2452783ed09a@sedlak.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com>
 <20250703-topics-tyr-request_irq-v6-2-74103bdc7c52@collabora.com> <fcdae3ca-104d-4e8b-8588-2452783ed09a@sedlak.dev>
Message-ID: <aGeF_W74OfhRbkoR@google.com>
Subject: Re: [PATCH v6 2/6] rust: irq: add flags module
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 04, 2025 at 08:14:11AM +0200, Daniel Sedlak wrote:
> Hi Daniel,
> 
> On 7/3/25 9:30 PM, Daniel Almeida wrote:
> > +/// Flags to be used when registering IRQ handlers.
> > +///
> > +/// They can be combined with the operators `|`, `&`, and `!`.
> > +#[derive(Clone, Copy, PartialEq, Eq)]
> > +pub struct Flags(u64);
> 
> Why not Flags(u32)? You may get rid of all unnecessary casts later, plus
> save some extra bytes.

It looks like the C methods take an `unsigned long`. In that case, I'd
probably write the code to match that.

	pub struct Flags(c_ulong);

and git rid of the cast when calling bindings::request_irq.

As for all the constants in this file, maybe it would be nice with a
private constructor that uses the same type as bindings to avoid the
casts?

	impl Flags {
	    const fn new(value: u32) -> Flags {
	    	...
	    }
	}
	
	/// Use the interrupt line as already configured.
	pub const TRIGGER_NONE: Flags = Flags::new(bindings::IRQF_TRIGGER_NONE);

Not a big deal, but avoiding the cast when calling bindings::request_irq
is a good idea I think.

With that:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
