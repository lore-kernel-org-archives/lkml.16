Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879C1DED49;
	Mon,  5 May 2025 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459469; cv=none; b=YtwWlqCVfkPQgwk/nWtCd4U+7IVzd6xVG32L/0/1YfdglzgI97aRPtWF+6uKy4ZowbSMYnhm04QKTcBTg1SEPcraB/QM8mFpWXut8Og8ZUtQl2E6aIavbKI2rGDMmjwE0WqMPU4nWaboxfH1R4/ZUZA7eM9MEZ+Qmh39Q8ekAiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459469; c=relaxed/simple;
	bh=kgjT8WEf5LwjWtrsLGMHB9U6vbfqzylva8cBtuqg4/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqZH58hfsiKwUlbwPl3RbRO2m2PmKbzxyWa/O/kS4DjGDMvmBiFjLZzO7oVk0YfcNo1hLIKvJtTG8uvCVcCbF4lep9Dco3+DKMBf95ig11MriPvbyfiYaBgbskYsh+D+NDdRrSBy/72OZ4djvHU8Jj4v9QKQenHVOZaJ59s2WjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwKNxUQZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwKNxUQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9A2C4CEF1;
	Mon,  5 May 2025 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746459469;
	bh=kgjT8WEf5LwjWtrsLGMHB9U6vbfqzylva8cBtuqg4/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dwKNxUQZf9DhoOXPnXrcKKcI1sbxhKg/2c9DLx+rYuulyHwb4yjGZavcfEyrutpIi
	 J058STMeDCvMeAONM3Xse0pIht/au9ewF7th9hYtEEOkLboOvc+aUgdYlnYHb1Xlp9
	 46+lN/U2vFHsPWUmJ48BoFov+Kz0iiEg362XY2HHf7SxxIwxRdc4ai3woK7OoMvcRo
	 q0grF+rnpLBKuNEd7M6P/NdZbbt2/JXQp2Vq2S4LMdMvW7dVobrIwBr+Rnw5KacOQ5
	 nn7+wg7RTqVFUzx6Vr6xnfrZNg6QuuElNdIhOYOC9b2/Omd5N1q5qnAeuaPT9mut4g
	 z9tqN8RbBZSmQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb5ec407b1so802670666b.1;
        Mon, 05 May 2025 08:37:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVq4kHWfO53OjDm2/vYA1g5ZeCRBen8YHYMDtBGGArTlWxbLU+aJAuAfPn3knVNfCfOpxIlSn6Rj8LDjxAz@vger.kernel.org, AJvYcCW2N6tNxdgiGJ5m080fAreRZ2EGl/PdZjV5afrIlMISBVMUue9+71lFPM/jKq5bkZCqK69WQMVWmNRE6Tl9WWE=@vger.kernel.org, AJvYcCWJTPfdSIa6AfcQ8g7s0reJ63P0Wm9GdgN9Eg5ttqGDrqyTXk9pbD7l1BKBYVkE+K7X9zQF3aq1g5Ma@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5LI4hsmO59hLRZc16IfvY18W+AZ430i43I998ZVzoEnfWsEKE
	rKpdG/3CoMv6DHnWHAD2Kl8fzEECILLN8Kj4ZQbkh4cat9prtG0hwkSgSNsBGU/L8JaCVoIxmUU
	YWJ8BQFG3Cd7N1099A1+S69yIXQ==
X-Google-Smtp-Source: AGHT+IF5AdNi6ekQVBhEb6rjF7V2tE+jZ02cfPCg2chOIcgD2I4YdahkYMy23tbr5pS6sBhTqg3+U5rrGHICU/lzw5A=
X-Received: by 2002:a17:907:3f91:b0:acb:b5a4:ba35 with SMTP id
 a640c23a62f3a-ad1a48bc3c9mr793360166b.2.1746459467451; Mon, 05 May 2025
 08:37:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504173154.488519-1-remo@buenzli.dev> <20250504173154.488519-6-remo@buenzli.dev>
 <5946174b-3178-462d-bb59-1e0d6c5f4dda@de.bosch.com> <D9O8WJ0RDNIA.4JYLWLYLBC2A@buenzli.dev>
