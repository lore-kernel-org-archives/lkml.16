Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0A1FF7AA
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588566; cv=none; b=XhCj9sPq3Fy7uLZ17egXJlXQ7ubVZcjZlbHOmyVQaoGoG86CsjTJuZZX+Hpwfq/WIFpgbIribHQYFQnxqL5DOUxWHgy3QNH4msIvjVXhkqmcMq7iAAXGfgTQgBziPtYXDxU4x7jgr/XHWZCDMptTX2evJf6IpiNqH1ugPmqFbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588566; c=relaxed/simple;
	bh=08borddFSrwZKYtlZQqsd1um7tW/nbxO68XIvkWawaE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vCyUZSxCou65pGjKnEonPzEikWH8DgxsW2GjA2cSD6+qVoEFjH8BO0k/DLMrPT5n9m0rAkb7Ri2OcWUBXuAuxfIRpDN7SBLicOSV5whXXU0pSp1vVXKIVBL6kGo8T7KKcFW1ydLGrq9Liq2eYadVcJu4tKg059q07CZiwt7QB6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=Y0A0kDBn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="Y0A0kDBn"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3778bffdso4377050e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1738588560; x=1739193360; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pfckFzvItk0hNmIizP+/PTE1LXnLDuRGcRyVhadSZO8=;
        b=Y0A0kDBn4PNxjIjCGBTpYjCrft5lAIkMLAxzuUV+bl7X+vMqm4mVjmBgT8MADGOHlS
         HoQ2+YlxChuZSA1hqGnoZVa8NRxIM/ZNe/e2XRECRzbQFVCPy0F4vJgkiSLIyMohpqTC
         lEZOxCE5PptIYf2J13qV5fhk5w/LB1IK2N0RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588560; x=1739193360;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfckFzvItk0hNmIizP+/PTE1LXnLDuRGcRyVhadSZO8=;
        b=h07/W0rpiyh7ECJdMTi2lwQRFbRGKay5Mgo7D/rVDcKoQblzaaKLb+vfDrgPefypVn
         ZCOHYKSyyDAhMmYM11RzL1HHKKqwwKhclZSho0UXpEeOeKeN26d9JABDEZy23DsPXv6l
         vQM4VBn0FV6NuvaVnvl+mQ7dsaok0FDFYxOM2d4MpqAY2ElnxknOem5HtN81rs9AAhRD
         WLhxh83h5xz2dIRJp7zOGCft7bX4+QTtHd5WQIp3mYIvY2593sJE7g8kKOU/UJl9q1+y
         2ks9bW7FHaFnS5m+4ndbFWrR9YRbZHmBZ9c6lXfTFgajLZwqu8fTI4TyKIEJ9yi0gLdk
         51IQ==
X-Gm-Message-State: AOJu0YycH69XWPZiMUKzi6unjBiByR4Jf3dKCIQjslRdkghSl3RKw/GI
	NunZiqwmO+a0t/UaK/ozi/DBfQ7N00UdC4oZX72lS71Z0ElqMSRFnmnX5buG5gzUZT/NqFNIwEt
	oczOiHg==
X-Gm-Gg: ASbGnctxx/NKoRnN9LDNzLWmCKF1UaBphKipGWthxiqR0lTbHKmms0XeVHa1EBtdYGz
	NIYXc15sMMnwV7g0VKmtebIrhhJq3Ylu6SZFofVofcZaD9QD7QEG4UIh66c2CAxTGBbD5vtyG48
	lHnM8DUgejO7HUiKz4f8woArq/ldgtPg6Q3ZjzJmsWGc9mJCYbXunzXsqJrqQKbyOfaxG+MjurK
	HmtdFwsVRYsrx/Z41cfoYlNtRfoKreIIOAt3zJUvsU6ygJ2C2NpG5dZMW044Cmd4D/6kVZLYxOA
	hyjoZ5JkX8aDaxcr
