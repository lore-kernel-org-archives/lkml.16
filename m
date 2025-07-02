Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB0140E34
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751434956; cv=none; b=NatSOl3wPArl+Yqak8QENGDf8qmpjEpR+HQpq6WziB47N4cWykd2gQHW7az/K6Nohwv65whG4V3qmefu1bOnEOcniBkW9HORgf4ryW30lJMxT++EKo4UbRZ1pAbl7kyEWXovHgKbX3vxu/aafbS+azHeE05RUMrvjdcTHVbAMn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751434956; c=relaxed/simple;
	bh=S+zPo5ERTStSzH9D1C3v8My4jIfYm5tnWHrJvNIMhwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckZQBY3QRZ4yY7XVqQa2SSYYjOLyz1ckP3ZbVcZp/fi8yW03BpcgEDDyXSNwrwqDD77HZQlCdoSgKfIwJoqCTk7aKji6CuJCRBC/5LFPQKI+UVCOV+f+rFgDx3gz+JjIqFrPxQxl2l9iPmUnKMbFEeuJJKyrKU7IW4IBzmniPEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=qGy9YGZX; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="qGy9YGZX"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a43afb04a7so28466041cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1751434953; x=1752039753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S+zPo5ERTStSzH9D1C3v8My4jIfYm5tnWHrJvNIMhwU=;
        b=qGy9YGZXINSWPLzA2HADUEchXJ96N+b+mEM1ug5pTErWrDPRhnutDpibx5ubIuN49c
         iqYdldnKdhAcv2svT8pgw7Up9Z48hgcncyZhK5gQ6EmnhF2H27b2xg5rzNiymhRdiaOh
         tHSlw+6XCOtFSKrWGjU3c7A5rB9PBjfWB23vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751434953; x=1752039753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+zPo5ERTStSzH9D1C3v8My4jIfYm5tnWHrJvNIMhwU=;
        b=RVeUxIlORF9hyvECeG0PPF+VDbAdeD5+0aqB50kRwGnxHjcV7tbchAMhsxktltQdpw
         j5JX84pBkstx18gbc7RoSEinh+LrHjjJQ9wLhmwzFtHrKcXX/Z9t0QuSmXtP2F7ze2JE
         CJjYi0AMdH9DAXdhqHqiuHd7dKZOySZSHy1bv7KBHRbJoyS6BKQAYVuyaFv+DSRPRxSK
         9K0hLsNimS9mOh0vlKW2ggGaf6r9l1/q5C6XfUSL7Hq1GNMlxE7jUhyZOjYYVRiSA5le
         RUSU8fQzR8E7x9h+eUn46TGRRAkX72qd6gGPbBPIzHgHRlSwE0cQacwsbv3Gp/IcpEpI
         cUcA==
X-Forwarded-Encrypted: i=1; AJvYcCU84K0hugHrLgNjg70MbdswXU8z4/a+2ULlHrpa4ywsSqgtuH9RTDYrmlykpmxZmc5E5vIx5S+m58qorrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZjIjpxCFkt52QWkl+rLL5D1S6SiNUlo2kPGQgldosGXFlFYSI
	eru19tQUe3QvMq2k1hPMXdefGPs73DXqja2o+td3t5GUIVB86D88pPuRsnL9L3Eig+TqGm5Ji/I
	BjqGz1mhl+sIsIcKk516RM/M+MafRoKif91HdRUqRHA==
X-Gm-Gg: ASbGnct95yPDcktjqbJ/316ZYwgvredQzJCQk6R7XTXLqHTLMAp7bAtn4Bz2ZDoU9F7
	usJyGe29MUOcbXv6LUp0yFf0J6Sk9pA1RNKB7Z196J5p1JgkUI2ynBUEMYrlPV3JSXRsv4/+Vux
	hbz7jxtuVtDk+5b6GynyXtm6Mo/D8CQ1IceElX3aFRIU06JPgvzDFV4ayp2SF/wmlMGzKZfiS0D
	EST
X-Google-Smtp-Source: AGHT+IHIs1Nc8ZsOhKfJDquXC4dpDHews6mYsGdn6IsKTHmk+3HLxuHFUSsoGWU8khtMjUXM+53CCCsHY5/gWF+66IM=
X-Received: by 2002:a05:622a:1889:b0:4a7:6f1e:6fa7 with SMTP id
 d75a77b69052e-4a97690acf4mr30954751cf.19.1751434952762; Tue, 01 Jul 2025
 22:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615132039.2051-1-lirongqing@baidu.com>
In-Reply-To: <20250615132039.2051-1-lirongqing@baidu.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 2 Jul 2025 07:42:22 +0200
X-Gm-Features: Ac12FXzxs43CUldwYNNzjBZVxbrBptY9qCnaMpf-lB08P-9mnEL0MjBx8JxcZDc
Message-ID: <CAJfpegvBFDLDQCKTi-rY1zZWukQkn0nN7kU8QcXLs_QYZK5w8g@mail.gmail.com>
Subject: Re: [PATCH][v2] virtio_fs: Remove redundant spinlock in virtio_fs_request_complete()
To: lirongqing <lirongqing@baidu.com>
Cc: vgoyal@redhat.com, stefanha@redhat.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Jun 2025 at 15:22, lirongqing <lirongqing@baidu.com> wrote:
>
> From: Li RongQing <lirongqing@baidu.com>
>
> Since clear_bit is an atomic operation, the spinlock is redundant and
> can be removed, reducing lock contention is good for performance.
>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

Applied, thanks.

Miklos
