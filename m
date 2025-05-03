Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D8748D;
	Sat,  3 May 2025 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746273010; cv=none; b=KHjumEQTUsWVyvq6hZmsBSpSHI4d6BiuEJ2lXxCZCRAQiYuoyWZevyEERn2P7BxGTt96c4tZtarutXBPqnudFz6BCZU3Q/JZGwkSQ013AhJmjNReMdTqWlwTZ3bwp/cDNgaTHsT8qGF5xkzjSIJqEXSQB/PFn7lcPHs/VcwLIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746273010; c=relaxed/simple;
	bh=6weJAhlOmla9TQUhx1V+MqUM/n7tpay1HDZU1XXcD5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFZHoze+NY0o8NeTe7V01cWu3adnO4ZYuLw8Iva6cTJxoCR41/asLOLlE7DTdGtCo8SZKEzlOFuyocqXPbUW+GSMjEr6K64k/+lOR346hGr8CgHmLHL1Okte+9qfZMc7JDSOi3q/Jue/Fc2r27G4ZNf/TDMM+19Zttclz5b9Wk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcSdKb6g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcSdKb6g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05F7C4CEE3;
	Sat,  3 May 2025 11:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746273010;
	bh=6weJAhlOmla9TQUhx1V+MqUM/n7tpay1HDZU1XXcD5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcSdKb6geqYCKwqE6qls6FIX5bHJxTVPwwHF/Ajx+Rh9ozu7q/Obldyvt/IPe2IA3
	 THd7YOp1kIsXTvX4fXV+aRT5RnCJ2lFISFU+OZ6mb/o4T2PmkYQUxvcFyOTlqyCOeO
	 qif9FTAWYagYroHsIB/xCFGhx+YcGD7yRYHu8oTik4bRtzq0N+wYu1R6CWtD6fszmv
	 krN2nSinZjeK1Fk12eQwD4DX25bEVfwTaWWFGgt2hZHwj6gLkNVPnwgGXv71Ejnc28
	 ogeMzwammWuKk/EoGqLqBxKnXVli8vNdxNLxY2drsQ6LmHKuOr2+lxfLqw9OrWB/IE
	 X5/nVl+9croZw==
Date: Sat, 3 May 2025 13:50:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] rust: alloc: add Vec::push_within_capacity
Message-ID: <aBYC7MRfSLJI1ruC@polis>
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-3-06d20ad9366f@google.com>
 <2025050215-affluent-repair-3bb2@gregkh>
 <CAH5fLggG7Af0ZBjhMLuSOX8FNGepeo8eEO77dcN3JSohog0XtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggG7Af0ZBjhMLuSOX8FNGepeo8eEO77dcN3JSohog0XtA@mail.gmail.com>

On Fri, May 02, 2025 at 04:25:01PM +0200, Alice Ryhl wrote:
> On Fri, May 2, 2025 at 4:07 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, May 02, 2025 at 01:19:31PM +0000, Alice Ryhl wrote:
> > > This introduces a new method called `push_within_capacity` for appending
> > > to a vector without attempting to allocate if the capacity is full. Rust
> > > Binder will use this in various places to safely push to a vector while
> > > holding a spinlock.
> > >
> > > The implementation is moved to a push_within_capacity_unchecked method.
> > > This is preferred over having push() call push_within_capacity()
> > > followed by an unwrap_unchecked() for simpler unsafe.
> > >
> > > Panics in the kernel are best avoided when possible, so an error is
> > > returned if the vector does not have sufficient capacity. An error type
> > > is used rather than just returning Result<(),T> to make it more
> > > convenient for callers (i.e. they can use ? or unwrap).
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// The length must be less than the capacity.
> > > +    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
> >
> > Why does this have to be public?  Does binder need to call this instead
> > of just push_within_capacity()?
> 
> It does not need to be public.

Gonna fix when I apply the series.
