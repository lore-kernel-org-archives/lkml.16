Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F41227A935;
	Thu, 15 May 2025 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313756; cv=none; b=o46jhDPut0U+WBJXVb0lHdb7SyXg1bP33D+ibcs7ZfFsIwhdH5CUzbxwFSEBDx9h86w1YwGABgQWcz4Tks3lIfdQ15klBtHm02Qkx2cbWtMLUIPf25drHLzOziVu0NVaUX/7qlD6+jwBhjyLeJgPzyA0JFp6xX6WrySrdL9q2gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313756; c=relaxed/simple;
	bh=J49Qw9mvqoJe9A+RJdZ5QqMPBIEkghz7lzA1xzIbRlI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SI5qwBYWC28Gg5PxUs8GfJKc7v7AODwePtbJ6xhdk9yVUG3JTKC3cCKhxcmcnBqmNCK4376qe5lS2jwXfWXPtd6mnOqVEDIh7UaYgV9cBGmaDelGCduZTK3aCCt3WlvTdq4vrCS4BgcDcgNCEFine8neL31LPXtiMPlHfW+iLwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OG1KrY1Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OG1KrY1Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B11C4CEE7;
	Thu, 15 May 2025 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313754;
	bh=J49Qw9mvqoJe9A+RJdZ5QqMPBIEkghz7lzA1xzIbRlI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=OG1KrY1Z8iKq9Z8LSOhm7LjkRO6ErLaKpeYyAhtkDMjZIF1JJxx7fxFb+UjKRSzWS
	 VNsZTPMfmQAg9wSomvcptmtq5DwYnJaFQAGrpvj8XYi4xvII8omgRb2eTZkgk3+ygs
	 rnzO40B31VhXz/D96YiQewk5ctHGeXcymj/8mhnPEEALrcpLJpAkkBvEUjUbZ/QCx0
	 3KTqlaK4umUXtlaN15TTlo3e7aCvEA6DRXZ7WNKqfSbEw1WNqC+vyAozBOyVQ0NIpU
	 nDdzqoKt49OfyVvvzizcMxF4HZINHNQzU1OJHaKd9fE5PcriawFSJtGdMufubqz6W1
	 vQeVpxxCPtV8A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 14:55:46 +0200
Message-Id: <D9WR11ILWC2X.2TIYICAG4H1Q1@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Sami Tolvanen"
 <samitolvanen@google.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org> <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh> <aCXgDHtdXb7Wf92P@pollux>
In-Reply-To: <aCXgDHtdXb7Wf92P@pollux>

On Thu May 15, 2025 at 2:37 PM CEST, Danilo Krummrich wrote:
> On Thu, May 15, 2025 at 01:43:09PM +0200, Greg Kroah-Hartman wrote:
>> On Thu, May 15, 2025 at 10:59:44AM +0200, Benno Lossin wrote:
>> > On Wed May 14, 2025 at 11:55 PM CEST, Matthew Maurer wrote:
>> > > On Wed, May 14, 2025 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kerne=
l.org> wrote:
>> > >> However, I really think we should keep the code as it is in this ve=
rsion and
>> > >> just don't provide an example that utilizes ManuallyDrop and forget=
().
>> > >>
>> > >> I don't see how the idea of "manually dropping" (sub-)directories a=
nd files
>> > >> provides any real value compared to just storing their instance in =
a driver
>> > >> structure as long as they should stay alive, which is much more int=
uitive
>> > >> anyways.
>> > >
>> > > We can't easily do this, because dropping a root directory recursive=
ly
>> > > drops everything underneath it. This means that if I have
>> > >
>> > > foo/
>> > >   - bar/
>> > >   - baz/
>> > >
>> > > Then my directory handle for `bar` have to be guaranteed to outlive =
my
>> > > directory handle for `foo` so that I know it's didn't get deleted
>> > > under me. This is why they have a borrow onto their parent directory=
.
>> > > This borrow means that you can't (without `unsafe`, or something lik=
e
>> > > `yoke`) keep handles to `foo` and `bar` in the same struct.
>> >=20
>> > Is there no refcount that we can use instead of borrowing? I guess not=
,
>> > since one can call `debugfs_remove`. What about a refcount on the rust
>> > side? or is debugfs not used for "debugging" and needs to have the
>> > performance of no refcount?
>>=20
>> debugfs should never have any performance issues (i.e. you don't use it
>> for performant things.)
>>=20
>> So refcount away!  That should never be an issue.
>
> Reference counting (parent) directories should lead to a much cleaner sol=
ution.
>
> I mentioned that previously, but also said in that context that it's a bi=
t
> contrary to how the C API is utilized currently, which usually isn't desi=
red.

We could also change the C side to use refcounting :) It is probably a
bigger change (I have no idea how common the usage of debugfs is).

In my mind, it would also allow the C side to benefit from the same
"drop the dirs that you don't need anymore and all subdirs will be
removed if they also aren't referenced any longer" thing.

> However, if we're fine with that I think it's superior to the borrowing
> solution, which requires keep(). IMHO keep() is a footgun in general, eve=
n if
> not callable for "root" directories.

I would prefer refcounting over forgetting, it much more clearly shows
who owns the debugfs dirs. Also, in which cases would one not call
`.keep()`? The USB example from the other thread comes to mind, but
there you might be able to borrow a `Dir<'static` for `'static`, are
there other cases?

---
Cheers,
Benno
