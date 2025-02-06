Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD419F13B;
	Thu,  6 Feb 2025 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871197; cv=none; b=CVML1InBmXNsQ8f7g3lWUPS7dAZNhYLe3V7mPBFrU7rNcUjvZOpxD0WnhtvTNGUJbtkf0VQdyRvA9KGshfWwc4tc5y4KErxJ/9RxietHRy1DVdFbUCnQwyuJJSE0O/WFnvF1IBjKDd5ygand0LG4ihnvXxv/+uNYbhKhxtHXfqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871197; c=relaxed/simple;
	bh=9k98wTGNSh0N/DR8HHza7T0w/45TMfB7d2X4xFEg+IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLae87eM3URuuOKCp5E6qwiHzOjOCIuQCe8eJ7BaVTClV/GHYp02OQAkybEbdTT7I9A2z/ul+eA26JcuRXQGxtFEuM+CptbhPnappb1ghJ/yYAVXzkWwTap5xHTRTm6F8AIBxvtBs5PDf1nBtOSGkZ4+vtYh3RapJWApozZ6oTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB/cN5zZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB/cN5zZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D3DC4CEDD;
	Thu,  6 Feb 2025 19:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738871196;
	bh=9k98wTGNSh0N/DR8HHza7T0w/45TMfB7d2X4xFEg+IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RB/cN5zZ/3vhAZNZL8c0u14zH7hvarhIi2Tjo1y6AACLdrrfjE483jYtGgPDhblPn
	 Rpg5HeRwfBUjM4TCK5MrkjUfTUZwG4TGzu6jDdkz1HaF315I6Wl/aLZAmVwUhi5+Sd
	 86/xDVbGlrk1+CiEphyDT8fdPlmZAhJkIm0MEjbjNKzVpViDj5orjZ/o7juu2I8yPz
	 zVY3SDbD+EAkrWw3MfWA6354awnyqGp7WtdvOBOfsPViXjWzcW5BohcZ9QVN3JvZ8y
	 sJHdhihT7SBm0NvxLN6kLuE11R+qMSMpxLWt+zDy3zCQb04WaHUQByiHc01j/0AYn5
	 lsLK/K19fFG0g==
Date: Thu, 6 Feb 2025 20:46:31 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
Message-ID: <Z6URl_IzpHgxfIdw@cassiopeiae>
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>
 <Z6T5sOWXxmUsflW7@pollux>
 <CANiq72n7jx5ve9UL3oDD08=PjY55QHoMY8fyfsW9RNEvjH_b4Q@mail.gmail.com>
 <Z6UGNbowcvqTN0-T@pollux>
 <CANiq72=BGFp95jyyF6-uQWT8K8dS5qBpBD55duUYpF4hJDbFxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=BGFp95jyyF6-uQWT8K8dS5qBpBD55duUYpF4hJDbFxw@mail.gmail.com>

On Thu, Feb 06, 2025 at 08:37:07PM +0100, Miguel Ojeda wrote:
> On Thu, Feb 6, 2025 at 7:58 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > What makes you think so?
> >
> > AFAICS, the man page applies for posix_memalign, aligned_alloc, memalign,
> > valloc and pvalloc.
> >
> > In case behavior differs between the functions, this is stated explicitly, e.g.
> > in the "RETURN VALUE" section.
> >
> > The "ERRORS" setion does not differentiate, hence it should apply to all the
> > functions above, including aligned_alloc.
> >
> > Do I miss anything?
> 
> The explanation of the requirements (in the Linux man page) mention
> different requirements for each function.

Indeed, it seems a bit ambiguous.

> 
> Moreover, in practice, glibc seemed to allow almost any alignment up
> to 2023, and since then they have this:
> 
>     +/* Similar to memalign, but starting with ISO C17 the standard
>     +   requires an error for alignments that are not supported by the
>     +   implementation.  Valid alignments for the current implementation
>     +   are non-negative powers of two.  */
>     +  if (!powerof2 (alignment) || alignment == 0)
>     +    {
>     +      __set_errno (EINVAL);
>     +      return 0;
>     +    }

Agree, in practice no concern from my side either.

> 
> Including a test that does not fail for a degenerate alignment (1).
> Thus I don't think the "multiple of sizeof" part applies today or in
> the past for that implementation (again, in practice).
> 
> But I don't know how those sections are formally supposed to work or
> what requirements (and/or behavior) the man pages are supposed to be
> documenting -- Cc'ing Alejandro. It seems clarifying the page would
> help.

+1
