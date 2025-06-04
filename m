Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272528C5B5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028093; cv=none; b=r9XFmeHCQqDEkqzD8LUnE81s+KlTqVhHzp9l+tY+dh4UFKEurGe40L4y7Io2Ptj2Q86aiwzHB3vXqsK8EQTclXGMBn6ZOoJ8De8afAFkgkD84ttxGXhTbI7k3w1HL772Hn022OVuHP/8N7il4ucyi+8SR7gP2kSKWMON40jpO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028093; c=relaxed/simple;
	bh=AWVVRYeTcC5KIYUL/i0dVqV59Y6SWKAcZkYtIStbTyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dr4IRfRqQ6cO/xDMN6fVNxWBnoEzbGw6L+wFIupMaHrZ5gyc+wd8UCfKzYssMXnUd/W7hRE+cONudzLmXNGaBKd9HgRM2EdzCityDSY3ELnIWacG0jPKh7gh/iK6HKrhYidEX/xXtCOdbZlDkxVPkoOfCWyjvI41b/2rQrfDHu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bCJHA/Xa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bCJHA/Xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749028090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k2zCiWY9Cu6i9hpLnZ1UCqekXGUFWqxbi6R4HONx48g=;
	b=bCJHA/Xatrvg0aEhWaDkrKMrm2ekU4uGe8iO376Kld8BMk5geKIVs4gQ1r3id+AWJvxjkg
	GZX7IOtJAWFjPWd90GjdKl4hg5rcCQYQGfe1sHA8UR87hg5CzO6nYjkQTxEW0A4DSQEKHB
	GLkYL9uf2NOa4ivXiGOGc2Jdcr/uiyw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-IAvvhCq0NF2lO0qx9DG-MA-1; Wed, 04 Jun 2025 05:08:09 -0400
X-MC-Unique: IAvvhCq0NF2lO0qx9DG-MA-1
X-Mimecast-MFC-AGG-ID: IAvvhCq0NF2lO0qx9DG-MA_1749028088
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso2395190f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028088; x=1749632888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2zCiWY9Cu6i9hpLnZ1UCqekXGUFWqxbi6R4HONx48g=;
        b=wjAue3cZ+WNu+1loLzpUUfORhSov5KSXNXAsNgJvqdHpkiPjgk3T/BKqZfoMiDcAuB
         ueYrEklkCSS1BghFkFEVwYAOkOH/23ZQt9k6FtaV4On6mrIFJRSPGmUHwyUssdseWP2j
         oBuelJpBIxpAXHB+Z0UqrBTXmTOe93433ZvJOHS81/rRhJw+PrcHGQFli/tTz8Mzj5UJ
         QFBYdKJSWkiW0Jj2FBLxT+FF8uf7eC1syJe1lqRSm4KME4TsI0ISR9W9Zw0bxxCbNIR3
         Sn1oVdl7rIFWB/xjgFFsyU0jGLqkUTKYys/DpiSp64XAi4ocLhPXeOxWL+fNCB45D65d
         rSxg==
X-Forwarded-Encrypted: i=1; AJvYcCWSvtz5/P6xaE1FoCvE3RLi7AtfiWvo69Z1fE9k6EsZ59v18aQ8V9QZDKYoKopiov+vMthjJ9rN00/NCVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXS7VcanQoJM1z4fMj3uId9Q0bOgFOIsuThGzq2FdN1Cw42b/6
	sjHndR53PI6R7j1KVna2xopamMJME2y4Os3dDq8Gz14/4n7B7nTc+9/gKvfO+Fq8SHn/GBKd+kA
	9/3PEsHNquXsfpO5j0qMzDkZGvXfaWZs8QzfV0+IIUfzz8YhkfQ4SUkG2SDKV9RrNtA==
X-Gm-Gg: ASbGncv7Ki0PXmafpIJ7XT6GrCGzHTe6s4St/L82IkjpK7YqP+gS0q+Pa5JkWgB1Zbz
	5j6E/hJ1TD2nLSar1s08J/Soo3xBFfXL/yB9UkZHLrUmhCarkXZsTNt9aaBmA4nEW4V2DptL7wg
	K+kgrXdy1j95xsB+OBQs9VhQUlyoCNMZom6J4rp7vQCO7aKNxc2lLNZWU5uC+8DW7ldpRSEIJhe
	63/E/HMOqmJzNWoUJHoU2Vb4x4AhCcuitaS2DmKOA5dKQnEXhIG1hXVtJjPZR/ugcCwJu9POjFM
	TM0EvesUarIODsLLewjafrthew==
