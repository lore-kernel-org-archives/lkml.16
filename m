Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDD51EEA30;
	Fri,  4 Apr 2025 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773463; cv=none; b=KYNe+3BbtT2abO/1k1TFoAIE37lIElUgEO8XVJf3ariGXEwThKwNSzaFQEWGazb6o57FHFeSQcoKaS9O/wcyCIc1kRZG8RpnzOi/+Ax6pNjRf5TFlY4MZIQbo4KYgzWS00ioavyJK78MgPls+HaCzDdO/u7PqF3rDPafJOKhIHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773463; c=relaxed/simple;
	bh=8ZzU5CTNdnnwt+f4Z1gi8qeLems7V6l/AM2s42U3M0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GANZs2tkcr8/3dvUr8/jGkabWNBzlDro1+iCGbFFZXO0vIWm08VDWdPO5UrWtbu/vIZw92qRxhFViFBoyEZQMBFM0twIDOErrgDsF/pes62n+0akxqiL6Jholf5b1vEi9+BGyUOpOTI6NlkTegXR9s6PIClxVPXWen/+H7P7l4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A68A81515;
	Fri,  4 Apr 2025 06:31:01 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87FA03F59E;
	Fri,  4 Apr 2025 06:30:57 -0700 (PDT)
Date: Fri, 4 Apr 2025 14:30:50 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [RFC PATCH 0/3] Introduce SCMI Quirks framework
Message-ID: <Z-_fCshrJiIYWVOK@pluto>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
 <Z-_dMev0v6P4UJ_i@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_dMev0v6P4UJ_i@hovoldconsulting.com>

On Fri, Apr 04, 2025 at 03:22:57PM +0200, Johan Hovold wrote:
> Hi Cristian,
> 
> On Tue, Apr 01, 2025 at 01:25:42PM +0100, Cristian Marussi wrote:
> 
> > with the increasing adoption of SCMI across arm64 ecosystems, we have to
> > start considering how to deal and take care of out-of-spec SCMI firmware
> > platforms that are actively deployed in the wild, in a consistent manner.
> > 
> > This small series introduces a simple framework, based on static_keys,
> > that allows a user to:
> > 
> > - define a quirk and its matching conditions; quirks can match based on:
> > 
> >   	compatible / Vendor_ID / Sub_Vendor_ID / ImplVersion
> > 
> >   from the longest matching sequence down to the shortest.
> > 
> >   When the SCMI core stack boots it will enable the matching quirks
> >   depending on the information gathered from the platform via Base
> >   protocol: any NULL/0 match condition is ignored during matching and is
> >   interpreted as ANY, so you can decide to match on a very specific
> >   combination of compatibles and FW versions OR simply on a compatible.
> > 
> > - define a quirk code-block: simply a block of code, meant to play the
> >   magic quirk trick, defined in the proximity of where it will be used
> >   and gated by an implicit quirk static-key associated with the defined
> >   quirk
> 
> > Any feedback and testing is very much welcome.
> 
> I'm hitting the below lockdep splat when running with this series and
> the FC quirk enabled.
> 

Thanks, I'll have a look...

Cristian

