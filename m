Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B42BE7A5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651662; cv=none; b=eo4Lwv9+RVGQtzaJXA9oObuL5NgNpe/vj5gDw5UN5ue/sCDzj4dImGeSh92VXFkgdG8RwXJtliXtrlHWxBtNicib4J7fhTjkAm+iKCVS1Dy6ejQArE1dgazoqdjVW+5qI5ALBzzaQBJh3VLdyhVy4r2p/SCfPh03Q0J3rKNcRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651662; c=relaxed/simple;
	bh=tEXibwohiKNHCWkX7JniiQ7ZfUXlGD/79RnMkx3tqaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE7NsHMAe+EwUWKU7XsT3O3CofbEpi2LSBek4zqefBisj1qGz/pEq3h9fz4Syf9LHAPiVqarfuE46AxyRcQDJ1bUEBcFj4T1MLSNtxUS85LrBuR4P8WFBYix84QDOEr1puV98hCKGS3AA4FLyPBceJ8MXN4BX9jYZSlLChquBoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R0sMUzby; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R0sMUzby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749651659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C/ntzkpVyIcXdzoQL5rgGpdL1A4Z+ur0N0W3VcmJOj4=;
	b=R0sMUzbyi9TxJfrd4h8JgHphqhWrEspdztkSbKNlo19cx/7Y0w1p5pYdGD+Pt1n0ANHzhc
	JXHtCk5Edg4kGaq9CX90Kfq9WUkPyUoIbPd1Y/rsLxOElU2gk0PF02CyUCJtGzWAQK1N+7
	G5InTrU7yq08caHijc2slf4IIpw7jh4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-L674VLQ0PLGWQleSIgqfWA-1; Wed, 11 Jun 2025 10:20:58 -0400
X-MC-Unique: L674VLQ0PLGWQleSIgqfWA-1
X-Mimecast-MFC-AGG-ID: L674VLQ0PLGWQleSIgqfWA_1749651658
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad34d3cd8so110884346d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651658; x=1750256458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/ntzkpVyIcXdzoQL5rgGpdL1A4Z+ur0N0W3VcmJOj4=;
        b=B8NUkS90E2IHv9Q48TQrFeHtGfPpCLjZrummI5Pr2uItT2PRbnoX0N32oMT6jTDWZo
         zKX2yQZVarxEAslz4I07Fyizvi+GUFET4xzaWuMvaf5inuXmtsXZiDVDcky0dMQ0s4V6
         6E2Xq58ibrljav5D0Yp46ldt8iKmHS+G75zwe/m5J1ZUEcXhlhc89cKvHfe/RAVWdKxB
         C7G7kTAx7nNm3i9YvubrLizsu2bb3j9m//J57w4RBmMqcvuh6sl/CmlpDgyg5Xa6EwER
         OA7dP/sTju/Y3j+1yc5FuFQGGvNX9o5J0zY6ziP0p0OMrFsvF/fxGlI1DcchPVeVg0/a
         WPSw==
X-Forwarded-Encrypted: i=1; AJvYcCVElNZiFP324GyvsMmi3XXE24ySQN5s2lj0QE+nKT0L4EbDJpIraaWo9dY8zLhipMwpk+xDP6cNfYJ66Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD9oL48KELpe7rxUzwsb5YFG8iUlxa5whixTDqv+AOWcoAUkCw
	sNEb5xxH6mdu2Z6lEj8zZ6THD76eZpVlLDBOryk/yRCT8COyRl0eKLlsx5acr0cjOCjiUYTdias
	tXLqL+MJEePze2tOQaJ3aEzgcDxUcBmJBQHsnyz0/0hmJjdQE+hq3JmEwbs6YcsHaTw==
X-Gm-Gg: ASbGncuXk09hPpViLLQ4gmUyFR58w4qJYP/7fQbzrHoug7oYX5MSeZZjhZW0ZuR0TMU
	8fA5cfopkKCBFj945pmUuOz4ZNCcvwAfglIVYVj4hD4Y0yMWxoLftnqy0FUobX3u09Izc0WdhEl
	cme2zVqzKFQFbqJzDXB4vOu/QaXw0lXLsHdGFjOOYnxpsuhZSJJp4acpmF818jXwDZwbenyr0l7
	czr06xh7p0B7VxrbMCEgzllCa3t9Ej01kUanE4vLRdR7iRahKCdCf7iKE+M+tOXtfrOyKN+S7cK
	DgIyk/cwALluT2QpzCCjw94ske21
X-Received: by 2002:a05:6214:e87:b0:6f4:cb2e:25cc with SMTP id 6a1803df08f44-6fb2c375cbcmr53864586d6.32.1749651657764;
        Wed, 11 Jun 2025 07:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQt/g4HB23CjbIbHN4akFe9MRSdw7e8RgKDMJzNZJ6k+6aUqN0eqJB/UJ1rAQJhrsDdwLVxA==
X-Received: by 2002:a05:6214:e87:b0:6f4:cb2e:25cc with SMTP id 6a1803df08f44-6fb2c375cbcmr53864296d6.32.1749651657123;
        Wed, 11 Jun 2025 07:20:57 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.148.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b2a1fasm82526736d6.93.2025.06.11.07.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:20:56 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:20:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net-next v2 2/3] vsock/test: Introduce
 get_transports()
