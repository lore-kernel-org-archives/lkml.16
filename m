Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD11FF1C5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039980; cv=none; b=kfLfUfsKBA/14ZFRnvb22CFBi4/OQHD+qR9GDhQhe6N6wVtty0gPFtljmwPkpsn2UQcsri0OqCIaWRr7Qxv2s2RVnfhnVSRHLOdeC+LzVhYF5rVTlrqEMgYyY23R8Z6Rp/xv2Vov9HGE8UJIFEhf/asuJp/Dynxv0C4JTf3OcTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039980; c=relaxed/simple;
	bh=TY6heNeFM1OOuzrectrcS0JXw2w9T2gE6uc5pVQU444=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=DGY5BKe8u2XYJIKEulEZB1mE1xhZXF9wy2RMyscKRsKeBlwyN9jh1DSmPsu+22TvB+mXflYqiFFbzpKhODALDCl3lAC/LWtqSYRUmZCib0WQugz4x0/Fu9NIauEpO0tos+QsZ5LUvWDpdJqeNg2yqHA8tU3JyPmiwMtwUJOnZEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=qzldn2AC; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="qzldn2AC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744039668;
	bh=pqBg53Ns1xja7oMx811o/GQNHkknbYjQH3SS9D1/k0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qzldn2ACw/ucc4A4Fvm8pJdM6MUnUNDUPe+ZtXh/6VL0SB+PNMrnBOZy5ahIFEU/R
	 EmzRuA7Ao0WtqxhRqzCPRXuwhM7PhvR8xPmsFRAk4rgLsyLcqaEKhyyF6fFAjrn+vx
	 CdqhbW+L8dAnJZjNs75Hf4e2Ia7hPwRnnaJAe9dw=
Received: from localhost.localdomain ([116.148.99.229])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 4C821AA8; Mon, 07 Apr 2025 23:19:08 +0800
X-QQ-mid: xmsmtpt1744039148tfye3nbng
Message-ID: <tencent_019E709405D8474A5D5A21E429D046331808@qq.com>
X-QQ-XMAILINFO: NafziRg7Bx69DXcLapSd2zOb5dkWppsWdezpsk7Ta9NrjuCRQ0LFWOaJgJfOAb
	 J4aavbUiFZRgsJWRxqFhn8adlTJ04J4y1B1abnXRvzc52TYursDI7TEOOjt//bUNWN9dbylPOr1V
	 8BSNiNygfNYiGccFjC7FvGs8gHY24yUAN4KDl9IS5GSCmU9stAshMKShUvV9JZ8eKufCgtnH08E6
	 9zu1ysJlbJ4xmyEfNf5vhcXdS/3eP/1sHE3cZayZ5expSDzzTvT8MJsdjvYY2Hnmkr1dSyeIXDju
	 +Q9tMUcLexVSD/QiXcxf+63VskoWvaWrl2vuuYqWcXpc+NkNiOUpuMsIEX7eO4r4XpbC+Y3+t4YV
	 ovb1R2BLpJVyc53bbGTfB+k/EcdIT9Svzdv/2MwK+5eQ9WUwHG8ZzBjAuI2pMq5hiaGWnGau9Yy+
	 ZnIDI5k0JHAS9ustNLlEbGoA/qiR7xPpKMxQCRWc0J5sqiWmI413Wwih4HHfmmO5opxWsIOtV5GW
	 GzoMaHTtX7SOOl5YqKwLVMjOkqvju5OOlCKeLCQHigFrIfsjazZnzrGiRRw5Pc6tVrRaQvkyK1I0
	 I9Y5LkMp2S0Yyar4n1+ebB3V9zc6ZSE6rL4kreLwKrf/iF1qqrLCDwJtciBUUg4g+keYDpYA3dAM
	 K5SLJ/Rs4YoraQFHri8bALv0hmhtNaCnk9y23S923DjsYnfjQRbFQkV4BzgVs8oQEI324MXH+SgY
	 EKLBVz4PTQbCsf1DjIcon5mzJ0Fl4HaIFA1L2Q8rQy+PthUfPOz/jp+P6otIAql/dMZScJahEJrZ
	 Gob3sVUEEraaEqHO38JFFMh1gmputubYvC+Ly8nv1ErsJRAfboi8dDVdujEbEgWxHhIObUh63D7n
	 tuCPwZtbecSgkoipZ1E1g6LGEOmMUTuuCmDJ3CYK4pcN/H7F4oG+vnyYXrSmvpE2MEK2Fq+gA5nR
	 W/1SQ8hAp6kl0cyjS9fggjr/Ed1w6I
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: zhoumin <teczm@foxmail.com>
To: gregkh@linuxfoundation.org
Cc: dakr@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	teczm@foxmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] kobject_uevent: add uevent_helper exist check
Date: Mon,  7 Apr 2025 23:18:12 +0800
X-OQ-MSGID: <20250407151812.116592-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025040731-eternity-statutory-4a80@gregkh>
References: <2025040731-eternity-statutory-4a80@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

