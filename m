Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0351EA91;
	Fri, 30 May 2025 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748632785; cv=none; b=sC9EPSaC/LCKXNoQZU2lXTACtPyrjGDlkF1WmPMfhN7sLLM8HyxJ6D/nssEO6fEYDYMm1crqbfC5BICdBI46lppiIfafwgSIiNPihIagrzfgZTGqeUvUv07mrEPl4fuWHVkvdg8Nwq9TVaRCWoiIqp4cIeO9vA7eorqwhUIk4Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748632785; c=relaxed/simple;
	bh=U63pN07ZQ4WQ9dRpc9+Jygbz/Zq9XWUsdbSpzj/39WE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=bTKC2rUcuhYXcwr+p+zfdi/af2ZsdYfjO0ifq+VoL1obqCyO47v5iBFCWC5M1ZTRqANqOJ6MIOPopONPmEGY9k0qI+iA8GiATdAKQdxAVE+SlopoMMQwWn6WSuPTUpZ7yn3z7VvzunpOXOouCskJMI5mqK9ya4tOx8NXRC/rJdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pt0LSisb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pt0LSisb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEF0C4CEE9;
	Fri, 30 May 2025 19:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748632784;
	bh=U63pN07ZQ4WQ9dRpc9+Jygbz/Zq9XWUsdbSpzj/39WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pt0LSisbBloaqfL59quYklOYSmIS8dLvpY3JrZQtLnRVhmeutmGS0N1iz8At5wpdy
	 nA05jJORq4qoAi6k4LKt+/uLtKp+2I9JdPewyOHssCkp7dlpQ75z64QvzudomKQOFe
	 D9gS3MLF2lpmtppZEIUF+ljeIcPH8Si2qVHbCOAlvylVIqbh9Yf1mMjPAvXR3gXuKD
	 7erbzAmKt/3TbG1YzsH42sVYf1a4iYLjiI6wtYblYwa48fnhOj/SmXcRJf75HWy1kq
	 FIgkTYhE4V47J+OYNF7dHFZ06EcXYzx8vEsN4E0gkQ0cn1N40n91BTF/WzzMnY6iip
	 qaISUVcNWVl1Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 21:19:39 +0200
Message-Id: <DA9QL5A8747E.17QE50WBD6JOT@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: <saivishnu725@gmail.com>, <rust-for-linux@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <gregkh@linuxfoundation.org>, <daniel.almeida@collabora.com>,
 <me@kloenk.dev>
Subject: Re: [PATCH] rust: doc: Clean up formatting in io.rs
X-Mailer: aerc 0.20.1
References: <20250530123129.31505-2-saivishnu725@gmail.com>
In-Reply-To: <20250530123129.31505-2-saivishnu725@gmail.com>

On Fri May 30, 2025 at 2:31 PM CEST, saivishnu725 wrote:
> From: Sai Vishnu M <saivishnu725@gmail.com>
>
> Replace `@` with backticks in a comment of `io.rs` to follow Rust doc
> convention
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1167
> Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
> ---
>  rust/kernel/io.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 72d80a6f131e..92bc4e3cd8ec 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -43,7 +43,7 @@ pub fn maxsize(&self) -> usize {
>      }
>  }
> =20
> -/// IO-mapped memory, starting at the base address @addr and spanning @m=
axlen bytes.
> +/// IO-mapped memory, starting at the base address `addr` and spanning `=
maxlen` bytes.

I would just remove the second part of the sentence. This is a struct
and its only field is an `IoRaw`, which does have those two fields, but
they are private, so nobody reading the docs will benefit from knowing
this.

---
Cheers,
Benno

>  ///
>  /// The creator (usually a subsystem / bus such as PCI) is responsible f=
or creating the
>  /// mapping, performing an additional region request etc.

