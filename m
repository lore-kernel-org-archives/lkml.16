Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981901E502
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720314; cv=none; b=s2Rav21Ar/8NFkynl0mdUnQDvIZ+N9LX3Mp3uQEAw3dxeBQarQP8KIvCURP9WbT8ONYQbfgm+OmatSED1vXsKa0v8wgr8XqQK6ay2nGsu8dF6cZ0PezkMgL9jmqw8jB2TgbS5+dg/Mqs6RpD5OK3MXec2ig70oGmmzCtp58Nl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720314; c=relaxed/simple;
	bh=ggtzcfRbUYHqZ33PbHd8+EcZ8ymmlTerq5b1PTNqvu0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rJcyhgxEMXZf6OLlVMFTQIJ9k7Tlk6FTdwCKIJo9ovCsW10+Hz/O2w3a6OgmXwn7Qrj3LaYGT8u8jQk9fVoyEMz9xCJgTz1YHYwGXwynpLpPtquficwtUcVLK7v5okwzIyemMfLmKcq3h3Dq/5mngAoPRHRuwuy7WTgDk85SvBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rl8e8qP+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rl8e8qP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744720309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=p1a73Sd3RAp1iqaDWI4nfw2gLoGkbnWXSdTgoGDBOvM=;
	b=Rl8e8qP+soiU7JvskefDQk0HS8oRk2pIpMdR9Wsmkgj2hAM4D3neyNUYVTfinWbRQwNtQy
	bFgWYJeKuJi6wu3KBTOtdzo8nuxFJYrA2BhSeZLRMiaqBx8lcC1KzApczq96axKce0WI/x
	lZmEIbkktMxvEaKILLurLclMDn54GHo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-8WKwHQMBMASL6t6_ygGUSg-1; Tue, 15 Apr 2025 08:31:48 -0400
X-MC-Unique: 8WKwHQMBMASL6t6_ygGUSg-1
X-Mimecast-MFC-AGG-ID: 8WKwHQMBMASL6t6_ygGUSg_1744720307
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso32968825e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720307; x=1745325107;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1a73Sd3RAp1iqaDWI4nfw2gLoGkbnWXSdTgoGDBOvM=;
        b=qAefunWQG+l4GE9/1ba+zJg/2qH55mz+qfLekStHUXcqve7klaXm0x+ppZ7GIxPkWO
         W5aBPTaet4jCSRLGIVknrslS2dg8toAA+pYgUmZj2qNURip7zM6nYh6Fy45+5ahQ6bNx
         h7g0S1LFUlvqszr9Bz4uKdslPOe48ybQ00l6+wmEHkFvzuRNJpDd0PykxBvqzEZLmwXa
         ZClIg0KMqlUr6En243WNk0plZdBlRtaMXG+uhjVN/zqPfg2UH9iunNi0TDizz4pi8gnX
         YDsrJ2z+U3+hofLQmI7i22A/8I+gBQzRPNXQR+dLugWUip/teO/ZkFWbS2XvnpQnksFP
         Q+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHEWV9w4QvN4yEu307RqU/3ctyAST1Jes/cN2qJ4yPnxC6BNXddbi/BxTuUA7oPqk+u4EKDDCv4mCjTpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtlD+i+fYUO26P5FY85zhokJich0Hilk6AP//qHOSnABQyFxic
	iEYXm2zg03GtY2SM0ku7dagWqSutQlgqiytDnvnCYas7NNBVhShJIa6fATXY5RYv6F4tb9zU5JZ
	gE5hbGTubLACwIGD+5Eweq+h4NxrEeOAoIRle1AVk8Csamvcjc6nV3//eKyqoJg==
