Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D032580EC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426093; cv=none; b=fxbTdpyj6ZnECoxhhzYVHwGZXXHKMe+LY9z6XRX9DP7TyS+lbbn8ehqFtlUl9KFlW8rdWufg4ExGOs+ebnZpA9WZ0ir/TQwZ8YTxYjbHQgIzqKnBFXm4U0SiQLid9yVCmQYbydBdvkI8uG8Qx9LnRQzQ1PJNMz2fSFByxHpOf3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426093; c=relaxed/simple;
	bh=bXXIovlNwDDSL/qXa0t+pqlwF7YhlNYF0hxtdu3MOBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bgwxm8QHoninLOj9oqlCWwC4Ah2VgsUa2eTwXr58C8RbMChLUeg2rFxuq9aKnw61zBL6quCwMvdWyQg/de2i7LDU7f/Gkz2vanHJ4M2vEPQKN8A8PSS94OJ/SKShgRheqRamRwDjPZB4HBTZOtdcZgp9if6QKgBjd11fqTmErIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LRWkJ1+j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LRWkJ1+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745426090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hX0ZWPxzqOkirz1sKOlbutSepxCMmH8RyV6IiHrCUKw=;
	b=LRWkJ1+jVDmko8Ecp4apyMQHCI9uaqGnZqQ0lzGwEMkPhGCljEwUKt2O3aNo0xkhKXptRY
	da+9dz7txjEtwIa89/KgHGp3enOeS146Qr4ix1tKbKJbxH6Gjs5kRCAoSt4Ono0QpI7AMV
	PwG+mI2RBZtICk00/96LofXjPbGWUM0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-TlJaKArRPv-MHPuguZuU_g-1; Wed, 23 Apr 2025 12:34:31 -0400
X-MC-Unique: TlJaKArRPv-MHPuguZuU_g-1
X-Mimecast-MFC-AGG-ID: TlJaKArRPv-MHPuguZuU_g_1745426070
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so5029785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426070; x=1746030870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX0ZWPxzqOkirz1sKOlbutSepxCMmH8RyV6IiHrCUKw=;
        b=UudmzWUByt++M5ODvGxJu0P+LViBFmQKBAoBLyLW6k2QDvq/wFXpCV0el3zMOVO/E7
         ybbs6KWFthYr0VSbCQYVaZFnMeSIC2w7uGbytuEl7eGockDYt9r21wDfYryokbHxTIoM
         rLTkxHN15657diiH94c3T9NzDwJGhYd0FZR8xc6J6W7bxBqyv2SvXZVi3/pkjyWiBLmp
         FX/b8OGsdARkqVt2arcGIGf/gHE+Ba8CnPqBzI2E6mUmfuyzGw98EEGH3S+PfCs6HJ2Y
         HTiF9xIKh3O2C0+Y/wUHItwrt5nSjjNjlsXOinvMRZ7NtW7ddqCCJlL0CLL8uEcwmO86
         G/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVJr/6ao6/SBvuqViVBocFR/dLhMUpEgMatSnq+A6Fr0B0etjV7Snap3el1+UlbPLkUBYBEHzi4ggsmS84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCD9UY3dHtbxCpyJQTeTd+o2k8MZbAXQIxlBt7bafRTARNhLy0
	iFU0w6ki4FJ4VsL1vasfKb8Sv1s9Itj3ItDo76gN3HCNmwki2DyhvYl7vLHi7EMPZrxRllpb8qc
	1CzGNEVsNqqe6+IbUtqhy4K6xYAEot2xEH6e6LvtJNBI3WJTGf/YxHSMv7XtOYg==
X-Gm-Gg: ASbGncseuJNcfZfx5Ef09MYiqeIHIahZ1VqX9FYbUwX7k8pT+NiZFMXAeS6LS4Qv65n
	dhGluIHKompH8lNSgITAnlRlGNf9AzMmfcajO8BbPLtS5RbGTqXbEXIDMg4tjk3DIg+DEO9eqjx
	ARrmQLQk56012NbFNSy7a4mO0cnm2OhfvPy30R42JsaBK407ZxkTHl/u1pEHiSnIXMGLztnKK7Z
	PoZxXB3I2Krprxn8ke0JYCNE0aN6ofvbEfXM6yzQpdSjA24XonI4sJeFemZ23F7Oqf2sbFX3jhY
	m6igezJ/hCSg7C4VFQ==
