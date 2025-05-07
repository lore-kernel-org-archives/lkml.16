Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150C9286436
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623353; cv=none; b=rwNx0bCZbG5pl/4xtPqkVSzykjP7C2shIsJmtL8yzDfsRmtXcLpJUDIqfPHL128lSZOUoxlZTyU1w9Wr5x6Vzn1WyA/ix21P0+rycOdCa5NrK+f0/l00LFTss5p/W1P+L0ZTi1FkzFLvqg2uVdVYeCgU5sYichk0HPYTMGWMjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623353; c=relaxed/simple;
	bh=PCMX2Cr+uQWKx3vKDgl51jkFcRXqKV/9DGQU2RgRS9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VirFCh/zzPyB/nWsSUZF81oeNP3XcRXfZfwWtC3BCHiP9hpk4ti8mwh3VF3IW40io2Nyug/paw9WlpXHRMlIadLbce/qqt4mHTAJbyZwfhaenlS3uTNqn5VaNe3gQy4mubgv19bahjMtToC6jz1c3S05ivhBh2Qh/Mi/ek07aV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2krJcc5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2krJcc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746623349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qAtnwiXcU1op8DM9QOzo0SnMVizQr1PVYLn+9+GejxY=;
	b=H2krJcc5xywjlExB/x0euKpZmhMsLz0yz58YwpuVq+9xM3lu1THWbfmZK3gkmVMpMuHhKq
	CSnpBafNb3hxIBGx/BWt1kRjr5dPeq4KN2MMbSRh2w9tnqOgkZ4gs7n9iWNeLORAFrGeZF
	ZCDdBrkJUTYW550cINdd3qxP6bgUgdY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-CUDmlVM-NZOCgz_deznrwQ-1; Wed, 07 May 2025 09:09:08 -0400
X-MC-Unique: CUDmlVM-NZOCgz_deznrwQ-1
X-Mimecast-MFC-AGG-ID: CUDmlVM-NZOCgz_deznrwQ_1746623347
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5fbf5fce18dso608523a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623347; x=1747228147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAtnwiXcU1op8DM9QOzo0SnMVizQr1PVYLn+9+GejxY=;
        b=ILJmQHUvkl9UerLVRZ6j+gPJ+I/JJ2sJEGpTRrey6MzK8zgPDbdGUkEmZtD3HaQ07c
         UdU0+I3RR4ep8OmvWMPkPFMZ4wZoO1wgM22wLUZCczc7Gq2lXUPNOHheYfjImeC0OX2x
         RDq59MZjgNpn38f73PzGxrv8n5qmbUn10sZwNXci9t2ukYhQ3LSdb2nl6RokJEslPAZw
         ytkldj10B6PZU0LuBvZDjaKu9f0NTWCRsTDKYyhjYdf00qpDWKh0Zzxwe04n8qLlMXgy
         81t1zq8bUZD7v8ZjJK6j5tIGjUoPh13YaY7iPkA5T4jDfCh8ky2/nMyUVEGw83bwi53C
         MR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU69q2V0aJ2h8v4xxJ5xIQdcNKymW7zf4ZOg9+h0vcQYheNrWts3HF67TLHQ5NpTDQLc2/Q5ITrQh+062E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZZpxDEG3vVTqTToKv4lRG2cmL6c6bB6SNX8OpU8sDpNHaidI
	Ds2pbMPa6UiFpQag2JXOk21+7Zb/04KNQZMODdEBnxfoXs7gsRlK7kLwCkoPoHcXyQWUA6/MA3K
	yu9nbSn4QcLMkGJYdjpf7FKLbLg6oow6L8XxaSoeMN6U7aUEXk0Yd5qXxRXKg30zFEfvfFw==
X-Gm-Gg: ASbGncvvHo6yfMsTWW69dlrDvOLiFKDoNqcZoFMFP2VKfHJ6v/YCQy34K7t1tW1VB+w
	kl0Ul3NxF03CmQR4F3gZQ/+1PxgHmQ1SsJqvBQgWdPAj71wbBTC2Yoil0zcsMGn6OQqeYVhVJL3
	Di9DQ4jKT7NooigdnTfMcRudAf+vyssnkX8rGR07ynuFDk4+pjKpAxXOppm2jbpNN2YilNxoFr2
	6lXM2gxmwHPM5in2BmTyp3GqQ3odtjxZ0hedx1x+EznZcm5doI3mDXEQlpWgpWOznSoWQZ/ZT8R
	KVAYAHSAnKtpUue+
X-Received: by 2002:a05:6402:34c5:b0:5e5:d9e5:c4d7 with SMTP id 4fb4d7f45d1cf-5fbe9fa7f9amr3011103a12.28.1746623336493;
        Wed, 07 May 2025 06:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwA872SvBWeTpMMj+/e7mYjU25+jDDfjv4mDrfoJ39gjkjiqHaiiL4tGqlCQGwX9860akxCA==
