Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46415573F;
	Mon,  5 May 2025 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461846; cv=none; b=Lle3+m10p/zP6W86jNGLKYVeDH9CPppuEO6DBQK0DvW+k/Jgz9m3B1h0HqQLGx79a/ku4f9vuIzZyxGQ8NgpKKKpdpW0PKz+QlIQKWbzORgnKXwALeicN3df1+WQXKjQZP+dD43RzKpVuZf0Oe9zzEkljKgiKIcN9arqQcT/370=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461846; c=relaxed/simple;
	bh=G9Bd4NjWEO0w3OaP85wn/OXcFFWC08oaN66yqn2WuiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFpBeqrBNSpZU233sN/PBfvuE2yRUgRQdrg/wiGmV/MjgS3oBAQMB4NPeTTOr4O1P35aGkth4Zpbe+IHc3VXCoiOrRK2v56WvpkwpqVSLx45387EHfvxdsdc7Mb+76KYfYloof/FIYS2WHUlOuMf6BYk/D7zdhiXNRxNIjTCXDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=px6q4z7d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="px6q4z7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E178CC4CEE4;
	Mon,  5 May 2025 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746461845;
	bh=G9Bd4NjWEO0w3OaP85wn/OXcFFWC08oaN66yqn2WuiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=px6q4z7d+eGoX9YUwoJ6ZNAivbtkVs6SVSN3tkwmlGlyhPig1HMH5CRwym+PLWpgN
	 OWb2JaxLTVXzp2L85Unv7xK+M3jcDKm3FMyps0roLB5sHTrePctYzPjQhb7H6PG7qQ
	 mMjDQe0hOFu0hZiE2XNUuCwrAaIl9n5G6lOsZboQ=
Date: Mon, 5 May 2025 18:17:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hans Zhang <18255117159@163.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: Add missing parameter description to
 xhci_get_endpoint_index()
Message-ID: <2025050549-unmasking-financial-4094@gregkh>
References: <20250504160415.183331-1-18255117159@163.com>
 <2025050546-unlivable-monitor-ad66@gregkh>
 <4cfa9138-43c7-4ca8-bb00-3bd15ab0dd98@163.com>
 <dc6ae086-c4dd-466e-ab7d-ba590877c825@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc6ae086-c4dd-466e-ab7d-ba590877c825@163.com>

On Mon, May 05, 2025 at 11:43:05PM +0800, Hans Zhang wrote:
> 
> 
> On 2025/5/5 23:35, Hans Zhang wrote:
> > 
> > 
> > On 2025/5/5 13:00, Greg KH wrote:
> > > On Mon, May 05, 2025 at 12:04:15AM +0800, Hans Zhang wrote:
> > > > Fix kernel-doc warning by documenting the @desc parameter:
> > > > 
> > > > drivers/usb/host/xhci.c:1369: warning: Function parameter or
> > > > struct member
> > > > 'desc' not described in 'xhci_get_endpoint_index'
> > > > 
> > > > Add detailed description of the @desc parameter and clarify the indexing
> > > > logic for control endpoints vs other types. This brings the
> > > > documentation
> > > > in line with kernel-doc requirements while maintaining technical
> > > > accuracy.
> > > > 
> > > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > 
> > > What commit id does this fix?
> > > 
> > 
> > Hi Greg,
> > 
> > export ARCH=arm64
> > make defconfig
> > make Image W=1 -j16
> > 
> > ./aarch64-none-linux-gnu-gcc -v
> > Using built-in specs.
> > COLLECT_GCC=./aarch64-none-linux-gnu-gcc
> > COLLECT_LTO_WRAPPER=/media/zhb/hans/code/cix_linux_gcc/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu/bin/../libexec/gcc/aarch64-none-linux-gnu/12.3.1/lto-wrapper
> > Target: aarch64-none-linux-gnu
> > Configured with:
> > /data/jenkins/workspace/GNU-toolchain/arm-12/src/gcc/configure
> > --target=aarch64-none-linux-gnu --prefix=
> > --with-sysroot=/aarch64-none-linux-gnu/libc --with-build-sysroot=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/install//aarch64-none-linux-gnu/libc
> > --with-bugurl=https://bugs.linaro.org/ --enable-gnu-indirect-function
> > --enable-shared --disable-libssp --disable-libmudflap
> > --enable-checking=release --enable-languages=c,c++,fortran --with-gmp=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-mpfr=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-mpc=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-isl=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools
> > --enable-fix-cortex-a53-843419 --with-pkgversion='Arm GNU Toolchain
> > 12.3.Rel1 (Build arm-12.35)'
> > Thread model: posix
> > Supported LTO compression algorithms: zlib
> > gcc version 12.3.1 20230626 (Arm GNU Toolchain 12.3.Rel1 (Build arm-12.35))
> > 
> > 
> > I'm debugging the problem of pci and modified the iinclude/linux/pci.h
> > file. If the above compilation method is adopted, the following warnings
> > will occur. Use my patch and the warning disappears.
> > 
> > Compilation warning:
> > drivers/usb/host/xhci.c:1370: warning: Function parameter or struct
> > member 'desc' not described in 'xhci_get_endpoint_index'
> > 
> > 
> > The reproduction method can also be modified by modifying the
> > drivers/usb/host/xhci.c file and then compiling, and the above warning
> > will appear.
> > 
> > Please review whether this needs to be fixed. If not, please ignore this
> > patch.
> > 
> > 
> 
> Hi Greg,
> 
> This patch does not fix specific code errors. Instead, it improves the
> parameter documentation of the xhci_get_endpoint_index function (adding a
> description for @desc) to enhance code readability. Therefore, it does not
> fix any issues with historical submissions and is an independent document
> improvement patch.

It fixes when that parameter was added to that function, OR it fixes
when the comment block was added to document that function, right?  So
either way, it does "Fix" something...

thanks,

greg k-h