X-Gm-Gg: ASbGncsTQ34zMCg09DT/JUC3U3Uom6s6VfhPd16J1NGbqUb/yBjgbZWdJv2FIfiUCaW
	evsdxRw8X4IMycbmyRTQF7cFnfK07RqGhBbz95H5XMK39Ethb5jMJQHqJuG5vviWJ2CzBxQqidx
	OR8NkB+2pYsctbz5hmt9LdphHKUY5p+DSYyg09Z871evKSUHLoCv4Qck4uP9doYr0ukYYLYUYBp
	3x+XG9iLrKe0hENee/uajQhZKkl5BLznS/vWeH6Nn4Js+oI63E0bScqso3Nf2/eisoJbL/SUf01
	HX/Kg3s0ZnA/aJSc+wbNazYfrYngcjLATi3+FmQ=
X-Received: by 2002:a05:6000:2d08:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39eaaecdc43mr11875121f8f.36.1744720307111;
        Tue, 15 Apr 2025 05:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8ycg8O9xQhBfZzgNtXQZUfoHEE2cLc/SzULCS1q7QwNJkCHaR97D4J4FI533j3gfmzkHI7Q==
X-Received: by 2002:a05:6000:2d08:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39eaaecdc43mr11875079f8f.36.1744720306709;
        Tue, 15 Apr 2025 05:31:46 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm14219474f8f.17.2025.04.15.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:31:46 -0700 (PDT)
Message-ID: <4d5dd1b919aada32ddf4dbce895f19e558343ee9.camel@redhat.com>
Subject: Re: [PATCH v2 19/22] rv: Add rtapp_pagefault monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, 	x86@kernel.org, "H . Peter Anvin"
 <hpa@zytor.com>, Andy Lutomirski	 <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Date: Tue, 15 Apr 2025 14:31:43 +0200
