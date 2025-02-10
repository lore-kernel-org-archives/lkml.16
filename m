Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F724FC16
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207028; cv=none; b=SFtRUyD6Ge64lFCxoAqQZK84aq9qgiy8z4UVwJFwkpEjrP2KV73ufxs2gXZyxWsNPOVeDDLhpHGoJk0oKyZoZ2n61UyL3ykFnwnTqE7uGS6NMPOAMI1Oo6IbyHauEECz1n4wqVw9et9o4NNTZs64oYIIq0T9jvx2e2TD7g7REpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207028; c=relaxed/simple;
	bh=NLafNxPgiaYEtucz8uetAV+wNWyIORR01xAbmdZjB2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9x4MtdEOM9sP//+FCfPOUBpKZAnjE4rXmhbBNQEq8JgNCsN21TNiU0x2FsZzZGJisjugqMPmRf1KPDnDGGxKUopAaC1bYkGJpEGiPVtXPGoD7o8N/+pPyuKkLBZoPprJbbpCPddotWSZeXBzAqxHsWVA/s2tlrMIcL9yoblLWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XbKdGlGW; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XbKdGlGW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+wsOhJNavEVEuHUNn8/mtc0ydZ43wJ+QIoNT3mULk4c=; b=XbKdGlGWuizr2h7RV/h79Av8MM
	aR4qmyE1fVtaYDu3Bj8krer6Rd/NSQ6Qxp1vHqtgtl3tQMVmT1HrLhpChYVg3y06xd5h0+dqSAV09
	TQsGsGt2GiLTnVZFY0zGdBVVJJJT7v+jSGkXmShySJOLtYDFonVQcat/Mw0woyvOYw9qmxnXSbF3L
	Wth9UukiCC/6b35SraYEhitr2oWwLyKRcoiOwbtCwxMpOvUybau89/GWfDHEtP4Cnzz8kXdEEt01l
	KjY6ZB5mcGf/SbolVWl7unte/pptLl/xUde8eifncaUtAz4FvegzywhAB1K1g61mrFKs72HVKRtyV
	ZZy5BWIw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1thXBn-0007bE-0v;
	Mon, 10 Feb 2025 17:03:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1thXBh-0007ej-0r;
	Mon, 10 Feb 2025 17:03:13 +0000
Date: Mon, 10 Feb 2025 17:03:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux-mm@kvack.org, Qi Zheng <zhengqi.arch@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Hugh Dickins <hughd@google.com>,
	Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	open list <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25)
 during compaction
Message-ID: <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
> dereference resulting in a kernel panic. The culprit seems to be commit
> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
> Reverting the commit apparently fixes the issue.

The blamed commit is buggy:

arch/arm/include/asm/tlbflush.h:
#define update_mmu_cache(vma, addr, ptep) \
        update_mmu_cache_range(NULL, vma, addr, ptep, 1)

So vmf can be NULL. This didn't used to matter before this commit,
because vmf was not used by ARM's update_mmu_cache_range(). However,
the commit introduced a dereference of it, which now causes a NULL
point dereference.

Not sure what the correct solution is, but at a guess, both:

	if (ptl != vmf->ptl)

need to become:

	if (!vmf || ptl != vmf->ptl)

but I haven't checked wha tthe locking context actually is here
(I've been out of MM stuff too long to know this off the top of my
head.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
