Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E61BE251;
	Thu, 10 Apr 2025 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265525; cv=none; b=nVhgay/lZN0lFVghDwBMuZKj11UBeDwdQAFMXhFFplQDzb6of3cbqt3+a4xZBIXk/iU/dpxN5HYpf6nrV2YkIp4YAKmjgO7V5i78ZD+NrWmAhnHqRin0BYVPrhiLnIgfbnNjnHr8h0GGLue5KSI05Kc/GqUJfIJ/jstXduWO/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265525; c=relaxed/simple;
	bh=KHSVNzsI5/zU4ACY7+o1sFXmjI5zBaVysJ4fxcV9JeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1RJTGlvuylHwpQf9qzCQoB8DzE2s/FLl5ELkaUF7IXVF3vVSpBNv6cYESC58LdlvBxiQ5dWrqfa7nj7zawloHoESacivRj9m00TjLX9So/w5fbcYBcZoSBdLvTiKS7wUd2vMMyEeFaGOt4TzDdQcNnjVxKKsWk2k4jcysRfMM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fDepa1+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fDepa1+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7895C4CEDD;
	Thu, 10 Apr 2025 06:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744265524;
	bh=KHSVNzsI5/zU4ACY7+o1sFXmjI5zBaVysJ4fxcV9JeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDepa1+hS2ku0AVfFWBp2tZHF3g+6ytQIsl0j3QWmeVIrhyfGTA8fyKoIx0e2CAV9
	 RnkXG63FCfsi+3NR/jXDUiHsl5rUOfc4bM2N5BLboopQ3sXJc3peQMPsZ3GJxDXtaV
	 D3s1esFh/UprIwBc68b32XE9DB7rxJByjSDf7I1o=
Date: Thu, 10 Apr 2025 08:10:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Petr Tesarik <ptesarik@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <2025041035-catchable-stopping-e345@gregkh>
References: <20250320154733.392410-1-ptesarik@suse.com>
 <20250325134000.575794-1-ptesarik@suse.com>
 <20250409174036.7ee76248@meshulam.tesarici.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409174036.7ee76248@meshulam.tesarici.cz>

On Wed, Apr 09, 2025 at 05:40:36PM +0200, Petr Tesařík wrote:
> On Tue, 25 Mar 2025 14:40:00 +0100
> Petr Tesarik <ptesarik@suse.com> wrote:
> 
> > Remove a misleading comment and issue a warning if a zone modifier is
> > specified when allocating a hcd buffer.
> > 
> > There is no valid use case for a GFP zone modifier in hcd_buffer_alloc():
> > - PIO mode can use any kernel-addressable memory
> > - dma_alloc_coherent() ignores memory zone bits
> > 
> > This function is called by usb_alloc_coherent() and indirectly by
> > usb_submit_urb(). Despite the comment, no in-tree users currently pass
> > GFP_DMA.
> > 
> > Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> 
> I know this was posted during the merge window, but that's now over.
> Any comment on this patch?

Please give me a chance to catch up, it's been non-stop conference
travel during the merge window, and through this week :(

thanks,

greg k-h
