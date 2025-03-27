Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47EF224242;
	Thu, 27 Mar 2025 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104186; cv=none; b=AfrTqSfEEpCoV+VVIT17KykqmZfgfldOl6GCk92EnicaG6HuXC8nlB7Rr8VMX85f94hR/qoMzpaPDWLkd8e39Fv2LPyvAtt2r6mj+XuDKI2bD+/Wyxmg5H7cXP1FbQyZfxcdwKqmxeAoVO18Mw/Q+TxAW90XUegb69zsiRtNYis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104186; c=relaxed/simple;
	bh=hfqieFEwNm+tDHwi7gJU2irVgal6ugfPESMToOGaQx8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dCfKSutfrnbNP88YIEV75tEXIylKHYk7GjSMERoPTRcO9AsEdZwSFYzarFsrRh4r1YEaYqlTGgWrM9z9VduT4dndB4cR8dSuVw/dQCz0AawBWSdsPoc/tkrwIVU9IdXxG6WZx6SzxP4EDaA/vtPedTzZkAosuKIX+DcdPDh89As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wAseErxv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wAseErxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F67C4CEE5;
	Thu, 27 Mar 2025 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743104186;
	bh=hfqieFEwNm+tDHwi7gJU2irVgal6ugfPESMToOGaQx8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wAseErxvF0eqgqbc1+iMobmw/0QY9Q1xxoTOC0Y/mxlnzHzchQVsl8IaB34977HJF
	 u5F9B9OQSn7EzKQNRUkyO0eGG7SWvLyFGp4WrMSUcARmpJ7fU/j0ezhPFuvhBx+gD0
	 CNgV8YhGPtRJonuMh/IqDDue98rlDRIe0JJgcae8=
Date: Thu, 27 Mar 2025 12:36:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 mm_cmdline_setup+0x94 (section: .text.unlikely) -> memblock (section:
 .init.data)
Message-Id: <20250327123624.bd59f1307d5c5b29b1b9ac08@linux-foundation.org>
In-Reply-To: <20250327011312.mj55byrfatiprddh@master>
References: <202503241259.kJV3U7Xj-lkp@intel.com>
	<20250327011312.mj55byrfatiprddh@master>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 01:13:12 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:

> Since it is only used by mmu_init() which is annotated by __init, I think the
> proper way is to add __init to mm_cmdline_setup.
> 
> 
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index 4520c5741579..e98cfaf1c62b 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -143,7 +143,7 @@ int page_is_ram(unsigned long pfn)
>  /*
>   * Check for command-line options that affect what MMU_init will do.
>   */
> -static void mm_cmdline_setup(void)
> +static void __init mm_cmdline_setup(void)
>  {
>  	unsigned long maxmem = 0;
>  	char *p = cmd_line;

That's a correct change anyway.  Please send along a patch sometime?
