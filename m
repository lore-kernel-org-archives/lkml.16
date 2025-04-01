Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F470200A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743472091; cv=none; b=FRTZAgStDL0+s5P0JiWWeEFvM2C7gCVL2E1hiXAr3u7iFdq4u3fRKqZa/8bCuWynlzg+DuNI07eC33ELLhVpp6k6j4KaXrCGXLGoUYR8//XJZFeMskygsSojTied+1+SAWSiwrBu+2kTSRt/aqEX5qY3A6MkGbeL7fDVQUjYcWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743472091; c=relaxed/simple;
	bh=ZE0TLzMHZSX0EcpVfEOzg+w2gwf5mz1cfK8sc4JCTf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqVqXcx1JfuIaUx9TkABhNEzBK6Gboa4kbi0r6KPsgdmI33590I9lu0Xh1blCFvLH6UaqlVWxCXV1v6XKhCoF+UeHZh/NYntjxptsVZWEIhIqCptnRx7fQhKcN/k3atQYnH9EMPGEycqjWjE7jndgShzvVs67yFvtCVpaf6AHeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TzWs9kPY; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TzWs9kPY"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so6592179a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743472088; x=1744076888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+TAj1iyOp+p+CcqC5d0+RxCmt4F8A3u8yV+2RU6uu0=;
        b=TzWs9kPYlMpqnFfd56yw8K6BZo5bRY31wdhYrYKfBC4isGiJH6nLMRdL2NOrzsqHnC
         pmiRFw608+HynUsPJeOmBm2wUOgsG26Xqk6YaP2lbyEuQ4GRrdvwD2fIGSvMwgtvoBCh
         PUn+nlwaFIhPxe4ZDggzT/aUvKOIGEDLI0xaLs0x9KI2cKjkoDwXABsgiYAkdByxe8J0
         a4Uy0HCgLkYEtcXUuWSRsMgGT49RYjfyFNX093radoGC8DHDkANl8FWGKLkEGRmc8ITY
         gAcuaBAhqylo3Fr//dEwF1qXp9NT2gQWkQ/DTGvjKjEbjqAgFUI/Zl27dXb/FmEwRAtH
         F0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743472088; x=1744076888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+TAj1iyOp+p+CcqC5d0+RxCmt4F8A3u8yV+2RU6uu0=;
        b=mXP2Iz0BOl8+FPVdcCT+aKfs/qOqqygfq5Ybahag7i99ChiNF97UmNVvv9Q46qwOhL
         UMMnZc+n7kQZXIrSJSGUsZqajGPxdsZwQReqXiWvtIQA9q6V6+6Ctjd02ejsMka0HF65
         0HZMiCD57NONoGSzuOD3UUtlgsxd4GU9fB82andJvg5AAuT5s1wTp9kU1YYEmfahY2Tm
         2/fWh3tc3dXUHawyonE4kCztarKRfDG+7Fkgrjp47I+yW5MbR0G4FlKz6CxyPOlRFaVD
         ugaJv2P7TrkWb6pgfeorPpsS+vG8kNnvP652esjH8QjBF0UXuZzRDyrfXw/tl+dNvXQ7
         9zGg==
X-Forwarded-Encrypted: i=1; AJvYcCWmKQPjjNzaF1CFuRzU8rtr7IoecVnq36OwVl81UiL2RuT43Myg5ArPcbNgWtIHMPxEGpggqp4oeGIOoyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLr6AZsYgrDvsu6vGIvWuQ4UHGH+HebcnSJVqTSkCdDX18bUnQ
	pOcLp3HV5HnbBZOKun3ctZOtZuKPMB7uMq+ktoRADY1hmbmbDnnSreLAJEMfySV5RA5ELD6oxWA
	+rMV7p7dWq3pN7HIRkQW2MIMVWc4h7OHpWlio
X-Gm-Gg: ASbGnct1ZLSZMp3hAD2r1frts47qUHZNgsCROH74aaBQemxeUKOeC+JK1fnjtbd15aB
	vAdeTdjQ69evc9pDkYwhzGcfwp0bCpVAC8gDx/aSGrIXSY7yLHLtxzeDgPDcyrWE6SdB6N4xV3K
	qQ+sDxbkoeXhCYIsvWvC0mt3oYvygeXJV1HwnVUjcj5pB6fDnwjz3Z6ySI
X-Google-Smtp-Source: AGHT+IETo1denFEedN7D3QEKuncrCuPvMuwDPxe/hUsUn0x2mryF+a39piabr5hR8q1+/nlLvG0nTxN94/k8Rl9ocOs=
X-Received: by 2002:a05:6402:5cb:b0:5e4:cbed:cb3e with SMTP id
 4fb4d7f45d1cf-5edfcec61ecmr7826050a12.12.1743472087619; Mon, 31 Mar 2025
 18:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81c040d54209627de2d8b150822636b415834c7f.1742900213.git.karolina.stolarek@oracle.com>
In-Reply-To: <81c040d54209627de2d8b150822636b415834c7f.1742900213.git.karolina.stolarek@oracle.com>
From: Jon Pan-Doh <pandoh@google.com>
Date: Mon, 31 Mar 2025 18:47:55 -0700
X-Gm-Features: AQ5f1Jomk7lsPt2dF6-TylkfAyS1tokmiYnIpRJlkKyBYOSIZKt-gI4sMXPgaz4
Message-ID: <CAMC_AXXPKsat846r==J_OYQA2j8kT-kZriuSqoH3F_nYEN8ATg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI/AER: Consolidate CXL, ACPI GHES and native AER
 reporting paths
To: Karolina Stolarek <karolina.stolarek@oracle.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Terry Bowman <terry.bowman@amd.com>, Len Brown <lenb@kernel.org>, 
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Ben Cheatham <Benjamin.Cheatham@amd.com>, 
	Ira Weiny <ira.weiny@intel.com>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Liu Xinpeng <liuxp11@chinatelecom.cn>, Darren Hart <darren@os.amperecomputing.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 8:08=E2=80=AFAM Karolina Stolarek
<karolina.stolarek@oracle.com> wrote:
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628..ec34bc9b2332 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -760,47 +760,42 @@ int cper_severity_to_aer(int cper_severity)
>  EXPORT_SYMBOL_GPL(cper_severity_to_aer);
>  #endif
>
> -void pci_print_aer(struct pci_dev *dev, int aer_severity,
> -                  struct aer_capability_regs *aer)
> +static void populate_aer_err_info(struct aer_err_info *info, int severit=
y,
> +                                 struct aer_capability_regs *aer_regs)
>  {
> [...]
> +       if (severity =3D=3D AER_CORRECTABLE) {
> +               info->id =3D aer_regs->cor_err_source;
> +               info->status =3D aer_regs->cor_status;
> +               info->mask =3D aer_regs->cor_mask;
> +       } else {
> +               info->id =3D aer_regs->uncor_err_source;

info->id isn't filled in pci_print_aer(). Is the addition due to
aer_print_error() having a conditional/log for info->id =3D=3D id? From a
brief look at the code, FW-first (e.g. errors from GHES), I think it
will always be true. However, that doesn't always seem to be the case
for CXL (e.g. when cxl_dev_state.rcd =3D=3D true).

Disclaimer: not a CXL/GHES expert though.

> +void aer_print_platform_error(struct pci_dev *pdev, int severity,
> +                             struct aer_capability_regs *aer_regs)

I like the encapsulation.

Reviewed-by: Jon Pan-Doh <pandoh@google.com>

Thanks,
Jon
