Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C4B33993
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 22:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751841160; cv=none; b=maeuiDm0blSoWSVqj6mbY8g0gAiGtNb8559u/69DvVCocFVEyh8Vnm3GkzmkcZYuisbyC+h6sURasRzj03iqMDA5Gr/WLIEkhgY1h3xRaYnwYIeqg5uME3uf+uyLLsV4JUNEL5ieK67c1yXQU8z+NZnm5G6+PUP1M/XlDcRgs24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751841160; c=relaxed/simple;
	bh=gejE11SaGuvQ96Jr/ZaIlNVHQoypb1pDV1icjpK/kvQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UhzikZFLEv5UrZcZwynGtczCUJJH6ZwFIwBdW3zKKqldfKvAD52/caRWXtxiodMQZ+zOhXFhJcwmj92lDWLvGmz+zVuqTdgkggRzM6P5J36FrH9zm6nid4pULnUKkMlFjEnKFhFta5+WM2LumyyUrcER/JrnfVZtlhzEgvH3Vto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ge4p7mdp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ge4p7mdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ABCC4CEED;
	Sun,  6 Jul 2025 22:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751841160;
	bh=gejE11SaGuvQ96Jr/ZaIlNVHQoypb1pDV1icjpK/kvQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ge4p7mdpL7jWipWtRXL1hOujwN3TqmRGole3nbVVPlg4TUBUo8U0SsYYndz0h3PNp
	 +Trxo8RcRJsGJOAw7N6gGuvqOf4kUbEYNPe4+V3/t8vzq9iCbDZEW/n19UkeXwMuo4
	 qM00coDClbPsQlsk68macwJ5hcguUJIZrg7dE5pI=
Date: Sun, 6 Jul 2025 15:32:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lillian Berry <lillian@star-ark.net>
Cc: linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: Re: [PATCH v2] init/main.c: add warning when file specified in
 rdinit is inaccessible
Message-Id: <20250706153239.3be93aee4b0c8d43e025bd85@linux-foundation.org>
In-Reply-To: <20250706205738.1312194-1-lillian@star-ark.net>
References: <20250706205738.1312194-1-lillian@star-ark.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Jul 2025 20:57:38 +0000 Lillian Berry <lillian@star-ark.net> wrote:

> Avoid silently ignoring the initramfs when the file specified in rdinit
> is not usable. This prints an error that clearly explains the issue
> (file was not found, vs initramfs was not found).
> 
> ...
>
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1592,7 +1592,10 @@ static noinline void __init kernel_init_freeable(void)
>  	 * check if there is an early userspace init.  If yes, let it do all
>  	 * the work
>  	 */
> -	if (init_eaccess(ramdisk_execute_command) != 0) {
> +	int ramdisk_command_access = init_eaccess(ramdisk_execute_command);

hm, the C99-style definition is acceptable nowadays, but is rarely used.

> +	if (ramdisk_command_access != 0) {
> +		pr_warn("rdinit=%s is inaccessible or does not exist (errno %i), ignoring\n",
> +			ramdisk_execute_command, ramdisk_command_access);

Again, I don't think we should assume (or say) "inaccessible or does not
exist".  After all, init_eaccess() could have returned -ENOMEM. 
Something like "access(%s) failed: %d", maybe.
