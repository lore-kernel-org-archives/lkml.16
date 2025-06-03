Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6328150A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748942852; cv=none; b=Dyf1jcPC8KobvfTrMMCDkfMzYfNt0L5wV9PNvFsMx0OLeKiR9BN5Gg6CIctcgAwJ9ZCnhbUm7tYhjxZZBSnE9/G+brxqUwXy7golJVg/wrRUP+hs1jUCCG8NyLOprV6u0XDQKC+68+HwuL/bQ7Rb+bFAgd14CGiL0x+zIfzQ3fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748942852; c=relaxed/simple;
	bh=2hMem/KqDeI9GDbv4TmP7Cw42i8qowh8O7PAaxFouC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+ozINOWt3ttZ/jQRA4VPpDvpRbgjodagL5MpttxC9kkojTEAYGlh/5f5s2tnU6vV2xXICtMVhh993RMErCjk8V80SUpiFkY3iIIYG8of9g0Y0u9iEG8Yz3L2AZEkIKZYxcv9B1bEJqqkct3P/+IG1QZjI8u1R8kri274Y4i66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Buq8iDpA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Buq8iDpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748942849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8enqeYQbzg4jaVPoTSHLBVjvDlbQarwlHPEkIaRNBE=;
	b=Buq8iDpAv+CM/bestkI9obWx/bo9Zju6NQsNKukAu+/NN5cjFl9Ufgu+utxLmeAXU+MVxk
	/0+/sHNRViKOxsDqOwL8VajuGMnlZxGSTOCpqJnclGUSCvDO9h/1IdBHYbQil21LB5zmq4
	ryS0vMr/S7WgeJnlbYuDuY+2RZ2nmag=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-_ttKFQ1-NUqwnWPzMhpBoA-1; Tue, 03 Jun 2025 05:27:26 -0400
X-MC-Unique: _ttKFQ1-NUqwnWPzMhpBoA-1
X-Mimecast-MFC-AGG-ID: _ttKFQ1-NUqwnWPzMhpBoA_1748942845
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso28400865e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 02:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748942845; x=1749547645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8enqeYQbzg4jaVPoTSHLBVjvDlbQarwlHPEkIaRNBE=;
        b=HIHME528vjbcysy57L5L4V7We35uazO/TrgVnQqh1xyrdCTbAmA142UgyPI1SWZjtS
         VnY32PIciWsUwM/NzKqQas/qVz2QjgyIjKoWeI+rYAmBsNR/n0zTV+i4T2fZb8/Lpkep
         VMovh4h5u8VUCQpX4mMTALtL8wSWW7RxSvKX+v0pkVED0XaahVeeJrF2VMxmbAPcIF+x
         9n7U245gj9jfGp/NN1W1SbN4KTqMXGyY5y/8eCPFI1P8NtQ0cAVxqwOnaL8servkEOFq
         u02B4ocNMfGd+Qbao/CHn6knODia4wogT6zr71uZuwB7jD/8B1VnQVChyOGWSthfhFX0
         ntFg==
X-Forwarded-Encrypted: i=1; AJvYcCW+bm+ELPw54G3JUHK+WInhZOYi6Ii+8LDzkkWK5WOJ80b+46hT8GpB8U16jLtpgIqQF+599AEXpBoyB3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXL0DCVYjnt2kTq/fkyI/7GDdkCgmRg8qTuUoULuM2sxOWDTfD
	C/ixLjWzJaatfQXxKsNAkmM1l3yHC9iJFQr3D3C+UeGqdIaMWyGi5x9/jNhNuCAVdvg1sB0gWfd
	K+A2H+zyo95bwieXa/DXDNXLia0LnkeseJ9IOILlubSjYNPkP5ZvhuyxyPpDD+CJu5Q==
X-Gm-Gg: ASbGncsoZ7DXXZJg7/6MHcVM+VUG7v8QkjjyiJj/PgWQm3vgD4qjg4GTtIIUTb06pm/
	qESG1JmiQLWF9tcwCDLniEHyv8sOSCMk7qursMd9MvJhMBSYWjwKMjNds3r+3KcFXFRevS3t1Mw
	liDnNaZdLbyGRhUye9iVRgdovZoNCu93qI5+PYrX15Dd/kB94SYa8J0TkdYIRWepfKWLhMNMWP3
	rzup7wNc3anOWLOskxnQW88b124Fe9z/KUaqSxZpqD8POxDqfB5yjoWCnMuIxb/SyHBYxbMkEYP
	CMlNRqSGkwn1DSWxVvf5D6P19UU9N+WjZparny1Wbad2nxH9jY761QCl