X-Received: by 2002:a5d:64e2:0:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3a51d9305e1mr1523501f8f.21.1749028087953;
        Wed, 04 Jun 2025 02:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKDlW7KBQY6VqzFIm9U5n5W/ayB7fhlMXCKIz73xa+dzMXlXDavnhpdJnz7rqheStpYyjOjQ==
X-Received: by 2002:a5d:64e2:0:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3a51d9305e1mr1523467f8f.21.1749028087400;
        Wed, 04 Jun 2025 02:08:07 -0700 (PDT)
Received: from sgarzare-redhat ([57.133.22.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa2541sm187792925e9.15.2025.06.04.02.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:08:06 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:07:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net-next v2 2/3] vsock/test: Introduce
 get_transports()
Message-ID: <wzbyv7fvzgpf4ta775of6k4ozypnfe6szysvnz4odd3363ipsp@2v3h5w77cr7a>
References: <20250528-vsock-test-inc-cov-v2-0-8f655b40d57c@rbox.co>
 <20250528-vsock-test-inc-cov-v2-2-8f655b40d57c@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250528-vsock-test-inc-cov-v2-2-8f655b40d57c@rbox.co>

On Wed, May 28, 2025 at 10:44:42PM +0200, Michal Luczaj wrote:
>Return a bitmap of registered vsock transports. As guesstimated by grepping
>/proc/kallsyms (CONFIG_KALLSYMS=y) for known symbols of type `struct
>virtio_transport`.
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> tools/testing/vsock/util.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
> tools/testing/vsock/util.h | 12 ++++++++++
> 2 files changed, 72 insertions(+)
>
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index b7b3fb2221c1682ecde58cf12e2f0b0ded1cff39..74fb52f566148b16436251216dd9d9275f0ec95b 100644
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
>@@ -17,6 +18,7 @@
> #include <assert.h>
> #include <sys/epoll.h>
> #include <sys/mman.h>
>+#include <linux/kernel.h>
> #include <linux/sockios.h>
>
> #include "timeout.h"
>@@ -854,3 +856,61 @@ void enable_so_linger(int fd, int timeout)
> 		exit(EXIT_FAILURE);
> 	}
> }
>+
>+static int __get_transports(void)
>+{
>+	/* Order must match transports defined in util.h.
>+	 * man nm: "d" The symbol is in the initialized data section.
>+	 */
>+	const char * const syms[] = {
>+		"d loopback_transport",
>+		"d virtio_transport",
>+		"d vhost_transport",
>+		"d vmci_transport",
>+		"d hvs_transport",
>+	};

I would move this array (or a macro that define it), near the transport 
defined in util.h, so they are near and we can easily update/review 
changes.

BTW what about adding static asserts to check we are aligned?

>+	char buf[KALLSYMS_LINE_LEN];
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
>+		for (i = 0; i < ARRAY_SIZE(syms); ++i) {
>+			match = strstr(buf, syms[i]);
>+
>+			/* Match should be followed by '\t' or '\n'.
>+			 * See kallsyms.c:s_show().
>+			 */
>+			if (match && isspace(match[strlen(syms[i])])) {
>+				ret |= _BITUL(i);
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
>index 0afe7cbae12e5194172c639ccfbeb8b81f7c25ac..63953e32c3e18e1aa5c2addcf6f09f433660fa84 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -3,8 +3,19 @@
> #define UTIL_H
>
> #include <sys/socket.h>
>+#include <linux/bitops.h>
> #include <linux/vm_sockets.h>
>
>+#define KALLSYMS_PATH		"/proc/kallsyms"
>+#define KALLSYMS_LINE_LEN	512

We don't need to expose them in util.h IMO, we can keep in util.c

>+
>+/* All known transports */
>+#define TRANSPORT_LOOPBACK	_BITUL(0)
>+#define TRANSPORT_VIRTIO	_BITUL(1)
>+#define TRANSPORT_VHOST		_BITUL(2)
>+#define TRANSPORT_VMCI		_BITUL(3)
>+#define TRANSPORT_HYPERV	_BITUL(4)
>+
> /* Tests can either run as the client or the server */
> enum test_mode {
> 	TEST_MODE_UNSET,
>@@ -82,4 +93,5 @@ void setsockopt_timeval_check(int fd, int level, int optname,
> 			      struct timeval val, char const *errmsg);
> void enable_so_zerocopy_check(int fd);
> void enable_so_linger(int fd, int timeout);
>+int get_transports(void);
> #endif /* UTIL_H */
>
>-- 
>2.49.0
>

