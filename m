Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733B81F4CB7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479744; cv=none; b=dDk6d+WZHZxPA/Nd+S1O98Wnv2S53bhdzp+sKiyAV4r54ayxm1LHOvbOkSzRksCpFJ4bRJnkotYXZ6B+rWu02oM/LdFItvT8Mr/P8BRc2RC44bDtwlpAHyM3tOBrL6rhQ2zfjU6HcfuppHb1VdI6dHcj6k7xTyewWk7m2S7YrlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479744; c=relaxed/simple;
	bh=58VbzL7WBIj/gt8GsrfhUli+bScIim9A36WA+y91mr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0SLw1DEgfFdjJ7YcVsolPbgDJdKDYkML+OFwPM3r3RvsU/C/JJzhJcW/2TrQSLqOVYeaOjKUaPZK7ULzFdvTHkOlYg/46AmUDtgPVrNF8C5vSj4ZmJlKlwIy7oHaD/LjFH8KR59KL3c8vWeSivBpoVmM6DIFImgAuBnCh6CpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=izHCBgAQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="izHCBgAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745479741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bwzIUNmrfNNFBn2a+tyDnc0Y7kp3uVqhE1QTaSwZ2sg=;
	b=izHCBgAQ43WkfjzGJFtdZ+7W1g2qtHX6eyzLIzFktQ08Yua/rfWn87LEken6s8R91AhdNH
	rNxEY6lSwaDdaj+or/L2ReINGMQKFb7w6x1DP+U/jyfuC4DQxZbA0LdGOoS9y+xQJoftwQ
	FqT/Dlamq5LnL9lzI1Ls3yKK2fwxkyg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-vO5cxW9XOW-VcWjDk_4uJg-1; Thu, 24 Apr 2025 03:28:59 -0400
X-MC-Unique: vO5cxW9XOW-VcWjDk_4uJg-1
X-Mimecast-MFC-AGG-ID: vO5cxW9XOW-VcWjDk_4uJg_1745479739
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912539665cso732728f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479738; x=1746084538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwzIUNmrfNNFBn2a+tyDnc0Y7kp3uVqhE1QTaSwZ2sg=;
        b=ApSX2q0NiqvpWLTgDWiHtnXOrFdE6yYQVxt60G9lQmRlYdXFEo4T/GZcXAGFWKHxrq
         YK1QWbLvVySYXObvAeMMBnnRjGD50VEmD8t5PdUd8mbS2WEBsWN2yUcbx4QE4mVJuns4
         8V+Wg2Sewzqa3VxjkStz7rQpEBXd5ioraVYahIZ1pL0r8WYvoI5ukgiiHq7EZdMzLiBv
         BPqfHCoqzQCi4PfGK7hsFps+A3UVCXveoXIHJz+xOX5BlyCM+ESezefVZmTvDendWLpV
         Ko2586K4+yACZoQCBct+fi3SljA/9W3AueZy4ThzGQUze0oEhslXkDtuFSD+VqA+e8xn
         gTKA==
X-Forwarded-Encrypted: i=1; AJvYcCWQpIiwzhdwPVEF35noiGuM5ocxXz9Df5pJbWYBvSihRzgr5qDmlVNJ6HPX7zBYzMPuT3NtoIzCyX1WcPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz804blBRHRYVSIqd7bihNV0gPoyYmkoC0o3E1nijzOYPfRhgtP
	QcarxTHdJxiXPUpN63wgQpW+trghiMutGkm40Ltzmy6CN5rHAOnqZsoj+xGPvqaLhJBz5w+bMNR
	8uOszfoQnjmgwfnUciXpIGUi3m3YzLcU7nr5/hmTNLmalmBohsEzMkyvjQpt5GA==
X-Gm-Gg: ASbGnct+xGHJ4ZyJKbX/dQ6Wm0CWr5aNpSumIzmXHeR05tSKOl+WNIa9Z4ZBbs5cZNO
	7buxMw1LOQ9QHe96+e7baggveaCyXHO8ynlsd8W14GnnqpoRLFjncI8k5OtPZTxouaZGNBG0vDU
	6TGb3+xQ7uHe3C+uvCtbTlm3Vc4a3X1sHG84DYyrpU8gGHLE+xiY/lzdItrCDNjuFpf8vuDCZ2d
	8ET5vOFnZ7FajLd5xSBrFTW0L9Ly/ldbPgITe69IISgP84BtyGQDGRic+Y5rB05MdAl1USva2F9
	UBYo0o2roJsSgfo6Lw==
X-Received: by 2002:a05:6000:1ac8:b0:391:952:c74a with SMTP id ffacd0b85a97d-3a06d64c740mr949966f8f.8.1745479738591;
        Thu, 24 Apr 2025 00:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuUa0YduITc/StEvDnDrjkIBytecQS6p/m5AkoGY//NHIa97UcP6cmwP+3zmnYPvZk3FjUWA==
