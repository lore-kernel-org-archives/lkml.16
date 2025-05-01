Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E8B19F12D;
	Thu,  1 May 2025 22:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746139905; cv=none; b=C2wOwQX/VF83A7HVvY9r7FCPvkiBJKNBYSZbKO63qpKpn232B9sVkcHs7iwFOGPuxiEzc/HJy9leb2SWKdyM91nSygYoSNJTXUD3FlvkHy9JqlH5IZ8J/u+XYnrTYlXrF7zaH6bZ7w+yWXvlNT0WetNkttOD+beeerz0lcJqltU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746139905; c=relaxed/simple;
	bh=+oCrPHzWEd3OsrgdwKeMqFcqum2RPmv4g8GLwXAvWpw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iyhf4jF1dfqQg526TKnTnfWrAMxdx7Fsyl3JHh0L2RcXvwvu6Ocef3yjxIdakUjodPXC+eBHzK9ZR4IJCS8JHvqoIrfXYqMWFxObg0hg4y+GbCAP2DyCJ6tzfsJpGc0CjsAmleYf6Nt1GjnPntQQqBSBc3DYaR+zsQWVQLRFFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jA1E8Ynm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jA1E8Ynm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC83C4CEE3;
	Thu,  1 May 2025 22:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746139905;
	bh=+oCrPHzWEd3OsrgdwKeMqFcqum2RPmv4g8GLwXAvWpw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=jA1E8Ynm9/Sj/6UoDmvKIlptyXZX8XkdV8jsF374aUVkVahd6jwrUn+YRRCQ6lxl7
	 EAX8ohVg0yiuWXbDLZ6NcV6oKkaMCVtGEQs/aS1DfjclUqaXzrUjuAAGMKKppuFht4
	 bQgB+S9XNWj5f8JgjG2l+e4+kbazoB++xu/N3k9DJU89T+W6qpLpcahGkszuFL33eM
	 1w++3sLetiSqWhpxtnOql8Nfeag/SlbwwZo6oNHh1BPjpSN8xSc16hgHZo/TpNgzwK
	 k6eqgeQMLLvHq+b/QJUcOfOqqWwWXhmQpCY0ky4XGf/0C0s4bL5XlwUU60Y8DC4D5/
	 kyLZ3BLF2Vfyg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 May 2025 00:51:40 +0200
Message-Id: <D9L6XO6T7JEU.CK47C5BOQ0NG@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>
X-Mailer: aerc 0.20.1
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
 <d433986a-fdad-4859-b8bf-080a18158189@gmail.com>
 <D9L1TI5NVKJU.361JFPWMLDWN4@kernel.org>
 <7bc9f839-a69a-4819-ba6d-36eadd8776b3@gmail.com>
In-Reply-To: <7bc9f839-a69a-4819-ba6d-36eadd8776b3@gmail.com>

On Thu May 1, 2025 at 9:11 PM CEST, Christian Schrefl wrote:
> On 01.05.25 8:51 PM, Benno Lossin wrote:
>> On Wed Apr 30, 2025 at 7:30 PM CEST, Christian Schrefl wrote:
>>> On 30.04.25 11:45 AM, Benno Lossin wrote:
>>>> On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
>>>>> +/// This implementation works because of the "`!Unpin` hack" in rust=
c, which allows (some kinds of)
>>>>> +/// mutual aliasing of `!Unpin` types. This hack might be removed at=
 some point, after which only
>>>>> +/// the `core::pin::UnsafePinned` type will allow this behavior. In =
order to simplify the migration
>>>>> +/// to future rust versions only this polyfill of this type should b=
e used when this behavior is
>>>>> +/// required.
>>>>> +///
>>>>> +/// In order to disable niche optimizations this implementation uses=
 [`UnsafeCell`] internally,
>>>>> +/// the upstream version however will not. So the fact that [`Unsafe=
Pinned`] contains an
>>>>> +/// [`UnsafeCell`] must not be relied on (Other than the niche block=
ing).
>>>>
>>>> I would make this last paragraph a normal comment, I don't think we
>>>> should expose it in the docs.
>>>
>>> I added this as docs since I wanted it to be a bit more visible,
>>> but I can replace the comment text (about `UnsafeCell`) with this parag=
raph
>>> and drop it from the docs if you want.
>>=20
>> I think we shouldn't talk about these implementation details in the
>> docs.
>
> Alright, what do you think of:
>
> // As opposed to the upstream Rust type this contains a `PhantomPinned`` =
and `UnsafeCell<T>`

There are two '`' after PhantomPinned.

> // - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<=
T>`

s/ a / an /

I find the phrasing 'avoid needing <negative impl>' a bit weird, I'd
just say "`PhantomPinned` to ensure the struct always is `!Unpin` and
thus enables the `!Unpin` hack".

If you have a link to somewhere that explains that hack, then I'd also
put it there. I forgot if it's written down somewhere.

> //   Required to use the `!Unpin hack`.
> // - In order to disable niche optimizations this implementation uses `Un=
safeCell` internally,
> //   the upstream version however currently does not. This will most like=
ly change in the future
> //   but for now we don't expose this in the documentation, since adding =
the guarantee is simpler
> //   than removing it. Meaning that for now the fact that `UnsafePinned` =
contains an `UnsafeCell`
> //   must not be relied on (Other than the niche blocking).

---
Cheers,
Benno
