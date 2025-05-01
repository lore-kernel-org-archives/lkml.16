Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1519A;
	Thu,  1 May 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099641; cv=none; b=EPz/mDdxuCd3G5N8KSjYk07TzSQlR3o/4fm0MXsmqZwq1wWch7PZSe8uDBcwo7YDA1gYEvoe//vRoqOV5e/E6XqloGiH/tKfEifOJe7HIeSMkWoO/8uEMUEObldTAOPhKmC2bdhII8GZAFCXIqqctJrY8oqcSfdKqHEeQ/pFgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099641; c=relaxed/simple;
	bh=aJ+SnGlrOEQl6wQ9VK0ODxd9kUtoPYOh5ETn9dKmSPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=So9GCtP3RlhC89V6zuwbDnDFQM/+3ssJk7V4Q8AEPf938+idKc5nFeP6i1BZ/akv+Dmx/rR+ONZs/f2nGujAR1w3JORRHaX6ywZSBoQQEESBES7zJZViYDETGDRR4qZWFeulFSoRYYS6ygm5ZqOoCi5WHkp1kLHXQ9JE3il6xco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTFmM2xR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTFmM2xR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863D6C4CEE3;
	Thu,  1 May 2025 11:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099639;
	bh=aJ+SnGlrOEQl6wQ9VK0ODxd9kUtoPYOh5ETn9dKmSPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTFmM2xRXFu4Fh39nU3NoOvdHe3TxJY51ck/IT8m454g5yjfoCsQhsw86F0kVasTn
	 +ZCoAsaQByF2H7ty8y2O9YmGZVwqLXgUb0T5/Hd8q/Y6aalThdrCTe5eJCeQOSYLlB
	 wbc3h8So5xlCa4iAjBpYCye3WZ5028ITLCuVDEecwDOyImecWkqxCE5+SoZWsoR/TN
	 M8pAY4CDoO1rXrOf+jVBmWiwgYLQzhJajbwhuOmNMGhGVH5ZMO/FmnoNDp/s/zWX1h
	 Bv46Nux8uuTw1KHRib1UcpuTcbMFUAetQjDIe9zQsTSHIjGOpzLOZaL08BCG2qRSTM
	 EsXMJImrfRoAg==
Date: Thu, 1 May 2025 13:40:36 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] rust: alloc: add Vec::remove
Message-ID: <aBNdtMAYvsZ8moRq@pollux>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-6-dad4436ff82d@google.com>
 <aBJPwKeJy1ixtwg2@pollux>
 <aBNWts7wijlN8FGy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBNWts7wijlN8FGy@google.com>

On Thu, May 01, 2025 at 11:10:46AM +0000, Alice Ryhl wrote:
> On Wed, Apr 30, 2025 at 06:28:48PM +0200, Danilo Krummrich wrote:
> > On Tue, Apr 29, 2025 at 02:44:26PM +0000, Alice Ryhl wrote:
> > > This is needed by Rust Binder in the range allocator, and by upcoming
> > > GPU drivers during firmware initialization.
> > > 
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > > 
> > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > index 357f5a37c7b1d15b709a10c162292841eed0e376..0682108951675cbee05faa130e5a9ce72fc343ba 100644
> > > --- a/rust/kernel/alloc/kvec.rs
> > > +++ b/rust/kernel/alloc/kvec.rs
> > > @@ -386,6 +386,42 @@ pub fn pop(&mut self) -> Option<T> {
> > >          Some(unsafe { removed.read() })
> > >      }
> > >  
> > > +    /// Removes the element at the given index.
> > > +    ///
> > > +    /// # Panics
> > > +    ///
> > > +    /// Panics if the index is out of bounds.
> > 
> > Let's check for the index and return an error instead. I know we also can't
> > prevent OOB index access panics for e.g. slices, but here we can control it.
> 
> Okay, I will return an `Option<T>`.

Hm...to me this looks like it is a real error condition rather than something
optional.

What does it mean if remove() returns None? It really means that the given index
is out of bounds, which is never correct behavior for the caller of the API.

So, I'd argue that None is an unexpected return value for a caller and needs to
be handled in an error path, for which returning a Result is much more
ergonomic and correct, since Result can describe the reason, i.e. EINVAL,
whereas with Option a caller would need to pick an error code itself.
