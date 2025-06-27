Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA92233156
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011839; cv=none; b=ekVDuVCIIMMt+q3qZGV4uQHj12yZTwhUsMWk+y7H2pjFqXRa9lUhbTArZval/YO9oK69FqJkfRL5AGf4fQNXoM+XUyvvIcXAWo9JznUUsLizHQ5gP5QaBRHb8Zsp48SrR9Wd0ysisqqZqKm3US3GrwQS3crZM7qEhR5NGxnSRzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011839; c=relaxed/simple;
	bh=QS4tL4YPdYZDlMFPgDrNTqwuJlb294yaj6dINXZ6Ai0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Az8rdBtpkwQ75qyQYRZT7QaVmaDZ2zzp85dRwbfAhmwf2utZiuuO/ebuTE+km2v7LEYloNLvggElp0pmJ3TaGkTXTf6FmNrK1xuElQ06fzPo3a7RsKOT/p5HP7DfDOjf3r1FLnhgtvoqXjHxgM70p8dfQDE8NSSz8CPIkA8TPlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxeBjmYq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxeBjmYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751011835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sICsXc1ofeVsypbgyq0RR1yDIuegz/49BcNvRJ0ZQE=;
	b=OxeBjmYqbgZPUNagomicpZsiAJPgWErOtkRnJzxkIEf784iSvyewu0oe4n9/EmIkvPWhtp
	+viuSWKmBv/X+r2RSoa8WhMuaY1aKjXkQp/yOlITJ1yIyLYeyH22QW7IUJTcj6/rPGnnDV
	+nVpyAHFrmL8Oyz9xXWMSkKbT+0tax8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-5jGov9xsPHyq_19Jq3bx1g-1; Fri, 27 Jun 2025 04:10:33 -0400
X-MC-Unique: 5jGov9xsPHyq_19Jq3bx1g-1
X-Mimecast-MFC-AGG-ID: 5jGov9xsPHyq_19Jq3bx1g_1751011832
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fafc9f3e1bso26908646d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011832; x=1751616632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sICsXc1ofeVsypbgyq0RR1yDIuegz/49BcNvRJ0ZQE=;
        b=aFNdzilyGmod7Xgz1PWmmd5o9gRuIkAaMg/RRu//9yrp4F0GOrz9GZ32bVGyJIKe/a
         bx8KrUUfrGslsH+naxA2sZNZ2WgAsaqbYUrdUTXuPdwU7E2qeWVDgInnTvW86lGSNBGW
         i6HPIusBkl1tz0hChqfkcErwSuGCxfCXzRScI/yjZN4Rh6sM+3Vb1xEB1Vpq8nXRJPJq
         uNMh8FhmVQkbWeM/4PNEIXW63xVKz/xNj3LpCB/rB5aPYB9Zw2nTjYkjKNGYvDGe3QVz
         UZ0qi/nZkeqj0xILW/NNCnfLv+uQ4yZ6ZwRj6QvNlZtcmwy0AUiQgCcKHBYf8NeMrfXq
         H4og==
X-Forwarded-Encrypted: i=1; AJvYcCV5vCfwu4CEot076QtHWzf2xd2CXYpjhCD2KfU+jKJzYgb55RQDTcrspEqKf+9Rtmr9idDN05KoLAB9cAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqnDPfw/OluPd9bbp3HsctreQhrTct8yBpcvzZtA9E9SwReOOX
	RJev+ZJWTXT8mtdsA+AZherFaknZz6EpvC3fqD8Yo8idmDa4CJZI6TkgDsIPGUlqh6FHCc3wwS6
	wZPI7uO9OH1ewQJ7Ek58cTtNWx/dYL/ZHAxDBR6xlP0qXaWn9crpu528Tpi6m+TIACQ==
X-Gm-Gg: ASbGncvYPSDtvk83S1qA1uCbRw0zmggDbs3azyXk9uv7VrZ5TP3MYs3FeWsNXZt8fbq
	NhTMzeTo6MoR3CAqEJ1ub3NxARXUnqT0cMI6HFSU/G0rSnlP5PotxC/Ntb0bOmZ9j15vcrBoa3f
	PgOXJJLGakraBIMvWlj2gU3i1gbG/MUXJk+lu1LyVszYTJOx5bmdM00UNZMyJX984VklR/wCNK1
	OLIlm4aEuQP0cGRgoVQim+vHkvF0s6qCVK6zqaxiCi8no4KFx+qBMMlHHBJNmIFXAiyCR5txRtb
	MUf04u/UUlHYcXN7Mep3b3PrqJY=
