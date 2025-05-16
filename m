Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7A62C9D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366529; cv=none; b=b/6lCjZU39gOsuuOQXsEu2Qku8ld5QAz/6+4W6mJ3kAEbm0YuYaoKVQlGCdJMbxYu+bvHCIwnwdKdTZlwILOP/i6C0ykELAFnzQtoaLZphxoZsZST6d0EzUIFG8rmKnZp0rGKy+jHN+cd156A0awBQmdd1Bc2m5pAFbB9XVn2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366529; c=relaxed/simple;
	bh=a/li3qZ5PYcDQo6L/Wccgd52bV+LVI5/TioOoB/kB2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJ+NI1yqI3e0mCZwJ/dzT3sl3g0/l9aZ9uz6lrYJ9Y37GygBNzTKDLR0moDuAtTrOtsdVR6JKhUl5ULKFPFSkbMtr0uO3M6BNe40aKf4D+vNEy07nAe74dbsFvpbzor290mwQTdHf36b10eHh4BXNwDdg0m7ecW9zEodri1pRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CuaKu5qN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CuaKu5qN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747366525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QrgAgySR+qWyR+vITbnGF4AFTvEjlTBU5z505u2bgoQ=;
	b=CuaKu5qNK5sMyYId+JmVjw6jZaOJg4b4ZS7NaJPsrcu4ACJJHXP3j3NZwmq9ly6WhRpLVr
	4szxAgyn+naKWKK/0CnjlNiteryL8hwI37XOz7LSC+mDxgrihwGq/MnXdjlia0jsDHjrT3
	LwIrzkX7qSvovvgBpmHcSDToSx7JO9k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-203-jUuzTCx1N76rAkaJx-LxpQ-1; Thu,
 15 May 2025 23:35:21 -0400
X-MC-Unique: jUuzTCx1N76rAkaJx-LxpQ-1
X-Mimecast-MFC-AGG-ID: jUuzTCx1N76rAkaJx-LxpQ_1747366520
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 70D5F1800570;
	Fri, 16 May 2025 03:35:19 +0000 (UTC)
Received: from localhost (unknown [10.72.112.140])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5EA2A195608D;
	Fri, 16 May 2025 03:35:16 +0000 (UTC)
Date: Fri, 16 May 2025 11:35:12 +0800
From: Baoquan He <bhe@redhat.com>
To: Coiby Xu <coxu@redhat.com>, kees@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: fuqiang wang <fuqiang.wang@easystack.cn>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <aCaycGEtgNvynjNQ@MiWiFi-R3L-srv>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
 <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
 <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
 <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 05/11/25 at 10:19am, Coiby Xu wrote:
> On Fri, May 09, 2025 at 06:35:18PM -0700, Andrew Morton wrote:
> > On Fri, 9 May 2025 17:58:01 +0800 Baoquan He <bhe@redhat.com> wrote:
> > 
> > > > The bad commit was introduced in 2021 but only recent gcc-15 supports
> > > > __counted_by. That's why we don't see this UBSAN warning until this
> > > > year. And although this UBSAN warning is scary enough, fortunately it
> > > > doesn't cause a real problem.
> > > >
> > > > >
> > > > > Baoquan, please re-review this?
> > > > >
> > > > > A -stable backport is clearly required.  A Fixes: would be nice, but I
> > > > > assume this goes back a long time so it isn't worth spending a lot of
> > > > > time working out when this was introduced.
> > > >
> > > > So I believe the correct fix should be as follows,
> > > 
> > > Thanks for testing and investigation into these. Could you arrange this
> > > into formal patches based on your testing and analysis?
> > > 
> > > It would be great if you can include Fuqiang's patch since it has
> > > conflict with your LUKS patch. This can facilitate patch merging for
> > > Andrew. Thanks in advance.
> > 
> > Yes please, I'm a bit lost here.
> > x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch is not
> > presently in mm.git and I'd appreciate clarity on how to resolve the
> > conflicts which a new version of
> > x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch will produce.
> 
> I'll resolve any conflict between these patches. Before that, I'm not sure
> if a separate patch to fix the UBSAN warnings alone is needed to Cc
> stable@vger.kernel.org because 1) the UBSAN warnings don't mean there is a
> real problem;
> 2) both Fuqiang's patch and my kdump LUKS support patches fix the UBSAN
> warnings as a by-product.
> 
> It seems the answer largely depends on if the stable tree or longterm
> trees need it. Currently, only longterm tree 6.12.28 and the stable tree
> 6.14.6 have the UBSAN warnings if they are compiled with gcc-15 or
> clang-18. Any advice will be appreciated! Thanks!

I personally think UBSAN warning fix is not necessary for stable kernel.

Hi Kees, Andrew,

Could you help answer Coiby's question about whether we need post a
standalone patch to fix the UBSAN warning fix so that it can be back
ported to stable kernel?

In the case exposed during reviewing this patch, the code UBSAN warned
is not risky.

Thanks
Baoquan

