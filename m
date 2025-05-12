Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3BD528;
	Mon, 12 May 2025 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052663; cv=none; b=X5v6Pp1CsOlXGo8EyvyEibtEEx2mR6/n/ljCCQQeJas+UEXGKtwbsyphLuM8ut2rEI5s/Myus516ex9KlRp+mRD+Fx81GuEsY7gc/+rnwVXzLjFZ5Fjz5ed5tqrnshmpDwUdE7ecuitY42kUxvUNKvLt3FGJ0CEEoED5IXL5yys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052663; c=relaxed/simple;
	bh=6WsQRLYFUEAQx57ht+6c2SC4u1kd7mi/WIA+noBSSVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPxLz4u6gaNv9Fkd6gyGmdu8qBsFWEgLfnxrN8mia8Aifj2v05KZtU+hbDlvgf841/BGi5EY6j1PeFuuMFi/Vch7lnCy29ArHYH/OfBIIl25aAl75EFR/ApmGb9GfD1persWBgibh0B+ioFJdZ7R3wL6baHNh8sC3+yozXU3CCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+mu91gr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+mu91gr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351C0C4CEE7;
	Mon, 12 May 2025 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747052663;
	bh=6WsQRLYFUEAQx57ht+6c2SC4u1kd7mi/WIA+noBSSVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+mu91grFR4gFOjZsP5HCG6ZakfXuojUZjc0TGTUhDjaBVDHNpK1z7bbJvrZVMK//
	 STgMUyC2a58oUT8PT1n+oOeSWaqVF6r4EaZuQ3g2s2EghIh1xTmdPaFoN72a4pa/9i
	 ETYjKURQuSk9o+eF0F+vdWDwowCLbw1WFg9MWvM57iqN+RG9EGDfnKK79Nx4zupMGv
	 +bXiSo/6GeKq3nb+gcEY2ezMx9kKvI2pS+XhyYvA0nu8P/81uJP2zFpOo0JU0y5Um8
	 mu9jOxYbQT+p2RlfKAt/9WXLJq1QdzrezOd90XcZwIC8FS6i9b947121eJ1JLbzDpg
	 psaq4LzjCfohA==
Date: Mon, 12 May 2025 14:24:16 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/4] rust: drm: gem: Implement AlwaysRefCounted for all
 gem objects automatically
Message-ID: <aCHocJFyqSXU6Aam@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-5-lyude@redhat.com>

On Thu, May 01, 2025 at 02:33:19PM -0400, Lyude Paul wrote:
> Currently we are requiring AlwaysRefCounted in most trait bounds for gem
> objects, and implementing it by hand for our only current type of gem
> object. However, all gem objects use the same functions for reference
> counting - and all gem objects support reference counting.
> 
> We're planning on adding support for shmem gem objects, let's move this
> around a bit by instead making IntoGEMObject require AlwaysRefCounted as a
> trait bound, and then provide a blanket AlwaysRefCounted implementation for
> any object that implements IntoGEMObject so all gem object types can use
> the same AlwaysRefCounted implementation. This also makes things less
> verbose by making the AlwaysRefCounted trait bound implicit for any
> IntoGEMObject bound.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Great idea!

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>
