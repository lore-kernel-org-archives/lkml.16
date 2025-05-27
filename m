Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC952741DC
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748361227; cv=none; b=ughJS1Y+tcsOWXkvjuyQXQ8aLFEHPrScnih74ZQCWn/oyxj6/Mcq74aNuSLE3E0nLP3CiYsBZUwESxixFTQJ9fchJHvRNNMgB2wKLvQLe1ieuKA+KAV40nfVQLHGGBUzP2jqeiYEEQio05X9YkbvvEdj3KwG+wvvKakHVhxwNVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748361227; c=relaxed/simple;
	bh=9F+YezUsEr6VB3sfvX7PBgdXOIrdp084d0lPEPi0/xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjG0SlpvUXcY4l4rFRy+SeY5/aleymc9T6qU20rn9eCnob6k2uCkYiB50Zdp+sFk+qVFN6kxC1Gp6gydVlkZyH83WBVjl++Y36ST1cEkOV3YeXxHS6SKDyX3B8Okw1f6BMJM/K26rTeALK8SMYzb1nGsB1gEpyX2dyfg5DJ71iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JtsXPC2U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JtsXPC2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748361224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cXGnKAjJ1gvx+jFt06CPUNpyhuC4FW+rC+R26nyk0CY=;
	b=JtsXPC2Uu9OFIHL5F3VhIjB8hWC+RIdH9uLTOndvRRi7G39wxuudXo+Rn2/LnzvOdxOA95
	oEEpHjrmdThtRSy+2GLMCmKCN1/V11jyjpRFn8q119SrdIEeEotfci/r5HL7lHwz+vs9KG
	HXCTyeMWoRLJcNhc3zqTE42oc07l0qM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-218-lKUn6eXcNjidh9a56h_-NA-1; Tue,
 27 May 2025 11:53:43 -0400
X-MC-Unique: lKUn6eXcNjidh9a56h_-NA-1
X-Mimecast-MFC-AGG-ID: lKUn6eXcNjidh9a56h_-NA_1748361221
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6852D195608C;
	Tue, 27 May 2025 15:53:40 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A7F3019560AB;
	Tue, 27 May 2025 15:53:35 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 27 May 2025 17:52:59 +0200 (CEST)
Date: Tue, 27 May 2025 17:52:54 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <20250527155253.GE8333@redhat.com>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527153007.GD8333@redhat.com>
 <b16e6120-9f02-4a3a-8f85-394ea55bf516@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b16e6120-9f02-4a3a-8f85-394ea55bf516@lucifer.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 05/27, Lorenzo Stoakes wrote:
>
> On Tue, May 27, 2025 at 05:30:08PM +0200, Oleg Nesterov wrote:
> >
> > >     struct perf_event_attr attr = {
> > >         .type = 9,
> >
> > Cough ;) Yes I too used perf_event_attr.type == 9 when I wrote another
> > test-case. Because I am lazy and this is what I see in
> > /sys/bus/event_source/devices/uprobe/type on my machine.
> >
> > But me should not assume that perf_pmu_register(&perf_uprobe) -> idr_alloc()
> > will return 9.
>
> While I agree we should probably try to do this nicely, in defence of Pu I think
> this is adapted from the syzkaller horror show :P and that code does tend to
> just insert random integers etc.

Not really ;)

syzkaller's reproducer reads /sys/bus/event_source/devices/uprobe/type, see
https://lore.kernel.org/all/20250521092503.3116340-1-pulehui@huaweicloud.com/

In any case. Many thanks to Lehui who investigated this problem!

Oleg.

