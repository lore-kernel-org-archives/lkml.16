Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2E025A2AB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859545; cv=none; b=hFt6v9VcMcj6j8mHLNiA4gmUx9s4fZMeQjE0l2Q6R+pbUcyCHfE9Qqa7I7KDzsY0mjKCrvgYOXHegtJUsmIGFc9eXbmXOzG3mHrARxEz55dRibS7zV137cluDJhyrMmyqiYBGj/IfD+XYzn2PLS1V2h4/ww0XAp9i3vYPx0CtIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859545; c=relaxed/simple;
	bh=cToKybjXtrPshKXsvriTLIFQT34mAn7DrvDWsf8sYmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTo9wqUm/ahLvGljUhTmPNwa3l9RGY5V3geL/4w2zZWscwYaDcmQ/TZ6AY7Gp9uPpF7JOZVWu0BStmN+9bHETMvMj6vwjF3034NHIz3qnW90jcYNWd1qgaD6GBdRRqRByMGZbHdwnzwV3jfp3zCERYMc4rjn2lpixsNBQY4Fscg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wq34deWO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wq34deWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751859542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cToKybjXtrPshKXsvriTLIFQT34mAn7DrvDWsf8sYmc=;
	b=Wq34deWOQQnk2ADZbXONJ98XWMfuNtblbE2a64RMdADsnpuCozK8we+Y10b/B0Z5x+H325
	RMZRCH9znH4j3PSZa7aZx9DzUxpo9GBlF+KczPuEUPXmbEv9PC1f5DyqLuAgPHNQ4GTDp9
	NA1PtoOtYcUJdBWIKlCam5ogPSC+/Qo=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-4ksmKNH2NF2FWcoq_oqQDw-1; Sun, 06 Jul 2025 23:38:59 -0400
X-MC-Unique: 4ksmKNH2NF2FWcoq_oqQDw-1
X-Mimecast-MFC-AGG-ID: 4ksmKNH2NF2FWcoq_oqQDw_1751859539
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b38fdc93c22so501476a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751859539; x=1752464339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cToKybjXtrPshKXsvriTLIFQT34mAn7DrvDWsf8sYmc=;
        b=TCM8l1WkpQC9vKrU0wKS3FH1Bwz+srlgQj7G8cqnFKGGVF2CWkYBRAFktDhG9wNq6i
         CQ0JOJ0o7Mjj84SSj7A+5f/7eyjKIzwiHkl7w9gIHphogBbujZH5nwycPr/9kbjS6XzK
         x0/yQ+Wf0+c84mL5m0qN+xxKYJWm2z005xrqb+9w0DlUkmwBcCuR4ZZFoKuMqdKJ2xBU
         UokoUwEcBLCWF+NnNhBXMI7FcSfEfTUB5G+ZHVHjMR8CKsnOTRv7IRM6JT3FxF3HYfFg
         QTo+Nyv5pSnrG9Qx4OwzI2SkyyhiAEGtagSm+yTo5w5Jk+Dw/1O1mnkObu+4KM0rMMDs
         Rscg==
X-Forwarded-Encrypted: i=1; AJvYcCWXtTJEoX3CgUNZLGVMMlH9cvaek9MvYDJDH0T8c+gRPFmLhFqpWd1YErMxqcfZcN2zOI9h8m2GLGkkZ8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2rl+heKamONcmqNrscMrAV0n/jLJ1m9F/SCjfRYIN3x+4Z5+q
	7xo3AcnIb3aVrvNqEZJiSHQ0JiLoEHolBoHYIWaECjm6Y6g31CTV2+4DrCVyAMUwwrltubl3til
	sDxfk5jbOYi4FfHp+DLE/lK676+tdFS5NQpw3o9eB9mHwKf7uMwJVaOw2fegf9MoD7YteZX6S8G
	4LhqcSNlWchDyTy1ylThEE0g4z7C4BO3sZZ4rZtVxN
X-Gm-Gg: ASbGnctfkPp53QBHb4r/hQQzAiK+XUmwem8f5O5TxQH03G2jQpn74xAXNMbW9vya7Lg
	l2quJSjjlteNDCIyvGZyhxWz4e0sVGJxlNNIoD8xOIET5fftXUx8uwwmUx1vhsGVLbeouHt2yyH
	ZeTH8R
X-Received: by 2002:a17:90b:55cb:b0:31c:15da:2175 with SMTP id 98e67ed59e1d1-31c15da23cemr1276679a91.9.1751859538657;
        Sun, 06 Jul 2025 20:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/OScOfzxvN6ffL+e+JM/H+J3/JdD4csUZUpOcHgC06UuyYVCjZh3kPiyRl4cX84Tq+BwKAeQqS9ePIWOt/tw=
X-Received: by 2002:a17:90b:55cb:b0:31c:15da:2175 with SMTP id
 98e67ed59e1d1-31c15da23cemr1276643a91.9.1751859538244; Sun, 06 Jul 2025
 20:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702014139.721-1-liming.wu@jaguarmicro.com>
In-Reply-To: <20250702014139.721-1-liming.wu@jaguarmicro.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Jul 2025 11:38:46 +0800
X-Gm-Features: Ac12FXzRSQJDauDNVYKvCZUnjp7a1__tIs86dizLjOKq_h5WbWMweaIbaRJmiis
Message-ID: <CACGkMEuxSsJVkvNnGGZtrK=MOyzc1ajW+SNR-xP_XzO5=R25jA@mail.gmail.com>
Subject: Re: [PATCH] virtio_net: simplify tx queue wake condition check
To: liming.wu@jaguarmicro.com
Cc: "Michael S . Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 9:41=E2=80=AFAM <liming.wu@jaguarmicro.com> wrote:
>
> From: Liming Wu <liming.wu@jaguarmicro.com>
>
> Consolidate the two nested if conditions for checking tx queue wake
> conditions into a single combined condition. This improves code
> readability without changing functionality. And move netif_tx_wake_queue
> into if condition to reduce unnecessary checks for queue stops.
>
> Signed-off-by: Liming Wu <liming.wu@jaguarmicro.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

