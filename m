Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560A2E8890
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173070; cv=none; b=A6/t7X1udlaHzrX8L1Oa7ug3DxggnfJ4hkBCJqRfKuhlWuq3HprILXyrNqpOjbRsoYBKg2JTmGdJgfDnB1XZgPQNU6TZYuwN/m2T9EsAr0NCL+xFmGhTFJe+9FguNW76chamGTYUtmiRSRHlkTxveOjPCIjC2w3C92C0nUSLY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173070; c=relaxed/simple;
	bh=pdPq9PlVlHWZ2cVzJk1emG6nTw+vRlKhWuL8ddlKXW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moZ6emcfhavpS39/zpkobuw56otHg4YEQK9UZWhkWxmRQU6k04Ke1egjAvUnDpIz9jtPltYUnQ91UF0yJ5/DLpF6ZzFb9ZUba5x3jNJFKPuNZMYR+bpubFeD6vsaYqCILzE8KIliy0Df7EhhdmNiu1vT6SD1M48hT7SF6RekUVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ch7lVb55; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ch7lVb55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750173067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WGX6svIlWpZEQ5EFYjPNzt7elF0IRahwc1dWlkYR+Go=;
	b=ch7lVb55ygvkafVcr0sV4mtXe13cyh1+QBcqnOpzHgGAdx7pznKq1RSEoVCx26VzFzG8Sf
	yBd+8iA83NLY76SM+JTCMh7SyZ7lS65fOXg6tI6DnXML2qAWLRExVVuk0tv7b1SkM2SwXG
	fJFCYtxZDkFopIUIVaVe6FqK02559gQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-5Ofb56CdOW-NKsaTlXk20w-1; Tue, 17 Jun 2025 11:11:05 -0400
X-MC-Unique: 5Ofb56CdOW-NKsaTlXk20w-1
X-Mimecast-MFC-AGG-ID: 5Ofb56CdOW-NKsaTlXk20w_1750173065
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d290d542so35530255e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750173065; x=1750777865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGX6svIlWpZEQ5EFYjPNzt7elF0IRahwc1dWlkYR+Go=;
        b=Gy7MMBeDc8v7DTA6IBsh07o2XU3wIY3slKvifx8vnI4cIOjAyAf1OsMoZ37RELyQ/d
         5HNNxTfg45hK/FQ5t03Cv/Ll1mJcqW6ZRDNKCa7kN1UObHDxXosPxEicPraqXeDVwp4C
         aDgAtRS3RWJKGvFT6LMRyBS895niPt+gW4OVU4Iy++iTh5Gwl+4bqMarl2j9WDCLnHQp
         uxkg5PJs1+VJrsv7ifMOYzSYzJc4zIw6ltyoBFw1GUPaYFK31x0DZvdUBLUUP4/VnNwi
         8sDYjL+nGbq1x+oF4eXisv4cyFLcTkGcdX8s8WHpJzgheqjn2FCooPyhwbX/hy8I4Afo
         QKLA==
X-Forwarded-Encrypted: i=1; AJvYcCVcXPLt3rsfqkK+KCR0dvx8E488j40JnHBoYI20+TM1sUw5c5b9b5jpwEKhZyCSieljL3zR0XML+q94gpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOHCqJl6tRjMmcjVTYicvtZfAOvrPdrhf9yj40K/DReXr+F7DX
	5EZma+SzHczLc1UVJm1/gl0qBEJAyIZq43xsZPdLg6EGHoeO+ZdGhRfHP3h1djahV5L+wW/ZrVj
	jhEIHsGswDwircCANw5utwhD8AfWhbRIBjVT0cwMp5wZ3UROQ+cQNvnl4q/tDNNcQlg==
X-Gm-Gg: ASbGncsYNtDa7RUtUQcCz3037uTTOCRw+57N67d9Co8QnSNP2jZwA0WagUwL+sCxi4O
	j4mYOCE9O+pFUBU1QHNAMDViXIJa0xvsh+f5s8f5J26gTcNoqN3kS3Nh5wAB7z5lRO+2nakf0Zt
	VSb3obBPF8u6pqW6utgmxYW5+xxZ1lF3tIDQNeAP7moqQS7F/ABZw5Aj3KJoTZK65wObT3pUeEq
	KE9+dQNazD5enj1JSYlsrroDOjr81IKmcvWmCiFwjHD9WJou4Tpe7sbh0l0H3DQmU0U2fXEra/v
	OdVbZQWc2PFSZ3iiijAtG3OVGPxf
X-Received: by 2002:a05:600c:4f54:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-4533cab1c91mr100034835e9.25.1750173064649;
        Tue, 17 Jun 2025 08:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLw5YcffSL+V+Aaktp6ydgR00R6Aiz6j5f4o7u0CbWcG6l7Jh0rci6v44UVdISCb4YtYblWQ==
