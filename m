Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F53258CCC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451500; cv=none; b=hPMOFnE3vd8zxPq8g+dP00ScnyQxB6R+Vop7IMbslwvZdHtS2ZSeDqJqH6jySLtd5oRYuTe5mtp2difBasPk7neb+hIdba69bh28rgMf4Ol78b1d7skkC33ILykjxZeMmOfifvQRv851bxMYmciFtvrv4UUaIWXCKIAbJY8sXzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451500; c=relaxed/simple;
	bh=zlAQRQheJk2TEOPVNZOX1pRLQFKGRuJfcSAymuaD38o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IovCxNPqqkQGGzKIFUr2eQ6miokDRWNTMCxbn3m+sQZjT2dJmJa+jDlTl31conJFAW2+eBG/v4cO7LxhtmDWexKgrie66N2YK9aB1cjR/RVkf5rt7Newxv35/Tr1+EVBgozjrfAUVe0myH/4LDu4Pk9JSqekTPyu4C7c+knF77Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh4QryBg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh4QryBg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB47C4CEE4;
	Mon,  5 May 2025 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746451499;
	bh=zlAQRQheJk2TEOPVNZOX1pRLQFKGRuJfcSAymuaD38o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uh4QryBgTMLKOFr1BKuTWSCYKmofogpzIoMKuQVI0J2dd9G6W3DXHycjuUcygDdF/
	 M0qom0HJSu5hllsvCDs/+3at4xwbvuwCu91SLt/gp5fx003vJoUAwLMOYco8lI0N/g
	 AJBIHdNxWA2lhWvk9w/p+iXqhxcPCkqMR0PjUyf819uKnL8UkR7mbn+D8wLwOyNfAr
	 K8E0s+jlvoS14J9tV6czMW7fxN8rrCZNJPm5W8MJqMcJnTl5TpCs58nhLX2YBRY+H0
	 v8kU1rQ4gWKYB5bP9z/J8rF1EkUxR+ptGGq3Serd2qtq3FRk7n1rCDAzuUQNGP6GBo
	 poRxhx9NIC4lg==
Date: Mon, 5 May 2025 16:24:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, Donet Tom <donettom@linux.ibm.com>,
	Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aBi8Iqp27jXLUWfs@kernel.org>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhuZWpZ7ltMuOe0@kernel.org>
 <8180a50d-eebe-4f9b-9ce8-d886654a992d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8180a50d-eebe-4f9b-9ce8-d886654a992d@redhat.com>

On Mon, May 05, 2025 at 10:18:43AM +0200, David Hildenbrand wrote:
> On 05.05.25 09:53, Mike Rapoport wrote:
> > On Mon, May 05, 2025 at 09:38:43AM +0200, David Hildenbrand wrote:
> > > On 05.05.25 09:28, Oscar Salvador wrote:
> > > > On Mon, May 05, 2025 at 09:16:48AM +0200, David Hildenbrand wrote:
> > > > > memory hotplug code never calls register_one_node(), unless I am missing
> > > > > something.
> > > > > 
> > > > > During add_memory_resource(), we call __try_online_node(nid, false), meaning
> > > > > we skip register_one_node().
> > > > > 
> > > > > The only caller of __try_online_node(nid, true) is try_online_node(), called
> > > > > from CPU hotplug code, and I *guess* that is not required.
> > > > 
> > > > Well, I guess this is because we need to link the cpus to the node.
> > > > register_one_node() has two jobs: 1) register cpus belonging to the node
> > > > and 2) register memory-blocks belonging to the node (if any).
> > > 
> > > Ah, via __register_one_node() ...
> > > 
> > > I would assume that an offline node
> > > 
> > > (1) has no memory
> > > (2) has no CPUs
> > > 
> > > When we *hotplug* either memory or CPUs, and we first online the node, there
> > > is nothing to register. Because if there would be something, the node would
> > > already be online.
> > > 
> > > In particular, try_offline_node() will only offline a node if
> > > 
> > > (A) No present pages: No pages are spanned anymore. This includes
> > >      offline memory blocks.
> > > (B) No present CPUs.
> > > 
> > > But maybe there is some case that I am missing ...
> > 
> > I actually hoped you and Oscar know how that stuff works :)
> 
> Well, I know how the memory side works, but the CPU side is giving me a hard
> time :)
> 
> > 
> > I tried to figure what is going on there and it all looks really convoluted.
> 
> Jap ...
> 
> > 
> > So, on boot we have
> > 	cpu_up() ->
> > 		try_online_node() ->
> >   			bails out because all nodes are online (at least on
> > 			x86 AFAIU, see 1ca75fa7f19d ("arch/x86/mm/numa: Do
> >                          not initialize nodes twice"))
> > 	node_dev_init()i ->
> > 		register_one_node() ->
> > 			this one can use __register_one_node() and loop
> > 			over memblock regions.
> > 
> > And for the hotplug/unplug path, it seems that
> > register_memory_blocks_under_node(MEMINIT_EARLY) is superfluous, because if
> > a node had memory it wouldn't get offlined, and if we are hotplugging an
> > node with memory and cpus, memory hotplug anyway calls
> > register_memory_blocks_under_node_hotplug().
> > 
> > So, IMHO, register_one_node() should not call
> > register_memory_blocks_under_node() at all, but again, I might have missed
> > something :)
> 
> Hm, but someone has to create these links for the memory blocks.

My understanding that the links for the memory blocks during hotplug are created in

add_memory_resource()
  register_memory_blocks_under_node()

So register_one_node() only calls register_memory_blocks_under_node() when
there are no actual memory resources under that node, isn't it?

Then we can drop the call to register_memory_blocks_under_node() from
register_one_node() and add creation of memory blocks to node_dev_init(),
i.e.

node_dev_init()
  for_each_node(nid)
    __register_one_node(nid)
      for_each_mem_region()
        /* create memory block if node matches */

> It's all very messy :(

It is :( 

> -- 
> Cheers,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.
