Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282741DE8A8;
	Mon, 26 May 2025 08:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247634; cv=none; b=VmraSspmBlAHp2zzbJ5ecEJLwGBfD0yIHAokOnZb1PsWJYERx8EtRu3WjGzQ2BuZHmf4as8Rp2Xvr8cW+3YCiGFRxcM+IM2jXGVIN4fG1vT8SVpRSdGzIrfI1MAJhpGJ+gAykq+ApTOdWL/G0GN45UY324yaeyYUueoVGFIYrHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247634; c=relaxed/simple;
	bh=HlU/0ni7MwptXgoVUqZofP3Np+dxqL4/gUC4D8PY4fk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=slDpKDXyAGGlNgggp2jw95FHY6zuUh8f8pbKZ7fKkUD03pCSnUnSYGpqnHU4gBurhXaEpoYap+e6UZ5O241Ccmr+GR6o/n4qsBFjtdG5Ijp79NulmxoYxzT8HcfuValPK5dkhYefd7l+70HeBwvKUQnTTvIXBz6yFbWEKvCL/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pm3SW2fB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pm3SW2fB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBFCC4CEE7;
	Mon, 26 May 2025 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748247633;
	bh=HlU/0ni7MwptXgoVUqZofP3Np+dxqL4/gUC4D8PY4fk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=pm3SW2fBYNOPsPGyeOlAQbz3ptB+qKJhCFJqy1WyNmBb6NMPRUJGcCzTvnet0Eo4P
	 shO89v9/GtMnBkEl9okwHesK5eUpzeG++Eg5obhNrvZJpKmebjFx94Ayc2+9rrOeUW
	 BRzuD91gMxJe99Rr/bUteoYDDs8nB4hwiAAFZ4XNxG3lDnThMLAdGqpD+EvSGxJSKQ
	 2gvQ+HKIL/1TMljW376NDMJqF2q8GjcCmNk8p+KR6WX6ET8qK/h2ENPG1p9VpLftSg
	 gYohgzKjxtEe+IXy45uwGtLq5BuOcB/NuVZeVmf6yZdIDKr+/RfzOaE9rOmzVEIJ6s
	 DrIpmbbILHTdA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 10:20:29 +0200
Message-Id: <DA5Y29IWBB91.HTQ1WI3824FX@kernel.org>
Subject: Re: [PATCH 2/3] rust: pin-init: examples: pthread_mutex: disable
 the main test for miri
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Benno Lossin" <benno.lossin@proton.me>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250523125424.192843-1-lossin@kernel.org>
 <20250523125424.192843-3-lossin@kernel.org> <aDC9y829vZZBzZ2p@google.com>
In-Reply-To: <aDC9y829vZZBzZ2p@google.com>

On Fri May 23, 2025 at 8:26 PM CEST, Alice Ryhl wrote:
> On Fri, May 23, 2025 at 02:54:12PM +0200, Benno Lossin wrote:
>> From: Benno Lossin <benno.lossin@proton.me>
>>=20
>> `miri` takes a long time to execute the test, so disable it.
>>=20
>> Link: https://github.com/Rust-for-Linux/pin-init/pull/50/commits/e717a9e=
ec85024c11e79e8bd9dcb664ad0de8f94
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>
> I usually recommend ignoring tests rather than cfg'ing them out
> entirely.
>
> #[cfg_attr(miri, ignore)]

Oh I didn't know you can do that!

This patch sadly already is in the main branch and I have the policy
that I don't rebase that one, so I'll make another patch to fix that.
(and in the future I'll wait with merging for reviews on the list :)

---
Cheers,
Benno
