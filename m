Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F196A256C9F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828522; cv=none; b=CkV3QoaDN5o8sEvkvJjjkGnybmE92LeE/CiDKlr8s70gicCIy1+GMe5dIGLC+8DpA37oLeShZnLUMFGfS99R+BybRMsozFpVy6KlxZFwbnAZ/Ibd5VIlPvSrEbq/KuRe6eqGIDWlFn6cjj5ilbayGXkxobhQPAC/yfR5r/46Bf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828522; c=relaxed/simple;
	bh=dH3eujUfFv58hcc94Fs7x9EuHRjfBMVkVwAN1EAt4+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRhd4ldVVTyaaSnc0ibFxnjK99bgzg7Vh/xZ9+2b1O+zh4k+r/YvAl8BGWxzpjrv0h6MgssPJpvzgO+TFSgaju8i4Gw4bpYC2QbLtyriyADUv5z72scyvGT0+pYSYjmtDJHFYcJSjoaPRxPlgrTxHt6cwFGIfdQ+oQBSC1QfJy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HO9BZ9PU; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HO9BZ9PU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0731840E0238;
	Wed, 21 May 2025 11:55:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id H7jslWYdBfFQ; Wed, 21 May 2025 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747828514; bh=tL9eCLX5QiCVgv4ctfN0wj5bckq6gkGyr3yq1p7b9sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HO9BZ9PU88TxKTn3832zMPLGeb174cware7gqc8aEYEwlFTS3JLZHXeIE21kDzqCz
	 rxt5D3MW5Dtxu73Jt/i/jHn1oOXHN/CAC6zYiZFxJJHXlSInUZmIIdqZSenKMykZlT
	 qLoSWwyTwnnU5IqgQQCrcCURyBjKamqGKKLUbGk+8PrtqxgSFwEfVKa1r3hEsdNAhZ
	 F4XPI/hwAvUwbdvRZj2ZB4xIMp/exegZjzAkQssQ+rNZHmqU8QH8Zol3OhczjZHwx7
	 9DKCQKovWsQBxN68S50mauoXzvvxCN/ogkpWADIeM4pHpZ/QCORm9D1MBXCfQwcDY5
	 kea4nSxJsme7yk9BwBnamkHmjDidr9ZpV0jfw7pdk+e1qe4RRbg61q8QRqCtTuKmMH
	 1GXia4kH5I7OyDYM7IQHI0LrA43c6i6l/8wq4w9SPshkJAkfJlm2UVwNPIgwKfxhEv
	 EEo6utg3WHV5LV8N31gzcqfHvmcSWIcFTbAqmRa1Z67rUwXIiF7jajOH23+8J30YXi
	 QaJy3m36l75i4RIcShUqcdiJy8+qniRwAxK6zB7pBQ0hJTjtzAQvOFWmV6lNCUUuha
	 JZzqX6P2UepwqAmLAOXRYbnvyQU5a5wQi+0fySD08WCysuIhT7TvanXW4f3e9dsWV9
	 mrpqbY9ACGdi5MozubSsAyW8=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DD33740E0163;
	Wed, 21 May 2025 11:54:59 +0000 (UTC)
Date: Wed, 21 May 2025 13:54:58 +0200
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, nadav.amit@gmail.com, Rik van Riel <riel@fb.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 5/9] x86/mm: Change cpa_flush() to call
 flush_kernel_range() directly
Message-ID: <20250521115458.GDaC2_EqaXGa8ZsImM@fat_crate.local>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-6-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520010350.1740223-6-riel@surriel.com>

On Mon, May 19, 2025 at 09:02:30PM -0400, Rik van Riel wrote:
> From: Rik van Riel <riel@fb.com>
> 
> The function cpa_flush() calls __flush_tlb_one_kernel() and
> flush_tlb_all().
> 
> Replacing that with a call to flush_tlb_kernel_range() allows
> cpa_flush() to make use of INVLPGB or RAR without any additional
> changes.
> 
> Initialize invlpgb_count_max to 1, since flush_tlb_kernel_range()
> can now be called before invlpgb_count_max has been initialized
> to the value read from CPUID.
> 
> [riel: remove now unused __cpa_flush_tlb]
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Signed-off-by: Rik van Riel <riel@surriel.com>

Please audit all your SOB chains.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
