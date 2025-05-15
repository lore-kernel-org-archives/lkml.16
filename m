Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E235971
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331498; cv=none; b=uV+WkefIYV7y0EMpHiwb1iBGeBdULreeppmlOTvV3WOeqhQMsojzJF3kV6ziJ6z3sjEhvNCPb4BGZBG5f/EXD4+GdIRGpRMbosHUEVgkpcsOZ2tygA2y9LUaqdYENmJ6jT8SX1aUcCFC9MJ/VZBSN6YwxyQyCXECRyIG6X7szec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331498; c=relaxed/simple;
	bh=KpNASHpkw9MqLqTxCFi5JGz18lfPtXkvWz2gLAQ8yu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFDn7xr+yB7VAbapB0LJPiaSrj7xk/7S4DnqsXfwcp4H35r+gCzixMXoeeYGOrL6pb0jiWhnUUkqnRJ+ItHPYy1v7vtjNXWw68yVr/86aIP//e2J6A/XGi2I9ich0TSaXKNyYKvxdLCTM4uSBCXZ3HBNia/Ev91M47DF9oWllfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=a5YV43+n; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="a5YV43+n"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E860A40E0239;
	Thu, 15 May 2025 17:51:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xjuOsBvLq4LW; Thu, 15 May 2025 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747331489; bh=ihdt9XYmYkxvji/IzkSsVuLi7wNDZ7DC5YgWZNzheKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5YV43+nCwCPmGbsq23Q/jTRqBemeTlusjzR9G6e7bV6WpMZ+wPabGh+smX2t6f9/
	 yG9ISNs0Pwe8mmvCKIIJyIcPmF0XT7JELAeCPU3N0oKh3MgnKWM5anfrcPJgyaVsRb
	 b9RX812gHldNR4lXx+to/tGCI9yLgxm9k5CAdJSyqm1R4+D5L4TDGn3eMa+5ms2BFw
	 LBqbMGaVsktOECMM6zWRnNkk9zHAgDSvfZ/nT7Rmzyi7XTK+4Opn73mDnQumM0T8Cw
	 L2Lq1h53RH2oz1uQlARmAYydAOZyInEsfmpYivuJoeexNqADeev/JTCAt+yf01GtHV
	 w+8lJ/meUOn6st9EC8XAeWqtq9JzlN1XvX8cEoWFBzfvrssoW77xNXdWMnaSu54LjN
	 kIYO1Bs1uHHp5cccU9NuGNgTHI9gRFBQhDV5sM0jQhYCekT9FjaufqyQDP7e3DA2mh
	 QB/TslaVzhfOB/r3rEEYth4HNKP4qFoQBZ5Nhi/WGMvz7pKyXPS8GtgRdJxTHJRWwb
	 xN72PXtYup4idxq1n1QrVynAqW4DsjlTmKa4uQqpyAZaxG8u01eXrSyh0XMUNBG2vV
	 6FiXUkyx3s3+9G/AW6EZ9QoczmYGLwTUyV22o4ThQOSGxlXUwb2Un2EuxjGoGyWmIG
	 mfQVZG/n55SUvaAXX+W5Bs/M=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 00F8B40E015E;
	Thu, 15 May 2025 17:51:02 +0000 (UTC)
Date: Thu, 15 May 2025 19:50:54 +0200
From: Borislav Petkov <bp@alien8.de>
To: James Morse <james.morse@arm.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
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
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
Subject: Re: [PATCH v12 00/25] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
Message-ID: <20250515175054.GKaCYpfoCe0b7QyIqL@fat_crate.local>
References: <20250515165855.31452-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515165855.31452-1-james.morse@arm.com>

On Thu, May 15, 2025 at 04:58:30PM +0000, James Morse wrote:
> Hello!
> 
> No code changes since v11 - this is the 'final' form of the series
> with patches v11:24-29 squashed together. See [v11] for the breakdown.

Thx, lemme see if I can queue them...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
