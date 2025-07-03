Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA8A2288EE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512959; cv=none; b=oyMf7By51TbVwxqrHmAiUTORzM3VmMh2qgmn1qts8MCov+Ne0eMBsMyVWdMk6IQIuFhLFtojoAL6RPox39XWSibDyfOEkIWX/CRlDLkFyY4U8e99jqQTCOZpJQxP3MQoAcIwM7oZJxEZxCQrAGwZM5X1XFigvieiOJ9H+hy9NmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512959; c=relaxed/simple;
	bh=jRAp1AVjN+o0z0U9utUV1cQ17XRWoHhVViGsl36T9Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI6GCYOBrg99uEAGgA6CfzZShbUPHR6uDNvo0YM5E45dGa+sqRTxScJzFtYpce5VC7raP8YBayIOTyOvNVCQ16M8ORqUU7/BszI+2Lvt0qPhQCgh8cDchmAqIY3IJo4P7Jhv13eO/80vfM8w/B0z6Aa7eT1JF8My4VPmdhsP5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SxMv53Xx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SxMv53Xx"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso4593605a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751512956; x=1752117756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3/FURbw0Qjice8ym2SrrqkCxrOCjqZwE+s45rYEO0E=;
        b=SxMv53Xx6Degcdj47VTRozTEgcj9lqtxUGfqgW+mN15Ck/uN+S80/jxpVUbrPGDAse
         Tf3uQ0wMhzwJgoc1+99tdez86AOQV4WPinPUdktvYk37Dlv8Wfh0IDvP91+59DOAPC8M
         1yYMHzssFyQve7RxVvVq6GTiEh3Tntv1JfOiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751512956; x=1752117756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3/FURbw0Qjice8ym2SrrqkCxrOCjqZwE+s45rYEO0E=;
        b=nHjOrsS7Lol9RCi68AETJEA4S6VpkfQj0DO9BkmsND1rQM4fAerd7jGuZiEUSsu8Qs
         1dTWitMv8sg78Y8Z3pEbtS5mOil/4jmogtOzXsxeIh2rNwBST/nD1nkz/7/8IwhuRwAZ
         AbIWWQo2C4TGPKPFhhrRXYjnax9YS9iafDR0OtTrTGAVfV29rB1lp0JD7mE0CqF4Uqr2
         oIuwElFI0W22zem8qAR5egZMim4MLlVCboemQC8tDM88OR6t5DIeXu8QJhGKsWEm8sRM
         zpRRKJpJMk3e15aIT1PHlrhDJ4zp3ffOtGQ4IsQ768XDqTmptJ3KA8oBqkvcdvNIX1/K
         912Q==
X-Gm-Message-State: AOJu0YxhzdvGJCKw+qynV0ODnbz/i5I4Nxg6O1Wj3ST69yVWEba9Ab0w
	8/X0xAmXbJmtv7kJeYYqmRhY9QC82STPmX486qIUnLDEWKmqRwc7ldlLlGduQh7R9w==
X-Gm-Gg: ASbGncvs8utptb6915oD3FXgB81RcSB70mOAyUNcL1qZq9ck2ykhIIjmNqzsyaIwY3E
	Vpd+QcC/cEIuv5LknRDQQMSoBFAqk5B3e4JCMGHswiNXqKxY85TJtU2tMDtNYcM1+bpFzDy9KLk
	bYq3sGjMEouCRuHvER4YNtS+zTbmMi2j/yqf8/delXwBC5k01l2iRNvNX58t6N4YjXbyLuSBdat
	L2ooubwxpxeuhG4I96Q//lirpRjxrR4/OizVGMRVFoOWoG4vFiaQ3WDpl+60PgifG4xkZ+pLiBR
	rVi0WkoEP6Kpy1g2TUzk2XyB9rMUFLNdv68ZaXfRFCHTfH/faWRE0VdHxrZWco2aBQuVvvC0Mzg
	O
X-Google-Smtp-Source: AGHT+IEAy0Xvd7q1RC5hmp7SawamH/oI/muiFAFExRx9I64wiUZ1PQhrNgi3qS6Dq4f35q/YwfITMQ==
X-Received: by 2002:a17:90b:3946:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-31a9d545d21mr2763491a91.12.1751512955991;
        Wed, 02 Jul 2025 20:22:35 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e3f:7c33:158f:349b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc5204bsm1117959a91.8.2025.07.02.20.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 20:22:35 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:22:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
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
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <vscedd6m3cq73c5ggjjz6ndordivgeh4dmvzeok222bnderr5c@dujm4ndthtxb>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
 <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
 <11de6ae0-d4ec-43d5-a82e-146d82f17fff@redhat.com>
 <5thkl2h5qan5gm7putqd4o6yn5ht2c5zeei5qbjoni677xr7po@kbfokuekiubj>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5thkl2h5qan5gm7putqd4o6yn5ht2c5zeei5qbjoni677xr7po@kbfokuekiubj>

On (25/07/03 11:28), Sergey Senozhatsky wrote:
> > > > > >    static int zs_page_migrate(struct page *newpage, struct page *page,
> > > > > > @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
> > > > > >    	unsigned long old_obj, new_obj;
> > > > > >    	unsigned int obj_idx;
> > > > > > +	/*
> > > > > > +	 * TODO: nothing prevents a zspage from getting destroyed while
> > > > > > +	 * isolated: we should disallow that and defer it.
> > > > > > +	 */
> > > > > 
> > > > > Can you elaborate?
> > > > 
> > > > We can only free a zspage in free_zspage() while the page is locked.
> > > > 
> > > > After we isolated a zspage page for migration (under page lock!), we drop
> > >                        ^^ a physical page? (IOW zspage chain page?)
> > > 
> > > > the lock again, to retake the lock when trying to migrate it.
> > > > 
> > > > That means, there is a window where a zspage can be freed although the page
> > > > is isolated for migration.
> > > 
> > > I see, thanks.  Looks somewhat fragile.  Is this a new thing?
> > 
> > No, it's been like that forever. And I was surprised that only zsmalloc
> > behaves that way
> 
> Oh, that makes two of us.

I sort of wonder if zs_page_migrate() VM_BUG_ON_PAGE() removal and
zspage check addition need to be landed outside of this series, as
a zsmalloc fixup.
