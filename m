Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D6258CD0;
	Tue,  1 Jul 2025 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751400556; cv=none; b=N9HM/kDjHsbnXvv4cCa2Q+pVOAj8MOdHT7FtnN65txJeOZPW/js4X+CznsE8tUn+ge85dEl37SG9ddSxDk26jFCopwDiElsXoWjvaJqyB9AQ6TF7gADYTMIQj5EIpaH3FFMf1KJ6XYbjWZcJUwnCsS/AbsI0tt6Q1Bz2LM50FPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751400556; c=relaxed/simple;
	bh=ucd5d2Dq06AaXdwML5ILyHC5kTMglp6yTKqv81dQPs4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fFPpI4FbCd05e25qGR5uA9qb8nRPncY2bVn0uy7unqbDoruiVI4f2YHRp0Yf06bCma6rr4o7bq8cWR/g22Vjwu7tg24s/IG90/XNUHvqOHzcCS0Hms1Odbcw9ARKGssBHycQL5xds5OIi+wBPlMhSck+J0kfQenaSy2u1U4KLQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JznecOps; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JznecOps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68EAC4CEEB;
	Tue,  1 Jul 2025 20:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751400555;
	bh=ucd5d2Dq06AaXdwML5ILyHC5kTMglp6yTKqv81dQPs4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=JznecOpsbPOPNWEbO8Lo/2Liei7dMVXp/8meTo81VFJu7LoqFfp4dizH2fq5sdXK1
	 e7SDXBtHX//L1UDWtS5IWV8foYS9ySyXi+ocbjk+gmHuF2SlxLvkXKN4UVIEtAtBnG
	 GHSPm5cs7qm9i/SOTPFIDl9JQyVW60wMqXfWngG/EERVkkFVb501knFadrpwCvktsz
	 V9FOngkw97GqXmR4VlT6RcpLWGtWIneBFs/Ky/VvXRhQQWB6HgH1LLz/6FyL7zkiIK
	 2YpA0aLMZPU4LBWtOvb6QkKCRpYsYn67C3B7yGwV44h5OoW1U59kl0l2AIvpTjnTC/
	 2lcbW/f6PfIJw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 22:09:10 +0200
Message-Id: <DB0ZOHPFJR7T.1W3OF32GDL55O@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Sami Tolvanen"
 <samitolvanen@google.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Dirk
 Behme" <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>
 <aGQ1VsnFaxBo9zaM@pollux> <DB0Z71SF488V.3QURUHHELOY84@kernel.org>
 <3c928a0e-ccd4-4ba0-9f42-9f2bb0203e75@kernel.org>
 <DB0ZJVL0682F.ZNNOXEIDL5NN@kernel.org>
In-Reply-To: <DB0ZJVL0682F.ZNNOXEIDL5NN@kernel.org>

On Tue Jul 1, 2025 at 10:03 PM CEST, Benno Lossin wrote:
> On Tue Jul 1, 2025 at 9:58 PM CEST, Danilo Krummrich wrote:
>> On 7/1/25 9:46 PM, Benno Lossin wrote:
>>> On Tue Jul 1, 2025 at 9:21 PM CEST, Danilo Krummrich wrote:
>>>> On Tue, Jul 01, 2025 at 11:11:13AM -0700, Matthew Maurer wrote:
>>>>> If we implement *only* pinned files, we run into an additional proble=
m
>>>>> - you can't easily extend a pinned vector. This means that you cannot
>>>>> have dynamically created devices unless you're willing to put every
>>>>> new `File` into its own `Box`, because you aren't allowed to move any
>>>>> of the previously allocated `File`s for a resize.
>>>>>
>>>>> Where previously you would have had
>>>>>
>>>>> ```
>>>>> debug_files: Vec<File>
>>>>> ```
>>>>>
>>>>> you would now have
>>>>>
>>>>> ```
>>>>> debug_files: Vec<PinBox<File<T>>>
>>>>> ```
>>>>
>>>> Stuffing single File instances into a Vec seems like the wrong thing t=
o do.
>>>>
>>>> Instead you may have instances of some data structure that is created
>>>> dynamically in your driver that you want to expose through debugfs.
>>>>
>>>> Let's say you have (userspace) clients that can be registered arbitrar=
ily, then
>>>> you want a Vec<Client>, which contains the client instances. In order =
to provide
>>>> information about the Client in debugfs you then have the client embed=
 things as
>>>> discussed above.
>>>>
>>>> 	struct Client {
>>>> 	   id: File<ClientId>,
>>>> 	   data: File<ClientData>,
>>>> 	   ...
>>>> 	}
>>>>
>>>> I think that makes much more sense than keeping a Vec<Arc<Client>> *an=
d* a
>>>> Vec<File> separately. Also, note that with the above, your Client inst=
ances
>>>> don't need to be reference counted anymore.
>>>>
>>>> I think this addresses the concerns below.
>>>=20
>>> You still have the issue that `Client` now needs to be pinned and the
>>> vector can't be resized. But if you know that it's bounded, then we
>>> could just make `Pin<Vec<T>>` work as expected (not relocating the
>>> underlying allocation by not exposing `push`, only
>>> `push_within_capacity`).
>>>=20
>>> We also could have a `SegmentedVec<T>` that doesn't move elements.
>>> Essentially it is
>>>     =20
>>>      enum SegmentedVec<T> {
>>>          Cons(Segment<T>, KBox<SegmentedVec<T>>)
>>>          Nul,
>>>      }
>>>=20
>>>      struct Segment<T> {
>>>          elements: [T; 16]
>>>      }
>>>=20
>>> or make the segments variable-sized and grow them accordingly.
>>
>> That sounds a lot like the perfect application for XArray. :)
>
> Haha I didn't know this already existed in the kernel :) Yeah then we
> should make XArray work for this use-case.

Ah wait, I meant for `SegmentedVec<T>` to store multiple `T` in the same
allocation, so it would only grow sometimes and amortize the allocations
just like `Vec`. It seems to me that XArray only stores pointers, so you
have to box everything (which we're trying to avoid IIUC).

---
Cheers,
Benno
