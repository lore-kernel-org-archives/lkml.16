Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C41A840E;
	Thu,  6 Feb 2025 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868282; cv=none; b=IF2KqztWuW38EKg9/+ToePXWZlgZllWZqxblvWoQea1sbHYdEa717CAkNc+WFTaxsh24/VhFryYuq7azHLFwCo98t7gdRXM9HBwgDc0Q0ShqbVBsl8GFW4/s8C4use+fVW5rIt8wGgHymfsSoKRZ6CL5UfaorZe71v1NjXSuAvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868282; c=relaxed/simple;
	bh=ja28nIDamNcS1Z3iqesgcYPjUZ2QnypOKQ8GAdSoAaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcyMsYnYwPseZr4gwE2JvLwm2wtMq4LThu5uZdHlwBwW+0C2+wqGB3ZWG1+fx6tGsb/3A3M3meNm9IlrUIt8scfXMFZRBdpe+KeHbPMoTOk+ykmkIfk+pFNft4pHBx0Mgr31x4BCEkRi/wqNleOvN3eaIiFYcn9ntIDgnvw9pXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYdWbsqM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYdWbsqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94AAC4CEDD;
	Thu,  6 Feb 2025 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738868282;
	bh=ja28nIDamNcS1Z3iqesgcYPjUZ2QnypOKQ8GAdSoAaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYdWbsqMOvfGWFtj+BlGKxbGTo3v91Lv1zYObJEcXP2XGfY8qVUsxYIXCuWW1mdHF
	 GUNAxNnpcok23e7w7cE7pKQoawj2cjZ28UhZp3X50RsJ0mbLjw6BvMj3okdTUUYE4V
	 qRzJY2GBVHw/2oFzenyvkv4dG+1fHhhtbp1u6/P4rsP2vroQUwgMBggOPcuBtmfE2/
	 WScGfbJjINw8Lffelt0vfaU85rbXoqdEoYZixmoligV1cl+DPfJfZTp0+wKPRrlPS0
	 iqXsf4gn4wMl1U9SWgERvDJaacq0cxZAeZgmo0FDMivOkHiGNHXda9Lj0qUMj05T3r
	 qkuAq5K7QC07A==
Date: Thu, 6 Feb 2025 19:57:57 +0100
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
Message-ID: <Z6UGNbowcvqTN0-T@pollux>
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>
 <Z6T5sOWXxmUsflW7@pollux>
 <CANiq72n7jx5ve9UL3oDD08=PjY55QHoMY8fyfsW9RNEvjH_b4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n7jx5ve9UL3oDD08=PjY55QHoMY8fyfsW9RNEvjH_b4Q@mail.gmail.com>

On Thu, Feb 06, 2025 at 07:20:20PM +0100, Miguel Ojeda wrote:
> On Thu, Feb 6, 2025 at 7:04 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > I previously checked man posix_memalign(3) and it says:
> >
> > ERRORS
> >         EINVAL The alignment argument was not a power of two, or was not a
> >                multiple of sizeof(void *).
> 
> Yeah, but that may not apply to `alligned_alloc` as far as I can see.

What makes you think so?

AFAICS, the man page applies for posix_memalign, aligned_alloc, memalign,
valloc and pvalloc.

In case behavior differs between the functions, this is stated explicitly, e.g.
in the "RETURN VALUE" section.

The "ERRORS" setion does not differentiate, hence it should apply to all the
functions above, including aligned_alloc.

Do I miss anything?
