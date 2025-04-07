Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1704642D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009327; cv=none; b=uVpOCYEwzypmBF5ezbBH1nDlqRgF9KB6YGaxe+l3GRrxVpy+eaMSfvOtT3H/fxw6yuzTmOa3TIO1AwjhBFB8gGh231JPgf45pzamCbbC/eHq/UCwZGNDvyw7iMeYzy6hNmE90Ot6tEiUkz1Dk3E/4VZJdlbXVeLC5968FGk9BFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009327; c=relaxed/simple;
	bh=zAXkig2M6EwcCtpZSzMSmifZRAkE8ANEzH7KjbwpMBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmJDnGgWI3Xk9tjg5GU2jecUo0OUQ9MIauE3LR8jQco0gsDhY9yWRl0NTGhgyRp32KFOxxp5N8jUUkxrQ7xY1T68idG8ZnTfSBuERIN9ZKBrPFxOFqoGSvF/jJEST5s5XMY3OJqafSOfLP/uKzmTtGREAW5sVS5GCf6r7w+t7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h1thFlpx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h1thFlpx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4E1C4CEDD;
	Mon,  7 Apr 2025 07:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744009324;
	bh=zAXkig2M6EwcCtpZSzMSmifZRAkE8ANEzH7KjbwpMBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1thFlpxJIYCA76Yt5U65h3W04YH3QJm0qj7Sx0Qi9iWZWxfjaYnnbt4SSKliKtI3
	 c+5J8itnrcTnQFUBrCxNAiHTaoUcp2bIEkGBKekW/2r+3HJMTV3LMHGES0hs8+uFDR
	 nHrMHs01zcqWbZdE0q73nHMtazQUsNBxC2+o245k=
Date: Mon, 7 Apr 2025 09:00:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zhoumin <teczm@foxmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kobject_uevent: add uevent_helper exist check
Message-ID: <2025040731-eternity-statutory-4a80@gregkh>
References: <tencent_B971903B40AFCF5878B6532261672A5D6A0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_B971903B40AFCF5878B6532261672A5D6A0A@qq.com>

On Sat, Apr 05, 2025 at 01:31:02AM +0800, zhoumin wrote:
> The kernel creates uevent_helper process for every uevent sent,
> even if the uevent_helper does not exist. Before the rootfs is
> mounted, a large number of events are generated. This change
> introduces uevent_helper existence check to prevent unnecessary
> operations.

What problem is this causing?  What changed to make this actually be a
problem?

> Logs a debug messase before call_usermodehelper_setup.

I can not parse this sentence, sorry.

> e.g.: pr_emerg("action:%s devpath:%s\n", action_string, devpath);
> You will see a large number of uevent_helper processes
> are attempted to be created before the rootfs is mounted.

Again, why is that a problem?

> Signed-off-by: zhoumin <teczm@foxmail.com>

Please use your name here, not an alias.

> ---
>  lib/kobject_uevent.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index b7f2fa08d9c8..f3d34ded141a 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -28,6 +28,7 @@
>  #include <net/sock.h>
>  #include <net/netlink.h>
>  #include <net/net_namespace.h>
> +#include <linux/namei.h>
>  
>  
>  atomic64_t uevent_seqnum;
> @@ -58,6 +59,23 @@ static const char *kobject_actions[] = {
>  	[KOBJ_UNBIND] =		"unbind",
>  };
>  
> +#ifdef CONFIG_UEVENT_HELPER
> +static int uevent_helper_lookup(void)
> +{
> +	static int ret = -ENOENT;
> +	struct path path;
> +
> +	if (!ret)
> +		return ret;
> +
> +	ret = kern_path(uevent_helper, LOOKUP_FOLLOW, &path);
> +	if (!ret)
> +		path_put(&path);

What happens when the root filesystem changes to the new one?  This
feels wrong as Andrew said.

thanks,

greg k-h