X-Received: by 2002:a05:620a:28d0:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7c927fa2b71mr3166543685a.29.1745426070336;
        Wed, 23 Apr 2025 09:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/i+wfr+aLg9YJcmFsbtb0FZaYC+Ua4737Sifb8T35B0q4/iqB5jGvO/7HQVtCV2sdLcI6OQ==
X-Received: by 2002:a05:620a:28d0:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7c927fa2b71mr3166538685a.29.1745426069796;
        Wed, 23 Apr 2025 09:34:29 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.206.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b69579sm700021485a.91.2025.04.23.09.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:34:29 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:34:18 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Luigi Leonardi <leonardi@redhat.com>, Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] vsock: Linger on unsent data
Message-ID: <k47d2h7dwn26eti2p6nv2fupuybabvbexwinvxv7jnfbn6o3ep@cqtbaqlqyfrq>
References: <20250421-vsock-linger-v2-0-fe9febd64668@rbox.co>
 <20250421-vsock-linger-v2-1-fe9febd64668@rbox.co>
 <km2nad6hkdi3ngtho2xexyhhosh4aq37scir2hgxkcfiwes2wd@5dyliiq7cpuh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <km2nad6hkdi3ngtho2xexyhhosh4aq37scir2hgxkcfiwes2wd@5dyliiq7cpuh>

On Wed, Apr 23, 2025 at 05:53:12PM +0200, Luigi Leonardi wrote:
>Hi Michal,
>
>On Mon, Apr 21, 2025 at 11:50:41PM +0200, Michal Luczaj wrote:
>>Currently vsock's lingering effectively boils down to waiting (or timing
>>out) until packets are consumed or dropped by the peer; be it by receiving
>>the data, closing or shutting down the connection.
>>
>>To align with the semantics described in the SO_LINGER section of man
>>socket(7) and to mimic AF_INET's behaviour more closely, change the logic
>>of a lingering close(): instead of waiting for all data to be handled,
>>block until data is considered sent from the vsock's transport point of
>>view. That is until worker picks the packets for processing and decrements
>>virtio_vsock_sock::bytes_unsent down to 0.
>>
>>Note that such lingering is limited to transports that actually implement
>>vsock_transport::unsent_bytes() callback. This excludes Hyper-V and VMCI,
>>under which no lingering would be observed.
>>
>>The implementation does not adhere strictly to man page's interpretation of
>>SO_LINGER: shutdown() will not trigger the lingering. This follows AF_INET.
>>
>>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>---
>>net/vmw_vsock/virtio_transport_common.c | 13 +++++++++++--
>>1 file changed, 11 insertions(+), 2 deletions(-)
>>
>>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>>index 7f7de6d8809655fe522749fbbc9025df71f071bd..aeb7f3794f7cfc251dde878cb44fdcc54814c89c 100644
>>--- a/net/vmw_vsock/virtio_transport_common.c
>>+++ b/net/vmw_vsock/virtio_transport_common.c
>>@@ -1196,12 +1196,21 @@ static void virtio_transport_wait_close(struct sock *sk, long timeout)
>>{
>>	if (timeout) {
>>		DEFINE_WAIT_FUNC(wait, woken_wake_function);
>>+		ssize_t (*unsent)(struct vsock_sock *vsk);
>>+		struct vsock_sock *vsk = vsock_sk(sk);
>>+
>>+		/* Some transports (Hyper-V, VMCI) do not implement
>>+		 * unsent_bytes. For those, no lingering on close().
>>+		 */
>>+		unsent = vsk->transport->unsent_bytes;
>>+		if (!unsent)
>>+			return;
>
>IIUC if `unsent_bytes` is not implemented, virtio_transport_wait_close 
>basically does nothing. My concern is that we are breaking the 
>userspace due to a change in the behavior: Before this patch, with a 
>vmci/hyper-v transport, this function would wait for SOCK_DONE to be 
>set, but not anymore.

Wait, we are in virtio_transport_common.c, why we are talking about 
Hyper-V and VMCI?

I asked to check `vsk->transport->unsent_bytes` in the v1, because this 
code was part of af_vsock.c, but now we are back to virtio code, so I'm 
confused...

Stefano

>
>>
>>		add_wait_queue(sk_sleep(sk), &wait);
>>
>>		do {
>>-			if (sk_wait_event(sk, &timeout,
>>-					  sock_flag(sk, SOCK_DONE), &wait))
>>+			if (sk_wait_event(sk, &timeout, unsent(vsk) == 0,
>>+					  &wait))
>>				break;
>>		} while (!signal_pending(current) && timeout);
>>
>>
>>-- 2.49.0
>>
>
>Thanks,
>Luigi
>

