Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E0521C9EF;
	Sat, 26 Apr 2025 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745665735; cv=none; b=s2C8k8xZjVW6mQWw5+DvnwlXBS9fnXdB5bf4fE+VKM2LU6nmU2o/khAXQEEaonsjl2NI0/BmJx61k8Q40EezvPJyzZU4ggaadpKzTVjpAaPKUFWD9Pp2Fa2d8ia1ETgWHVrReO/RpPRKoXEwXe5KEyKAVnekAw+h8nXVHJdd3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745665735; c=relaxed/simple;
	bh=kaNWFF+h4vOOtS7f2lNS3Ec3pgTH9YNyoefDXVBW78w=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=kA+iEjrNPGyYzn69F5dn791zoZmkJxMgWire90y8PmRaOxwY2MbUzQ7/40Ale+uC8zPvJLpWEcE1qbiBWUTLh8D2rT3EylhQzZ9EF+a41dvAc43Z88uV0fLrq3lq8VBL9fP9X37QOI5JVVpcqTZVHvJ/QBicR3UoU3BkFM7MaQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Zl6Qh3qWsz9sx4;
	Sat, 26 Apr 2025 13:08:44 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Apr 2025 13:08:39 +0200
Message-Id: <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>, "Dirk Behme"
 <dirk.behme@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
From: "Remo Senekowitsch" <remo@buenzli.dev>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev> <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com> <aAyyR5LyhmGVNQpm@pollux>
In-Reply-To: <aAyyR5LyhmGVNQpm@pollux>

On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
> On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
>> On 25.04.25 17:35, Danilo Krummrich wrote:
>> > On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
>> >> This abstraction is a way to force users to specify whether a propert=
y
>> >> is supposed to be required or not. This allows us to move error
>> >> logging of missing required properties into core, preventing a lot of
>> >> boilerplate in drivers.
>> >>
>> >> It will be used by upcoming methods for reading device properties.
>> >>
>> >> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> >> ---
>> >>  rust/kernel/device/property.rs | 57 ++++++++++++++++++++++++++++++++=
++
>> >>  1 file changed, 57 insertions(+)
>> >>
>> >> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/prop=
erty.rs
>> >> index 28850aa3b..de31a1f56 100644
>> >> --- a/rust/kernel/device/property.rs
>> >> +++ b/rust/kernel/device/property.rs
>> >> @@ -146,3 +146,60 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>> >>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>> >>      }
>> >>  }
>> >> +
>> >> +/// A helper for reading device properties.
>> >> +///
>> >> +/// Use [`Self::required`] if a missing property is considered a bug=
 and
>> >> +/// [`Self::optional`] otherwise.
>> >> +///
>> >> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provi=
ded.
>> >> +pub struct PropertyGuard<'fwnode, 'name, T> {
>> >> +    /// The result of reading the property.
>> >> +    inner: Result<T>,
>> >> +    /// The fwnode of the property, used for logging in the "require=
d" case.
>> >> +    fwnode: &'fwnode FwNode,
>> >> +    /// The name of the property, used for logging in the "required"=
 case.
>> >> +    name: &'name CStr,
>> >> +}
>> >> +
>> >> +impl<T> PropertyGuard<'_, '_, T> {
>> >> +    /// Access the property, indicating it is required.
>> >> +    ///
>> >> +    /// If the property is not present, the error is automatically l=
ogged. If a
>> >> +    /// missing property is not an error, use [`Self::optional`] ins=
tead.
>> >> +    pub fn required(self) -> Result<T> {
>> >> +        if self.inner.is_err() {
>> >> +            pr_err!(
>> >> +                "{}: property '{}' is missing\n",
>> >> +                self.fwnode.display_path(),
>> >> +                self.name
>> >> +            );
>> >=20
>> > Hm, we can't use the device pointer of the fwnode_handle, since it is =
not
>> > guaranteed to be valid, hence the pr_*() print...
>> >=20
>> > Anyways, I'm not sure we need to print here at all. If a driver wants =
to print
>> > that it is unhappy about a missing required property it can do so by i=
tself, I
>> > think.
>>=20
>> Hmm, the driver said by using 'required' that it *is* required. So a
>> missing property is definitely an error here. Else it would have used
>> 'optional'. Which doesn't print in case the property is missing.
>>=20
>> If I remember correctly having 'required' and 'optional' is the result
>> of some discussion on Zulip. And one conclusion of that discussion was
>> to move checking & printing the error out of the individual drivers
>> into a central place to avoid this error checking & printing in each
>> and every driver. I think the idea is that the drivers just have to do
>> ...required()?; and that's it, then.
>
> Yes, I get the idea.
>
> If it'd be possible to use dev_err!() instead I wouldn't object in this s=
pecific
> case. But this code is used by drivers from probe(), hence printing the e=
rror
> without saying for which device it did occur is a bit pointless.
>
> Drivers can still decide to properly print the error if the returned Resu=
lt
> indicates one.

One alternative would be to store a reference count to the device in
`FwNode`. At that point we'd be guaranteed to have a valid reference
whenever we want to log something.
