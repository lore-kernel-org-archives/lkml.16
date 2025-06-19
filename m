Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A972192F4;
	Thu, 19 Jun 2025 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335500; cv=none; b=CWWlPES4e1C3tpXBrU2LzIBWi2/pLHoG7D7KNsIV3Poi4BkmI6vQVvpvcIZmAw48yOqeZSYpINHcPIaIUTcV/HkanKxrSyoKWlR03ebMHS5HxnhKdZH/ICwuTEe1cTFNicIBx5DJMxmJPuSYGf9FlzSgy9lIpF8xhvES+o0AcBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335500; c=relaxed/simple;
	bh=OqBY4FADivK1qZ21PyP/nb4Gm0qIUsZiD5QdvAZX0yg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kdDP8fxiRxhGms1v2+v3s7sY0dh7ueARQHzy/W+2w0ChlJtv9neAKwCR+MQqnJzDlsEkeQbKssSGR3KnzzkBWIHHpHFIBQZc2MZekGWbAoe3vICGLWQRhBxfvotvcO28qlxmWJcHylR2ARsUbUQmweOW98p6F/7tr2SczsEbV5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q49BxJB1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q49BxJB1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE6EC4CEEE;
	Thu, 19 Jun 2025 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750335499;
	bh=OqBY4FADivK1qZ21PyP/nb4Gm0qIUsZiD5QdvAZX0yg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=q49BxJB1ezK+8prGDR8YLQnodRL151Wjclaa+uHeq9rMzbOQKcjFrM8ar0nbjrmhL
	 aw1VCyWxO7AcflqPbNFBqNerYKvzzu7XDdabF1o8/r+3Opq78y9Hr3K7W1jg2arH68
	 /MEyoae50uiKqX+6JfPkQcX/qWVXPo+wIi/Xthz8E+nubI4N856x9vYW+5io6cPtxg
	 F2lbj4f4zB04WKIglTY0hOHXyeOCwLhrNfOPUtYOxn4RxLnDWRxD76YtGj5Iqr0kCD
	 ygA7SESrqKdvVZhsanEdAZ4W9rGwp21w3cofgQkx9Q5mXlScnRVG5WMsVgUlNVu0t8
	 X3FWifiaW+NMA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 14:18:15 +0200
Message-Id: <DAQI5DZ6HHJR.DOP0AQVQH3ZW@kernel.org>
Cc: "Oliver Mangold" <oliver.mangold@pm.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Asahi Lina" <lina@asahilina.net>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
 <20250502-unique-ref-v10-1-25de64c0307f@pm.me>
 <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org> <aFKICIo8L958iFbz@mango>
 <0KbPJp-9Rk5DVetcI8bAv8kiy90arS0GSl4qi8R83fIgPTv0MXRhz06vbuTjt5hXGguPZbL6JsQxDmuj4ejVrA==@protonmail.internalid> <DAPZ1KYN5FB6.3C7CI4Y0OKOE0@kernel.org> <877c18849m.fsf@kernel.org>
In-Reply-To: <877c18849m.fsf@kernel.org>

On Thu Jun 19, 2025 at 11:33 AM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Wed Jun 18, 2025 at 11:34 AM CEST, Oliver Mangold wrote:
>>> On 250514 1132, Benno Lossin wrote:
>>>> On Fri May 2, 2025 at 11:02 AM CEST, Oliver Mangold wrote:
>>>> > +pub unsafe trait OwnableMut: Ownable {}
>>>>
>>>> I don't like the name, but at the same time I also have no good
>>>> suggestion :( I'll think some more about it.
>>>
>>> There was already a bit of discussion about it. I had my own implementa=
tion of this
>>> where I used the names `UniqueRefCounted` and `UniqueRef`, but after di=
scovering
>>> this version from Asahi Lina, I took it as it was, keeping the name.
>>>
>>> No one else came up with different suggestions so far, so maybe we shou=
ld just leave it
>>> at `Owned`/`Ownable`?
>>
>> I'm just hung up on the `Mut` part... Haven't come up with a good
>> replacement yet.
>
> What do you dislike about the xxxxMut pattern?

Uh, I have re-read the docs & don't remember what originally I didn't
like about the name, so let's keep it :)

---
Cheers,
Benno
