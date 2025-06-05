Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0E86347;
	Thu,  5 Jun 2025 16:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749140213; cv=none; b=gtU32fC9lRfAbgmfz4S/5R73MF/5TgCz/Vh1zISNddIOZoHOU8rSGaOAG7BHx9hzLm9R0O8WoHgyM1haGakUJe1pxqOltJlAUnDp6Fb1oj8ELM+KRjif67wBgv1VuVLQNHJCiM6HKTvGcVX7cgiYU5fQQWK61ew1mamilXlMO2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749140213; c=relaxed/simple;
	bh=823PvZlKbvnDkDz/Ru+tzdIq+Oan69I7NBcRhm1D6s8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gKD8kfm+SVDjyqfhh/4q4Wk1tzZkTbBQkVcWfb9+4YWQdLsACn+GM9g3apNyQVu+BTbTXt9Q2d5fAesesGQ1sKgqMHgMT1FAswaww7sRsJqzfr5OpOIzDMQR+mVY4KXy3lpu3QQz7yNP3B4w1b1re6mBOUZndYzEk9faKMJzpsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bCqMg0Vw5z9t1g;
	Thu,  5 Jun 2025 18:16:47 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 18:16:41 +0200
Message-Id: <DAEQGBNLMOP1.2RW2A0A4OBZQS@buenzli.dev>
Cc: "Saravana Kannan" <saravanak@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v7 5/9] rust: device: Introduce PropertyGuard
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Rob Herring" <robh@kernel.org>
References: <20250530192856.1177011-1-remo@buenzli.dev>
 <20250530192856.1177011-6-remo@buenzli.dev>
 <20250605150840.GA2539727-robh@kernel.org>
In-Reply-To: <20250605150840.GA2539727-robh@kernel.org>

On Thu Jun 5, 2025 at 5:08 PM CEST, Rob Herring wrote:
> On Fri, May 30, 2025 at 09:28:52PM +0200, Remo Senekowitsch wrote:
>> This abstraction is a way to force users to specify whether a property
>> is supposed to be required or not. This allows us to move error
>> logging of missing required properties into core, preventing a lot of
>> boilerplate in drivers.
>>=20
>> It will be used by upcoming methods for reading device properties.
>>=20
>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> ---
>>  rust/kernel/device/property.rs | 59 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>=20
>> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/propert=
y.rs
>> index 8e0414b0517e4..b789fbbd0e6cc 100644
>> --- a/rust/kernel/device/property.rs
>> +++ b/rust/kernel/device/property.rs
>> @@ -155,3 +155,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>>      }
>>  }
>> +
>> +/// A helper for reading device properties.
>> +///
>> +/// Use [`Self::required_by`] if a missing property is considered a bug=
 and
>> +/// [`Self::optional`] otherwise.
>> +///
>> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided=
.
>> +pub struct PropertyGuard<'fwnode, 'name, T> {
>> +    /// The result of reading the property.
>> +    inner: Result<T>,
>> +    /// The fwnode of the property, used for logging in the "required" =
case.
>> +    fwnode: &'fwnode FwNode,
>> +    /// The name of the property, used for logging in the "required" ca=
se.
>> +    name: &'name CStr,
>> +}
>> +
>> +impl<T> PropertyGuard<'_, '_, T> {
>> +    /// Access the property, indicating it is required.
>> +    ///
>> +    /// If the property is not present, the error is automatically logg=
ed. If a
>> +    /// missing property is not an error, use [`Self::optional`] instea=
d. The
>> +    /// device is required to associate the log with it.
>> +    pub fn required_by(self, dev: &super::Device) -> Result<T> {
>> +        if self.inner.is_err() {
>> +            dev_err!(
>> +                dev,
>> +                "{}: property '{}' is missing\n",
>> +                self.fwnode.display_path(),
>
> Is it possible to make "{self.fwnode}: property..." work? Just need to=20
> implement Display trait on FwNode, right?
>
> Doesn't look to me like we can alter what we print like in C, but for=20
> dmesg it's usually the full path we want anyways.

Well, field access is not allowed directly in the format string. But if
there is a variable `fwnode`, then yes, one can do "{fwnode}" directly.
Implementing Display directly on FwNode seems like a good idea if the
full path is the intuitive default.

I tried it with an `ARef<FwNode>`, but that didn't work. I had to force
the dereference with `&*fwnode`. Maybe an `impl<T: Display> for ARef<T>`
could be added, the standard library does that for its smart pointers.

Remo
