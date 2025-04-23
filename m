Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFFD269CE6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745404682; cv=none; b=PxTzfHHbOxQXiP4//kEudFMt7zu7Pqjrj+t4c0AW2qT7VsZ6VDtmA/bI35V1TocI6R0rx5MoO+t4ErCP6E6vPRoJfYqywWpL18AZU9KWdcGLcTaQz3h6G73mzzB/0QVJdzO1+P+j73w+k9fHplqb4O1kOvxqHtwzIvMScGkBkTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745404682; c=relaxed/simple;
	bh=h6tqKHhc3Je7T1b3Rb2w1OZEqE3uwrpoTC3DYoDW3l8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rocgFsuz2YOdGG2oe5SNfy/A4ZisqUvzR/VA2BrsX0O1Pbtgoy25mcRbhkIHf7jqy1h9sThel158HIPfjK27d3+R8l3hoqtHEsvWil5xOQaNveGw5AttI5clhHTPdp3Tofv4uz9UKBKcrpLj+di8HiwrhXP4XRAlLyzw4MQdce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HU8AajVl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HU8AajVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745404678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=htvOdbbPBWJbiuZ26CDOd+VnDrAoFDfKKaGFmsTk4b8=;
	b=HU8AajVlnerVWLHTXnydP+JFYr5b2Ph7sRPIyrb+hVwbSCV4SgSixUI6DnpO+TpLtXVZR3
	L20X/bmifIGizQUhP7QU/vW8aBwsHlFIqe+hii0Lqzc1UcmHmbNdfrb6Sjqisml1Fm+YWR
	Y7ZS0HgmZ2c+ho0GY1uZ9t4haN9m1i4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78--iM_1oUsNGmhiAwRVQYb9w-1; Wed, 23 Apr 2025 06:37:57 -0400
X-MC-Unique: -iM_1oUsNGmhiAwRVQYb9w-1
X-Mimecast-MFC-AGG-ID: -iM_1oUsNGmhiAwRVQYb9w_1745404676
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ef89b862dso2862176f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745404676; x=1746009476;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htvOdbbPBWJbiuZ26CDOd+VnDrAoFDfKKaGFmsTk4b8=;
        b=lLVvRbtpKGWvbgjUiAZhN2+zXI32+3hVHrC3Db8sUXPKOMTTbRX3PFNBi1G+xAeFu9
         6bXBEyjTfUSUjBdsR6G7/eMAY2uXsSjzbAywfcz4xBlEnDg6hwlMDsUlXHxqxOZ6vFUG
         ztaVQG7PdVh96lpGZ3zI/57nEMXAxWXfD3nTF0+CcUPCdmJyDCHHjOWCLaaLsA2wjEdX
         +RrLhExrUmNsqFIu0MQ9QkhYWLE6IMZT7RFyYNYrYvHQ8rSsR6oXhU2ZT7ohfQ6vaWOA
         vOdwwYsldV9bSP7m4FFyB7wOIuhZlQcp8j3iK1ReOZ7o7bhjIinBDvzff8xwiLiXQ3ZZ
         3wOw==
X-Forwarded-Encrypted: i=1; AJvYcCUiiQcAcBbLavT+D/n/Rb0pzQXIZv7H6OLSM20/S4wyreCicxr+AwQXQrj/DxCTHyGOHjOI6i49gHd6Wjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5THUu1oDqR7pikLyJf64N8tAqwXPxvUjrRC2XSy5SMEZGuIX1
	j373R6YnmzSAmFSrJ6FPdmCcD214TsvbcJu+T2f4oidz6lPfSlZRo8k7byAgEf3xgG0ZiLmFSsT
	IzP9MmbKTfsKRF8AG5VSaam0BOl4ZcoixrzIarYC4Hi8jyb0c39ATThD3VXLl2pjde6Q0bH20
