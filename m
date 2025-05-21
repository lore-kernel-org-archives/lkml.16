Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE61326560D;
	Wed, 21 May 2025 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832603; cv=none; b=RqAw99kDi/FTXHpRU+YBBGt2UxEZfo0h0M8XS6bES9EkQzp27bq5Ulc7Zv2qOwBmo4eQT0hvqvP+goWBT92m6FybcEdLUfUIyiB7O3KZ604LF+3zheWYpQGTxuohGp0AxRVajSi3sZr3SnU2j8Nj9Ew4Rl1ajoD2KZYl2YlcbGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832603; c=relaxed/simple;
	bh=dwIYOE3htI9GbHZbf78nxBK6FjqrDFIKmLnz0i4XDIw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=S5DMd8rS6esVeyiIlH9z6aD/7t0ob7bqQ0tvFL8YO7RrGba7VipK3jjsmhJY1NRsSY8dM5ep2e536bjO9F94ONwkEOrBkFNd4KrHYoDumW2+aiK6AsYO5yeMAB2fyhH9yOtcSQqapfKYivd3wTAEANvp/4FGlBkgB+fzd7JC2h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b2WnD0Hhyz9vJ0;
	Wed, 21 May 2025 15:03:12 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 15:03:07 +0200
Message-Id: <DA1UXY2O47Y2.1ND9MC6L01217@buenzli.dev>
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
In-Reply-To: <2025052153-steadier-bargraph-e81a@gregkh>
X-Rspamd-Queue-Id: 4b2WnD0Hhyz9vJ0

On Wed May 21, 2025 at 2:02 PM CEST, Greg Kroah-Hartman wrote:
> On Tue, May 20, 2025 at 10:00:19PM +0200, Remo Senekowitsch wrote:
>> Add two new public methods `display_name` and `display_path` to
>> `FwNode`. They can be used by driver authors for logging purposes. In
>> addition, they will be used by core property abstractions for automatic
>> logging, for example when a driver attempts to read a required but
>> missing property.
>>=20
>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> ---
>>  rust/kernel/device/property.rs | 72 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 72 insertions(+)
>>=20
>> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/propert=
y.rs
>> index 70593343bd811..6ccc7947f9c31 100644
>> --- a/rust/kernel/device/property.rs
>> +++ b/rust/kernel/device/property.rs
>> @@ -32,6 +32,78 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_=
handle {
>>          self.0.get()
>>      }
>> =20
>> +    /// Returns an object that implements [`Display`](core::fmt::Displa=
y) for
>> +    /// printing the name of a node.
>> +    pub fn display_name(&self) -> impl core::fmt::Display + '_ {
>> +        struct FwNodeDisplayName<'a>(&'a FwNode);
>> +
>> +        impl core::fmt::Display for FwNodeDisplayName<'_> {
>> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fm=
t::Result {
>> +                // SAFETY: self is valid by its type invariant
>> +                let name =3D unsafe { bindings::fwnode_get_name(self.0.=
as_raw()) };
>> +                if name.is_null() {
>> +                    return Ok(());
>
> So if there is no name, you are returning Ok()?  Are you sure that's ok
> to do?  What will the result of the string look like then?

In that case we're not writing anything to the formatter, which is
equivalent to an empty string. `Ok(())` means that writing succeeded.

I assumed that a valid node would always have a name. And we're
guaranteed to have a valid node. So I assumed this case would never
happen and didn't think too hard about it. But even if a valid node has
not name, empty string is probably the correct thing, right?
