Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFBD23CB;
	Sat, 28 Jun 2025 03:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751082950; cv=none; b=iM/lAYgXSjCGXDYlHUvVIpNFyoOo1vD3Gdg8cUpjhNGcszS7UkWddxTLvsxMj8gRyehK2/bDfGswMktMNvPgLUCGJ/b9VManyhPnZBZo8DH2698Ff0+pL+Yb7A5Dptx4MbZNIO1fGiFAaaVL1aJv9nioiAVJgrybD0dUh1fIXY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751082950; c=relaxed/simple;
	bh=AN/QJXPk97fVAvYSLHKMR5kU3rXAQDsVUj3rHUhRyJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=q4yMeIBFpszYYMhdLRbjK/SYyj4Tf9W7RY9uQ8tUOy9Xz+XOgK+w6HzXZfYDU9K73YYDpUDSGi2EgqkoK8Q2lbxvCbDUXUtQrNyPVHtBqsOGlnDOBHDyLhlqxto3gB5c8hXFPw7u3X5X2ky4pjYaGF4JY3W90h/iq9sx4uJTIfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ka1LkIU5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ka1LkIU5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0DFC4CEEA;
	Sat, 28 Jun 2025 03:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751082950;
	bh=AN/QJXPk97fVAvYSLHKMR5kU3rXAQDsVUj3rHUhRyJ8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ka1LkIU51t2MsbB5+6t9yZs0Hn0nd8nVJpTQmRIXKs/KBOxObVk/M5eGSwXO+FHaj
	 JytjfuYxWmY3+c2gbRbqHPHXyy+akM0IhLLBcyEQk2idzI6XtGRv6gjP8CjJW8xzLp
	 sX9+N1bl0rha6BZJ3tl+VIzlpILEAoiZUSAP1xqlKk84qjDZD9+JtuzW5YAS4SRcjY
	 U3EBZ0XbvpxUM9iriLfcCv1BXgxKaU3J+a/jzvKcozmD2R79HS6WGaUm3XZaHSoyT/
	 /Z9SKHF4WsYi+29O85+57eIa1mc0neyOR1Wbu8pgy/QXRY4kCW4AD6Ir3BZRczawyg
	 jxyvbhKPNmagg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Jun 2025 05:55:45 +0200
Message-Id: <DAXV3JY5QPCA.1HKCQZ2V3NVES@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: miscdevice: Export vtable testing
From: "Benno Lossin" <lossin@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Isaac J. Manjarres" <isaacmanjarres@google.com>
X-Mailer: aerc 0.20.1
References: <20250627-linux-miscident-v1-1-d37c870550ef@google.com>
In-Reply-To: <20250627-linux-miscident-v1-1-d37c870550ef@google.com>

On Sat Jun 28, 2025 at 1:42 AM CEST, Matthew Maurer wrote:
> A common pattern in the kernel is to test whether a file belongs to a
> particular driver by checking its `f_op` struct against an expected
> value. This provides a safe way to perform that test for `MiscDevice`
> implementations without needing to directly expose the vtable.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/miscdevice.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 939278bc7b03489a647b697012e09223871c90cd..5f59eda57c38be5f0d54fa969=
2fe5b2819e31480 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -177,6 +177,14 @@ fn show_fdinfo(
>      }
>  }
> =20
> +/// Determines whether a given `File` is backed by the `T` `MiscDevice` =
based on vtable matching.
> +pub fn is_miscdevice_file<T: MiscDevice>(file: &File) -> bool {
> +    let vtable =3D core::ptr::from_ref(&MiscdeviceVTable::<T>::VTABLE);

I don't think this always returns the same pointer. So this function
might return false in a case where `T` actually backs `file`...

---
Cheers,
Benno

> +    // SAFETY: `f_op` is not mutated after file creation
> +    let file_vtable =3D unsafe { (*file.as_ptr()).f_op };
> +    vtable =3D=3D file_vtable
> +}
> +
>  /// A vtable for the file operations of a Rust miscdevice.
>  struct MiscdeviceVTable<T: MiscDevice>(PhantomData<T>);
> =20
>
> ---
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> change-id: 20250627-linux-miscident-7b67db234a5c
>
> Best regards,

