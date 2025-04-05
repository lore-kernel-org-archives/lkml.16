Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7993625771
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743893528; cv=none; b=IFPaM26CVPcFR28lLN4ym0P9Vve45r51YFgHol/ebwPQUEEjrEpMOOTnaptU6O2fsCbnIQxsDRjdthHMT8JnKM1+qxDEKd3+GWa3ryaZ4DwuC17bBfE1BTczp22VtVUx/YAqFmGOw/v8LkufFsbvPAx6qG2H4hvaQOF/my3jZ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743893528; c=relaxed/simple;
	bh=37ierGzLms8gEL0XYMmMxMlfTj5nUKgmwzztyAPpT5M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TYibT4sDddp0G8JsOD6tXXViLkq2kemV74ccCrF9itoWUPb6ZUEOGtXNTTYyy7gL53cZV7jvPCUUHZjXQIG2Acpz8qvaTTI/cOtf1scVd5SDzkG91FBiuFEMKuGWSKuvmP3GMHtw9Z6RsFcnk3z9xNr/v6duInMJJFKLo7tYiy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0zLUwp8u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0zLUwp8u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB869C4CEE4;
	Sat,  5 Apr 2025 22:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743893528;
	bh=37ierGzLms8gEL0XYMmMxMlfTj5nUKgmwzztyAPpT5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0zLUwp8unbokB9HzwHURcnY3RWQPfZAvdgJVsdft2+9kOWj8Qu2YKHdfaIhlH8O1e
	 s+gw5OfEOBlNTIAzYS2AOinc/kJmoyomqWnw1pkxD6onNRCK5KByhTx4WqrghCpbjw
	 DMd2hzHhvTKF3V/N7Yk2MOabBcRITDXo+BBrI/48=
Date: Sat, 5 Apr 2025 15:52:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: zhoumin <teczm@foxmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] kobject_uevent: add uevent_helper exist check
Message-Id: <20250405155207.aac347bcdc56e43cb0cae3cb@linux-foundation.org>
In-Reply-To: <tencent_B971903B40AFCF5878B6532261672A5D6A0A@qq.com>
References: <tencent_B971903B40AFCF5878B6532261672A5D6A0A@qq.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  5 Apr 2025 01:31:02 +0800 zhoumin <teczm@foxmail.com> wrote:

> The kernel creates uevent_helper process for every uevent sent,
> even if the uevent_helper does not exist. Before the rootfs is
> mounted, a large number of events are generated. This change
> introduces uevent_helper existence check to prevent unnecessary
> operations.
> 
> Logs a debug messase before call_usermodehelper_setup.
> e.g.: pr_emerg("action:%s devpath:%s\n", action_string, devpath);
> You will see a large number of uevent_helper processes
> are attempted to be created before the rootfs is mounted.

Is there any measurable reduction in boot time?

> ...
>
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

Cached in a static variable.  So if a uevent helper later becomes
available, we won't know that and a reboot will be needed?

> +
> +	ret = kern_path(uevent_helper, LOOKUP_FOLLOW, &path);

I wonder if this is the official/preferred way of detecting the
presence of a file.

> +	if (!ret)
> +		path_put(&path);
> +
> +	return ret;
> +}
> +#endif
> +
>  static int kobject_action_type(const char *buf, size_t count,
>  			       enum kobject_action *type,
>  			       const char **args)
> @@ -610,7 +628,7 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
>  
>  #ifdef CONFIG_UEVENT_HELPER
>  	/* call uevent_helper, usually only enabled during early boot */
> -	if (uevent_helper[0] && !kobj_usermode_filter(kobj)) {
> +	if (uevent_helper[0] && !uevent_helper_lookup() && !kobj_usermode_filter(kobj)) {
>  		struct subprocess_info *info;
>  
>  		retval = add_uevent_var(env, "HOME=/");
> -- 
> 2.43.0
