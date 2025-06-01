Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE81A1BE251;
	Sun,  1 Jun 2025 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748794171; cv=none; b=Zd1kLny06JdnOsZ8rhKTz60ik7KfYFVsBrNxQMIDxGGyvYJ/dazhToOVw0+fxbEKDHPY3jiCAf9mw4UCAd81qyS9HEhskTj7L1lvMIlFBo2Hl4cnutZ2vuTib3Q2gh+j4tFGtpZjXmqoaudjwtzdh5JXySRSuK3QristOCKfaiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748794171; c=relaxed/simple;
	bh=AxYAU+ZdB9zo4fhtMdkeMneVNBWpWuCIqSB05ns5SX0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=im9Lb+FtWLYB4WqjRw59nLbptnqo9MI/BUhN8uTQMPDwc8Ngm58JFFBKOVwX1K1ISuqGHJDCnZJ98MiMeWUGJZY2YpKVowx8wYS+F/3Emym//if2zppGljnGWpoylcKX3CIPjfu4tq/6MJP5yiGgZbRsmJF4t7qzrFTBgF0LYDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7p7PyKS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7p7PyKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7260CC4CEE7;
	Sun,  1 Jun 2025 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748794171;
	bh=AxYAU+ZdB9zo4fhtMdkeMneVNBWpWuCIqSB05ns5SX0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=W7p7PyKSSYxhu+o6atcr6r8QUb2UvzDV8ObmIEx4uKe4mijQo1hQmr8wk6T0HGwaJ
	 iahWVcL3TGmlStv0ekQJNr/fbbQmJ7aqTwIqe2GBN8IeFc7ZvKeoDGr+Ux2JkACmkP
	 vonQydoVnCNG05+N+eWrEbFUeJs8bTmqxJbC1bjO+HsmY3InECUxrwmv6BPrdNZQ6E
	 7Rgof4IG7LgA7jsCE/WFR5bF9A7oNq+lFGmpGq1PDY0qBy9VzwAxud7bl1zMBltbiK
	 tverdNJIL+hjkJsgUCzoa9pvELZMC2saTrJSHATAQYUqkV4ahzf5Gp6ADoh4EB7p82
	 3CvXWBVxdIAqA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Jun 2025 18:09:26 +0200
Message-Id: <DABBSL9WTE9P.DX3I6CFIYH7P@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com>
 <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
 <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com>
 <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org>
 <CAH5fLgjNCQV8zsfdeq21iXiu_VOpt=WGnm9nMp-B0bOEMEBctw@mail.gmail.com>
 <DAAMVOZJDNNT.1JR5YY3ICI0Q5@kernel.org>
 <CAH5fLgj8WkjDs6qCmzxYsYTH=_knWyZDrwqLopvGZEBk931aXQ@mail.gmail.com>
In-Reply-To: <CAH5fLgj8WkjDs6qCmzxYsYTH=_knWyZDrwqLopvGZEBk931aXQ@mail.gmail.com>

On Sat May 31, 2025 at 11:09 PM CEST, Alice Ryhl wrote:
> On Sat, May 31, 2025 at 10:38=E2=80=AFPM Benno Lossin <lossin@kernel.org>=
 wrote:
>> Maybe I misunderstood the code, but if you do this:
>>
>>     let slice =3D UserSlice::new(ptr, 1024);
>>     let mut buf =3D [0; 42];
>>     let s =3D slice.strcpy_into_buf(&mut buf)?;
>>
>> Then it will read 42 characters from userspace and (if there was no nul
>> byte) overwrite the last character with `\0`. If we now do
>>
>>     let mut buf2 =3D [0; 42];
>>     let s2 =3D slice.strcpy_into_buf(&mut buf2)?;
>>
>> Then that will continue the read at index 42, but effectively one
>> character will get skipped.
>>
>> (Now it's not possible to call `strcpy_into_buf` multiple times, but I
>> see no real reason why it isn't a `&mut self` method. Also a user could
>> call `clone_reader` and then manually `skip` 42 bytes. Although they
>> might only skip 41 bytes, since that's the length of the CStr. But that
>> runs into the problem that if there was a `\0` at index 41, then
>> repeated uses of the pattern above will yield empty strings.)
>
> I removed the ability to call it multiple times to avoid dealing with
> this kind of question. You may submit a follow-up patch to change it
> if you have a use-case.

I don't have a use-case, but we should document this behavior somewhere
especially since the ability to only call this function once guarantees
the correctness.

---
Cheers,
Benno
