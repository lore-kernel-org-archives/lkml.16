Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7BC2561A3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186868; cv=none; b=uhqjayXLMZQbPTnAEVeEpjI4ujUSIUT5XdXSJEgnsSaN36f4pzBQd0puu00/L3fLDofLA8HQuCL4EjlQ2y0evfouTE3tw58p1z9aV1XrsbYMHT5cSXfropFlfCqEDvf/KLUgn3gaFRM/xKn/+RrRQOj87VrZLubFWznDXhx/AKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186868; c=relaxed/simple;
	bh=yPtsBjYSLkAPrCZiTss+NrJJGezTaQbSZTYzCNiC8N4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kmPabsMGZT5RKHKPUuYf/ofZFZGO30V51mPIi6Wr+qnEkBTBhIfuYNPceALDfBDbfnwxeW+uiRLPMnre9p+NoQr1XdfJNViq4KAJsWpCuh35DkjEMuMOL80GpXRSfKvsxx4xm047yFmlO+tcfqMEV0PW9TrTv3sEGb9Jkpdd2CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JDDH68S3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JDDH68S3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744186864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPtsBjYSLkAPrCZiTss+NrJJGezTaQbSZTYzCNiC8N4=;
	b=JDDH68S3DQVBWm3y4MUO+NITGxD/kIpN2g5FhukBvEJL1T7jrfjFpt0WHaJb8ia263oOdF
	QwKKUbgRsaaW1DRUFL+f07wOwQuiGiS38FzwYjTp5Zey5Selu0Qvc18BfJTE0FrDCZZsRl
	z9Ojgg1Qo+9666coeQLQLzkjRIvpxRs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-t5UWafUDOCCD7RY8Ndz8gQ-1; Wed, 09 Apr 2025 04:21:03 -0400
X-MC-Unique: t5UWafUDOCCD7RY8Ndz8gQ-1
X-Mimecast-MFC-AGG-ID: t5UWafUDOCCD7RY8Ndz8gQ_1744186862
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7394772635dso4640760b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744186862; x=1744791662;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPtsBjYSLkAPrCZiTss+NrJJGezTaQbSZTYzCNiC8N4=;
        b=NmQb0NlZN4Sp6hAv5Jaw0Vwdk3WPCGvxA2lkibQwMUIzPcMxht1HKMPWXvvi/20mMu
         VvGjiHV4YgtnWkc+Ao/cZlh3SfpMhZhr7pn65B76b9cp7CU6LqvU+EUpywSpZ1GJvT3v
         6rAerhh2yg3SEqDhRTAwV7klJEgxZbRndBjZYjTqp6wziXIrHppv/ZJoIyBvBkcgcW/Y
         GnZgCr4Zh+rK2z/M5MwwZ2Pfj6dJuP0pSaVQaBrRa9Is+njqmZyCoffETfSaabSX/G0i
         rPOi4w0q9IlElsJMfSvlKaMgm9pE5dokTrPA57mEFqDUB6HpXCaKji9Gzq6k2E9hhSlm
         v05A==
X-Forwarded-Encrypted: i=1; AJvYcCVsj53aBpvPJ8TXg7vFP+UKAJ75D5L7RGyMXP05+k2kncY7HUvAcmtb17FYCUF1fZ9hcb/nbvJeVBSaTlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfQrDrdUQJStEBCMUT7mq8peIQOOvU2IozhTBfJqi7uWzHS1pt
	PUrneubLGEfNpuD8U85PAciq+NegrvrD03t50qkE/CauSspu3WfZq8cxIqHJO6yK3grnmnWC2sN
	gbipX5UoMCfG7UKk4+Mi2AQlMerVlRtyAyaNuBI1+v5WjsiQ/L6VNvZWwufz6cw==
X-Gm-Gg: ASbGnct/XKrHbf8iDuL9e3Kqef0q0fgwyKCCRTQUFr8sOoaof380HMIODAD2lMRaODQ
	HtfgClY0bVRS9Fp8rqCBFAaO7+L34vMxxYCNoxXEjw4t7gCl4hI2IyHy0ibvA2KYgdMVeS8bdu+
	OV6PonbuTxvPf2uFJ4tKBi8fBG+M6H7l+/7BqRy9EbWtDOKddB8Qz3qQsnEcC5lDy/RkxNrhL6h
	5DoVEMEp9//I6DkeBVJvqDZrEK9VNPHuR12hkHJIMl0SgIeVMwAHkg9BOLX6Z00lcOegown9Vtu
	zVcU1Nx2zjbE1Fjx3ieKtQ9SRTi48EfK/RH0ng==
X-Received: by 2002:a05:6a20:9f4b:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2015aec70dcmr2663672637.19.1744186862417;
        Wed, 09 Apr 2025 01:21:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAdC8ZOoLIsWMuTKkgVixwpNFmJg4t2tF+Bs6s3GQA8caDDKDF7hIvBuRiacHAa2qdet6aIQ==
X-Received: by 2002:a05:6a20:9f4b:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2015aec70dcmr2663635637.19.1744186862052;
        Wed, 09 Apr 2025 01:21:02 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf2eb3sm660285a12.24.2025.04.09.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:21:01 -0700 (PDT)
Message-ID: <f2ec6ba36845c96e9fb9a2dc465d9066948bbe4f.camel@redhat.com>
Subject: Re: [PATCH 0/2] PCI: Remove pcim_iounmap_regions()
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Jens Axboe <axboe@kernel.dk>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>,  David Lechner <dlechner@baylibre.com>, Damien
 Le Moal <dlemoal@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Yang Yingliang
 <yangyingliang@huawei.com>,  Zijun Hu <quic_zijuhu@quicinc.com>, Hannes
 Reinecke <hare@suse.de>, Al Viro <viro@zeniv.linux.org.uk>,  Li Zetao
 <lizetao1@huawei.com>, Anuj Gupta <anuj20.g@samsung.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org
Date: Wed, 09 Apr 2025 10:20:46 +0200
In-Reply-To: <20250327110707.20025-2-phasta@kernel.org>
References: <20250327110707.20025-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-27 at 12:07 +0100, Philipp Stanner wrote:
> The last remaining user of pcim_iounmap_regions() is mtip32 (in
> Linus's
> current master)
>=20
> So we could finally remove this deprecated API. I suggest that this
> gets
> merged through the PCI tree. (I also suggest we watch with an eagle's
> eyes for folks who want to re-add calls to that function before the
> next
> merge window opens).
>=20
> P.
>=20
> Philipp Stanner (2):
> =C2=A0 mtip32xx: Remove unnecessary PCI function calls
> =C2=A0 PCI: Remove pcim_iounmap_regions()

Can this go in for the next merge window, Bjorn?

P.

>=20
> =C2=A0.../driver-api/driver-model/devres.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/block/mtip32xx/mtip32xx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++----
> =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 -----------------
> --
> =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A04 files changed, 2 insertions(+), 31 deletions(-)
>=20

