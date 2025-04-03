Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1C233981
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687789; cv=none; b=AuEMrChmDe8pDjJLEa58vZV+1pNC43eNl+FCuhCXWi6qSCrSjxIV+SPGoGSjHijxgQyw/d5YAG9iiFm4Bydlnvu0oJE3pb7Ze9WrapsrzfVeEaV0nnLm55Ps60rM/Dvsx2ZKes3o3p20U4OvApCUcdbdC9Fm+a2LfFmmNFRzxyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687789; c=relaxed/simple;
	bh=Y+O3N0Mg3zjaodcgQv5X2X/SV9YJxv/zyZ6jTBFKrw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TS13x03lpDGohfKEtp0jQ0sh0WwFGXgZUqiZHcgcFPz2+1wYvKdBhqWB8Cx+B5zqycGCUx9g8ReP7oE+VMII0D2Wagq+1+iXPzgZmpWMR/1JDIoL66A5ewh78b+/RMvlFN9E6gRpRanYTKgTQbO5LYwcoQ7lZpvtLB/zpRlzod8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhBbZtLE; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhBbZtLE"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so9067641fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743687785; x=1744292585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnHIJaJmPOTcWKy9/EQwvdOyTpiQOXrF4NYnsTEev8o=;
        b=MhBbZtLE1RD9jW+fgxBP/+d3jyb+i5e1A2pCxowLCvakvGBLwwYvto4cSXDdYqpg2U
         s06A6snfnH6KgxAj5cEkYyH91ZydhMhqTgjXpUpGt/4AJyxRUarGvuMhOGa5JMniGrcG
         /oi1Dw/+zLR0KT+cPTN2vh1faAJA1erjQULgm+Jc4j3AhopBN/4behEuKBtBis1BrOP0
         rVtr2LZLADjO5dQx55kJG/3JtXcXlIlwfxjMx4g/m3Zy9Ds5EEDM/Lt9aDEW7bhiXIIe
         pPTfA8v4/GlA9ybOJCECQXtABsmE7613NdGcRrbNoF1jTPSrUm2xAFk0PhZbtp258a3k
         Ezww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687785; x=1744292585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnHIJaJmPOTcWKy9/EQwvdOyTpiQOXrF4NYnsTEev8o=;
        b=SBaFx2uNbUsc2Ga88ILo/QO2CID02r1aqgO+ytTCpL2M0YXzONHmDF8bOg5BIMBz2N
         oYSoyOrfgCBRj2htgbOkNvA2/zQEt2z3ULw2rgSu9InZxroyLeXi94dsI/5mPp0pbOVQ
         Ys2QOz1WaxfhKcfC0irO5p6YbjJ4NSfVPUAEr2gGnXNSYpArh6eBxUP9WfLHVAn5vsH8
         SwLxgyiUv3mirn5cbDrYTrq/Q11n3jwX3Yba2bMWs9Sc1X8Th27cRjAXFArNsJeon8kr
         nUMHwZP1hYVWWXB+pEDiCDAjxxb1ah7BbS+rPLZIIj1zveUvKLpKvePtilR2Ku5YHQel
         Xvew==
X-Forwarded-Encrypted: i=1; AJvYcCVaxqxhxw06vQ7Rfp8PEceKwvbce7BTGYHiM+QOiRx7ovbBSdy0P5oUfTYw+9dRz1p01BkdF0fg3KHCCyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl1GwgWtADr3O66ewJA4hDe2nchz6VYL6uysX/8lrebvxXEMTp
	/uAclbL3P8sZhuTU+tiYoE8uGL1ol4I3xHl3YSSDdUGClQZHAQBnlvLFv2KgBYGUMugmFkrOTxO
	mppzudJXhYdxZNC1kXnKPAUTCNAs=
X-Gm-Gg: ASbGncuN34zm32V217zGMDGJThfSolfxjDmmN697YgM4yvrr/KKenu+7ZGcAKCdmGq8
	qycixeWh5YV6hvfmolWnYztXSLb5SMM+2pqZ7yUL3pyNcQuqA/4NxcacSaV8tkDWLILIE+qofkf
	FMTXC4VvUfhDJIqOYRIGrVvlvMTg==
X-Google-Smtp-Source: AGHT+IFyfXhmFsa7JKsAlAhlm/Om1WP7m3TIBLhWY8jq5PguFLmjfl4iYaC5GaCL3+/3iicC6GEmK9yIy98Bx66q/k8=
X-Received: by 2002:a2e:bccb:0:b0:30c:2d44:c212 with SMTP id
 38308e7fff4ca-30f02112008mr11751511fa.9.1743687785394; Thu, 03 Apr 2025
 06:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de>
 <f8ab4b21-0afc-4956-a324-12c0c67bb5de@molgen.mpg.de> <CAFULd4Z48Vh_UW6+Q-BJ3c42eo7QaKhAbhZRX+Eegx0Te4+z6g@mail.gmail.com>
 <dfb96de9-b28a-4eac-ac73-88bfb9c44245@molgen.mpg.de>
In-Reply-To: <dfb96de9-b28a-4eac-ac73-88bfb9c44245@molgen.mpg.de>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 3 Apr 2025 15:42:53 +0200
X-Gm-Features: ATxdqUELqIx6TqVDVB-QHsT39SeAdZxL6RPUeS0vHCEbjJ6LN7BOK8GbO6AxP6Q
Message-ID: <CAFULd4ZGWFN00AVQ3Y3yg4HJgdbb5o_hxERnskggFtxfCUBieA@mail.gmail.com>
Subject: Re: New warning `cryptd: no symbol version for this_cpu_off`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	Brian Gerst <brgerst@gmail.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 3:20=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de> =
wrote:
>
> Dear Uros,
>
>
> Am 03.04.25 um 15:14 schrieb Uros Bizjak:
> > On Thu, Apr 3, 2025 at 2:30=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.=
de> wrote:
> >>
> >> #regzbot ^introduced: 6a367577153a
> >>
> >> [To: +Uros, Cc: +Nadav, +Andrew]
>
> >> Am 03.04.25 um 09:35 schrieb Paul Menzel:
> >>
> >>> On the Intel Kaby Lake laptop Dell XPS 13 9360, updating from
> >>> 6.14.0-11270-g08733088b566 to 6.14.0-12456-gacc4d5ff0b61, Linux logs =
the
> >>> new warning below:
> >>>
> >>>       cryptd: no symbol version for this_cpu_off
> >>>
> >>> I haven=E2=80=99t bisected it, but could it be commit 06aa03056f90 (x=
86/smp:
> >>> Move this_cpu_off to percpu hot section). It says to have no function=
al
> >>> change though.
> >>
> >> `git bisect` led to commit 6a367577153a (percpu/x86: enable strict
> >> percpu checks via named AS qualifiers).
> >>
> >>       $ git bisect start
> >>       $ git bisect good 08733088b566
> >>       $ git bisect bad acc4d5ff0b61
> >
> > Can you please post your .config?
>
> Sorry, I didn=E2=80=99t attach it right away. It=E2=80=99s attached now.

Huh, it looks that modpost chokes on __seg_gs prefixed symbols.

WARNING: modpost: EXPORT symbol "this_cpu_off" [vmlinux] version
generation failed, symbol will not be versioned.
Is "this_cpu_off" prototyped in <asm/asm-prototypes.h>?

Uros.
