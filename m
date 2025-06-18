Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B72F5462;
	Wed, 18 Jun 2025 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270900; cv=none; b=Gzb5JRtfnelJh6RXEYiz2tx2MXEz2puzUzmUiUiXsyfzVR371nFGbifK1gbmYhrEERYU2sn32locVgtzzJhyfKTtrP7Z989W2Q4kFWXp24o2eeME9oudHpprufcK0o39HGyEZYbitgKcUEMsMjuTtE2SFVkvJEdDekNwZbxf3rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270900; c=relaxed/simple;
	bh=vmCpin+d/oM43d3gTlJs2G5RmrpExSEP9M9Z+YwvE/o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ii2Si+OddVgKYTVuWeG02fRkepFyyK9kM4pysBWO73AmuB2sNc0OuF3g6QKpEhkG2ZG4S3PJB26r0iL5L67qUuyJBoql7XRLUtoyIAd7hf9ke6oKS+KJ7X9/VJOZBDTZi2LZmHzbUqALDHGez96XRbxKIQAPbgVnlIOG6CxSU9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5m2D7WF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5m2D7WF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798F8C4CEEF;
	Wed, 18 Jun 2025 18:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750270897;
	bh=vmCpin+d/oM43d3gTlJs2G5RmrpExSEP9M9Z+YwvE/o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=B5m2D7WFQZprftshY4KBhu0wnf7BRPIZxqpfQz8yMycqXnhUlG748/XB67fuGPyCj
	 K9mUCWffQ3DoVmKWMsvpV9Y/9uxPIZKKlNeK+M3s+rivaEv9Xf4/v8Xbsz9XDoej7l
	 wEvOKWj/49neJdB66TdfZnkaX3ruA+e29EfsrEMZJchMIoOS7ANdjGUckPScIUMlHy
	 h4Rz8qQ7vhuXHaYWETxQikL6OLD37uZC6sxOfLOiua0X6+Y/ruzLzdPrtxFKFTtT5n
	 xLdu01ghrgiMjZuWf4n/Wv9QtpcaBhJJTl1UF4YGQMu+fREiCLd6/g8r78JtWtoqlN
	 KtIMlnNdsmWiA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 20:21:33 +0200
Message-Id: <DAPV905HEGUN.5CLGEF6MLNWN@kernel.org>
Subject: Re: [PATCH v5 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com>
 <20250616-strncpy-from-user-v5-2-2d3fb0e1f5af@google.com>
 <DAOMXR37F36S.2P4ZRUYF7E140@kernel.org>
 <CAH5fLghMD2RQynaFdLVa+JAy17o5NW_pe7p3Cj1-A-FQVA--_A@mail.gmail.com>
In-Reply-To: <CAH5fLghMD2RQynaFdLVa+JAy17o5NW_pe7p3Cj1-A-FQVA--_A@mail.gmail.com>

On Tue Jun 17, 2025 at 10:55 AM CEST, Alice Ryhl wrote:
> On Tue, Jun 17, 2025 at 9:38=E2=80=AFAM Benno Lossin <lossin@kernel.org> =
wrote:
>> What about the case `self.length =3D=3D 0`? Will `raw_strncpy_from_user`
>> return early with a page fault, or will it return with `len =3D=3D 0`?
>> Because if it is the latter, then this will result in UB.
>
> If `self.length =3D=3D 0`, then you will either:
> 1. If buf.is_empty() then you return EINVAL at the top.
> 2. Otherwise, you return EFAULT from the `len < buf.len()` case.

Ah that makes sense. Thanks for explaining.

---
Cheers,
Benno
