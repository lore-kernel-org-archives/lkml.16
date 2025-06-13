Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FAA1E0DB0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827007; cv=none; b=D0AInDYvZlQlpX6I7mLYssaEkMNForFd8AZ32tVs1YfFRhhPmtZcMW434zMAxlvbLG+VizLd+F5Dw5m2MoDVX/+aSAXjZxMCiLJr3BWtn+a9Olcq2+NtNuq9xtj5ClkYMUcBsANjkol8b5/xK9DLQN4Wc7wlL8AYT1SFfq72r6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827007; c=relaxed/simple;
	bh=cRYeyi32ANevS1OvWRG6UViBewsU9VurRmT5/ra/CsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd8Heo0jhBiAGFrSy0avglyazwZFkcbUDmf2usQ/dNhI/g1QAXFK8y1Pc5L9h9meWY2h2wcc2TRA6skbUpw+Fnmm5Hf6jA37o/ijZQvsGeZ3VjScB5QAcpNimxKpHoMBR7SMei2rTrpMlxyNcMBtiYeLXqzNlGBMLARgZKEBH2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cdxd3BNO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cdxd3BNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749827004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XPptdkmUQWyY2NUgk5R+pR8otplw7JGCI3XWawz+SuI=;
	b=Cdxd3BNOiRvHNTWV1xqpa4p0A+OWoTVDGHeiMSZHb/jI/OVts4zwKouudw8efe/9S0SNne
	ceHmaNECPVFXwmVD4oa2G3E2FSw2TLjAqHktIHPmQZL7cmd11YfGjDOkrB9Le22NRK5PUR
	Ggy3W70yEGQy7ichfP0kgMIn/334qUQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-n624Nxf4OvaflIx6vULasQ-1; Fri, 13 Jun 2025 11:03:23 -0400
X-MC-Unique: n624Nxf4OvaflIx6vULasQ-1
X-Mimecast-MFC-AGG-ID: n624Nxf4OvaflIx6vULasQ_1749827002
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so1037934f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827002; x=1750431802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPptdkmUQWyY2NUgk5R+pR8otplw7JGCI3XWawz+SuI=;
        b=q10maAbH6ibqxLMJMw4jkgPlo4NTJMZAiBCt8CMJiYZLArQyRl+CUdsInyrTy11HuX
         xmcwbY/i8CmPX+xOwSWgEx2e0IXkvzezuA+ndHjrnR6MjqmfETRHIyAEhw6OEFEEDUcW
         C2n4Fs3515fL/0eyGYdSZMaApc4/aUo625uJghh0+HI7+Wx3rEhPamZiIMwufaztopNb
         /rDPwknB2k+vEltr5mMcrYjvH+gBZ4FKiRT+7ypLUPQkgQYs0XIAosGbKXoD4NKLjkXF
         Ywvlv+SK6TLObJh670YcgCDVZVuOKUsGLENLzzWCwpyxonF41ixoT/Tt77FilHqlY6eO
         BtAg==
X-Forwarded-Encrypted: i=1; AJvYcCWHrsv3BghRvqruflQYZjzPUA8PC3bb1Stjz43OddfgmC201XD27M0hmOkTZU32mNVaI/KYGjIEU9A1HXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wwfjt8f/XQ4d2HIcul9uHAPT1fWFzoQROWKRppf9D7+ozLhV
	lMWLfITaXLoQVi+qU5I2y3gt7DrElsRJk1YRvyN+hOXsU1YMf89OlaOg/hEVbYS0A16QbTQu7bq
	MamG7tC2lBNcWlH7/moLCzoV47LhctO50cycdfSXFAhMwNC7UmcEH73azXE4nYMBHaQ==