X-Google-Smtp-Source: AGHT+IHE5dQM69yaUnIuxzrJ4MuV2Q8OYWDzXeY5HJI5qWjG5k8o3Dqc3VpN1UdLsO40bEp7uGAA4w==
X-Received: by 2002:a05:6512:138b:b0:542:2990:6e9b with SMTP id 2adb3069b0e04-543e4be9726mr6735826e87.14.1738588559588;
        Mon, 03 Feb 2025 05:15:59 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-543ebe0f7b1sm1289580e87.57.2025.02.03.05.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:15:59 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org,  mcgrof@kernel.org,  code@tyhicks.com,
  okaya@linux.microsoft.com,  vijayb@linux.microsoft.com, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC] Revert "kernel/params.c: defer most of param_sysfs_init()
 to late_initcall time"
In-Reply-To: <20250130225803.321004-1-shyamsaini@linux.microsoft.com> (Shyam
	Saini's message of "Thu, 30 Jan 2025 14:58:03 -0800")
References: <20250130225803.321004-1-shyamsaini@linux.microsoft.com>
Date: Mon, 03 Feb 2025 14:15:58 +0100
Message-ID: <87tt9btbht.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jan 30 2025, Shyam Saini <shyamsaini@linux.microsoft.com> wrote:

> This reverts commit 96a1a2412acba8c057c041833641d9b7dbf52170,
> as it breaks the creation of /sys/module/<built-in-module>/drivers.
>
> The reverted commit changed the initcall order for
> param_sysfs_builtin() from subsys_initcall() to late_initcall(),
> which impacts the module_kset list and its population.
>
> Drivers which are initialized from subsys_initcall() or any other
> higher precedence initcall couldn't find the related kobject entry
> in the module_kset list because module_kset is not fully populated
> at this point due to the reverted change. As a consequence,
> module_add_driver() returns early without calling make_driver_name().
> Therefore, /sys/module/<built-in-module>/drivers is never created.
>
> This breaks user-space applications for eg: DPDK, which expect
> /sys/module/vfio_pci/drivers/pci:vfio-pci/new_id to be present.
>

:(

Unfortunately, the init time saved by the mentioned commit is important
for some boards, and reverting that commit now will mean that some of
those boards may spuriously fail to boot due to random timing and the
external watchdog firing.

I wonder why this has taken 2+ years to be noticed?

Since the problem is that /sys/module/vfio_pci is not (yet) created as a side
effect of version_sysfs_builtin() and/or param_sysfs_builtin(), both of
which use locate_module_kobject() to lookup-or-create that, maybe the
code in module_add_driver() could be reworked to use that.

It's of course not entirely trivial, as locate_module_kobject() is
currently __init and static, but that should be fixable if we want to go
that route. Maybe it should be refactored a little to be callable from
the builtin-module branch of module_add_driver(), but ignoring that,
something like

diff --git a/drivers/base/module.c b/drivers/base/module.c
index 5bc71bea883a..6b32c5fec283 100644
--- a/drivers/base/module.c
+++ b/drivers/base/module.c
@@ -42,16 +42,13 @@ int module_add_driver(struct module *mod, const struct device_driver *drv)
 	if (mod)
 		mk = &mod->mkobj;
 	else if (drv->mod_name) {
-		struct kobject *mkobj;
-
 		/* Lookup built-in module entry in /sys/modules */
-		mkobj = kset_find_obj(module_kset, drv->mod_name);
-		if (mkobj) {
-			mk = container_of(mkobj, struct module_kobject, kobj);
+		mk = locate_module_kobject(drv->mod_name);
+		if (mk) {
 			/* remember our module structure */
 			drv->p->mkobj = mk;
-			/* kset_find_obj took a reference */
-			kobject_put(mkobj);
+			/* locate_module_kobject took a reference */
+			kobject_put(&mk->mkobj);
 		}
 	}
 
It also seems to me that if a module has neither a MODULE_VERSION nor
any module parameters, /sys/module/<modname> wouldn't be created as part
of that param_sysfs_builtin(), regardless of commit 96a1a2412acb. So
relying on that sysfs directory existing seems to be a little fragile;
IOW I do think that module_add_driver() should itself ensure that the
module_kobject exists.

Rasmus
