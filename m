Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21F134D4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743557224; cv=none; b=Epn0a+15r64NME6ScwieddIeCU1u9QuaTY2RzkEVSfe+67snY766YiXUlCdg59WQ/jaE49Rz2OstVqwjPNNOEU84zn9D7Fph6DV4kMEHLxeZNkzBvUa4yqcago5FKNDYViV2F7GZXjQB1CyK2PZOd1sB9nzLWhX08+/ZkwhuNKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743557224; c=relaxed/simple;
	bh=zNk4H17GKtogAlGv7onHNwlEKEeXX8kX+t/1urbaFfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qObGv7+27EGeEUJC5KjwXD3uZm++Zf1/m8eVudcQTWN6GcXlkYbYMimkH7AAZ7EnjOj3NWC0IC8ItitRbxZukCSpLNTgAw585WoI/x9+w3Wv3yqO3nHs2ieayPEBJMPyU4PKBnoUUe78xP55FUNmekfNNdPVnyX+aZZfkMA/1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TgVPXN85; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TgVPXN85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743557220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vf+g3ribFWe5hf9G9hxLYXw08cup7ZD9eiRIDOgNDSI=;
	b=TgVPXN852TFlPkeGOfUO4gZ11l5pI4KhRk7Z0piSt11IpsgolZKNVAzRZwabidL/5iw/M3
	t/yVjFlfZK26ffo/b+HtJb3RyzNIJHFHeNaYOGDoah8kCk3frbo7kwsFrwT1wRuAf1DBIC
	0/wiiehU/6IOBWRnBwOK3EtyybqyCU4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-RgvpDyb-PNq37mNobQHHZA-1; Tue,
 01 Apr 2025 21:26:54 -0400
X-MC-Unique: RgvpDyb-PNq37mNobQHHZA-1
X-Mimecast-MFC-AGG-ID: RgvpDyb-PNq37mNobQHHZA_1743557213
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95A8519560AB;
	Wed,  2 Apr 2025 01:26:53 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87FC03001D14;
	Wed,  2 Apr 2025 01:26:50 +0000 (UTC)
Date: Wed, 2 Apr 2025 09:26:46 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set
 in __get_user_pages() earlier
Message-ID: <Z+ySVprhAsXgL0bh@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-3-bhe@redhat.com>
 <e6b8481f-0bf6-4acf-9ebc-9b4f28c0be08@redhat.com>
 <Z+v5fguHjl5DiaZm@MiWiFi-R3L-srv>
 <a504f547-dc3c-418b-acb0-111b372d88ce@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a504f547-dc3c-418b-acb0-111b372d88ce@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 04/01/25 at 04:37pm, David Hildenbrand wrote:
> On 01.04.25 16:34, Baoquan He wrote:
> > On 04/01/25 at 10:02am, David Hildenbrand wrote:
> > > On 31.03.25 10:13, Baoquan He wrote:
...snip...
> > > We already have that check in is_valid_gup_args(), that catches all external
> > > users that could possibly mess this up.
> > 
> > Right.
> > 
> > > 
> > > So we can just convert that into a VM_WARN_ON_ONCE(), and while doing that,
> > > we should convert the VM_BUG_ON() above to a VM_WARN_ON_ONCE() as well.
> > 
> > Sounds great to me, will put below change into this patch of v3 as suggested.
> > Thanks.
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 9e4ed09c578b..d551da9549b1 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1427,10 +1427,10 @@ static long __get_user_pages(struct mm_struct *mm,
> >   	start = untagged_addr_remote(mm, start);
> > -	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
> > +	VM_WARN_ON_ONCE(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
> >   	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> > -	if (WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
> > +	if (VM_WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
> >   			 (FOLL_PIN | FOLL_GET)))
> 
> That won't work (or shouldn't work :) ). Just drop the handling, it's a
> sanity check we don't expect to ever trigger, just like the old VM_BUG_ON
> above.

Ah, I misunderstood it. Will add below change into this patch of v3.

diff --git a/mm/gup.c b/mm/gup.c
index 9e4ed09c578b..a8a10a8ebf14 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1427,12 +1427,9 @@ static long __get_user_pages(struct mm_struct *mm,
 
 	start = untagged_addr_remote(mm, start);
 
-	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
-
-	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
-	if (WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
-			 (FOLL_PIN | FOLL_GET)))
-		return -EINVAL;
+	VM_WARN_ON_ONCE(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
+	VM_WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
+			(FOLL_PIN | FOLL_GET));
 
 	do {
 		struct page *page;

