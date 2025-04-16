Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5F22D4DB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788772; cv=none; b=JC+p3I69w20nhWU+bsc5m1KRugnrHaDyR8RdNzbSBuMyoy2GnH1j5kVkL8/pUeRB4MgyBhDAhPrGdl9aJrnZ6UC74OC+dFRvMSUiG8/N4I2zwt6PqwkKF3rEkZ0bvN/ykR220hq5yloSCaoCQ+RmT9fBGiw3eq8f7S8y5t0ibks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788772; c=relaxed/simple;
	bh=NV1ObDNvac9BKELvb85EWbnF5Ph9Q/Ge+8fcPqW4hHs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nmyl7vNeQj/MNL3ho5ZDhKfcahPih3t3qoKxu8SKZAtpdZv/UhCBAYXdsmU8ido4742lkUkcmtVtr6aCdKu+U5Jxbe2o3DvHSLEtlcnxvp7CrsxkIxFlWVzYOkCB/qe8JF6QGsVGlzwEY+2I2PcvJomCNgsW1z3vNBValnypvGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NcJM2xVw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NcJM2xVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744788769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0A4GO9T7R+GL3F6FsynwLGzzh5CQAzLkMXyqJ24/ilA=;
	b=NcJM2xVw2dkfTrJZeEyGOm8e9o4n/hpcC4j+Y55063GQJq58NwIWLNdg75+lrUSPosDnNI
	jwlTdUYt4aZqp1pT1Daz4DpoYCpF1Ybr3W0ZPWXkLgrs1PZmQ/gF/kGlauUa5wBU1LYi60
	5PkymQtD2XBTLPjsgNP5P0UAL9giyIQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632--OU9hbacNYuivGTu1g4gVQ-1; Wed, 16 Apr 2025 03:32:47 -0400
X-MC-Unique: -OU9hbacNYuivGTu1g4gVQ-1
X-Mimecast-MFC-AGG-ID: -OU9hbacNYuivGTu1g4gVQ_1744788766
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so48842215e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788766; x=1745393566;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0A4GO9T7R+GL3F6FsynwLGzzh5CQAzLkMXyqJ24/ilA=;
        b=MhbAb91iau3iNjv7t8f8HNqgbvk3ebtN+Z91I6dl0O9PRv8PKAOEoQQuARipJ+RskZ
         skZbq8VbZaMkzybcW6tovG0EPuiFa4p/+AinNzkhuOR8TECt3u9wBWW4kA0A2w3Fuh24
         7JVdotBXUBX9B+SAVzDNey1C2KiOMpp93nRAI6gRTvm//RvO+ds2RH8FGyTD1rA7g4Mw
         WBsq9Gl5WGEy8+nOF3IjqJbpbvmlqdXeVpDQIouOlDnvGOZMGghxyytmAPYK5dozah7R
         6BiKwSgGfRyvbNu9H2ncJuAeSiRBnEwAlLu3lDMu2jAD0s6Gh/dk1CIQ7u09Jjj3HU/W
         K/bg==
X-Forwarded-Encrypted: i=1; AJvYcCWitIydu/1BWM+J/axDN4HlusG8jLvL3FO71rwk5UFK7OqmSAtYY6yqFK8BVls1DfloQoPzmcx6oBBwKLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwupTuvx7HV1djaW5lmoMnORpI3XvvibZpCjqrfYddMTrKCoqg4
	EE8PT86cFuofib6jwDIzezq+GTfbmX5jyT9vI3IeBChqwCGPdoz6rTnE1eBW3Y27iEIy8dgeDEt
	WWZeJh/9CwCIC7XzvFoDhXwin1w0Fg+WIa0BRemsggvobx0855h+3AfBRCPn5kA==
X-Gm-Gg: ASbGncvNih4k9230/nh9sQBMt0/nU7+STCLe/Wr2xEGT/6qmKUH2sSjlpG2CTAcJbh1
	Hmd+Meaf0fULQ+dxHGEd1SszVHOT/G4LCbGcj8heEwjRxvvce9ZNzqbCePKGIWapMg9D0+wTY9W
	GPX5NudAhA6iZquhMjegVhKwVWh4UphBGu/pnEywcaom1smp1VijsgUyAnHyxr2/CVZLIcHnUuS
	Gtn42D2NgjFBdcNwXS8KRrFPgauCZO8/mDiHsuWWw9bI3BWtFMNbkvsPOTh71Qr75iKRvYePMFT
	xTKz9aJQCislsgDREB6CBxo4VcANWqBbD1SF7n4=
X-Received: by 2002:a05:600c:1ca3:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-4405d637b49mr7022985e9.15.1744788766438;
        Wed, 16 Apr 2025 00:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpgOubVpqmfu4fejPJV6V8Nwg67cOnxzrVkwTeijWdi/xhMjO+aOdeIusjgVXu1pNG62MdLw==
X-Received: by 2002:a05:600c:1ca3:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-4405d637b49mr7022655e9.15.1744788766065;
        Wed, 16 Apr 2025 00:32:46 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b53ef95sm12536365e9.36.2025.04.16.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:32:45 -0700 (PDT)