Message-ID: <lvduahetdnmshgo7tus7kezq6ddps5wjouefkmfwxkw7ckbhpg@nvjhai4xt5kl>
References: <20250528-vsock-test-inc-cov-v2-0-8f655b40d57c@rbox.co>
 <20250528-vsock-test-inc-cov-v2-2-8f655b40d57c@rbox.co>
 <wzbyv7fvzgpf4ta775of6k4ozypnfe6szysvnz4odd3363ipsp@2v3h5w77cr7a>
 <b4f3bc0d-9ff5-4271-be28-bbace27927bd@rbox.co>
 <hxnugz3xrrn3ze2arcvjumvjqekvjfsrvd32wi7e3zgdagdaqb@cm3y6fipqdf3>
 <adae2539-2a48-45c3-a340-e9ab3776941f@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <adae2539-2a48-45c3-a340-e9ab3776941f@rbox.co>

On Fri, Jun 06, 2025 at 09:51:29AM +0200, Michal Luczaj wrote:
>On 6/5/25 12:46, Stefano Garzarella wrote:
>> On Wed, Jun 04, 2025 at 09:10:19PM +0200, Michal Luczaj wrote:
>>> On 6/4/25 11:07, Stefano Garzarella wrote:
>>>> On Wed, May 28, 2025 at 10:44:42PM +0200, Michal Luczaj wrote:
>>>>> +static int __get_transports(void)
>>>>> +{
>>>>> +	/* Order must match transports defined in util.h.
>>>>> +	 * man nm: "d" The symbol is in the initialized data section.
>>>>> +	 */
>>>>> +	const char * const syms[] = {
>>>>> +		"d loopback_transport",
>>>>> +		"d virtio_transport",
>>>>> +		"d vhost_transport",
>>>>> +		"d vmci_transport",
>>>>> +		"d hvs_transport",
>>>>> +	};
>>>>
>>>> I would move this array (or a macro that define it), near the transport
>>>> defined in util.h, so they are near and we can easily update/review
>>>> changes.
>>>>
>>>> BTW what about adding static asserts to check we are aligned?
>>>
>>> Something like
>>>
>>> #define KNOWN_TRANSPORTS	\
>>
>> What about KNOWN_TRANSPORTS(_) ?
>
>Ah, yeah.
>
>>> 	_(LOOPBACK, "loopback")	\
>>> 	_(VIRTIO, "virtio")	\
>>> 	_(VHOST, "vhost")	\
>>> 	_(VMCI, "vmci")		\
>>> 	_(HYPERV, "hvs")
>>>
>>> enum transport {
>>> 	TRANSPORT_COUNTER_BASE = __COUNTER__ + 1,
>>> 	#define _(name, symbol)	\
>>> 		TRANSPORT_##name = _BITUL(__COUNTER__ - TRANSPORT_COUNTER_BASE),
>>> 	KNOWN_TRANSPORTS
>>> 	TRANSPORT_NUM = __COUNTER__ - TRANSPORT_COUNTER_BASE,
>>> 	#undef _
>>> };
>>>
>>> static char * const transport_ksyms[] = {
>>> 	#define _(name, symbol) "d " symbol "_transport",
>>> 	KNOWN_TRANSPORTS
>>> 	#undef _
>>> };
>>>
>>> static_assert(ARRAY_SIZE(transport_ksyms) == TRANSPORT_NUM);
>>>
>>> ?
>>
>> Yep, this is even better, thanks :-)
>
>Although checkpatch complains:
>
>ERROR: Macros with complex values should be enclosed in parentheses
>#105: FILE: tools/testing/vsock/util.h:11:
>+#define KNOWN_TRANSPORTS(_)	\
>+	_(LOOPBACK, "loopback")	\
>+	_(VIRTIO, "virtio")	\
>+	_(VHOST, "vhost")	\
>+	_(VMCI, "vmci")		\
>+	_(HYPERV, "hvs")
>
>BUT SEE:
>
>   do {} while (0) advice is over-stated in a few situations:
>
>   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
>   file-scope, where C disallows code (it must be in functions).  See
>   $exceptions if you have one to add by name.
>
>   More troublesome is declarative macros used at top of new scope,
>   like DECLARE_PER_CPU.  These might just compile with a do-while-0
>   wrapper, but would be incorrect.  Most of these are handled by
>   detecting struct,union,etc declaration primitives in $exceptions.
>
>   Theres also macros called inside an if (block), which "return" an
>   expression.  These cannot do-while, and need a ({}) wrapper.
>
>   Enjoy this qualification while we work to improve our heuristics.
>
>ERROR: Macros with complex values should be enclosed in parentheses
>#114: FILE: tools/testing/vsock/util.h:20:
>+	#define _(name, symbol)	\
>+		TRANSPORT_##name = BIT(__COUNTER__ - TRANSPORT_COUNTER_BASE),
>
>WARNING: Argument 'symbol' is not used in function-like macro
>#114: FILE: tools/testing/vsock/util.h:20:
>+	#define _(name, symbol)	\
>+		TRANSPORT_##name = BIT(__COUNTER__ - TRANSPORT_COUNTER_BASE),
>
>WARNING: Argument 'name' is not used in function-like macro
>#122: FILE: tools/testing/vsock/util.h:28:
>+	#define _(name, symbol) "d " symbol "_transport",
>
>Is it ok to ignore this? FWIW, I see the same ERRORs due to similarly used
>preprocessor directives in fs/bcachefs/alloc_background_format.h, and the
>same WARNINGs about unused macro arguments in arch/x86/include/asm/asm.h
>(e.g. __ASM_SEL).

It's just test, so I think it's fine to ignore, but please exaplain it 
in the commit description with also references to other ERRORs/WARNINGs 
like you did here. Let's see what net maintainers think.

Thanks,
Stefano

