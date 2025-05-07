Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029521FF1D1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604104; cv=none; b=ZZu6zbH5XOaTS1wac0DB9ZoEDXLNH1R0jgv/Kn/UcV/ryCCuPQ/ItUqcA+HVSeZGrso0VKGEjjK8bD62cRTkyfqE0Uel59Ex1CJKWXmXBOHnwHrxtHV2tq4JBWaGEK0yL/5mDmhWgCR9epjzpKSmFl1MnXm834e5EMIE6OPWWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604104; c=relaxed/simple;
	bh=IgEv4Eehk4n+l1e3vnYnwsLz5urxODEy8r5PARr2Ubk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuS6InU2s3KD/iLV6UPKGPPf/IZN3OKkqWV5XEkzeO6JAeLtYBQcARWxBBVM4XstAx27LfpjCgkpmDTgAk5qmBZpB2fs9xwtBmbxEDvThHbegaL6fIDmji+YTvGvfJCTCdlsy2tG0IQzcL/mx6OF5XXG9EisDO69Tx6E034sTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E2F5268BFE; Wed,  7 May 2025 09:48:17 +0200 (CEST)
Date: Wed, 7 May 2025 09:48:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chao Yu <chao@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs
Message-ID: <20250507074817.GA4516@lst.de>
References: <20250505092613.3451524-1-hch@lst.de> <43d55ab4-c490-4f3d-8331-dc47f427d06d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43d55ab4-c490-4f3d-8331-dc47f427d06d@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 07, 2025 at 03:38:20PM +0800, Chao Yu wrote:
> On 5/5/25 17:25, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs.
> > 
> > f2fs_sync_node_pages can still return it in a way that is not handled
> > by any caller and eventually is propagated to userspace.  This does look
> > like a bug and needs attention by someone who actually knows the code.
> 
> Oh, I guess this is a bug, thanks for catching this.
> 
> Anyway, let me fix this based on your patchset.

I'll resend a fixed version later today, maybe wait for that.

