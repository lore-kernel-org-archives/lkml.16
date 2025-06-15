Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57319136672;
	Sun, 15 Jun 2025 15:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001324; cv=none; b=OTvYJHWqIlHk8l/R2J0JESBPmAzRFjHweENwbFxOsohh3BK0VmL0/1sDUSCqhd8YUMRhDfhK7tRXXJargv6IpGbZ+RZakfuouTv+NVqdPiTxD6LKbZm7LeJoB6NyumregxRh4F1bcYutm3EaoXL92Zh60d/T77upZNziqRzX3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001324; c=relaxed/simple;
	bh=xA5mHmkrGZu71u+vktnRJRhjOmvF6LkGoK+B9WLTl/k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EJf97oiGGxnf6nmMvsfZHf2me+SW8BtaBpJl3ysVFkEgVIxKqlpqljm02AQczz2FZk12dC6UDV8hZimCGukn03359MGDyaUFbeaSrLYk350y/rjRn5J/y64usiy0b0mLfKmZht4Ny8WY8X3CG6nCM2HrJNFjE1d0OABDReUjhc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KB69Db8X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KB69Db8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1B7C4CEE3;
	Sun, 15 Jun 2025 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750001323;
	bh=xA5mHmkrGZu71u+vktnRJRhjOmvF6LkGoK+B9WLTl/k=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=KB69Db8Xsbz4gEFfsi4ad0VvHdReNiB3hA0X3NHwDYLhrtYjfAVLj9tv5d9zxaXd+
	 Wec4eKxTW5glhsALUpY6c9Ilv0s9F5HmPaDZp/q84bjtwcFPinASD3BUkkdzqBnY2r
	 3LdfZSWIT8I02Wl4fgR+6aH9sDmBFn/D2CyytNnBoOAOtwxpY6kbVnwIKxbYWfrE1d
	 d3u7u8HE2YOoJljUl5bz4kknafxLAuRoYPTbQaq7TcbK1zu09EpHQ/mm0z+SorEJP+
	 sEvCUbQLStJEMJ1yK2EtuDUcG94QUipDgmsjtLQXZmoZyLjb7LRABFzSDtmYrc8/+y
	 w+03PnkfOJRmw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 17:28:39 +0200
Message-Id: <DAN7OZOVQE9O.278A4DZTGOT9B@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] rust: alloc: implement `Borrow` and `BorrowMut`
 for `Vec`
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
 <20250613-borrow_impls-v2-1-6120e1958199@nvidia.com>
 <DAMHZIN35QQ9.3N5WSB58J4WG9@kernel.org>
 <DAN417QCDAVJ.1TNY82G9ZVDYF@nvidia.com>
 <CANiq72mEpM1vyuFEue12aDHdheXCZ2oWiuzXkN6-D-KkHHhuBw@mail.gmail.com>
In-Reply-To: <CANiq72mEpM1vyuFEue12aDHdheXCZ2oWiuzXkN6-D-KkHHhuBw@mail.gmail.com>

On Sun Jun 15, 2025 at 3:16 PM CEST, Miguel Ojeda wrote:
> On Sun, Jun 15, 2025 at 2:36=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> That's fine by me, I was just a bit nervous to start a doccomment
>> directly with the examples, but in this context it appears to make
>> sense.
>
> Yeah, that may be my fault by emphasizing a lot the "title is used as
> short description by `rustdoc`" thing :)

I also do that pretty often :)

> Here that does not apply, and I agree that (at least the title here)
> is not really conveying anything.

Might be something for our "how to write rust docs" documentation :)

---
Cheers,
Benno
