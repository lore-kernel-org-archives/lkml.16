Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7024DD07
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451666; cv=none; b=Ii8fQPqOIuk/j2UiWsG3bQ2lWxK0Z/5olKyk/UtTPFcJ+yH71PIFE30UxC4qA5ZkhpUQN+Rg13OjEm1eYDSN/C732pEz7a6w1NX/4zt7YPqComeHFx/wby7pi6lukYeU7B68CDf19Pj94SIs2FfCa7iwZypr6bYV6cmwFKQwi4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451666; c=relaxed/simple;
	bh=QTZub8qteyJ2SpbKYksOY3pPnrsQfuP9btWZHNiTahM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRiLOBhLpc2i9tpbnn3IVU66vDA3+Qnqqf3aSeWiGJEZR+UFumhrtQcCp50aH4c0QdrmRU/M42s13ESEZNusJSidZEV7PNhsHEKJzYF+D4pb9pSYbtJd4SvY3KDxALdB3gnwJ70FaSE6C7kqdGBJrf//M/Q7vngJevDfJSoY+3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1hoRY3f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1hoRY3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751451663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z33Cff3RmOVjIT9wRyC2s6MYaglNGGjjzC0Meo8MshM=;
	b=f1hoRY3fPXnDr8Lkl39SFK2ayRsVoCaqCAKq1no9NVEIC3J0PKoeYdebz2x3Xjp5Cjv4e4
	hpXsP2MZVTzTdmgHmlAyEMlhwCYVEKOVeWwctvQcX41z7LehKQ49dltXYnYX5qtAmFSdT1
	s+GidquKCbk/SZ9V83QTC69aK5lkPsQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-_T_e3V2-MreUO9j4NPnsEw-1; Wed, 02 Jul 2025 06:21:01 -0400
X-MC-Unique: _T_e3V2-MreUO9j4NPnsEw-1
X-Mimecast-MFC-AGG-ID: _T_e3V2-MreUO9j4NPnsEw_1751451661
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2da802bd11eso2872159fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451661; x=1752056461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z33Cff3RmOVjIT9wRyC2s6MYaglNGGjjzC0Meo8MshM=;
        b=TqZloo9nDlpvzfYzMVbGzy3aRuw3IlmMdlawzEGSIR8KDVmHNxVBANyfK59EuzqyoB
         SMHr/Ve5bZiWzI/bVEYQquPF3CDxWZc9eVC3YRPodGs2UGnbkD2RIRajtTRx1m49F2cK
         qUS8xyrh23NNiI1KuR1eqgZ5S1upd2bNRJ2mC9NNSmFdpwOykaFS8T9ar6vptt66pVyO
         0AYdYBhMLKIAYeGGNZZ8GO/gCL5POGMKPWMJTAaIJDMn2lSNASbTYSvFxnKhSt+a3Crg
         xIYW3lUYSUueCYGXicjdAmlq2uh9UXiTS/EV3IXVMDMyZyiAvt13EPllXvQYSutygHRy
         Iy5A==
X-Forwarded-Encrypted: i=1; AJvYcCUiETg5AIUrb3/B3KJQlPQo3IOhb5Xvcr9Vsdt11oQwlARgazf8/LP1r4+MQSAhV28q9no9jGKq/XkUeRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbUjOw/SZQA5HAbyjikJZTMJDn1OIN1yV0XqDWX5ym8cHnLZuk
	IQc3rriLSkbUs7G1qd31e28O/JyArFJ0Mn4sjfoKYz7/xUDVSeXg6zr1IEwfqi3nzmaijmlY1xR
	JnL0Dxta0Fy0v87TSf3DjnEUXMFMSbyVjie766r2CLhv97AbasvnHn7rQszIydvaYyQ==
X-Gm-Gg: ASbGncubPhqWVuSIEbEvf7PO0WGKNxFMVY33Q31dscvFJ1beRHMfH92E+NLmDJwWkTU
	URmcINnZ0J8rKVNTUXV0SC7yK8Bo8izCTuO3lP1YQFxHnGuRlrDwOCdEXQoOWIDSyKPob+Q2iT3
	W3B7I4waYovUE6Kz4+NNvN8cGzvXmYB9aHmzNef6l5Mfg4BKh1m20vUCfpwiBNCqmUWW1ZOelHB
	Diy/6OOc8fivk9PuT+M0ZBOfEt1dHEqxXPNIgpB+ajexILmVm2YDdIIcuF7cBj9sn1V545yUMlY
	Ih1ndabBIebdU2hY1ibNQQNc7d4q
