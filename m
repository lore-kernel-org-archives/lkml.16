Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D91D619F;
	Mon,  5 May 2025 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450147; cv=none; b=i4q2w7jm6BbxO/KkTM9oh2giqL1n2gtiG/Nok2SZAQ6H9J3kooO0RnQP9gWUcosiRkUMQdVe25JSjRiLOfwYBGSJaNHUd8goElUs8Or0L9GyCMnCsdD4uL7S6BaMihLZKLby3M0KY1+HUH8p7wsIBoaYsOHXaDX4fWZvvCIi21k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450147; c=relaxed/simple;
	bh=Td0CRIACmhO1qs94ownqg6ANz2bC805DWWXUsmW2bJU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=LWGGcrP3Ig+RYLWRMddXAZDW121U5eq7rvr74c3V2aTunjxZZBVhf+78HcpFgpQf5iS0y0O1+Bid02+Z1H79XDd+QnY6/N5Ny77oAPFVS6bLtFRdP/4FNSevxOW3mdF+JqpBdOK1J3ukiO1QxIGyO5RlrSZfIJzmfOOCexxsxcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZrhWZ5nHqz9tFm;
	Mon,  5 May 2025 15:02:18 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 May 2025 15:02:12 +0200
Message-Id: <D9O8WJ0RDNIA.4JYLWLYLBC2A@buenzli.dev>
To: "Dirk Behme" <dirk.behme@de.bosch.com>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 5/9] rust: device: Introduce PropertyGuard
From: "Remo Senekowitsch" <remo@buenzli.dev>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-6-remo@buenzli.dev>
 <5946174b-3178-462d-bb59-1e0d6c5f4dda@de.bosch.com>
In-Reply-To: <5946174b-3178-462d-bb59-1e0d6c5f4dda@de.bosch.com>
X-Rspamd-Queue-Id: 4ZrhWZ5nHqz9tFm

On Mon May 5, 2025 at 7:14 AM CEST, Dirk Behme wrote:
> On 04/05/2025 19:31, Remo Senekowitsch wrote:
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
>> index 6ccc7947f9c31..59c61e2493831 100644
>> --- a/rust/kernel/device/property.rs
>> +++ b/rust/kernel/device/property.rs
>> @@ -123,3 +123,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
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
>> +                self.name
>> +            );
>> +        }
>> +        self.inner
>> +    }
>
> Thinking about the .required_by(dev) I wonder if there will be cases
> where we do *not* have a device? I.e. where we really have a fwnode,
> only. And therefore can't pass a device. If we have such cases do we
> need to be able to pass e.g. Option(dev) and switch back to pr_err() in
> case of None?

In that case, bringing back the previous .required() method seems
reasonable to me. But only if we definitely know such cases exist.

> From the beginning of our discussion I think to remember that the C API
> has both the fwnode_property_*() and device_property_*() because there
> are use cases for the fwnode_property_*() API where is no device?

I'm not sure what you're referring to, the closest thing I can think of
is this comment by Rob [1] where he mentions the device_property_*()
functions only exist in C for a minimal convenience gain and we may not
want to keep that in Rust.

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/top=
ic/DS90UB954.20driver.20done.2C.20ready.20to.20upstream.3F/near/505415697
