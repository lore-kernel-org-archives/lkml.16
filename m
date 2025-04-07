Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263F1FF7B9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040225; cv=none; b=WvQqsgFXQovUW5GbLQVpo67Jw0ONv/qOiAUK9URLw0CsCC45Acv7c3zRyhOC/QOyIk2X6oGhPKLsgUY9NsG7Amgo0mnGQXRO2Piv7YBEmR6ffmKWn8y5XiwgCAKIQ4dZieQwHZXXTlWPlNaCVIfVZ9e6oo1uOeKCiTZi50zPrNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040225; c=relaxed/simple;
	bh=rCQcg6yyF7kniuKX843J+ZjI6DR0Er7uUAVQn7o4iEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjRXEjXFrvH+O/xkQqU7K0FIEAVqiZJvDYhOTBnM3yT7M9ARd9h58U/DBHBjHKeeRG9bX8MbehnGPPHTYtOzF2C2q779/j0bbIKsjXkPWAbqgmBgTWu1M2djCZt81YeAQJRFpAef6WdmFZ5UqVUZHvzIEiy/Sshm4G66D5zyJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wDR1xPbR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wDR1xPbR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4600CC4CEDD;
	Mon,  7 Apr 2025 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744040225;
	bh=rCQcg6yyF7kniuKX843J+ZjI6DR0Er7uUAVQn7o4iEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wDR1xPbREGqnj38US78Hk428icCQmacjxdgj+xWubK/USWHP5QOBC3BMw184GSjix
	 spS8ksKIjZ3b/DXqFWQZYlH/ht9HoDStWzfJESERZMtZdw+q4WfZ6rPO+HEqd2f9KB
	 TK+0sWHYbUJzrwiL0//3n1RawhiWb6+9PKDA3+Hs=
Date: Mon, 7 Apr 2025 17:35:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zhoumin <teczm@foxmail.com>
Cc: dakr@kernel.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, rafael@kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] kobject_uevent: add uevent_helper exist check
Message-ID: <2025040743-kick-computing-0ecd@gregkh>
References: <2025040731-eternity-statutory-4a80@gregkh>
 <tencent_019E709405D8474A5D5A21E429D046331808@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_019E709405D8474A5D5A21E429D046331808@qq.com>

On Mon, Apr 07, 2025 at 11:18:12PM +0800, zhoumin wrote:
> Hi Greg
> 
> I appreciate your patience in addressing this.
> 
> > > The kernel creates uevent_helper process for every uevent sent,
> > > even if the uevent_helper does not exist. Before the rootfs is
> > > mounted, a large number of events are generated. This change
> > > introduces uevent_helper existence check to prevent unnecessary
> > > operations.
> 
> > What problem is this causing? What changed to make this actually be a
> problem?
> 
> I think calling uevent_helper before rootfs mount is pointless and waste
> time, because uevent_helper does not exist at that stage. For example,
> fs_initcall(chr_dev_init),subsys_initcall(usb_init) and etc, these module
> run before rootfs_initcall and will trigger kobject_uevent when
> uevent_helper isn't ready.
> 
> However, I've discovered this issue was already addressed by commit:
> <b234ed6d629420827e2839c8c8935be85a0867fd> ("init: move
> usermodehelper_enable() to populate_rootfs()")
> 
> Due to my device running an outdated kernel version, this change wasn't
> immediately apparent to me.

Ah, great, let's just stick with the change that we already have.

> But I propose we should make call_usermodehelper_exec fail earlier, link
> this:
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -610,7 +610,7 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
> 
>  #ifdef CONFIG_UEVENT_HELPER
>         /* call uevent_helper, usually only enabled during early boot */
> -       if (uevent_helper[0] && !kobj_usermode_filter(kobj)) {
> +       if (uevent_helper[0] && !usermodehelper_disabled && !kobj_usermode_filter(kobj)) {
>                 struct subprocess_info *info;
> 
>                 retval = add_uevent_var(env, "HOME=/");

Why?  Will this actually change the speed of anything?

> > Signed-off-by: zhoumin
> 
> > Please use your name here, not an alias.
> 
> This is the Pinyin spelling of my Chinese name.

No reason you can not just use the Chinese spelling of your name either :)

thanks,

greg k-h
