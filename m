Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE325D20A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194522; cv=none; b=fSzYE7N8fNU1x7aclw931IDUSfX0bCtTTSC7zOsQ69g8ZsXPO5G1c9BQVYKxEc9BV+rb39k02o9/ZcbB1AWVdA2zaqwAlGGxPZd63wPPFqv4+j9WfoqZFiHiqIYFdBak9roFc86qA0KiVXm+NvSag7pEamf0VfZOF9K0kKfVb0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194522; c=relaxed/simple;
	bh=kWX+TyuqdGVhjafFj4yZ/MP0mxs7HNGlHUeavs7YaK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lz8DmqFlzSauWGjQmVq2CYDkcpGRwBJClo4ujBXnoOFRyBKH+zD864K157Mfym/aMMTN8D3T0UgFw4akPQ+W1HNBHVrBH6T7s5uQhtKyh6Z07Ke9HVfJ14/i/cSxHhrCNaAeaalLL/xOQmvncukETseJ8oMywUwueb31PhoKK8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMYfU0na; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMYfU0na"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB727C4CEE3;
	Wed,  9 Apr 2025 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194520;
	bh=kWX+TyuqdGVhjafFj4yZ/MP0mxs7HNGlHUeavs7YaK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMYfU0na+sIxeBNitm8t90wJK4cHgDdZ6Idgf9855k3orCoB88IfJUQM6ckFew1Li
	 tWVDk7SanVVWETx8/kkJSvmXK4+jrWJbHJKpeEK2IAzkAuIvXKFSU1hFY6Dp1iNXrt
	 VvpHoRL++N1wlTyoZC+7TcTeP+bPmzYxRGGuBN7P7gEYr//yGVxggORVNv1F4jv2UX
	 275bcGj3g9YMD1GDZF5rVMsL9BJ9Z1Nod6qik/rcsktxdKqTxmXEFSkvMopjjmbQSh
	 qwKEhgdrUWWmEI8/QqehTOgVjsYm1fDpS4s7M8v5TYL9991sKRcFM0oQuNqzJRYX62
	 RvomICz8XEQTg==
Date: Wed, 9 Apr 2025 12:28:35 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v1 1/1] x86/early_printk: Fix comment for "pciserial" case
Message-ID: <Z_ZL04J10YbsBaYz@gmail.com>
References: <20250407172649.792996-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407172649.792996-1-andriy.shevchenko@linux.intel.com>


* Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> The comment seem contains the copy'n'paste error when mentioning "serial"
> instead of "pciserial" (with double quotes). Fix this. With that, move
> it upper, so we don't calculate buf twice.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/x86/kernel/early_printk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
> index dc053641698c..4a9ba7cb7e5a 100644
> --- a/arch/x86/kernel/early_printk.c
> +++ b/arch/x86/kernel/early_printk.c
> @@ -442,9 +442,9 @@ static int __init setup_early_printk(char *buf)
>  		}
>  #ifdef CONFIG_PCI
>  		if (!strncmp(buf, "pciserial", 9)) {
> -			early_pci_serial_init(buf + 9);
> +			buf += 9; /* Keep from match the above "pciserial" */
> +			early_pci_serial_init(buf);
>  			early_console_register(&early_serial_console, keep);
> -			buf += 9; /* Keep from match the above "serial" */

Note that I merged this into the other fix, in part because the title 
isn't accurate anymore, this patch isn't purely fixing the comment.

Thanks,

	Ingo
