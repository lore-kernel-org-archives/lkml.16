Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ACC1A238F;
	Wed, 21 May 2025 18:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747852588; cv=none; b=kzO18I2fm3svd4pJ8404ji4bF+Szn6ypISH9CxngfyOvEip4yTUQyknpewCTQNg1PoG2raFrx4Sol2L4fd9lT3zCnRjw6gq4BBQiUxkY0rUvm555D9zjosqLLPc3MKPdnqdWxThHtULy2DntCg/7TrV0L1vD3PhVHF0yVAPQ5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747852588; c=relaxed/simple;
	bh=4pF/fnEt73KK2G+WRSbc7QaKThEjnl0yHnYizDARC00=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=T8uk7FpiJsWjdZ8esxv/FaNXJ0qCwoQvVT1qejn45VqWlT9SbInBkxtpIfND/saKuqfiDh58TyeCkaxdruX6jsf2j1Is/pTH3V8XSJqqI9hf14vdbFckhx54s4HfJD5rHb5oF6yx8ePsjF0BQGio1cbHux3w6n22bOosBcIrpMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b2g9Y1Y4bz9tBD;
	Wed, 21 May 2025 20:36:17 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 20:36:10 +0200
Message-Id: <DA220Y73P1NR.192OYSQH3UD7A@buenzli.dev>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/9] rust: device: Enable printing fwnode name and
 path
From: "Remo Senekowitsch" <remo@buenzli.dev>
References: <20250520200024.268655-1-remo@buenzli.dev>
 <20250520200024.268655-5-remo@buenzli.dev>
 <2025052153-steadier-bargraph-e81a@gregkh>
 <DA1UXY2O47Y2.1ND9MC6L01217@buenzli.dev> <2025052116-gem-blend-2585@gregkh>
In-Reply-To: <2025052116-gem-blend-2585@gregkh>

On Wed May 21, 2025 at 6:58 PM CEST, Greg Kroah-Hartman wrote:
> On Wed, May 21, 2025 at 03:03:07PM +0200, Remo Senekowitsch wrote:
>> On Wed May 21, 2025 at 2:02 PM CEST, Greg Kroah-Hartman wrote:
>> > On Tue, May 20, 2025 at 10:00:19PM +0200, Remo Senekowitsch wrote:
>> >> Add two new public methods `display_name` and `display_path` to
>> >> `FwNode`. They can be used by driver authors for logging purposes. In
>> >> addition, they will be used by core property abstractions for automat=
ic
>> >> logging, for example when a driver attempts to read a required but
>> >> missing property.
>> >>=20
>> >> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> >> ---
>> >>  rust/kernel/device/property.rs | 72 ++++++++++++++++++++++++++++++++=
++
>> >>  1 file changed, 72 insertions(+)
>> >>=20
>> >> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/prop=
erty.rs
>> >> index 70593343bd811..6ccc7947f9c31 100644
>> >> --- a/rust/kernel/device/property.rs
>> >> +++ b/rust/kernel/device/property.rs
>> >> @@ -32,6 +32,78 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwno=
de_handle {
>> >>          self.0.get()
>> >>      }
>> >> =20
>> >> +    /// Returns an object that implements [`Display`](core::fmt::Dis=
play) for
>> >> +    /// printing the name of a node.
>> >> +    pub fn display_name(&self) -> impl core::fmt::Display + '_ {
>> >> +        struct FwNodeDisplayName<'a>(&'a FwNode);
>> >> +
>> >> +        impl core::fmt::Display for FwNodeDisplayName<'_> {
>> >> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core:=
:fmt::Result {
>> >> +                // SAFETY: self is valid by its type invariant
>> >> +                let name =3D unsafe { bindings::fwnode_get_name(self=
.0.as_raw()) };
>> >> +                if name.is_null() {
>> >> +                    return Ok(());
>> >
>> > So if there is no name, you are returning Ok()?  Are you sure that's o=
k
>> > to do?  What will the result of the string look like then?
>>=20
>> In that case we're not writing anything to the formatter, which is
>> equivalent to an empty string. `Ok(())` means that writing succeeded.
>>=20
>> I assumed that a valid node would always have a name. And we're
>> guaranteed to have a valid node. So I assumed this case would never
>> happen and didn't think too hard about it. But even if a valid node has
>> not name, empty string is probably the correct thing, right?
>
> I don't know what this "name" is used for.  An empty string might not be
> what you want to use here, given that you could be naming something
> based on it, right?  fwnode_get_name() is used for many things,
> including the detection if a name is not present at all, and if not,
> then the code needs to clean up and abort.
>
> So what exactly are you going to be using this for?

Valid question... I'm not using it for anything. I was trying to match
the C API which has capabilities to print a fwnode's name and full path.
I think the format specifiers are %pfwP and %pfwf if I'm reading the
source correctly. It also looks to me like the C API for printing fwnode
names does the same thing - print nothing if the name is null. [1] [2]

[1] https://elixir.bootlin.com/linux/v6.14.7/source/lib/vsprintf.c#L2242
[2] https://elixir.bootlin.com/linux/v6.14.7/source/lib/vsprintf.c#L711
