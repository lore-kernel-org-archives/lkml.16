Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E80C1EA7CB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708771; cv=none; b=UoBCRjs5Qaelribd7Ec8P52Rm5X0+m/GWVE/hjSexSEsQeqf1mqDc+78rKlEjpg8zCdWiQ3uTUc86rtfScwHkBPh9lm0NeGjBe2IRRtWhqUQ7wC4hHwHIxCcpSbxD9G2I6SqeyHlczN/bBg+9yN7EByEPHRKETeEzZXxaq7aKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708771; c=relaxed/simple;
	bh=MlbQ50o4f6u5pnc00CzQIFi2h3qEcGsw79ewAeB7PF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5Gz52h514clhtK2XtzwsQfCrrqpMs6CZhC/9ECc+2eygZkCrhAQGo0jny8Rjzh1VCvzN9AQfOK80e/I2Zg2t2v5i2Ufmpbd5ojgRmBwpk0wOG/n9/yFd09dFPfjIifdrxxYJuTV4XaBhIm1Obfpe030dEuaV05IGcH4T7FtI4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J/95/Ewh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J/95/Ewh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749708767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlbQ50o4f6u5pnc00CzQIFi2h3qEcGsw79ewAeB7PF4=;
	b=J/95/EwhiL+P2u8H9kPZuyeGIOSaSm5sURzrVHy1y3weWCQJATCYmtlu/vSKkGi2/ci7/4
	eN85wfRXHzBoA+MroNUhAatTw9GyN7NuO27rFRioUA44KYRYiLE6KLsDLNeFAwPCE6ybmI
	TUA50B/pWhwUXffTMAkLEHrrCuw00C4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-SZfnJe2uOQG4F4rzdLMP6Q-1; Thu, 12 Jun 2025 02:12:46 -0400
X-MC-Unique: SZfnJe2uOQG4F4rzdLMP6Q-1
X-Mimecast-MFC-AGG-ID: SZfnJe2uOQG4F4rzdLMP6Q_1749708765
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311b6d25278so700983a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749708765; x=1750313565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlbQ50o4f6u5pnc00CzQIFi2h3qEcGsw79ewAeB7PF4=;
        b=IycgD02i/w0NXjK6i/j3n/f1U9h8ZZrxmql6b8awPtz9tFjgVSigjauTge/DCknNmU
         yS1kAP0NS0WAfURm0N9gUCn8ASWdur+tEJTsBvtcgHN+kSKy1ucdJc2wHZcMAuC9yxwh
         vQl/Zv4IVHk7bKMDf3f3yxlj/l4ns+yqg1+QOFcEKV12sKlXu6su6Bu4ZejSikx8kzXv
         4aQdk84T1+RqrKTiySeI69jSX7ZqUIZkX72OLC0R9awO1/5T4aojbGAqpPF416oSJxpc
         r8Z+x9ysow1kORGhQoXR9Yre6EyBT41dab7tAKLZFaADDYamwCPgSNNswuBSHWHwu2nX
         2LKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLX4DVMnewx9JE0WeUZYkwrpKCg+wBuVNu4GS4a/VymBbLnjwN1yuZY1IojDRu9ylOuSbJrGM/dDm+hTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEF4VBs8UYFexvgOOu8nygCwbTkzQUSB0fbANHX6SzOLeTgFiD
	+VxhkF6Niy3nIXX24ox9FZl/f9iBgR+VibnT1VVMBxFtZMQIAXbSwQ7COeYS0q3j3wHh0yraCJ0
	0YrgCW97Tkyc4nx2EiBagMbxDEF9y4BW/cewB2ZDWzMHLv16yn/2WZO7qbKV4Y/B4AsULapmG6O
	sAjp1L9Fjf+rBdkXRXhExio4xZUVYDkavljP2hMXju
X-Gm-Gg: ASbGncu1SVWgEx7g5cGl1PLceEc74vc/N4Hfb/fLbHz2qGfKpTiLWHsZVCgoAMsavdg
	VE5n2verfXKjoKtH2R+oEZD2FYEUQ6w4juSFXCPlXXOBfQpg5asg60087FOzF0QfsyHB4+L/vj9
	K/XPp9
X-Received: by 2002:a17:90b:5628:b0:311:e4ff:1810 with SMTP id 98e67ed59e1d1-313c0668326mr2584704a91.3.1749708765327;
        Wed, 11 Jun 2025 23:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8nEsPFjSfYppZCrGBwOZj2EXvMsBbci1aiHbuZSbde5qDOX/uaEqUZ1HZNfewkqJpsnTzU7HSRHu/P9/nbYo=
X-Received: by 2002:a17:90b:5628:b0:311:e4ff:1810 with SMTP id
 98e67ed59e1d1-313c0668326mr2584680a91.3.1749708764934; Wed, 11 Jun 2025
 23:12:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609073430.442159-1-lulu@redhat.com> <20250609073430.442159-2-lulu@redhat.com>
In-Reply-To: <20250609073430.442159-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 12 Jun 2025 14:12:31 +0800
X-Gm-Features: AX0GCFua3qf1tKF-j83aW6duXknVJEBpOabQNRyFghC9nw8Dh5yPS6CPiPjCd68
Message-ID: <CACGkMEskts7y7bCxRLoZvDbg0YZbdF59b3Jzxkgpg0KCCY+TiA@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] vhost: Add a new parameter in vhost_dev to allow
 user select kthread
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 3:34=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
>
> The vhost now uses vhost_task and workers as a child of the owner thread.
> While this aligns with containerization principles, it confuses some
> legacy userspace applications, therefore, we are reintroducing kthread
> API support.
>
> Introduce a new parameter to enable users to choose between kthread and
> task mode.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

