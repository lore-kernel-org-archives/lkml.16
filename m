Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABDDA95C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425663; cv=none; b=Rcm5s0xmMcwWZpWCXjQW/6o3wYbZ6rMpBnx2kS9q/rCeqveGDa8oBpyPTiLpDiQD/e79XuUepuV+Q54sFqYWKgTJBQ7w7r1ESm8mJc/rk7d3QXQ7NcgBKYRCxCft6NbN36RCwLZL5h4eXMv8ff64lT6axfJOKCnxBC76z+mzexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425663; c=relaxed/simple;
	bh=m++IWIdhWcOcndZZ1RdUUYfFhpUVf+EYrm4S0Wxh/7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdGXzidm05O6Sl63NTLuu4nHwT/COYAV5FlK68THRvbrkBUAeecK/7BNL8jUM2vPGMSwS0gVVwEiQ3aA1wfnpalaEokjTdZMqORneZ3JuEDRQiKWD1Z2mzkncz8jznppCnpd7WYAkDaRpSWbC5efPjIPb/1tKiBqKRfBJUSCPyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QgzbRBoG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QgzbRBoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750425660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wrbqyOjgClJljme6Y8IBM3ztge6H5cPgaXJrix0YAsM=;
	b=QgzbRBoG40v5dauQBefN2qeiEt/619XaJRWdLw7UqPLaGxTWD8IT6ZHp3QfpD2dor9ROp4
	z43Tji7D/bW55I30dmjzQz0OqWi/uq9b5lPDJ6yfAn6FlQtOIX32izu5PS6pflaw3+uB41
	Nm1wh54VtIurNMlNFORgGXv7rVCc42k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-LtCWpKLvPSqza8PINUEujQ-1; Fri, 20 Jun 2025 09:20:59 -0400
X-MC-Unique: LtCWpKLvPSqza8PINUEujQ-1
X-Mimecast-MFC-AGG-ID: LtCWpKLvPSqza8PINUEujQ_1750425658
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so1135881f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425658; x=1751030458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrbqyOjgClJljme6Y8IBM3ztge6H5cPgaXJrix0YAsM=;
        b=umunpCD56z+PBvB1J6uVw68h6irwIXtyrR13wXaX7oHtJw4dIoqN3lPVZk1ITuodMd
         umhgDDCOh+DLtqNzYucNrVbJU3hzw0CKvtL3C3qJTKDN4NV25a48rgSZxEu7tXvj4Pij
         e5rV9/XD9X9L6t29Vu0r106iRHBiVqP6HOY2jHwlmSn3y1OuPzlKpNpU3QSi1AbXhvsL
         y+XGwWzZmOsJGgRp82OMB9YqxvX0Icth/0ta/udIMyJ8wNPymUjYTNV+57qqU0O1Tkdv
         ZXmWA9RSwTn6eRJY9emBx50w2gDbNotVcCLWOSFVeAKtq/0jtq5Qwen2x7+a9uaL4H1y
         6Dnw==
X-Forwarded-Encrypted: i=1; AJvYcCXVj/IzNrkOFeSoGXdJLBnDW1Gm5GKMOSTv6hwevnfHugMyjWyHBC9JMVZTF57rn1ifMOjVPg3Cl6Mv8Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjGjIXBryGdeloYzz3osd4Td5F1YdR8VUAII6VmLfFfBIT8j43
	ZTJJy07Zy6Yh5oJZfe7Zi/dadVWPmOoGz7LDtLOqWjgpfvel99tcn7FxGAMu1OHSjq283tHI2Xh
	nLW+oSK4Hu9oqg//UykdF1xRYVe1Iy0b8w+jeJa8Zr9+LUkVasaMuXRRKmU2LbRJSNA==
X-Gm-Gg: ASbGnctI+BeGblrRQbomEBzcs/Tif1I4TjrvmLL/K62MBg4cUjVeUDwuEiuM3AprBjV
	2+B7VWY7M2EP3ovd+vwrYg0fLdmH/56kjcBB3clhAFaG2EuNrRzaW2Laq5Tg7NFGFQ64N6nMfUO
	4vsMXV/cJVwz1Lmm2fKsMXmBJHVIFJEgtAzcH8wbe9mY7GtUbt3qL1zF9MGOJNb+qHqfEZ0GgJk
	rVmZQ6TqDquH10/s24OuaGKC7aWgHtj4gB7vb8IOp3qF/hCt/yj11Z7WX2wSDibAezxx7+BAlJe
	VCSGt6glDM7B/+J8jm+NY617sDY=
X-Received: by 2002:adf:9dd1:0:b0:3a4:f655:8c4d with SMTP id ffacd0b85a97d-3a6d131787bmr2056457f8f.27.1750425658395;
        Fri, 20 Jun 2025 06:20:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9QRtkvxSOLn59Do52l3ix3GhLfK1cWTxETb+z/cJOkSsbedauMcmLKrjvI5kUALGNlARMfA==
