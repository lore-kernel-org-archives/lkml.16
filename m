Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E9207E17
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523509; cv=none; b=sMOkf4qMhprBnok44nRFD0zZOZB8h3y6yipzgyYbkYM+qZ0OvXO6YG7Et9gbs1koW/03a/2UnguFQ7ooLCg5JFR/KIrpRsKGSCaw3o513rEnfwe933GqpaKUUplEWBL/QseHkqXs8cQ70A8ma4tiilUGuu4iwNzdX3ZMvL1+src=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523509; c=relaxed/simple;
	bh=JKGV/HE8s2MiNHVCf6nIAZZlRulirAfRS40CSapL+FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4slAPJKS1RBV4PbEKkmKCg6cL2zUIDdR5PdPIwc5kXyQO4bClpluhJEdAbGqVsaPCJwP2fyHvZHQoTGTAO7A0px4O0P2lI6t/Vj38ZHHg6b/Jr1AUW6VpQ3T2jHnWMB8hM7tIHo60Vli17Vy7y+JLdsXPXKKOUKsEdH4BRDdts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bWUOSZ+5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bWUOSZ+5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2254e0b4b79so148048775ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743523506; x=1744128306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFNB2u+Jq0XgQ92wKIP4w3p3FD79rfTJS0OE22jRGyo=;
        b=bWUOSZ+5tG9jiKnAjEfQq0l6Wcnc4R+0XGl49bDC+VDvJgnByvIiLk9OORehGgPXOD
         jLDZoi5paixNyB9/0hRU9bRo/oVo2vDaTkp8PXTAxCtESBIyZwt9V9nrqsQE3cPN8x14
         UcgXUflMdGSg0zcjwkZcc48XZNy6i5ETaW/J6m4Qbm/Hbvsdv5jtmBfrlbxQEvjFTusf
         HOKR9qqxH68LcGHrMV/0WQQ+iTjtCkFZu0vXz/hir1bUMbteqBgOhOwTsHZoKVBRx3GC
         Ci1lalQkr5QSYZkSslmdrlDunwD1aVaDThGk8rTjnd9cP8JEZa7FWQKUIxHsWg5WtG2d
         ojPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523506; x=1744128306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFNB2u+Jq0XgQ92wKIP4w3p3FD79rfTJS0OE22jRGyo=;
        b=E2M3+JQbt1eLpfHgqPsH9/JpGiTPPTdJhMKYv9Of0OzEvhdcRAzC2bcD4KupPqvLAk
         JjrQcu8rkwHM2oX030z5KNYu51iWAr0JpA7Y/ytt1TjzCTGn1qf9d+0VANtyjIzBhPH2
         RFijxoMKbHn2r2YFGhwn/N9aeGcCtPGzG9xrZ9LUjX3Q/lY5ZMruvJOA2u1peWe0WeS6
         4dl7bPweZARI78CcKV4lsz6eo22uoMZY/8baYAvFOq5+VS9tbATMmP7Lu3FP2qpPOMqU
         /CpFIoZAkjbnRIhj4lt3aH6wnLR1kVaen/DsVHJ1Y5WMbGp6pfudXCchlA5xF2oounuT
         hhjg==
X-Forwarded-Encrypted: i=1; AJvYcCWVhMFnT4ZvHWRIeE6toDkE4F7XTD+TJX0TECC8mMxiVJwTiATPWTNxplRsGfW8hRuo6HjB90qnVoYQclM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9yeEMPETwBKpw1Y/V7Ns3980hO1pMGTJSYV0xFkO85eWCFImQ
	Q+sPAFpuIxVox2Sj3cw+PszWshmuP18J5x8duV8OQVi4M6XPQzNxZA+Z8gHrQYM=
X-Gm-Gg: ASbGncvQwBclBPE4WkP3jb98W3Js38foQtsiGO/ZtBHRY3mvNTG0HMuiu0XlXucOoxb
	p7B3R6aHeC5ADZ5pgjo9RL235ZbeMIKLXsjHn+w6T+DxH44of9CbFmMXhNLU8r+UKI0JeSzjsMw
	W6fWmkxTQY/2yF86cBw8BStQg56HkCmi0ZWqIk7PpjDpFkMT6Ar4zL1unXgyMLvIMszizakvdE4
	c7xX6c9UHnVYw6VYcO86zuwWmyAhpda4sA0lHULGUmCEYrdEbcXo0EVMdPiHvTlnqabT1wlrvTa
	73Z9hMOdiE7ERJ2rEOd7lhcNH/SKCysMcbTnYRrb6vkfsHyR+hwWrQr2nEc=