X-Received: by 2002:a05:6871:2101:b0:2d9:8578:9478 with SMTP id 586e51a60fabf-2f5a89a2456mr1620085fac.4.1751451660849;
        Wed, 02 Jul 2025 03:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjnqBPdraA9wKo6pHyy4bnNYvJ2ThZk+lGjpFEgWafOmcLKgFaCiU2WyDUSEWN1BVbih6pWA==
X-Received: by 2002:a05:6871:2101:b0:2d9:8578:9478 with SMTP id 586e51a60fabf-2f5a89a2456mr1620073fac.4.1751451660486;
        Wed, 02 Jul 2025 03:21:00 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.164.126])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4efb7cfsm3767218fac.16.2025.07.02.03.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:20:59 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:20:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, pabeni@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, netdev@vger.kernel.org, stefanha@redhat.com, 
	leonardi@redhat.com, decui@microsoft.com, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, fupan.lfp@antgroup.com, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [RESEND PATCH net-next v4 3/4] test/vsock: Add retry mechanism
 to ioctl wrapper
Message-ID: <2cpqw23kr4qiatpzcty6wve4qdyut5su7g7fr4kg52dx33ikdu@ljicf6mktu5z>
References: <20250630075727.210462-1-niuxuewei.nxw@antgroup.com>
 <20250630075727.210462-4-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630075727.210462-4-niuxuewei.nxw@antgroup.com>

On Mon, Jun 30, 2025 at 03:57:26PM +0800, Xuewei Niu wrote:
>Wrap the ioctl in `ioctl_int()`, which takes a pointer to the actual
>int value and an expected int value. The function will not return until
>either the ioctl returns the expected value or a timeout occurs, thus
>avoiding immediate failure.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> tools/testing/vsock/util.c | 32 +++++++++++++++++++++++---------
> tools/testing/vsock/util.h |  1 +
> 2 files changed, 24 insertions(+), 9 deletions(-)
>
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index 0c7e9cbcbc85..481c395227e4 100644
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
>@@ -97,28 +98,41 @@ void vsock_wait_remote_close(int fd)
> 	close(epollfd);
> }
>
>-/* Wait until transport reports no data left to be sent.
>- * Return false if transport does not implement the unsent_bytes() 
>callback.
>+/* Wait until ioctl gives an expected int value.
>+ * Return false if the op is not supported.
>  */
>-bool vsock_wait_sent(int fd)
>+bool vsock_ioctl_int(int fd, unsigned long op, int *actual, int expected)

Why we need the `actual` parameter?

> {
>-	int ret, sock_bytes_unsent;
>+	int ret;
>+	char name[32];
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
>+	return ret >= 0;
>+}
>+
>+/* Wait until transport reports no data left to be sent.
>+ * Return false if transport does not implement the unsent_bytes() callback.
>+ */
>+bool vsock_wait_sent(int fd)
>+{
>+	int sock_bytes_unsent;
>+
>+	return vsock_ioctl_int(fd, SIOCOUTQ, &sock_bytes_unsent, 0);
> }
>
> /* Create socket <type>, bind to <cid, port> and return the file descriptor. */
>diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
>index 5e2db67072d5..d59581f68d61 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -54,6 +54,7 @@ int vsock_stream_listen(unsigned int cid, unsigned int port);
> int vsock_seqpacket_accept(unsigned int cid, unsigned int port,
> 			   struct sockaddr_vm *clientaddrp);
> void vsock_wait_remote_close(int fd);
>+bool vsock_ioctl_int(int fd, unsigned long op, int *actual, int expected);
> bool vsock_wait_sent(int fd);
> void send_buf(int fd, const void *buf, size_t len, int flags,
> 	      ssize_t expected_ret);
>-- 
>2.34.1
>

