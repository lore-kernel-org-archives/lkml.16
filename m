Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D651216E33;
	Tue,  4 Feb 2025 18:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695396; cv=none; b=mdQxc0qj/4a4aOG2Zyxcz/lRnFRqnmxmWqPcq2idmzAAJcR7ehNALUGS5OmavZ4N9+Q1u68pjNXp4s6o5d3+uzp/crQ8Y+Z3LQ0/DA4jNJ+/VnGeBFJgpphle5X+3c/cxf/lPMGJGtvwgL0X97UbO5MRSC9fWVaMqsLCs5Plz98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695396; c=relaxed/simple;
	bh=C4wZ8hF8BprpsK7/Y5Wrqtdlu2SuEdB+2cx2vBvEFwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rijccQh0ev98BnSpJuEixvqSu3aacCLZswTvsKy7sDjz6qU4e25CEtAHeHmXwsEJWpcj2m0UuL76ax8m1qrddtMj3lYeYSK4q0CIe0KxpRMORpHSlGTmJTuEqmFGxPB2ru0D+hvdN+UmsJv9SWss6ZDin6JxDeOTY+IxPqdJXIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgfucYnu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgfucYnu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2E6C4CEDF;
	Tue,  4 Feb 2025 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738695395;
	bh=C4wZ8hF8BprpsK7/Y5Wrqtdlu2SuEdB+2cx2vBvEFwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgfucYnuFb0fLjONwAtA4Xnxw0cIZgKFItmkoKSCdbL7aVkUj6n3hzOviOvkDwMye
	 8fNywzhQrxGbEe0yZ/y3USnbR/TL+zkYMJ4CowzRNrVrak4n5pnCOo0PX+BzsCWDtB
	 jogkXG/jzVcHBM/kTEW5ziDEv4HH2aVX+V12AQMsZd35CJk+4CXPwppqqzVfU/niW1
	 1wCOuTSuWnN9FO1nRRL1WAW7GlHNyHqJjq2ZnlftgpdsReW3Ea1AhnHr3OC1YfAi54
	 Nmhr7bDi/5aKLCahcwdiyri89VOJm37lPP4vhPV8BqaSZKEgF0ZySaNrYqSPy4U4cH
	 vXgkt1FE8T25Q==
Date: Tue, 4 Feb 2025 19:56:27 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
	"ajanulgu@redhat.com" <ajanulgu@redhat.com>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"lyude@redhat.com" <lyude@redhat.com>, Zhi Wang <zhiw@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	Ben Skeggs <bskeggs@nvidia.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	Neo Jia <cjia@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
	"pstanner@redhat.com" <pstanner@redhat.com>,
	"tmgross@umich.edu" <tmgross@umich.edu>,
	"benno.lossin@proton.me" <benno.lossin@proton.me>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: add initial documentation
Message-ID: <Z6Ji2543iydfJwuh@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250131220432.17717-2-dakr@kernel.org>
 <168287b8cbb95f190a656f7f428e16b8ac93b41b.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168287b8cbb95f190a656f7f428e16b8ac93b41b.camel@nvidia.com>

On Tue, Feb 04, 2025 at 06:40:41PM +0000, Timur Tabi wrote:
> On Fri, 2025-01-31 at 23:04 +0100, Danilo Krummrich wrote:
> > +Rust abstraction for debugfs APIs.
> > +
> > +| Reference: Export GSP log buffers
> > +| Complexity: Beginner
> 
> Seriously?

Well, that seems indeed a bit optimistic. :-)
