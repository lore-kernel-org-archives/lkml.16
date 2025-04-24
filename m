Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D87122F775
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496675; cv=none; b=EQ0znhbUY4Stf8ZhIu7nCN3VrHwP5fHBkgE3QJWOWonjJDBH5OK8PkTdoKhoB597VjJFr1Rph8MrPYEHzE6H0xPuwkArtIXVob+/YtkCs7XcGM8vJ6XJPvwx48oFpGAIMeljVyCgsmyHL4h2ZMxvSIE5ft6ENrrm5KkbA7ibKyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496675; c=relaxed/simple;
	bh=bz4+/X497RFI15mRxsIqRhNBIwSZjCmNalMcue3pcXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Em8RwWAJBtDOeUC6Xb+Os4n2w6pr0fW6xZ3WEZh21fFlcjMveP7Qh+Vtp3LFHpNVjVmxH+6EZpavFZ0pZ/+uuxzZ/j7HzZJ11eMH0J0HZQcplwNRpSrbdvccq07qgoC5yKnhi7iTQ6GH97YCdUyokjK9kwAXfAWlwqnHDhj12S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dECc4yBA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dECc4yBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745496671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J+iBi7KEPHVPdl78TuinUFRyNTsFrvN4I3oDOUPKzwc=;
	b=dECc4yBAK2Q3Ny4QcaGaquISrQBsBZB6BvVlYm5MGNH4M7Ki/RZQ39avYm09k7Y1gGNlkI
	qAqnLyivqOgqAiDW+ooUlap4M46db4RpRjEt9bQbyAOgZHkij8Jdd8O9sJwH0LInA8PHDr
	0fC8+3kx+Vtx3W4D5Ip3AbtHxGgujPI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-bIBYUiSaNsCk1AV9ww0WGg-1; Thu, 24 Apr 2025 08:11:09 -0400
X-MC-Unique: bIBYUiSaNsCk1AV9ww0WGg-1
X-Mimecast-MFC-AGG-ID: bIBYUiSaNsCk1AV9ww0WGg_1745496668
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-44059976a1fso3526635e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496668; x=1746101468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+iBi7KEPHVPdl78TuinUFRyNTsFrvN4I3oDOUPKzwc=;
        b=fG+FTtfpX5ubGr55FeIewaVPiWQVl3yNGE7a2H11bwWCySLBVET2TBoO7p5CPnnJ9V
         bKju6q/2uOpKCn3Z/jH+m/eI9qq1v8QIfE4sfpcFpCpVfb6JT2/AF3Xz7skr5uNCUcxt
         Bh3jL/A8WKZCDQrHnlE/OZfaHGiHcUf1vKyFQwsBvJy+WtlFpy19W4kyPgV7G7IDxDh6
         3q1ebQb5WapZZJPuUMghM+K33zK6JDgiIHLd/UAnv5N38NQacj4kptLwx9wj48RzyMPq
         h30MaZ0IwZaJF/Sj4WdkilQvzc4l+8R5PvfpLRoA0dZDwAOme2A2eCwhvQcsL4J7hEKj
         ZAWw==
X-Forwarded-Encrypted: i=1; AJvYcCW+zUdCuNBFp6V1MLm9pEELLngyfRORZ0UJKaYakEMX6MNAw4nIZHu49ojWsyj6/AWIqRbM2SsxOQFZIl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cfBQJIfnHCV9wjsGn8T5oQa2LJ3N1nc6xaww5kgdRhOuhUgK
	uR4rFBjsQRV6lf+fRMRnmhwzGX9CqjTu1mQCRpG/6yjuQ6XHCaECQBGdXR5I7NBZlHqMW7xfohQ
	/4vVvqAoVzuIQ4UIXU+13bJGdVhG0WZPuEMbFsETh8fRC1+ymWX387O49sqXcqg==