X-Gm-Gg: ASbGnctdtSfM8yhBwQgT2VQyjuL0ubWqoZOmpsjX2YpDhLWp7va6Gr4kYsb+XCnWxud
	rbkD+W+54/3TnL5fXpDP7jpQTTb9LKCg37fK8xzwz2uUlJn+rkhpRWtFKBl3SkPB4YDxM4t5dYV
	ShRT2BKhaF258Hsnt5BqfuRW4pAJ0RFuVxqJFEcSqdIAAqe5Ss+CUq8TXyY1VajpnoIIv/GvO2T
	q4GCVzowwjCvRGVRHMOO5Pgd2zxuMg7KVo5h0Ygl0QuXHw24HLu0XmZIzKb5vLiWQAn1gPOqMIM
	uwIQw/pt/fz+mzj0U6SnKUWF65XdZey4KsC7Aw==
X-Received: by 2002:a5d:64c2:0:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-39f175ba69fmr6143802f8f.11.1745404675787;
        Wed, 23 Apr 2025 03:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCW39oL+DTOq34k/J8w9aq68eyfD5vKWVHY8SgLjQZi5WLtsz5YNU1V68pZbV8+BR4U4+dxw==
X-Received: by 2002:a5d:64c2:0:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-39f175ba69fmr6143780f8f.11.1745404675397;
        Wed, 23 Apr 2025 03:37:55 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433141sm18478248f8f.35.2025.04.23.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:37:54 -0700 (PDT)
Message-ID: <02f047788f369cd0387d2934fa99fe3e8e1913c2.camel@redhat.com>
Subject: Re: [PATCH v4 19/22] rv: Add rtapp_pagefault monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Wed, 23 Apr 2025 12:37:53 +0200
In-Reply-To: <2eff7190ba245eb157f95ae461fef54183d07665.1745390829.git.namcao@linutronix.de>
References: <cover.1745390829.git.namcao@linutronix.de>
	 <2eff7190ba245eb157f95ae461fef54183d07665.1745390829.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


On Wed, 2025-04-23 at 08:50 +0200, Nam Cao wrote:
> Userspace real-time applications may have design flaws that they
> raise
> page faults in real-time threads, and thus have unexpected latencies.
>=20
> Add an linear temporal logic monitor to detect this scenario.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/monitors/pagefault/Kconfig=C2=A0=C2=A0=C2=A0 | 11 +=
++
> =C2=A0.../trace/rv/monitors/pagefault/pagefault.c=C2=A0=C2=A0 | 82
> +++++++++++++++++++
> =C2=A0.../trace/rv/monitors/pagefault/pagefault.h=C2=A0=C2=A0 | 57 ++++++=
+++++++
> =C2=A0.../rv/monitors/pagefault/pagefault_trace.h=C2=A0=C2=A0 | 14 ++++
> =C2=A0kernel/trace/rv/rv_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
> =C2=A0tools/verification/models/rtapp/pagefault.ltl |=C2=A0 1 +
> =C2=A08 files changed, 168 insertions(+)
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
> index 000000000000..ff7df49871b2
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/pagefault/pagefault.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/ftrace.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/rv.h>
> +#include <linux/sched/deadline.h>
> +#include <linux/sched/rt.h>
> +#include <linux/tracepoint.h>
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
> +	ltl_atom_set(mon, LTL_RT, rt_or_dl_task(task));
> +}

Mmh, you probably already considered that, so ignore my comment in that cas=
e.

I just realised this function would tell you a PI boosted task is an RT tas=
k,
is that acceptable in your model?
It's probably a configuration mistake on its own if an RT task following th=
ose
rules shares resources with non-RT tasks not following them, but if that's
something allowed, you may see this atom change more often than you'd like,=
 not
sure if that can be something worth noting.

Perhaps you could add a comment saying that this is not a problem and why (=
e.g.
instead of using rt_or_dl_task_policy for the job).

What do you think?

Besides this detail, the monitor looks good to me
Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,
Gabriele

