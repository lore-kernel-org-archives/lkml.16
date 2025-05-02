Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704F1F4168
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746211081; cv=none; b=rq0jyRWjCqk1fXGfHL9S1eipkuzZS0xd7qrQW0ryVSlQgml1i/KzpEoW6XJjB4FgKKkos0bZ+iVDbGlZpyv6Jtr4I4p9KEHJoDEfHvKEJAx2Ompd9AtwuzHo7vSotIOKr0huQTV3kMAx5u9BLxxeo40Lu9Cv45H8A7xiHXT0NcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746211081; c=relaxed/simple;
	bh=evz0UL5GViJbQYOeXoB2+mBdr/LLmySfQf4mosHPGw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BE7DEmHzQXJ4IBk+xWOsYqqM8t+GALm7SjPd13uf34epfWRRZ2edDuqVv55Kf1DsGDYCk5pCRfizQn6AkfGAyp3q1/jjdC1BX+bTQw9HV2RRdCJ5lZHGhWh9Ji3nlq64+lZzfG2xx7bk0NMMgFz+vrhfxLEFojeCUfWXr2T04hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dRb2ybyM; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dRb2ybyM"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso3543645a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746211078; x=1746815878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szvh9FDiAeZV5KMXY9XpVOO+pU/TH0kKZBG6xbyHs1E=;
        b=dRb2ybyM9EToZlc9rRPDDaJFSph9bO2+zPF+OGTf3OTyX7p7aVGlPWIMJl9+OwrXnt
         Y6v3AC5oD5ubzWTPTDMssf15VOeCPSjZ+SPlFhsH286iYmHGp59r2SQfXCEI85/258a1
         /0V6NF7ef0FgPuZpYFfE/JbYCapbpTd+YBK+EGBP+j6M0eIpuH9C5K6ucBWY9uF0IOhH
         Ngk3Y9u8R+Sv56fVyoLjoBD9LauE6ur0SRb7nyx7SCXmTDM3Zhpd/DgdqZHq+RejkFdN
         +jphJy/dK5xLJYAwoWtp16fTelAuoHBFSqnr0r69M77QS+7mtzoU443KMrqi9p10Oxwr
         yJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746211078; x=1746815878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Szvh9FDiAeZV5KMXY9XpVOO+pU/TH0kKZBG6xbyHs1E=;
        b=vVa82dTf8Ldi0OF0WskT0Z8CXKTwylOFOH8D/dlb3NDxGjN34rTUlAwC2udQKatQJd
         nGxiGH9AGtdkmFMvcEoAjj7lC8waHBQX4g/KCkwcgNonczolq8FP1pZeu/oYFh6Dk64p
         wTAkezlbV5AzNEeVRmb4GLafc+1UNKEI2wgJImg5+WBfgpNzx2/HUaNjb/3Xde2QzuPl
         t+e/agRPsbut4IHHG93p53zeNFCOfrWNma8d2g6fSknKhjGgClAa/Os6wbpwKdQRfTQA
         484n4avdHhO0IGR3IM8f5Rdc6rvo4F7MwJS+6w6SpnBD32UkEaYLD5L8xGObtrDapgkt
         EFrw==
X-Gm-Message-State: AOJu0Yx0Hoa6ikjOR9te77O8Gz/BLmqjjmcBSr67ticU1dPUNuxnPo9o
	9NrjbaTqemj1Bt+QjGdFHKurg3G22/7/CaJVGYuywy5bqLIt2RaV1PABLYJVqMtFE8epI3P8/gd
	UeJJZ2fc86WnPILul0qdIFkmdHMA8/9CVbAdN
X-Gm-Gg: ASbGncuNzbYpo4N7sXDFlX0teDEwbBgy3+agvvoxUFi+x3DEqmP+qbdEJaZx58P4HRS
	ZPcCYrxlAP0qTSHDzGyO/ZaS9+flUra3+kx67yYbfS+lU/Ucif+a2me4uBVml4Z42hWJhhyAIrf
	394966katXg2RhO8HMrJMWoyVxmg8YlELxVyLGSn/MUeY+G91/SA==
X-Google-Smtp-Source: AGHT+IGwGEcGt7qt4y6UtHsVIeUZAmZUDbWtJ+Ey7gGLeSPt9gI0iA5XJZYC4rzHLcT2CmY4/egmqxuj7aqEk5l5ENE=
X-Received: by 2002:a17:907:9812:b0:acb:94d6:a841 with SMTP id
 a640c23a62f3a-ad17ad8096cmr430432366b.16.1746211077663; Fri, 02 May 2025
 11:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
 <20250501225425.635167-7-changyuanl@google.com> <20250501173557.1880f3aa8694352e0eb153b4@linux-foundation.org>
In-Reply-To: <20250501173557.1880f3aa8694352e0eb153b4@linux-foundation.org>
From: Changyuan Lyu <changyuanl@google.com>
Date: Fri, 2 May 2025 11:37:20 -0700
X-Gm-Features: ATxdqUHZQf1uwj7X5bskxFA1vT8WH6Uhw3YyifuFYUsYAjHkndnVOqhZb4vCKaQ
Message-ID: <CAGzOjspvbMkr8b4-xy3EfGLE4nmLC8B9EPx0QYCdpoFQD-FESA@mail.gmail.com>
Subject: Re: [PATCH v7 06/18] kexec: include asm/early_ioremap.h
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 5:36=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu,  1 May 2025 15:54:13 -0700 Changyuan Lyu <changyuanl@google.com> =
wrote:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The early_memremap() function is decleared in a header that is only ind=
irectly
> > included here:
> >
> > kernel/kexec_handover.c:1116:8: error: call to undeclared function 'ear=
ly_memremap'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration]
> >  1116 |         fdt =3D early_memremap(fdt_phys, fdt_len);
> >       |               ^
> >
> > ...
> >
> > --- a/kernel/kexec_handover.c
> > +++ b/kernel/kexec_handover.c
> > @@ -17,6 +17,9 @@
> >  #include <linux/memblock.h>
> >  #include <linux/notifier.h>
> >  #include <linux/page-isolation.h>
> > +
> > +#include <asm/early_ioremap.h>
> > +
> >  /*
> >   * KHO is tightly coupled with mm init and needs access to some of mm
> >   * internal APIs.
>
> When resending, it's best to fold little fixes like this into the base
> patch, along with a little note and the author's signed-off-by.

Thanks for the suggestion Andrew! I will follow it next time.

> I shall queue this as a fix to be folded into "kexec: add KHO parsing
> support", thanks.


Best,
Changyuan
