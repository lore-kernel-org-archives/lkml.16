Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCCA1D5ACE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314879; cv=none; b=HOJF7cAd4QQ8tRBtP+8hruniDFuWblr67HT5tn4MP0VEzOqP8M2DHEGqVtYU57Hx/B9LZNQKT1+B/QvcbKrkZrBJ+HIuANF1CCNvOkcLZJp9Ly0V9AuvL42IeJx/Uc9ibcE94ClxB6Xwk+T6FiUun5wTmyyQXSl4FHk4fTiY2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314879; c=relaxed/simple;
	bh=ivGahGY7AoIXIaP2diJNkSV4ddRTveOH5YcBNIzoKFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTdVy40kz/+soaYLqKBBJl2LRWO+FXOHiF5Vo7RimWMPG8rqS5F1nw8UC0h6xYASx8hAfpWiYHjNlH5GP8CR6ONtJ032/ETkNVZFqV72FrxoLBAYQRDaUzcOttr++uaA0d7u3b0/4F8loqp3w+78SepRTldoH9XPv9dY06ynx6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AA4Huje7; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AA4Huje7"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso2200874276.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751314877; x=1751919677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgXc86l3T23qZ79gfE3FKqPxMD3UW7tVI+PzzFMqzaw=;
        b=AA4Huje74T5idlytHKap1GuIlI43QV3m6UMf2GKYEHCSV9IMxKV2pffmHJ9Nl83mOE
         6ahmw8utlGVYLrsN2EqKKczPBTmeXUoR3FvqjEq9YtgaNgGtVMOBPxkxSaFVNTMRw0bo
         7fDwV/c2aCAkhUdcnWTxfZRpOwqP2o2pxKeUn+y47uuP42vRm/Nv86vuYQ+bP6CtpZZD
         x1nTpw1NXEO6VlEp7vzu9PnIXIr/1OEUWAJOdbd1WS/u2AmLZHrNwYDwJ/ipn0gSLlu4
         ZkQz89FyWJa8oe7YMxHXshC44LT9vrJGDf/znHS9266ZZdBc+n1d+N/5FRx2ELOP9ojc
         4RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751314877; x=1751919677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgXc86l3T23qZ79gfE3FKqPxMD3UW7tVI+PzzFMqzaw=;
        b=naL5/gVmDjZqAPU+hajQ9g43uk71J2aXpxP7ecsygKWbzO9axzyjOnlXnM/vybeA6I
         EgaU6PnUJF9SFEX0CQmBG156L+1xXx6y+6Kem8mMnpQFkv3kgVuPbPP56MMZ/viWc495
         lHFf3KTFSPDCQvLtHYQdqSpoWOwydN2B80qiOcrekqD90y01vBn/ydLK5+jUilLbs8ii
         LkgggrT0lCctWxIbo4+iVtilQLrxrYkNcs2tyegQqTcfyhllp3kNfw0/C1nJccjIDEll
         7lQrdwVrKEemKbuzwZg21CbEYjR5sb3OxQgs69FtiwXaFzwKpOglUxk77LzXVMh2L1xo
         AyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2P2prQt3Y7YlC7zFSIwZ0rN1JM4kUERL60BH0SoqViE8zgQcye3uGbRaNWIcGEGUVMEmWDnWoQEjRnL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQqJyAGqJOs9clZFnyPcF9DY+T0zn/9KCvMTsukdzi1WrkuNcn
	tXTKIzasa0kDUd/j54Y52PBTutPdRfLoyaAmXLsjmBSNpM7H1BICWKTgRGiFpg==
X-Gm-Gg: ASbGnctEQmtYhrZRlqIq/0dmHkkXWx1Eu6RN8dZZqIuWtQ90yLQl6yEllX3lkbRg6Gk
	d2ZKAcYic6O+9nfaDq64HiLS+XFtlH3/FWCilmuGt9PRMrfxF29DNtGB/ODQgpqIUrPoYByq+LD
	Hek8E1KsGZt+Q2Al2m1YfrfOpBzlBKw1+EqOSenD2jpJ8+kswX3w/lR3POU4LJgZ7gaxuTKhciV
	icU9XCAV8wTmir8aPhmF6e32CJsMIxnUdsByJTbhNL+sKFFGtwMr0ZU1vgkW28CL3m/x/4WKw7I
	hHOKi+AgcybKL6HxaD2mMTHRYtxxFS7tPqCu2JeNCUoutWGerb3jyb38THG69w==