> Johan
> 
> 
> [    8.399581] ======================================================
> [    8.399582] WARNING: possible circular locking dependency detected
> [    8.399583] 6.14.0 #103 Not tainted
> [    8.399584] ------------------------------------------------------
> [    8.399584] kworker/u49:5/165 is trying to acquire lock:
> [    8.399586] ffff65d004d36320 (&info->protocols_mtx){+.+.}-{4:4}, at: scmi_get_protocol_instance+0x4c/0x5c0
> [    8.399596] 
>                but task is already holding lock:
> [    8.399596] ffff65d00a895348 (&ni->pending_mtx){+.+.}-{4:4}, at: __scmi_event_handler_get_ops+0x70/0x47c
> [    8.399600] 
>                which lock already depends on the new lock.
> 
> [    8.399601] 
>                the existing dependency chain (in reverse order) is:
> [    8.399601] 
>                -> #4 (&ni->pending_mtx){+.+.}-{4:4}:
> [    8.399603]        __mutex_lock+0xa8/0x514
> [    8.399606]        mutex_lock_nested+0x24/0x30
> [    8.399608]        __scmi_event_handler_get_ops+0x70/0x47c
> [    8.399610]        scmi_notifier_register+0x58/0x29c
> [    8.399612]        scmi_cpufreq_init+0x30c/0x4d0
> [    8.399615]        cpufreq_online+0x610/0xb58
> [    8.399616]        cpufreq_add_dev+0xcc/0xe4
> [    8.399618]        subsys_interface_register+0xfc/0x118
> [    8.399622]        cpufreq_register_driver+0x178/0x2ec
> [    8.399623]        scmi_cpufreq_probe+0x88/0x11c
> [    8.399625]        scmi_dev_probe+0x28/0x3c
> [    8.399626]        really_probe+0xc0/0x38c
> [    8.399627]        __driver_probe_device+0x7c/0x160
> [    8.399629]        driver_probe_device+0x40/0x110
> [    8.399630]        __device_attach_driver+0xbc/0x158
> [    8.399631]        bus_for_each_drv+0x84/0xe0
> [    8.399633]        __device_attach+0xa8/0x1d4
> [    8.399634]        device_initial_probe+0x14/0x20
> [    8.399636]        bus_probe_device+0xb0/0xb4
> [    8.399637]        device_add+0x57c/0x784
> [    8.399639]        device_register+0x20/0x30
> [    8.399641]        __scmi_device_create.part.0+0xf0/0x224
> [    8.399642]        scmi_device_create+0x184/0x1c8
> [    8.399644]        scmi_create_protocol_devices+0x50/0xb4
> [    8.399646]        scmi_probe+0x854/0x91c
> [    8.399647]        platform_probe+0x68/0xd8
> [    8.399649]        really_probe+0xc0/0x38c
> [    8.399650]        __driver_probe_device+0x7c/0x160
> [    8.399651]        driver_probe_device+0x40/0x110
> [    8.399653]        __device_attach_driver+0xbc/0x158
> [    8.399654]        bus_for_each_drv+0x84/0xe0
> [    8.399656]        __device_attach+0xa8/0x1d4
> [    8.399657]        device_initial_probe+0x14/0x20
> [    8.399658]        bus_probe_device+0xb0/0xb4
> [    8.399659]        device_add+0x57c/0x784
> [    8.399661]        platform_device_add+0x110/0x274
> [    8.399663]        scmi_mailbox_probe+0xcc/0x110
> [    8.399664]        platform_probe+0x68/0xd8
> [    8.399666]        really_probe+0xc0/0x38c
> [    8.399667]        __driver_probe_device+0x7c/0x160
> [    8.399668]        driver_probe_device+0x40/0x110
> [    8.399669]        __device_attach_driver+0xbc/0x158
> [    8.399671]        bus_for_each_drv+0x84/0xe0
> [    8.399673]        __device_attach+0xa8/0x1d4
> [    8.399674]        device_initial_probe+0x14/0x20
> [    8.399675]        bus_probe_device+0xb0/0xb4
> [    8.399676]        deferred_probe_work_func+0xa0/0xf4
> [    8.399677]        process_one_work+0x20c/0x610
> [    8.399682]        worker_thread+0x23c/0x378
> [    8.399684]        kthread+0x13c/0x20c
> [    8.399685]        ret_from_fork+0x10/0x20
> [    8.399687] 
>                -> #3 (&policy->rwsem){+.+.}-{4:4}:
> [    8.399689]        down_write+0x50/0xe8
> [    8.399690]        cpufreq_online+0x5cc/0xb58
> [    8.399692]        cpufreq_add_dev+0xcc/0xe4
> [    8.399693]        subsys_interface_register+0xfc/0x118
> [    8.399695]        cpufreq_register_driver+0x178/0x2ec
> [    8.399697]        scmi_cpufreq_probe+0x88/0x11c
> [    8.399699]        scmi_dev_probe+0x28/0x3c
> [    8.399700]        really_probe+0xc0/0x38c
> [    8.399701]        __driver_probe_device+0x7c/0x160
> [    8.399702]        driver_probe_device+0x40/0x110
> [    8.399704]        __device_attach_driver+0xbc/0x158
> [    8.399705]        bus_for_each_drv+0x84/0xe0
> [    8.399707]        __device_attach+0xa8/0x1d4
> [    8.399708]        device_initial_probe+0x14/0x20
> [    8.399709]        bus_probe_device+0xb0/0xb4
> [    8.399710]        device_add+0x57c/0x784
> [    8.399712]        device_register+0x20/0x30
> [    8.399714]        __scmi_device_create.part.0+0xf0/0x224
> [    8.877044]        scmi_device_create+0x184/0x1c8
> [    8.882444]        scmi_create_protocol_devices+0x50/0xb4
> [    8.888617]        scmi_probe+0x854/0x91c
> [    8.893302]        platform_probe+0x68/0xd8
> [    8.898172]        really_probe+0xc0/0x38c
> [    8.902943]        __driver_probe_device+0x7c/0x160
> [    8.908525]        driver_probe_device+0x40/0x110
> [    8.913933]        __device_attach_driver+0xbc/0x158
> [    8.919608]        bus_for_each_drv+0x84/0xe0
> [    8.924657]        __device_attach+0xa8/0x1d4
> [    8.929708]        device_initial_probe+0x14/0x20
> [    8.935124]        bus_probe_device+0xb0/0xb4
> [    8.940178]        device_add+0x57c/0x784
> [    8.944870]        platform_device_add+0x110/0x274
> [    8.950370]        scmi_mailbox_probe+0xcc/0x110
> [    8.955699]        platform_probe+0x68/0xd8
> [    8.960582]        really_probe+0xc0/0x38c
> [    8.965375]        __driver_probe_device+0x7c/0x160
> [    8.970971]        driver_probe_device+0x40/0x110
> [    8.976390]        __device_attach_driver+0xbc/0x158
> [    8.982076]        bus_for_each_drv+0x84/0xe0
> [    8.987148]        __device_attach+0xa8/0x1d4
> [    8.992212]        device_initial_probe+0x14/0x20
> [    8.997637]        bus_probe_device+0xb0/0xb4
> [    9.002699]        deferred_probe_work_func+0xa0/0xf4
> [    9.008480]        process_one_work+0x20c/0x610
> [    9.013783]        worker_thread+0x23c/0x378
> [    9.018775]        kthread+0x13c/0x20c
> [    9.023223]        ret_from_fork+0x10/0x20
> [    9.028031] 
>                -> #2 (subsys mutex#2){+.+.}-{4:4}:
> [    9.035379]        __mutex_lock+0xa8/0x514
> [    9.040197]        mutex_lock_nested+0x24/0x30
> [    9.045366]        subsys_interface_register+0x50/0x118
> [    9.051338]        cpufreq_register_driver+0x178/0x2ec
> [    9.057223]        scmi_cpufreq_probe+0x88/0x11c
> [    9.062585]        scmi_dev_probe+0x28/0x3c
> [    9.067497]        really_probe+0xc0/0x38c
> [    9.072317]        __driver_probe_device+0x7c/0x160
> [    9.077941]        driver_probe_device+0x40/0x110
> [    9.083392]        __device_attach_driver+0xbc/0x158
> [    9.089104]        bus_for_each_drv+0x84/0xe0
> [    9.094199]        __device_attach+0xa8/0x1d4
> [    9.099292]        device_initial_probe+0x14/0x20
> [    9.104749]        bus_probe_device+0xb0/0xb4
> [    9.109843]        device_add+0x57c/0x784
> [    9.114582]        device_register+0x20/0x30
> [    9.119585]        __scmi_device_create.part.0+0xf0/0x224
> [    9.125750]        scmi_device_create+0x184/0x1c8
> [    9.131210]        scmi_create_protocol_devices+0x50/0xb4
> [    9.137380]        scmi_probe+0x854/0x91c
> [    9.142118]        platform_probe+0x68/0xd8
> [    9.147091]        really_probe+0xc0/0x38c
> [    9.151924]        __driver_probe_device+0x7c/0x160
> [    9.157556]        driver_probe_device+0x40/0x110
> [    9.163014]        __device_attach_driver+0xbc/0x158
> [    9.168733]        bus_for_each_drv+0x84/0xe0
> [    9.173836]        __device_attach+0xa8/0x1d4
> [    9.178932]        device_initial_probe+0x14/0x20
> [    9.184381]        bus_probe_device+0xb0/0xb4
> [    9.189478]        device_add+0x57c/0x784
> [    9.194213]        platform_device_add+0x110/0x274
> [    9.199758]        scmi_mailbox_probe+0xcc/0x110
> [    9.205172]        platform_probe+0x68/0xd8
> [    9.210097]        really_probe+0xc0/0x38c
> [    9.214930]        __driver_probe_device+0x7c/0x160
> [    9.220558]        driver_probe_device+0x40/0x110
> [    9.226017]        __device_attach_driver+0xbc/0x158
> [    9.231739]        bus_for_each_drv+0x84/0xe0
> [    9.236838]        __device_attach+0xa8/0x1d4
> [    9.241937]        device_initial_probe+0x14/0x20
> [    9.247396]        bus_probe_device+0xb0/0xb4
> [    9.252490]        deferred_probe_work_func+0xa0/0xf4
> [    9.258298]        process_one_work+0x20c/0x610
> [    9.263631]        worker_thread+0x23c/0x378
> [    9.268644]        kthread+0x13c/0x20c
> [    9.273118]        ret_from_fork+0x10/0x20
> [    9.277954] 
>                -> #1 (cpu_hotplug_lock){++++}-{0:0}:
> [    9.285522]        percpu_down_read.constprop.0+0x54/0x168
> [    9.291789]        cpus_read_lock+0x10/0x1c
> [    9.296770]        static_key_enable+0x18/0x34
> [    9.301961]        scmi_quirks_enable+0xec/0x19c
> [    9.307327]        scmi_base_protocol_init+0x374/0x4ec
> [    9.313232]        scmi_get_protocol_instance+0x198/0x5c0
> [    9.319411]        scmi_probe+0x3cc/0x91c
> [    9.324156]        platform_probe+0x68/0xd8
> [    9.329083]        really_probe+0xc0/0x38c
> [    9.333918]        __driver_probe_device+0x7c/0x160
> [    9.339557]        driver_probe_device+0x40/0x110
> [    9.345020]        __device_attach_driver+0xbc/0x158
> [    9.350753]        bus_for_each_drv+0x84/0xe0
> [    9.355858]        __device_attach+0xa8/0x1d4
> [    9.360964]        device_initial_probe+0x14/0x20
> [    9.366425]        bus_probe_device+0xb0/0xb4
> [    9.371532]        device_add+0x57c/0x784
> [    9.376273]        platform_device_add+0x110/0x274
> [    9.381824]        scmi_mailbox_probe+0xcc/0x110
> [    9.387193]        platform_probe+0x68/0xd8
> [    9.392121]        really_probe+0xc0/0x38c
> [    9.397017]        __driver_probe_device+0x7c/0x160
> [    9.402656]        driver_probe_device+0x40/0x110
> [    9.408113]        __device_attach_driver+0xbc/0x158
> [    9.413892]        bus_for_each_drv+0x84/0xe0
> [    9.418997]        __device_attach+0xa8/0x1d4
> [    9.424096]        device_initial_probe+0x14/0x20
> [    9.429561]        bus_probe_device+0xb0/0xb4
> [    9.434663]        deferred_probe_work_func+0xa0/0xf4
> [    9.440483]        process_one_work+0x20c/0x610
> [    9.445767]        worker_thread+0x23c/0x378
> [    9.450786]        kthread+0x13c/0x20c
> [    9.455318]        ret_from_fork+0x10/0x20
> [    9.460153] 
>                -> #0 (&info->protocols_mtx){+.+.}-{4:4}:
> [    9.468090]        __lock_acquire+0x1344/0x20e8
> [    9.473371]        lock_acquire+0x1c8/0x354
> [    9.478295]        __mutex_lock+0xa8/0x514
> [    9.483129]        mutex_lock_nested+0x24/0x30
> [    9.488375]        scmi_get_protocol_instance+0x4c/0x5c0
> [    9.494464]        scmi_protocol_acquire+0x10/0x24
> [    9.500014]        __scmi_event_handler_get_ops+0x1c0/0x47c
> [    9.506367]        scmi_notifier_register+0x58/0x29c
> [    9.512096]        scmi_cpufreq_init+0x30c/0x4d0
> [    9.517471]        cpufreq_online+0x610/0xb58
> [    9.522580]        cpufreq_add_dev+0xcc/0xe4
> [    9.527602]        subsys_interface_register+0xfc/0x118
> [    9.533614]        cpufreq_register_driver+0x178/0x2ec
> [    9.539526]        scmi_cpufreq_probe+0x88/0x11c
> [    9.544897]        scmi_dev_probe+0x28/0x3c
> [    9.549825]        really_probe+0xc0/0x38c
> [    9.554656]        __driver_probe_device+0x7c/0x160
> [    9.560297]        driver_probe_device+0x40/0x110
> [    9.565764]        __device_attach_driver+0xbc/0x158
> [    9.571494]        bus_for_each_drv+0x84/0xe0
> [    9.576601]        __device_attach+0xa8/0x1d4
> [    9.581710]        device_initial_probe+0x14/0x20
> [    9.587178]        bus_probe_device+0xb0/0xb4
> [    9.592282]        device_add+0x57c/0x784
> [    9.597085]        device_register+0x20/0x30
> [    9.602095]        __scmi_device_create.part.0+0xf0/0x224
> [    9.608269]        scmi_device_create+0x184/0x1c8
> [    9.613786]        scmi_create_protocol_devices+0x50/0xb4
> [    9.619965]        scmi_probe+0x854/0x91c
> [    9.624718]        platform_probe+0x68/0xd8
> [    9.629647]        really_probe+0xc0/0x38c
> [    9.634486]        __driver_probe_device+0x7c/0x160
> [    9.640125]        driver_probe_device+0x40/0x110
> [    9.645593]        __device_attach_driver+0xbc/0x158
> [    9.651328]        bus_for_each_drv+0x84/0xe0
> [    9.656437]        __device_attach+0xa8/0x1d4
> [    9.661541]        device_initial_probe+0x14/0x20
> [    9.667006]        bus_probe_device+0xb0/0xb4
> [    9.672161]        device_add+0x57c/0x784
> [    9.676913]        platform_device_add+0x110/0x274
> [    9.682467]        scmi_mailbox_probe+0xcc/0x110
> [    9.687843]        platform_probe+0x68/0xd8
> [    9.692770]        really_probe+0xc0/0x38c
> [    9.697607]        __driver_probe_device+0x7c/0x160
> [    9.703250]        driver_probe_device+0x40/0x110
> [    9.708718]        __device_attach_driver+0xbc/0x158
> [    9.714454]        bus_for_each_drv+0x84/0xe0
> [    9.719568]        __device_attach+0xa8/0x1d4
> [    9.724670]        device_initial_probe+0x14/0x20
> [    9.730193]        bus_probe_device+0xb0/0xb4
> [    9.735302]        deferred_probe_work_func+0xa0/0xf4
> [    9.741128]        process_one_work+0x20c/0x610
> [    9.746414]        worker_thread+0x23c/0x378
> [    9.751437]        kthread+0x13c/0x20c
> [    9.755912]        ret_from_fork+0x10/0x20
> [    9.760746] 
>                other info that might help us debug this:
> 
> [    9.770784] Chain exists of:
>                  &info->protocols_mtx --> &policy->rwsem --> &ni->pending_mtx
> 
> [    9.784150]  Possible unsafe locking scenario:
> 
> [    9.791482]        CPU0                    CPU1
> [    9.796815]        ----                    ----
> [    9.802092]   lock(&ni->pending_mtx);
> [    9.806468]                                lock(&policy->rwsem);
> [    9.813262]                                lock(&ni->pending_mtx);
> [    9.820230]   lock(&info->protocols_mtx);
> [    9.824981] 
>                 *** DEADLOCK ***
> 
> [    9.832879] 11 locks held by kworker/u49:5/165:
> [    9.838145]  #0: ffff65d000010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x190/0x610
> [    9.849165]  #1: ffff800081eb3dd0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1b8/0x610
> [    9.859312]  #2: ffff65d0010b48f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x38/0x1d4
> [    9.868580]  #3: ffff65d001e758f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x38/0x1d4
> [    9.877839]  #4: ffff65d004d36460 (&info->devreq_mtx){+.+.}-{4:4}, at: scmi_create_protocol_devices+0x3c/0xb4
> [    9.888790]  #5: ffffc981b6c603c8 (scmi_requested_devices_mtx){+.+.}-{4:4}, at: scmi_device_create+0xc8/0x1c8
> [    9.899701]  #6: ffff65d0092ca8f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x38/0x1d4
> [    9.909022]  #7: ffffc981b6af2148 (cpu_hotplug_lock){++++}-{0:0}, at: cpus_read_lock+0x10/0x1c
> [    9.918629]  #8: ffff65d0009ee518 (subsys mutex#2){+.+.}-{4:4}, at: subsys_interface_register+0x50/0x118
> [    9.929143]  #9: ffff65d011fc3b80 (&policy->rwsem){+.+.}-{4:4}, at: cpufreq_online+0x5cc/0xb58
> [    9.938832]  #10: ffff65d00a895348 (&ni->pending_mtx){+.+.}-{4:4}, at: __scmi_event_handler_get_ops+0x70/0x47c
> [    9.949921] 
>                stack backtrace:
> [    9.956066] CPU: 0 UID: 0 PID: 165 Comm: kworker/u49:5 Not tainted 6.14.0 #103
> [    9.956068] Hardware name: Qualcomm CRD, BIOS 6.0.241007.BOOT.MXF.2.4-00534.1-HAMOA-1 10/ 7/2024
> [    9.956069] Workqueue: events_unbound deferred_probe_work_func
> [    9.956071] Call trace:
> [    9.956072]  show_stack+0x18/0x24 (C)
> [    9.956074]  dump_stack_lvl+0x90/0xd0
> [    9.956077]  dump_stack+0x18/0x24
> [    9.956078]  print_circular_bug+0x298/0x37c
> [    9.956080]  check_noncircular+0x15c/0x170
> [    9.956081]  __lock_acquire+0x1344/0x20e8
> [    9.956082]  lock_acquire+0x1c8/0x354
> [    9.956083]  __mutex_lock+0xa8/0x514
> [    9.956084]  mutex_lock_nested+0x24/0x30
> [    9.956085]  scmi_get_protocol_instance+0x4c/0x5c0
> [    9.956087]  scmi_protocol_acquire+0x10/0x24
> [    9.956089]  __scmi_event_handler_get_ops+0x1c0/0x47c
> [    9.956091]  scmi_notifier_register+0x58/0x29c
> [    9.956093]  scmi_cpufreq_init+0x30c/0x4d0
> [    9.956095]  cpufreq_online+0x610/0xb58
> [    9.956096]  cpufreq_add_dev+0xcc/0xe4
> [    9.956098]  subsys_interface_register+0xfc/0x118
> [    9.956100]  cpufreq_register_driver+0x178/0x2ec
> [    9.956101]  scmi_cpufreq_probe+0x88/0x11c
> [    9.956103]  scmi_dev_probe+0x28/0x3c
> [    9.956104]  really_probe+0xc0/0x38c
> [    9.956105]  __driver_probe_device+0x7c/0x160
> [    9.956107]  driver_probe_device+0x40/0x110
> [    9.956108]  __device_attach_driver+0xbc/0x158
> [    9.956109]  bus_for_each_drv+0x84/0xe0
> [    9.956111]  __device_attach+0xa8/0x1d4
> [    9.956112]  device_initial_probe+0x14/0x20
> [    9.956113]  bus_probe_device+0xb0/0xb4
> [    9.956114]  device_add+0x57c/0x784
> [    9.956116]  device_register+0x20/0x30
> [    9.956118]  __scmi_device_create.part.0+0xf0/0x224
> [    9.956120]  scmi_device_create+0x184/0x1c8
> [    9.956121]  scmi_create_protocol_devices+0x50/0xb4
> [    9.956123]  scmi_probe+0x854/0x91c
> [    9.956124]  platform_probe+0x68/0xd8
> [    9.956126]  really_probe+0xc0/0x38c
> [    9.956127]  __driver_probe_device+0x7c/0x160
> [    9.956128]  driver_probe_device+0x40/0x110
> [    9.956129]  __device_attach_driver+0xbc/0x158
> [    9.956131]  bus_for_each_drv+0x84/0xe0
> [    9.956133]  __device_attach+0xa8/0x1d4
> [    9.956134]  device_initial_probe+0x14/0x20
> [    9.956135]  bus_probe_device+0xb0/0xb4
> [    9.956136]  device_add+0x57c/0x784
> [    9.956138]  platform_device_add+0x110/0x274
> [    9.956140]  scmi_mailbox_probe+0xcc/0x110
> [    9.956141]  platform_probe+0x68/0xd8
> [    9.956142]  really_probe+0xc0/0x38c
> [    9.956144]  __driver_probe_device+0x7c/0x160
> [    9.956145]  driver_probe_device+0x40/0x110
> [    9.956146]  __device_attach_driver+0xbc/0x158
> [    9.956147]  bus_for_each_drv+0x84/0xe0
> [    9.956149]  __device_attach+0xa8/0x1d4
> [    9.956151]  device_initial_probe+0x14/0x20
> [    9.956152]  bus_probe_device+0xb0/0xb4
> [    9.956153]  deferred_probe_work_func+0xa0/0xf4
> [    9.956154]  process_one_work+0x20c/0x610
> [    9.956156]  worker_thread+0x23c/0x378
> [    9.956157]  kthread+0x13c/0x20c
> [    9.956159]  ret_from_fork+0x10/0x20