Message-ID: <0a41e42243d2c102b159bed4b231f143bda02243.camel@redhat.com>
Subject: Re: [PATCH v3 14/22] rv: Add rtapp container monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Wed, 16 Apr 2025 09:32:43 +0200
In-Reply-To: <7d1a7337879b991ed454d1457d44a15dabc4b3f7.1744785335.git.namcao@linutronix.de>
References: <cover.1744785335.git.namcao@linutronix.de>
	 <7d1a7337879b991ed454d1457d44a15dabc4b3f7.1744785335.git.namcao@linutronix.de>
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



On Wed, 2025-04-16 at 08:51 +0200, Nam Cao wrote:
> Add the container "rtapp" which is the monitor collection for
> detecting
> problems with real-time applications. The monitors will be added in
> the
> follow-up commits.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/monitors/rtapp/Kconfig |=C2=A0 6 +++++
> =C2=A0kernel/trace/rv/monitors/rtapp/rtapp.c | 34
> ++++++++++++++++++++++++++
> =C2=A0kernel/trace/rv/monitors/rtapp/rtapp.h |=C2=A0 3 +++
> =C2=A05 files changed, 45 insertions(+)
> =C2=A0create mode 100644 kernel/trace/rv/monitors/rtapp/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/rtapp/rtapp.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/rtapp/rtapp.h
>=20
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> index 6e157f964991..5c407d291661 100644
> --- a/kernel/trace/rv/Kconfig
> +++ b/kernel/trace/rv/Kconfig
> @@ -41,6 +41,7 @@ source "kernel/trace/rv/monitors/snroc/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/scpd/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/snep/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/sncid/Kconfig"
> +source "kernel/trace/rv/monitors/rtapp/Kconfig"
> =C2=A0# Add new monitors here
> =C2=A0
> =C2=A0config RV_REACTORS
> diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
> index f9b2cd0483c3..9b28c2419995 100644
> --- a/kernel/trace/rv/Makefile
> +++ b/kernel/trace/rv/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_RV_MON_SNROC) +=3D
> monitors/snroc/snroc.o
> =C2=A0obj-$(CONFIG_RV_MON_SCPD) +=3D monitors/scpd/scpd.o
> =C2=A0obj-$(CONFIG_RV_MON_SNEP) +=3D monitors/snep/snep.o
> =C2=A0obj-$(CONFIG_RV_MON_SNCID) +=3D monitors/sncid/sncid.o
> +obj-$(CONFIG_RV_MON_RTAPP) +=3D monitors/rtapp/rtapp.o
> =C2=A0# Add new monitors here
> =C2=A0obj-$(CONFIG_RV_REACTORS) +=3D rv_reactors.o
> =C2=A0obj-$(CONFIG_RV_REACT_PRINTK) +=3D reactor_printk.o
> diff --git a/kernel/trace/rv/monitors/rtapp/Kconfig
> b/kernel/trace/rv/monitors/rtapp/Kconfig
> new file mode 100644
> index 000000000000..94689d66a79c
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/rtapp/Kconfig
> @@ -0,0 +1,6 @@
> +config RV_MON_RTAPP
> +	depends on RV
	depends on RV_PER_TASK_MONITORS >=3D 2

Not sure we want to be that picky, but what about making sure we can
run the monitor in its entirety?
Ignore this if your use case doesn't expect both monitors to be run
together.

Other than that
Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,
Gabriele

> +	bool "rtapp monitor"
> +	help
> +	=C2=A0 Collection of monitors to check for common problems with
> real-time application that cause
> +	=C2=A0 unexpected latency.
> diff --git a/kernel/trace/rv/monitors/rtapp/rtapp.c
> b/kernel/trace/rv/monitors/rtapp/rtapp.c
> new file mode 100644
> index 000000000000..193c9d8dc0af
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/rtapp/rtapp.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/rv.h>
> +
> +#define MODULE_NAME "rtapp"
> +
> +#include "rtapp.h"
> +
> +struct rv_monitor rv_rtapp;
> +
> +struct rv_monitor rv_rtapp =3D {
> +	.name =3D "rtapp",
> +	.description =3D "Collection of monitors for detecting
> problems with real-time applications",
> +};
> +
> +static int __init register_rtapp(void)
> +{
> +	rv_register_monitor(&rv_rtapp, NULL);
> +	return 0;
> +}
> +
> +static void __exit unregister_rtapp(void)
> +{
> +	rv_unregister_monitor(&rv_rtapp);
> +}
> +
> +module_init(register_rtapp);
> +module_exit(unregister_rtapp);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Nam Cao <namcao@linutronix.de>");
> +MODULE_DESCRIPTION("Collection of monitors for detecting problems
> with real-time applications");
> diff --git a/kernel/trace/rv/monitors/rtapp/rtapp.h
> b/kernel/trace/rv/monitors/rtapp/rtapp.h
> new file mode 100644
> index 000000000000..4c200d67c7f6
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/rtapp/rtapp.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +extern struct rv_monitor rv_rtapp;

