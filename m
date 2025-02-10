Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946DB1EF0A5
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192208; cv=none; b=JN/4PrOZS73f4UP6prYmrD1rFBFGhCa7qMG8+s7axCviwda6nLpnoTA+17Mq9ofv0bF39T5ZgDc+Atw5CfSKshYvxkAEt7Fc1CU0Zuec9lhhzVeT0gQl+weGS3kPLZKmcvz0rMh82f7mt29cmxxMr1Hm2v1p/Hj8Ped/Qd+RZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192208; c=relaxed/simple;
	bh=uKEtWuv/AO93nQgpsiu2TaN+Vlpf9BAERxiSfILhY6w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+SxUEcfRXyY16rwEUQfpd1UzbfWNakxM8F1rnQ1dbC1ub8AxAr0zbJBIIsdKCvvwtPjU1KRRM9r8ALcSn1IBqqkAhVmi0cbkzf8ECr5lY31eTKDidFNalGvlmLBRpMZgO+HLHnw8KGLOY4sd8TWI7u4gUMj+qoR0zRUVPs7lOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RzJHXTO0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RzJHXTO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739192205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Dwe0knuMGyvTG+alA/gZ4MaUc4P4I+dwLLM5vkw9X7M=;
	b=RzJHXTO02RVxo1W3yrHWlPONT/pXN77dfPMSuDBC+KOm3Dqi21dSJYY/MPK167RvnrZSvv
	RmPJKvNFPl6NV0lY1nfst1Hom1u2hhULmP2/iVN8zNHM/+tZIb1DxUzOIz7/tuXtPkjqNe
	KUD9LwAH7FwPjE3vxxkltJ/t3BhZE3Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-nRVfF6URPIOAhoW_RE1nFQ-1; Mon, 10 Feb 2025 07:56:44 -0500
X-MC-Unique: nRVfF6URPIOAhoW_RE1nFQ-1
X-Mimecast-MFC-AGG-ID: nRVfF6URPIOAhoW_RE1nFQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dc32f753dso1505211f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739192203; x=1739797003;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwe0knuMGyvTG+alA/gZ4MaUc4P4I+dwLLM5vkw9X7M=;
        b=ii/5MHhmU5cebYYA9ZD7nHuqCr5KQegpUL5G8TGCrlKooohQRnpTkxhYT84ycqAM8B
         UKS9mL9ILBJG7lP0LzqQmAGOMXdgVbVYvNSliSE+TWg4B11riEopKkU+P05VPQRcKIJq
         iz6ZZZd0Lx6hFcDlmFpPVnGEhqy1WeEHwvYHWaA7Cw6KKplvx08y+jszi5OCPhZPPaxo
         wTR5hwaAg/ZeXCRsamHPXrl4a1xzLbeRSWs7stYQ42q8TVK3DLaXNgbTEhp7HzPQkIbn
         osKxDjTRhEHIZlVG3h665nyKDZA0jCDDLFe85J2scak/5xd7Y3M8RjliuJvic1tD0rcU
         olOQ==
X-Gm-Message-State: AOJu0YzfCz7R5W0L5UC+fbmcU7KStkdpRaxtEoRGJ4slvlx7i4eqrX2e
	mW280nPetlsu45noMsgmMIYOK9VJ0d18kEm+DMvBKrUA1M7fk6AtO4EJLEjBf3hz41oN4RSuUPs
	nMAbPxkUQS7m5Xkb3GCXdVwSe+G2cRJ7zbj+5kDqzQtDaQhuNi5Py4k9HWg/5pg==
X-Gm-Gg: ASbGncsSC+R6cnkne1iblJ6oDsj3DBstoZOg0o072nYktXXdQHauwbLUFrSwJxWnRlR
	rbx0lKlANgZdxLd4/1bua+h1JEN7e9L6rWMwbHU4setxCiZpwEmPXZnug3WCR9BOaBHXgiYowKU
	l5VC3HygZdq08yJgC5UcEOXLaDwSL9PZZ3w5K/+0tjgtv96nXahpunNNhbho0DUlqqq1d8G8JVU
	lby7cwhejsfhERgDWAJQcJAQGUVoRtVLdwKlMuWQMqS3E7+JSmrllPRQDtybheVZtosCbIIjDEh
	Bfg0QjT9T4F0zMVy8k9Nwe25ZszPqgk=
X-Received: by 2002:a05:6000:156e:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38dc90e23f7mr11263098f8f.10.1739192203051;
        Mon, 10 Feb 2025 04:56:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpJ9o1Q4Lzes7BSra0z+M0VGeZTbytnOQBUuJG+vQ2rJbJJWvPQdLi2OklwYh2HsLjIgXYdA==
