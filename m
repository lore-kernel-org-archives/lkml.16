Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438E1A316D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330493; cv=none; b=nGxx/tEbiN9mndp8hWnG+x5Eeoylf3q7x/7PT3iLxfz/SMxKUVwFP6LBI2QVB1SDkPvkrIRRfpzaGwz5OIQEYIuvTpGYg4CLgUQcqGbt4RdIMB+/q/frIyIl0M/mcm19yTiHBZ4TShhur/QVU73u4yyu3D3qWEUA4n02KtItrtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330493; c=relaxed/simple;
	bh=v6Yplf9F/SzmgJjaA1g6672jrTn/Q0LxWGAFr+ZyanQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlM4tWMSIIHKUOcAvaa4aahMYPhK/NbGfkoG9H9ALDQ5XdxIBtEuXZe9vifCKZ1c5NkO4WjxH0B6j8jJ+qO+Y47+ydGGOmLRkt5v8Ywh2I936GIdNfFVy+uoKghEHBADFho6++lwqxmBJRZp02hlJZM2sFWkPAIkwXZHnWRb7SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=facQrcDD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="facQrcDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747330490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JzW1ncmGIssHd/HfDZiOZGsvu/9kuBuxxssqGBqcsRw=;
	b=facQrcDDp6j9RJqzVBf4LAdTZ1N1VnlbM+eSuqgoRdd5KoaUNS82cI8vmW4mEwbuWTjTM4
	N88V08zlVFNayVIrEbMHFYGFmh5d4rNV3D6fHChKS455fAPSD3O9CK2EbF9OpoqUCC7i9/
	bD4QmfFKLUcbKZkLLpBeB5xm2Z82kqc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-rmPjlGt8Mdmxn5-iu-aw-g-1; Thu, 15 May 2025 13:34:49 -0400
X-MC-Unique: rmPjlGt8Mdmxn5-iu-aw-g-1
X-Mimecast-MFC-AGG-ID: rmPjlGt8Mdmxn5-iu-aw-g_1747330488
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22de54b0b97so12092525ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747330488; x=1747935288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzW1ncmGIssHd/HfDZiOZGsvu/9kuBuxxssqGBqcsRw=;
        b=tg27d45XBT761sEJyfsuyHWfnWmNv/xJ0F7cADw9l7vgK/u8oKtHbqVUJU1TopHsGA
         AY/A+uo6+sorc9UU74wjYIgpxoYAT82ZAT3yNFxxzu7YIAtVFVYLFoLytHzTszljp25u
         ZdohCcCHEwpN2iL7daMeTiZl/w7WWK9dsy/qtKUCsUWwKrx+kpwopSBZo/QkKqKgp7MY
         dJuNyy9yjkGuaLRISvmyJ1wUcVn547kQvtPloFikGebne96qgsByCRn4Hm78eA5tD5Rm
         92Gqnx80TFmCqeJOzsyJKhOPO7ZMeASpMRa1qcue/WS5xuwfAIs4idLkm57dcDr2PGkK
         0oVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/jl9Hvexjcobuvf7UKyUGZ0o+eGRD0Nyyckf1lniTpy33o5kpkr6GhrkHN6g7QP79Q0W5VqKYVeV/Jbs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx20lqoMnQusNmgpboe3tqSe3HCZWJ+xwmnD4M5oxsUCeIX17PT
	xu3on4zVQWvpEXNzK9Va7vMFEcXq0+OA/ypXcefIcgL2St0zk0zjBFKP9SkioXrr0CoDkMenpqQ
	JboUNirOGycx5vXw65LKhfgv7JfNCeLwEGEubEEOsaYgF0kQYbvaI9njJRgwy+JmWiQ==
X-Gm-Gg: ASbGnctWeKRMa3l71+4QukFvndyPPkRwJvBCIXfMrxyukIrBiKK0XBjYne2/3ESQdxX
	G2o0MBqm/0p0DJpnM4TaWFZZ/An1Ygq0QJoRwTaTEn7X9wb8t4sNycZ5vTRyOff6SVG/RWPRVK0
	n6TvNqH3MEiOnrpykKlDjLeShKfVFBmXLT6foilRkq8WNIHw6SgRsVnWbqz/BLunSBFPLzzJUfY
	+MqLWAlo6vDVc8V5Omi5diZuEl6AUc4KN/rydJ4xFKK+N0qeNbyNmaQWO8Vb8zxyk2NgvbMGopR
	d5JnEDOFVB7jw8JQciYPBC+Jtz5s9kDtJt7RXbPKxX8=
X-Received: by 2002:a17:902:da82:b0:22e:4db1:bab6 with SMTP id d9443c01a7336-231d4393f02mr4180825ad.7.1747330488251;
        Thu, 15 May 2025 10:34:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBe+Ke/qwyU6fFT7oBxlEVHfXyA2MrJZn7X/qjBoNpqR62jEkXEDjFmblbWpUDJxPVZ8WEsQ==
X-Received: by 2002:a17:902:da82:b0:22e:4db1:bab6 with SMTP id d9443c01a7336-231d4393f02mr4180605ad.7.1747330487850;
        Thu, 15 May 2025 10:34:47 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9fbdsm566145ad.50.2025.05.15.10.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 10:34:47 -0700 (PDT)
Date: Thu, 15 May 2025 10:34:45 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: willy@infradead.org, akpm@linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liam Howlett <liam.howlett@oracle.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH] XArray: fix kmemleak false positive in xas_shrink()
Message-ID: <aCYIAD_6c__jwcu8@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250512191707.245153-1-jkangas@redhat.com>
 <053ad5f9-3eee-486e-ac29-3104517b674a@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <053ad5f9-3eee-486e-ac29-3104517b674a@lucifer.local>

