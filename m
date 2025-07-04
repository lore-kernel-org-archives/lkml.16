Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC33C27EFEA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614155; cv=none; b=Lt2SnOw3o3TnQQqEVJN66wsKAegjw01jEUP7SEHiDVPPDsAJ+DTS6l57mGgUCL0YqrOTFQlF+muDhbKsbo18gEq1HwqD35dz355o+BoQxmMXczcrmJBDWoOryeOsKpUZhXvcc4hbPSk7MB5l4TGC1N1bjssY5sGVOwVcH0Duxt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614155; c=relaxed/simple;
	bh=aE9AaBY5AmaIc/TSlJk8xYSEDgun6T2UHI+HfGjj9Ps=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XhIYOjhm3OgdRS52sniBaQyzw21z0scpYKi0Hjn2psIYGnQd4QirtGiA9nWOXgdTdX/uJQDdUzyn/ce4M2jZOJycodmwpwCBh9AmLbUuMGxCJV5vCR4EPNxysaOybYcdIsFKjKH1Nq3jtxFZp8OBrBpQpd5GUW1qsHyX5SKtdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MbY34r+O; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MbY34r+O"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ade5b98537dso65865466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751614152; x=1752218952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf6uaybgVMOXPAt0XHGcRybgeX6DJY7grDqhABQTmPs=;
        b=MbY34r+OZ4sSh2m2SdOrH33bUI6tfxNnlQubN9dK0Z8TO1bCEu9V9P8Gbcg4U7TrLF
         fpebk7icnlqoKqu0FsV8YPQkif98qheH+IidJZ1syjSa63QOv0RQj17oxRMCwWrZc7UY
         4VLapkR1iVJmFnvKyE7EFrrRf+2nggk9SLDBRUI2CKPlIYiaRWncKK+gEaI9cdXBlCMo
         CI0Q2WQX1HWGlW9gmSdzyeTpvgvbZMUw0z1ROMfPEPcsNpEzb5fDU/W8qu/gnX3KIWwH
         9c4qVStkumlKZMos0xXikmU8XoxUKCuBUjNAHASbHn0DWNS6Rry5Q1+d9ojSFfLSSAet
         x6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614152; x=1752218952;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gf6uaybgVMOXPAt0XHGcRybgeX6DJY7grDqhABQTmPs=;
        b=PqID6JKDO1vbLo3o9bSBGcpzCTSi9+bt+H7nFtDGjKk6bd7PrTHwbC8G3Bn2OAoZg/
         V75v1luuq2pyKUT3PAHHHGi8EYvcd2bc/KNIggAkUB6ZWoIT+nHvh5RUeS/m8vtzQDsV
         yCQpq9X4TYrkaGelrQiImixtKouxDMchG10bio171Y1zTnqBPrMZo/bLZ+seULFeZYW3
         el3GLq2Te0+W/EB/DmVlP/WbVdkmBvyhQuma3iDyqupr4Kpg9tnErVnmA12KFh47uM2s
         MZV4CVZjVdCNJqRfqsbWubZ7EttXq820NFIKAspbH2Uq7uJYuXCByo/TNfmig9cMehI8
         dKxA==
X-Forwarded-Encrypted: i=1; AJvYcCW3oVan9wgHFSnszMoTSH7zKTwDNohC0Ea/RhjNsvxBcyd2dWOv0ThwHLoENf8Mv9qFoVQhcJKq/3LDhT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc90pSMfWPcYmAqqoNWMuvglD15r51KjpfSSLZDOFJFwmlYk6G
	l6Kre9zO1Y6ODfd1GVzUm3h3TW444Bl09tZlbgHA5NDmsSw63+wMXcQ4zPkTpZOGk2i4kPzP7Hd
	om2pzt5fhTQ0wJDtAdQ==
X-Google-Smtp-Source: AGHT+IGp9FJse3ErpiN0ssWTw95ljLS5jOUthXxjTSM3lcoarrJg2X6yKdGrmZzth00G3ncOAWatSsk1f4c1EMU=
X-Received: from edbcy3.prod.google.com ([2002:a05:6402:1c83:b0:60c:7d86:df07])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9805:b0:ade:35fc:1a73 with SMTP id a640c23a62f3a-ae3fbe45f37mr140704966b.55.1751614152193;
 Fri, 04 Jul 2025 00:29:12 -0700 (PDT)
Date: Fri, 4 Jul 2025 07:29:11 +0000
In-Reply-To: <92c347d7-4b59-436e-b4ce-5941bdc42cd8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-topics-tyr-request_irq-v5-0-0545ee4dadf6@collabora.com>
 <20250627-topics-tyr-request_irq-v5-3-0545ee4dadf6@collabora.com>
 <022A0919-37A5-4FF0-B834-333E512EC0C6@collabora.com> <92c347d7-4b59-436e-b4ce-5941bdc42cd8@kernel.org>
Message-ID: <aGeCx5zHUPKtaryg@google.com>
Subject: Re: [PATCH v5 3/6] rust: irq: add support for non-threaded IRQs and handlers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03, 2025 at 08:49:07PM +0200, Danilo Krummrich wrote:
> On 7/3/25 7:12 PM, Daniel Almeida wrote:
> > > +/// Callbacks for an IRQ handler.
> > > +pub trait Handler: Sync {
> >=20
> > I wonder if we should require =E2=80=99static here too?
> >=20
> > Same for the Threaded trait.
>=20
> You already have
>=20
> 	impl<T: Handler + 'static> Registration<T>
>=20
> which I think this is good enough.

If we're not going to support non-static handlers, then I think it's
simpler to place the 'static bound on the trait.

Alice
