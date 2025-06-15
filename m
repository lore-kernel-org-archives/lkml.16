Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3548A2E11CF
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749972347; cv=none; b=dvPl/yQztrnm6U4pgGrEP0wd4HCgfGKgGoL4Bq1M3YDoBZ3H/zWWW5gTNxPlh0IXm+WyTpBPwquNxnmPjZun7reBBzIjp755XTtt2Fldd082DOasux/9oJ2v8q0nxmcywCMH668Z5DIG0tz3uTFVsWBvV9BXhYjUbFB1zhnOUHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749972347; c=relaxed/simple;
	bh=6cIF3HC7Qqqk3h3DoiQY6F1IwQazmnD9Dck+AwtI0Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYuonKMJ5g9y6CDpRSO6RTJLwRnrIW2qNTHOBHNrclmRRJ5PqvSheNOCL+U6IQll36nIOhZVU1xVYXEOO98uM+354spxJn+vn14YVxJmZWicqlCQm1EsalfDstOS003oPxok7evQ17pQI2bsVLR9FgxaYi49KSrHn46ZhFV77wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Izn5Svm4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Izn5Svm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A78C4CEE3;
	Sun, 15 Jun 2025 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749972346;
	bh=6cIF3HC7Qqqk3h3DoiQY6F1IwQazmnD9Dck+AwtI0Uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Izn5Svm4EyUjcCMMj3b6iP2iPb0CELuwckgtijOcXPE0EzlddcecPR7rUGT5Gy36+
	 3iK3QiDUx3sMZ+jpgMq9vwnqU8iAPpcqz5bFsy96dhjTDbhld2G9NEWyIKSTkDR325
	 4JiQOoWevaGOnBEpIScQH0h3XDGh1wpfpbiFbHh+Ed8ktv7XKwz9m/2SudDhBukf4a
	 sPs9yUcfWGv5qQH9kvjWGACmla1pb0Asd5fbsIBeJODSEg4+FnHjmVif5pSCBKQrsx
	 boL27DlkfUVA/KaABcckqxYbzBoeK7Yru9l2jECsA7Uz+jBvJTcFxG02iorZ8Rioiq
	 I6v6brWxsY4xg==
Date: Sun, 15 Jun 2025 10:25:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
	david@redhat.com, catalin.marinas@arm.com, will@kernel.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change
 memory permissions
Message-ID: <aE51cWMkSfNJ5i4c@kernel.org>
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>

On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
> > -/*
> > - * This function assumes that the range is mapped with PAGE_SIZE pages.
> > - */
> > -static int __change_memory_common(unsigned long start, unsigned long size,
> > +static int ___change_memory_common(unsigned long start, unsigned long size,
> >  				pgprot_t set_mask, pgprot_t clear_mask)
> 
> I wouldn't presume to comment on conventions in arm64 arch code, but that's
> a lot of underscores :P
> 
> I wonder if this is the best name for it as you're not only invoking it
> from __change_memory_common()?

Could update_range_pgport() work?
 
> And yes this is a pedantic comment, I realise :)
> 

-- 
Sincerely yours,
Mike.
