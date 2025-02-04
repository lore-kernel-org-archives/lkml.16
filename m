Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6641509BD;
	Tue,  4 Feb 2025 18:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695418; cv=none; b=b9XMcO/XTir7Siu5Mz1vgr1OJzY1msubEGqGPDUIeYD6+EGYXYJWpQusHOMUb1DLq8TzA6i2KPwOk/Flrx1+5V0hW1Yl9fxc1t1bgPDU6xFrNErFuJDI+grY4XXI0agOIIPyj5tTMebtW0Ay6hgjWnE6hLPuYfXt3xdYde6b68c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695418; c=relaxed/simple;
	bh=+xlWDqA1nktIztC11TUlrCC7pQTndNouzw5baByuO/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2OhQCi46nZrs2SWRoXWNU8P7LC57tJ5a2nuY+cMp6vP/TIJ0DeqcOmAekQqIVb/CIyprskmSeIz1oirmSyusJUt/ExxYyRCxv3IMUImB25tR7qbkMLwt2qNn3Jm+EY8J5jCRoTqfbLrRr2Q2/CO6lHugbPl5zphbiHxjtd+4oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SC1coa+x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SC1coa+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C39C4CEDF;
	Tue,  4 Feb 2025 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738695417;
	bh=+xlWDqA1nktIztC11TUlrCC7pQTndNouzw5baByuO/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SC1coa+xa1wViaQHjAzIsR7pvYfAcoh9lEYTOxbZ2oEoiR/uvXrmWQIP2rKTFXVkJ
	 2hXeUFPLlWADm/MXPZLj4OUugt2CaBReKR5Mb/bEFRvF8tzsqrGA4bYOT+j3xyvVOs
	 c8y4+K9W50C4GWUu1rVVbjWcC0W/tS+Zsuh0Hb9eMc1QuUdruj16+URqkkoPrCp5kU
	 DwhhtH26xTW3T6Ui0W0KFncfC13rvzFqBHqY2tcqA/7hA02oT49MbG9g+C303moIVR
	 3FLx3uwZ5k8gqFwJiMbjXHFIC52w0eaCT7+0NTHRYbq5tPCeVLvXORG6roCdzfZo/1
	 J7FtICqOV6eTg==
Date: Tue, 4 Feb 2025 19:56:49 +0100
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
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z6Ji8XrBtrXvdZZY@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <2d521b9d57338927a176118587dca545f5e4f170.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d521b9d57338927a176118587dca545f5e4f170.camel@nvidia.com>

On Tue, Feb 04, 2025 at 06:42:46PM +0000, Timur Tabi wrote:
> On Fri, 2025-01-31 at 23:04 +0100, Danilo Krummrich wrote:
> > +/// Structure encapsulating the firmware blobs required for the GPU to operate.
> > +#[allow(dead_code)]
> > +pub(crate) struct Firmware {
> > +    booter_load: firmware::Firmware,
> > +    booter_unload: firmware::Firmware,
> > +    gsp: firmware::Firmware,
> 
> What about the bootloader?

Gonna add it.
