Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654AE236A99
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169539; cv=none; b=Qvfrvo7POq6KhpX5JDLt0v9f6gNKlpC0FcxGfkxrYGF48j99HKrS1VcqRQCAm7xV+18E/wxlDz7qOBoDkc1Pm8Zh61tUPlEJa/re0EnFNugfXuot812lnwySjLNiJboWlSpWjnKm2TsIrrVP7uJBUwe/+blQtQDYnAfb/zeMakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169539; c=relaxed/simple;
	bh=p01vA1PBCXZmwTD9ipYGalgea25sUjLAH06zPyyCzos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZknmREEf1PLX/ggAISdFXjtH5JGdY/y/WHfeKPNuCeIAdA48t7f3WUhnNzAT6JZirwFG2417kRhdF5W/Q2qQaHiiwJKTIbjHB1M2+ZErnLnhX45jlmdrvmgXQLK+fOwsp57/vFGiByi0aR88pqMU5+1GLtrbd9e+PdYUavuTdoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zm9qftkO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zm9qftkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750169536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tDQawTMiyaVh5j2oaJP/el64wEr3+7ENbyMBrC9glDw=;
	b=Zm9qftkOpvnu+vpPoqdfuba0xsS9wXYSopKrKx8SmeVXZj9Hy53kZiWXYTU/q4UiGXSdGJ
	z6h9lvE8lBkV3o8sBuKsGQzGWJWfSitvADaRFdYa8ZBrhCImvwcfbZXvJ5iM+1roHV3LrD
	RRODU90J9s8seQbLQtmT1O7rWVDQ7oc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-U5OE1vtWPteRW_TlH-FVXQ-1; Tue, 17 Jun 2025 10:12:09 -0400
X-MC-Unique: U5OE1vtWPteRW_TlH-FVXQ-1
X-Mimecast-MFC-AGG-ID: U5OE1vtWPteRW_TlH-FVXQ_1750169528
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so37564505e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169528; x=1750774328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDQawTMiyaVh5j2oaJP/el64wEr3+7ENbyMBrC9glDw=;
        b=xGq6WCVKLWafVzI0zB8wDo2lmE9Ry81mHapEaDA4TNHNtO+nGSlHei48x2mqA8J/2/
         t+niM0rRkktboq570nN8bsW/YBCriIdqK+dF4MdLyqLpwWGisjcTD7tFYKtRTtHACKdk
         zCwiWBVCztgDCbP7lrfDexNj/tPU1XQJ8iwHcxWzs1ucKLrV63gKstkKeceXBbrHfFr1
         DJLFHWlDD4v1FbfF/tGiSviooSj+4N/w5S9At4Z5KnQxOoIWlhT+5lZui09OoM7lOweD
         +kmQN+yDHRq35bRElMvJ2HdLei8+xX7hKfP1i0FMJy6Uox1V3N7xk8r0wHnhOLFHf2sL
         un5A==
X-Forwarded-Encrypted: i=1; AJvYcCVKw/GBycmIu2zMXqefBo4YpFFee7U90oEjoDuEcSXlZd8l7CG8Ckuw1Mfg74WGptzMlofdb15C1RTDKEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7JZz6jZtnNnveZtAi2HKjQOhrk8QA/OMm5YQ2ailK44LudjvB
	cYfyUScKFZKV6sHaJm29EEmJgOPSShJUTjRqJhvRrSlb+Lxfq7kXNlivMsq5nIpAraPH8WLM8oK
	NzaAr5mM5hfFBfwZSRAR80kdgEjNgdfwreKVhoaHGCMBw8dj42n7vLyUuIDg9dMNLng==
X-Gm-Gg: ASbGncuBiFsKxPhMrm9uGvGgsNs9eeSS5rrvVxR12vPnBdF/21ZXCcKBkZQHkOqPnhE
	f2UMFSCzCIz87e3fowSdJChI7/Lz4oP9EItD/fOVctSzK+G/Y3+skFAsPnmAybp/rG0wgaStWR3
	3GDf/vkx6C2dZW3y+3g7HuaFpCqiwnuMdeKawFeVjq0AYamKc1vU1jvjV0nvpjAFIRf/xK/uqI9
	yCgLZ+8+ON6/WZkzrdVcUqstWFkypBtP8hNF9z0UhGk2JAhh034bUBFx0sxDJpp0T+NdqL7NDI/
	yiqeEf+e/v5UXFMCXJkabwEnESda
