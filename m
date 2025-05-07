Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A715D1D432D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600290; cv=none; b=A9CuKp3F6HWtoORXtayJoAFTrpgsQG1h3iMieEoI1zQQMyk/UvEbMrpm7gJnqs1a/Ftx2/hVJyeNL/7fvi1KsZ/CkFoHn9U3CuDD7rmBrQlsWRnTLFHONJky7ovbR1iBF1ocMhHcMsbBGV7Iv2Nk6JWfCqSpwuQOAiwZ1PDS21k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600290; c=relaxed/simple;
	bh=UHXgnW/IIlqCSxjGxw37n20//RN/33kKPJ6RqDTbA2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+gqQ6KoGapHpLuATOLVk+Iy2BeJlfNC5H15XlY6cQtEgwrM+GTyDSVfJcHa0lIKLs0iIb8YhT3YxoQbMPJ3YKu4QGdRxbe3SE3FRvAR5J8aeIj9/TSJVvazPEGZScMHfJ/cVweINXx2f79D7vMSnyVv8svtzYDj5L0jRx9I1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 21B5F68B05; Wed,  7 May 2025 08:44:38 +0200 (CEST)
Date: Wed, 7 May 2025 08:44:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chao Yu <chao@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] f2fs: don't return AOP_WRITEPAGE_ACTIVATE from
 f2fs_write_single_data_page
Message-ID: <20250507064437.GA31135@lst.de>
References: <20250505092613.3451524-1-hch@lst.de> <20250505092613.3451524-3-hch@lst.de> <aab08ad6-22db-44f3-9924-97e096cb0619@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab08ad6-22db-44f3-9924-97e096cb0619@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 07, 2025 at 02:28:55PM +0800, Chao Yu wrote:
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index e016b0f96313..ce63b3bfb28f 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -1565,10 +1565,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
> >  						NULL, NULL, wbc, io_type,
> >  						compr_blocks, false);
> >  		if (ret) {
> > -			if (ret == AOP_WRITEPAGE_ACTIVATE) {
> > -				folio_unlock(folio);
> > -				ret = 0;
> 
> Previously, for this case, it will goto out label rather than writing
> left pages?

Indeed.  Is that the right thing to do here?
