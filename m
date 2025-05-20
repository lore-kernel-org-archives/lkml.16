Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB310E4;
	Tue, 20 May 2025 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725679; cv=none; b=H7jks6deTwKKzsuDX2q0h0L7VIM6nTVHJprPc+yuSezKdPyQ0FX1TblG3K9Kssp93rQIzKupvM0xWFjmKF072vM3fYdLZPepPwuT2heXzLQGHXim+GEi0iwu5blIPv1Rofi0yFgfkv1a/5uZstRYek3Sx00hRAEALKlDpo0Czgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725679; c=relaxed/simple;
	bh=1q5hAkbkfFSCW+NeCF6lRVxMy74rmlMg7B0eD/X0zJw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=nM0oqUD/lpu9olmW2bzRx+BRFCkwBUNI/qCA5zNeNEF6nYX2juGlpvQ+pAa31d+EbdrVMYSlpHxNUcd4LamUaeH2OAXgcyXDINvLXrTcPBvUe8/fr2pPg4v8Y2uAtsQq63YSnrbsAyNF/+jLfamSjV7kjsGZYoIZJAY7maTG8tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1cwvOxY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1cwvOxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C8DC4CEE9;
	Tue, 20 May 2025 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747725679;
	bh=1q5hAkbkfFSCW+NeCF6lRVxMy74rmlMg7B0eD/X0zJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1cwvOxYN9S17xE1kv90orTjCleKG1ZW0nmbs3kS/R5KhpWG2jbwCe+bDEfFuxsZ/
	 +6cJcV14TV6x5Lq8SHxmPSq3MAzkA0GRKLaALr9HL+v55Mgk7DP/QnClFcJEhQ+Uf1
	 SUxbCDOKoouJ95YgO68kJHxjwm6foEgg6KZuE/9bMu1AKNEFdcMrDPQ/heQKRUJyUq
	 iSX/RQ8JSz4INH/FgIZfzTjv1sdTREa+CpdYkC6rXVn4u1IQk9UmGvNrzBIYuxaqR5
	 7IL++GH8skVcHrME4xcd6RHM3z+/wmJ6lqNm+vx1KmzvLWza2PS6FpLFWVVryNpA+q
	 FddU5mX8yHn8w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 09:21:13 +0200
Message-Id: <DA0T1M8YEHZ9.1AW3IGD1IZX7Z@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Remo Senekowitsch" <remo@buenzli.dev>, "Danilo Krummrich"
 <dakr@kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-7-remo@buenzli.dev> <aCH5WgORn9ZGl9Il@pollux>
 <DA093HA2415H.29OCPLS0M7H84@buenzli.dev> <aCtici15vSCBDbzE@pollux>
 <DA0EDC6W54E5.2CO8VXPTOXXJK@buenzli.dev>
In-Reply-To: <DA0EDC6W54E5.2CO8VXPTOXXJK@buenzli.dev>

On Mon May 19, 2025 at 9:51 PM CEST, Remo Senekowitsch wrote:
> On Mon May 19, 2025 at 6:55 PM CEST, Danilo Krummrich wrote:
>> On Mon, May 19, 2025 at 05:43:17PM +0200, Remo Senekowitsch wrote:
>>> On Mon May 12, 2025 at 3:36 PM CEST, Danilo Krummrich wrote:
>>> >> +/// Implemented for all integers that can be read as properties.
>>> >> +///
>>> >> +/// This helper trait is needed on top of the existing [`Property`]
>>> >> +/// trait to associate the integer types of various sizes with thei=
r
>>> >> +/// corresponding `fwnode_property_read_*_array` functions.
>>> >> +pub trait PropertyInt: Copy {
>>> >> +    /// # Safety
>>> >> +    ///
>>> >> +    /// Callers must uphold the same safety invariants as for the v=
arious
>>> >> +    /// `fwnode_property_read_*_array` functions.
>>> >
>>> > I think you have additional requirements on the fwnode, propname and =
val
>>> > pointers as well as on nval, please document them as well.
>>>=20
>>> What are the additional requirements? The implementation just calls the
>>> underlying `fwnode_property_read_*_array` with the exact same arguments=
,
>>> so I don't know what the additional requirements are.
>>
>> First of all, I don't think you can refer to the safety requirements of =
the
>> `fwnode_property_read_*_array` functions, since they don't have any docu=
mented
>> safety requirements.

Yes. We do sometimes link to other function for safety requirements if
they are very repetitive, but in that case we use a rustdoc link (so
[`my_other_function`]).

In this case, one doesn't even have a name to search for, only the
`fwnode_property_read_` prefix (and who is going to bother doing that?).
Additionally, the functions that you are referring to are from the
`bindings`! Those functions do not have safety documentation!

Another thing, functions do not have safety invariants, they only have
safety requirements and guarantees.

>> So, I think you have safety requirements regarding pointer validity of f=
wnode,
>> propname and val.
>>
>> Additionally, there's the requirement that val has to be an array of nva=
l
>> length.

Yes these two are probably required, but to be sure one would have to
dig through the C code.

>> Also, the PropertyInt trait itself has to be unsafe, given that it conta=
ins
>> unsafe functions.
>
> I don't think a trait necessarily has to be marked unsafe just because
> it has unsafe methods. Marking a trait as unsafe means that implementors
> of the trait must uphold some invariants. This is not the case here
> IIUC. Here's a good explanation of my understanding: [1]

Yes this is correct, I don't think that the trait itself should be
unsafe.

> But I should anyway seal the two traits. They're not supposed to be
> implemented outside the kernel crate.

Yes that sounds like a good idea.

I'll send a separate email for some more comments on the design.

---
Cheers,
Benno

> [1] https://users.rust-lang.org/t/safe-trait-with-an-unsafe-method/67993/=
3
>
>> I also pinged Benno about it, he usually knows best how to cover such th=
ings
>> properly. :)
>>
>>> >> +    unsafe fn read_array_from_fwnode_property(
>>> >> +        fwnode: *const bindings::fwnode_handle,
>>> >> +        propname: *const ffi::c_char,
>>> >> +        val: *mut Self,
>>> >> +        nval: usize,
>>> >> +    ) -> ffi::c_int;
>>> >> +}