X-Received: by 2002:a05:600c:1f94:b0:450:d019:263 with SMTP id 5b1f17b1804b1-4533cad3c9cmr144825125e9.18.1750169528361;
        Tue, 17 Jun 2025 07:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpOFjhK6ipEOxmVfRV3fbYV+dQY5pR+5sd2WS6/OERnStK2AUSFKitcs+M6aAjkClrM9e7nQ==
X-Received: by 2002:a05:600c:1f94:b0:450:d019:263 with SMTP id 5b1f17b1804b1-4533cad3c9cmr144824595e9.18.1750169527774;
        Tue, 17 Jun 2025 07:12:07 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.200.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e156e8dsm183349865e9.31.2025.06.17.07.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:12:06 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:12:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/3] vsock/test: Introduce get_transports()
Message-ID: <sbfcl6s233hmkry3ecq6rwzvpl2gw2z23g2dsymruetn436ou7@znv2hen5wkde>
References: <20250611-vsock-test-inc-cov-v3-0-5834060d9c20@rbox.co>
 <20250611-vsock-test-inc-cov-v3-2-5834060d9c20@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250611-vsock-test-inc-cov-v3-2-5834060d9c20@rbox.co>

On Wed, Jun 11, 2025 at 09:56:51PM +0200, Michal Luczaj wrote:
>Return a bitmap of registered vsock transports. As guesstimated by grepping
>/proc/kallsyms (CONFIG_KALLSYMS=y) for known symbols of type `struct
>vsock_transport`, or `struct virtio_transport` in case the vsock_transport
>is embedded within.
>
>Note that the way `enum transport` and `transport_ksyms[]` are defined
>triggers checkpatch.pl:
>
>util.h:11: ERROR: Macros with complex values should be enclosed in parentheses
>util.h:20: ERROR: Macros with complex values should be enclosed in parentheses
>util.h:20: WARNING: Argument 'symbol' is not used in function-like macro
>util.h:28: WARNING: Argument 'name' is not used in function-like macro
>
>While commit 15d4734c7a58 ("checkpatch: qualify do-while-0 advice")
>suggests it is known that the ERRORs heuristics are insufficient, I can not
>find many other places where preprocessor is used in this
>checkpatch-unhappy fashion. Notable exception being bcachefs, e.g.
>fs/bcachefs/alloc_background_format.h. WARNINGs regarding unused macro
>arguments seem more common, e.g. __ASM_SEL in arch/x86/include/asm/asm.h.
>
>In other words, this might be unnecessarily complex. The same can be
>achieved by just telling human to keep the order:
>
>enum transport {
>	TRANSPORT_LOOPBACK = BIT(0),
>	TRANSPORT_VIRTIO = BIT(1),
>	TRANSPORT_VHOST = BIT(2),
>	TRANSPORT_VMCI = BIT(3),
>	TRANSPORT_HYPERV = BIT(4),
>	TRANSPORT_NUM = 5,
>};
>
> #define KSYM_ENTRY(sym) "d " sym "_transport"
>
>/* Keep `enum transport` order */
>static const char * const transport_ksyms[] = {
>	KSYM_ENTRY("loopback"),
>	KSYM_ENTRY("virtio"),
>	KSYM_ENTRY("vhost"),
>	KSYM_ENTRY("vmci"),
>	KSYM_ENTRY("vhs"),
>};
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> tools/testing/vsock/util.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
> tools/testing/vsock/util.h | 29 ++++++++++++++++++++++++
> 2 files changed, 85 insertions(+)

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index b7b3fb2221c1682ecde58cf12e2f0b0ded1cff39..803f1e075b62228c25f9dffa1eff131b8072a06a 100644
>--- a/tools/testing/vsock/util.c
>+++ b/tools/testing/vsock/util.c
>@@ -7,6 +7,7 @@
>  * Author: Stefan Hajnoczi <stefanha@redhat.com>
>  */
>
>+#include <ctype.h>
> #include <errno.h>
> #include <stdio.h>
> #include <stdint.h>
>@@ -23,6 +24,9 @@
> #include "control.h"
> #include "util.h"
>
>+#define KALLSYMS_PATH		"/proc/kallsyms"
>+#define KALLSYMS_LINE_LEN	512
>+
> /* Install signal handlers */
> void init_signals(void)
> {
>@@ -854,3 +858,55 @@ void enable_so_linger(int fd, int timeout)
> 		exit(EXIT_FAILURE);
> 	}
> }
>+
>+static int __get_transports(void)
>+{
>+	char buf[KALLSYMS_LINE_LEN];
>+	const char *ksym;
>+	int ret = 0;
>+	FILE *f;
>+
>+	f = fopen(KALLSYMS_PATH, "r");
>+	if (!f) {
>+		perror("Can't open " KALLSYMS_PATH);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	while (fgets(buf, sizeof(buf), f)) {
>+		char *match;
>+		int i;
>+
>+		assert(buf[strlen(buf) - 1] == '\n');
>+
>+		for (i = 0; i < TRANSPORT_NUM; ++i) {
>+			if (ret & BIT(i))
>+				continue;
>+
>+			/* Match should be followed by '\t' or '\n'.
>+			 * See kallsyms.c:s_show().
>+			 */
>+			ksym = transport_ksyms[i];
>+			match = strstr(buf, ksym);
>+			if (match && isspace(match[strlen(ksym)])) {
>+				ret |= BIT(i);
>+				break;
>+			}
>+		}
>+	}
>+
>+	fclose(f);
>+	return ret;
>+}
>+
>+/* Return integer with TRANSPORT_* bit set for every (known) registered vsock
>+ * transport.
>+ */
>+int get_transports(void)
>+{
>+	static int tr = -1;
>+
>+	if (tr == -1)
>+		tr = __get_transports();
>+
>+	return tr;
>+}
>diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
>index 0afe7cbae12e5194172c639ccfbeb8b81f7c25ac..71895192cc02313bf52784e2f77aa3b0c28a0c94 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -3,8 +3,36 @@
> #define UTIL_H
>
> #include <sys/socket.h>
>+#include <linux/bitops.h>
>+#include <linux/kernel.h>
> #include <linux/vm_sockets.h>
>
>+/* All known vsock transports, see callers of vsock_core_register() */
>+#define KNOWN_TRANSPORTS(x)		\
>+	x(LOOPBACK, "loopback")		\
>+	x(VIRTIO, "virtio")		\
>+	x(VHOST, "vhost")		\
>+	x(VMCI, "vmci")			\
>+	x(HYPERV, "hvs")
>+
>+enum transport {
>+	TRANSPORT_COUNTER_BASE = __COUNTER__ + 1,
>+	#define x(name, symbol)		\
>+		TRANSPORT_##name = BIT(__COUNTER__ - TRANSPORT_COUNTER_BASE),
>+	KNOWN_TRANSPORTS(x)
>+	TRANSPORT_NUM = __COUNTER__ - TRANSPORT_COUNTER_BASE,
>+	#undef x
>+};
>+
>+static const char * const transport_ksyms[] = {
>+	#define x(name, symbol) "d " symbol "_transport",
>+	KNOWN_TRANSPORTS(x)
>+	#undef x
>+};
>+
>+static_assert(ARRAY_SIZE(transport_ksyms) == TRANSPORT_NUM);
>+static_assert(BITS_PER_TYPE(int) >= TRANSPORT_NUM);
>+
> /* Tests can either run as the client or the server */
> enum test_mode {
> 	TEST_MODE_UNSET,
>@@ -82,4 +110,5 @@ void setsockopt_timeval_check(int fd, int level, int optname,
> 			      struct timeval val, char const *errmsg);
> void enable_so_zerocopy_check(int fd);
> void enable_so_linger(int fd, int timeout);
>+int get_transports(void);
> #endif /* UTIL_H */
>
>-- 
>2.49.0
>

