Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F3B1E8338
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473728; cv=none; b=XjiD5s95K6JUnG6fZbpmtTX40XeTC0He9sULfhoq9SxlOlaHDGc+7qB//0rWOWdhNOPc9mKNampCx5jU7J8yv+Xyxae9LtMafGLOFq1yasT8mzF5dxtjMnuBlypN6RXPZpV1ACWE1t8s/sHBDjrPBN3+Dsw1Jwz4FhnldekNJAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473728; c=relaxed/simple;
	bh=3cOhVNRurGPxaeIw/7+m+PZy6wlwiza6W0eLxC4gdvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIIMkS//Q7piAokXu0YGuRc5KDjR+zmfXVqStV2Ry8KIuNWFJY50ZT2zT99ZterRDiJ5DPQ9ToUA150Igk7ZsjNmR733bLgFQJgbKx0MD0eop47Hn73zKlwUM1DFbEHraXBv3A2vr4wLu2BcII5ldjoRdtYYKziL8WfqxIJ2kIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D76RsSKi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D76RsSKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751473725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NG8jUsMOCdk8QP8hLYJJABR34rscESNoucVpKrlQhUA=;
	b=D76RsSKi5UdNhOK2u/eDpX6dsoV/IVUBGzETgyJdbx4ozIuT4txXQjVNz2Qec4PJEGyH+C
	J5Y8uByBNqVirQWD1SVM6SV8a/Na89mANZWRi90u3liRsCX9oAJkHUIoJJGn/dAFGsxF7O
	BfsFKjP3dA8JVe8JflPhjkqReyS0t6I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-34y3MGYmNseXUlJ09VUEFA-1; Wed, 02 Jul 2025 12:28:44 -0400
X-MC-Unique: 34y3MGYmNseXUlJ09VUEFA-1
X-Mimecast-MFC-AGG-ID: 34y3MGYmNseXUlJ09VUEFA_1751473723
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so1205059f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751473723; x=1752078523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG8jUsMOCdk8QP8hLYJJABR34rscESNoucVpKrlQhUA=;
        b=qfZ/Dh1bnZaiaLjWOnRd9rw1eXK8BPUUS4zh6FKLQdwMdV2qS/2PPYwBvvq1ddaTaK
         ymTIu52dTuaE8u6a4VtHNo5vZKyvsuQsJ/gQG1KE0P9WdzajZd2y5NzbAFahkx85pjFA
         YEx+LNnQLdnA3s6WZ1tx78lIipyycttfrxC2BEtq79DVOt57sbZKeaucsBsqEH9GfIRA
         lIHeesoavFA5uWVQ9+fc1PVUgrs2boUzrj3M+OPdAf9tCt7LLCSBKbGnux11GyshNEAB
         67Vac7te/gtP0lmlGvLMUdbYAb0y0zvikqrzi5IuR7SgZXCnvLskR6NwuwasgHboZt1X
         tpTw==
X-Gm-Message-State: AOJu0YzFWTyiULydmpyBecRZBpPjDlOcGk9ZEHxnOhV2jDMWE0NM2vBl
	bw1yPnPFpyG217qdwZJ0E1VGcvA4MQclaxftjqIn8dPb/ee+GMoIpYGMI7NekBo4yKXXbvGN540
	vNun1f6WEs5NmZwdX3QUKyOVQwJYeVmLqWKxWqvOWan+UI+g5NuZXoUU83rU8w3oYBg==
X-Gm-Gg: ASbGncvx4+C1EGgOFURDuVMXTIvjK881m5nWA3HlOR9WZjZQ9lCPT5ZulWQtydOD6fO
	80WvUjSAgniq7HY+mX3xJ4TVeijmxaMoCgvpEjtctylzvqid9oSMwGDOj7ONJyVlzt7SVF0/5+A
	sBm1A/OEckaypjhb2UdrceQqmt4wnwnB9r9M4sBdAWVy3btT12RaFTgqL9p/9VE1dfdR9jQr8Ef
	ARPy+9rtCSjuxiOr3Y/CbIoIZDn0HDvsifRvMOJq1sHgeSJetvBDryj4xy2qElKngvUHW7UEyYQ
	dX0rZOENjGZ0dnuR00WFjFkLATmb
X-Received: by 2002:a5d:5888:0:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3b1ff42f9b6mr2955393f8f.22.1751473722732;
        Wed, 02 Jul 2025 09:28:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH509kf9vFGj6z4R6xZfwGPmfKpg2fLP7ZQfSUt7IFbDwWC1CAH/5JCS3EUz2u2b0JuI21xGg==
X-Received: by 2002:a5d:5888:0:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3b1ff42f9b6mr2955367f8f.22.1751473722074;
        Wed, 02 Jul 2025 09:28:42 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.130.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c8esm16610161f8f.55.2025.07.02.09.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:28:41 -0700 (PDT)
Date: Wed, 2 Jul 2025 18:28:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 3/8] vsock/virtio: Move length check to callers of
 virtio_vsock_skb_rx_put()
Message-ID: <g3h6k6vqfxwqsvojptaqy63qsn2vwo7i45segjgwjgmotysmwr@dmgbwacytag7>
References: <20250701164507.14883-1-will@kernel.org>
 <20250701164507.14883-4-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250701164507.14883-4-will@kernel.org>

On Tue, Jul 01, 2025 at 05:45:02PM +0100, Will Deacon wrote:
>virtio_vsock_skb_rx_put() only calls skb_put() if the length in the
>packet header is not zero even though skb_put() handles this case
>gracefully.
>
>Remove the functionally redundant check from virtio_vsock_skb_rx_put()
>and, on the assumption that this is a worthwhile optimisation for
>handling credit messages, augment the existing length checks in
>virtio_transport_rx_work() to elide the call for zero-length payloads.
>Note that the vhost code already has similar logic in
>vhost_vsock_alloc_skb().
>
>Signed-off-by: Will Deacon <will@kernel.org>
>---
> include/linux/virtio_vsock.h     | 4 +---
> net/vmw_vsock/virtio_transport.c | 4 +++-
> 2 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index 36fb3edfa403..eb6980aa19fd 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -52,9 +52,7 @@ static inline void virtio_vsock_skb_rx_put(struct sk_buff *skb)
> 	u32 len;
>
> 	len = le32_to_cpu(virtio_vsock_hdr(skb)->len);
>-
>-	if (len > 0)
>-		skb_put(skb, len);
>+	skb_put(skb, len);

Since the caller is supposed to check the len, can we just pass it as 
parameter?

So we can avoid the `le32_to_cpu(virtio_vsock_hdr(skb)->len)` here.

Thanks,
Stefano

> }
>
> static inline struct sk_buff *virtio_vsock_alloc_skb(unsigned int size, gfp_t mask)
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index bd2c6aaa1a93..488e6ddc6ffa 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -656,7 +656,9 @@ static void virtio_transport_rx_work(struct work_struct *work)
> 				continue;
> 			}
>
>-			virtio_vsock_skb_rx_put(skb);
>+			if (payload_len)
>+				virtio_vsock_skb_rx_put(skb);
>+
> 			virtio_transport_deliver_tap_pkt(skb);
> 			virtio_transport_recv_pkt(&virtio_transport, skb);
> 		}
>-- 
>2.50.0.727.gbf7dc18ff4-goog
>

