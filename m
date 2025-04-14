Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF6C25D900;
	Mon, 14 Apr 2025 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626802; cv=none; b=lmr9s3d3+iiFp6J72Gv4fU9W8YS97f06UGrHloA0g90uMGYFc8kmE4M2QiVQ6+m7b9OK5icr6fAjiRUJDECqVH/RoKcF4bx17x7DdFcvAZrvGQ4NJnccj/0WFN2roa1iq6ADYayvOyWd+YKN6zDWbUCQFYEvpHZYa9q5dET7sus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626802; c=relaxed/simple;
	bh=MvETamnQNFquSrVGNuckzIaSyUm/Z0fG2Yw6wm5zVMc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FwPbAsWXJkQ4lSgKZMJqXzTnZ5snzc9O1IYXxuHSqmhk3swTmfKszspvNaBC3acPA5cj9uqGq4foEOsCNFUhlmQ3lSZsSxBCbDiBngeNY5Chb6EyhKoRgr72qHViN24AsQGmzxQw5QGn+OCebTWI1NQY+CPpH+rHC4ffxrq9YoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ek6qKmTj; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ek6qKmTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744626799; x=1744885999;
	bh=1/FUQUEwg0hppn1C7WXQsrRcHjWtqFn3jfxC8tHOJ8U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ek6qKmTjXoobF+9qjTcuYBZYJsm9RAzE6c9OEKrVDfzbEmaDCx9IabEfPaJBEl1f5
	 p/5+xCLuqNeLU0S4XaHh3DkxcOIA1GRp24goct7J+vZjkZUtAo93mSYxWMry7BF29c
	 Uicui3mrVHh3Y1DLkFt/Y/yh7YjQgs/5aaxUkaBTeXueux4FYej5DJKQZBCTHZqqf9
	 hLRbFN6h/p4D43mlxMk5UCaq8xYIYPH04xu35b9g9FJR7fT23tHq2RBB7DFOtkSunB
	 ez2UYp/SeQTOVZmsxjgpE0cG/nluJZNu+UcgYUIR37rkb50B830LczCQaOk2xhxhi0
	 XKgwMj2fnU0CA==
Date: Mon, 14 Apr 2025 10:33:16 +0000
To: Danilo Krummrich <dakr@kernel.org>, bhelgaas@google.com, kwilczynski@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, abdiel.janulgue@gmail.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, daniel.almeida@collabora.com, robin.murphy@arm.com, linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] rust: pci: preserve device context in AsRef
Message-ID: <D96AKZ50JTGD.3829T3YHKYOI2@proton.me>
In-Reply-To: <20250413173758.12068-6-dakr@kernel.org>
References: <20250413173758.12068-1-dakr@kernel.org> <20250413173758.12068-6-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 43ad78aa5c66966d5540a68db2b86a533a9ea7c3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Apr 13, 2025 at 7:37 PM CEST, Danilo Krummrich wrote:
> Since device::Device has a generic over its context, preserve this
> device context in AsRef.
>
> For instance, when calling pci::Device<Core> the new AsRef implementation
> returns device::Device<Core>.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/pci.rs | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

