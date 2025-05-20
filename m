Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70633258CF7;
	Tue, 20 May 2025 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747764571; cv=none; b=BVsTyKdoJV5OrQS9QoGHHibInqsDM7Nr+dgXShDbM3U1i/HYET59cBmHIayqxeBPpaotC7EI+bvzlrojWyux3QhUHVr3z8uA+LpDvAavl7dsDdvzVDIqGmUpuqOS75zsZeEpKElPsWA6n9WzD3O+wrAhSLtOub2SWV+cRXqA0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747764571; c=relaxed/simple;
	bh=ZIG9WTKvJ+a9sMxplJs7pTUDmDH0RunUZlkZsO6YVTM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fxnILo+y6bCTmUty1rbwio5hS0RBrYYpB4OoyRvJTP7Wq3t3GrbDb8GZQqp5oBj21oILBaXwjyA0CGK5oQr6pvwROTHBQrLGMMrKYvTvDICwl1zLXRS2I3OJsccVKYAXCw2lPrUpgiY173Sce+OrRJoU/UOVvvC1MxwNCt8mfh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEFf8wqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEFf8wqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000F8C4CEE9;
	Tue, 20 May 2025 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747764570;
	bh=ZIG9WTKvJ+a9sMxplJs7pTUDmDH0RunUZlkZsO6YVTM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=rEFf8wqiPU0HnUsKcroDD2OQWIRqVZfWVRGIFKHcj1WHFIptCJxKtCEYOXDNHNfOs
	 ryhu5gKy9VkHBWaAtCTYCRIEX4omYu931rfUbjrwFdsNyiiwopbS1GForWfsflxUdo
	 0k0AHIo0OCXAe5lpXaSIRJkxpEJ5W27yHoJ4GcPoXpJlV+bECYm/oc2N4XVdAxTC7t
	 MTv1ARYBefxYAdP/tGx+IFO7lPlmmY/ItR+XFgCPvDpVIGzvuXcCZ1hx5iBrDERIjO
	 Z4the1UXcfbJWU/c7P8hBgUfK0PsjudHAgr7Qq/FPvuc1Wmyh4Yw4zLzlKvH8NTmME
	 JLYz6mdNv6T8w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 20:09:24 +0200
Message-Id: <DA16TWRBVV1B.2IT3D3ROHA3MI@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
 <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com>
 <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
 <DA048ETXB1Q1.3KVZ2FHENWKDL@kernel.org>
 <DA07TW3IGHW7.1QVLH8XUMWQ8Y@nvidia.com>
In-Reply-To: <DA07TW3IGHW7.1QVLH8XUMWQ8Y@nvidia.com>

On Mon May 19, 2025 at 4:43 PM CEST, Alexandre Courbot wrote:
> On Mon May 19, 2025 at 8:54 PM JST, Benno Lossin wrote:
>> On Mon May 19, 2025 at 12:52 PM CEST, Daniel Almeida wrote:
>>>> I just mean the cases where users will want to enable and disable the
>>>> regulator more frequently than just enabling it at probe time.
>>>
>>> This is already possible through kernel::types::Either.=20
>>>
>>> i.e.: the current design - or the proposed typestate one - can already =
switch
>>> back and forth between Regulator and EnabledRegulator. Using Either mak=
es it
>>> just work, because you can change the variant at runtime without hassle=
. This
>>> lets you consume self in an ergonomic way.
>>
>> Have you tried to write such a use-case using `Either`? My personal
>> experience with `Either` was pretty horrible, since you always have to
>> match on it before you can do anything to the values. It's not really
>> ergonomic.
>>
>> I think we should remove it, as it also doesn't have any users at the
>> moment. Anyone that needs it should define a custom enum for their
>> use-case.
>>
>> And effectively an `Either<Regulator, EnabledRegulator>` is just a
>> `Regulator<Switch>` in Alexandre's proposal if I understood it
>> correctly.
>
> Exactly. And btw, there is no reason to block the merging of a simple
> version with just enabled and disabled types while we discuss the rest,
> as long as it is implemented as a typestate. Adding more ways to control
> the enabled status just involves adding new types to be given as
> arguments to `Regulator<>` and their respective `impl` blocks, so it can
> be done incrementally on top of that base, which I believe everybody
> agrees is sound.

Yeah, so I think it would be best if we changed to the typestate design.

---
Cheers,
Benno
