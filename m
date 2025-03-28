Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78521129C;
	Fri, 28 Mar 2025 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144827; cv=none; b=RTdF8QKPC2NCONVCUDKbjJyt1yooXEimsbgxMddPS9gWvpG2hxMyc3EYQg4uCS9XCYJnOCvLV0Ji04c/8LtFrgN1Z4EsnIX09yjPxIHctOSJF0kjWgmrM9RFO/FrPuQtsvvU8oaFmSWBrjvpTNHAvXdv1Pv6I28VohES58PXj7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144827; c=relaxed/simple;
	bh=6ma5dKewKmIgnTG3r8ccNC8MzUoP9Q3VcQlksLuogJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx2uvAdc7TmmpJM4zF39jaFqA70MmcGn278+CGtz8KkqodkVqXVglj0B73b9TWQN4TJNu1sak8iY9C/7jiCPoShuidkQiKorYxB0o1DE/kqooHNBPLXfWETv4KjZEXO/lJ9rsiTFsXIFxbgpPKFyd7LA3/hhjYxyl76+08j5Cb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AXhhGO+Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AXhhGO+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE24C4CEE8;
	Fri, 28 Mar 2025 06:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743144826;
	bh=6ma5dKewKmIgnTG3r8ccNC8MzUoP9Q3VcQlksLuogJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXhhGO+QtmFD1wHcK8O2TRf35JcrCYYp5Mkb8OdLeCOu0N32isBsHWP/LZcG0t8va
	 a0WnK75cxBAmc2rFw2KaTOEmKLy5ymf9ymWoee+xa7qwex80eCo1t7Me9l9ZaUzAZm
	 oSnIkpb5XGXtRSiBdj7UnpZ+nsLkwqfO2KIu/taE=
Date: Fri, 28 Mar 2025 07:53:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2023-53027: erofs: fix kvcalloc() misuse with __GFP_NOFAIL
Message-ID: <2025032816-compress-balcony-e6f7@gregkh>
References: <2025032719-CVE-2023-53027-dc56@gregkh>
 <7e5c7a5e-8853-4a9d-983d-b51cb416e078@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e5c7a5e-8853-4a9d-983d-b51cb416e078@linux.alibaba.com>

On Fri, Mar 28, 2025 at 02:43:04PM +0800, Gao Xiang wrote:
> Hi,
> 
> On 2025/3/28 00:44, Greg Kroah-Hartman wrote:
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > erofs: fix kvcalloc() misuse with __GFP_NOFAIL
> > 
> > As reported by syzbot [1], kvcalloc() cannot work with  __GFP_NOFAIL.
> > Let's use kcalloc() instead.
> > 
> > [1] https://lore.kernel.org/r/0000000000007796bd05f1852ec2@google.com
> > 
> > The Linux kernel CVE team has assigned CVE-2023-53027 to this issue.
> 
> I think this CVE is invalid since it was then reverted by
> upstream commit 647dd2c3f0e1 ("erofs: Revert "erofs: fix kvcalloc()
> misuse with __GFP_NOFAIL"")
> 
> since it's not the correct way to fix this.

Ah, that commit was not in the "normal" revert style, which is why we
didn't notice that.

I've now rejected this CVE id, thanks for letting us know!

greg k-h
