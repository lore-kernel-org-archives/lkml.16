Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9B131E49
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744576873; cv=none; b=Xsua5BxX8qfTGsDsCgouvRIdbrI8rQUgBXgU1G32h8B13K4VYRlvooUwqxVYjtFJJer427Hi0slAeSGrTj3PcNAY0iYVaRLEauzpIXy4fDYr4KicUg83KkZB1/smsncFx8kncadr10h+5M7tC5Kk8UMW+GvZMqGyod8a4bz6Bnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744576873; c=relaxed/simple;
	bh=EBOpep+wKnfQWZv6+xJ+jCvtxjdlqDRVyHGUQ7e4MTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6PiYteas/wX4jMP6zqh69edxlh1bCmkqTIwjueVYg2pGOuhSMKpT0/d8QN+q9e/xCvII/td32Z/pE6/S6MpM8prKvUquXymVq9P1meP//V9XxgcSgGEkmqQonguABPPkJpg4n3QOJv6b7pelMPRBg6plESurRiShHjbwsZZHaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lIPjmd6h; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lIPjmd6h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JuNqfYs05aJJ7FgR0AQXI6iDjBbL9hVdThYe09IHpQc=; b=lIPjmd6hoUmdrMTnbWcG9HqRis
	yVdbmXgxdlikDUB0/Ul9waktVLv+dlh3gNv3E6+iURDFMgWrY3Lhj595rgPMweusYm9lv+sAr+Ocq
	H/LbHHNFUAzgEmADChmDpdlvy2BfIPS/DRhLSOX+fkH270ruUsBBD6IximbuzY73B6FnOE3zYV0SF
	e2ORUgmLxSO1Zdl7uCN3IYdghIfxxiqXJc5EzTWIRvnDUm1Ja+WpVt5nFbF6jw7xY2JAKgFVGMiPF
	eYU+Hbni1o5hfJUW8daZ+1WLByAMzClKtSZBAmA5mw24o2GRdTZa+UOei6n8WXhPGxXV4TpIJ4rfe
	mrBio7sw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u448a-00000007FOL-0cu1;
	Sun, 13 Apr 2025 20:41:08 +0000
Date: Sun, 13 Apr 2025 21:41:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Shivank Garg <shivankg@amd.com>
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Subject: Re: [PATCH] jfs: implement migrate_folio for jfs_metapage_aops
Message-ID: <Z_whZHPR64FHq6ve@casper.infradead.org>
References: <20250413172356.561544-1-shivankg@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413172356.561544-1-shivankg@amd.com>

On Sun, Apr 13, 2025 at 05:23:57PM +0000, Shivank Garg wrote:
> +++ b/fs/jfs/jfs_metapage.c
> @@ -570,6 +570,7 @@ const struct address_space_operations jfs_metapage_aops = {
>  	.release_folio	= metapage_release_folio,
>  	.invalidate_folio = metapage_invalidate_folio,
>  	.dirty_folio	= filemap_dirty_folio,
> +	.migrate_folio	= filemap_migrate_folio,
>  };

Ooh, damn, I think we're going to need more than this ;-(

static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
{
        return folio->private;
}

struct metapage {
...
        void *data;             /* Data pointer */

So we're going to need something like buffer_migrate_folio(), but
specialised to jfs metadata.  And when we come up with it, that'll
be Fixes: 35474d52c605