X-Received: by 2002:adf:9dd1:0:b0:3a4:f655:8c4d with SMTP id ffacd0b85a97d-3a6d131787bmr2056441f8f.27.1750425657878;
        Fri, 20 Jun 2025 06:20:57 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0ec947fsm2106321f8f.0.2025.06.20.06.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:20:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:20:52 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/3] vsock: Fix transport_{h2g,g2h} TOCTOU
Message-ID: <cg25zc7ktl6glh5r7mfxjvbjqguq2s2rj6vk24ful7zg6ydwuz@tjtvbrmemtpw>
References: <20250618-vsock-transports-toctou-v1-0-dd2d2ede9052@rbox.co>
 <20250618-vsock-transports-toctou-v1-1-dd2d2ede9052@rbox.co>
 <r2ms45yka7e2ont3zi5t3oqyuextkwuapixlxskoeclt2uaum2@3zzo5mqd56fs>
 <fd2923f1-b242-42c2-8493-201901df1706@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fd2923f1-b242-42c2-8493-201901df1706@rbox.co>

On Fri, Jun 20, 2025 at 02:58:49PM +0200, Michal Luczaj wrote:
>On 6/20/25 10:32, Stefano Garzarella wrote:
>> On Wed, Jun 18, 2025 at 02:34:00PM +0200, Michal Luczaj wrote:
>>> Checking transport_{h2g,g2h} != NULL may race with vsock_core_unregister().
>>> Make sure pointers remain valid.
>>>
>>> KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>>> RIP: 0010:vsock_dev_do_ioctl.isra.0+0x58/0xf0
>>> Call Trace:
>>> __x64_sys_ioctl+0x12d/0x190
>>> do_syscall_64+0x92/0x1c0
>>> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>>>
>>> Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>> ---
>>> net/vmw_vsock/af_vsock.c | 4 ++++
>>> 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>>> index 2e7a3034e965db30b6ee295370d866e6d8b1c341..047d1bc773fab9c315a6ccd383a451fa11fb703e 100644
>>> --- a/net/vmw_vsock/af_vsock.c
>>> +++ b/net/vmw_vsock/af_vsock.c
>>> @@ -2541,6 +2541,8 @@ static long vsock_dev_do_ioctl(struct file *filp,
>>>
>>> 	switch (cmd) {
>>> 	case IOCTL_VM_SOCKETS_GET_LOCAL_CID:
>>> +		mutex_lock(&vsock_register_mutex);
>>> +
>>> 		/* To be compatible with the VMCI behavior, we prioritize the
>>> 		 * guest CID instead of well-know host CID (VMADDR_CID_HOST).
>>> 		 */
>>> @@ -2549,6 +2551,8 @@ static long vsock_dev_do_ioctl(struct file *filp,
>>> 		else if (transport_h2g)
>>> 			cid = transport_h2g->get_local_cid();
>>>
>>> +		mutex_unlock(&vsock_register_mutex);
>>
>>
>> What about if we introduce a new `vsock_get_local_cid`:
>>
>> u32 vsock_get_local_cid() {
>> 	u32 cid = VMADDR_CID_ANY;
>>
>> 	mutex_lock(&vsock_register_mutex);
>> 	/* To be compatible with the VMCI behavior, we prioritize the
>> 	 * guest CID instead of well-know host CID (VMADDR_CID_HOST).
>> 	 */
>> 	if (transport_g2h)
>> 		cid = transport_g2h->get_local_cid();
>> 	else if (transport_h2g)
>> 		cid = transport_h2g->get_local_cid();
>> 	mutex_lock(&vsock_register_mutex);
>>
>> 	return cid;
>> }
>>
>>
>> And we use it here, and in the place fixed by next patch?
>>
>> I think we can fix all in a single patch, the problem here is to call
>> transport_*->get_local_cid() without the lock IIUC.
>
>Do you mean:
>
> bool vsock_find_cid(unsigned int cid)
> {
>-       if (transport_g2h && cid == transport_g2h->get_local_cid())
>+       if (transport_g2h && cid == vsock_get_local_cid())
>                return true;
>
>?

Nope, I meant:

  bool vsock_find_cid(unsigned int cid)
  {
-       if (transport_g2h && cid == transport_g2h->get_local_cid())
-               return true;
-
-       if (transport_h2g && cid == VMADDR_CID_HOST)
+       if (cid == vsock_get_local_cid())
                 return true;

         if (transport_local && cid == VMADDR_CID_LOCAL)

But now I'm thinking if we should also include `transport_local` in the 
new `vsock_get_local_cid()`.

I think that will fix an issue when calling 
IOCTL_VM_SOCKETS_GET_LOCAL_CID and only vsock-loopback kernel module is 
loaded, so maybe we can do 2 patches:

1. fix IOCTL_VM_SOCKETS_GET_LOCAL_CID to check also `transport_local`
    Fixes: 0e12190578d0 ("vsock: add local transport support in the vsock core")

2. move that code in vsock_get_local_cid() with proper locking and use 
it also in vsock_find_cid()

WDYT?

Thanks,
Stefano

