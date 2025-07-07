Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D0C433AC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855958; cv=none; b=HNhxPOtgA9yobVg6FRfMu6BLlMhKYcUOtP6dJ6bMu3Km9YpmGAqJELCzyB212c5xHeRDPN90RlJvnVVhLaj++LO//LQjxtYBeL7aosXoVBAT7e8ab1bDXgHkCqlSmmQbUXc+e/wy11z8XHc11NJfMKIUNnWhGOwmHmy/tILwpnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855958; c=relaxed/simple;
	bh=atyvLyGvCJNyDgAWZ4IJQR5kCqQIHDUYFs82Oe/4Rqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiKXHeoe8OBdXOSj+cn2uqs30BZpGahe8nuTMCEfDlvnaGr/g3mTu8u7jCMo+EiVQ7KSjK0NMJQ4cu63WKE5Z3u4EGn43CLJ+3RfQB6fmAeFtgh+4DD3KFnu0pjHs/tqBK/RguK3LD3n4bq7Q5qX3vaOC3Npxe2MqcgnUb/Wvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gmz+XUvP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gmz+XUvP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73972a54919so2215966b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 19:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751855957; x=1752460757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2eqbUK4FYCJiLH0zvQx8aO0ccOeXGf/PUZ4UYY45Alo=;
        b=Gmz+XUvPBvXzCFBQIPvrzi746qy0JZY9fDtFxKt4GRSnYKfbLX/+fOAy2mhmsSJj0L
         M35O0ufh9eCqPzvrkR5joOnTUFtVx0FWDs9NRnLAvVqySdB82DHBRUGoql9BKmsXEU9r
         nZLfajN/uUy3Dhqtyya1jE8TY2dQDVnNpaliY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751855957; x=1752460757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eqbUK4FYCJiLH0zvQx8aO0ccOeXGf/PUZ4UYY45Alo=;
        b=tJj/euTgyaPAZklWChnAjsmqeuFBKc80kulxjF0Xb0Q5Md7t/hhcLfLBDl+SM0KoA4
         3HvCGCUzLrXyWYvwoJVZMP+sk0nnYMORy/MNcVHnJEFC7ozYi00g3fMsS4EgkWlqDlIa
         11gqcLHFwd/Qrq2dQpQV7lOxTj+SF+fvan840/q8dvfdXWu+G5mJ9+ZXPWoO0n1iDsMn
         zYdGiGjV569MJ5r2eLJclr6YO2qBs1lDVs+5QHOxYWHBxr2YC5Enm6LCCloNR5bJBufD
         M0lHC5a7laY0n0GpYtko2b+sQrezfIB6h3JCzvs4YLfVXAciSaystusbpZZXNDwhI4yb
         GXww==
X-Gm-Message-State: AOJu0YwpzNB9ONxsYTCIYbMfTHTbkUpmfgkC2tBEjnmj3E3LRHMTWaKz
	wiodQDOpXG5golQ7nRwG19hItEG5HvxWhX/NT17pyG2kGJLVGenYIvBbKeUJBsZ3IA==
X-Gm-Gg: ASbGnctdVeelo/5y9rSENQiooxjmt7jaIyXbWqLtqc9Vhf6tE64SjIrRcD5W6xEHZHD
	ecBSPpuUvAEC9Vg8HVd5vKasY/akO5YTofCM94AQdTUeGrr18Z73grW/heG21/ZXcv2NDVwWoBr
	PpUKTWgZ04UAGVPUufHCYlB8fHWE50RGhDGQxvkxYHEuZ9WlPJ5DC9cKwUtTSkWURltpLYdsCzY
	6qVlH9FuZI0BgtPMZXxWaFTkQmtT7OVsiOrZlyO3untkFitl/fAx/QKjKZXEWwT+6T0RsXx3olD
	DGYmk6lYzwtNi0rT4ZhxKb1JVrk48cyemafu+NE3vtq4YUu32BTbdsf4J1cdDH6gsg==
X-Google-Smtp-Source: AGHT+IEurZuttkS95VnXcSGu+b+8TgCle7ih6/mBYzXLZUJ1AXkAhgjCuqtatOUxrSPej26STHUETw==
X-Received: by 2002:a05:6a20:4328:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-226095a5143mr15866459637.10.1751855956675;
        Sun, 06 Jul 2025 19:39:16 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:5470:7382:9666:68b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee74cf48sm7419649a12.77.2025.07.06.19.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 19:39:16 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:39:04 +0900
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
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <5bc5vidilgjb37qypdlinywm64j447wtkirbmqdbmba2bgr3ob@22so3brrpctt>
References: <20250704102524.326966-1-david@redhat.com>
 <20250704102524.326966-13-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704102524.326966-13-david@redhat.com>

On (25/07/04 12:25), David Hildenbrand wrote:
> Instead, let's check in the callbacks if the page was already destroyed,
> which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).
> 
> If we detect that the page was destroyed:
> 
> (1) Fail isolation, just like the migration core would
> 
> (2) Fake migration success just like the migration core would
> 
> In the putback case there is nothing to do, as we don't do anything just
> like the migration core would do.
> 
> In the future, we should look into not letting these pages get destroyed
> while they are isolated -- and instead delaying that to the
> putback/migration call. Add a TODO for that.
> 
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
