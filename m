Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77608189F3F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909897; cv=none; b=m1950XmrLeazT6sCWIEI6rcS5dKE4e46BwiFphq9lDuxJnUQheOyXJ52dUUfReEzoOU/EVn893qgnDMOGjlJL6OG5pogivQVxvGkMksFIHvOmiTpby48vyb6pFR1DGR6tCmDThIAEq1Gwty30zZqM9DVs2C+6dbFeTB+RfCjjpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909897; c=relaxed/simple;
	bh=U8t9LYXtxBujX4cBsLgR2bBSTLfPTV8nUtCJwGVkQKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTC7AvL/GJbdcY7b1eNGb2/+JcA/8JUdizY4V2KAL3g2A6AirzUCfCFfbVrB4fAB9SrT1evHpKNvGzHlIeMzHj0a3G35FEyyedn9vrgUXhPUYPvEXpDoQ+3qYmJtYAzU3fAwPio/ritKT0eZ4TvqNv+wRAcC4pJO56VXh3yfW3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQ6NTKDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQ6NTKDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0285FC4CEE4;
	Thu, 22 May 2025 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747909896;
	bh=U8t9LYXtxBujX4cBsLgR2bBSTLfPTV8nUtCJwGVkQKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQ6NTKDdKLSBTKx/Gn+f8Qmv/9r390/KAg3ehYsh4ITfOa1P22ndcmjcXJeErNywa
	 3Zu+0jDIxkp4xF9DMZsMzfEDsV/A/mC7Yd+ydzig9OQVjIaAOz5XvXzEIUnnseT0Ow
	 mGT7CPYCwy091F0J9nBn+4+SamMMYYKguI1wSMzQmlB+9CM1L6NGEi9/10KOzrTJW7
	 Q9uxmcNO130gr2L4HWbintIOkcwI9a+zPXNHuz1kecH5/q+8cMJ1WoEbcqf41WIyBi
	 aBS5l2c0o4p93R5K/yjO389mB2oGis9KfQZw99FpuRgP5JAdjM+uejiMaTBzRdw9gI
	 GyHJvvwfWNzbg==
Date: Thu, 22 May 2025 13:31:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Oscar Salvador <osalvador@suse.de>
Cc: Donet Tom <donettom@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v5 3/4] drivers/base/node: Remove
 register_memory_blocks_under_node() function call from register_one_node
Message-ID: <aC78_1-1CtAl0qlG@kernel.org>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
 <a2cc58f18dc984fc9563b9c10d5708cc92ac579f.1747904868.git.donettom@linux.ibm.com>
 <aC73Dp90lDz1PN5T@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC73Dp90lDz1PN5T@localhost.localdomain>

On Thu, May 22, 2025 at 12:06:06PM +0200, Oscar Salvador wrote:
> On Thu, May 22, 2025 at 04:17:30AM -0500, Donet Tom wrote:
> > diff --git a/include/linux/node.h b/include/linux/node.h
> > index 5c763253c42c..6cf349c26780 100644
> > --- a/include/linux/node.h
> > +++ b/include/linux/node.h
> > @@ -136,18 +136,8 @@ static inline int register_one_node(int nid)
> >  {
> >  	int error = 0;
> >  
> > -	if (node_online(nid)) {
> > -		struct pglist_data *pgdat = NODE_DATA(nid);
> > -		unsigned long start_pfn = pgdat->node_start_pfn;
> > -		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
> > -
> > +	if (node_online(nid))
> >  		error = __register_one_node(nid);
> 
> Heh, remembering this code always brings me joy.
> 
> After this patch, register_one_node() is only called from try_online_node(), right?
> Which, before calling in, explicitly sets the node online, so... we can get rid of
> the node_online() check unless I am missing something.
 
I think you are right and a sensible follow up cleanup can be renaming
__register_one_node() to register_one_node() :)
 
> -- 
> Oscar Salvador
> SUSE Labs
> 

-- 
Sincerely yours,
Mike.
