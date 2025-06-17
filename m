Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F141E202C5D;
	Tue, 17 Jun 2025 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160576; cv=none; b=sMU42Ty/szdJHPH10ZrPY6fbpiamjYKPOVdLo3EYZnq462BAW/YMshI3NWM2yFNIae5QOIz4LmL223cn+Qp0Qmh7o0wdIzE/wFkZ+nVDE3sFj85RapKscD9eH0i5wHshOnqA8UTxYpKxcAiR6mQ0NgI7h92+yMF3+5Dh5WV6cPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160576; c=relaxed/simple;
	bh=ZvdSEdU5JBmsYcVsM6sokn+S/zufsOKiewcUzKJvMsA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S41LxCaUNYhjPlqLpFhdjOdwZy/L41MKFytQ1T2ZaDHQdgTjG5P50U4MQLy40CpTZjKcqaGOozK+r6rJ2rnLufITPBhhY8kxLhr54/WXq3zu+pELt2VY4PNWq+TJAc/7VP2N/EK9itFvmxlwd3WXqcT9AhZzi/eNq1PDhb+2w+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DR+EApLN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DR+EApLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3033BC4CEE3;
	Tue, 17 Jun 2025 11:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160575;
	bh=ZvdSEdU5JBmsYcVsM6sokn+S/zufsOKiewcUzKJvMsA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DR+EApLNj6iIvg5dNSpfFJM6L6zzGCAh19XLGo1BkrbM+G7UcF5kqpyWLDtUl4IAe
	 hLOmcWZv6yjvIA3BIZ3mhhiOplHpIJOEl9+3cuqKaPc2EJAAntbOk1CHS3VlP7q0Sj
	 DVmRvRioXhTADtcPNwObbUbBqv8TnX8LFJG0i1c4DA0XSuCxcBiT9+UBTf6DUXCQuY
	 GlwDYkU4tc9QnFvfVaSgQzaWEZwQoy4DaC8xmaaIwWj43BZ/SOqq1VMuCktNmp5Y0V
	 1G/RyLUXnDKifC/+cPZ+SRlYR8+S/exfpBLZHVroFpzdcaNU1EHYJDlh4v3WYTIyai
	 BPr+qwWHW39Mg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
In-Reply-To: <aFADYBIYqQjMx118@mango> (Oliver Mangold's message of "Mon, 16
	Jun 2025 11:43:34 +0000")
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
	<d6hUddIgwZqRCgQQQV7L2VG4idnic0hOdWqt67Itt_xixs1RI25dMrPZRMyoIe2W_FS4eL6X66J_iclD2aUA0Q==@protonmail.internalid>
	<20250502-unique-ref-v10-1-25de64c0307f@pm.me> <87zffvz65x.fsf@kernel.org>
	<uQThW1b1Vsk26nMFCbW4JE3fdvnK2zfmwC8aKJJWA12u4sT2-0ZTJk63QiSyH6K31wFvYTTcJ6NTzPn7JtfwEQ==@protonmail.internalid>
	<aFADYBIYqQjMx118@mango>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 17 Jun 2025 13:42:47 +0200
Message-ID: <87zfe68uh4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Oliver Mangold" <oliver.mangold@pm.me> writes:

> On 250502 1157, Andreas Hindborg wrote:
>> > +
>> > +impl<T: Ownable> Owned<T> {
>> > +    /// Creates a new instance of [`Owned`].
>> > +    ///
>> > +    /// It takes over ownership of the underlying object.
>> > +    ///
>> > +    /// # Safety
>> > +    ///
>> > +    /// Callers must ensure that the underlying object is acquired an=
d can be considered owned by
>> > +    /// Rust.
>>
>>
>> This part "the underlying object is acquired" is unclear to me. How abou=
t:
>>
>>   Callers must ensure that *ownership of* the underlying object has been
>>   acquired. That is, the object can be considered owned by the caller.
>>
>>
>
> Yes, made me think about the phrasing, too. But the main point is, that t=
he
> object must be considered to be owned by the `Owned<T>` after the function
> call, no?
>
> So maybe:
>
>    Callers must ensure that ownership of the underlying object can be
>    transfered to the `Owned<T>` and must consider it to be transfered
>    after the function call. This usually implies that the object
>    most not be accessed through `ptr` anymore.

Sounds good to me =F0=9F=91=8D


Best regards,
Andreas Hindborg


