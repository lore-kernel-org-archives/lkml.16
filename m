Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E48529CE6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747026966; cv=none; b=lEcKbZ0oWsVfbyrNU7/QWfyxoof3IZy5FhjYAiUmiq1mFoCabdiKJV9SqqHY2TjksnvSo9DeyWOEyAadY6+SWt61iZhvKoJAmvEUSSAGLuR4Jl9Kypz+Baih/zkIU/5KDM1l9x96RL5lCDEB8xzN142P0EWyyIp0Aq51JAslzVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747026966; c=relaxed/simple;
	bh=OYSpVeDaiPzMVPpqsHe3RuM+vsYQ0baXI8G6j2Q9jZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7rGoSgi7/6z1N9c6OEnfCm5RPq5cKadjSqtnWRTNGse0HzhNK2Y4I9gT1lhAfZGIwelUWiiiqfWmqJ1Gbyjt6P0hpjDz1fnuRVZkD3Nzre3O/JVC3YE3KKK5TzDxDBQJHLKoLx0RXsh8P8+ODaKMixRFwIIsfYNAstq5Hoel3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=egMpquSp; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="egMpquSp"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4769bbc21b0so47700521cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 22:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747026960; x=1747631760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB5Kuig9Ct+DdoXuLwf5DLRPBtpEPgDetACmtfHem3U=;
        b=egMpquSpieKopgNwaRcCWNtgAHfh4GU2rDJ9Yd0fMGa9hrDcQBPxzTwuNifgxsgSwg
         LMWGLBBss5ZLe/DlwmQsygRAWJzMCLh20roai2s036xc00da2RCAWhdhVi8p7mO5YkW9
         8gNrZlIZxt3ipGFfec3z71ZXliIc3o2mvqi7BUHsqQKcoYw7TR4q23m/BPdVwasXOHmP
         78x643lgoEIAbKuYDT+fUNl/ticrctnCyP/iE9iWNIiDdsuz+vg+uMrp4z2fiSz1kv09
         UTVgUEC/uSqCiccEF3Gbd55NiHFZroFtfglfDcOaLDKqCm4feL7M/H8YVbGzldk0PYPL
         I9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747026960; x=1747631760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JB5Kuig9Ct+DdoXuLwf5DLRPBtpEPgDetACmtfHem3U=;
        b=fbSCsjlMGU5bUicwIIgUtFL6fvcqt/3i2YcbHmOhjNN0yovW1Gl9UamUrFVKmmGTqa
         OdLwk72TrQKbfzJWWB2rV1wcUQ9xjGUvcZp8loW7Vf0HThqG/kdaKszLKFC1rloLg2LA
         KV/vd18ur4rMILh2TUyq73DJXYTobtDxObhn4APjIAL2U+gpptNHJLecqqqV32BI0CKl
         dkVgGV1oqkz1UpITtJzc6W7U+BSWsRfwVz+ohXNO6IQkvNq2mg0ASupj5BTFNg1qaI6j
         2Ik3ebHSVWqYHftxN0nDOpWUd+IINRSDZDLBGrc64VVT9nbBGhsEnrmUQLk4dv8fbwMV
         WHww==
X-Forwarded-Encrypted: i=1; AJvYcCWg3/Ehn79Xl2P/LfTSrTd2DkzzwHi4HNSYw3+HHUTKYJ6ftEtAuU1jplhWDi4o3Ni+EUWBKYsDNB9TKXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTPIOPmwN6I2MD2/c0ILa1drpysqxe32SfljMvsmVRF8Xn/yx
	RGZ3lMXMH8p9XEVLS+OOgn2YVCiMgkLGOSs6Kuu7cL5dgdhF+kPcYphQvPKhjlp/QJ7IcB54Gzp
	YhCr1ZcaCq8EPiUBqo4oa2bzK40Zifq/SnKwerQ==
X-Gm-Gg: ASbGncsfvLiXtthstw9zeICvhUCfIjL/GOo/a3n1R5V0CvWmqmZfm3cnYFg186045cQ
	erM97zd94KkQsLdFzSBtSI2/Kq/4bsL9gQPmioXAwGBMxUizX62KZUybpqIx3HDbL6CBggDf2ed
	83TVNONOCZdj/rFIGbOS7rX7UEO53ja5qo7rxKJ8bS6eZoskPPFG8O8DJPhXLIctRGpA==
