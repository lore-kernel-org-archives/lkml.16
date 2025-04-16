Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FFB19F40A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744766686; cv=none; b=ZgKT89GZxazcZ1jeYV9VwjwLixWkzsbooO3QAXeoF3GtFeVdSL/uKJD8QglGh/simwCNGGo4QeH1yBhP4uTlG/cJjKOEAdqxoix1p70KpdnEylfZf5InSRX6XbLOA1tPp7VyJ2qgbMo6XYFLXQG3n7ahhgyjNODVthw0u/og0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744766686; c=relaxed/simple;
	bh=hLwnONbgkXs3AQfY2NdUdEHG/Y3d2eZ1tECEUayKyTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hc3uKC2dUAQKo1CABdGiQ0qhAL1Enb63iLTaW6+/U8q8DIQMykWixrPSSkXvbiiuAez8+0tps+6SL5iLhobY/7tnUS8hNBl+W50aAheCfmmXcXx1dDhKu4wqJo+m0ZeaeWdq80wHn36lNlGN2KPOShjsSjfoXniQzqB/K8noizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWys1/ig; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWys1/ig"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52446b21cfdso2550436e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744766682; x=1745371482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdKdn70M1WrWKq5CkuLZtZt10QyYO6gcPi3ytovJxXI=;
        b=NWys1/igvW3j/K7xK9mNNfm9KYypZLS7rn1QaFbsv1fSQnoIdVZG4AkfGND8RqJh/h
         O79P4WOcDEUY6GmLRbMerG2ZjAzSQB0AN+HJuecaDp4N7TaHEwxlyfKIHfSnu2fbF88N
         EYy4Jukeu/8Jh5Oal8qpHSuXKbCwandzJSTs2fkTXlOdZFGnySIzoyfGrF5afqW1j4dF
         oyiIo6u+2+qGDTZdDe2/MzgjCXN4U7Gcz/5TbDgM5U/BfCmwJshLiKkRj076UwwQb4Fa
         N9d+PZmLp2NUD3jYYgwxVKafH1Y25q33yelnz7JAvc8Za6Dc62Jm6UaplecZdOJjLuOH
         XgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744766682; x=1745371482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdKdn70M1WrWKq5CkuLZtZt10QyYO6gcPi3ytovJxXI=;
        b=Mn+RLZ+6+6Aj8Nwyt1k74wInAjFCt+n6TJSLqmZITl/f0YU8Mc7t7rVvrtRhGqIiXC
         6Y3Hvs3wwPaQuAQJX6nuf9kkEfBFppBmSQzIw3RpCjHdPaMkQLhVf0zn571IFNpaGiZE
         YVxC+jUvmE2n17s2uhGTcxpRPGrN78ktXyCsQHQNPt2I0ekoaciV433D7RYqi0HudYQR
         f/UjXIVqxbyMEx5diDaG91UkXuNsPvuweMrvlNOlggd11t/ZR3q9AOawXLJkxjQUfi/o
         BwAXefsn9WXP8VzOA8+ode8wRk8/M7nLDyftzA2v2oUTBPSrKC8A4kZdQzogTubUrC96
         vRQw==
X-Forwarded-Encrypted: i=1; AJvYcCXVeIQJPgbRWHIGAjfvMYHjsz0FHYHFHcIKJDxpl87Vrc989Zp2dLnx68xKxTu3zbZuIu453l3rK3cTEPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdhWknRhxW2wL5QnkFXUJCBZcPSBWLuhA6PHEIRRZeEX4U/Wjm
	eLEWNoiaE/4YC/f2442E/zL8P6IDad14uAAg5RnelHWVAhPGTgWSPuAZEYH0s+McPTmLpS+thRr
	Isco4iWefNfizcvQHwLA2IqM7Sty/i4DQtno=
X-Gm-Gg: ASbGncstilo+mZSRIdPDHl4IYsAzKmgfmL4EPRJkSxXGQNEtc6OuwiWc9PVAEv1P9on
	ORnmcAOos4qLBkCu3NIPOs/LXYMfyJfErS2sgmZNVzAgMJ2N+MAfOhoTtBL632qwqnfJCbhakLV
	220ek+cgaFuf6h8AH31jP1g6o=
X-Google-Smtp-Source: AGHT+IGeLcLTAsrZtctAj5QLxbbexgEQXdYtXdXzBjzYtCJMyNimzzzwHUHM95R2TCxETocIlsSNLzu363yOPtxXT5E=
X-Received: by 2002:a05:6122:319f:b0:520:6773:e5bf with SMTP id
 71dfb90a1353d-52909111d6cmr1167731e0c.1.1744766682434; Tue, 15 Apr 2025
 18:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415054642.3878839-1-yangsonghua@lixiang.com> <Z_5z0phM6h73EGci@slm.duckdns.org>
In-Reply-To: <Z_5z0phM6h73EGci@slm.duckdns.org>
From: Eric yang <jluyangsonghua@gmail.com>
Date: Wed, 16 Apr 2025 09:24:31 +0800
X-Gm-Features: ATxdqUGd8qLBVovYvn5vaAowjTfa953T69lHhmAIGUfSiSyhYjlfXvhRUCJkOPE
Message-ID: <CA+P2CkZ3c6MvaX7RDy_0x9VuXDqKPisOPdW1rndrgwJoPCkjwg@mail.gmail.com>
Subject: Re: [PATCH v2] tools/sched_ext: Improve cross-compilation support in Makefile
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	linux-kernel@vger.kernel.org, sched-ext@meta.com, 
	yangsonghua <yangsonghua@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay, v1 works well. I misunderstood your intentions last time. Please
disregard v2.

Thanks
Eric

Tejun Heo <tj@kernel.org> =E4=BA=8E2025=E5=B9=B44=E6=9C=8815=E6=97=A5=E5=91=
=A8=E4=BA=8C 22:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Apr 15, 2025 at 01:46:42PM +0800, yangsonghua wrote:
> > Modify the tools/sched_ext/Makefile to better handle cross-compilation
> > environments by:
> >
> > 1. Adjusted `HOST_OUTPUT_DIR` to be relative to `$(OBJ_DIR)`, ensuring
> >    correct path handling during host tool building when cross-compile
> >    (HOST_OUTPUT_DIR now points to $(OBJ_DIR)/host-tools)
> > 2. Properly propagate CROSS_COMPILE to libbpf sub-make invocation
> > 3. Add missing $(HOST_BPFOBJ) build rule with proper host toolchain fla=
gs
> >    (ARCH=3D, CROSS_COMPILE=3D, explicit HOSTCC/HOSTLD)
> > 4. Consistently quote $(HOSTCC) in bpftool build rule
> >
> > The changes ensure proper cross-compilation behavior while maintaining
> > backward compatibility with native builds. Host tools are now correctly
> > built with the host toolchain while target binaries use the cross-toolc=
hain.
> >
> > Signed-off-by: yangsonghua <yangsonghua@lixiang.com>
>
> I already applied v1, so please send the updates as incremental changes
> atop.
>
> Thanks.
>
> --
> tejun
