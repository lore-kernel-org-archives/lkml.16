Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2E19E83C;
	Thu,  6 Feb 2025 18:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865078; cv=none; b=cAzN94THTNPhDo/LPacdsOOnuZnSMg39auHL97jpl+XD92xZpc9Yt8zgodN/618pDkw8VOPDzUi27sdOtEFOzYOUgbrgSoTE6MIOpXksTCAcLjIbIpvwLPVt6xfz7H4O8eky8h9iWibE/PtXDZUtSn6MoeltkabTexOw/eMIm/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865078; c=relaxed/simple;
	bh=pVPY4I5Juqa4+g9crXqy8Z/6MMoJCsDdsjdhwTC9HVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+r+znuobKA3jYS5MgApf95wPHkxn4mSVGuSeCnZfRW9f8rgvrm38W+5EOJz2Q/nEtbP1cYpy1k/uQdkLmWsAfb6ScF8YazpY7tzJJHS6IvIO1rr5l9Iin1qQHmsu8V3b+V10ngezcTDxHPH2B4RcUti6BwKnf5MhN1uQVo5D18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dj0OMk47; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dj0OMk47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF110C4CEDF;
	Thu,  6 Feb 2025 18:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738865077;
	bh=pVPY4I5Juqa4+g9crXqy8Z/6MMoJCsDdsjdhwTC9HVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dj0OMk47hUx1/SiSZze3FUDaO8HtD0FGQDDmCNg1/iX7tLyH2Sfd71I9JTKZxDoFJ
	 nd7EEVPptqoGhGDAXhkNN8AUuSiDNAr7BYc7FwJ6XPKhvm1XjQGGroGQKmlS3T1T4i
	 VZ28E6ULfx2i3auuzWukAjXt/MYJixoWtZlddv3PLtFR1IKBsYENjMVzOvXm57PBZ8
	 GU1ZBCssTrilG9IJ3UXdEZy3bHuCdnvTgYE0hxjlOJ8XGzmdwbuehiIKp9se0UvWkM
	 m7RjICvOoWKpQAksK3Ls8tJ9TWa4qxnRfseOw0C2zzgAf0+KtgqYAFJ3jDBP8l5qm0
	 iJi6FG6moItoA==
Date: Thu, 6 Feb 2025 19:04:32 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
Message-ID: <Z6T5sOWXxmUsflW7@pollux>
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>

On Thu, Feb 06, 2025 at 06:56:38PM +0100, Miguel Ojeda wrote:
> On Sun, Feb 2, 2025 at 12:27 PM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > requirements of `aligned_alloc`. These requirements may not be enforced
> > on all systems, but they are on macOS. Ensure that alignment is at least
> 
> Which requirements? `aligned_alloc` comes from ISO C, and POSIX says
> it is aligned with it; i.e. the change to make it work in macOS seems
> fine, but please see below.
> 
> > +        // According to `man aligned_alloc`:
> > +        //
> > +        // aligned_alloc() returns a NULL pointer and sets errno to EINVAL if size is not an
> > +        // integral multiple of alignment, or if alignment is not a power of 2 at least as large as
> > +        // sizeof(void *).
> 
> These requirements seem to come from the macOS man pages, not the
> actual specification. The C one seems required to fail on invalid
> alignments, but is the set of those the ones that macOS mentions? (It
> seems the history of the requirements of that function is convoluted
> and involves at least a DR, and glibc is very lax, more than
> apparently its docs say)

I previously checked man posix_memalign(3) and it says:

ERRORS
	EINVAL The alignment argument was not a power of two, or was not a
	       multiple of sizeof(void *).
