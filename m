Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02E26A0A7;
	Wed, 25 Jun 2025 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864372; cv=none; b=lQkwSa2UVJ90o8OqwF4O8rIA7dKySHMGRd7tR24xR124MJyNIqEMQlxP6zRZoHgxFW3co2+8XPru/LPSLBrL6kxJ/Ay92DExoB+qtQH77XMG5GvrCHrXflsLkhSZCXJPe1EHkMnOTt0mNBm9rBA7Cn6av7b3fCe/zO39wUUR8PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864372; c=relaxed/simple;
	bh=8B8EB5C4bDP914XiSA50ZOB00ACP9JrbvrFZ+G7UEVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlOUe/7siqX2hFelmc7hfsEQKT8vqbwGgUMxo/dusrKRxocY5hsKOBv7qv85B3dvZl2wgdsvZda1TbtQ04v+VfRo8bLbGkcHTavkegnP5bCNVw6gskaAapn7Nb8g9uvEPo/mRs7xmaCvEuWbbjnU/Uuax5AtYFeFI0d4HohQPZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDwSRFdc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDwSRFdc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC23C4CEEF;
	Wed, 25 Jun 2025 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864372;
	bh=8B8EB5C4bDP914XiSA50ZOB00ACP9JrbvrFZ+G7UEVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UDwSRFdc2BMgAGRWN/5dBDJkaR6wRCuSLLRMxN7Kl3nl2G1Eo5ZyKxVqQbR1jHGUc
	 TWqz1rfvmZKM6DwIbVanpDGChOajYvpc/5DFkpy0C3+b5u85/7qGW2Lst5s4s/O0tY
	 QqeQHaQNfeuu0u5DQnthJILdFVkGwi2AbyqXuoOlqrHzGaBuhkHAO6HqiLIcw+fjBF
	 uiN7iwWda87w45HVtvXu9SJ7ps9wScngPyMjzdbukvWAxEK5Lec92WNYzU7A8w8lpK
	 PZxrNj8HtpWxgDY8vGIA91seLpW2RVAtMjvQ2qeUwuzT/lRpA320GYgY6bCH6590DF
	 8xerC+9qfTXvg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade5a0442dfso308475866b.1;
        Wed, 25 Jun 2025 08:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWB4+vFtpNi0+VAJ48zjh0jZzplIckgdbfHWmi5CMD8/s9v338QfDqLlLl3+M9xB4ZKliBwILtWjkr5UIncqAo=@vger.kernel.org, AJvYcCWvBJf6j7nS/D4DOiCoMmKNVZZb07xiry7Ua2q7WUEs34cFpXX7A5DfcqVz/vumLhyHYYab9NUayNYAplWH@vger.kernel.org, AJvYcCX7BuyvE0RaB6av99BR/ktZVBv2wpfMIN+Nx2lpKlixaI5Fv/Wo5gUoL59/wccS7rTi6PJvBjq40xh+@vger.kernel.org
X-Gm-Message-State: AOJu0YyLY+Rg4O+f9mgMKk5gd0587KhWdnQzf2tSJw6lzhNefY30KKTr
	xTjITyIC1ken8egqQ8y7pXob8ggfzZCqH09V4XNv7mekgmJHIJajhp4KudV/Ahqe1XGXUAhnfI7
	sUebJPYnw0vuOOn8boIZ9MO+2sOi3LA==
X-Google-Smtp-Source: AGHT+IH0xjBIKjCg8Y/FDg1k6tSPh2yk2tW+su8N5OXdu6yGDfAtp+4rewK2AcGvAA5j7/XEWpezURYGtXp24dk2GA4=
X-Received: by 2002:a17:906:6a12:b0:ae0:a1c8:91b2 with SMTP id
 a640c23a62f3a-ae0d0d593e8mr32877066b.50.1750864370583; Wed, 25 Jun 2025
 08:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616154511.1862909-1-remo@buenzli.dev> <20250616154511.1862909-4-remo@buenzli.dev>
 <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
 <aFXipz-B1vEYkww9@cassiopeiae> <20250625143930.GA1006384-robh@kernel.org> <bcd9c013-4df3-4c35-82d1-e6fdde7829ea@kernel.org>
