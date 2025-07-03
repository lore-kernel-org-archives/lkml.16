Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9204246BB9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535101; cv=none; b=jVb32tspz+Iu77EB3J0ux0uN1G41mcM/LOMnn/xI4yx6ErJlcaVwGvZ/LFR5mwLv5O/1dP4pJjwmgmsvheDD6ZtX3SQP6xkFFRHoULCLeUtwTkNgZgd2/gK7w2GJsqnKu52QGGmgjjHcwRPYm/7BDMByrD5GTim0Mfk7OdgIb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535101; c=relaxed/simple;
	bh=PVDBSjyULPbs5x3zIrE5o9Rl0g38caEh9UMxzPrn+Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2IhMejQSv/6qCGBppKTI+NpCxgX21MLfHTQjIXj4zt1PRO1mW2gP5Cv/YErDhCZ10cwzYT+lIPy06d/VvWVshbxqyIvb8kjz0BspbX5Se+0iqqAyIt8vsyeCqAdlGX0Sk7EAiqdk63ynMEi+2RvhgHdHcJdJKrGwOP0qOotKSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kb5dMga7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kb5dMga7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751535098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kiM34ne3qqgNc/PC2+T8kkcXMp5a3XxcjcM9ongF81s=;
	b=Kb5dMga7m+vgexq2Sv+XAhst7C/Qear+LSSp6WnDo/EGKNquNXHpUng4GdTB4zydDu0eKw
	Nfohh4ztGbG92dAy+vCbblKyINtf7e2AF72B3eWhlxdAEhDxEiMQhhygdQxcNGtXWWeqzo
	6NAe8i3mLQZ5GiTCjcn/X1w4R23kd1A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-uazNomkLOG2V3y9X4hveFA-1; Thu, 03 Jul 2025 05:31:37 -0400
X-MC-Unique: uazNomkLOG2V3y9X4hveFA-1
X-Mimecast-MFC-AGG-ID: uazNomkLOG2V3y9X4hveFA_1751535096
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4532ff43376so48238145e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535096; x=1752139896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiM34ne3qqgNc/PC2+T8kkcXMp5a3XxcjcM9ongF81s=;
        b=SZmLoS1Jr7oLGzqfdVXz1O+JOEcxkzrwPEHvhcv5wiifUfuG9VsepnYyeUSXHT0p0r
         NZUzoZokWLIEruZM/MLPaRI5w151GTGDdi3iDC1DpmPr4n+rRRy60qZDRqE/wG5YiEFa
         o0fVZaX8ANkDjNz9XjjtPp0CCqCK2DD3hy5y2OaD0nqLXmhreEcNoYC0aw7f3CfAfiM2
         HkzJlM2kEJDaGOGway+DLwW+AFqVTily4tdwho04C1kcilLMbjMTRozpXX1H4V9uTiaV
         wt0XGpPJF2nYkRSs4UzEpBWG2iE+ZKRKGeKRCbZW6JfsOg5W71uKXXVdei1ExmyZ8iW/
         z8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCU9rAFUz1jzSp+WItbNstKAWbq+o39pcpciQOqAPQleMMZZFWQDhNb+UOGxdIp7chkBIVz1rx256Tx4IlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7ZhnLGuQVu5ECYrcBBqvfCoWW1sB9M0bEsWOPkoiby8R/pVT
	FL90hNGWdtnzHtIblk2569VLHI9R7mXae78xr5y/wFtLMqjCha+xgiOHJFzLl3WT6kcCw09+Tvy
	PMJXTFDg/vWLUsWWq+XO7K4sb7DXctA0nR52LkqCHcJ0wPx/UmWeW0Pm/V78omTCDNA==
X-Gm-Gg: ASbGncsMTgDWpFUwpEo/OOKToT0KnKYQ3DqisqKnUWCnB5xQU4KkcjqWUha9cfjaZOJ
	Wt3Zt5QWZBQNZCuEg+YzgiEqcWNyU9K8lPJ02so7GOgpBTDn9RRmp6HLKj0n3VMjECdbNOTENXi
	ctGf7C9DFwSQ2QPDyDGuB4fj996RkIo6QvlXAt6qfpbvVH+lYgSq6CHh7qbHCHneCCYN8pqj53n
	PJBJCdQQRFF8mhbJOGIg7TG4pObOtY7Cke5a+H+sziIVlkNvpjxmOZ4dmYBNZNCoTZi90J3Jdlg
	BIWpKzqc1HsEJnil
X-Received: by 2002:a05:600c:3b07:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-454a3704fd2mr58221235e9.19.1751535095944;
        Thu, 03 Jul 2025 02:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMIuf6yUQDcBc0LWWmzv/B2M8HuBjvXyhM6QvDp7XQF9yZebMii/qbfs/UzrXjc5q42VPkzg==
X-Received: by 2002:a05:600c:3b07:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-454a3704fd2mr58220935e9.19.1751535095479;
        Thu, 03 Jul 2025 02:31:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9be0bacsm20751665e9.32.2025.07.03.02.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:31:35 -0700 (PDT)
Date: Thu, 3 Jul 2025 05:31:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, netdev@vger.kernel.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error
 reporting
Message-ID: <20250703053042-mutt-send-email-mst@kernel.org>
References: <20250521092236.661410-1-lvivier@redhat.com>
 <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>

On Wed, May 28, 2025 at 08:24:32AM +0200, Paolo Abeni wrote:
> On 5/21/25 11:22 AM, Laurent Vivier wrote:
> > This patch series contains two fixes and a cleanup for the virtio subsystem.
> > 
> > The first patch fixes an error reporting bug in virtio_ring's
> > virtqueue_resize() function. Previously, errors from internal resize
> > helpers could be masked if the subsequent re-enabling of the virtqueue
> > succeeded. This patch restores the correct error propagation, ensuring that
> > callers of virtqueue_resize() are properly informed of underlying resize
> > failures.
> > 
> > The second patch does a cleanup of the use of '2+MAX_SKB_FRAGS'
> > 
> > The third patch addresses a reliability issue in virtio_net where the TX
> > ring size could be configured too small, potentially leading to
> > persistently stopped queues and degraded performance. It enforces a
> > minimum TX ring size to ensure there's always enough space for at least one
> > maximally-fragmented packet plus an additional slot.
> 
> @Michael: it's not clear to me if you prefer take this series via your
> tree or if it should go via net. Please LMK, thanks!
> 
> Paolo

I take it back: given I am still not fully operational, I'd like it
to be merged through net please. Does it have to be resubmitted for
this?

Acked-by: Michael S. Tsirkin <mst@redhat.com>

-- 
MST

