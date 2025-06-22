Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EAB440C;
	Sun, 22 Jun 2025 07:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750578621; cv=none; b=XGz49sZgRKQ5p2yk4VzaEXoYr2YqYfFthGk7DkCXLsTOS5x0dt7Mwr6xsHwmdGVTU+ukPm4EGf2fRv3PH2n7k2QU0Uv5FKKkY8BJ6r1MSEafth4Nx1BHIX1Lj38sb87PNVYKmrytP56cWJsLQWlbu3zk1Ko6VxIOYJvBPuuVhzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750578621; c=relaxed/simple;
	bh=14ttKKGoM/RqwfhDERDItGB5yA4zTPPNc8RqK7VoYUg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bFELB7z0UbMaSxwgBnh0GHyrIxy3BFTwq4O69DgkTtKcv5OCCx/4BonpNkml01B2kyL+VQjPDfw32mrh8RlLdC9lDrW7byPUUbvxtV5uvmyFIBOM9wJ+qq2W17wGiui9bkLZElXc29pHYy9A65gRRvZyBFzWMdn8BdXQo/gnGHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUskffia; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUskffia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D771C4CEE3;
	Sun, 22 Jun 2025 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750578619;
	bh=14ttKKGoM/RqwfhDERDItGB5yA4zTPPNc8RqK7VoYUg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fUskffia2xPRyJxPLxy/L8RvkPQjcltv9R0hj+sO+IOTd39Dhjfgwxb+eMF02mJ/v
	 Hse6KQuGYTo12W9hwU9lYJY5OY3a9iMPByX0lJTa91GTjm1d3QuYiyP+TM49sjRFQG
	 1emFYpSdBIZeU1vKb4SH1WT8HOupgRwXfUls1HWjhWQdzhLWxU4pTSBor67wPfNlbk
	 OifCN9q48xfTUMORPK7pYxdjzgTJ8ismUpH8OKm48YfdpFPeUI8mWp35gZBBV7qWsd
	 BUQ5EgKMzUwmdml1xEO/2DgvFa09Rpu8GOzJWwp1W1h5h1auEQLNLB530bvsCRYOA9
	 eYnTXbNR9VqEg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 09:50:15 +0200
Message-Id: <DASWBTM3280H.KMIP372JNU2O@kernel.org>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Christian Brauner"
 <brauner@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] poll: rust: allow poll_table ptrs to be null
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>
 <DARD1ZC0W9QR.3CBLX6RYE65VU@kernel.org>
 <CAH5fLgh7n75Q4Txi29CxFG4nfkxzceqh=bMBDyYj01G_KC0vwg@mail.gmail.com>
In-Reply-To: <CAH5fLgh7n75Q4Txi29CxFG4nfkxzceqh=bMBDyYj01G_KC0vwg@mail.gmail.com>

On Fri Jun 20, 2025 at 3:19 PM CEST, Alice Ryhl wrote:
> On Fri, Jun 20, 2025 at 2:31=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> On Fri Jun 20, 2025 at 1:49 PM CEST, Alice Ryhl wrote:
>> >      ///
>> >      /// # Safety
>> >      ///
>> > -    /// The caller must ensure that for the duration of `'a`, the poi=
nter will point at a valid poll
>> > -    /// table (as defined in the type invariants).
>> > -    ///
>> > -    /// The caller must also ensure that the `poll_table` is only acc=
essed via the returned
>> > -    /// reference for the duration of `'a`.
>> > -    pub unsafe fn from_ptr<'a>(ptr: *mut bindings::poll_table) -> &'a=
 mut PollTable {
>>
>> Returning `Option<&'a mut PollTable>` is not an option? I'd like to
>> avoid wrapping raw pointers...
>
> You're going to make people handle the Option by early-returning if
> you do that, but that's wrong. You're supposed to treat null and
> non-null the same.

Ah right...

An `PollTableInner` type that wraps the `bindings::poll_table` opaquely
sounds like too much work, so let's go with your approach.

---
Cheers,
Benno
