Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BE1258CD0;
	Tue,  1 Jul 2025 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751400459; cv=none; b=jlgGlhHwNeNkfNDHq3lsz7hLXYunC39gT5jLltYFhPyMA76NPcBRXTezdnztu5wE0TLWZyf7g7eP47XWVldmeHOt9oAQtZJeXv8eTnMjSxuw+7PDgijp/16BdNA17RwU+sK1GPoxE/ilF/YlxDKAYaWl1Sa2MjrYTUtPbH6nEJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751400459; c=relaxed/simple;
	bh=BBmkGWXZgactvhtK0oKPu1t4arIpcLzgHCrEGgnZUNg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VS7VWeLfsT0z2DPq96bNA2/vy+BwtdxdeOtU99qOeDT6ggu+S7mr5+g4xoeN2KEgpleSI6pUEUdgO4GMLji2d3XzD4OR4kLkkhMhLLuUKoRDDxq9G1P45IxCeyXre9mu3wTZISAdG7FrLzZhjn7EAn7K3+PjVSd5mz+ywU/Qf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJrJpOkx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJrJpOkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE56C4CEEB;
	Tue,  1 Jul 2025 20:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751400459;
	bh=BBmkGWXZgactvhtK0oKPu1t4arIpcLzgHCrEGgnZUNg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nJrJpOkxiomQ+R4ITqd+3bYMV8Wcx9WOlwnzDInVffEbAQvaFeP9SqFAE0H9xHvyR
	 emIP0masuuxhfbWB4CM2uPWKNfVsdmCYciqG4odjoEOQfw5ldsHzXlAVSZIyJCmaJr
	 V72cfW4wJc5dQRt1vdcpq8zdvhuQPZNj5kGfsk+ycYl4ADSz4zSXak/vhRNn+F3dUH
	 k6PfifRjGY/ium3vfZV5rQTN4yClZqXDK2LE6POsLFyeBYpTecM8S/d/UQsQFtwgPT
	 LlXb6kC2+hNXeYOqtmuQ5MgjCyWImN16jBMtZvYh6vthQrgn4nFTCU+Xweafa626P7
	 LCvaIDgaqd6BA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 22:07:34 +0200
Message-Id: <DB0ZN9DYID46.3IZ7G8I9WNNED@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
 <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
In-Reply-To: <aGP6d2-jJy5rtjMK@pollux>

On Tue Jul 1, 2025 at 5:10 PM CEST, Danilo Krummrich wrote:
> I think we can add an additional API like this:
>
> 	impl Dir {
> 	   pub fn create_file<T>(&self, data: impl PinInit<T>) -> impl PinInit<S=
elf> {
> 	      pin_init!(Self {
> 	         data <- data,
> 	         ...
> 	      })
> 	   }
> 	}
>
> This allows us to do things like:
>
> 	#[pin_data]
> 	struct Firmware {
> 	   #[pin]
> 	   minor: debugfs::File<u32>,
> 	   #[pin]
> 	   major: debugfs::File<u32>,
> 	   #[pin]
> 	   buffer: debugfs::File<[u8]>,
> 	}
>
> 	impl Firmware {
> 	   pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinInit<Self> {
> 	      pin_init!(Self {
> 	         minor <- dir.create_file("minor", 1),
> 	         major <- dir.create_file("major", 2),
> 	         buffer <- dir.create_file("buffer", buffer),
> 	      })
> 	   }
> 	}
>
> 	// This is the only allocation we need.
> 	let fw =3D KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
>
> With this everything is now in a single allocation and since we're using
> pin-init, Dir::create_file() can safely store pointers of the correspondi=
ng data
> in debugfs_create_file(), since this structure is guaranteed to be pinned=
 in
> memory.

Yes! This is a textbook example of how to use pin-init in API design!

> Actually, we can also implement *only this*, since with this my previous =
example
> would just become this:
>
> 	struct GPU {
> 	   fw: debugfs::File<Firmware>,
> 	}
>
> 	let file =3D dir.create_file("firmware", Firmware::new());
> 	let file =3D KBox::pin_init(file, GFP_KERNEL)?;
>
> 	// debugfs::File<Firmware> dereferences to Firmware
> 	file.do_something();
>
> Given that, I think we should change things to use pin-init right away fo=
r the
> debugfs::File API.

Yeah I think it's a good idea to do that too.

---
Cheers,
Benno