In-Reply-To: <bcd9c013-4df3-4c35-82d1-e6fdde7829ea@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Jun 2025 10:12:38 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GTzJH3t+muBZtVjr=xD6if6u6vgdWsnQ4togHg+-zHg@mail.gmail.com>
X-Gm-Features: Ac12FXwU4N7Q_q8GOtxAHqwfpqOs7xlVr0jd85V5SuQtLvpVIzrM0aUIJWVJxO8
Message-ID: <CAL_Jsq+GTzJH3t+muBZtVjr=xD6if6u6vgdWsnQ4togHg+-zHg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] samples: rust: platform: Add property child and
 reference args examples
To: Danilo Krummrich <dakr@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Mark Brown <broonie@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 10:09=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On 6/25/25 4:39 PM, Rob Herring wrote:
> > On Sat, Jun 21, 2025 at 12:37:27AM +0200, Danilo Krummrich wrote:
> >> On Tue, Jun 17, 2025 at 08:01:08AM -0500, Rob Herring wrote:
> >>> On Mon, Jun 16, 2025 at 10:45=E2=80=AFAM Remo Senekowitsch <remo@buen=
zli.dev> wrote:
> >>>>
> >>>> Add some example usage of the device property methods for reading
> >>>> DT/ACPI/swnode child nodes and reference args.
> >>>>
> >>>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> >>>> ---
> >>>>   drivers/of/unittest-data/tests-platform.dtsi |  7 +++++++
> >>>>   samples/rust/rust_driver_platform.rs         | 13 ++++++++++++-
> >>>>   2 files changed, 19 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/=
of/unittest-data/tests-platform.dtsi
> >>>> index 50a51f38afb6..509eb614ab2b 100644
> >>>> --- a/drivers/of/unittest-data/tests-platform.dtsi
> >>>> +++ b/drivers/of/unittest-data/tests-platform.dtsi
> >>>> @@ -40,6 +40,13 @@ test-device@2 {
> >>>>
> >>>>                                  test,u32-prop =3D <0xdeadbeef>;
> >>>>                                  test,i16-array =3D /bits/ 16 <1 2 (=
-3) (-4)>;
> >>>> +
> >>>> +                               ref_child_0: child@0 {
> >>>
> >>> child-0 or you need to add 'reg' property if you keep the unit-addres=
s.
> >>
> >> Adding child nodes here creates the following dt-test failues.
> >>
> >>      [    1.031239] ### dt-test ### FAIL of_unittest_platform_populate=
():1862 Could not create device for node 'child'
> >>      [    1.031647] ### dt-test ### FAIL of_unittest_platform_populate=
():1862 Could not create device for node 'child'
> >>
> >> @Rob: What do you suggest?
> >
> > This should fix it:
> >
> > index eeb370e0f507..e3503ec20f6c 100644
> > --- a/drivers/of/unittest.c
> > +++ b/drivers/of/unittest.c
> > @@ -1856,6 +1856,8 @@ static void __init of_unittest_platform_populate(=
void)
> >          of_platform_populate(np, match, NULL, &test_bus->dev);
> >          for_each_child_of_node(np, child) {
> >                  for_each_child_of_node(child, grandchild) {
> > +                       if (!of_property_present(grandchild, "compatibl=
e"))
> > +                               continue;
> >                          pdev =3D of_find_device_by_node(grandchild);
> >                          unittest(pdev,
> >                                   "Could not create device for node '%p=
OFn'\n",
> >
>
> Do you want this to be a separate patch? Otherwise, I'd fine just adding =
it to
> this one.

Adding it here is fine.

Rob