X-Received: by 2002:a5d:4e85:0:b0:3a4:f911:8d93 with SMTP id ffacd0b85a97d-3a4f9118ed0mr9886367f8f.31.1748942845469;
        Tue, 03 Jun 2025 02:27:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3E8LnB/PqSELpQDG+6H33vKSzf9Q13hS9eE9fktyrONE+k1arXEMdhNoJ6Q9Zr/vUTIyhyw==
X-Received: by 2002:a5d:4e85:0:b0:3a4:f911:8d93 with SMTP id ffacd0b85a97d-3a4f9118ed0mr9886338f8f.31.1748942845062;
        Tue, 03 Jun 2025 02:27:25 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc2d:3210:4b21:7487:446:42ea? ([2a0d:3341:cc2d:3210:4b21:7487:446:42ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972aasm17987538f8f.66.2025.06.03.02.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 02:27:24 -0700 (PDT)
Message-ID: <6440a277-536e-402f-a47e-43ee182b22c7@redhat.com>
Date: Tue, 3 Jun 2025 11:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] vmxnet3: correctly report gso type for UDP tunnels
To: Simon Horman <horms@kernel.org>, Ronak Doshi <ronak.doshi@broadcom.com>
Cc: netdev@vger.kernel.org, Guolin Yang <guolin.yang@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250530152701.70354-1-ronak.doshi@broadcom.com>
 <20250603072308.GW1484967@horms.kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250603072308.GW1484967@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 9:23 AM, Simon Horman wrote:
> On Fri, May 30, 2025 at 03:27:00PM +0000, Ronak Doshi wrote:
>> Commit 3d010c8031e3 ("udp: do not accept non-tunnel GSO skbs landing
>> in a tunnel") added checks in linux stack to not accept non-tunnel
>> GRO packets landing in a tunnel. This exposed an issue in vmxnet3
>> which was not correctly reporting GRO packets for tunnel packets.
>>
>> This patch fixes this issue by setting correct GSO type for the
>> tunnel packets.
>>
>> Currently, vmxnet3 does not support reporting inner fields for LRO
>> tunnel packets. The issue is not seen for egress drivers that do not
>> use skb inner fields. The workaround is to enable tnl-segmentation
>> offload on the egress interfaces if the driver supports it. This
>> problem pre-exists this patch fix and can be addressed as a separate
>> future patch.
>>
>> Fixes: dacce2be3312 ("vmxnet3: add geneve and vxlan tunnel offload support")
>> Signed-off-by: Ronak Doshi <ronak.doshi@broadcom.com>
>> Acked-by: Guolin Yang <guolin.yang@broadcom.com>
>>
>> Changes v1-->v2:
>>   Do not set encapsulation bit as inner fields are not updated
>> Changes v2-->v3:
>>   Update the commit message explaining the next steps to address
>>   segmentation issues that pre-exists this patch fix.
>> Changes v3->v4:
>>   Update the commit message to clarify the workaround.
>> ---
>>  drivers/net/vmxnet3/vmxnet3_drv.c | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
>> index c676979c7ab9..287b7c20c0d6 100644
>> --- a/drivers/net/vmxnet3/vmxnet3_drv.c
>> +++ b/drivers/net/vmxnet3/vmxnet3_drv.c
>> @@ -1568,6 +1568,30 @@ vmxnet3_get_hdr_len(struct vmxnet3_adapter *adapter, struct sk_buff *skb,
>>  	return (hlen + (hdr.tcp->doff << 2));
>>  }
>>  
>> +static void
>> +vmxnet3_lro_tunnel(struct sk_buff *skb, __be16 ip_proto)
>> +{
>> +	struct udphdr *uh = NULL;
>> +
>> +	if (ip_proto == htons(ETH_P_IP)) {
>> +		struct iphdr *iph = (struct iphdr *)skb->data;
>> +
>> +		if (iph->protocol == IPPROTO_UDP)
>> +			uh = (struct udphdr *)(iph + 1);
>> +	} else {
>> +		struct ipv6hdr *iph = (struct ipv6hdr *)skb->data;
>> +
>> +		if (iph->nexthdr == IPPROTO_UDP)
>> +			uh = (struct udphdr *)(iph + 1);
>> +	}
> 
> Hi Ronak,
> 
> Possibly a naive question, but does skb->data always contain an iphdr
> or ipv6hdr? Or perhaps more to the point, is it safe to assume IPv6
> is ip_proto is not ETH_P_IP?

I think it's safe, or at least the guest can assume that. Otherwise
there is a bug in the hypervisor cooking the descriptor, and the guest
can do little to nothing is such scenario.

/P

