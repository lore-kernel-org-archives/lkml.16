Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F9E13CF9C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751832805; cv=none; b=QCT75OJO0OA2Bi99UOV1bZlZHlsx36Uy9gB37hBJe65JjxyzqII90JpcF8U9LH2EJNM2WIkDHyrbxoaZ3FhFrP06V7RL9am9KHO/6bsN7D8e8bDPq+NFG1mq5jOjn0Dy1tzDHdwnKrpT7yxUPTsYidk1edx7ReC+crBng83RmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751832805; c=relaxed/simple;
	bh=b2Z6Cw3CvtduThWxNcXAPESEraqPypFnYVCx9gpNRJg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=INW7GxKASgV7UItozy3dIEN6bJHXdMSDMhV+EZDEY6POEpz16mbkVmsu2MebS+Ir6m3jqa7cw1505PwrY7RaOtqEZRkTPecjdPzsHXZb7KKFCB4UYIRSKk4v+rhmKXYg+bfeTfrFSLDC8MTi0Lq9oC9m6LSDptkZ6Uc2+HB82L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=pDUeYN6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pDUeYN6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DAEC4CEED;
	Sun,  6 Jul 2025 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751832804;
	bh=b2Z6Cw3CvtduThWxNcXAPESEraqPypFnYVCx9gpNRJg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pDUeYN6O/xtpa7hxsg/ypiWBPdmFP2W6xJf/edyvd2xoy3hnVlIdDj2CsY9nCN4L9
	 9sI9ra7eqVnil/hlirOmdDJ6BFin226AZNdtULCY/TxlpTjLwVF9NDg2dQKpgLbvFt
	 Tjm75VaC86WgsXBrr0ZdWhyI0IXqSrKf6LvNdXg4=
Date: Sun, 6 Jul 2025 13:13:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lillian Berry <lillian@star-ark.net>
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] init/main.c: add warning when file specified in rdinit
 is inaccessible
Message-Id: <20250706131324.613340ff7e99231c383409f5@linux-foundation.org>
In-Reply-To: <20250706185142.1294007-1-lillian@star-ark.net>
References: <20250706185142.1294007-1-lillian@star-ark.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Jul 2025 18:51:41 +0000 Lillian Berry <lillian@star-ark.net> wrote:

> Avoid silently ignoring the initramfs when the file specified in rdinit
> is not usable. This prints an error that clearly explains the issue
> (file was not found, vs initramfs was not found).
> 
> Signed-off-by: Lillian Berry <lillian@star-ark.net>
> ---
>  init/main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/init/main.c b/init/main.c
> index 225a58279acd..f391f62864a6 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1593,6 +1593,8 @@ static noinline void __init kernel_init_freeable(void)
>  	 * the work
>  	 */
>  	if (init_eaccess(ramdisk_execute_command) != 0) {
> +		pr_warn("WARNING: rdinit=%s is inaccessible or not existing, ignoring\n",

"is inaccessible or does not exist", please.

Is the "WARNING: " needed?  It's pr_warn(), which implies that it's a warning.

It would be good to display the errno itself.  This way people can just
look up the numeric value so there's no need for this code to expand it
into text.

Perhaps the kernel should have an strerror() for this sort of thing,
but I don't think we do.  The required table is buried down in
net/9p/error.c, for some reason!

