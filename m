Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2801DDC33
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204636; cv=none; b=WeVrKCeoQz0oPGdBgoqGgXc7CQxBw9WShEMLUFziJTy0y/oLGMNvnEXI3TE7WJjzfe92y2GUJLQMHC2hYV4z78O3UhBEHGdm5JwFLYFnRr7agzvHdNcZ941HBZHdDBcHrIhrYAnZOcVE3kXrPTuk3XqSTBfIzpGGVTuVTQaD9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204636; c=relaxed/simple;
	bh=Qr8aYaNg+4LPUFYtFSiJL8vs/bYQwNhv1687v1mNwC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8NhpDuTimCslMPJjS+bIaXEGP1te76PQod40w+SoM9UEplMww4iBgj70dDaJtQ+T5SPD79PM7mtbfQu1Px+YAj5AqCq0Ogb/NvWZHR3jsbaS8Hdq8tOlu1BPa8ZL/nIK4nYpbY7JK0hUweF2b8nlmw50Ar1bOQXJ8SlJkrEGIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RwUxuK4h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RwUxuK4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745204634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLXDtRgA6ayDeCz1Y6vWEq0hT6V9yJ+AfUHP97mEHh4=;
	b=RwUxuK4hO3q11StluSzGTdt4eZPi8wAAtYWR1KW7jlDQHhgn/JqxzMS4O3XF1s4kBPXaJK
	QuCfbipW2xzk7xj5Bk/zdvWl8C6VvZ5wZoCbKeaZ7UpeulPGj38hKPTJBtxo40xxVFIhXd
	ikt34FCaey9RCJsI6uVenaZM6Ep3Hqk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-Mk5EwqvyMsu16LaonszA1A-1; Sun, 20 Apr 2025 23:03:52 -0400
X-MC-Unique: Mk5EwqvyMsu16LaonszA1A-1
X-Mimecast-MFC-AGG-ID: Mk5EwqvyMsu16LaonszA1A_1745204632
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso4956053a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 20:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745204632; x=1745809432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLXDtRgA6ayDeCz1Y6vWEq0hT6V9yJ+AfUHP97mEHh4=;
        b=L0hX5mfynyxRM/+tfOZ9FKQcOaJ4aldKuhjovUMiIWCWbH4CtUgOMNqeVuVA/nZA+H
         I06KAQgIAE6JXrhmoaCoXjtqbauy18SBVhO04eNZkPCqb05z4xSYwartQ+Gfv2JqaRak
         vcKrunl0zuk9+QsA+YxB5i7pcv/chGUd5s6i2DbY2sdm8RS+NuzAkZJTMiwITS2hcQ/I
         1GSFqQ2wI49sm4wJrHz/V6bWya0ov+pa8QBRle5X9WBKG16YCG1nIulCf81goOUdQ9Lh
         f7a2O8GNAWCwsPD2bg6abOLcHT9MDCGh2JPKnxFPr/N119LekP3JdKB3dqr+w90j2iqe
         Zewg==
X-Forwarded-Encrypted: i=1; AJvYcCWeaERsuzBEtHq428NegSzSdXzTw1ztZR9RBpeNmfkeW+lW1LJNCWflMLKwhGEabF7gzThdbcFA70GLg88=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmwzdonr+XfVYYzct4juCpv6uD/2k9TMuNbFK1n/O5XZ/h74e
	eExcqP1P7rw/JjitebEGbIBU/5J/WJ2S+Tj0SMVCmbJd3Cpd7NZ1P+X4UPEXTL7sPCBK5icOjKq
	94MPRnFZ4YzOnrTFIIMqtf9v9f/c09lx/yNhP9zvtHsJ3s5yAAmJKZ8W84PpwMtoGu1V7ugXsJ1
	buRvzVo+4tumJ7FcuOfOXdPgWcv+SF5730oDzB
X-Gm-Gg: ASbGncsU6Fr8Ok/JD4pro7fk/dMMRFVUyUC5PnmZ17Jfg5yts1wK0APywmRC/3AFsAL
	crjkjfFPCX/eUDSjPnZrY1wsbh6vTOWTUvXR3sJ6FW6RE7stohshgYdUkJR8lk/ERZebzfw==
X-Received: by 2002:a17:90b:4b89:b0:308:65d4:9dda with SMTP id 98e67ed59e1d1-3087bb6e794mr16806370a91.16.1745204631873;
        Sun, 20 Apr 2025 20:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZtnoZd7x/9jpKNzZ+LTBMBCaS6scxdcgAj8rPFvVSJbcKlGfoHCLn1pYbSk8Af1Y6oKwZSBu3haMJ+dnfOJM=
X-Received: by 2002:a17:90b:4b89:b0:308:65d4:9dda with SMTP id
 98e67ed59e1d1-3087bb6e794mr16806325a91.16.1745204631397; Sun, 20 Apr 2025
 20:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417072806.18660-1-minhquangbui99@gmail.com> <20250417072806.18660-2-minhquangbui99@gmail.com>
In-Reply-To: <20250417072806.18660-2-minhquangbui99@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Apr 2025 11:03:38 +0800
X-Gm-Features: ATxdqUGyEA9DUKHVB0iflKLulL2Ewuk2b0N8F7M-x7RCvH29fTxDE_M5T6xkicU
Message-ID: <CACGkMEt5=r_JbfHeU=dpk20F5uE6TJouTPdKUUScYtQGfAw1tg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] virtio-net: disable delayed refill when pausing rx
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: virtualization@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 3:29=E2=80=AFPM Bui Quang Minh <minhquangbui99@gmai=
l.com> wrote:
>
> When pausing rx (e.g. set up xdp, xsk pool, rx resize), we call
> napi_disable() on the receive queue's napi. In delayed refill_work, it
> also calls napi_disable() on the receive queue's napi.  When
> napi_disable() is called on an already disabled napi, it will sleep in
> napi_disable_locked while still holding the netdev_lock. As a result,
> later napi_enable gets stuck too as it cannot acquire the netdev_lock.
> This leads to refill_work and the pause-then-resume tx are stuck
> altogether.
>
> This scenario can be reproducible by binding a XDP socket to virtio-net
> interface without setting up the fill ring. As a result, try_fill_recv
> will fail until the fill ring is set up and refill_work is scheduled.
>
> This commit adds virtnet_rx_(pause/resume)_all helpers and fixes up the
> virtnet_rx_resume to disable future and cancel all inflights delayed
> refill_work before calling napi_disable() to pause the rx.
>
> Fixes: 413f0271f396 ("net: protect NAPI enablement with netdev_lock()")
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>

Acked-by: Jason Wang <jasowang@redhat.com>

(In the future, we may consider switch to per virtqueue refill work instead=
)

Thanks