Hi Lorenzo,

On Thu, May 15, 2025 at 03:01:56PM +0100, Lorenzo Stoakes wrote:
> +cc Liam, Sid.
> 
> Andrew - please drop this patch until this is fixed.
> 
> Hi Jared,
> 
> This breaks the xarray and vma userland testing. Please ensure that any
> required stub are set up there to allow for your fix to work correctly.
> 
> Once moved to mm-unstable, or at least -next this would get caught by bots
> (hopefully :) so this is a mandatory pre-requisite to this being merged.

Ouch, my bad! I'll make sure this is covered in v2. Thanks for catching
that.

Jared

> 
> Cheers, Lorenzo
> 
> P.S. Liam, Sid - do you think it might be useful to add us 3 as reviewers
> to the xarray entry in MAINTAINERS so we pick up on this sooner?
> 
> $ cd tools/testing/radix-tree
> $ make
> cp ../shared/autoconf.h generated/autoconf.h
> cc -I../shared -I. -I../../include -I../../../lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=address -fsanitize=undefined   -c -o main.o main.c
> cc -c -I../shared -I. -I../../include -I../../../lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=address -fsanitize=undefined ../shared/xarray-shared.c -o xarray-shared.o
> In file included from ../shared/xarray-shared.c:5:
> ../shared/../../../lib/xarray.c: In function ‘xas_shrink’:
> ../shared/../../../lib/xarray.c:480:17: error: implicit declaration of function ‘kmemleak_transient_leak’ [-Wimplicit-function-declaration]
>   480 |                 kmemleak_transient_leak(node);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~
> make: *** [../shared/shared.mk:37: xarray-shared.o] Error 1
> $ cd ../vma
> $ make
> cc -c -I../shared -I. -I../../include -I../../../lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=address -fsanitize=undefined ../shared/xarray-shared.c -o xarray-shared.o
> In file included from ../shared/xarray-shared.c:5:
> ../shared/../../../lib/xarray.c: In function ‘xas_shrink’:
> ../shared/../../../lib/xarray.c:480:17: error: implicit declaration of function ‘kmemleak_transient_leak’ [-Wimplicit-function-declaration]
>   480 |                 kmemleak_transient_leak(node);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~
> make: *** [../shared/shared.mk:37: xarray-shared.o] Error 1
> 
> On Mon, May 12, 2025 at 12:17:07PM -0700, Jared Kangas wrote:
> > Kmemleak periodically produces a false positive report that resembles
> > the following:
> >
> > unreferenced object 0xffff0000c105ed08 (size 576):
> >   comm "swapper/0", pid 1, jiffies 4294937478
> >   hex dump (first 32 bytes):
> >     00 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >     d8 e7 0a 8b 00 80 ff ff 20 ed 05 c1 00 00 ff ff  ........ .......
> >   backtrace (crc 69e99671):
> >     kmemleak_alloc+0xb4/0xc4
> >     kmem_cache_alloc_lru+0x1f0/0x244
> >     xas_alloc+0x2a0/0x3a0
> >     xas_expand.constprop.0+0x144/0x4dc
> >     xas_create+0x2b0/0x484
> >     xas_store+0x60/0xa00
> >     __xa_alloc+0x194/0x280
> >     __xa_alloc_cyclic+0x104/0x2e0
> >     dev_index_reserve+0xd8/0x18c
> >     register_netdevice+0x5e8/0xf90
> >     register_netdev+0x28/0x50
> >     loopback_net_init+0x68/0x114
> >     ops_init+0x90/0x2c0
> >     register_pernet_operations+0x20c/0x554
> >     register_pernet_device+0x3c/0x8c
> >     net_dev_init+0x5cc/0x7d8
> >
> > This transient leak can be traced to xas_shrink(): when the xarray's
> > head is reassigned, kmemleak may have already started scanning the
> > xarray. When this happens, if kmemleak fails to scan the new xa_head
> > before it moves, kmemleak will see it as a leak until the xarray is
> > scanned again.
> >
> > The report can be reproduced by running the xdp_bonding BPF selftest,
> > although it doesn't appear consistently due to the bug's transience.
> > In my testing, the following script has reliably triggered the report in
> > under an hour on a debug kernel with kmemleak enabled, where KSELFTESTS
> > is set to the install path for the kernel selftests:
> >
> >         #!/bin/sh
> >         set -eu
> >
> >         echo 1 >/sys/module/kmemleak/parameters/verbose
> >         echo scan=1 >/sys/kernel/debug/kmemleak
> >
> >         while :; do
> >                 $KSELFTESTS/bpf/test_progs -t xdp_bonding
> >         done
> >
> > To prevent this false positive report, mark the new xa_head in
> > xas_shrink() as a transient leak.
> >
> > Signed-off-by: Jared Kangas <jkangas@redhat.com>
> > ---
> >  lib/xarray.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/lib/xarray.c b/lib/xarray.c
> > index 9644b18af18d1..51314fa157b31 100644
> > --- a/lib/xarray.c
> > +++ b/lib/xarray.c
> > @@ -8,6 +8,7 @@
> >
> >  #include <linux/bitmap.h>
> >  #include <linux/export.h>
> > +#include <linux/kmemleak.h>
> >  #include <linux/list.h>
> >  #include <linux/slab.h>
> >  #include <linux/xarray.h>
> > @@ -476,6 +477,7 @@ static void xas_shrink(struct xa_state *xas)
> >  			break;
> >  		node = xa_to_node(entry);
> >  		node->parent = NULL;
> > +		kmemleak_transient_leak(node);
> >  	}
> >  }
> >
> > --
> > 2.49.0
> >
> >
> >
> 

