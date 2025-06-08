Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61761F542A;
	Sun,  8 Jun 2025 07:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749369587; cv=none; b=jfSW/oQB7uWFNijAb3w0JI2m+fDJzQambVTJaK5MW/ZvuAdHurDFvWSUwUMZ7NEHmoTi00Ev391yGg/7KtAJ6H9dlWN2zRZjRHauXPOfatzFkRgwgJg4oZRJZCvXik6HfVkrkTweO3lGAUHRquK9Ar0Fg/KbR3JUZw6Gf9RoI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749369587; c=relaxed/simple;
	bh=YDoe8vwFjSHkBbnBtX3/l9OTifg0Duht1C8iyQl2lK0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Jh/DjHIB6jky1g8X7ekyMwPL7nwH0P4DGPG2ZpF6H7adUDJ3HfxVbpPNxUP5IzR8pkMgzGC3dgxV50BYmR71kkjFmvf9Db1uyFUb8MMsFYgxvvBxE7jFItJ5Ty8p3aBUP/t9npwmM5m1BWF3Qn3EATMeBM5kT/ChAVnO4ZglIN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOHy7Rn3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOHy7Rn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7819CC4CEEE;
	Sun,  8 Jun 2025 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749369587;
	bh=YDoe8vwFjSHkBbnBtX3/l9OTifg0Duht1C8iyQl2lK0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VOHy7Rn3If7xQ+cT7p0hyLF/o8gq9dFlN8vS6ZqbCCHot9fyAcGZxtTHwUOkUfnwZ
	 P/L3HpNBQ0n8qq+6z0M8eW+QPCWkD++pl7Pa6xSXn+4eB/1ZQUjRVWVwckxQgExorK
	 clNG4eghDirShYruI0Nd1onsnxUQskovZ34BTymfy29HLDJydmTCzryDgq1Qs+o6eg
	 V1wmSn+GE5L4TGh4HEtytzm08N1sbcp3ZUzXTc7KOXs7gxIMC/5q6SK4fIe+GUZPCk
	 af91HzylrZmrsa3kw9MS/XUlSEGv9ScD5ch1thAzH5sxiJ7ogXQwcGGZZK50wEeLXC
	 /vVK2rYQn8Lxg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Jun 2025 09:59:42 +0200
Message-Id: <DAGZRFQ2YFFV.1OJBPD71DJ0BX@kernel.org>
Subject: Re: [PATCH v4] rust: doc: Clean up formatting in io.rs
From: "Benno Lossin" <lossin@kernel.org>
To: "Sai Vishnu M" <saivishnu725@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <gregkh@linuxfoundation.org>, <daniel.almeida@collabora.com>,
 <me@kloenk.dev>
X-Mailer: aerc 0.20.1
References: <20250602164923.48893-2-saivishnu725@gmail.com>
In-Reply-To: <20250602164923.48893-2-saivishnu725@gmail.com>

On Mon Jun 2, 2025 at 6:49 PM CEST, Sai Vishnu M wrote:
> From: Sai Vishnu M <saivishnu725@gmail.com>
>
> Removed reference to internal variables in the comment of `IoMem`
> This avoids using private variable names in public documentation.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes:  https://github.com/Rust-for-Linux/linux/issues/1167
> Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
> v1: Used backticks instead of `@` for parameters
> link: https://lore.kernel.org/rust-for-linux/20250530123129.31505-2-saivi=
shnu725@gmail.com/
> v2: removed reference to the variable entirely.
> link: https://lore.kernel.org/rust-for-linux/20250601164939.5306-2-saivis=
hnu725@gmail.com/
> v3: Moved chanelog to commit message. Used the proper parent commit.
> link: https://lore.kernel.org/rust-for-linux/20250602083119.17752-2-saivi=
shnu725@gmail.com/
> v4: Fixed the patch format with the same commit changes
> ---
>  rust/kernel/io.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
