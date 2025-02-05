Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87D415199F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753747; cv=none; b=HL9OGDE0BBy+O1Y6qSuyQIH+/E4YucsRdd12lVMrwN8DwVIICo8cfzLw3gaUF0wlgVJ3VmhxipsCfsab5GEJxt0ZOlhuuEJaHpAcwpNF8jLqvnmJlbFOHHlxJ9qtULk/mHLW2t3bmWJSgwu7SlG73QcwNQ7/BAvvObtSdaPn1SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753747; c=relaxed/simple;
	bh=GMBaJXdE1jJUoUSNll5geZvTIUBKWCqewj/yQVuKtyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CM3pTSq+KdIYvQD+B2cpk/E9Sx2fFXU2nIY6zbn6KfcGsHL0xut0zywON3clTdUIfUcQEKnCRHyb4eSBa4ntfj6pmQ9Y9v94y1KZzxWYIE7BEwaccl3ywT+u3OdmTxmmM1SVu3+WqlsE1UmXOJXK9dJUUA4KyWZ+zUO8qqrzDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvLJmEzs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvLJmEzs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F50C4CEE3;
	Wed,  5 Feb 2025 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738753747;
	bh=GMBaJXdE1jJUoUSNll5geZvTIUBKWCqewj/yQVuKtyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YvLJmEzs1hKA7ZIXvcoje43OqLXefr/wHiqSZu4ZGGEgeGAQTP05VJdGznv2T/u9Z
	 BgpZlzCxTRqRyeKDKyP04UFgGKMQ5sHUiP0LAz3WZyZLAksz3upkKTTuq8BXSZEwqE
	 1mMTp8g+BoG/WPMVx2u+qz3E/CMmAyeWq9dtB9x1MVmCdzwqwicdvx8Lq/ttsMJaWK
	 M9cvhGQRWlTuGFWYZOCcoe+dN8PjrxJkkKiN+C9CLptkA3FpgJgqx//NSbvQRN8SIv
	 NvZ5Z22jhOUaZDZ5xT3JvADyv98L1FdpuKf289qIFpsMQ7oNrsPBIgExc7YUMNa6v+
	 WnuR8Szn6oTfw==
Date: Wed, 5 Feb 2025 12:09:04 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Chen Yu <yu.c.chen@intel.com>,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH V2] kthread: Fix build warning variable 'ret' set but not
 used
Message-ID: <Z6NG0HXhjAvDSWO_@localhost.localdomain>
References: <20250204090838.214647-1-d-gole@ti.com>
 <20250204160921.377178-1-d-gole@ti.com>
 <Z6JkO4ssN7Bwcgd6@pavilion.home>
 <20250205061740.v7njfbfdx5ym4m7h@lcpd911>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205061740.v7njfbfdx5ym4m7h@lcpd911>

Le Wed, Feb 05, 2025 at 11:47:40AM +0530, Dhruva Gole a écrit :
> On Feb 04, 2025 at 20:02:19 +0100, Frederic Weisbecker wrote:
> > Hi Dhruva,
> > 
> > Le Tue, Feb 04, 2025 at 09:39:21PM +0530, Dhruva Gole a écrit :
> > > Fix the following build time warning in kthread:
> > > 
> > >    kernel/kthread.c: In function 'kthread_affine_preferred':
> > > >> kernel/kthread.c:861:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> > >      861 |         int ret;
> > >          |             ^~~
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/
> > > Signed-off-by: Dhruva Gole <d-gole@ti.com>
> > 
> > Thanks for your patch but another similar fix was already pending. I have sent
> > the pull request there:
> > 
> > https://lore.kernel.org/lkml/Z6JjZMdbDoAX_AVW@pavilion.home/T/#u
> 
> OK, btw another qn I had was does this file not need a MAINTAINERS file
> update?
> I don't see a real MAINTAINER against it, everyone just shows as
> contributors / committers...
> Or is it to be sent to Linus directly?

There is no official maintainer for kthreads. But I volunteer to handle the patches
targeted to it at least for a while given my recent invasive changes there.

Thanks.

> 
> -- 
> Best regards,
> Dhruva Gole
> Texas Instruments Incorporated
