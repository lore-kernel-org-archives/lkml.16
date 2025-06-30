Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E11EB9E3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276841; cv=none; b=RC1mANkX19R9c53s3ZNOuEHXQOEWcHYRBTjwhuHPGl97Yqw8zxSzsfMyTvLN8K3qEpgVoT6pnkvt7Jl34PHC84XTA6r9c43UDft0qQuF0ArOBUEjsbzVllpAH8pM2pgZhaI//PvEN3+xPx+XMJARTlP1/j8IDuKfgImUiuJ9gbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276841; c=relaxed/simple;
	bh=u2PQA0S/gy/0ITz+24bqC/IeF/VMz3qlCfRMUN/YZwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfMAL+qSJw8EoHePDDe+GRs5rd22cai3O/dwbivC0cC3owRcPNrMNNObwlR121rZjVIo9pq593o7OcR6WReqSsC552Uxo8CtSpG14+0eXPPFBiAed8FOqvPWlmy8R1hPgG1/RZ68uwNs4pY82x3x5Zlka3pOxe8LGcxmaCuQ+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jw0g3I8G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jw0g3I8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751276839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYM+l9u3eA7xXNWMmpxmynV8BtHDfFyAj+GAIS/oRBQ=;
	b=Jw0g3I8GHfUHPOHKL/k4hATHSvJ1SkQpdlu5f5MdkdqI5a8oD8FxD3gCXCVnw4bJ86Q//3
	cKzyK8yDE4zE/oh+6NIPNm/RVzXCDvuydpqZizzXTdfM2/O2LE0UagTsUb6qVl1Au1kSuU
	VawrOSZUtg4TIQho4MfxHjz60g1+EIM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-gGngiulwPe2VRvlMqQCeFQ-1; Mon, 30 Jun 2025 05:47:17 -0400
X-MC-Unique: gGngiulwPe2VRvlMqQCeFQ-1
X-Mimecast-MFC-AGG-ID: gGngiulwPe2VRvlMqQCeFQ_1751276836
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450eaae2934so13662535e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276836; x=1751881636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYM+l9u3eA7xXNWMmpxmynV8BtHDfFyAj+GAIS/oRBQ=;
        b=U3JUlerAFAi95KbKQB6FwGqH7fX1MA+y+19cGNtmoGEJD8m1n1+9PKVrd66gbHx+CP
         rJ+bV6Vtq4yfq1GA656hmlXPtLP/b5gSy+IVUjeQncJbMJFZY5IeDGSynTQxrfqOsqBj
         lSh0Ap7/7hWh/w7vBHVkm2uZrD8ETkrpmwhkcHUkuBaDy4Rqk6KSEA2VfAJjOs0AzUQf
         ObNwOFA7+WPr98CH9PjwF7MDAQfIHlrtgVnPon9ASFhUe5GJuT/OIW9LZReLboKUmfIz
         rBwYqwPOGtnDlFZhYM6lR7g7APbL0P7HZ5Wrdg7//25XEaPOIar45VxS7ihRLYCUJigr
         MQfA==
X-Forwarded-Encrypted: i=1; AJvYcCXNq7o1I2Ds3e+tJSAMqWf48dezzXfpPDpudQ6pUOXdTWs6j+tMGmc4bpc8wBM3LZ5LUhJzTzA7TDCisRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQC16U29MaAuYbfQKL6pJxcE+X8Z0FtoI6ZPGvJ81J6/90QIJz
	ZHRnbVNDW0xVNdcEWrYbPXcW73fNr+Zy3AHcgl5KaZPUOXfKwJBKMGih3V89xZb4UOrjD8z1pJw
	Vs9CBrY1lgXHaKoDT/WTczDzMh0da2ywOECdT0kceME02j4dUeFz6osuRIaILmMOcTw==
X-Gm-Gg: ASbGncua08NueZWCWXT/q5OnNjXL9y774B/330PXJdeyy8iW0maSnvB0uHTBvssah11
	zPCYf2ln3BxhY44s2sDCAmlkYzlU5/Hclc5vfR4O0O+0wdXJRgpgQe18ZHUiGrH/uSSNbZZmkdn
	bHwVZW6oTigKiu6Wr8MuT/NVM1/6vegGa9LdDrg3po0m/JTqA13YZO0TEhc14pUOpeDJLI4bEL0
	fLSR1O4+z0QfqTjZzS5lyTSQU5RkTbBYO+lGTx6VNrkzMTo5kVGCFRslxLMrGt5AkZfg3Qh1jKW
	mhJSzNT+Ho8saEoQt2/IVgljcZ2R