In-Reply-To: <D9O8WJ0RDNIA.4JYLWLYLBC2A@buenzli.dev>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 10:37:35 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+bzCc2r4H6=MfWq=9ku1SMCUL03KkCTeBPcqQrUEUMLg@mail.gmail.com>
X-Gm-Features: ATxdqUGu6okHMU6FbF2k6yuoAMnbFwZyqbdFtsRZc_x_x-_V0GDUKq40RCC19ns
Message-ID: <CAL_Jsq+bzCc2r4H6=MfWq=9ku1SMCUL03KkCTeBPcqQrUEUMLg@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] rust: device: Introduce PropertyGuard
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 8:02=E2=80=AFAM Remo Senekowitsch <remo@buenzli.dev>=
 wrote:
>
> On Mon May 5, 2025 at 7:14 AM CEST, Dirk Behme wrote:
> > On 04/05/2025 19:31, Remo Senekowitsch wrote:
> >> This abstraction is a way to force users to specify whether a property
> >> is supposed to be required or not. This allows us to move error
> >> logging of missing required properties into core, preventing a lot of
> >> boilerplate in drivers.
> >>
> >> It will be used by upcoming methods for reading device properties.
> >>
> >> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> >> ---
> >>  rust/kernel/device/property.rs | 59 +++++++++++++++++++++++++++++++++=
+
> >>  1 file changed, 59 insertions(+)
> >>
> >> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/prope=
rty.rs
> >> index 6ccc7947f9c31..59c61e2493831 100644
> >> --- a/rust/kernel/device/property.rs
> >> +++ b/rust/kernel/device/property.rs
> >> @@ -123,3 +123,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> >>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
> >>      }
> >>  }
> >> +
> >> +/// A helper for reading device properties.
> >> +///
> >> +/// Use [`Self::required_by`] if a missing property is considered a b=
ug and
> >> +/// [`Self::optional`] otherwise.
> >> +///
> >> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provid=
ed.
> >> +pub struct PropertyGuard<'fwnode, 'name, T> {
> >> +    /// The result of reading the property.
> >> +    inner: Result<T>,
> >> +    /// The fwnode of the property, used for logging in the "required=
" case.
> >> +    fwnode: &'fwnode FwNode,
> >> +    /// The name of the property, used for logging in the "required" =
case.
> >> +    name: &'name CStr,
> >> +}
> >> +
> >> +impl<T> PropertyGuard<'_, '_, T> {
> >> +    /// Access the property, indicating it is required.
> >> +    ///
> >> +    /// If the property is not present, the error is automatically lo=
gged. If a
> >> +    /// missing property is not an error, use [`Self::optional`] inst=
ead. The
> >> +    /// device is required to associate the log with it.
> >> +    pub fn required_by(self, dev: &super::Device) -> Result<T> {
> >> +        if self.inner.is_err() {
> >> +            dev_err!(
> >> +                dev,
> >> +                "{}: property '{}' is missing\n",
> >> +                self.fwnode.display_path(),
> >> +                self.name
> >> +            );
> >> +        }
> >> +        self.inner
> >> +    }
> >
> > Thinking about the .required_by(dev) I wonder if there will be cases
> > where we do *not* have a device? I.e. where we really have a fwnode,
> > only. And therefore can't pass a device. If we have such cases do we
> > need to be able to pass e.g. Option(dev) and switch back to pr_err() in
> > case of None?
>
> In that case, bringing back the previous .required() method seems
> reasonable to me. But only if we definitely know such cases exist.

They definitely exist. Any property in a child node of the device's
node when the child itself is not another device for example.

> > From the beginning of our discussion I think to remember that the C API
> > has both the fwnode_property_*() and device_property_*() because there
> > are use cases for the fwnode_property_*() API where is no device?

Correct.

> I'm not sure what you're referring to, the closest thing I can think of
> is this comment by Rob [1] where he mentions the device_property_*()
> functions only exist in C for a minimal convenience gain and we may not
> want to keep that in Rust.

The point there was if there's not the same convenience with Rust,
then we shouldn't keep the API.

I think this came up previously, but I don't think it matters whether
we print the device name or fwnode path. If you have either one, you
can figure out both the driver and node. Arguably the fwnode path is
more useful because that's likely where the error is.

Rob
