Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA0B1FF7A1;
	Mon,  3 Feb 2025 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575810; cv=none; b=TKy9jQwnHmqcIYKDjmZfp9Ux3tJRYfRI+/nGCt5r4/5dNNh6u5D7ljudrSIV4m9gzUNa5aOuTi7PbogndV3VpHhxO+ZZgwBQsShGzy30KJNxjqaGkmG9MVZhLJ6m4Hr99NPSgLSupvCnYVy+nXVYF1bJ6A0u+HemSVBnCIGpSlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575810; c=relaxed/simple;
	bh=Y1uIgiiQZjAkJzXlMdcK4VAwcz40yiS5tgbnlC/v1/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I5OT4VBS127S3TdN4p3juDkq31uTEa6rKe/IMIWHwfU1UaOsWmWGzV8j4D/b1EO27U73bUfytDnoMImxpBzg9u0u7Taf3CzaAgzA8zR+LT0VsjjIptwM8UBA9ES1KVZxjXghbf2u6HiaHuAXYVvTZWqbm1lE8YC2pIVLr/cIyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=ZvFnqdJB; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="ZvFnqdJB"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738575805; bh=Y1uIgiiQZjAkJzXlMdcK4VAwcz40yiS5tgbnlC/v1/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZvFnqdJB/wm8Z0xPyJOwN9acxrHhAGHD5tARiay27HQb10MFxGjroqspp1Xn1Uk6Q
	 5ABj0TTebN2DIczeZI9T3c1TBOwfrsUOQl3vZAUY+AgbhjqefXWZPQaskKu/w0We+V
	 qRaN826tkMjZgl+Qbm7ElDXHAHHenlIhGDzMXhEc=
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Jann Horn <jannh@google.com>,  Matthew Wilcox <willy@infradead.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  Danilo Krummrich <dakr@kernel.org>,
  Wedson Almeida Filho <wedsonaf@gmail.com>,  Valentin Obst
 <kernel@valentinobst.de>,  Andrew Morton <akpm@linux-foundation.org>,
  linux-mm@kvack.org,  airlied@redhat.com,  Abdiel Janulgue
 <abdiel.janulgue@gmail.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  asahi@lists.linux.dev
Subject: Re: [PATCH 3/6] rust: page: Make with_page_mapped() and
 with_pointer_into_page() public
In-Reply-To: <20250202-rust-page-v1-3-e3170d7fe55e@asahilina.net> (Asahi
	Lina's message of "Sun, 02 Feb 2025 22:05:45 +0900")
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
	<20250202-rust-page-v1-3-e3170d7fe55e@asahilina.net>
Date: Mon, 03 Feb 2025 10:43:25 +0100
Message-ID: <87pljz4b42.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Asahi Lina <lina@asahilina.net> writes:

> Lets users do (unsafe) complex page read/write operations without having
> to repeatedly call into read_raw()/write_raw() (which may be expensive
> in some cases).
>
> The functions themselves are not unsafe, but they do take a closure that
> receives a raw pointer, so actually making the access requires unsafe
> code.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

