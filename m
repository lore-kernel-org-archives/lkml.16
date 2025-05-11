Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0078F24
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 05:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746942001; cv=none; b=UvKcTKnOBQgKfOx1G3j+C2oTt7FNY4rXrYFJyNaYcz6q6t0d/4C2U7rmun7/QeNp++aHHdsiZGZqBsAjeLCNCzFKZhSbdRXFRb7hKxrdLh3xVVvjpU9Pr/CqOjTxaSkMYJoOU4qTVz4nAwbsNQeCJAp4bpT/cVhseWeHMkeuNIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746942001; c=relaxed/simple;
	bh=/N5CODU6Gsfb6Dk5IjnCx91l7Y0VcrZ6LX2ESsYDagk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBYY904DuQRpP5jmxBcAHhFEyxhq3FXt83994x6ckGGpGPGw0vZlFIgZ/XUphpP5PJ9CzZlPdPfDN3vzSMmaPLxQfryL95dculXdfShNEjpTFN1IWIvs1zT4P4U8cbzhEeLSoZBzE41j/YlHQfJn9muTGGbFsMGY4q9I+TxyBI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsLrTAsR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsLrTAsR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B10DC4CEE4;
	Sun, 11 May 2025 05:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746942001;
	bh=/N5CODU6Gsfb6Dk5IjnCx91l7Y0VcrZ6LX2ESsYDagk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsLrTAsRjADvsjWuPdOwtaEEqm/fLWWywPz7XwD5TA6CBSkF8+dQCGrBvqlFCC1YF
	 iaQK4nMKCwcBsxV6oi1Y0ATTCZJwkLAwF4jTx9vhjXA7PdI9EobmDfUsa0q9CKgork
	 cSpTopxVxIZI6fVrChIgi9QkHNXZKxRohZrYdgWs6/up8vdU9P1FojTmh/5maAAIBq
	 kucWox0X/ixQktxVrrlOm4TUqoASgOLWqvpZ5JYWk0dBZ4lWUGz3A4H9hVH1KMRCJw
	 lZJRSE+7YLDq+/j6cwlGL0K1f/IRbQkxBdeMtfnnmpoEMTm1Fo1KmrV0CX1owR8cHR
	 HJBpm4NIvQFMg==
Date: Sun, 11 May 2025 08:39:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aCA4KP1nNFVzphPR@kernel.org>
References: <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhuZWpZ7ltMuOe0@kernel.org>
 <8180a50d-eebe-4f9b-9ce8-d886654a992d@redhat.com>
 <aBi8Iqp27jXLUWfs@kernel.org>
 <78bc6a1b-164e-4925-a624-a271a4499364@redhat.com>
 <d19ad41c-069d-436d-8fea-a05188adcb0e@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d19ad41c-069d-436d-8fea-a05188adcb0e@linux.ibm.com>

Hi Donet,

On Fri, May 09, 2025 at 09:10:34PM +0530, Donet Tom wrote:
> > > 
> > > Then we can drop the call to register_memory_blocks_under_node() from
> > > register_one_node() and add creation of memory blocks to
> > > node_dev_init(),
> > > i.e.
> > > 
> > > node_dev_init()
> > >    for_each_node(nid)
> > >      __register_one_node(nid)
> > >        for_each_mem_region()
> > >          /* create memory block if node matches */
> > 
> > Yes exactly, that makes sense.
> 
> Hi Andrew and Mike
> 
> Based on the discussion so far, it is clear that the patch will work in all cases,
> including when CONFIG_ARCH_KEEP_MEMBLOCK  is disabled. Just checking —
> would you prefer to take this version, or should I send a v4?

During the discussion we concluded that the right thing to do seems to drop
the call to register_memory_blocks_under_node() from register_one_node()
and make node_dev_init() call __register_one_node() and then create memory
blocks for each memblock region.

Can you please make v4 along those lines?
 
> Thanks
> Donet

-- 
Sincerely yours,
Mike.
