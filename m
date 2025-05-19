Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41B91EA7C9;
	Mon, 19 May 2025 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747684286; cv=none; b=lVtiXr/qdga7Wg8MeaqR1u78FY6zLliz/YQAKGSLWpIMjf/dU5eDHNQKKe7fY22XiSZqnocUL9R1fKbsyVTIhNvsQdc8rO/CAmUzPN18o16S5g11HJTDuZPvUEk5TdDYS5syPynxLw9GoNyXONOaOMJh75ehC5/Wetgik5S+HVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747684286; c=relaxed/simple;
	bh=ooQ+QW2XRX357dWIRghQT1fkvhfvh6mJYB7maK595BY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VhRs8wrXCa526X8/CdbXY/XWmNbsD2P6gsEd3Fvz82EdQqU+CytGusR/d+vYZzEL+vNBpLJUM3EVjfH0pxzaUIL5Tvg62f3xkbBGQf26k+bWQ01CpGe1BwDRM7lQEIAlIWDQftkySYjlCyjM1UPIPAfrWmBin46Bl8SJejdHf5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b1Sx338f4z9sq3;
	Mon, 19 May 2025 21:51:19 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 21:51:15 +0200
Message-Id: <DA0EDC6W54E5.2CO8VXPTOXXJK@buenzli.dev>
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
Subject: Re: [PATCH v4 6/9] rust: device: Add bindings for reading device
 properties
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-7-remo@buenzli.dev> <aCH5WgORn9ZGl9Il@pollux>
 <DA093HA2415H.29OCPLS0M7H84@buenzli.dev> <aCtici15vSCBDbzE@pollux>
In-Reply-To: <aCtici15vSCBDbzE@pollux>

On Mon May 19, 2025 at 6:55 PM CEST, Danilo Krummrich wrote:
> On Mon, May 19, 2025 at 05:43:17PM +0200, Remo Senekowitsch wrote:
>> On Mon May 12, 2025 at 3:36 PM CEST, Danilo Krummrich wrote:
>> >> +/// Implemented for all integers that can be read as properties.
>> >> +///
>> >> +/// This helper trait is needed on top of the existing [`Property`]
>> >> +/// trait to associate the integer types of various sizes with their
>> >> +/// corresponding `fwnode_property_read_*_array` functions.
>> >> +pub trait PropertyInt: Copy {
>> >> +    /// # Safety
>> >> +    ///
>> >> +    /// Callers must uphold the same safety invariants as for the va=
rious
>> >> +    /// `fwnode_property_read_*_array` functions.
>> >
>> > I think you have additional requirements on the fwnode, propname and v=
al
>> > pointers as well as on nval, please document them as well.
>>=20
>> What are the additional requirements? The implementation just calls the
>> underlying `fwnode_property_read_*_array` with the exact same arguments,
>> so I don't know what the additional requirements are.
>
> First of all, I don't think you can refer to the safety requirements of t=
he
> `fwnode_property_read_*_array` functions, since they don't have any docum=
ented
> safety requirements.
>
> So, I think you have safety requirements regarding pointer validity of fw=
node,
> propname and val.
>
> Additionally, there's the requirement that val has to be an array of nval
> length.
>
> Also, the PropertyInt trait itself has to be unsafe, given that it contai=
ns
> unsafe functions.

I don't think a trait necessarily has to be marked unsafe just because
it has unsafe methods. Marking a trait as unsafe means that implementors
of the trait must uphold some invariants. This is not the case here
IIUC. Here's a good explanation of my understanding: [1]

But I should anyway seal the two traits. They're not supposed to be
implemented outside the kernel crate.

[1] https://users.rust-lang.org/t/safe-trait-with-an-unsafe-method/67993/3

> I also pinged Benno about it, he usually knows best how to cover such thi=
ngs
> properly. :)
>
>> >> +    unsafe fn read_array_from_fwnode_property(
>> >> +        fwnode: *const bindings::fwnode_handle,
>> >> +        propname: *const ffi::c_char,
>> >> +        val: *mut Self,
>> >> +        nval: usize,
>> >> +    ) -> ffi::c_int;
>> >> +}

