Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7620F06A;
	Tue,  1 Apr 2025 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525878; cv=none; b=goxvE0c4B8mVJKX6Or0CVVcQ9kcIISGjqzxDIZsctwqfUpSDCX08zXYSrEHMlY+gPjWK160/wyO9FMdjhHOv+j0pEaXLfBS0dotQN0hFmWOTB0c0kfMGqXN0qgJjc/ugIH3RtNye7qvaR5QsNn++ZIAglRr/xT89VlWWhK1rWPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525878; c=relaxed/simple;
	bh=w1vpy1FmIDW4FsC1CKAhJpSqGuc/QYb+ndMek2Vnaog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGcJw4imH9TO05K2b/S1I6UVnssIs/6ayJsJKB9Ww322UIOcgOX8yCqXdy0j8lZZkBXkII4dAdFz5oZmw38yZjj/5WIq1pStJqxbS2FOj5FHM4hJiWFKyZwzS2vPri6JBRU3+HxZ3x/7JwDCu+62ZpuKL/S5IKi+lNQKOxW+wMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4Um7Aht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4Um7Aht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CE3C4CEE4;
	Tue,  1 Apr 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743525878;
	bh=w1vpy1FmIDW4FsC1CKAhJpSqGuc/QYb+ndMek2Vnaog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4Um7AhtrzgDUtqPdtBu12Gqg5u0Nq8Xbpeju9TzI9/r+0Rier9C08HQ3RWbfku3U
	 d+8RDnIxMayLtgiJt0eJ72+b5Wntc/AMBZ5K5CuFyXWE5wxcojjugijUBbIprEH6eD
	 TvxNYtOs3UOKoJ9KL74JMtTH2YUrY6PtJ7dl4fNTqcKcbenNf/jfRkrdLhVhHHe0a/
	 6JK57eRH+d7h07iSl4+lYVjJSJSgJ8sp05tLyzHPszirXWnGG6cOExxxC+jGjLwxy+
	 9sd/SBQxSMpvgF3p0iFOYqU0MReFJkcYlU3X8A49Pua6q8m049XYq+ig5FFVarBof1
	 i5OVc9Ay3f1gA==
Date: Tue, 1 Apr 2025 18:44:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Guangbo Cui <2407018371@qq.com>, Miguel Ojeda <ojeda@kernel.org>,
	a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	benno.lossin@proton.me, bjorn3_gh@protonmail.mco,
	boqun.feng@gmail.com, boris.brezillon@collabora.com,
	gary@garyguo.net, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rafael@kernel.org, robh@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	John Hubbard <jhubbard@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
Message-ID: <Z-wX7_gjNH--Opv-@pollux>
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
 <67AB9311-3EDC-44A8-9C7C-ABF2ED6B632C@collabora.com>
 <20250401155735.GA804471@joelnvbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401155735.GA804471@joelnvbox>

On Tue, Apr 01, 2025 at 11:57:35AM -0400, Joel Fernandes wrote:
> On Thu, Feb 06, 2025 at 12:57:30PM -0300, Daniel Almeida wrote:
> > Btw, Miguel & others,
> > 
> > IMHO, I think we should write a comment about this somewhere in the docs.
> > 
> > When I first came across this issue myself, it took me a while to understand that
> > the build_error was actually triggering.
> > 
> > That’s because the result is:
> > 
> > ```
> > ERROR: modpost: "rust_build_error" [rust_platform_uio_driver.ko] undefined!
> > ```
> > 
> > When a symbol is undefined, someone would be within their rights to assume that
> > something is broken in some KConfig somewhere, like this person did. It specifically
> > doesn’t tell them that the problem is their own code triggering a build_error because
> > they are misusing an API.
> > 
> > I know that we can’t really provide a message through build_error itself, hence my
> > suggestion about the docs.
> > 
> > I can send a patch if you agree, it will prevent this confusion from coming up in the
> > future.
> 
> Interesting, I just ran into this. I am writing function as follows that
> reads bar0 in the nova driver, however not having the "if current_len + i"
> causes the same issue:
> 
> ERROR: modpost: "rust_build_error" [nova_core.ko] undefined!
> 
> which did not help much about what the issue really is. I had to figure it
> out through tedious trial and error. Also what is the reason for this, the
> compiler is doing some checks in with_bar? Looking at with_bar
> implementation, I could not see any. Also enabling
> CONFIG_RUST_BUILD_ASSERT_ALLOW did not show more menaingful messages. Thanks
> for taking a look:
> 
>     pub(crate) fn read_more(&mut self, bytes: u32) -> Result {
>         with_bar!(self.bar0, |bar0| {
>             // Get current length
>             let current_len = self.data.len();
> 
>             // Read ROM data bytes push directly to vector
>             for i in 0..bytes as usize {
> 
> 		// This check fixes:
> 		// ERROR: modpost: "rust_build_error" [nova_core.ko] undefined!
>                 if current_len + i >= 10000000 {
>                     return Err(EINVAL);
>                 }
> 
>                 // Read a byte from the VBIOS ROM and push it to the data vector
>                 let rom_addr = ROM_OFFSET + current_len + i;
>                 let byte = bar0.readb(rom_addr);

The problem here is that the compiler can't figure out the offset (rom_addr) on
compile time, thus it fails to compile.

The non-try variants of I/O accessors are only supposed to work if the compiler
can figure out the offset on compile time, such that it can be checked against
the expected bar size (not the actual bar size). The expected bar size is what
the driver puts in as a const generic when calling
pci::Device::iomap_region_sized(). This is what makes the non-try variants
infallible.

If the offset is not known at compile time, bar0.try_readb() can be used
instead, which performs a runtime check against the actual bar size instead.

Your above check seems to be enough to let the compiler figure out that
ROM_OFFSET + current_len + i can never be out of bounds for bar0.

>                 self.data.push(byte, GFP_KERNEL)?;
>             }
> 
>             Ok(())
>         })?
>     }
> 
> thanks,
> 
>  - Joel
> 
