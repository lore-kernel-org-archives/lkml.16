Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C6D1F03D4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828164; cv=none; b=oIvLPXK/D1c3OLN5KPnJ3FHmMQGq9I8CKlUjkR4iwDdQ0P5u9rzYmJcz7UD86ytrPWZ9l2nsOwvyhhNh+G/lIiyhh0LgrPIOZg2+vxxqpjeOogzxAQRTm0kVGd4Ml8Uy0Xh1OUHUC7zWgxSAlY3q/OdSq6wTbmxeEegl4oOr8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828164; c=relaxed/simple;
	bh=K8iq3wIWjw5+yzIUIuxBrpHJlXY5ubLt/wYdH1DHRac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EB558HGfIprPQUfm0Cn9NyD+LTHY4Od7iwYf0YTaMKLeI3qSLFbkvDDviJh6silJ0Sg3u2SoWFgongFpM7KIWekbTUAF3tp/G1AfcC+Y1cLHvCXMAsAlCybCUQyfxZnV5wvQKiqd2s/lNV7Db8OsyTBDhjQe+T6uw957dmPn2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=SV/yLK9B; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="SV/yLK9B"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2867840E0192;
	Wed, 21 May 2025 11:49:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id inqKgx3IRbsX; Wed, 21 May 2025 11:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747828155; bh=TnUQViyDsDpCUhgL+8ReWJseLBGKCHyxzaXt1yW5R78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SV/yLK9BK6kzHobkSeD9W8ayMe6vKdnLQ3qYdIe8UGeO/B0yFpsds8F3HYdzkBnas
	 Sh0fiwZN4f/aNHW9Nob2kxo1Mr+qhdjhVJsAK5OKSAsHnmtFYx6hH1m3EP0frMwnGo
	 9PCMIsqsuCsRIcd+7vMRlPkSu6sdeSkMe+5UfPgY09s2GdHaKkTCF4S16rodMDlJ+H
	 llxouLjViAvWs99C3wFpydlH0bocynKMCak9yn8wz4kiz4DUpdKQKhId+K5oPqUdp1
	 dNjIiYIusXMR4rusXMf8pt3CY1xGB55UQXHOaqwJzAjkmb/6rUQt24Nx8veklIMFeE
	 DocG2iu/WU1rwNTlOVBKW8c4yiY/p9fsjhxg1Nu/X40oqcUGWWSha0DM+XGbiAzPWF
	 XqPb4qFtuejp5Q8yOg4GlPC6k9weu3IyAq6yHuQ4sqi5kPljsH50Hjh5q/szILzjLm
	 +lC7LaRiBKJSkjJGaGwUVa+4YuzZB5q84ngMpixka16oWKNKH0jIocZC4VnNO3FA44
	 2OM/RqvCCEV7fDIf7yI8HJ5uuiXslIYCGVVL8qzxaKJkfL56oJIRpEc5oP4/bU39Nh
	 dYxyXrwJN6eWo3NR2RThKsv/QyCByfaVBMa8UsncVLXpF90qfu1IHHvRxEzILMZiCO
	 /UHqPFagYMfQ8mRmQFfDMMYU=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8658740E0163;
	Wed, 21 May 2025 11:49:02 +0000 (UTC)
Date: Wed, 21 May 2025 13:49:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, nadav.amit@gmail.com,
	Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 2/9] x86/mm: Introduce Remote Action Request MSRs
Message-ID: <20250521114901.GBaC29rWZ4IyVyZacP@fat_crate.local>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-3-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520010350.1740223-3-riel@surriel.com>

On Mon, May 19, 2025 at 09:02:27PM -0400, Rik van Riel wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> Remote Action Request (RAR) is a TLB flushing broadcast facility.
> This patch introduces RAR MSRs.  RAR is introduced in later patches.
> 
> There are five RAR MSRs:
> 
>   MSR_CORE_CAPABILITIES
>   MSR_IA32_RAR_CTRL
>   MSR_IA32_RAR_ACT_VEC
>   MSR_IA32_RAR_PAYLOAD_BASE
>   MSR_IA32_RAR_INFO
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/x86/include/asm/msr-index.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)

You can merge this one with the previous one.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