X-Received: by 2002:a05:6000:156e:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38dc90e23f7mr11263072f8f.10.1739192202559;
        Mon, 10 Feb 2025 04:56:42 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5e6f027sm10428124f8f.4.2025.02.10.04.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:56:42 -0800 (PST)
Message-ID: <59ad26ac442aef340f819ed080684d72b50e1c57.camel@redhat.com>
Subject: Re: [RFC PATCH 00/11] rv: Add scheduler specification monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-trace-kernel@vger.kernel.org, John Kacur <jkacur@redhat.com>, Clark
 Williams <williams@redhat.com>
Date: Mon, 10 Feb 2025 13:56:34 +0100
In-Reply-To: <Z6YYPAiM0itlIVAH@jlelli-thinkpadt14gen4.remote.csb>
References: <20250206080952.98478-1-gmonaco@redhat.com>
	 <czykavxpz46nwnelml6yorg3tvmyjvczqogeuqzji6qrfd2peu@qxr6wucv6mrj>
	 <847c962745ef5bce757b9ae257ae279913ac711c.camel@redhat.com>
	 <Z6YYPAiM0itlIVAH@jlelli-thinkpadt14gen4.remote.csb>
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

On Fri, 2025-02-07 at 15:27 +0100, Juri Lelli wrote:
>=20
> Right. I guess I wonder if we can find a way to inject kernel
> problems
> somehow, so that model(s) can be further tested explicitly thus
> making
> us confident that they will be able to identify real problems when
> they
> occur.
>=20

I sketched it quickly and I wouldn't include it in this series not to
make it heavier, but if you want to play with it I wrote a patch
exporting a function to inject events and building a kernel module
calling the function periodically.

You'd need to build the kernel with CONFIG_RV_DEBUG_TRIGGER and do
something like

  # modprobe monitor=3Dsnroc event=3D1
  # ./tools/verification/rv/rv mon snroc -r printk
  # dmesg
  [   88.327892] rv: monitor snroc does not allow event sched_switch_in
on state own_context
 =20
You can omit event (in which case it will select the first) and select
different monitors. In case of per-task monitors (as the one above),
some events may never trigger errors, but if you choose carefully while
modprobe-ing you should be fine. The events numbers are defined as enum
in the monitor header (e.g. snroc.h).

Subject: [PATCH] rv: Add infrastructure to trigger debug events

RV monitors are supposed to test some core functionality and, in ideal
scenarios, should never fire errors. This implies that we cannot test if
reactors work as expected on a properly set monitor, which may add false
positives.
A common example is a monitor where no da_handle_start_event_ function
is called, in such a case, the monitor would never start, so it never
produces events nor errors.
It is easy to understand this monitor is wrongly configured by checking
the events tracepoints, but if a test setup expects the monitor to
trigger reactors in case of failure, it will erroneously flag such a
monitor as correct.

Enable creation for each monitor of an exported function to simulate
triggering an event. This function can be used from any other kernel
code, including modules, to inject events into the monitor for debugging
purposes.
This can effectively used to test reactors on monitors which, otherwise,
would never fire any error.
The function has the following prototype, where name is the monitor name:
    bool da_trigger_event_name(int event)
event can be any integer, but real events will be triggered only if the
supplied number is a valid event for the monitor, otherwise nothing
happens and the function returns false.
If this configuration is disabled, no function is defined.

Also add a module that relies on this function to periodically trigger
events to the selected monitor.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/rv/da_monitor.h            |  59 +++++++++++++++-
 kernel/trace/rv/Kconfig            |  27 +++++++
 kernel/trace/rv/Makefile           |   1 +
 kernel/trace/rv/rv_debug_trigger.c | 110 +++++++++++++++++++++++++++++
 4 files changed, 195 insertions(+), 2 deletions(-)
 create mode 100644 kernel/trace/rv/rv_debug_trigger.c

diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
index 510c88bfabd43..ed9f66c53ed7b 100644
--- a/include/rv/da_monitor.h
+++ b/include/rv/da_monitor.h
@@ -514,6 +514,59 @@ da_handle_start_event_##name(struct task_struct *tsk, =
enum events_##name event)
 	return 1;										\
 }
