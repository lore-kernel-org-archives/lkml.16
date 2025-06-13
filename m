Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538BD204689
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830346; cv=none; b=o0fVTBe/A+n4pHlSgV1afiiAw+Xq2oOsu3UgHVrKQes5SlUXZTF0XsvQRaGIEvmGNtcQ4ph0e6dolp8ZmfH6T+QxkeyuZot5pXBz2ibaXGKpwQ/LFkOhcrup5L+9PFOUfIlKBegzw3nyZoZjciPWnF7Je/qN9mzJOBX03V1Rxbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830346; c=relaxed/simple;
	bh=089E9zzYEf4HWcrTHbQ4OnUMHP87EOWqgFH1D8nIBBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SorNST+hvKCQpmaMi/vOY350TE/beHgJgRGtPtkfILMwgsrTOF+PanCt8vaUcsBL3xmnF3xgPwXUZuXUuJdN1MJJHb+MbG9pNX/uFelOICZwedNrkRGWI3raLBnbcC+ARaCZCsaQU08ERvrJ+nTX5oVwaprg3LMMal18AG+0K90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a/Vt6Af1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a/Vt6Af1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749830343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXd2E9l4gQdhkRDehHJQuHc3ndERcngM1dXOR6Z8sV4=;
	b=a/Vt6Af14ujzYhlUzEupdbxyyCgsLOcmbcyYMZFR54IY2XKpw/XJFZQDZYmXwNj2TSb07u
	cEYx2FhmD+Seije61Zv1fmaiSB34EOWfkD3T70UJzqwea29irMQulU0MxbEBUvG7NRZ5TF
	dr+XvRWvMoLprJehv4P2jxF1seYqnOE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-HYXxPC1mN8CagQ-HrUQH3Q-1; Fri, 13 Jun 2025 11:59:02 -0400
X-MC-Unique: HYXxPC1mN8CagQ-HrUQH3Q-1
X-Mimecast-MFC-AGG-ID: HYXxPC1mN8CagQ-HrUQH3Q_1749830341
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so1353506f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830341; x=1750435141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXd2E9l4gQdhkRDehHJQuHc3ndERcngM1dXOR6Z8sV4=;
        b=E+hQ5SIMeT8h92z4LTxKm1vSku72WwMs9zspWMCCPiEiC7Dmu1srBGcBhXf8opIuLf
         vdB03Fybgu37dZeKKqvHYnCiRV+P/okLmITruzBSO2fv2VqcUBRYIEaxcE1ARyX9IoXW
         NInc+gL4MpMbEkmX8+61k2ofFEzv9Rwu1Acpfx/UAtoNLwMJ+kZ3n5mJobMTte4yzrhO
         swEcFDSBhyNNzI0UYrZRQS5R7iMuaZcrdBRr1gKjzTB7TLyVH8WDTcIBWcuxbTrVQZ/0
         +Ec0YWSabcd28tw+/iiB4+xxtda1QmRZxc1w5odquQT7ENLXq0Xm4QbMz4GG2zmZwKCW
         phMw==
X-Forwarded-Encrypted: i=1; AJvYcCWadKC1q19CWMGmmS50HlaxI7bUdJSRWvsF3iR+38t3M8u6obtkaceNJNn9aojjFQJbf9M5U9r+YQsZxAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Ruh/+d+Gi3qEq3Yg9uYCHzAiZriGSS8ar7+cYoTvNDNWqI2y
	L46/+U4mqHtBTLSxyrLJ/0VQdqXUw3nC1Pc1Ygl0vFUpewqeS5GFxu/GICchKc+tiDjsbzW+ZfN
	3psdA0huQfhWXGfj1dQcdzCAp4QVvp8mCmzgDTPL0BuvcWUH81cH+lhJFkdrgxejbgA==
X-Gm-Gg: ASbGncv9kmPKvYO4AwURqBIXBwg+U3KJIpRQSzlefKcoLus432zD4MQRknwJFJcAbst
	IOcO7FMohpV+7UVKknZGk+l1h7nEiYT0+Zb66EuRdqlL730XhD5MBSVhRQJD0BtlDiHI6lfFAvg
	1JoddHKXABw/fQ83ilQIiQklfgp5MbV21LKqvlfH3tkhsmNh1KO2CIG5LRWFgn6I78hldEKxZY3
	mJlVs5wamRYx5NdNx+tRHWiDzJQ4WnfrclV46v1qeMdSaTj4N1xV6SJug8NhQlm50jMW5hJgs6t
	F6sDmOVVHXffKjPFc7U+Ndbs0RA=
X-Received: by 2002:a05:6000:250c:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a5723678b8mr327527f8f.9.1749830340620;
        Fri, 13 Jun 2025 08:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDe3Os6nXZXseBeVEvQKPiGia/OhIl4+MhQzdYYyR491IpRR8nlQFkCg6z9FLG8MlcAN9QNw==
X-Received: by 2002:a05:6000:250c:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a5723678b8mr327494f8f.9.1749830340098;
        Fri, 13 Jun 2025 08:59:00 -0700 (PDT)
Received: from leonardi-redhat ([176.206.17.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm2716266f8f.2.2025.06.13.08.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:58:59 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:58:57 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/3] vsock/test: Introduce get_transports()
Message-ID: <axujhror2lskp3bxfslursibmlo6qwuzhc2tgfb4jea7progc3@4op6ajqu35c2>
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

Hi Michal,

On Wed, Jun 11, 2025 at 09:56:51PM +0200, Michal Luczaj wrote:
>Return a bitmap of registered vsock transports. As guesstimated by 
>grepping
>/proc/kallsyms (CONFIG_KALLSYMS=y) for known symbols of type `struct
>vsock_transport`, or `struct virtio_transport` in case the 
>vsock_transport
>is embedded within.
>
>Note that the way `enum transport` and `transport_ksyms[]` are defined
>triggers checkpatch.pl:
>
>util.h:11: ERROR: Macros with complex values should be enclosed in 
>parentheses
>util.h:20: ERROR: Macros with complex values should be enclosed in 
>parentheses
>util.h:20: WARNING: Argument 'symbol' is not used in function-like 
>macro
>util.h:28: WARNING: Argument 'name' is not used in function-like macro
>
>While commit 15d4734c7a58 ("checkpatch: qualify do-while-0 advice")
>suggests it is known that the ERRORs heuristics are insufficient, I can 
>not
>find many other places where preprocessor is used in this
>checkpatch-unhappy fashion. Notable exception being bcachefs, e.g.
>fs/bcachefs/alloc_background_format.h. WARNINGs regarding unused macro
>arguments seem more common, e.g. __ASM_SEL in 
>arch/x86/include/asm/asm.h.
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

Checked the code and tested `get_transports()`. It works as expected!
I'm not sure about the `checkpatch.pl` errors, but code LGTM to me.

Tested-by: Luigi Leonardi <leonardi@redhat.com>
Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

Thanks!
Luigi

