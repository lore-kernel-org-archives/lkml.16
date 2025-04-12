Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E49131E2D;
	Sat, 12 Apr 2025 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744461324; cv=none; b=iM696v0rRBQeWQIWBP95ZTgyyMybM0Qf1VeVI+AUaG/xAeGh02vf6sg2EOxzlHaZM0IM2JNAwyAu70EJw8tGs3HxaRHXtAKed0NOVJf08Qzi5lGZq4LTCXxdY4DZ70U73Fuu/LozDwUuC1DAObp9wmXunx6xXI1y8I9qn6d8Ezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744461324; c=relaxed/simple;
	bh=Tt3sPHDb7Mz8Pgfddn8V6TjJknog1t8vZ46VSqeHu1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/ByWPN8FFUppjYe8wXzyL9qZDA1hvl0BDRgdQlbA4Tvwdqf53FMl8LfRn0/t+yvrVbSXyb5/akNhTEL48VsGxCcnvvxNUF+/aQuJk+YdBBzMm6vAad/pQCeFdv1G1mkOvccXjcMaRuZhZPdbYQQ1sO0dJgJ20CmeqLUvotLd7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0AEpG85; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0AEpG85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BA9C4CEE3;
	Sat, 12 Apr 2025 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744461324;
	bh=Tt3sPHDb7Mz8Pgfddn8V6TjJknog1t8vZ46VSqeHu1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0AEpG85GVVGo1N4QVb1XFJ12Tohnt5oe43WGIAv2ngC8cq9mtdCp1pniys5O40Ug
	 b2vDjUPy+Lw9n8H7HN++whIfCZus+wPSC6RzpFzPvGf6SqS9q6f8QIqlR7gqt8WCEt
	 aBEx8sOKhrdHz85Q+81vlhItrCm77qLWb4Mi03QWzCUBnW7ZWooX3YNCe0gNEYwpKZ
	 +Uq31a49dJ6KXEl5JTqTXFKZlxdd75QO/CHE07pGhyV3ozzepKtiePf5OlZZBdO/4U
	 nLwn+d2mxbfaFpwdZfNgsrLLjUfA1z9zLj47Xyb0cbb2H6bZvDchDCx3A2n4dLA5XC
	 xyY2jVDJ8tH3g==
Date: Sat, 12 Apr 2025 14:35:18 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction
 `FwFunc`
Message-ID: <Z_peBtLuLhEDHqga@pollux>
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <CANiq72=BoURMmkwqBzZ9Bzf5oXkZbUia-gZKJcNmVt7Qg8bKzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=BoURMmkwqBzZ9Bzf5oXkZbUia-gZKJcNmVt7Qg8bKzg@mail.gmail.com>

On Sat, Apr 12, 2025 at 01:59:48PM +0200, Miguel Ojeda wrote:
> On Sat, Apr 12, 2025 at 12:30 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
> >
> > "propper" type for this, so use a `*const kernel::ffi::c_char` pointer
> > instad.
> 
> A couple typos -- I usually suggest using e.g. `scripts/checkpatch.pl
> --codespell`.
> 
> > This should probably be backported to stable, for people/distros
> > using Arm 32 patches on stable.
> 
> Up to the stable team -- I will add Cc: stable when I pick it up since
> it shouldn't hurt, but it does not change anything there for the
> supported arches, so they may or may not want to pick it.

Typically, firmware patches go through driver-core, but if you like I'm fine
with you taking it through the Rust tree.

	Acked-by: Danilo Krummrich <dakr@kernel.org>

I don't think backporting it hurts, but it's also not really necessary. Like
Miguel says, up to the stable team.

Just note that before v6.13, core::ffi is required, since kernel::ffi does not
exist. The firmware abstractions were introduced with v6.11.

- Danilo
