Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE72749E6;
	Wed,  2 Jul 2025 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465999; cv=none; b=DsrFR/Sj02HBu4EOxbahqnaP2BKHolSQMO1pG3jNbN+Zp4Cu8nFYQUpdGMb+kIuEl3MlWHUv/nK+5GHmZ+WUW/TA2DPkJMx9qRH2arhw3j85PcqrGYHzym6x54aJkHHh1d8PQ7Badzdy1xUg3kouiwEOZ9Y8aI26YKFHJJQCRjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465999; c=relaxed/simple;
	bh=TPciPNVldYlLCshBF0wNkXQDpxHCap/jBcx6/N7ZGKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8E/dvULG7Kfor9eQt8VOczeKs3vGPumPgWqnREsUrjXZueZ+bQqfnTII8B+vb/XlzuNMzZ6/Z9oe2cUIQSS74pQTH5uxn10eL8FBq8kteo8etAW+mUHx3npzsgFP0hVVE0MbBzKlcx6bqnsN9zbiCLUrQmlk7MeB6Kgh7t0TBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSoutkQH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSoutkQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA4DC4CEED;
	Wed,  2 Jul 2025 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751465998;
	bh=TPciPNVldYlLCshBF0wNkXQDpxHCap/jBcx6/N7ZGKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSoutkQHiqJIZLfUz4vLG5XDmN61dCtG2vxH88aVVxYgbY2s9SRl0IbEMYSiyhzQo
	 s2OXWG+BCzsu9j5vribhCGAEsebId23u2ttvwXSmYEm0/Jj0i4kIwwAB/N0HH4SYP/
	 xE+fk4ZoBdyLkf/9hWtB1rNOcAEUU0lFA8uwxjgGuIwfUS9d8uFsmoVZWOx2ntk+36
	 /deJGiEystKHF5JPG8MxB6KF0mhlAAtwzeioTnYf1u+TWI+FjItJg1TJRAT5aEeVIo
	 e1tWtCoNL2LjC00UCpQb7t6Y+pCTupCvQbGk1qH9whnF/yHOEIeUAyFOPi6RMIJHlu
	 VbGGSePVMB9jQ==
Date: Wed, 2 Jul 2025 09:19:57 -0500
From: Rob Herring <robh@kernel.org>
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: krzk@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] arm64: dts: bst: add support for Black Sesame
 Technologies C1200 CDCU1.0 board
Message-ID: <20250702141957.GA1416711-robh@kernel.org>
References: <a570b833-0619-4d1a-909f-971ba08f4202@kernel.org>
 <20250702123133.3613126-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702123133.3613126-1-yangzh0906@thundersoft.com>

On Wed, Jul 02, 2025 at 08:31:33PM +0800, Albert Yang wrote:
> Hi Krzysztof,
> 
> Thank you for your detailed review and feedback. I have addressed all the issues you mentioned:
> 
> > This is messed. SoB does not go to changelog. Apply your patch and look
> > at result - do you see SoB? No, because changelog is stripped.
> > submitting patches explains how this is supposed to look like.
> 
> Fixed. Moved Signed-off-by lines to the correct position in commit message, 
> outside of the changelog section.
> 
> > Nothing improved. I asked to follow DTS coding style in ordering.
> 
> Fixed. Reordered all nodes according to DTS coding style:
> - Root level nodes: alphabetically ordered (clk_mmc → cpus → psci → soc → timer)
> - SoC nodes: ordered by address (uart0@20008000 → mmc0@22200000 → gic@32800000)
> - Applied consistent ordering throughout the dtsi file
> 
> > l2-cache. Otherwise it is incomplete, so add the second one.
> 
> Fixed. Renamed l2-cache-1 to l2-cache as per standard naming convention.
> 
> > Why do you have multiple memory nodes, not one?
> 
> Fixed. Consolidated multiple memory nodes into a single memory node with 
> multiple reg entries as required by Device Tree specification:
> 
> Before (incorrect):
>   memory@800151000 { reg = <0x8 0x00151000 0x0 0x1000>; };
>   memory@800254000 { reg = <0x8 0x00254000 0x0 0x1000>; };
>   ...
> 
> After (correct):
>   memory@800151000 {
>     reg = <0x8 0x00151000 0x0 0x1000>,
>           <0x8 0x00254000 0x0 0x1000>,

These are very odd. Are these really main memory vs. some on chip SRAM 
or some other specific purpose? 

A 4KB block doesn't really work if the OS uses 16 or 64KB pages, but I 
guess that would be up to the OS to ignore them.

>           <0x8 0x10000000 0x0 0x30000000>,
>           <0x8 0xc0000000 0x1 0x0>,
>           <0xc 0x00000000 0x0 0x40000000>;
>   };
