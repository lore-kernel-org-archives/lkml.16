Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3548184E;
	Thu,  6 Mar 2025 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219578; cv=none; b=acyon2fkkXFxBid9qtZPO/9yDFbF3EzC9sFgHOgQtOzrxV8v68vqnFiLrqJuGaf+fTsILiuOnFJ8wWfN3RyhkyrFehhtR3iZ3B8G2MKgwUTOZujMR+/p2ixI4t6X+PmRGG84dNHcxWqsyaYjflOSl2AU9fKHc9lV3r1zU1Va9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219578; c=relaxed/simple;
	bh=cghxGvZLbOixCf8vLbjlFjCfUpgnX1TkEmT7KQkpcFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqqLVIYmh9LuiV6tHENA2u++am+GvfhFiDLqma7yXB6x045zM2p/4uDH1y1iTAQVcFvngFXsdKaSP8OSOYdpVxpYrQf7ip0cB/uzRY0AtpDeMBRLBhrC/ylK+NzGe200Wb2rgnnUPXpYZqTvBWiZqvAnWurzaPacn6xFBDC224w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tevQe6hI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tevQe6hI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D498C4CED1;
	Thu,  6 Mar 2025 00:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741219576;
	bh=cghxGvZLbOixCf8vLbjlFjCfUpgnX1TkEmT7KQkpcFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tevQe6hIkXOk3v9Rgn4GUc+kbZz4l7gFmrygyzCN19dumIHWIJ9AkaneTO+gn2J59
	 Bw9roHYUUDI8iuEDT/HZSncnQdvSrpxTQJcehW6YT5PoDie9hc/y6K5ZREO0c3poB8
	 vwCpoujEBq3VIK8zOQwhXj7eMTfIlO8iGeRskEcCmvcEn2ojEwh8L9lKs2e4Xaj6xA
	 c1lKHfimCEESRXv2+YHwIk476swIiT6RY3seZuhGxRHz+UydkKjhyg3sw2Ju5N/NbO
	 mnxGG7yBuc7iKUaQQ/BjDNKwN1C2KcdHA/l+fwyna2M+ZbsCbKvFahCV/qlgsqcPuA
	 ByKvbWWZ5CHEA==
Date: Wed, 5 Mar 2025 16:06:13 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, russ.weight@linux.dev, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, airlied@gmail.com,
	simona@ffwll.ch, corbet@lwn.net, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
	lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
	cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
	acurrid@nvidia.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Initial Nova Core series
Message-ID: <Z8jm9XbK31nEI33V@bombadil.infradead.org>
References: <20250304173555.2496-1-dakr@kernel.org>
 <Z8isev0gwQJPs7S9@cassiopeiae>
 <Z8jd0evXjJtz1CRB@bombadil.infradead.org>
 <Z8jg_OokbtQ_WDS8@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8jg_OokbtQ_WDS8@pollux>

On Thu, Mar 06, 2025 at 12:40:44AM +0100, Danilo Krummrich wrote:
> On Wed, Mar 05, 2025 at 03:27:13PM -0800, Luis Chamberlain wrote:
> > On Wed, Mar 05, 2025 at 08:56:42PM +0100, Danilo Krummrich wrote:
> > > On Tue, Mar 04, 2025 at 06:34:47PM +0100, Danilo Krummrich wrote:
> > > > Danilo Krummrich (5):
> > > >   rust: module: add type `LocalModule`
> > > >   rust: firmware: introduce `firmware::ModInfoBuilder`
> > > >   rust: firmware: add `module_firmware!` macro
> > > 
> > > Greg, Luis, Russ, any objections on me taking the two firmware patches through
> > > the nova tree?
> > 
> > I don't speak Rust so I'd my recommendation would be to add the rust
> > firmware file under the firmware loader entry for maintainers provided
> > we get a volunteer from the rust community do help maintain *both* C and
> > the Rust version of the firmware loader.
> 
> Yeah, you suggested that when I sent the first firmware loader abstraction more
> than half a year ago and since I'm doing exactly that. :-)

Great, it sounds like we have a firmware loader maintainer volunteer!

 Luis
