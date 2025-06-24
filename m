Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBCB2BD59C;
	Tue, 24 Jun 2025 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769327; cv=none; b=tmys1+uW6go2utLVEXxhfyop2JAbq+88Sk8s9uMRV5Q5lr0u2gTXh1wd/lBwHakHUS8xcI4c6kzMXVUYcG5Vox7ANj0/Cu/uHkcybo1nJKZjp+VpZJr9yeHlbKd1btonjVYrSGq6dYeE3qNnUsOhNYevwnjczGKLVLMmLuew9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769327; c=relaxed/simple;
	bh=tP4bo0nKPQxjqvAvCgRkhsp1e4XImh4zH8iqxHKFAZc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SKhxfcB7uTFXIhQhbrpogHZYXhRqlWHJp1xQiUmliGcpzA/Q4y3W6cpuM9BnodWNa6cfzwBGwCBzauNZ3ZXmIpZYP2npdkt6lYUYbaot6cCUVC7IC2s6kpAimnLwSwJibMdUwXx8UlhD4FxWbZLyAiSUCiJMt0LxeMcHR5FC9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZ+OIKBL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZ+OIKBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221AAC4CEE3;
	Tue, 24 Jun 2025 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750769325;
	bh=tP4bo0nKPQxjqvAvCgRkhsp1e4XImh4zH8iqxHKFAZc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=qZ+OIKBLrFvFkfxsR5MIjH2l+GMeUdJ3LvE6in7YKt8ZOlrdvYvTvGdUPiITX+Hci
	 IAUAG5FOl960IuncqFsT4sCckdvrwyVGTK3t+hqXliRYnEHYFQdQ6FOXLSAexzegUG
	 CkDOi3rib7zM3USAYCGKlx4rPa9QT3sleQhH/wPnIApaJrzDaEoGsNffh5dUlhRo0T
	 Q+hC/mnpj8MT7zlckl7TmIBqpamxI+HMgRPCwYn2ORln9cZjxHKRjVzfNiOmij/fvm
	 3ztY/gCPEN16LIxzHgZiRBma1oGeGBiIc3rPiUga5y5Xqul22RAcueJSmpl8W3BDw+
	 BsacP4oqOPr1w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 14:48:39 +0200
Message-Id: <DAURXDWGWEDV.2GZ129VC6IFKF@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <longman@redhat.com>, <felipe_life@live.com>, <daniel@sedlak.dev>,
 <bjorn3_gh@protonmail.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
To: "Onur" <work@onurozkan.dev>
X-Mailer: aerc 0.20.1
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org> <aFmKsE_nJkaVMv0T@tardis.local>
 <DAUARTYJ118U.YW38OP8TRVO3@kernel.org> <20250624083437.1e50d54c@nimda.home>
 <DAUM8B2ZUMFQ.25R95W7IDAEHM@kernel.org>
 <20250624153102.3961f377@nimda.home>
In-Reply-To: <20250624153102.3961f377@nimda.home>

On Tue Jun 24, 2025 at 2:31 PM CEST, Onur wrote:
> On Tue, 24 Jun 2025 10:20:48 +0200
> "Benno Lossin" <lossin@kernel.org> wrote:
>
>> On Tue Jun 24, 2025 at 7:34 AM CEST, Onur wrote:
>> > Should we handle this in the initial implementation or leave it for
>> > follow-up patches after the core abstraction of ww_mutex has landed?
>>=20
>> Since you're writing these abstractions specifically for usage in
>> drm, I think we should look at the intended use-cases there and then
>> decide on an API.
>>=20
>> So maybe Lyude or Dave can chime in :)
>>=20
>> If you (or someone else) have another user for this API that needs it
>> ASAP, then we can think about merging this and improve it later. But
>> if we don't have a user, then we shouldn't merge it anyways.
>
> I don't think this is urgent, but it might be better to land the basic
> structure first and improve it gradually I think? I would be happy to
> continue working for the improvements as I don't plan to leave it as
> just the initial version.

I don't think we should land the basic API when we don't have a user
in-tree or blessed by the maintainers.

> I worked on the v5 review notes, but if we are going to consider
> designing a different API, then it doesn't make much sense to send a v6
> patch before finishing the design, which requires additional people in
> the topic. That would also mean some of the ongoing review discussion
> would be wasted.

I would just wait for DRM to say something :)

---
Cheers,
Benno
