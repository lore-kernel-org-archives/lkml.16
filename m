Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC051A9B32;
	Wed,  9 Apr 2025 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219826; cv=none; b=awYhJ6abhfisiPF+cweMvWc3lFVppTbPUMiwVdhorZNxHXZKlrffKIr2/8tIJyiM5JGHFpmuK+xZ9bvjCAYfjRmhOdh/W6PnBHrlX8eG2PjoR/vEVz+/AsoI7YPl6cfQtcN8Izrc2GgArnQBmpjJsYGgHj63EV5pR65CZY8MII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219826; c=relaxed/simple;
	bh=QtbLIEpxQbl34x26pYfR01C9eSJ1C0HEyNuuXfp4D3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI17Js7FXZTYJBwlDdAVdFRqEFDUO2C+/pfslMKtgfSX8K0gkBH5vD0Z/KS8qC91bv/Q0z3O9qNAfXDKgXVioGI2mRSuvpeQYFiq8L0a1gAPXU31e9LkyS+QlYbko3XeTaRp+F1ywWvW4LwxNUs0Z+5qegC5hTd2u3c0xQGLr4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKfCNkxv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKfCNkxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB47C4CEE2;
	Wed,  9 Apr 2025 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744219825;
	bh=QtbLIEpxQbl34x26pYfR01C9eSJ1C0HEyNuuXfp4D3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKfCNkxvxks330i4tmhVvAYNvT/3zmyJBu8PNd1asnopvitwFiQNTaa7FPQ0e+7Qf
	 Pwrac4lcstH6fvQzID0xWRXscDYU+tfieiOAN2MxBQHx1WTR+jZEg1ArzOgabHEv5T
	 S1bRVZyPqooXP6yzHjbz5awfGo9zWc3sromP+Ku0/X0tTCvwLSEOxRwC+49IMkID24
	 cSnd5tZLhf27kNcXfchgs+cqK56ohz/so9FCQZJgcMpsVrIYEGmzwYJPBpzmYO6g6k
	 PIXJq/Dd7JQC67JhyIxg5uOKGXGZRjeOoYLyKmzdpnjneFmKgnC2qa00Pi0TIFvg4T
	 4s42utE4mNMyg==
Date: Wed, 9 Apr 2025 19:30:19 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Logan Gunthorpe <logang@deltatee.com>,
	Stephen Bates <sbates@raithlin.com>,
	Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1] um: fix incompatible argument type in iounmap()
Message-ID: <Z_auq9XEUxMwKVoN@cassiopeiae>
References: <20250409061129.136788-1-fujita.tomonori@gmail.com>
 <CANiq72mbci8kxEx5jrq=HVc6WKuJqq8NCLzNsjH1wFcJNoHm+w@mail.gmail.com>
 <CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com>

On Wed, Apr 09, 2025 at 07:07:56PM +0200, Geert Uytterhoeven wrote:
> Hi Miguel,
> 
> CC arnd
> 
> On Wed, 9 Apr 2025 at 16:48, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> > On Wed, Apr 9, 2025 at 8:16 AM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> > >
> > > Align iounmap() signature with other architectures.
> >
> > Most indeed have `volatile`, but nios2 and m68k don't -- Cc'ing them
> > just in case.
> 
> Indeed. Apparently the volatile keyword has not always been there...
> Why does iounmap() need the volatile keyword?
> Why does pci_iounmap() not have the volatile keyword?

I think none of the functions within rust/helpers/io.c need volatile, since they
just defer to the corresponding C function / macro.

This probably has been a copy/paste mistake of the function signatures and
should be removed instead.

- Danilo
