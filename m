Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E2423A9BB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452576; cv=none; b=LpnpXubhfjlhQplMB3d0YAYyB6VlcacJ0fMhmoSz9NYqKpaRberYdeayrkAHYbeVj2ZCTsrcksKzQ4Ck0yjQO7ck2LK/3Oy3l85sYH32OAOjtZBbgK8AXwQ4PXIwIHVkAe+Q0x5lgnc50THnKoZRnP4K1QVdDQGe5byxFvi+rNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452576; c=relaxed/simple;
	bh=6BTLf6ISHYhGDHXF3MGnZEjV5r61LiIu1vIg8OUZarg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDzCpvrFEC/DT8PC5LHg6JpFxzWwYWKvmkXYTJCN1yPCS4SW1BwOJ1cYKCHHBuTrHoJBf9lBudIEwMy+uev8b9LGTn2WKh/zqfPVVVW1gK4x38/3L8pJiYMEdiPj3rQF1iEMUGyXx9bIDGet0tHfnrwaI5WmbqPr7vtyeH7npWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gMa3wkpW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gMa3wkpW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4531e146a24so39439105e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751452573; x=1752057373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oydJRIGVVKdcs3hBftgXn5qMgnpv/cqDs2EcUz8BAU=;
        b=gMa3wkpWnkxKiETKZJZXf0rMLlShA/I12UuaMZ8+iWA+Jb24cPPKBOs18MeIHGcHWT
         ArkKYi8/sbes5TH0rZI5vglSAaLIj2uQynhvUmH61KnrYXGh0gjfpT5XezuwJy2OreDJ
         hwrEV6gM1kWtwdKiXfKXC3aWxO9yDpWRyNSqFKcBwoRzs3dbqJkgGolf9vHOMlp6So9v
         lRZ3LhxmT8eR18eT8P7SazWs3Mc8JnjAQJ6wrDprPIPet/90l9OgTCES7RJW/ocFnr49
         4ZihM1nLB69jg0rT20Wm1l3Z02wxpihxnQs5FaZojToNZOuHp2ZHtvsqQMA5l2OyzQzW
         GU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452573; x=1752057373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oydJRIGVVKdcs3hBftgXn5qMgnpv/cqDs2EcUz8BAU=;
        b=UDC8t4YgXAAm9WHse/vU+yF28WVNspatYmRXhEIvIbM+RsIaHwc/qNt/b9PoVSb8xo
         WPVC7cySkbQXCMny5TwgA4ht9ey3S9AOd6RVg4oaUSuuouKO+HwEPMXtJZTXkOUsYjUA
         bInuqFhfZJK2tJE+pGMfus7LO1MPbQEnhCtuKNrBvo+iNxpBBA75nK6k7XEA2fgHyet4
         8gw8HuC5mQ5OvxmPQF8OCRYTSfOGBms18NTwN6SMJDTICn762L7VcGqzwfdqU41h2QqV
         2S76QS0VbRUWo17ziFP9kIqimJN/rkHUUoeV0Uwa4iyQJtTwL3VHs6hldJpal0mBfuwR
         v79A==
X-Forwarded-Encrypted: i=1; AJvYcCWrsrwSDTnDMm2sCe3I2LqHeaLKOmwSiJkuN5N/ISJ0QP4HY7WD2F/qMIEZuE3wUq14WfFOmLl7Ef5uaCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK8Pq1EzEvpO2IADLRCpsWI+SeiT83XJY1e9syLXFP09fvwdR1
	aKPTl+cTLqIg+gM+TsF0hEyFDxqRpBDeJSm0IbyYtxDmRjEZB5MgAMLTPJWD2EB1m236mNgUW/8
	pOzsiyoY9zjxsm8lSBc1tNlZI+O6hfSi8Xqbbxx46
X-Gm-Gg: ASbGncuPMiD0cvyjXJjTcdGJi9th+36ufMtt2aLaB7iC/ze6Ig3p6o7pjn58qWETUTu
	jzAfEzDNtdgEukxlALSYUfeC4yX8V+awrOGxex8duM+PMIqPB4GnDGvYe1LNCLt47FHpMiwq7a0
	O9D3Xn8HyTCul9oVlNtcFopocogaceLLOGDCkkndhLFQUEl5lNerNqhw380x59tp4VOHxfEEA=
X-Google-Smtp-Source: AGHT+IHK/x5WENREUpSHoDaQ69usNW4N3SQvoSrE1suA0H1FYCXOehqGtWeSnIlRb5GgVDCjkODseqJ5xuPgXXWM4ZY=
X-Received: by 2002:a05:6000:4914:b0:3a4:eef5:dece with SMTP id
 ffacd0b85a97d-3b1ff9f5966mr2009149f8f.35.1751452573053; Wed, 02 Jul 2025
 03:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com> <20250627-topics-tyr-regulator-v6-1-1d015219b454@collabora.com>
In-Reply-To: <20250627-topics-tyr-regulator-v6-1-1d015219b454@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 12:35:59 +0200
X-Gm-Features: Ac12FXypzQds4qro7YK4zyY01V_sHxEReb9QyIQVZtL_ChhNn2gilP91w2R4vCQ
Message-ID: <CAH5fLgj_eKuo=E7HPgmd1bJNfidGUS37MM1QqRaQ_MJ2kTgCmg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] rust: regulator: add a bare minimum regulator abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 7:11=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Add a bare minimum regulator abstraction to be used by Rust drivers.
> This abstraction adds a small subset of the regulator API, which is
> thought to be sufficient for the drivers we have now.
>
> Regulators provide the power needed by many hardware blocks and thus are
> likely to be needed by a lot of drivers.
>
> It was tested on rk3588, where it was used to power up the "mali"
> regulator in order to power up the GPU.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Overall looks reasonable to me.

> +/// A trait that abstracts the ability to check if a [`Regulator`] is en=
abled.
> +pub trait IsEnabled: RegulatorState {}
> +impl IsEnabled for Disabled {}
> +impl IsEnabled for Dynamic {}

Naming-wise, it's a bit weird that IsEnabled applies to everything
*but* enabled. And also, the is_enabled() method should probably exist
for only Dynamic anyway?

> +/// ## Using [`Regulator<Dynamic>`]
> +///
> +/// This example mimics the behavior of the C API, where the user is in
> +/// control of the enabled reference count. This is useful for drivers t=
hat
> +/// might call enable and disable to manage the `enable` reference count=
 at
> +/// runtime, perhaps as a result of `open()` and `close()` calls or what=
ever
> +/// other driver-specific or subsystem-specific hooks.
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Regulator, Dynamic};
> +/// struct PrivateData {
> +///     regulator: Regulator<Dynamic>,
> +/// }
> +///
> +/// // A fictictious probe function that obtains a regulator and sets it=
 up.
> +/// fn probe(dev: &Device, data: &mut PrivateData) -> Result<PrivateData=
> {

The `data` argument is unused. It looks like it should be removed.

> +pub struct Regulator<State =3D Dynamic>
> +where
> +    State: RegulatorState + 'static,

You can add `: 'static` to the trait itself to avoid having it here.

> +impl<T: RegulatorState + 'static> Drop for Regulator<T> {
> +    fn drop(&mut self) {
> +        if core::any::TypeId::of::<T>() =3D=3D core::any::TypeId::of::<E=
nabled>() {

I would avoid this kind of logic. Instead, you can add an
`disable_on_drop()` method or constant to the trait and check it here.

Alice