X-Gm-Gg: ASbGncur2Z59qG3vuONF3fItoixbvIrKBRjTRYKnOUWfvPThdFcAjRhthOccUobCvTl
	cMiTwJvWsclQpm/LPp0zw3nz+Kj5BqpRlJs6Uvmovwahiyk/4l+j5b7I2/HNDDBzIxMXwgkPnUL
	KuBU6LI7NX1nmjgh45TQE5i8hIG3EonZtAZ1i/FH6u4Up0DbCZUAYhqDTOSblIKDaje02Kojbqa
	M1iR2n/Z3VPXLFyOcoHat4Y/kbhoZo3Y9qJ/QybUZP9pvAkQmwVRSRFX5NgE1+/GQ6Q7cEY7du4
	snaEkPMG2w2kvgOM8VgfPNVeLu0=
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a57237c9a7mr85624f8f.26.1749827001358;
        Fri, 13 Jun 2025 08:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuYvZ2dAnZ8I/GhdBHLLhfs4MPExbGzsgktXxUps2HvDq2BLjqswHaLgKzUuLhLc98dafM3A==
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a57237c9a7mr85548f8f.26.1749827000681;
        Fri, 13 Jun 2025 08:03:20 -0700 (PDT)
Received: from leonardi-redhat ([176.206.17.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b27795sm2607608f8f.71.2025.06.13.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:03:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:03:18 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] vsock/test: Introduce vsock_bind_try()
 helper
Message-ID: <wt6dvbknnrm7wygcaflwh6jwkox2vveii3hr6qhiepbyetg3sr@y5iuhennusag>
References: <20250611-vsock-test-inc-cov-v3-0-5834060d9c20@rbox.co>
 <20250611-vsock-test-inc-cov-v3-1-5834060d9c20@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250611-vsock-test-inc-cov-v3-1-5834060d9c20@rbox.co>

On Wed, Jun 11, 2025 at 09:56:50PM +0200, Michal Luczaj wrote:
>Create a socket and bind() it. If binding failed, gracefully return an
>error code while preserving `errno`.
>
>Base vsock_bind() on top of it.
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> tools/testing/vsock/util.c | 24 +++++++++++++++++++++---
> tools/testing/vsock/util.h |  1 +
> 2 files changed, 22 insertions(+), 3 deletions(-)
>
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index 0c7e9cbcbc85cde9c8764fc3bb623cde2f6c77a6..b7b3fb2221c1682ecde58cf12e2f0b0ded1cff39 100644
>--- a/tools/testing/vsock/util.c
>+++ b/tools/testing/vsock/util.c
>@@ -121,15 +121,17 @@ bool vsock_wait_sent(int fd)
> 	return !ret;
> }
>
>-/* Create socket <type>, bind to <cid, port> and return the file descriptor. */
>-int vsock_bind(unsigned int cid, unsigned int port, int type)
>+/* Create socket <type>, bind to <cid, port>.
>+ * Return the file descriptor, or -1 on error.
>+ */
>+int vsock_bind_try(unsigned int cid, unsigned int port, int type)
> {
> 	struct sockaddr_vm sa = {
> 		.svm_family = AF_VSOCK,
> 		.svm_cid = cid,
> 		.svm_port = port,
> 	};
>-	int fd;
>+	int fd, saved_errno;
>
> 	fd = socket(AF_VSOCK, type, 0);
> 	if (fd < 0) {
>@@ -138,6 +140,22 @@ int vsock_bind(unsigned int cid, unsigned int port, int type)
> 	}
>
> 	if (bind(fd, (struct sockaddr *)&sa, sizeof(sa))) {
>+		saved_errno = errno;
>+		close(fd);
>+		errno = saved_errno;
>+		fd = -1;
>+	}
>+
>+	return fd;
>+}
>+
>+/* Create socket <type>, bind to <cid, port> and return the file descriptor. */
>+int vsock_bind(unsigned int cid, unsigned int port, int type)
>+{
>+	int fd;
>+
>+	fd = vsock_bind_try(cid, port, type);
>+	if (fd < 0) {
> 		perror("bind");
> 		exit(EXIT_FAILURE);
> 	}
>diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
>index 5e2db67072d5053804a9bb93934b625ea78bcd7a..0afe7cbae12e5194172c639ccfbeb8b81f7c25ac 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -44,6 +44,7 @@ int vsock_connect(unsigned int cid, unsigned int port, int type);
> int vsock_accept(unsigned int cid, unsigned int port,
> 		 struct sockaddr_vm *clientaddrp, int type);
> int vsock_stream_connect(unsigned int cid, unsigned int port);
>+int vsock_bind_try(unsigned int cid, unsigned int port, int type);
> int vsock_bind(unsigned int cid, unsigned int port, int type);
> int vsock_bind_connect(unsigned int cid, unsigned int port,
> 		       unsigned int bind_port, int type);
>
>-- 
>2.49.0
>

Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