X-Google-Smtp-Source: AGHT+IEcvfcb6sMTAzxKd4/1cEnZ6U0v/7EgCWtGtwIPSedzt8CFdzKxTUX4M//4qdWXDFc3L2o1cQ==
X-Received: by 2002:a05:690c:931c:10b0:714:586:8486 with SMTP id 00721157ae682-7151714d498mr149647047b3.9.1751314876673;
        Mon, 30 Jun 2025 13:21:16 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:57::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cc52f3sm16757447b3.107.2025.06.30.13.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:21:16 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Gregory Price <gourry@gourry.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip extra call to __alloc_pages_bulk in weighted interleave
Date: Mon, 30 Jun 2025 13:21:14 -0700
Message-ID: <20250630202115.1439224-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <7c1180f4-923c-4138-b756-618cb5d597ac@ijzerbout.nl>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 30 Jun 2025 22:05:48 +0200 Kees Bakker <kees@ijzerbout.nl> wrote:

> >   mm/mempolicy.c | 39 ++++++++++++++++++++-------------------
> >   1 file changed, 20 insertions(+), 19 deletions(-)
> >
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index 78ad74a0e249..0d693f96cf66 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -2569,7 +2569,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
> >   	unsigned long node_pages, delta;
> >   	u8 *weights, weight;
> >   	unsigned int weight_total = 0;
> > -	unsigned long rem_pages = nr_pages;
> > +	unsigned long rem_pages = nr_pages, carryover = 0;
> >   	nodemask_t nodes;
> >   	int nnodes, node;
> >   	int resume_node = MAX_NUMNODES - 1;
> > @@ -2594,18 +2594,12 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
> >   	node = me->il_prev;
> >   	weight = me->il_weight;
> >   	if (weight && node_isset(node, nodes)) {
> > -		node_pages = min(rem_pages, weight);
> > -		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
> > -						  page_array);
> > -		page_array += nr_allocated;
> > -		total_allocated += nr_allocated;
> > -		/* if that's all the pages, no need to interleave */
> >   		if (rem_pages <= weight) {
> > -			me->il_weight -= rem_pages;
> > -			return total_allocated;
> > +			node_pages = rem_pages;
> > +			me->il_weight -= node_pages;
> > +			goto allocate;

Hello Kees,

Thank you for reviewing my code!

> This is a goto into the middle of a for-loop.
> What do you think is going to happen at the end of that loop?
> 
> I think (only tested with a small C program) it will go to the start of
> the loop, do the i++, check i<nnodes, and possibly do the loop again.
> Variable i is uninitialized at that point. In the loop it hits several
> uninitialized variables.

From what I can see from my code, I think the only the goto statement leads
to a second iteration of the for loop is if allocation fails.
But otherwise, it should be ok since we always hit

if (total_allocated == nr_pages)
	break;

within the loop. For the branch that takes the goto, we set
node_pages = rem_pages, then jump to the label and allocate.
So nr_allocated = node_pages, and total_allocated = 0 + nr_allocated
so total_allocated = node_pages

total_allocated == node_pages == rem_pages == nr_pages, so we will break. Phew!

To cover the case where allocation fails, I think we should be breaking
anyways, so I can definitely add a new check for this.

> Even if this is legal C code, it is pretty obscure.

I agree that it not very clean. I did this to reduce the amount of repeated
code there is. Even if this code works, it could definitely be written
better to make it more readable and maintainable. As I noted in my second
response to Gregory, I'm not planning on pursuing this version anymore,
so if I decide to send a second version, I'll keep this in mind.

Thank you again for taking the time to review this, and also testing it on
your end! I hope you have a great day : -)
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)
