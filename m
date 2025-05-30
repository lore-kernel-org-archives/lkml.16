Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F5B19F464
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573734; cv=none; b=GAPr0XkcdHXjQmu6T82Cz8aJL9GgRdVBRJRAB3azlaMXt/kppOjPa4YcEl8a1awKqifyavDhmcMp/1PeTQRAL9PH9uZN/ggLUVAuqpKiy5qJ4/nC3KdAgHPvGn4wCE6JMRSlbDKujCVKVbHprFWBYIMUnwguf+B+8o7o/I0qdME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573734; c=relaxed/simple;
	bh=nMWtibADwYAQwy76MymFrNO6BTjFLqRCNNnZdgBI/8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrVMjTepQyD3MrpDt2z7FPlGyrR6j5m0NQ72NFSNI9k9OMronHQUNAW54hBdG0zcmF7vicFEF8iEROtkrcLyyhT7FJPRuTMMb5zUIedoNS3Qj3ZatZHSKF4rrqToP8v8+2KEKlmZ5uyGDyGVYaVzCjUHG3Oay1p0XapHMHEXN/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D21vC4Nc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D21vC4Nc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PhZXj9coS0pxdKEYFwta5YLsamCEbvhMNZ/W9QUCqWk=;
	b=D21vC4NcmWJlur0SdZXLNihVSmQ1cfcMNwtV2R+d/lFZGH+FnmXqZ+HzrkE9LDPvjNVPYd
	k4CUMC4v9RTzvgaf0bD0S6SXp2VeLNWxHJ0tSRXnNdcD2hOCzizwMJuOg0gxa5+1q7yJYp
	jLBgEuZTO2N26e3HKTQUFheuh7mUeC0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-8hYZnY-uNcaz8wBZv8NV1g-1; Thu,
 29 May 2025 22:55:27 -0400
X-MC-Unique: 8hYZnY-uNcaz8wBZv8NV1g-1
X-Mimecast-MFC-AGG-ID: 8hYZnY-uNcaz8wBZv8NV1g_1748573726
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C43BC180048E;
	Fri, 30 May 2025 02:55:25 +0000 (UTC)
Received: from localhost (unknown [10.72.112.13])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 304B61956066;
	Fri, 30 May 2025 02:55:23 +0000 (UTC)
Date: Fri, 30 May 2025 10:55:19 +0800
From: Baoquan He <bhe@redhat.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>, akpm@linux-foundation.org,
	hannes@cmpxchg.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mm: swap: fix potensial buffer overflow in
 setup_clusters()
Message-ID: <aDkeF/7hkHVfaRHq@MiWiFi-R3L-srv>
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
 <20250522122554.12209-4-shikemeng@huaweicloud.com>
 <CAMgjq7BHzid81f2cBDwQqN6enfJOh8XLjzOS6e+kiu6TMuu0ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7BHzid81f2cBDwQqN6enfJOh8XLjzOS6e+kiu6TMuu0ZA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 05/26/25 at 02:44am, Kairui Song wrote:
> On Thu, May 22, 2025 at 11:32 AM Kemeng Shi <shikemeng@huaweicloud.com> wrote:
> >
> > In setup_swap_map(), we only ensure badpages are in range (0, last_page].
> > As maxpages might be < last_page, setup_clusters() will encounter a
> > buffer overflow when a badpage is >= maxpages.
> > Only call inc_cluster_info_page() for badpage which is < maxpages to
> > fix the issue.
> >
> > Fixes: b843786b0bd01 ("mm: swapfile: fix SSD detection with swapfile on btrfs")
> > Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> > ---
> >  mm/swapfile.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index a82f4ebefca3..63ab9f14b2c6 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -3208,9 +3208,13 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
> >          * and the EOF part of the last cluster.
> >          */
> >         inc_cluster_info_page(si, cluster_info, 0);
> > -       for (i = 0; i < swap_header->info.nr_badpages; i++)
> > -               inc_cluster_info_page(si, cluster_info,
> > -                                     swap_header->info.badpages[i]);
> > +       for (i = 0; i < swap_header->info.nr_badpages; i++) {
> > +               unsigned int page_nr = swap_header->info.badpages[i];
> > +
> > +               if (page_nr >= maxpages)
> > +                       continue;
> > +               inc_cluster_info_page(si, cluster_info, page_nr);
> 
> I think we might need a pr_err or pr_warn here, this means mkswap
> marked the wrong region as a bad block? Or some fs side things went
> wrong.

There's aready warning in read_swap_header():
static unsigned long read_swap_header(struct swap_info_struct *si,
                                        union swap_header *swap_header,
                                        struct inode *inode)
{
	......
	if (last_page > maxpages) {
                pr_warn("Truncating oversized swap area, only using %luk out of %luk\n",
                        K(maxpages), K(last_page));
        }
	...
}

And if we add pr_err|warn here, we also need add it in setup_swap_map()
when filling swap_map.

> 
> 
> > +       }
> >         for (i = maxpages; i < round_up(maxpages, SWAPFILE_CLUSTER); i++)
> >                 inc_cluster_info_page(si, cluster_info, i);
> >
> > --
> > 2.30.0
> >
> >
> 