X-Received: by 2002:a05:600c:4f54:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-4533cab1c91mr100034365e9.25.1750173064079;
        Tue, 17 Jun 2025 08:11:04 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.200.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c192sm179620505e9.26.2025.06.17.08.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:11:03 -0700 (PDT)
Date: Tue, 17 Jun 2025 17:10:59 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, pabeni@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, netdev@vger.kernel.org, stefanha@redhat.com, 
	leonardi@redhat.com, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, fupan.lfp@antgroup.com, Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH net-next v3 2/3] test/vsock: Add retry mechanism to ioctl
 wrapper
Message-ID: <uqpldq5hhpmmgayozfh62wiloggk7rsih6n5lzby75cgxvhbiq@fspi6ik7lbp6>
References: <20250617045347.1233128-1-niuxuewei.nxw@antgroup.com>
 <20250617045347.1233128-3-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250617045347.1233128-3-niuxuewei.nxw@antgroup.com>

On Tue, Jun 17, 2025 at 12:53:45PM +0800, Xuewei Niu wrote:
>Wrap the ioctl in `ioctl_int()`, which takes a pointer to the actual
>int value and an expected int value. The function will not return until
>either the ioctl returns the expected value or a timeout occurs, thus
>avoiding immediate failure.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> tools/testing/vsock/util.c | 37 ++++++++++++++++++++++++++++---------
> tools/testing/vsock/util.h |  1 +
> 2 files changed, 29 insertions(+), 9 deletions(-)
>
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index 0c7e9cbcbc85..ecfbe52efca2 100644
>--- a/tools/testing/vsock/util.c
>+++ b/tools/testing/vsock/util.c
>@@ -16,6 +16,7 @@
> #include <unistd.h>
> #include <assert.h>
> #include <sys/epoll.h>
>+#include <sys/ioctl.h>
> #include <sys/mman.h>
> #include <linux/sockios.h>
>
>@@ -97,28 +98,46 @@ void vsock_wait_remote_close(int fd)
> 	close(epollfd);
> }
>
>-/* Wait until transport reports no data left to be sent.
>- * Return false if transport does not implement the unsent_bytes() callback.
>+/* Wait until ioctl gives an expected int value.
>+ * Return a negative value if the op is not supported.
>  */
>-bool vsock_wait_sent(int fd)
>+int ioctl_int(int fd, unsigned long op, int *actual, int expected)
> {
>-	int ret, sock_bytes_unsent;
>+	int ret;
>+	char name[32];
>+
>+	if (!actual) {
>+		fprintf(stderr, "%s requires a non-null pointer\n", __func__);
>+		exit(EXIT_FAILURE);
>+	}

I think we can skip this kind of validation in a test, it will crash 
anyway and we don't have in other places.

>+
>+	snprintf(name, sizeof(name), "ioctl(%lu)", op);
>
> 	timeout_begin(TIMEOUT);
> 	do {
>-		ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
>+		ret = ioctl(fd, op, actual);
> 		if (ret < 0) {
> 			if (errno == EOPNOTSUPP)
> 				break;
>
>-			perror("ioctl(SIOCOUTQ)");
>+			perror(name);
> 			exit(EXIT_FAILURE);
> 		}
>-		timeout_check("SIOCOUTQ");
>-	} while (sock_bytes_unsent != 0);
>+		timeout_check(name);
>+	} while (*actual != expected);
> 	timeout_end();
>
>-	return !ret;
>+	return ret;
>+}
>+
>+/* Wait until transport reports no data left to be sent.
>+ * Return false if transport does not implement the unsent_bytes() callback.
>+ */
>+bool vsock_wait_sent(int fd)
>+{
>+	int sock_bytes_unsent;
>+
>+	return !(ioctl_int(fd, SIOCOUTQ, &sock_bytes_unsent, 0));
> }
>
> /* Create socket <type>, bind to <cid, port> and return the file descriptor. */
>diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
>index 5e2db67072d5..f3fe725cdeab 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -54,6 +54,7 @@ int vsock_stream_listen(unsigned int cid, unsigned int port);
> int vsock_seqpacket_accept(unsigned int cid, unsigned int port,
> 			   struct sockaddr_vm *clientaddrp);
> void vsock_wait_remote_close(int fd);
>+int ioctl_int(int fd, unsigned long op, int *actual, int expected);

what about using vsock_* prefix?
nit: if not, please move after the vsock_* functions.

The rest LGTM!

Thanks,
Stefano

> bool vsock_wait_sent(int fd);
> void send_buf(int fd, const void *buf, size_t len, int flags,
> 	      ssize_t expected_ret);
>-- 
>2.34.1
>

