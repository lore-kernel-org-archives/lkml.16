Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF6F1DE892
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437804; cv=none; b=VeZUBZOaigHuwY3sPz1ENgVNYkVBiVJ4gRZGoZ/UJpyDyp/a9Aid9yot4FyOAwtuhCGH0IKoGGYOT80mASGRnTYKxGJdGPXdz6JAbcuLTGesDm+dh/IWdhfqoCV5eX0AQG8Mdd/W/ZT5pZ0Irqb1vkIUGROan2qMPneGaRdmUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437804; c=relaxed/simple;
	bh=L3p+iZ9J1ufZiUj4QiuhyJYU/i7HVlzof5zvGChQIbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDHONA69e9zCBB40k+UbDpvZ8fnmyHwCbcvTKa4RTEDRcK9KZXSJISuS9t10dE88YYbmWH4IjNB009ghwUTS4kODJUYV3L0xPSPE/hIb+ACiVI/8X9a6XvA06ZO51497ejphUO3HcnJq49PaD6iPmbHvdsLIizWWXolUER5NIKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fC9vTSbu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fC9vTSbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015E9C4CEE3;
	Mon, 31 Mar 2025 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743437803;
	bh=L3p+iZ9J1ufZiUj4QiuhyJYU/i7HVlzof5zvGChQIbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fC9vTSbui93s7PPTGM37Hf7d8QH0k1+wOPoxAhfgSwJ+X1fslEuu2U9UBdJLdbXkU
	 yiNExpemjRAjDn19IAHVjPXYMH8rCD0tQQt9qGQC7/Ah+zyP0Ce2YeM6IGi8z4X24B
	 A9mmL+LqkLbSLRSW/krtBFijMmvAuE2/51cInQjA=
Date: Mon, 31 Mar 2025 18:15:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 RESEND] intel_th: avoid using deprecated
 page->mapping, index fields
Message-ID: <2025033142-rack-viewer-80d4@gregkh>
References: <20250331125608.60300-1-lorenzo.stoakes@oracle.com>
 <Z-q5Gf57y9LEZcUE@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-q5Gf57y9LEZcUE@casper.infradead.org>

On Mon, Mar 31, 2025 at 04:47:37PM +0100, Matthew Wilcox wrote:
> On Mon, Mar 31, 2025 at 01:56:08PM +0100, Lorenzo Stoakes wrote:
> > Greg, as we're late in merge window obviously now, could you roll up into
> > 6.15-rc1? Thanks!
> > 
> > This does not require backporting, as this is a critical change for mm
> > moving forward, as page->index,mapping are deprecated and will be entirely
> > removed extremely soon.
> 
> "extremely soon" as in "There are four places in the kernel which
> currently use page->index, and three of them are gone once Andrew
> sends his pull requests".  So this will be the last user, assuming
> nobody else decides to add a user of page->index in the meantime.

I'll get to it after -rc1 is out, thanks.

greg k-h
