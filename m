Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5105D41C63
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449768; cv=none; b=nhAnChAigxmft3syXkJ4Oee5PU4v7Zsn6woZHvZFCH1Xisi7TeO/moqJGl8bzLz1rIFeFq4Vm/gNVgvZHNHNDTMi2KHWLOBgAdpo3efUzZPjGO0xfVI2FgUjsUp/wR7A1fYCV7Nozow50ADmGHLIADDbouA8FjM9CB5miG7la14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449768; c=relaxed/simple;
	bh=cVzN7uc4Dohs1nV7cR6tSvGPp+TdoGbkUEVzbFwPJHY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=AQZ96B40eWjS0TiAD8m8i/KvRNFQC00MRfBEdzbGx55B0MvCuM3xM2h68QB8BVx6Dz50d0mg6A0hzLRfnX6ZDgjxK3PEgrb/JRivZqiZrdwOW8o3kAEIp1WOjoYPejVgW/nx/gCGhLs9ROYQJfJzVPUv4esn4w2Db/RovlkdoL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 702E4343145;
	Mon, 05 May 2025 12:56:03 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: mingo@kernel.org
Cc: ardb@kernel.org,arnd@arndb.de,bp@alien8.de,dwmw@amazon.co.uk,hpa@zytor.com,linux-kernel@vger.kernel.org,michal.lkml@markovi.net,peterz@infradead.org,tglx@linutronix.de,torvalds@linux-foundation.org,yamada.masahiro@socionext.com,
 Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH 12/15] x86/kconfig/64: Enable popular kernel debugging
 options in the defconfig
In-Reply-To: <20250505110946.1095363-13-mingo@kernel.org>
Organization: Gentoo
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Mon, 05 May 2025 13:56:01 +0100
Message-ID: <8734djcj32.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

> DEBUGINFO is still disabled, despite enabled in all Linux distros,
> because the ~10x .o bloat is still just so painful on anything
> but the most powerful build boxes.

My hope is that soon, we'll be in a position to have directly-generated
BTF (which should be far quicker than generating tonnes of DWARF) which
should resolve that.
