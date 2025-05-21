Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6B32686A2;
	Wed, 21 May 2025 12:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831517; cv=none; b=hy/cdC7AvjF0hGp9Li/sApY9vyrDyjfmQEUiuy4vZxkUdHskm3ht+9esJqXxqmgSDFQDUzeHPUBQT+rbztryVe6x7u+sxz8iGZhMwEKkQfGzvHh7/FEvJVEQmh5rLyziw6HRgI2CV8KUSEivzjy5rM4+oBquQR2+7XOS2m4DOVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831517; c=relaxed/simple;
	bh=Gr8c9KBWDVaRJC+tyPor+w/fd8erzTw+z40GTSLgH6Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=W7vsH8nWYyGMchlmtiZ/+RjNCqfkLk4kUiE+/IN4Q4uFEYoEI0XYGcxxRZG03cWkiT6Mv5vhYmTSrE8anuZY34aw76gUmqYt/A3v7OpNFaAIz14uGD5BLccRhxbl3J43MFYgtpJrshowjY9K6mUBqfGP4ncOPfWb15yeHqShe8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b2WNR3znkz9sRc;
	Wed, 21 May 2025 14:45:11 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 14:45:06 +0200
Message-Id: <DA1UK58JZWCM.CXSOPB8BN4H7@buenzli.dev>
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
Subject: Re: [PATCH v5 2/9] rust: device: Enable accessing the FwNode of a
 Device
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20250520200024.268655-1-remo@buenzli.dev>
 <20250520200024.268655-3-remo@buenzli.dev>
 <2025052143-ergonomic-ongoing-36e5@gregkh>
In-Reply-To: <2025052143-ergonomic-ongoing-36e5@gregkh>
X-Rspamd-Queue-Id: 4b2WNR3znkz9sRc

On Wed May 21, 2025 at 1:59 PM CEST, Greg Kroah-Hartman wrote:
> On Tue, May 20, 2025 at 10:00:17PM +0200, Remo Senekowitsch wrote:
>> Subsequent patches will add methods for reading properties to FwNode.
>> The first step to accessing these methods will be to access the "root"
>> FwNode of a Device.
>>=20
>> Add the method `fwnode` to `Device`.
>>=20
>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> ---
>>  rust/kernel/device.rs | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>=20
>> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
>> index d8619d4485fb4..b4b7056eb80f8 100644
>> --- a/rust/kernel/device.rs
>> +++ b/rust/kernel/device.rs
>> @@ -186,6 +186,21 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Ar=
guments<'_>) {
>>          };
>>      }
>> =20
>> +    /// Obtain the [`FwNode`](property::FwNode) corresponding to the de=
vice.
>> +    pub fn fwnode(&self) -> Option<&property::FwNode> {
>> +        // SAFETY: `self` is valid.
>> +        let fwnode_handle =3D unsafe { bindings::__dev_fwnode(self.as_r=
aw()) };
>
> Why isn't this calling __dev_fwnode_const()?  And there's no way to just
> use dev_fwnode() directly?  Ugh, it's a macro...

I think I had that in earlier versions of the patch series. There was
a helper to call the macro from Rust. It was pointed out that this is
not clearly expressing the intent - whether fwnode is mutated or not.
And I think someone said the fwnode can be mutated so __dev_fwnode() is
semantically correct.