X-Google-Smtp-Source: AGHT+IHw9OYmUFFaVOjKTmrAU8Lic8B4Zm4GrzDVHIbfeJPeFTDZ1sW5Du4kJ5q/UG3UgPC6JAvrwG/k/V+7WBd9EPg=
X-Received: by 2002:a05:622a:2cf:b0:477:6ee2:18cd with SMTP id
 d75a77b69052e-49452714aa7mr173626351cf.5.1747026960004; Sun, 11 May 2025
 22:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222125059.13331-3-hchauhan@ventanamicro.com> <20250512033118.1071577-1-dqfext@gmail.com>
In-Reply-To: <20250512033118.1071577-1-dqfext@gmail.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon, 12 May 2025 10:45:49 +0530
X-Gm-Features: AX0GCFuxSrzsFyhJa4BfWv6ZpNuyEseIibTzFbBBdKXCjiAlaHx5IZ2hKcU0NFw
Message-ID: <CAPd4WewhGXdE0KUzrnLGgK9cDjz35TFvr_fqYHc5yVzKTFCdHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware break/watchpoints
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Charlie Jenkins <charlie@rivosinc.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qingfang,

Thanks for pointing it out! That explains the difference in behaviour.
I will fix it.

Regards
Himanshu

On Mon, May 12, 2025 at 9:01=E2=80=AFAM Qingfang Deng <dqfext@gmail.com> wr=
ote:
>
> Hi, Himanshu and Charlie,
>
> > +static int arch_smp_setup_sbi_shmem(unsigned int cpu)
> > +{
> > +     struct sbi_dbtr_shmem_entry *dbtr_shmem;
> > +     unsigned long shmem_pa;
> > +     struct sbiret ret;
> > +     int rc;
> > +
> > +     dbtr_shmem =3D per_cpu_ptr(sbi_dbtr_shmem, cpu);
> > +     if (!dbtr_shmem) {
> > +             pr_err("Invalid per-cpu shared memory for debug triggers\=
n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     shmem_pa =3D __pa(dbtr_shmem);
> > +
> > +     ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> > +                     (!MEM_LO(shmem_pa) ? 0xFFFFFFFFUL : MEM_LO(shmem_=
pa)),
> > +                     (!MEM_HI(shmem_pa) ? 0xFFFFFFFFUL : MEM_HI(shmem_=
pa)),
> > +                      0, 0, 0, 0);
> > +
> > +     if (ret.error) {
> > +             switch(ret.error) {
> > +             case SBI_ERR_DENIED:
> > +                     pr_warn("%s: Access denied for shared memory at %=
lx\n",
> > +                             __func__, shmem_pa);
> > +                     rc =3D -EPERM;
> > +                     break;
> > +
> > +             case SBI_ERR_INVALID_PARAM:
> > +             case SBI_ERR_INVALID_ADDRESS:
> > +                     pr_warn("%s: Invalid address parameter (%lu)\n",
> > +                             __func__, ret.error);
> > +                     rc =3D -EINVAL;
> > +                     break;
> > +
> > +             case SBI_ERR_ALREADY_AVAILABLE:
> > +                     pr_warn("%s: Shared memory is already set\n",
> > +                             __func__);
> > +                     rc =3D -EADDRINUSE;
> > +                     break;
> > +
> > +             case SBI_ERR_FAILURE:
> > +                     pr_err("%s: Internal sdtrig state error\n",
> > +                            __func__);
> > +                     rc =3D -ENXIO;
> > +                     break;
> > +
> > +             default:
> > +                     pr_warn("%s: Unknown error %lu\n", __func__, ret.=
error);
> > +                     rc =3D -ENXIO;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     pr_warn("CPU %d: HW Breakpoint shared memory registered.\n", cpu)=
;
>
> This is printed unconditionally, even if there is an error above.
>
> > +
> > +     return rc;
>
> If ret.error is 0, rc is uninitialized here, which may explain the error
> that Charlie came across.
>
> Regards,
>
> -- Qingfang