X-Received: by 2002:a05:6214:4348:b0:6fd:7577:cee9 with SMTP id 6a1803df08f44-70001c5337fmr39979456d6.2.1751011832548;
        Fri, 27 Jun 2025 01:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8ZeT8wRwtLOWbjGTnZVZZO5DgdH1k5n++yxPhBj+AdN+0ke2A1ox3AZXiS29WEGnMIQ7rXw==
X-Received: by 2002:a05:6214:4348:b0:6fd:7577:cee9 with SMTP id 6a1803df08f44-70001c5337fmr39979196d6.2.1751011832083;
        Fri, 27 Jun 2025 01:10:32 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.150.33])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317195fsm91926485a.38.2025.06.27.01.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:10:31 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:10:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net v2 3/3] vsock: Fix IOCTL_VM_SOCKETS_GET_LOCAL_CID
 to check also `transport_local`
Message-ID: <b3fx4pma6l2zgfw7azvzliqfwu3ldjdlvbnegmzcuef5ryldux@2mbc5qsgkf45>
References: <20250620-vsock-transports-toctou-v2-0-02ebd20b1d03@rbox.co>
 <20250620-vsock-transports-toctou-v2-3-02ebd20b1d03@rbox.co>
 <uqap2qzmvkfqxfqssxnt5anni6jhdupnarriinblznv5lfk764@qkrjq22xeygb>
 <0adde2db-3a75-4ade-a1c8-8c3bc2a0b1fd@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0adde2db-3a75-4ade-a1c8-8c3bc2a0b1fd@rbox.co>

On Wed, Jun 25, 2025 at 11:23:54PM +0200, Michal Luczaj wrote:
>On 6/25/25 10:54, Stefano Garzarella wrote:
>> On Fri, Jun 20, 2025 at 09:52:45PM +0200, Michal Luczaj wrote:
>>> Support returning VMADDR_CID_LOCAL in case no other vsock transport is
>>> available.
>>>
>>> Fixes: 0e12190578d0 ("vsock: add local transport support in the vsock core")
>>> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>> ---
>>> man vsock(7) mentions IOCTL_VM_SOCKETS_GET_LOCAL_CID vs. VMADDR_CID_LOCAL:
>>>
>>>   Ioctls
>>>       ...
>>>       IOCTL_VM_SOCKETS_GET_LOCAL_CID
>>>              ...
>>>              Consider using VMADDR_CID_ANY when binding instead of
>>>              getting the local CID with IOCTL_VM_SOCKETS_GET_LOCAL_CID.
>>>
>>>   Local communication
>>>       ....
>>>       The local CID obtained with IOCTL_VM_SOCKETS_GET_LOCAL_CID can be
>>>       used for the same purpose, but it is preferable to use
>>>       VMADDR_CID_LOCAL.
>>>
>>> I was wondering it that would need some rewriting, since we're adding
>>> VMADDR_CID_LOCAL as a possible ioctl's return value.
>>
>> IIRC the reason was, that if we have for example a G2H module loaded,
>> the ioctl returns the CID of that module (e.g. 42). So, we can use both
>> 42 and VMADDR_CID_LOCAL to do the loopback communication, but we
>> encourage to always use VMADDR_CID_LOCAL.  With this change we basically
>> don't change that, but we change the fact that if there is only the
>> loopback module loaded, before the ioctl returned VMADDR_CID_ANY, while
>> now it returns LOCAL rightly.
>>
>> So, IMO we are fine.
>
>All right, got it.
>
>>> ---
>>> net/vmw_vsock/af_vsock.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>>> index a1b1073a2c89f865fcdb58b38d8e7feffcf1544f..4bdb4016bd14d790f3d217d5063be64a1553b194 100644
>>> --- a/net/vmw_vsock/af_vsock.c
>>> +++ b/net/vmw_vsock/af_vsock.c
>>> @@ -2577,6 +2577,8 @@ static long vsock_dev_do_ioctl(struct file *filp,
>>> 		cid = vsock_transport_local_cid(&transport_g2h);
>>> 		if (cid == VMADDR_CID_ANY)
>>> 			cid = vsock_transport_local_cid(&transport_h2g);
>>> +		if (cid == VMADDR_CID_ANY && transport_local)
>>> +			cid = VMADDR_CID_LOCAL;
>>
>> why not `cid = vsock_transport_local_cid(&transport_local)` like for
>> H2G?
>
>Sure, can do. I've assumed transport_local would always have a local CID of
>VMADDR_CID_LOCAL. So taking mutex and going through a callback function to
>get VMADDR_CID_LOCAL seemed superfluous. But I get it, if you want to have
>it symmetrical with the other vsock_transport_local_cid()s.

Yeah, BTW for transport_h2g is the same, they always should return 
VMADDR_CID_HOST, so I think we should be symmetrical.

Thanks,
Stefano

