Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A62417C8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702376; cv=none; b=cIiVaZ1DovtSD4CeFb1Nh7H74whSCuF0njxSA2jgEcdtnrnlBfPnmDX0z/FGHT6WjiJ/5IYO2QZnkC5o+6RnvAxIS6jtulboZFzGq6gwifIAetJLhhdESG6C0UO7Y3SC61SSatb1j9qme3aursuccTTbbmevF1olHH9TJ8c0B/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702376; c=relaxed/simple;
	bh=uwpFd887YbouPlxTbu4z1MIzPZVszlsw21RR0Th3pqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMFhVnnOyP6rys96N2LpyqUQkYdGbXrH3kEizPFzvwNitEwIcLt7a7ox06mM7dUPp+rEPL3ETFZ5tu1y9VUWu9qPgGx0Q06bQH41b4R16E8xiqXdHSDVPhaKu5FJQcsI0hD2GeYcWnl6lPTpdY5K+u9qOe2etvt5FR+lVlT3o/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VavX0DbN; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VavX0DbN"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4c9cea30173so53428137.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744702373; x=1745307173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxYyrTeCcV2mAo2koLkmjwFGldyu+qPfDwo/LzV6E28=;
        b=VavX0DbNEPoju4XEolrPHRTuBUEWfWLgaOtDYLprNbI1dfyBtPzsBwBF8ANGH02UZk
         uUWIX5WsyEv1Mx1wexOILKiA0k9I+wcubKNCwElvt8Omg1vzn1WHgVKLY5JHWmm0qO8C
         BUejwvO/+4A7bPRSM3knNZOGO1p3Md9ecJfLVztaK12IP5uUDHWgiRLuL4WZPVv1/veg
         P3ySGMzAZNbzHAWZbcMLqnScWLzvMFfFzWW6TWNnxFCOPv4EOGcHVKCz0iqeq+9XMlby
         gAAcTVws5cQAp1YuzSoeyiF4ehu1gFSuG0/APqIUCarnsc4I8Xmie2l3W4aa4WHkmUCa
         cgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702373; x=1745307173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxYyrTeCcV2mAo2koLkmjwFGldyu+qPfDwo/LzV6E28=;
        b=T40oGAsT5MNoHYmSYeSgN3jJX7eTqf2VCif1BLIfr76+24dRIjWsGI8Fe/141VZnmC
         OTIVi1+/TMD7UumAhNt97h39jTNBfxsjS3cJkmrXL7kyaryB8jEojKf6e90o+LoQ1fnv
         RtA1fDjJcfpNXdYlkLj2Y89rabztlBbbkjiiAq6Vbs0msolZyGeVPw7StUyPrGnS4DUB
         fmWg+kc73burrD/2irjXZrqlOTrcul644WeEGoK1iRkfNw+SuWEODBwqNfe9S6/RrGhk
         G/f59vmwUhbnp8GWd1KXxyTpJQ6/wuwMwTyF5mFBUngY8s0ZiT7XNt13/sl/PN0/7hcJ
         53lg==
X-Forwarded-Encrypted: i=1; AJvYcCUdlvP64foFPMQ/UXl/k8nZk9LPL+kwINoo24/KCPcnw+ikYlNQFijcTcTV8SzK2eMc7HjevZ2vBDKEZfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUYzWuRFHIqrXRhPTSU53JhV0bjVsnWafvulrTyW+ixjXWUmb2
	4Cs4gXtrHsBlB820OPJIBKOAXIBYzrOFNYFHAjIGRUTWCg3Trrtih+FYYIyLNKHWsrNt/EYSvXv
	niQqPEr4tYnpgUvbY2R0NQ9/cz0I=
X-Gm-Gg: ASbGncuewPVYm18YDaxdkVL+t1h9MwhqEqr/tSpVHuPWEOstTev9/h26Et1clVo8u04
	IMLEvTMIKA8otKyBupWXq9R4ESH07ucRhnkZlZRpP+9fgKhhhFTfc14qbeD+SjToff2/TN8eK9O
	GhXWYFm36yTs3i8PLTHzz2F4Q=
X-Google-Smtp-Source: AGHT+IFfKo1t/f1i5MjYLO1d044mSwJXlI2/ogsrOj64REISjA7bQxbkCGaQXKiGfIqwx7p1Gg6rxIoKJb5xIT8eu9A=
X-Received: by 2002:a05:6102:161f:b0:4c5:1c02:5b46 with SMTP id
 ada2fe7eead31-4c9e505ae75mr9956747137.25.1744702372967; Tue, 15 Apr 2025
 00:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414081436.2574882-1-yangsonghua@lixiang.com> <Z_0_YsO2P4nM7LXM@slm.duckdns.org>
In-Reply-To: <Z_0_YsO2P4nM7LXM@slm.duckdns.org>
From: Eric yang <jluyangsonghua@gmail.com>
Date: Tue, 15 Apr 2025 15:32:41 +0800
X-Gm-Features: ATxdqUGBuJ5JcbFIQqIwdFwgbEnWtSgwSl9axTlZMUp66vAb14XrtY-ul9i5RoI
Message-ID: <CA+P2CkaDAjwGE1L0CA60K9bnSMaZAw6zR_psFKfS2DxGBtm6Kg@mail.gmail.com>
Subject: Re: [PATCH v1] sched_ext: Improve cross-compilation support in Makefile
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	linux-kernel@vger.kernel.org, sched-ext@meta.com, 
	yangsonghua <yangsonghua@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

I am pleased to receive your feedback. Based on your suggestions, I
have submitted a v2 patch.
Link=EF=BC=9Ahttps://lore.kernel.org/lkml/20250415054642.3878839-1-yangsong=
hua@lixiang.com/

Additionally, I have tested both v1 patch and v2 patch, they work
correctly in native builds or
cross-compilation scenarios.

Thank you for your guidance.
- Eric


Tejun Heo <tj@kernel.org> =E4=BA=8E2025=E5=B9=B44=E6=9C=8815=E6=97=A5=E5=91=
=A8=E4=BA=8C 01:01=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Apr 14, 2025 at 04:14:36PM +0800, yangsonghua wrote:
> > Modify the tools/sched_ext/Makefile to better handle cross-compilation
> > environments by:
> >
> > 1. Fix host tools build directory structure by separating obj/ from out=
put
> >    (HOST_BUILD_DIR now points to $(OBJ_DIR)/host/obj)
> > 2. Properly propagate CROSS_COMPILE to libbpf sub-make invocation
> > 3. Add missing $(HOST_BPFOBJ) build rule with proper host toolchain fla=
gs
> >    (ARCH=3D, CROSS_COMPILE=3D, explicit HOSTCC/HOSTLD)
> > 4. Consistently quote $(HOSTCC) in bpftool build rule
> > 5. Change LDFLAGS assignment to +=3D to allow external extensions
> >
> > The changes ensure proper cross-compilation behavior while maintaining
> > backward compatibility with native builds. Host tools are now correctly
> > built with the host toolchain while target binaries use the cross-toolc=
hain.
> >
> > Signed-off-by: yangsonghua <yangsonghua@lixiang.com>
>
> Doesn't break native builds at least. I take your words that this improve=
s
> cross-builds. Applied to sched_ext/for-6.16.
>
> Thanks.
>
> --
> tejun
