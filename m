Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB30318A959
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208308; cv=none; b=k+CuYZRRT0ZYSR0yNqVf4j2Pm+KsTVvstjnJADJQ7wkc8aUCqomdAA0LjyXeCwyF1U2A3m3v3rKcxbi3hy3CiDoWLx2I1fL6JwUQfg7CreTVTymcGlTGvd4O7GzZkpDtsk51T9tQhv1KqF0+DtUdcVSTP9/evPJ7EGS3SnAqcJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208308; c=relaxed/simple;
	bh=CJ/pwys9eXvLlzj2jpGCe22r3tb5yzA+YzN/vgI8Hs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrEEEFFUo5UGdH2v4W14xEZy8imrS9XJb43OJewf+hXX9zYKZXfyKwM40VwhhhcZQUO7H1wfKwIGJXoJ4JLIwz+RbCErVIkYoa7OY8OuuQIVUEDn3HkwSGXe3FoEj8JBAhkyA93mv3I2QamZIx0xoEZFgD7po1ZrNPn15xAnA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ePOwUadV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ePOwUadV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f5ccd9742so6141425ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1739208306; x=1739813106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiHhDHGEQBKgaz2PgoZcIooxcWU0Z6BNt/oykAlJWlk=;
        b=ePOwUadVpYormXD79VDDNuxf2Ctz9bM5/Hf8Yzjp3KjCojq8C3GNWPPd8Xf/Lsg2fb
         htfTokilR2o57DOruAKls5rmO5P/Qkbzig/cw+o+XeHXdEdLGEuCcZBJltf8mjcYxLNs
         JmNLnJnuzO0MNb+o8EJNLLtKkWwU5dj/1rKtAv1suCOFiwmsMPYeMsh8ftfLfe/lQeJi
         8FoHPMWwY50QzM4RcNUJsKNJ5rwNwAsM58214qJE5nLyJeJnWeVJyw0tp1asi15Z81Kh
         iSuRrm+igqTykoim0zaCO6Y51posKy1UXRYCls8wWKC/O6a0F20IjFPNVKGFXka9BYod
         z8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208306; x=1739813106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiHhDHGEQBKgaz2PgoZcIooxcWU0Z6BNt/oykAlJWlk=;
        b=EBCN+EY/A59tGTQ41f+XNKUwuXDX3P25dnsIrSeSo5lZ0CLHTOaZThLV7snMkbBJTp
         9parrTxyFiLQ4kQ9BnNaGgaTeWMbZ3aQlM1ahMjp4fkMju8O7aQihBEyWZp8HmmHbei4
         cVhcG+KBtFtQLzHgnWY0zCMmUetK0rCemCs4WkQqDoA+iyodUnIm0BGOHExlm7lOZ+Iz
         SADm8Oupxk5z34tPLtAJ6a7ME1PAYU4aUlxH670hVEDd5aQ29NPsA0AQyP98UwzS5UYz
         xsc+LWP9Qf5x8xRpLE55Nc+zfey+4SP4w2Y04sEY3L+cbWYoaCLMjsJo4DtgRt6h8s5Q
         uWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTkniq7ZFLy9kSEDV2W1CwNrFBV8V3XypYZp+x310IT25oMgnktJhtmsPweoVOtsaPPsyc1rzPZEDoMx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDW0nIhZ2U10XmnZzikpEgO33qXqlgJobX8Qlj80rC/CySV1ls
	IIqo+uiYmIKtggasM5jsLg43F1K6yQ6bcJ0wiV7artZok6xgPoedH4hG9M9pqyc1F9x44thHR7P
	HZ+H6ytRWRWY8Ig0N2eUp/A58jkdTL3Cp0KsbY02QQrEN6BhE
X-Gm-Gg: ASbGnctLu/8BlQooxWjkbfW3LnK36v4XF1fdN/qjSZNs45D1FuTrSdZiVb0569PLRV+
	S/2VZ55ptC4MSZTl//YQmjBL28on4VQ0AkqfnTUz/k5vSPyCCNoZxgusAqzM4hayNlvCGm7E=