X-Gm-Gg: ASbGncsxqehHP/w/3Z0LUIE14iSykcY/8fpDDYppxrxSKgoB9IvJryY9La9+EXDbolJ
	yCG2AemdI5fUEnPaZZvNlCBP1Pq5QcFwVVA/Sj05hYPTZfg5i9a0C8R4DIb7Z3vPGWVbU8CSprW
	6yojAJEh5lL0IbTP2AMp/7I+JdWGGawi5EoxcRpfHkPxM8zGnJZ9tpRT2NSSe1PKvXHFGognFyJ
	nlpsifzty+xRUGOSXINAEm/ywCE1uHXR2RsGD8m/bekjvpL/z/HSlx8hEqE2Ux0lqj0cAALIbTm
	fa9ImA==
X-Received: by 2002:a05:600c:1395:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-4409bd17dfdmr21734075e9.8.1745496668280;
        Thu, 24 Apr 2025 05:11:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9n0roJbpJf5HRR05saKucJsNpfjrLxCLOXtUJbPRGicV0Zxwyv2cOdsaG6FPN2tpgup02FQ==
X-Received: by 2002:a05:600c:1395:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-4409bd17dfdmr21733875e9.8.1745496667950;
        Thu, 24 Apr 2025 05:11:07 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2b77f9sm18718025e9.25.2025.04.24.05.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:11:07 -0700 (PDT)
Date: Thu, 24 Apr 2025 08:11:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jon Kohler <jon@nutanix.com>, Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] vhost/net: Defer TX queue re-enable until
 after sendmsg
Message-ID: <20250424080749-mutt-send-email-mst@kernel.org>
References: <20250420010518.2842335-1-jon@nutanix.com>
 <a0894275-6b23-4cff-9e36-a635f776c403@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0894275-6b23-4cff-9e36-a635f776c403@redhat.com>

On Thu, Apr 24, 2025 at 01:48:53PM +0200, Paolo Abeni wrote:
> On 4/20/25 3:05 AM, Jon Kohler wrote:
> > diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> > index b9b9e9d40951..9b04025eea66 100644
> > --- a/drivers/vhost/net.c
> > +++ b/drivers/vhost/net.c
> > @@ -769,13 +769,17 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
> >  			break;
> >  		/* Nothing new?  Wait for eventfd to tell us they refilled. */
> >  		if (head == vq->num) {
> > +			/* If interrupted while doing busy polling, requeue
> > +			 * the handler to be fair handle_rx as well as other
> > +			 * tasks waiting on cpu
> > +			 */
> >  			if (unlikely(busyloop_intr)) {
> >  				vhost_poll_queue(&vq->poll);
> > -			} else if (unlikely(vhost_enable_notify(&net->dev,
> > -								vq))) {
> > -				vhost_disable_notify(&net->dev, vq);
> > -				continue;
> >  			}
> > +			/* Kicks are disabled at this point, break loop and
> > +			 * process any remaining batched packets. Queue will
> > +			 * be re-enabled afterwards.
> > +			 */
> >  			break;
> >  		}
> 
> It's not clear to me why the zerocopy path does not need a similar change.

It can have one, it's just that Jon has a separate patch to drop
it completely. A commit log comment mentioning this would be a good
idea, yes.

> > @@ -825,7 +829,14 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
> >  		++nvq->done_idx;
> >  	} while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
> >  
> > +	/* Kicks are still disabled, dispatch any remaining batched msgs. */
> >  	vhost_tx_batch(net, nvq, sock, &msg);
> > +
> > +	/* All of our work has been completed; however, before leaving the
> > +	 * TX handler, do one last check for work, and requeue handler if
> > +	 * necessary. If there is no work, queue will be reenabled.
> > +	 */
> > +	vhost_net_busy_poll_try_queue(net, vq);
> 
> This will call vhost_poll_queue() regardless of the 'busyloop_intr' flag
> value, while AFAICS prior to this patch vhost_poll_queue() is only
> performed with busyloop_intr == true. Why don't we need to take care of
> such flag here?

Hmm I agree this is worth trying, a free if possibly small performance
gain, why not. Jon want to try?


> @Michael: I assume you prefer that this patch will go through the
> net-next tree, right?
> 
> Thanks,
> 
> Paolo

I don't mind and this seems to be what Jon wants.
I could queue it too, but extra review  it gets in the net tree is good.

-- 
MST

