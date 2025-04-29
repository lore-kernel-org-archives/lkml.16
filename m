Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0916021ABB7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745964298; cv=none; b=DGyGzRVcccqo+9EJ7hCixid+p9oTIJqMaPlbOuw0UdmniaLbJ8FujD/JAHSFArXJgyvWJjsj8SK+Dw8M/l+QWo+P6RQTrjBXbWEMST5cT7CxffIzDIZ0ewrulcrYYIZcfbSHrM5A+am1wme6lY4ioLP8C6RS5+QlDV1I3ctueVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745964298; c=relaxed/simple;
	bh=iaUHLg0dvW7boTjUUUvyGYJuf0k+x8BYZi5xJbGoCrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/nj8GwEKNgUQO/OWNfQm7KsNq/yB49BWczJe1Ky6SK3f/8TcTaTZljo4oR39ZgbZjIxNbhUZRmLqdAzUass/iGE0M1Dhugnj39sIEiHgNJR7SpLJBfvqSP1leyIV2JX7Oa87M4703pfFmHSToxAuzp/vfla/GGt6a+jcp8k4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyGHEhG6; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyGHEhG6"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso2434802241.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745964296; x=1746569096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaUHLg0dvW7boTjUUUvyGYJuf0k+x8BYZi5xJbGoCrE=;
        b=XyGHEhG6WBaF4QWxclaEXfGbd+WMBtvEd/odS4wgyZ/BU6q8eUo4+vo12C1GVjycGY
         mYXdl0GegYLo2p/S15tNjHjeGVaFrRnKZPSx5Nt75yhi/SZ2Ewd8Vh4VAe1XBJjKrl6w
         1OCYULpQkZCz1TKnWkG5fFOptIkOD2tEHf1zedkm1ECzotCnIVBrTZuBSmF4Lalyo7nU
         hf0L5Umr6Am1qZa/CYTxzSWEv2UPLC+/ujLqywu3JQX4nL2Nufbpte8XXdzBFDDjgKdO
         IXxQ2mFvFN6Rpx6OR2Ft2nqyAsmGQgFJBpWA/UnBgNc5jIgjRgVKnfR10cVCQnHjNtNk
         fwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745964296; x=1746569096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaUHLg0dvW7boTjUUUvyGYJuf0k+x8BYZi5xJbGoCrE=;
        b=V6dVcMp5bsgSBUwzE7guR7IcLCfOGOPKVY3A0sWMTZmtTuI/nPgxzCisFqRtkBcaI9
         +zzSGSwKajQDa58Uys9mRdDnjOjgcBobAPBxKM8608ATA/p5PKOTKFKn59WBHcCL8cDp
         lLjvh+1SqOaIr8dM+/eU1jsKCLYAirwyisGU2kLsBMB29INsqLtsTVnlu/mi/t2Old4w
         +ajJwRXFxu9bx5GJR3RliEIuhIpZgxlQO7MXsR++eBF3wetlAoh9rcscOlZCFIIbjLzm
         nsFwSGP+YkBsmfYJN5RRTkR3gL8BazCYlBBJvOge5l5YNyCzXuXCEi9EB3DKxwDNK5br
         5qvw==
X-Forwarded-Encrypted: i=1; AJvYcCVcWPgC/uecp7JpDASBiDqExjVc/4RItNByluY1CRteoLE2zyHYeaRdu/HK24752ihUv6/5tgq5YCHz0m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsxCABen0nl5c27Xt+tTbYjx7OosKXuvRjbXsdqQ0XysHXebLP
	Va/a/QVXy5HTGNWcRokAx6ixkmhEHtDQRrK5Lvdvdmtgl8xzIPHm2Zr99Fmngfn42AGc5XzcM5C
	Z/CAMN/BaYbJp4lRszHzuakY+nAk=
X-Gm-Gg: ASbGncsprBMl4bx+lIGX7L/NHnvdV07LFLsTByrnXIrHl9QFTs60Q/KT4AAOg+VNqhs
	Ru6Txl1zq7/PPNRUuIzCWDb65S4EkYsKUIJlU9NECQ5AZUpcLPSUlc+y747tuXJzhhsmYGC81x1
	W1Np6e2Up3ADPoaKbzR42cSQYcCrjowIvNsyurPnUGFd10RCIJHhFt+bXJoqSkotg=
X-Google-Smtp-Source: AGHT+IHrW5PKeQEDp0a0r+ljMXTdHqx4SsIY3Lt49lIO3TlKoEwST57w3Hw/dVsYtfCoLK6co3qKpVMvds+sdwumiKM=
X-Received: by 2002:a05:6122:222a:b0:520:af9c:c058 with SMTP id
 71dfb90a1353d-52acd7a3977mr904933e0c.5.1745964295676; Tue, 29 Apr 2025
 15:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424101333.2908504-1-alistair.francis@wdc.com>
 <20250429125505.GA13574@lst.de> <aBEPcVursIG8fab6@kbusch-mbp>
In-Reply-To: <aBEPcVursIG8fab6@kbusch-mbp>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 Apr 2025 08:04:29 +1000
X-Gm-Features: ATxdqUE9I9yRs_Sv0ELYR0FjEo5w0O9A-VsUGc8YEBhKMma9pQyKFOd0PNZ40nQ
Message-ID: <CAKmqyKO=Fv8g0+EGFG6LAHqMCvXY2BEaD8ujB=h-SmCyQVnWow@mail.gmail.com>
Subject: Re: [PATCH] nvme-tcp: select tls config when tcp tls is enabled
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, sagi@grimberg.me, kch@nvidia.com, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, hare@suse.de, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 3:42=E2=80=AFAM Keith Busch <kbusch@kernel.org> wro=
te:
>
> On Tue, Apr 29, 2025 at 02:55:05PM +0200, Christoph Hellwig wrote:
> > On Thu, Apr 24, 2025 at 08:13:33PM +1000, Alistair Francis wrote:
> > > Ensure that TLS support is enabled in the kernel when
> > > NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
> > > used out of the box.
> >
> > How did the code even build before this?
>
> The nvme tls code doesn't appear to use any symbols that depend on
> CONFIG_TLS, so I guess it would compile but wouldn't work at runtime. ?

Yep. It happily builds but then just doesn't work, with no obvious error.

Alistair