X-Google-Smtp-Source: AGHT+IEucDmoU7uRoUcUzInTENWREnMD4L1AyE6xcdfr+RGfCaLMUeRX+royuye7P0fqaQr/ICee4T7+MJHFpc2xSMA=
X-Received: by 2002:a17:902:f787:b0:21d:da9e:1465 with SMTP id
 d9443c01a7336-21f4e771c03mr81754695ad.9.1739208306035; Mon, 10 Feb 2025
 09:25:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124184311.1642797-1-csander@purestorage.com>
 <9ea74200-7cbc-4a30-9503-864dcec9b45d@suse.de> <CADUfDZoT7JW+d+j6YNmWJ3CKZ45gbvcUSsE6boZwE1C3iXw2_g@mail.gmail.com>
 <f75c62ce-04a7-4bc0-ae77-8ed80842bf37@suse.de> <CADUfDZrvHmYQgqu5GiQDrAg_MOEiRigCLCmBSO6jeyd1z+Q-JQ@mail.gmail.com>
 <3bcc6e3f-5172-40d4-a4d4-b0f914b9406b@grimberg.me> <CADUfDZq3ZqpP9hZhgG1gzyyggG6SCQiHqHdgbm95TU2oZ5QFUQ@mail.gmail.com>
 <17d0b30a-758c-4a84-9879-0a070656f15e@suse.de> <CADUfDZqy4tO5DxWejvBN7-xBVfCfKae4PDq70NYsgMhU+kkJ-A@mail.gmail.com>
In-Reply-To: <CADUfDZqy4tO5DxWejvBN7-xBVfCfKae4PDq70NYsgMhU+kkJ-A@mail.gmail.com>
From: Caleb Sander <csander@purestorage.com>
Date: Mon, 10 Feb 2025 09:24:54 -0800
X-Gm-Features: AWEUYZn8c6zrSakAY3hcSFiGE8Sm0IPAE1CQT-nVVZsAnpFS1UgYjiv8pRgN3ls
Message-ID: <CADUfDZp5E-oc+ikHQxvFyR7nLPWiOjqKQudC04roarn5ps9w1A@mail.gmail.com>
Subject: Re: [PATCH v4] nvme-tcp: fix connect failure on receiving partial
 ICResp PDU
To: Hannes Reinecke <hare@suse.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Maurizio Lombardi <mlombard@redhat.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this patch. Sagi reviewed it, and I don't hear any
additional comments from Hannes.

Thanks,
Caleb

On Tue, Feb 4, 2025 at 2:20=E2=80=AFPM Caleb Sander <csander@purestorage.co=
m> wrote:
>
> On Sun, Feb 2, 2025 at 11:20=E2=80=AFPM Hannes Reinecke <hare@suse.de> wr=
ote:
> ...
> > The PSK identification has to contain the host NQN _and_ the target NQN=
.
> > So you need to call gen-tls-key with both in order to generate a PSK
> > with an identitify which can be found for a connection attempt.
>
> Got it. With "--hostnqn `cat /etc/nvme/hostnqn`" added to the nvme
> gen-tls-key commands, the discovery and connection succeed. I see the
> same behavior with and without my patch.
>
> $ nvme connect-all --transport tcp --traddr 127.0.0.1 --trsvcid 4420 --tl=
s
> $ nvme list
> Node                  Generic               SN                   Model
>                                    Namespace  Usage
>   Format           FW Rev
> --------------------- --------------------- --------------------
> ---------------------------------------- ----------
> -------------------------- ---------------- --------
> /dev/nvme1n1          /dev/ng1n1            d95671fe6e0ebf8c199c Linux
>                                    0x1        268.44  GB / 268.44  GB
>   512   B +  0 B   5.14.0-5
>
> Hannes, is there any other information you need or do you think this
> patch can be merged?
>
> Thanks,
> Caleb
