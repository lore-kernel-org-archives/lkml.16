Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CBA17CA17;
	Wed,  9 Apr 2025 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.15.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213657; cv=none; b=oQdS6pNe+ErimNXTFj+qkGvcogbXLr0bcMfGmdmQg22jaJ5xePnBLjvmjWb+ADyOrVrwJiDU4Zh4T5KcZBYZIlReUBza5MNjGPziu9E/my5hS3PGRPelfrq8X2rV1nztZUT585eoSDy7yU0lq3roOE1q7mjGg3PazjafodxOrOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213657; c=relaxed/simple;
	bh=uFQGScYkT9rGW7RUOTBDJsMqufbmEHss3iSSPhWaxa8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFpRkgkhlk4+uTqYXb0ZFZ1nh4NpEWn+KZBkCOCEgfPEAJSdWyM/OzvLkT0ESsU1PfEpWawWt6p+0vjvTVH81J0pANwA0p2+Yv4ah/6DjA+udfr2EJ3ZzZ78Un9j74yqSbEIZrcHroUkEa7QjVEb1F6r8rIyex013QaJ8zueZ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=bWJPExSI; arc=none smtp.client-ip=37.205.15.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="bWJPExSI"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id A58CE22544C;
	Wed,  9 Apr 2025 17:40:36 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1744213236; bh=Q3oGetcbcRnS+hTNIu7MsUHEGW7j/Mqa2tl6ukaL52Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bWJPExSIyEEz5P4nfkubwk2SFmZZqzUsRHqlsf2YWUvvOu8tgAZKjExuMxT/OG6gd
	 /Zik8DSGJo89gmqK9dyfxzM7q2CxCqpiUF468VPigOQUQnHPZI6oDtJwzZU2i325ow
	 6ELfRuTALNHkk6TX2coGrPrmFlggSctN9SDUuSGKwMzybzS25mwYO7vtpEY0k0St9a
	 4w1778ZcS3+9sVQJJjKTGr09M8arI8RccjT1UouuVGqUrp+egIQo9wgoJEbLTKrf8y
	 zzv1OG56Lb5ibhHs7aYZSc1XDFKYBqbBRNESVZx+nPQERMs8TlVFF+FaI1Xbihemrn
	 afsVZuN7aSOzA==
Date: Wed, 9 Apr 2025 17:40:36 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Tesarik <ptesarik@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <20250409174036.7ee76248@meshulam.tesarici.cz>
In-Reply-To: <20250325134000.575794-1-ptesarik@suse.com>
References: <20250320154733.392410-1-ptesarik@suse.com>
	<20250325134000.575794-1-ptesarik@suse.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Mar 2025 14:40:00 +0100
Petr Tesarik <ptesarik@suse.com> wrote:

> Remove a misleading comment and issue a warning if a zone modifier is
> specified when allocating a hcd buffer.
> 
> There is no valid use case for a GFP zone modifier in hcd_buffer_alloc():
> - PIO mode can use any kernel-addressable memory
> - dma_alloc_coherent() ignores memory zone bits
> 
> This function is called by usb_alloc_coherent() and indirectly by
> usb_submit_urb(). Despite the comment, no in-tree users currently pass
> GFP_DMA.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>

I know this was posted during the merge window, but that's now over.
Any comment on this patch?

Petr T
