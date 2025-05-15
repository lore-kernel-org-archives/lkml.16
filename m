Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E101A316D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332419; cv=none; b=lKj7GQmFNtFZKn+vVSI3aTVkb+1EvK0SBd3Vf0I43HYc2mYqdrYismGOfO8hiLQVlEA/TPpWWYxTSpzT+d5d4mpwwLSjusyqUBmAp0cwoUaiJ0L+cEevJsjrYDecR2tBgvH2H0KyEsQKQmf4fe4OHwz5E0sYfC22HyvWHg7hdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332419; c=relaxed/simple;
	bh=i0662vX1DTCTKYAn0Fswg4HZTfUsAKUbdi/4cKn2K2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDQyI1SteCdAZ0gWFXEsjMnM0JSHauFcSz2LCzGMAhwDrg5BGX9W0Seuw5+8bYc882v9ayPj1fQo1oyC820OXUhSq6QOToCvSuOd0IaO4V3z7ebRSR3fgKdMBKOSjSZaLqHwqfU3BmkHcAglnXB25LdGMeYi3xanlIfdHPojeVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=O6LZqX79; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="O6LZqX79"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1AA2840E0222;
	Thu, 15 May 2025 18:06:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kpXTsgG6MJyS; Thu, 15 May 2025 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747332410; bh=mgZAKCEffvt/GriTK42rIIXANkTBZtqAKQg87Sq3LuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6LZqX79iB0Bme5Jowg9nL3FXG6EVaVzQcPPDnGCmYZvCS1aQ+a7pc/aBAjPCRb4c
	 lyj1yfBrdfEWEmvkbyeG8m5T19FQcpuySp+2aHpIKrsVSw7axIV7A/G4SocQBmL7SG
	 AJsHFoiQEWHT4S+VYL2+sbdX+XY7tLOvDNGm3L/N3bZWnqPOugzU90z1xn1+yliKXo
	 66Nk6bNHI9GGelAU4PDxr8/8EzldyZdOpNWgnX3uItO+6Qdo0SrlcAQcWlV1XnmHmc
	 8jeOLYMbBslXqsCyfhGmDuO1voeKFgTeOhS7PDFdguyiUJHIsDCVsFiwQQx7v8GnBX
	 WOiznSrqTWqjUXI+XMCc6nB6PvVzTnk85ys9d6eFdsUcaHi1RxRvAn7JJ3a43DJba4
	 gP8XSKeHMFMcz6ojrLGuCBFxD72B2o0UXedU0uO/+y3ru+44YhOCLljACUOGGL7lPf
	 Z8hVBzr6uTMuh1LiFWp7b4xfL6jtt32EzBSy7Ez0u+FyxJPc37mTxGrOHjCwLSSQzW
	 iJpf4jfJGZhVW/kjTjAGRHpPyWHqqsxJYwugrU+duhi/d2WJv0uZUAu8Q6GBB8ZYZS
	 V1n9npWlFKJyIcbHZ0UbgalRKXyPGSQcgusvSGqWkzLq23dzMdJrDZccrSL3XhUdEt
	 GeYh5sQRxjIru5jnEIEifplA=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 810F840E015E;
	Thu, 15 May 2025 18:06:24 +0000 (UTC)
Date: Thu, 15 May 2025 20:06:23 +0200
From: Borislav Petkov <bp@alien8.de>
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: James Morse <james.morse@arm.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, H Peter Anvin <hpa@zytor.com>,
	Babu Moger <Babu.Moger@amd.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>
Subject: Re: [PATCH v12 00/25] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
Message-ID: <20250515180623.GMaCYtH84bauHWs44X@fat_crate.local>
References: <20250515165855.31452-1-james.morse@arm.com>
 <20250515175054.GKaCYpfoCe0b7QyIqL@fat_crate.local>
 <f42b0165-092a-4e58-abb4-a8d59bba5cab@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f42b0165-092a-4e58-abb4-a8d59bba5cab@nvidia.com>

On Thu, May 15, 2025 at 11:00:04AM -0700, Fenghua Yu wrote:
> 
> On 5/15/25 10:50, Borislav Petkov wrote:
> > On Thu, May 15, 2025 at 04:58:30PM +0000, James Morse wrote:
> > > Hello!
> > > 
> > > No code changes since v11 - this is the 'final' form of the series
> > > with patches v11:24-29 squashed together. See [v11] for the breakdown.
> > Thx, lemme see if I can queue them...
> > 
> I build and test this series. Everything looks good to me.

Is that you giving a 

Tested-by: you

tag?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
