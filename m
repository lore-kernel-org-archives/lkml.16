Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16E419ADA4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738645962; cv=none; b=O4N2TvRAUY9zPVLQaBvOpVAIKc2ljx62kGlHht7J6WA8fhWM01XK5xeoc4odlAJOZ50MQjeDZConRdW8eLaBO9ariIL277jv/l8VhTSfTuMUGtkEePyeMnPEBrBEBQjAdHNJfGrz/3Ag3YT60gn9zhEQU92B1uwnPDzCjIZM3gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738645962; c=relaxed/simple;
	bh=YeYpsYoxhAxaVbEQdPteRQD1B7aZzetuB2dmUJL1ZJM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UJTDvAO+nPaFmp7Y7bXfCx+xVR4cCxAlrYIi3U9P7Upb5ocYbYO5O1HDJTNMj7VaZuv3/xTJE+RNIVIywj92QlKF+kENcYZRaemTJxbnhlhdY8aIA+6w3MdJaP9ZgccsFy+09PwkFkc40RwU2URV69bsRpcolBuZjW8WtS0LkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=rNdYXA3x; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="rNdYXA3x"
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4BC93205493F;
	Mon,  3 Feb 2025 21:12:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4BC93205493F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738645960;
	bh=i1PcuCPypNqoRYTgrcu15A8bGKxxWYW+PFQ5/jXDbyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rNdYXA3xgoL0Mc8nz/JhXFytEBdJ7yqR+o4hzR01NF6chOSEiEM2Dc0PMplKaH1Xs
	 0ih3SImi13UluxBT3xA4JNKT02QvizlwqPyUp9ibx64Ns2PZpLKPJpkCSwK2A1fmi0
	 eNjvsjlDNcb6GC0dbwLQYhquQdWrH1l+a+CRQYXc=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: linux@rasmusvillemoes.dk
Cc: code@tyhicks.com,
	linux-kernel@vger.kernel.org,
	mcgrof@kernel.org,
	frkaya@linux.microsoft.com,
	vijayb@linux.microsoft.com,
	petr.pavlu@suse.com,
	linux@weissschuh.net
Subject: [RFC] Revert "kernel/params.c: defer most of param_sysfs_init() to late_initcall time"
Date: Mon,  3 Feb 2025 21:12:31 -0800
Message-Id: <20250204051231.1601897-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87tt9btbht.fsf@prevas.dk>
References: <87tt9btbht.fsf@prevas.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rasmus,

> On Thu, Jan 30 2025, Shyam Saini <shyamsaini@linux.microsoft.com> wrote:
> 
> > This reverts commit 96a1a2412acba8c057c041833641d9b7dbf52170,
> > as it breaks the creation of /sys/module/<built-in-module>/drivers.
> >
> > The reverted commit changed the initcall order for
> > param_sysfs_builtin() from subsys_initcall() to late_initcall(),
> > which impacts the module_kset list and its population.
> >
> > Drivers which are initialized from subsys_initcall() or any other
> > higher precedence initcall couldn't find the related kobject entry
> > in the module_kset list because module_kset is not fully populated
> > at this point due to the reverted change. As a consequence,
> > module_add_driver() returns early without calling make_driver_name().
> > Therefore, /sys/module/<built-in-module>/drivers is never created.
> >
> > This breaks user-space applications for eg: DPDK, which expect
> > /sys/module/vfio_pci/drivers/pci:vfio-pci/new_id to be present.
> >
> 
> :(
> 
> Unfortunately, the init time saved by the mentioned commit is important
> for some boards, and reverting that commit now will mean that some of
> those boards may spuriously fail to boot due to random timing and the
> external watchdog firing.
> 
> I wonder why this has taken 2+ years to be noticed?

Unfortunately, we couldn't detect it earlier, sorry about that.
I am fairly suprised no one else reported this issue.

> Since the problem is that /sys/module/vfio_pci is not (yet) created as a side
> effect of version_sysfs_builtin() and/or param_sysfs_builtin(), both of
> which use locate_module_kobject() to lookup-or-create that, maybe the
> code in module_add_driver() could be reworked to use that.
> 
> It's of course not entirely trivial, as locate_module_kobject() is
> currently __init and static, but that should be fixable if we want to go
> that route. Maybe it should be refactored a little to be callable from
> the builtin-module branch of module_add_driver(), but ignoring that,
> something like
> 
> diff --git a/drivers/base/module.c b/drivers/base/module.c
> index 5bc71bea883a..6b32c5fec283 100644
> --- a/drivers/base/module.c
> +++ b/drivers/base/module.c
> @@ -42,16 +42,13 @@ int module_add_driver(struct module *mod, const struct device_driver *drv)
>  	if (mod)
>  		mk = &mod->mkobj;
>  	else if (drv->mod_name) {
> -		struct kobject *mkobj;
> -
>  		/* Lookup built-in module entry in /sys/modules */
> -		mkobj = kset_find_obj(module_kset, drv->mod_name);
> -		if (mkobj) {
> -			mk = container_of(mkobj, struct module_kobject, kobj);
> +		mk = locate_module_kobject(drv->mod_name);
> +		if (mk) {
>  			/* remember our module structure */
>  			drv->p->mkobj = mk;
> -			/* kset_find_obj took a reference */
> -			kobject_put(mkobj);
> +			/* locate_module_kobject took a reference */
> +			kobject_put(&mk->mkobj);
>  		}
>  	}
>  
> It also seems to me that if a module has neither a MODULE_VERSION nor
> any module parameters, /sys/module/<modname> wouldn't be created as part
> of that param_sysfs_builtin(), regardless of commit 96a1a2412acb. So
> relying on that sysfs directory existing seems to be a little fragile;
> IOW I do think that module_add_driver() should itself ensure that the
> module_kobject exists.

I have reworked this patch as per your suggestions, will send it shortly.

Thanks,
Shyam
