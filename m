Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862E229E052;
	Tue, 15 Apr 2025 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715878; cv=none; b=SBxnBZKJMjducJUdUNN8BF4gNWE+1cRVfRqC/IwIlxtxo8soWLc7pTMREF/bB15rHh1kO0aneKAK87eSbzDp+4VdakO33j3jBf8Uw9UyMHEj1oAEJWr1cUHkHSorKkpGa9IoyQs/m+GEsAfdtqC++lLsKPIqc/kQ0e++S4iQhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715878; c=relaxed/simple;
	bh=hRWOuA//Ex7JHGMz7KC84dwAu8slfBadCpazDCP+OLY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eifcPhZi2hqxdYLtpCFqZE1VwE1wdu17bBh9T/lL3C+MyIv8HTtz3gIFafGcUCvQiVUSbJFkBKC/ZF4Az2fqVvibvMwiVYatT16VFwIC8oPh3kldv9asza5F+Eq9c8l2+C00xZ4e8x60oNEByb569yP10QSWEPFAHCIQzr8iIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZcM8G0yMbz9trD;
	Tue, 15 Apr 2025 13:17:50 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 13:17:46 +0200
Message-Id: <D9765O6UTEX9.1BI7DOZ1YMMZ4@buenzli.dev>
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
 <D96IEJBTKCGK.J44WDQUEHXVV@buenzli.dev> <Z_1NM0RqN_lKrD4v@cassiopeiae>
In-Reply-To: <Z_1NM0RqN_lKrD4v@cassiopeiae>
X-Rspamd-Queue-Id: 4ZcM8G0yMbz9trD

On Mon Apr 14, 2025 at 8:00 PM CEST, Danilo Krummrich wrote:
> On Mon, Apr 14, 2025 at 06:40:54PM +0200, Remo Senekowitsch wrote:
>> On Mon Apr 14, 2025 at 6:00 PM CEST, Danilo Krummrich wrote:
>> > On Mon, Apr 14, 2025 at 05:26:26PM +0200, Remo Senekowitsch wrote:
>> >> +impl Device {
>> >> +    /// Obtain the fwnode corresponding to the device.
>> >> +    fn fwnode(&self) -> &FwNode {
>> >> +        // SAFETY: `self` is valid.
>> >> +        let fwnode_handle =3D unsafe { bindings::__dev_fwnode(self.a=
s_raw()) };
>> >> +        if fwnode_handle.is_null() {
>> >> +            panic!("fwnode_handle cannot be null");
>> >
>> > Please don't use panic!() unless you hit an error condition that is im=
possible
>> > to handle.
>> >
>> > If __dev_fwnode() can ever return NULL, make this function return
>> > Option<&FwNode> instead.
>>=20
>> Rob Herring mentioned this in the previous thread already:
>>=20
>> > Users/drivers testing fwnode_handle/of_node for NULL is pretty common.
>> > Though often that's a legacy code path, so maybe not allowing NULL is
>> > fine for now.
>>=20
>> I asked a follow-up question about how to proceed but got no reply[3].
>
> I NULL is a possible return value of __dev_fwnode() (which seems to be th=
e
> case), there's no other option than makeing fwnode() fallible.

That makes sense. In that case, I think we shouldn't duplicate the
methods on `Device` and `FwNode`, because their signatures would be
different. E.g. `Device::property_present` would have to return
`Option<bool>` while `FwNode::property_present` would return `bool`.
I think it would be cleaner to force driver authors to do something
like `if let Some(fwnode) =3D dev.fwnode() { /* read properties */ }`.
