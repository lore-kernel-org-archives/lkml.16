Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44494307AEB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615776; cv=none; b=jLvM/LsbvDQaYg2h6LN6v9yQc5Ts31Yp1rjk6rHl/lGPf+r6UUgEWtE/K+9+TFdgQ5Xv0rm8Mgw/0zWi48IrF6Emd2Ow1DE6Cv6V8oiDWpcFFK9uKiofIPG0TLaqHyLxiHzWBJ8MxfjhnGoLsIfaiF9WRN/MLSKweldvKXE9Rks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615776; c=relaxed/simple;
	bh=USWKQ8TUWEbe2dXOSayzqmwjr97ZZR+cVPMayI+cpVw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Iup/Sg+CwPDAUl9hqbq86lgrJy2Y1c9mDxXBqf8y4u2Xj75aPN6afT45fJ8VQtT318IDudmKfb1XA7vX+ATMj2V/Ex4WSEL6zyNqYyOnpWUyr1NWecjCuTAB2EF7zfHijRb8f02M3aKhgcUll2jtOXY+lj/QOQr4olTRTWBUcg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u6I9kz2Q; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u6I9kz2Q"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so3133005e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751615773; x=1752220573; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JG8EUcagku8Vh5DXjRtvabyAVm0WLpqUIOVqfkcJwbs=;
        b=u6I9kz2QWZbhUtAEYkF6kePmvl68WVXic9+8v41VGp1IunYOhGnS5LlkodP0ASh2py
         a9uxLbFniBvb/vUgEyPR6+sKI+ZDbX6EIr4OcQBMAxhxnlakqlMt9ntMbObUdmMNW2lz
         u3lT02dL0MT6UcL8RZ7gSC7zw5B3MQD4vv38b6EfmYAqmQoQL88scA5Zk1B/rm1vW2nn
         7s7Ix7CnDVcwojG/njXqaC+U6BWqeCukKmPCVT7TGcr7/VcmdDBBRuo9CeLvsK/mgPBb
         FOIj8MlWS5vR9zdXL7KdpUXhrVX891JPeF8sW8TVb80VBwdEXAPDOIbCnaMx2nlVyJXP
         RWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615773; x=1752220573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JG8EUcagku8Vh5DXjRtvabyAVm0WLpqUIOVqfkcJwbs=;
        b=KvFMZ+hsOcFlqf1HA3wvvis1/iQd8LfY7mO48e+cvf/o+2XvwXp63RpnAKULZVItis
         m0gDSC5TsROrXAD7E1hExOp8CMRfzYJwZC8bxGI3Rhqd+zwDD9WCuypXBD+TDD8aBuZT
         OcZ6ikcaGUj5dMHbZNLGGHwABwmEAx5Gsn/8ZRGDvBmSF910hAdkxki9jDEYwcpwezkz
         QlsfbuJuJdd9FXb3cUTijnsRrTJqgs+dFjPU3hcpXcnJEebFvbt1JuKfKZ/V9hG6sPhM
         wAIJ39zduIQcsQpNVhTn6/t1TiMxoeQyYjHw/O510Xwfo/O1Y6tjp0e5KJjNMe3h29ba
         AxLg==
X-Forwarded-Encrypted: i=1; AJvYcCVkZC6KfA4+66CFE317pE8xp/pl2z6TNRU/jXWW0+bUxXdO2+Mx00eYZwNbDj1nmIkTZFzknbbmeV/p14A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8f7k7U0hfDMJB1LjxDXa+PzbbOVu7q/hufOI8+tV/Kb7ul2fV
	8pKQdN95+aSe+XUMifsFzPhNnn6wWPedaZDp2kfdxa91if//S2HS1rE02w27H5Gw1WNbiiOKe7r
	h09TKZ2Ku0xyZ+e8A5A==
X-Google-Smtp-Source: AGHT+IFt1K+zXpV8ULnh35HNMeqS84OzLpgxd3xT6XQEwgQ8mEJZFXYVD8+XzXTHQyRAOPvDwVii3QMu9tkP3IU=
X-Received: from wmbdw5.prod.google.com ([2002:a05:600c:6385:b0:442:f9fc:2a02])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c166:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-454b30fe377mr14697175e9.18.1751615772655;
 Fri, 04 Jul 2025 00:56:12 -0700 (PDT)
Date: Fri, 4 Jul 2025 07:56:11 +0000
In-Reply-To: <20250703-topics-tyr-request_irq-v6-5-74103bdc7c52@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com> <20250703-topics-tyr-request_irq-v6-5-74103bdc7c52@collabora.com>
Message-ID: <aGeJGw3UQ0zeFYXm@google.com>
Subject: Re: [PATCH v6 5/6] rust: platform: add irq accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 03, 2025 at 04:30:03PM -0300, Daniel Almeida wrote:
> These accessors can be used to retrieve a irq::Registration and
> irq::ThreadedRegistration from a platform device by
> index or name. Alternatively, drivers can retrieve an IrqRequest from a
> bound platform device for later use.
> 
> These accessors ensure that only valid IRQ lines can ever be registered.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

One question below. With that answered:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +    /// Returns an [`IrqRequest`] for the IRQ with the given name, if any.
> +    pub fn request_irq_by_name(&self, name: &'static CStr) -> Result<IrqRequest<'_>> {

Does the name need to be static? That's surprising - isn't it just a
lookup that needs to be valid during this call?

Alice