=20
+#ifdef CONFIG_RV_DEBUG_TRIGGER
+
+/*
+ * Handle event for implicit monitors
+ */
+#define DECLARE_DA_MON_TRIGGER_IMPLICIT(name)							\
+/*												\
+ * da_trigger_event_##name - trigger an event from outside the monitor				=
\
+ *												\
+ * This function is used only for debug purposes, it calls the function to=
			\
+ * handle events to simulate the occurrence of the event. This may can be	=
		\
+ * useful to make the monitor fail and test reactors but may have unintend=
ed			\
+ * consequences.										\
+ * For simplicity, accept the event as int but validate its value and retu=
rn			\
+ * true if the event was valid, false if not and we did not trigger it.			=
	\
+ */												\
+bool da_trigger_event_##name(int event);							\
+bool da_trigger_event_##name(int event)								\
+{												\
+	if (event < 0 || event >=3D event_max_##name)						\
+		return false;									\
+	da_handle_event_##name(event);								\
+	return true;										\
+}												\
+EXPORT_SYMBOL(da_trigger_event_##name);
+
+/*
+ * Handle event for per-task monitors
+ */
+#define DECLARE_DA_MON_TRIGGER_PER_TASK(name)							\
+/*												\
+ * da_trigger_event_##name - trigger an event from outside the monitor				=
\
+ *												\
+ * This function is used only for debug purposes, it calls the function to=
			\
+ * handle events to simulate the occurrence of the event. This may can be	=
		\
+ * useful to make the monitor fail and test reactors but may have unintend=
ed			\
+ * consequences.										\
+ * For simplicity, accept the event as int but validate its value and retu=
rn			\
+ * true if the event was valid, false if not and we did not trigger it.			=
	\
+ * Also to keep it simple for the caller, fill the task with current.				\
+ */												\
+bool da_trigger_event_##name(int event);							\
+bool da_trigger_event_##name(int event)								\
+{												\
+	if (event < 0 || event >=3D event_max_##name)						\
+		return false;									\
+	da_handle_event_##name(current, event);							\
+	return true;										\
+}												\
+EXPORT_SYMBOL(da_trigger_event_##name);
+
+#endif /* CONFIG_RV_DEBUG_TRIGGER */
+
 /*
  * Entry point for the global monitor.
  */
@@ -534,7 +587,8 @@ DECLARE_AUTOMATA_HELPERS(name, type)								\
 DECLARE_DA_MON_GENERIC_HELPERS(name, type)							\
 DECLARE_DA_MON_MODEL_HANDLER_IMPLICIT(name, type)						\
 DECLARE_DA_MON_INIT_PER_CPU(name, type)								\
-DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT(name, type)
+DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT(name, type)						\
+DECLARE_DA_MON_TRIGGER_IMPLICIT(name)
=20
 /*
  * Entry point for the per-task monitor.
@@ -545,4 +599,5 @@ DECLARE_AUTOMATA_HELPERS(name, type)								\
 DECLARE_DA_MON_GENERIC_HELPERS(name, type)							\
 DECLARE_DA_MON_MODEL_HANDLER_PER_TASK(name, type)						\
 DECLARE_DA_MON_INIT_PER_TASK(name, type)							\
-DECLARE_DA_MON_MONITOR_HANDLER_PER_TASK(name, type)
+DECLARE_DA_MON_MONITOR_HANDLER_PER_TASK(name, type)						\
+DECLARE_DA_MON_TRIGGER_PER_TASK(name)
diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
index b39f36013ef23..6aa927db99ee8 100644
--- a/kernel/trace/rv/Kconfig
+++ b/kernel/trace/rv/Kconfig
@@ -62,3 +62,30 @@ config RV_REACT_PANIC
 	help
 	  Enables the panic reactor. The panic reactor emits a printk()
 	  message if an exception is found and panic()s the system.
+
+config RV_DEBUG_TRIGGER
+	bool "Runtime verification debug trigger event"
+	default n
+	depends on RV
+	help
+	  Enables creation for each monitor of an exported function to simulate
+	  triggering an event. This function can be used from any other kernel
+	  code, including modules, to inject events into the monitor for debuggin=
g
+	  purposes. A common use-case is to test reactors on monitors which,
+	  otherwise, would never fire any error.
+	  Use the function with care as it might have unintended consequences.
+	  The function has the following prototype, where name is the monitor nam=
e:
+	      bool da_trigger_event_name(int event)
+	  event can be any integer, but real events will be triggered only if the
+	  supplied number is a valid event for the monitor, otherwise nothing
+	  happens and the function returns false.
+
+	  This configuration enables compilation of the rv_debug_trigger kernel
+	  module which relies on this function to periodically trigger events.
+	  If the configuration is disabled, no function is defined.
+
+config RV_DEBUG_TRIGGER_MODULE
+	tristate
+	default m if RV_DEBUG_TRIGGER
+	depends on RV
+	depends on RV_DEBUG_TRIGGER
diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
index f9b2cd0483c3c..47207c81260ee 100644
--- a/kernel/trace/rv/Makefile
+++ b/kernel/trace/rv/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_RV_MON_SNCID) +=3D monitors/sncid/sncid.o
 obj-$(CONFIG_RV_REACTORS) +=3D rv_reactors.o
 obj-$(CONFIG_RV_REACT_PRINTK) +=3D reactor_printk.o
 obj-$(CONFIG_RV_REACT_PANIC) +=3D reactor_panic.o
+obj-$(CONFIG_RV_DEBUG_TRIGGER_MODULE) +=3D rv_debug_trigger.o
diff --git a/kernel/trace/rv/rv_debug_trigger.c b/kernel/trace/rv/rv_debug_=
trigger.c
new file mode 100644
index 0000000000000..fa5bbdf14ca5f
--- /dev/null
+++ b/kernel/trace/rv/rv_debug_trigger.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2028 Red Hat, Inc. Gabriele Monaco <gmonaco@redhat.c=
om>
+ *
+ * RV debug trigger module:
+ *   Insert this module to periodically trigger a fake event to the monito=
r
+ *   provided as parameter. The numerical value of the event can be set as
+ *   parameter as well.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rv.h>
+
+bool da_trigger_event_wip(int event);
+bool da_trigger_event_wwnr(int event);
+bool da_trigger_event_tss(int event);
+bool da_trigger_event_sco(int event);
+bool da_trigger_event_snroc(int event);
+bool da_trigger_event_scpd(int event);
+bool da_trigger_event_snep(int event);
+bool da_trigger_event_sncid(int event);
+
+/* do not allow periodicity lower than 1 us */
+#define MIN_PERIOD 1000
+
+static char monitor[MAX_DA_NAME_LEN] =3D "wwnr";
+module_param_string(monitor, monitor, sizeof(monitor), 0644);
+
+static int event =3D 0;
+module_param(event, int, 0644);
+
+static int period =3D 1000000;
+module_param(period, int, 0644);
+
+static bool (*trigger)(int event);
+static struct hrtimer periodic_timer;
+
+static enum hrtimer_restart trigger_worker(struct hrtimer *timer)
+{
+	hrtimer_forward_now(timer, period);
+	trigger(event);
+	return HRTIMER_RESTART;
+}
+
+static int __init rv_debug_trigger_init(void)
+{
+#ifdef CONFIG_RV_MON_WIP
+	if (!strcmp(monitor, "wip"))
+		trigger =3D da_trigger_event_wip;
+#endif
+#ifdef CONFIG_RV_MON_WWNR
+	if (!strcmp(monitor, "wwnr"))
+		trigger =3D da_trigger_event_wwnr;
+#endif
+#ifdef CONFIG_RV_MON_TSS
+	if (!strcmp(monitor, "tss"))
+		trigger =3D da_trigger_event_tss;
+#endif
+#ifdef CONFIG_RV_MON_SCO
+	if (!strcmp(monitor, "sco"))
+		trigger =3D da_trigger_event_sco;
+#endif
+#ifdef CONFIG_RV_MON_SNROC
+	if (!strcmp(monitor, "snroc"))
+		trigger =3D da_trigger_event_snroc;
+#endif
+#ifdef CONFIG_RV_MON_SCPD
+	if (!strcmp(monitor, "scpd"))
+		trigger =3D da_trigger_event_scpd;
+#endif
+#ifdef CONFIG_RV_MON_SNEP
+	if (!strcmp(monitor, "snep"))
+		trigger =3D da_trigger_event_snep;
+#endif
+#ifdef CONFIG_RV_MON_SNCID
+	if (!strcmp(monitor, "sncid"))
+		trigger =3D da_trigger_event_sncid;
+#endif
+
+	if (!trigger) {
+		pr_warn("Invalid monitor %s\n", monitor);
+		return -EINVAL;
+	}
+	if (!trigger(event)) {
+		pr_warn("Invalid event %d for monitor %s\n", event,
+			monitor);
+		return -EINVAL;
+	}
+	if (period < MIN_PERIOD) {
+		pr_warn("Use at least %d us as period, %d provided\n",
+			MIN_PERIOD, period);
+		return -EINVAL;
+	}
+	hrtimer_init(&periodic_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	periodic_timer.function =3D trigger_worker;
+	hrtimer_start(&periodic_timer, period, HRTIMER_MODE_REL);
+	return 0;
+}
+
+static void __exit rv_debug_trigger_exit(void)
+{
+	hrtimer_cancel(&periodic_timer);
+}
+
+module_init(rv_debug_trigger_init);
+module_exit(rv_debug_trigger_exit);
+
+MODULE_AUTHOR("Gabriele Monaco <gmonaco@redhat.com>");
+MODULE_DESCRIPTION("RV debug trigger: periodically trigger a fake event.")=
;
+MODULE_LICENSE("GPL");

base-commit: df5b7771dc64df426b4bd52c7d591a316b839570
--=20
2.48.1


