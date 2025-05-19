Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1C28469E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665295; cv=none; b=OSf2NYOn4YYEo12sXbhjxyAVf9SgFsHqpo0ReW7fq/3KJnTNWBITpa2wg/ojLtvzL7L8DZIOgt+AIy+ZHMUTPPdP+tQUVVPOUB3j/LAEQJ0fF7Hnapi57BwplYUNiqtM0H7T+A5z6NkzFWWAX1UU93sq1dohy9KrmSH8BTAmqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665295; c=relaxed/simple;
	bh=nr5c60vGGPzzvHWlQvVGj06br0H/xDkRR6GTMy4UIMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdubXcLYTWc25Ax5Ea3NE+eJioMsFh73iRVIqHPuvTRU+aM+TL4gqKmF4I1o0n41EqFrR6sb2oWZPXKe/ioHIv7qs2qjR2I0jCnxdlSgsckDSPN7Xf9dN28nImsYpTWPLcht+LN6vmzOEjsA/fXEZwWRjgjqN8lKn/b6OT6mQqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cPyfI/TT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cPyfI/TT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747665292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lXzggVegcJaYU/PKMAlnm0SQ33yoeyXYBHu/n8B9S8s=;
	b=cPyfI/TT8A/fXzjvKLFn6dANEqPiixzZSjDr/obVfLcr5/g6m+RRdpRpE53tM+mkxUeqt9
	5uRqS/3qd/4EpL4fhFXsC8gfdMFYigncNdQpGAizSWsEH/SS4Qz6Nb3I5Va2lqTgJa41aH
	q7TwmZJYCncthbAnyL5INKTzbFco9VU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-SM5ICl_JOaSxmooY_RCiZg-1; Mon,
 19 May 2025 10:34:49 -0400
X-MC-Unique: SM5ICl_JOaSxmooY_RCiZg-1
X-Mimecast-MFC-AGG-ID: SM5ICl_JOaSxmooY_RCiZg_1747665288
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0060D195609E;
	Mon, 19 May 2025 14:34:47 +0000 (UTC)
Received: from localhost (unknown [10.72.112.83])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E16E11956096;
	Mon, 19 May 2025 14:34:44 +0000 (UTC)
Date: Mon, 19 May 2025 22:34:39 +0800
From: Baoquan He <bhe@redhat.com>
To: Kees Cook <kees@kernel.org>
Cc: Coiby Xu <coxu@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
	fuqiang wang <fuqiang.wang@easystack.cn>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <aCtBf2LqRqlWXaUp@MiWiFi-R3L-srv>
References: <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
 <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
 <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
 <aCaycGEtgNvynjNQ@MiWiFi-R3L-srv>
 <202505161616.F4C1BCCF6A@keescook>
 <aCksAsgAw1jsGBL9@MiWiFi-R3L-srv>
 <202505190716.B21F11984@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505190716.B21F11984@keescook>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 05/19/25 at 07:19am, Kees Cook wrote:
> On Mon, May 19, 2025 at 09:22:30AM +0800, Baoquan He wrote:
> > On 05/16/25 at 04:20pm, Kees Cook wrote:
> > > On Fri, May 16, 2025 at 11:35:12AM +0800, Baoquan He wrote:
> > > > On 05/11/25 at 10:19am, Coiby Xu wrote:
> > > > > On Fri, May 09, 2025 at 06:35:18PM -0700, Andrew Morton wrote:
> > > > > > On Fri, 9 May 2025 17:58:01 +0800 Baoquan He <bhe@redhat.com> wrote:
> > > > > > 
> > > > > > > > The bad commit was introduced in 2021 but only recent gcc-15 supports
> > > > > > > > __counted_by. That's why we don't see this UBSAN warning until this
> > > > > > > > year. And although this UBSAN warning is scary enough, fortunately it
> > > > > > > > doesn't cause a real problem.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Baoquan, please re-review this?
> > > > > > > > >
> > > > > > > > > A -stable backport is clearly required.  A Fixes: would be nice, but I
> > > > > > > > > assume this goes back a long time so it isn't worth spending a lot of
> > > > > > > > > time working out when this was introduced.
> > > > > > > >
> > > > > > > > So I believe the correct fix should be as follows,
> > > > > > > 
> > > > > > > Thanks for testing and investigation into these. Could you arrange this
> > > > > > > into formal patches based on your testing and analysis?
> > > > > > > 
> > > > > > > It would be great if you can include Fuqiang's patch since it has
> > > > > > > conflict with your LUKS patch. This can facilitate patch merging for
> > > > > > > Andrew. Thanks in advance.
> > > > > > 
> > > > > > Yes please, I'm a bit lost here.
> > > > > > x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch is not
> > > > > > presently in mm.git and I'd appreciate clarity on how to resolve the
> > > > > > conflicts which a new version of
> > > > > > x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch will produce.
> > > > > 
> > > > > I'll resolve any conflict between these patches. Before that, I'm not sure
> > > > > if a separate patch to fix the UBSAN warnings alone is needed to Cc
> > > > > stable@vger.kernel.org because 1) the UBSAN warnings don't mean there is a
> > > > > real problem;
> > > > > 2) both Fuqiang's patch and my kdump LUKS support patches fix the UBSAN
> > > > > warnings as a by-product.
> > > > > 
> > > > > It seems the answer largely depends on if the stable tree or longterm
> > > > > trees need it. Currently, only longterm tree 6.12.28 and the stable tree
> > > > > 6.14.6 have the UBSAN warnings if they are compiled with gcc-15 or
> > > > > clang-18. Any advice will be appreciated! Thanks!
> > > > 
> > > > I personally think UBSAN warning fix is not necessary for stable kernel.
> > > > 
> > > > Hi Kees, Andrew,
> > > > 
> > > > Could you help answer Coiby's question about whether we need post a
> > > > standalone patch to fix the UBSAN warning fix so that it can be back
> > > > ported to stable kernel?
> > > 
> > > I went back through the thread and the referenced threads and I can't
> > > find any details on the USBAN splat. Can that please get reproduced in a
> > > commit log? That would help understand if it's a false positive or not.
> > 
> > 
> > The original patch is trying to fix a potential issue in which a memory
> > range is split, while the sub-range split out is always on top of the
> > entire memory range, hence no risk.
> > 
> > Later, we encountered a UBSAN warning around the above memory range
> > splitting code several times. We found this patch can mute the warning.
> > 
> > Please see below UBSAN splat trace report from Coiby:
> > https://lore.kernel.org/all/4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at/T/#u
> 
> Ah-ha! Thanks for the link.
> 
> > Later, Coiby got the root cause from investigation, please see:
> > https://lore.kernel.org/all/2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei/T/#u
> 
> Looking at https://lore.kernel.org/all/aBxfflkkQXTetmbq@MiWiFi-R3L-srv/
> it seems like this actually turned out to be a legitimate overflow
> detection? I.e. the fix isn't silencing a false positive, but rather
> allocating enough space?

This v5 is on top of below patch which Andrew has picked to his mm tree.
In there, it happened to get the ubsan warning fixed. But the hunk
doesn't reflect it in the v5 patch.

[PATCH v9 7/8] x86/crash: pass dm crypt keys to kdump kernel
https://lore.kernel.org/all/20250502011246.99238-8-coxu@redhat.com/T/#u

