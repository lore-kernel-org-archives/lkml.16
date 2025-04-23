Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11272F32
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436290; cv=none; b=YbxiPAB+E0yT55Oi1YaObyvJynYTqbJ3sssKKkHZZivifnDO4hDaFJFIHbiS6+AjqlvSNmxUr/BfZXy2K2XwUi4dQN0dKixiOs3O20E5t00VZE4i0d1MvUWWEr6XaqvLf5cT0Fs1698Y1WpivkEsoNK5ubD7KtP+OVgBshZWang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436290; c=relaxed/simple;
	bh=sO/fddAjQh8ky/IPnJjZ5D1ehEpUxpDQXc2ApM15lXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJYN1stf68SdVEbdolToLC2ld6tC3JQaYDHxqI6JitnhoTGU69RX6DRjp6n7q8hLFY0dRtglN1efvgtzdjCmLGi2MbQ+5zuo5BhWNfvMCIEKM6khqDj8mCQtXjxlNZQWKEAxhiNk1117f0NEddFtt9SbXYyUGsGrEsxoNT/Hpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrCRg5Aw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrCRg5Aw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30763C4CEE2;
	Wed, 23 Apr 2025 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745436290;
	bh=sO/fddAjQh8ky/IPnJjZ5D1ehEpUxpDQXc2ApM15lXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrCRg5Awj+fq2MbwfLC/5JTN+b1v+aLzO7EXQ76AiULwCaTV2fj2v4IkhdPuemLkR
	 RYxiJQENJAx3Z6LE3vWCDl4t3MT9lD4ASt4VcdAlQxxNzZr3DUJL4p6MjzUEzfZLYn
	 XCmuqu+D2sFrDbOwiYEaAG7OBl9OWtQLYEYAtifZdVYjGTwcm4A4gH48k7kSOG5gsD
	 HKbIXkMjYOmVzZ5m4Adb4591Eyit7ZKbZrLomhAAkY2EBg9r9gfs8Q8vej/IR2GgW/
	 UVby5PJfK4NWn3yyQvo2m6lpRUt72DmzZLKFsEukM1k5L4mEJgCr4x4qHuzNg1EyJZ
	 Mx6JFgDmfZ0rg==
Date: Wed, 23 Apr 2025 12:24:46 -0700
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alejandro Colomar <alx@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] eisa: address link failure
Message-ID: <202504231224.1A2A116@keescook>
References: <20250423162755.2174698-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423162755.2174698-1-arnd@kernel.org>

On Wed, Apr 23, 2025 at 06:27:50PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The devlist.h file is generated at build time but is not an object file,
> so linking fails, at least in some configurations:
> 
> ld.lld-21: error: vmlinux.a(drivers/eisa/devlist.h): not an ELF file
> 
> Make this an extra-y instead of obj-y target in Kbuild.
> 
> Fixes: dd09eb0e2cc4 ("EISA: Increase length of device names")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks! I already sent this one:

https://lore.kernel.org/all/20250423023743.work.350-kees@kernel.org/

-Kees

> ---
>  drivers/eisa/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/eisa/Makefile b/drivers/eisa/Makefile
> index f0d6cf7d1f32..562d8797e3b4 100644
> --- a/drivers/eisa/Makefile
> +++ b/drivers/eisa/Makefile
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for the Linux device tree
>  
> -obj-$(CONFIG_EISA)	        += devlist.h eisa-bus.o
> +obj-$(CONFIG_EISA)	        += eisa-bus.o
> +extra-$(CONFIG_EISA)		+= devlist.h
>  obj-${CONFIG_EISA_PCI_EISA}     += pci_eisa.o
>  
>  # virtual_root.o should be the last EISA root device to initialize,
> -- 
> 2.39.5
> 

-- 
Kees Cook