I appreciate your patience in addressing this.

> > The kernel creates uevent_helper process for every uevent sent,
> > even if the uevent_helper does not exist. Before the rootfs is
> > mounted, a large number of events are generated. This change
> > introduces uevent_helper existence check to prevent unnecessary
> > operations.

> What problem is this causing? What changed to make this actually be a
problem?

I think calling uevent_helper before rootfs mount is pointless and waste
time, because uevent_helper does not exist at that stage. For example,
fs_initcall(chr_dev_init),subsys_initcall(usb_init) and etc, these module
run before rootfs_initcall and will trigger kobject_uevent when
uevent_helper isn't ready.

However, I've discovered this issue was already addressed by commit:
<b234ed6d629420827e2839c8c8935be85a0867fd> ("init: move
usermodehelper_enable() to populate_rootfs()")

Due to my device running an outdated kernel version, this change wasn't
immediately apparent to me.

But I propose we should make call_usermodehelper_exec fail earlier, link
this:
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -610,7 +610,7 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,

 #ifdef CONFIG_UEVENT_HELPER
        /* call uevent_helper, usually only enabled during early boot */
-       if (uevent_helper[0] && !kobj_usermode_filter(kobj)) {
+       if (uevent_helper[0] && !usermodehelper_disabled && !kobj_usermode_filter(kobj)) {
                struct subprocess_info *info;

                retval = add_uevent_var(env, "HOME=/");


If this is helpful, I can submit a follow-up patch.

> > Logs a debug messase before call_usermodehelper_setup.

> I can not parse this sentence, sorry.

What I'd say is to add such a line of debug logs.

> > e.g.: pr_emerg("action:%s devpath:%s\n", action_string, devpath);
> > You will see a large number of uevent_helper processes
> > are attempted to be created before the rootfs is mounted.

> Again, why is that a problem?

Like I said at the beginning.


> Signed-off-by: zhoumin

> Please use your name here, not an alias.

This is the Pinyin spelling of my Chinese name.

> ---
> lib/kobject_uevent.c | 20 +++++++++++++++++++-
> 1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index b7f2fa08d9c8..f3d34ded141a 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -28,6 +28,7 @@
> #include
> #include
> #include
> +#include
>
>
> atomic64_t uevent_seqnum;
> @@ -58,6 +59,23 @@ static const char *kobject_actions[] = {
> [KOBJ_UNBIND] = "unbind",
> };
>
> +#ifdef CONFIG_UEVENT_HELPER
> +static int uevent_helper_lookup(void)
> +{
> + static int ret = -ENOENT;
> + struct path path;
> +
> + if (!ret)
> + return ret;
> +
> + ret = kern_path(uevent_helper, LOOKUP_FOLLOW, &path);
> + if (!ret)
> + path_put(&path);

> What happens when the root filesystem changes to the new one? This
feels wrong as Andrew said.

If a user performs actions like chroot into a new rootfs that lacks
uevent_helper, this should be considered a rootfs configuration error
rather than a kernel issue. The kernel shouldn't handle missing helpers
at this stage.

Apply to the question of another mail.
Link: https://lore.kernel.org/lkml/2025040731-eternity-statutory-4a80@gregkh/


> > > Is there any measurable reduction in boot time?
> >
> > This depends on the number of uevent and the performance of the device.
> > In fact, I found this issue during a project to optomize boot time,
> > and on my embedded device, it can be optimized by at least 2 seconds.
 
> So you are spending 2 seconds in failing to lookup the uevent helper
> path? That feels really wrong, how long does your boot take overall?
> What % is 2 seconds?

The measurements were taken on a device running kernel 4.4.65 using
/proc/uptime. The 129s average boot time served as baseline for comparing
the time difference before and after the changes, though this metric is no
longer the primary concern.

Would you like me to submit a formal patch with above changes.


Best regards,

zhoumin