In-Reply-To: <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> Userspace real-time applications may have design flaws that they
> raise
> page faults in real-time threads, and thus have unexpected latencies.
>=20
> Add an linear temporal logic monitor to detect this scenario.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> ---
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/monitors/pagefault/Kconfig=C2=A0=C2=A0=C2=A0 | 11 +=
++
> =C2=A0.../trace/rv/monitors/pagefault/pagefault.c=C2=A0=C2=A0 | 83
> +++++++++++++++++++
> =C2=A0.../trace/rv/monitors/pagefault/pagefault.h=C2=A0=C2=A0 | 57 ++++++=
+++++++
> =C2=A0.../rv/monitors/pagefault/pagefault_trace.h=C2=A0=C2=A0 | 14 ++++
> =C2=A0kernel/trace/rv/rv_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
> =C2=A0tools/verification/models/rtapp/pagefault.ltl |=C2=A0 1 +
> =C2=A08 files changed, 169 insertions(+)
> =C2=A0create mode 100644 kernel/trace/rv/monitors/pagefault/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault.h
> =C2=A0create mode 100644
> kernel/trace/rv/monitors/pagefault/pagefault_trace.h
> =C2=A0create mode 100644 tools/verification/models/rtapp/pagefault.ltl
>=20
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> index 5c407d291661..6f86d8501e87 100644
> --- a/kernel/trace/rv/Kconfig
> +++ b/kernel/trace/rv/Kconfig
> @@ -42,6 +42,7 @@ source "kernel/trace/rv/monitors/scpd/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/snep/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/sncid/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/rtapp/Kconfig"
> +source "kernel/trace/rv/monitors/pagefault/Kconfig"
> =C2=A0# Add new monitors here
> =C2=A0
> =C2=A0config RV_REACTORS
> diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
> index 9b28c2419995..353ecf939d0e 100644
> --- a/kernel/trace/rv/Makefile
> +++ b/kernel/trace/rv/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_RV_MON_SCPD) +=3D monitors/scpd/scpd.o
> =C2=A0obj-$(CONFIG_RV_MON_SNEP) +=3D monitors/snep/snep.o
> =C2=A0obj-$(CONFIG_RV_MON_SNCID) +=3D monitors/sncid/sncid.o
> =C2=A0obj-$(CONFIG_RV_MON_RTAPP) +=3D monitors/rtapp/rtapp.o
> +obj-$(CONFIG_RV_MON_PAGEFAULT) +=3D monitors/pagefault/pagefault.o
> =C2=A0# Add new monitors here
> =C2=A0obj-$(CONFIG_RV_REACTORS) +=3D rv_reactors.o
> =C2=A0obj-$(CONFIG_RV_REACT_PRINTK) +=3D reactor_printk.o
> diff --git a/kernel/trace/rv/monitors/pagefault/Kconfig
> b/kernel/trace/rv/monitors/pagefault/Kconfig
> new file mode 100644
> index 000000000000..b31dee208459
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/pagefault/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +config RV_MON_PAGEFAULT
> +	depends on RV
> +	select RV_LTL_MONITOR
> +	depends on RV_MON_RTAPP
> +	default y
> +	select LTL_MON_EVENTS_ID
> +	bool "pagefault monitor"
> +	help
> +	=C2=A0 Monitor that real-time tasks do not raise page faults
> diff --git a/kernel/trace/rv/monitors/pagefault/pagefault.c
> b/kernel/trace/rv/monitors/pagefault/pagefault.c
> new file mode 100644
> index 000000000000..9f7a4cba39a1
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/pagefault/pagefault.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/ftrace.h>
> +#include <linux/tracepoint.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/rv.h>
> +#include <rv/instrumentation.h>
> +
> +#define MODULE_NAME "pagefault"
> +
> +#include <rv_trace.h>
> +#include <trace/events/exceptions.h>
> +#include <monitors/rtapp/rtapp.h>
> +
> +#include "pagefault.h"
> +#include <rv/ltl_monitor.h>
> +
> +static void ltl_atoms_fetch(struct task_struct *task, struct
> ltl_monitor *mon)
> +{
> +	ltl_atom_set(mon, LTL_RT, rt_task(task));
> +}
> +
> +static void ltl_atoms_init(struct task_struct *task, struct
> ltl_monitor *mon, bool task_creation)
> +{
> +	if (task_creation)
> +		ltl_atom_set(mon, LTL_PAGEFAULT, false);
> +}
> +
> +static void handle_page_fault(void *data, unsigned long address,
> struct pt_regs *regs,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long error_code)
> +{
> +	ltl_atom_pulse(current, LTL_PAGEFAULT, true);
> +}
> +
> +static int enable_pagefault(void)
> +{
> +	int retval;
> +
> +	retval =3D ltl_monitor_init();
> +	if (retval)
> +		return retval;
> +
> +	rv_attach_trace_probe("pagefault", page_fault_kernel,
> handle_page_fault);
> +	rv_attach_trace_probe("pagefault", page_fault_user,
> handle_page_fault);
> +
> +	return 0;
> +}
> +
> +static void disable_pagefault(void)
> +{
> +	rv_pagefault.enabled =3D 0;
> +
> +	rv_detach_trace_probe("rtapp_pagefault", page_fault_kernel,
> handle_page_fault);
> +	rv_detach_trace_probe("rtapp_pagefault", page_fault_user,
> handle_page_fault);
> +
> +	ltl_monitor_destroy();
> +}
> +
> +static struct rv_monitor rv_pagefault =3D {
> +	.name =3D "pagefault",
> +	.description =3D "Monitor that RT tasks do not raise page
> faults",
> +	.enable =3D enable_pagefault,
> +	.disable =3D disable_pagefault,
> +};
> +
> +static int __init register_pagefault(void)
> +{
> +	rv_register_monitor(&rv_pagefault, &rv_rtapp);
> +	return 0;

Any reason why you aren't returning the error value from the monitor
registration?

Other than that, the monitor seems neat and reasonably easy to
generate.

May not be necessary in this series, but try to keep compatibility with
the userspace RV tool as well, you need to have some special case in
its tracing components because fields are not matching:
 # rv mon sleep -t
         rcuc/11-108      [011] event <CANT FIND FIELD final_state>  =20
(null) x (null)                   -> (null)                   Y
         rcuc/11-108      [011] event <CANT FIND FIELD final_state>  =20
(null) x (null)                   -> (null)                   Y
      ktimers/11-109      [011] event <CANT FIND FIELD final_state>  =20
(null) x (null)                   -> (null)                   Y
=20
Thanks,
Gabriele