X-Received: by 2002:a05:6402:35c4:b0:5f4:9017:c6a1 with SMTP id 4fb4d7f45d1cf-5fbe9f46c84mr3009014a12.25.1746623324960;
        Wed, 07 May 2025 06:08:44 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.183.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b914b4sm9371316a12.51.2025.05.07.06.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:08:43 -0700 (PDT)
Date: Wed, 7 May 2025 15:08:22 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Konstantin Shkolnyy <kshk@linux.ibm.com>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mjrosato@linux.ibm.com
Subject: Re: [PATCH net] vsock/test: Fix occasional failure in SIOCOUTQ tests
Message-ID: <sqee4iqviojcht4s42dke3mnsq4f4si6oislu77bm3nqwlowim@oz6voimaqw4m>
References: <20250507114833.2503676-1-kshk@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250507114833.2503676-1-kshk@linux.ibm.com>

On Wed, May 07, 2025 at 06:48:33AM -0500, Konstantin Shkolnyy wrote:
>These tests:
>    "SOCK_STREAM ioctl(SIOCOUTQ) 0 unsent bytes"
>    "SOCK_SEQPACKET ioctl(SIOCOUTQ) 0 unsent bytes"
>output: "Unexpected 'SIOCOUTQ' value, expected 0, got 64 (CLIENT)".
>
>They test that the SIOCOUTQ ioctl reports 0 unsent bytes after the data
>have been received by the other side. However, sometimes there is a delay
>in updating this "unsent bytes" counter, and the test fails even though
>the counter properly goes to 0 several milliseconds later.
>
>The delay occurs in the kernel because the used buffer notification
>callback virtio_vsock_tx_done(), called upon receipt of the data by the
>other side, doesn't update the counter itself. It delegates that to
>a kernel thread (via vsock->tx_work). Sometimes that thread is delayed
>more than the test expects.
>
>Change the test to try SIOCOUTQ several times with small delays in between.
>
>Signed-off-by: Konstantin Shkolnyy <kshk@linux.ibm.com>
>---
> tools/testing/vsock/vsock_test.c | 26 ++++++++++++++++----------
> 1 file changed, 16 insertions(+), 10 deletions(-)
>
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index d0f6d253ac72..143f1cba2d18 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -1264,21 +1264,27 @@ static void test_unsent_bytes_client(const struct test_opts *opts, int type)
> 	send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
> 	control_expectln("RECEIVED");
>
>-	ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
>-	if (ret < 0) {
>-		if (errno == EOPNOTSUPP) {
>-			fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
>-		} else {
>+	/* SIOCOUTQ isn't guaranteed to instantly track sent data */
>+	for (int i = 0; i < 10; i++) {
>+		ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
>+		if (ret == 0 && sock_bytes_unsent == 0)
>+			goto success;
>+
>+		if (ret < 0) {
>+			if (errno == EOPNOTSUPP) {
>+				fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
>+				goto success;
>+			}
> 			perror("ioctl");
> 			exit(EXIT_FAILURE);
> 		}
>-	} else if (ret == 0 && sock_bytes_unsent != 0) {
>-		fprintf(stderr,
>-			"Unexpected 'SIOCOUTQ' value, expected 0, got %i\n",
>-			sock_bytes_unsent);
>-		exit(EXIT_FAILURE);
>+		usleep(10 * 1000);
> 	}
>
>+	fprintf(stderr, "Unexpected 'SIOCOUTQ' value, expected 0, got %i\n",
>+		sock_bytes_unsent);
>+	exit(EXIT_FAILURE);
>+success:
> 	close(fd);

I worked on something similar but I didn't yet send it.

I like the delay you put, but I prefer to use the timeout stuff we have
to retry, like I did here:

@@ -1264,20 +1270,25 @@ static void test_unsent_bytes_client(const struct test_opts *op
ts, int type)
         send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
         control_expectln("RECEIVED");

-       ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
-       if (ret < 0) {
-               if (errno == EOPNOTSUPP) {
-                       fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
-               } else {
-                       perror("ioctl");
-                       exit(EXIT_FAILURE);
+       /* Although we have a control message, we are not sure that the vsock
+        * transport has sent us notification that the buffer has been copied
+        * and cleared, so in some cases we may still see unsent bytes.
+        * Better to do a few iterations to be sure.
+        */
+       timeout_begin(TIMEOUT);
+       do {
+               ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
+               if (ret < 0) {
+                       if (errno == EOPNOTSUPP) {
+                               fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
+                               break;
+                       } else {
+                               perror("ioctl");
+                               exit(EXIT_FAILURE);
+                       }
                 }
-       } else if (ret == 0 && sock_bytes_unsent != 0) {
-               fprintf(stderr,
-                       "Unexpected 'SIOCOUTQ' value, expected 0, got %i\n",
-                       sock_bytes_unsent);
-               exit(EXIT_FAILURE);
-       }
+       } while (sock_bytes_unsent != 0);
+       timeout_end();


What about combining the two?

Thanks,
Stefano

