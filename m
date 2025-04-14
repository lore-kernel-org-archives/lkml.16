Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CEC1B3929;
	Mon, 14 Apr 2025 16:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648871; cv=none; b=eLoBknulMujPHl9frZFQr5GmeeO/rVr2AhJq3CtNC6dYx1B9IYmS2u72VyD28lYTJPQNPevUgoig8UKlz7YsgHPvefUFR/mEti/uf4X8DrBCTK2ZY7XdNoiTrxjvhgbgUT/n+AnDgAkk10S9464DVRg4jHvTdTgXpsTdU6byC0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648871; c=relaxed/simple;
	bh=5fKJs1w6oEvdNZJCvRG/59lOM3jjKtcfEX8F33cKXlU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gc2CM3xrAR0Oz4VKd9U6gEJgVjBdSzSUedyPBqVfM50XrHtuED3vw4QwiDTpeg+Peg78V8QhEWqLDMIG4RPFxiXPaPFwbyjIk2algv58paZc3RW8pPySKjuSeKxXScLdr1wdYJ/8lmSgPCQMxgGdbskFbXcVEZk0/6INetSbK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZbtMZ3NPTz9tLk;
	Mon, 14 Apr 2025 18:40:58 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Apr 2025 18:40:54 +0200
Message-Id: <D96IEJBTKCGK.J44WDQUEHXVV@buenzli.dev>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] rust: Move property_present to separate file
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-2-remo@buenzli.dev> <Z_0xGRsI74PsAL_E@cassiopeiae>
In-Reply-To: <Z_0xGRsI74PsAL_E@cassiopeiae>

On Mon Apr 14, 2025 at 6:00 PM CEST, Danilo Krummrich wrote:
> On Mon, Apr 14, 2025 at 05:26:26PM +0200, Remo Senekowitsch wrote:
>> Not all property-related APIs can be exposed directly on a device.
>> For example, iterating over child nodes of a device will yield
>> fwnode_handle. Thus, in order to access properties on these child nodes,
>> duplicate the APIs on a fwnode as they are in C.
>
> What do you mean with "duplicate the APIs"?

The property related methods on `Device` and `FwNode` are mostly
the same. Same names, same function signatures. The methods on
`Device` simply call `self.fwnode()` and then the same method on
`FwNode`. I was asked to do this so driver authors don't have to write
`dev.fwnode().read_propert()` etc. every time they want to do something
on the device itself. This is the case here for `property_present` as
well as the methods added in the following patches.

> Also, this patch does three separate things.
>
>   (1) move property_present() to separate file
>   (2) implement FwNode abstraction
>   (3) implement Device::fwnode()
>
> I'd rather keep property_present() in device.rs and also move fwnode() in=
to
> device.rs, even though in C it's in property.c. impl Device blocks should=
 be in
> device.rs.

I was asked to move it by Rob Herring on Zulip[1]. Dirk Behme also
agreed with it[2]. I have no strong opinion on this, hopefully you can
come to an agreement. Whatever it is, I'll happily implement it.

>> +++ b/rust/kernel/property.rs
>> @@ -0,0 +1,75 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Unified device property interface.
>> +//!
>> +//! C header: [`include/linux/property.h`](srctree/include/linux/proper=
ty.h)
>> +
>> +use core::ptr;
>> +
>> +use crate::{bindings, device::Device, str::CStr, types::Opaque};
>> +
>> +impl Device {
>> +    /// Obtain the fwnode corresponding to the device.
>> +    fn fwnode(&self) -> &FwNode {
>> +        // SAFETY: `self` is valid.
>> +        let fwnode_handle =3D unsafe { bindings::__dev_fwnode(self.as_r=
aw()) };
>> +        if fwnode_handle.is_null() {
>> +            panic!("fwnode_handle cannot be null");
>
> Please don't use panic!() unless you hit an error condition that is impos=
sible
> to handle.
>
> If __dev_fwnode() can ever return NULL, make this function return
> Option<&FwNode> instead.

Rob Herring mentioned this in the previous thread already:

> Users/drivers testing fwnode_handle/of_node for NULL is pretty common.
> Though often that's a legacy code path, so maybe not allowing NULL is
> fine for now.

I asked a follow-up question about how to proceed but got no reply[3].

Best regards,
Remo

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/t=
opic/DS90UB954.20driver.20done.2C.20ready.20to.20upstream.3F/near/495807346=
 [1]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/t=
opic/DS90UB954.20driver.20done.2C.20ready.20to.20upstream.3F/near/495945200=
 [2]
Link: https://lore.kernel.org/rust-for-linux/D96HP1UV49SY.1U1BFA14P8XHE@bue=
nzli.dev/T/#mc7967352b7bd1be812806939150511c1a5018bb1 [3]
