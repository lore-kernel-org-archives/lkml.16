Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C4A17A2E2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430844; cv=none; b=EsbwJwtDlfiEcA6gFEJ5LXDco/e0psonGmvcoXL3czGGqwKAqTZPIjcj+9P99IZ+eMVxivtt3VOb+6KpyBAAFtSho0gKn/s4sDzGYjDHivjOoilFWRnKUqLXtUveTIYJTXxmFUlH3E8xOoYUAunXeoZqzkh3MHtszrhERTCnAT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430844; c=relaxed/simple;
	bh=ro7ThTBUX+Cvy9g1xjBjQvosN5toQsH/kBATsfiFwaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPKLRHz3CfvEKZNSUKSF2/xmUkwb7RrBwjZ2X9H3b13K7v1vWtp6PB1FofZBnAjd10Hsj3rz4N0RQY6yMegaeeBIAv0/oJ8HDkiWjnujVnJo+YXS5oqQxGAsx9mTA5w6VPTlZnX4F9Q31gsc+ks9GGiVoNvrwlUuvmbWgRqAug8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TR1Cjtsj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TR1Cjtsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743430841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WxebEm4AdT1B8548LMtZPuP+cY0Y0p0xMDDsx8Hw70=;
	b=TR1CjtsjH3ygf2SuEy9PmeKraW1mwFvqHa6Ze+SjbakIiJ8cUpeIOj7oNXMtzMKGlN1RKa
	RJo+7ybqD48ivV0tyH4ALDZMru2CwTKkft02nx6cyN158u+6z/tAEMe7X58HTkqzFDdMaE
	TT/oGL135J+4MRwVXJbqzCrLBiu+DPI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-bCIHaht8NLmLFEJcIbNPhA-1; Mon,
 31 Mar 2025 10:20:39 -0400
X-MC-Unique: bCIHaht8NLmLFEJcIbNPhA-1
X-Mimecast-MFC-AGG-ID: bCIHaht8NLmLFEJcIbNPhA_1743430838
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33C80180025B;
	Mon, 31 Mar 2025 14:20:38 +0000 (UTC)
Received: from localhost (unknown [10.72.112.9])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2384180B492;
	Mon, 31 Mar 2025 14:20:35 +0000 (UTC)
Date: Mon, 31 Mar 2025 22:20:29 +0800
From: Baoquan He <bhe@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev, x86@kernel.org
Subject: Re: [PATCH v2 6/7] x86/mm: remove p4d_leaf definition
Message-ID: <Z+qkrZcYbhdAVL3r@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-7-bhe@redhat.com>
 <Z-pnCLaAp43kJVCM@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-pnCLaAp43kJVCM@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 03/31/25 at 11:57am, Ingo Molnar wrote:
> 
> * Baoquan He <bhe@redhat.com> wrote:
> 
> > There's no p4d huge page support yet, let's use the generic definition.
> > 
> > And also update the BUILD_BUG_ON() in pti_user_pagetable_walk_pmd()
> > because p4d_leaf() returns boolean value.

Thanks a lot for cleaning up the patch logs and rearranging x86 patches
into tip tree.

> 
> 
> > -#define p4d_leaf p4d_leaf
> > -static inline bool p4d_leaf(p4d_t p4d)
> > -{
> > -	/* No 512 GiB pages yet */
> > -	return 0;
> > -}
> 
> This comment was also incorrect I believe:
> 
> 1 PTE entry on x86-64 covers 4K virtual memory, 512 PTE entries make up 
> a 4K pagetable page, and each level of paging adds another level of 512 
> pagetable entries:
> 
>  - level 0:                 4K pages
>  - level 1: 512x    4K =   2MB 'large' pages
>  - level 2: 512x   2MB =   1GB 'huge' pages
>  - level 3: 512x   1GB = 512GB 'PGD' pages
>  - level 4: 512x 512GB = 256TB 'P4D' pages
> 
> So the above comment should have said '256 TB' pages, unless there's 
> some naming weirdness I missed.

Hmm, there could be misunderstanding here. In 5-level paging, PGD is the
highest level, P4D is the next level of PGD. You may have reversed their
order. So one P4D entry maps one PUD table which is 512 x 1GB. Then the
mentioned comment seems correct to me.

