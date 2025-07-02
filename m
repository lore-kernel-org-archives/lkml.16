Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB123D2B8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451049; cv=none; b=gvJaCf2LnJm4UfApoXjAdZ1taLwBcHPY3nyDDk32lzGNn2OU1okPg9DG/3VfazL5IdZMo4pSUEFDekYD+pS+uGAeXoo5SUWaOaZGF2APholvUj3JKkLecDK8dy+JHd8dtPk0oYdSNrhfG8+PJ8pBOPaGuDLLJaOqtZ8n/uHUxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451049; c=relaxed/simple;
	bh=X/8cCALWl6B46verGcMgk1pVS/SO1QUX5EH6YbyQquQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiPx6vTghmqwnbnuSprQX3zLDGaf61gYM3mpE3pWW41hyFZ4wSFm4SRjw0RISKpP4jinmMsq+RdleVcyGql1SkbkxyoeL0AXxD+donopp/UpbtHO1BSqNHgU69fCm4YbrQEkdJYD6Eufc/CkactwZdPT8A48XFqT/P+yF8DKyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RchncG7I; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RchncG7I"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234b9dfb842so38924265ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751451047; x=1752055847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld1XwWyA21yaiRgsO+RmuHJahSek4BWAE0bK6K3RNA8=;
        b=RchncG7IPeq1A1lS1fUZ8SZUGpOUPDZkFaiIL67nEZdW697fpG3n+FDT4QuI3L+rz/
         xqSHHBBnSOvChhZdxNvzWuVve1mwl5anE5VQ0n9ypya+t3pxtAWsqRY9EUXmduTWhyP8
         uYMgUyThWVvwssYfj/o3If9vw0xlqX3W4Nf9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451047; x=1752055847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld1XwWyA21yaiRgsO+RmuHJahSek4BWAE0bK6K3RNA8=;
        b=KlMVYa6K2OQz2MGcqT/8l6cUb3M9lHkh9kxQpmNB9iKbtw0QA6wYF1pxPPgjIKXqx9
         W74LYaSzHGhC9a1OuvUIws+nLcICzcBh5O7Dj/duJzvMn+RoL2Tv9Cc2MHaWQlwuWGDS
         6WGeUFf4FPeXAtlnBouCw3KMQRwD4pxUinOp9jpqYoaKVCGmB1g8XeXmEsKPGvCijdPT
         xAyflENayvZ9pspNEfSH+MaTwQG7xUZD6yvZErL/Axlka6K5GaKiZ0Ve2Kbkr2ag9Q35
         gfdWIjgKDyJtDeUoyyxdfUms4jdPzx8egWScjUsCdcs6IjZcdkSDbBCbMzIUmasrqIRq
         Mx1g==
X-Forwarded-Encrypted: i=1; AJvYcCUcxLwLFWziqNIC2H71udgoaUFtEku51I/vWkkdLPoE4/buvCoWPhnKQXEjbIrHH3GuKYLh1dVAvaMwLG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5rsVoDgOo1lvocqkj6GcXwkRVX2OXIGGA0rkT9gVuRg/+AiY
	FdNN3vGcykeKQMP2xiCji62HCy9t4EKYIbTeegKdWO5n1FKTtaJ+2and74VR58OE8g==
X-Gm-Gg: ASbGncv9I0ODMem70pXMQg89H5h8I+GQEavLIF1Q8dAXQz32Hpk1pgkC9t9gkxgEU5z
	Ridl+HHalwVrq1G9yLY/JncVt1Dj/+tbrn1UqacQG/LEUehvW3z7kY8FNJQ4RqnOCWhCnfRTmtn
	anXj4leCJufKCehiZAe46HjktgiusBx2sm48R5WpYr3w6cERagqfGedvBVloz4zND/b/HehPFuL
	v4ux8tLsQakGTddMcECJ8FTcG6V8fnyQ3joBW1W/Z087pDUg4ASCUY8oidwrqM/BhNFW8+uVfFm
	VO2Vniiqw7pFIHMioB/TARTYx3+xPqELSmSgm08bBLDnm3C8J0MSfISioqf2mfOSo3m77PHhNL7
	k
X-Google-Smtp-Source: AGHT+IFD0I3P0mnZDdceuRH9XAJvvYKmYNHVDtVURKEkoHBc3BGVYVJeT3uh933j6Dzbu2Zpclzgcw==
X-Received: by 2002:a17:90a:d64e:b0:312:18e:d930 with SMTP id 98e67ed59e1d1-31a90bd4c31mr3078996a91.19.1751451046749;
        Wed, 02 Jul 2025 03:10:46 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8825:8cdb:cb6b:8e71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5383eb6sm19125723a91.10.2025.07.02.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:10:46 -0700 (PDT)
Date: Wed, 2 Jul 2025 19:10:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>

On (25/07/02 10:25), David Hildenbrand wrote:
> On 02.07.25 10:11, Sergey Senozhatsky wrote:
> > On (25/06/30 14:59), David Hildenbrand wrote:
> > [..]
> > >   static int zs_page_migrate(struct page *newpage, struct page *page,
> > > @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
> > >   	unsigned long old_obj, new_obj;
> > >   	unsigned int obj_idx;
> > > +	/*
> > > +	 * TODO: nothing prevents a zspage from getting destroyed while
> > > +	 * isolated: we should disallow that and defer it.
> > > +	 */
> > 
> > Can you elaborate?
> 
> We can only free a zspage in free_zspage() while the page is locked.
> 
> After we isolated a zspage page for migration (under page lock!), we drop
                      ^^ a physical page? (IOW zspage chain page?)

> the lock again, to retake the lock when trying to migrate it.
> 
> That means, there is a window where a zspage can be freed although the page
> is isolated for migration.

I see, thanks.  Looks somewhat fragile.  Is this a new thing?

> While we currently keep that working (as far as I can see), in the future we
> want to remove that support from the core.

Maybe comment can more explicitly distinguish zspage isolation and
physical page (zspage chain) isolation?  zspages can get isolated
for compaction (defragmentation), for instance, which is a different
form of isolation.

> So what probably needs to be done is, checking in free_zspage(), whether the
> page is isolated. If isolated, defer freeing to the putback/migration call.

Perhaps.
