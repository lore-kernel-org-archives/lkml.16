Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFD223324;
	Thu, 22 May 2025 20:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747945619; cv=none; b=iUrH1MLvOmUisb0v3qRH6HTVQxq/tj3HMBOnTRrSG5/F6cmU7hL/kiAQthBWjIYwgUmsYg38Y+yIB9YjuCGNE8uh5/Dn0pJSnMSUPRENAwN+9NvugCxLhbUU2IUz0n/mqIPmUoIhc0mFDNUKSl/kzPI5zT05q7SODFvvg9OtEyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747945619; c=relaxed/simple;
	bh=jop/IKCXLh5COEghxS3UK6eTSCF0YL1V6QpibBl0xkQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Zlb60ucB2fQkEUY3dSPbbv9lRRJiUDsQZYBR5NfPXNOsN5322/XCkgzTftSAumvHflqcKbTLX9ZUrE3pYsULG7Uy6b/eHHv7yuYJgOUjSQheC+itqbu5dt9T6l4GAyX6NAOqQGsm2OsUV5ls40fLen9N/OikvVeiq6wksrf2tsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ix/kq32m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ix/kq32m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9B8C4CEE4;
	Thu, 22 May 2025 20:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747945619;
	bh=jop/IKCXLh5COEghxS3UK6eTSCF0YL1V6QpibBl0xkQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Ix/kq32mHPSU9po435TRd2FwKedgEa/XUtp8YtDEgt1+yZOguqOFeh4OeQWdQ+h5x
	 gtLVu1Bn+AHPJYmGCqz8FfCX+31msWlEkVV8wW6LtstAqa5MzFR7c0SYj6Ot7Y7ckn
	 VVT62bSV+UJBfAUsEou+sYT9093dzaNuwOS6SklASMg4bsU8bChVTXsh2pcnknvb4x
	 XRcWPBILvIv9rL+FgHHdQbHJ+E5mv7vBxgvuVX+2iohLVSDgD2SwmfDvWjQxKh46Xc
	 Wq5RtY2xxUq4D5/ktmQX44604zYE/0uUxuESphZ9SrHylZxeFfOrADloUQy0lnek7x
	 wg+yZfpkd3Rxg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 22:26:54 +0200
Message-Id: <DA2Z09MJZSKV.35D1CB1MQ4EJD@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Matthew Maurer"
 <mmaurer@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh> <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux> <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux> <aC8uNmrLUSS8sxHU@google.com>
 <2025052201-return-reprogram-add9@gregkh> <aC9hm9D458C6LsRW@google.com>
In-Reply-To: <aC9hm9D458C6LsRW@google.com>

On Thu May 22, 2025 at 7:40 PM CEST, Alice Ryhl wrote:
> On Thu, May 22, 2025 at 04:15:46PM +0200, Greg Kroah-Hartman wrote:
>> No, sorry, but debugfs files are "create and forget" type of things.
>> The caller has NO reference back to the file at all in the C version,
>> let's not add that functionality back to the rust side after I spent a
>> long time removing it from the C code :)
>>=20
>> If you really want to delete a debugfs file that you have created in the
>> past, then look it up and delete it with the call that is present for
>> that.
>>=20
>> The only thing I think that might be worth "keeping" in some form, as an
>> object reference as discussed, is a debugfs directory.
>
> That could work if we don't have any Rust value for files at all. The
> problem is that if we do have such values, then code like this:
>
> let my_file =3D dir.create_file("my_file_name");
> dir.delete_file("my_file_name");
> my_file.do_something();

I might have misunderstood something, but "deleting a debugfs file" is
not the same as freeing the representing object (is that a dentry?). So
you could still call `do_something`, it just wouldn't do anything.

Or did I misunderstand?

---
Cheers,
Benno

> would be a UAF on the last line. We have to design the Rust API to avoid
> such UAF, which is why I suggested the ghost objects; the delete_file()
> call leaves my_file in a valid but useless state. And as a ghost object,
> the .do_something() call becomes a no-op since the file is now missing
> from the filesystem.
>
> Alice