X-Google-Smtp-Source: AGHT+IHPmC0WRX5zUVPoKzYv+XJIdht7DaJKNRBPtjW/Kw3LIJfP+s1inXgIKZKxTjo4SvpqGAldfA==
X-Received: by 2002:a17:902:e745:b0:220:e655:d77 with SMTP id d9443c01a7336-2292f9f403bmr230920785ad.36.1743523506409;
        Tue, 01 Apr 2025 09:05:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:62bf:3c83:f3df:dc76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee1b3fsm89974935ad.74.2025.04.01.09.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:05:05 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:05:03 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <Z-wOr3eLaX9myqb4@p14s>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s>
 <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s>
 <20250401014124.GB15525@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401014124.GB15525@nxa18884-linux>

On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
> On Mon, Mar 31, 2025 at 09:40:41AM -0600, Mathieu Poirier wrote:
> >On Sat, Mar 29, 2025 at 08:56:29PM +0800, Peng Fan wrote:
> >> On Fri, Mar 28, 2025 at 08:14:41AM -0600, Mathieu Poirier wrote:
> >> >On Fri, Mar 28, 2025 at 12:50:12PM +0800, Peng Fan wrote:
> >> >> On Thu, Mar 27, 2025 at 11:46:33AM -0600, Mathieu Poirier wrote:
> >> >> >Hi,
> >> >> >
> >> >> >On Wed, Mar 26, 2025 at 10:02:14AM +0800, Peng Fan (OSS) wrote:
> >> >> >> From: Peng Fan <peng.fan@nxp.com>
> >> >> >> 
> >> >> >> There is case as below could trigger kernel dump:
> >> >> >> Use U-Boot to start remote processor(rproc) with resource table
> >> >> >> published to a fixed address by rproc. After Kernel boots up,
> >> >> >> stop the rproc, load a new firmware which doesn't have resource table
> >> >> >> ,and start rproc.
> >> >> >>
> >> >> >
> >> >> >If a firwmare image doesn't have a resouce table, rproc_elf_load_rsc_table()
> >> >> >will return an error [1], rproc_fw_boot() will exit prematurely [2] and the
> >> >> >remote processor won't be started.  What am I missing?
> >> >> 
> >> >> STM32 and i.MX use their own parse_fw implementation which allows no resource
> >> >> table:
> >> >> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/stm32_rproc.c#L272
> >> >> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/imx_rproc.c#L598
> >> >
> >> >Ok, that settles rproc_fw_boot() but there is also rproc_find_loaded_rsc_table()
> >> >that will return NULL if a resource table is not found and preventing the
> >> >memcpy() in rproc_start() from happening:
> >> >
> >> >https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1288
> >> 
> >> 
> >> Sorry, I forgot to mention below code:
> >> loaded_table is a valid pointer for i.MX, see
> >> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/imx_rproc.c#L666,
> >
> >(SIGH)
> >
> >The changelong for this patch says "... load a new firmware which doesn't have a
> >resource table..." and now you are telling me that @load_table is valid.  As
> >such I have to _guess_ that @priv->rsc_table is not null.  So which is it -
> >valid or not valid?  
> 
> As wrote in commit log, bootloader kicks the m7 and m7 publishes a valid
> resource table to a fixed address.
> 
> When linux boots up, first stop m7, then load a new firmware which does not
> have resource table, then stop m7.
> 
> Even the new firmware does not have resource table, the imx_rproc driver
> still returns a valid resource table address which is got from device tree
> (rsrc_table) in imx DTS when the driver probe.
> 
> @priv->rsc_table is always valid even the firwmare does not have a valid

And that is where the problem is - why can't that situation be fixed instead of
pushing it to the subsystem core?  Why can't you have code in
imx_rproc_elf_find_loaded_rsc_table() that checks if there is a valid resource
table at the address held by @priv->rsc_table and return NULL if there isn't?

The core is already checking if @loaded_table is valid in rproc_start(), why
can't that be used instead of adding yet another check?

> resource table. The TCM area is not writeable by Linux, so the firmware will
> copy the resource table from TCM to DDR if the firmware has a resource table.
> 
> Hope this is clear.

What is clear is that I spend 4 sessions on a 3-line patch, valuable time I
could have spent reviewing other peoples' patches.

> 
> >
> >If my assumption above is valid than fix that instead of hacking the remoteproc
> >core.
> 
> I just found V1 was picked up by Bjorn.

I am currently working with Bjorn on that.

> It is not hack, clearing table_sz in core code does not hurt, I think.

It is a hack for as long as you haven't provided a valid explanation for the
changes you are proposing.  

> 
> If my assumption is not valid the changelog and your justification for
> >this patch are wrong.  Either way I have spent way too much time on this patch
> >already and dropping it.  The same goes for your other patch [1] - resent it
> >when you will have properly address the work herein.   
> 

And yet you just sent a V2.

