Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585EF21D59A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736275; cv=none; b=OINVr3DDlhEA+fKglPuUkYjaTriutvRd1m6nBnCtN/uERsg0yMmsL02Y9LKiitRxKBzQ/Yw7i9TCbBjVxkDV9J+W35uFrHwIclsXmU/h2NOo7n8pWzj68p5Zv/wfXM2gV2v3d93yy0tHqYK8QxXzb6jqSaXycXFE0jYM/8MmpJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736275; c=relaxed/simple;
	bh=mrjDyDGjp3EYHypso6wOZjUG5oNhvrKfNEnJ+8UdxQM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=me3IbBoVs4tryfjspLdiJ56837x2FONSAzUULx0+SNDzyZWPggK+EsAiamMo1d21Ln/SDX9QRlLDwm2fcowY3Jwk6ODxGxiX2WmzGUurNbGw9boG93nwvLFuFDhJ+cnq0fGBQ+7r/BIMeVKczmqgbgQNe8MsBYHcd/7rk5FTjl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=veluafAR; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="veluafAR"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5156HgLx2544524
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 00:17:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738736262;
	bh=C+C/w10jlPplDdb/a9a63QvDwxagj3cT9/esjyRMLxc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=veluafARrAQG48VyarH7ziSwplC4IbXv4r0KV1n94MItELgL7UWNInoeoyoxq+nSe
	 PtTmZj/XwjljqotL5NPT6iNp89haHyfMQRU1PRLhQEJfbrMR+DKsRp3UwDeNvNY7mo
	 /vBRMclkYj6384CVhclfZCnX0vkpevrAlrTrSsJQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5156Hgtt027641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 00:17:42 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 00:17:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 00:17:42 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5156HfoR071271;
	Wed, 5 Feb 2025 00:17:41 -0600
Date: Wed, 5 Feb 2025 11:47:40 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Frederic Weisbecker <frederic@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka
	<vbabka@suse.cz>, Chen Yu <yu.c.chen@intel.com>,
        <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>,
        Randy Dunlap
	<rdunlap@infradead.org>
Subject: Re: [PATCH V2] kthread: Fix build warning variable 'ret' set but not
 used
Message-ID: <20250205061740.v7njfbfdx5ym4m7h@lcpd911>
References: <20250204090838.214647-1-d-gole@ti.com>
 <20250204160921.377178-1-d-gole@ti.com>
 <Z6JkO4ssN7Bwcgd6@pavilion.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6JkO4ssN7Bwcgd6@pavilion.home>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Feb 04, 2025 at 20:02:19 +0100, Frederic Weisbecker wrote:
> Hi Dhruva,
> 
> Le Tue, Feb 04, 2025 at 09:39:21PM +0530, Dhruva Gole a écrit :
> > Fix the following build time warning in kthread:
> > 
> >    kernel/kthread.c: In function 'kthread_affine_preferred':
> > >> kernel/kthread.c:861:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> >      861 |         int ret;
> >          |             ^~~
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/
> > Signed-off-by: Dhruva Gole <d-gole@ti.com>
> 
> Thanks for your patch but another similar fix was already pending. I have sent
> the pull request there:
> 
> https://lore.kernel.org/lkml/Z6JjZMdbDoAX_AVW@pavilion.home/T/#u

OK, btw another qn I had was does this file not need a MAINTAINERS file
update?
I don't see a real MAINTAINER against it, everyone just shows as
contributors / committers...
Or is it to be sent to Linus directly?

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