X-Received: by 2002:a05:6000:1ac8:b0:391:952:c74a with SMTP id ffacd0b85a97d-3a06d64c740mr949939f8f.8.1745479738094;
        Thu, 24 Apr 2025 00:28:58 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.217.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d569b38sm1080863f8f.100.2025.04.24.00.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:28:57 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:28:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Luigi Leonardi <leonardi@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] vsock: Linger on unsent data
Message-ID: <wnonuiluxgy6ixoioi57lwlixfgcu27kcewv4ajb3k3hihi773@nv3om2t3tsgo>
References: <20250421-vsock-linger-v2-0-fe9febd64668@rbox.co>
 <20250421-vsock-linger-v2-1-fe9febd64668@rbox.co>
 <km2nad6hkdi3ngtho2xexyhhosh4aq37scir2hgxkcfiwes2wd@5dyliiq7cpuh>
 <k47d2h7dwn26eti2p6nv2fupuybabvbexwinvxv7jnfbn6o3ep@cqtbaqlqyfrq>
 <ee09df9b-9804-49de-b43b-99ccd4cbe742@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ee09df9b-9804-49de-b43b-99ccd4cbe742@rbox.co>

On Wed, Apr 23, 2025 at 11:06:33PM +0200, Michal Luczaj wrote:
>On 4/23/25 18:34, Stefano Garzarella wrote:
>> On Wed, Apr 23, 2025 at 05:53:12PM +0200, Luigi Leonardi wrote:
>>> Hi Michal,
>>>
>>> On Mon, Apr 21, 2025 at 11:50:41PM +0200, Michal Luczaj wrote:
>>>> Currently vsock's lingering effectively boils down to waiting (or timing
>>>> out) until packets are consumed or dropped by the peer; be it by receiving
>>>> the data, closing or shutting down the connection.
>>>>
>>>> To align with the semantics described in the SO_LINGER section of man
>>>> socket(7) and to mimic AF_INET's behaviour more closely, change the logic
>>>> of a lingering close(): instead of waiting for all data to be handled,
>>>> block until data is considered sent from the vsock's transport point of
>>>> view. That is until worker picks the packets for processing and decrements
>>>> virtio_vsock_sock::bytes_unsent down to 0.
>>>>
>>>> Note that such lingering is limited to transports that actually implement
>>>> vsock_transport::unsent_bytes() callback. This excludes Hyper-V and VMCI,
>>>> under which no lingering would be observed.
>>>>
>>>> The implementation does not adhere strictly to man page's interpretation of
>>>> SO_LINGER: shutdown() will not trigger the lingering. This follows AF_INET.
>>>>
>>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>>> ---
>>>> net/vmw_vsock/virtio_transport_common.c | 13 +++++++++++--
>>>> 1 file changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>>>> index 7f7de6d8809655fe522749fbbc9025df71f071bd..aeb7f3794f7cfc251dde878cb44fdcc54814c89c 100644
>>>> --- a/net/vmw_vsock/virtio_transport_common.c
>>>> +++ b/net/vmw_vsock/virtio_transport_common.c
>>>> @@ -1196,12 +1196,21 @@ static void virtio_transport_wait_close(struct sock *sk, long timeout)
>>>> {
>>>> 	if (timeout) {
>>>> 		DEFINE_WAIT_FUNC(wait, woken_wake_function);
>>>> +		ssize_t (*unsent)(struct vsock_sock *vsk);
>>>> +		struct vsock_sock *vsk = vsock_sk(sk);
>>>> +
>>>> +		/* Some transports (Hyper-V, VMCI) do not implement
>>>> +		 * unsent_bytes. For those, no lingering on close().
>>>> +		 */
>>>> +		unsent = vsk->transport->unsent_bytes;
>>>> +		if (!unsent)
>>>> +			return;
>>>
>>> IIUC if `unsent_bytes` is not implemented, virtio_transport_wait_close
>>> basically does nothing. My concern is that we are breaking the
>>> userspace due to a change in the behavior: Before this patch, with a
>>> vmci/hyper-v transport, this function would wait for SOCK_DONE to be
>>> set, but not anymore.
>>
>> Wait, we are in virtio_transport_common.c, why we are talking about
>> Hyper-V and VMCI?
>>
>> I asked to check `vsk->transport->unsent_bytes` in the v1, because this
>> code was part of af_vsock.c, but now we are back to virtio code, so I'm
>> confused...
>
>Might your confusion be because of similar names?

In v1 this code IIRC was in af_vsock.c, now you pushed back on virtio 
common code, so I still don't understand how 
virtio_transport_wait_close() can be called with vmci or hyper-v 
transports.

Can you provide an example?

>vsock_transport::unsent_bytes != virtio_vsock_sock::bytes_unsent
>
>I agree with Luigi, it is a breaking change for userspace depending on a
>non-standard behaviour. What's the protocol here; do it anyway, then see if
>anyone complains?
>
>As for Hyper-V and VMCI losing the "lingering", do we care? And if we do,
>take Hyper-V, is it possible to test any changes without access to
>proprietary host/hypervisor?
>

Again, how this code can be called when using vmci or hyper-v 
transports?

If we go back on v1 implementation, I can understand it, but with this 
version I really don't understand the scenario.

Stefano