> sure.
> 
> Thanks,
> Peng
> 
> >
> >[1]. [PATCH] remoteproc: imx_rproc: Add mutex protection for workqueue
> >
> >> 
> >> So loaded_table is valid, it is memcpy trigger kernel panic because table_sz is
> >> not zero while cached_table is NULL.
> >> 	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >> 	if (loaded_table) {
> >> 		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >> 		rproc->table_ptr = loaded_table;
> >> 	}
> >> 
> >> Thanks,
> >> Peng
> >> 
> >> >
> >> >> 
> >> >> Thanks,
> >> >> Peng
> >> >> 
> >> >> >
> >> >> >[1]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L338
> >> >> >[2]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1411 
> >> >> >
> >> >> >> When starting rproc with a firmware not have resource table,
> >> >> >> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
> >> >> >> trigger dump, because rproc->cache_table is set to NULL during the last
> >> >> >> stop operation, but rproc->table_sz is still valid.
> >> >> >> 
> >> >> >> This issue is found on i.MX8MP and i.MX9.
> >> >> >> 
> >> >> >> Dump as below:
> >> >> >> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> >> >> >> Mem abort info:
> >> >> >>   ESR = 0x0000000096000004
> >> >> >>   EC = 0x25: DABT (current EL), IL = 32 bits
> >> >> >>   SET = 0, FnV = 0
> >> >> >>   EA = 0, S1PTW = 0
> >> >> >>   FSC = 0x04: level 0 translation fault
> >> >> >> Data abort info:
> >> >> >>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> >> >> >>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> >> >> >>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> >> >> >> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
> >> >> >> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> >> >> >> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> >> >> >> Modules linked in:
> >> >> >> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
> >> >> >> Hardware name: NXP i.MX8MPlus EVK board (DT)
> >> >> >> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >> >> >> pc : __pi_memcpy_generic+0x110/0x22c
> >> >> >> lr : rproc_start+0x88/0x1e0
> >> >> >> Call trace:
> >> >> >>  __pi_memcpy_generic+0x110/0x22c (P)
> >> >> >>  rproc_boot+0x198/0x57c
> >> >> >>  state_store+0x40/0x104
> >> >> >>  dev_attr_store+0x18/0x2c
> >> >> >>  sysfs_kf_write+0x7c/0x94
> >> >> >>  kernfs_fop_write_iter+0x120/0x1cc
> >> >> >>  vfs_write+0x240/0x378
> >> >> >>  ksys_write+0x70/0x108
> >> >> >>  __arm64_sys_write+0x1c/0x28
> >> >> >>  invoke_syscall+0x48/0x10c
> >> >> >>  el0_svc_common.constprop.0+0xc0/0xe0
> >> >> >>  do_el0_svc+0x1c/0x28
> >> >> >>  el0_svc+0x30/0xcc
> >> >> >>  el0t_64_sync_handler+0x10c/0x138
> >> >> >>  el0t_64_sync+0x198/0x19c
> >> >> >> 
> >> >> >> Clear rproc->table_sz to address the issue.
> >> >> >> 
> >> >> >> While at here, also clear rproc->table_sz when rproc_fw_boot and
> >> >> >> rproc_detach.
> >> >> >> 
> >> >> >> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
> >> >> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> >> >> ---
> >> >> >> 
> >> >> >> V2:
> >> >> >>  Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud
> >> >> >> 
> >> >> >>  drivers/remoteproc/remoteproc_core.c | 3 +++
> >> >> >>  1 file changed, 3 insertions(+)
> >> >> >> 
> >> >> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> >> >> index c2cf0d277729..1efa53d4e0c3 100644
> >> >> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> >> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> >> >> @@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> >> >> >>  	kfree(rproc->cached_table);
> >> >> >>  	rproc->cached_table = NULL;
> >> >> >>  	rproc->table_ptr = NULL;
> >> >> >> +	rproc->table_sz = 0;
> >> >> >>  unprepare_rproc:
> >> >> >>  	/* release HW resources if needed */
> >> >> >>  	rproc_unprepare_device(rproc);
> >> >> >> @@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
> >> >> >>  	kfree(rproc->cached_table);
> >> >> >>  	rproc->cached_table = NULL;
> >> >> >>  	rproc->table_ptr = NULL;
> >> >> >> +	rproc->table_sz = 0;
> >> >> >>  out:
> >> >> >>  	mutex_unlock(&rproc->lock);
> >> >> >>  	return ret;
> >> >> >> @@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
> >> >> >>  	kfree(rproc->cached_table);
> >> >> >>  	rproc->cached_table = NULL;
> >> >> >>  	rproc->table_ptr = NULL;
> >> >> >> +	rproc->table_sz = 0;
> >> >> >>  out:
> >> >> >>  	mutex_unlock(&rproc->lock);
> >> >> >>  	return ret;
> >> >> >> -- 
> >> >> >> 2.37.1
> >> >> >> 
> >> >> >
> >> >
> >
