Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91E212B18;
	Wed, 14 May 2025 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207267; cv=none; b=J3+t8xwb9cVu9qbjAG68SoADs+1MHsJLcVgJytA1uaCDZOpgGQUa2oyCh7y3mlydcDpi5lHiWeBGzMkMWl/uh1z86I+FIXLYVhSVMz8+ZiXuIIzl8RFTqx+qrntdbueiX5jutfURnicpGo4T3COY6kuj7/2fWm8G8S2ZPoYUZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207267; c=relaxed/simple;
	bh=Ws6ZSCxwg/wx/wNYOlISgwQNyA8aAFPpi5VIr4QaBps=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=k2+Dlfjc3ipXIT/3kRMvfDWdG9E6v1f7Gxvo9oBqge6DZllwWZSl9Q91Vw5LHqAIeixXRGeYcKpjdXi2BtIJ2lOWUtSbbGrcz8IGEL0CBfziO62BETzmJOlroxZxrk13OJCfJQQYWlOSWfa8PzQ7J4u1V6+y5kp7OcqeAIbP2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWv8THlX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWv8THlX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AAAC4CEEB;
	Wed, 14 May 2025 07:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747207266;
	bh=Ws6ZSCxwg/wx/wNYOlISgwQNyA8aAFPpi5VIr4QaBps=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=lWv8THlXY5f21F2Tnj1n+tnnNyMXZupJa/7dBSpk5BU8IVDJbLCzc2fv/WIDj5NWh
	 V51DIlbKnjS0vhlGAd/d6myt4wgUYiyu7Ub4vvwApVdvZnR3iMzQc6K9WxEcQHNNEg
	 RdLjFDGZIl2Z96WpDiPhKyZJZvcsxXLzWoP9VAt6WnufUpaRd/w4SYQUV5iLmPk/+N
	 P50XXHAk7Gy9rUYXGFyctnfCeLCbXJt7ticI686PgturpvmF5mUGJu5p7cy1hr8Fkl
	 8u1M1M55dkXExXHtHpEA9cmdzhVdNeZIFGLj0+FsJDSQqMNshj5h/OW3Z4mqimpZWZ
	 2anRtyg7zJeyw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 09:20:49 +0200
Message-Id: <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>, "Timur Tabi" <ttabi@nvidia.com>
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
In-Reply-To: <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>

On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> +impl kernel::Module for RustDebugFs {
> +    fn init(_this: &'static ThisModule) -> Result<Self> {
> +        // Create a debugfs directory in the root of the filesystem call=
ed "sample_debugfs".
> +        let debugfs =3D Dir::new(c_str!("sample_debugfs"));
> +
> +        {
> +            // Create a subdirectory, so "sample_debugfs/subdir" now exi=
sts.
> +            // We wrap it in `ManuallyDrop` so that the subdirectory is =
not automatically discarded
> +            // at the end of the scope - it will be cleaned up when `deb=
ugfs` is.
> +            let sub =3D ManuallyDrop::new(debugfs.subdir(c_str!("subdir"=
)));

I dislike the direct usage of `ManuallyDrop`. To me the usage of
`ManuallyDrop` signifies that one has to opt out of `Drop` without the
support of the wrapped type. But in this case, `Dir` is sometimes
intended to not be dropped, so I'd rather have a `.keep()` function I
saw mentioned somewhere.

> +
> +            // Create a single file in the subdirectory called "example"=
 that will read from the
> +            // `EXAMPLE` atomic variable.
> +            // We `forget` the result to avoid deleting the file at the =
end of the scope.
> +            forget(sub.fmt_file(c_str!("example"), &EXAMPLE, &|example, =
f| {
> +                writeln!(f, "Reading atomic: {}", example.load(Ordering:=
:Relaxed))
> +            }));

Similarly here, I'd rather have a `.keep()` function than people start
using `forget` all over the place.

---
Cheers,
Benno

> +            // Now, "sample_debugfs/subdir/example" will print "Reading =
atomic: 8\n" when read.
> +        }
> +
> +        // Change the value in the variable displayed by the file. This =
is intended to demonstrate
> +        // that the module can continue to change the value used by the =
file.
> +        EXAMPLE.store(10, Ordering::Relaxed);
> +        // Now, "sample_debugfs/subdir/example" will print "Reading atom=
ic: 10\n" when read.
> +
> +        // Save the root debugfs directory we created to our module obje=
ct. It will be
> +        // automatically cleaned up when our module is unloaded because =
dropping the module object
> +        // will drop the `Dir` handle. The base directory, the subdirect=
ory, and the file will all
> +        // continue to exist until the module is unloaded.
> +        Ok(Self { _debugfs: debugfs })
> +    }
> +}

