Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C9C20D4E9;
	Mon, 19 May 2025 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747686684; cv=none; b=eDd/U6ueJlCQABJi+wzbG/Jg2Jm06qHyYXWdfzVXzkvOh9Fyi/jinu6ONp6iLeLrpEoaTWCg5DXD9gnKyW3rGOLi61w/ikGozkf8ilNYH+j9NHgtRu5tJ1dAl/tQncnzNxaCeISRKcHZVtxR1p4Pi0KidhTTdemIhI5d31hj1iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747686684; c=relaxed/simple;
	bh=o9Q+59JiYzFW31MVr6WigWqHBOJKE/LpGuXeepKX3qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uBLtu5C/MxEGQwm2XjM3pL70+6R0OG6yGPvEJfYvBgLaaApetO3kXuAit5WC3DqAYyRZPjADlcYKP32pK2L00W8+qsPPjMcWNQXtovKfjsq3+N5EWHXND29sTfiS8yedMpSLoVn83KPrSeYxmcZ3asnz5/Qp5ZiQvmKtKJd1SPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hL+c+2u9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hL+c+2u9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=yoFAXZ4yOrSLmS+OCOfyEIpqBmihPeI+uV271tPkKAk=; b=hL+c+2u9ljMpTVtZN9FQvggAwX
	W+gFqdXmGylPRUpotCW6W/69Mp3GkRGz3dsmjXL9uxbnG0WXlnG+pFtgzmip1A2FFqOtd6iff+GDd
	GkVsPJUXbTo3rCNEMoAFzpu8endMmJCsl980pIGC6P7B/cTr6F5I57PHCR5uObC3mLQXB/8hdi89o
	TBDIq1gin2OazzlqoMHO4UnZ34W6VNFS/UjcxqaPODKuhON717LZ2T4trO+dKV9IzzWNqRPTGD+3X
	SlSYhLfDQ+MnSfx9e5DoGyAHd7HD2dHudv/+XdNfI3VGjgMH2XtCwrt7s8tkZidnuG1EQg9Bm8yvt
	23ms30dg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH78p-00000002Lb1-38Yz;
	Mon, 19 May 2025 20:31:19 +0000
Message-ID: <90d3653b-0106-4368-a003-6bb698aa42a6@infradead.org>
Date: Mon, 19 May 2025 13:31:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: powerpc: Add htm.rst to table of contents
To: Brigham Campbell <me@brighamcampbell.com>, shuah@kernel.org,
 linux-kernel-mentees@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250517210757.1076554-3-me@brighamcampbell.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250517210757.1076554-3-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/17/25 2:07 PM, Brigham Campbell wrote:
> These changes fix the following error, which was introduced by commit
> ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
> repository without any reference to the document.
> 
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/arch/powerpc/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
> index 0560cbae5fa1..53fc9f89f3e4 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -19,6 +19,7 @@ powerpc
>      elf_hwcaps
>      elfnote
>      firmware-assisted-dump
> +    htm
>      hvcs
>      imc
>      isa-versions

-- 
~Randy
