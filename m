Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395618027;
	Thu, 22 May 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907526; cv=none; b=nI0is0sWRPZKoXPiPhOmHudOMy5q+cAAhvRg4V1QzX+5wxxxna/ouXS7IFAmR0JEWfbVmsxGoKIptCcgsCGYd1m5IbbNKVX3Uh9tVygAO4hp1YDXh3CzIPEX3X6H2m/3mJUoB1HQaHxHhqhJa9bojo/053mV/PiC9ppXR5hfIak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907526; c=relaxed/simple;
	bh=R5gUtd7Ej8tnX3ImIcWWLb8QpdfRfk/XdEuvZ0Eu8ng=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TIGBLqtRmSWGzTj8aNy+1BM4Uzq4NQxdrcb/JgQPOVKlPiOqMxZQoo27AmyTXhm+EGKcQ7jcvsq+FDYD0I9fNzlY5yK/VKPu49oHzdpBRQTiO8stkerV8JoH/wYmOvaca1e55yYI3E5MyyZr84wtlwaOCsoQyD9JS7nMDY8HS5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryo8D6wt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryo8D6wt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C67C4CEE4;
	Thu, 22 May 2025 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747907524;
	bh=R5gUtd7Ej8tnX3ImIcWWLb8QpdfRfk/XdEuvZ0Eu8ng=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ryo8D6wtSvio0CwhkzR158v1NFzbaqmqiiBwFrJbco1L3dx7qjfRT8hcDlZEpg6t4
	 AxdT8B05kPM0A/uePIPKj/GrBb+wRCpVDn3hEC7QmnG+wu9wLhehBRmW+BS8DAQa2W
	 G7K89ET0Zr0pWgEUpGq/whnwYMVQ7QUT8UI7duMghmtqm+SShBPtC34PzCuk9oapmE
	 G4IDcD5Ica0TWIx0nunXa+Ml+f9q3/b5UkEFza31GI9wiFYDJSb0aPmCFBCNufryRV
	 tPwLuBFkVEDXWgVNkJ0w0Wb9eNQz1qRPjTvcT6AA8JMmwhpftiKYgMOehnL5VTaX6f
	 Ju41I9GoINa+A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 11:51:59 +0200
Message-Id: <DA2LI55W3BY8.14DMW9GGSAEY5@kernel.org>
Cc: <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>, <jserv@ccns.ncku.edu.tw>
Subject: Re: [RFC PATCH v2] rust: list: Add examples for linked list
From: "Benno Lossin" <lossin@kernel.org>
To: "I Hsin Cheng" <richard120310@gmail.com>, <ojeda@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250311133357.90322-1-richard120310@gmail.com>
In-Reply-To: <20250311133357.90322-1-richard120310@gmail.com>

On Tue Mar 11, 2025 at 2:33 PM CET, I Hsin Cheng wrote:
> Add basic examples for the structure "List", also serve as the unit
> tests for basic list methods. Including the following manipulations:
> * List creation
> * List emptiness check
> * List insertion through push_front(), push_back()
> * List item removal through pop_front(), pop_back()
> * Push one list to another through push_all_back()
>
> The method "remove()" doesn't have an example here because insertion
> with push_front() or push_back() will take the ownership of the item,
> which means we can't keep any valid reference to the node we want to
> remove, unless Cursor is used. The remove example through Cursor is
> already demonstrate with 'commit 52ae96f5187c ("rust: list: make the
> cursor point between elements")' .
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1121
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
> Changelog:
>
> v1 -> v2:
>     - Abandon new implementation of method to create a new "ListLink"
>       instance
>     - Rephrase the examples' comment
>     - Increase the coverity of the examples
>
> Tests was performed on ubuntu 24.04 with x86_64 architecture.
>
> $ ./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch x86_6=
4 --kconfig_add CONFIG_RUST=3Dy
> ...
> [21:13:11] Testing complete. Ran 615 tests: passed: 563, skipped: 52
> [21:13:11] Elapsed time: 23.020s total, 0.001s configuring, 10.985s build=
ing, 12.020s running
>
> Rust related unit tests are all passed.
>
> Best regards,
> I Hsin Cheng
> ---
>  rust/kernel/list.rs | 117 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)

This is a nice example, so

Reviewed-by: Benno Lossin <lossin@kernel.org>

It uses `unwrap` a lot, which might confuse newcomers that that is ok in
normal code. I'm wondering if we can do something about that though...

---
Cheers,
Benno