X-Received: by 2002:a05:600c:4ed3:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4538f244121mr129104885e9.4.1751276835601;
        Mon, 30 Jun 2025 02:47:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCsgQCAMCNSYIs4yUUiqL9XaX4IgpvXxCsiWAizlF8onAmxWpgouuXgVa8Tozt+Jbmj2XBUw==
X-Received: by 2002:a05:600c:4ed3:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4538f244121mr129104465e9.4.1751276835016;
        Mon, 30 Jun 2025 02:47:15 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.177.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a87e947431sm9969199f8f.0.2025.06.30.02.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:47:14 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:47:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net v2 2/3] vsock: Fix transport_* TOCTOU
Message-ID: <o2erk5qbypfrla2afvlswzp7al43xulrucdo7b7wvnhsytjchm@jh6spvmgfo2c>
References: <20250620-vsock-transports-toctou-v2-0-02ebd20b1d03@rbox.co>
 <20250620-vsock-transports-toctou-v2-2-02ebd20b1d03@rbox.co>
 <l6yqfwqjzygrs74shfsiptexwqydw3ts2eiuet2te3b7sseelo@ygussce5st4h>
 <b0b49299-6373-4fea-914b-271f6451e27b@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b0b49299-6373-4fea-914b-271f6451e27b@rbox.co>

On Sun, Jun 29, 2025 at 11:26:25PM +0200, Michal Luczaj wrote:
>On 6/27/25 10:08, Stefano Garzarella wrote:
>> On Fri, Jun 20, 2025 at 09:52:44PM +0200, Michal Luczaj wrote:
>>> Transport assignment may race with module unload. Protect new_transport
>>>from becoming a stale pointer.
>>>
>>> This also takes care of an insecure call in vsock_use_local_transport();
>>> add a lockdep assert.
>>>
>>> BUG: unable to handle page fault for address: fffffbfff8056000
>>> Oops: Oops: 0000 [#1] SMP KASAN
>>> RIP: 0010:vsock_assign_transport+0x366/0x600
>>> Call Trace:
>>> vsock_connect+0x59c/0xc40
>>> __sys_connect+0xe8/0x100
>>> __x64_sys_connect+0x6e/0xc0
>>> do_syscall_64+0x92/0x1c0
>>> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>>>
>>> Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>> ---
>>> net/vmw_vsock/af_vsock.c | 28 +++++++++++++++++++++++-----
>>> 1 file changed, 23 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>>> index 63a920af5bfe6960306a3e5eeae0cbf30648985e..a1b1073a2c89f865fcdb58b38d8e7feffcf1544f 100644
>>> --- a/net/vmw_vsock/af_vsock.c
>>> +++ b/net/vmw_vsock/af_vsock.c
>>> @@ -407,6 +407,8 @@ EXPORT_SYMBOL_GPL(vsock_enqueue_accept);
>>>
>>> static bool vsock_use_local_transport(unsigned int remote_cid)
>>> {
>>> +	lockdep_assert_held(&vsock_register_mutex);
>>> +
>>> 	if (!transport_local)
>>> 		return false;
>>>
>>> @@ -464,6 +466,8 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
>>>
>>> 	remote_flags = vsk->remote_addr.svm_flags;
>>>
>>> +	mutex_lock(&vsock_register_mutex);
>>> +
>>> 	switch (sk->sk_type) {
>>> 	case SOCK_DGRAM:
>>> 		new_transport = transport_dgram;
>>> @@ -479,12 +483,15 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
>>> 			new_transport = transport_h2g;
>>> 		break;
>>> 	default:
>>> -		return -ESOCKTNOSUPPORT;
>>> +		ret = -ESOCKTNOSUPPORT;
>>> +		goto err;
>>> 	}
>>>
>>> 	if (vsk->transport) {
>>> -		if (vsk->transport == new_transport)
>>> -			return 0;
>>> +		if (vsk->transport == new_transport) {
>>> +			ret = 0;
>>> +			goto err;
>>> +		}
>>
>> 		/* transport->release() must be called with sock lock acquired.
>> 		 * This path can only be taken during vsock_connect(), where we
>> 		 * have already held the sock lock. In the other cases, this
>> 		 * function is called on a new socket which is not assigned to
>> 		 * any transport.
>> 		 */
>> 		vsk->transport->release(vsk);
>> 		vsock_deassign_transport(vsk);
>>
>> Thinking back to this patch, could there be a deadlock between call
>> vsock_deassign_transport(), which call module_put(), now with the
>> `vsock_register_mutex` held, and the call to vsock_core_unregister()
>> usually made by modules in the exit function?
>
>I think we're good. module_put() does not call the module cleanup function
>(kernel/module/main.c:delete_module() syscall does that), so
>vsock_core_unregister() won't happen in this path here. Have I missed
>anything else?
>

Nope, I reached the same conclusion!

Thanks,
Stefano

