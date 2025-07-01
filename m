Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AB270552
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366066; cv=none; b=sR8q/OObNpFb4cQguNWVobgpr5KMqsFz+akYfy2y0ZlVbDV3Sj59lNycaUqfe+30VN0rnhrxLi0QkHygXKpwtHeyoGEYAUYplgDH1UhOeXwWVNw+vXFhsVn5fjfqlTCQHsS7HMMopjRfe0HcXmacqDOayuaqFpETHNkrymRPWaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366066; c=relaxed/simple;
	bh=mlpMmzdWBdqODn8nxplDCEWI1NG6aMwmsjqN3xDfy7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1fP9c30pt+iANqFn4HG7CX0lQjSKaP598qjMixuYkZsRSLpGjJHxX6KAo0N5GJdzl8+P+fKeH//e0hnz458W8whglum/BXnoM/FN2hPZYV8ab0Nspu2nX6fktyUv5va56tNjCfM+BfWVWUdrG6mwko2r+esBZwiIqmhjXnzpGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=25gycr33; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="25gycr33"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso6619a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751366063; x=1751970863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp4bVSGoIFyW3QSZPFAFfubzk2+mLro6i9/ObDTSNoc=;
        b=25gycr33jzOPxfgfitWE2++05d9Yjm4ZG7O5Iws0y/AP0EG7wxVHDD98UPriKb1RiB
         pnWlqtYMZb+VGTkqIp7EmLQulU6Hhn0S0WPcDHFi/yTOZv+ORpzcPbcHrwlDUvBsJw5h
         XeBbQJ8iyNLx9jkhgzYPTCeegfla235zDdM4vzM1OM7W8DfL4Xyz7JU+SUfKj+9AiCbq
         C8ooIVx6JXE+M0mvVjklq0jpC/jDbSuBhA1DUikKSZp4Sr44wB5jHEp8rooqHZf2yzW6
         geV/6ofX8QnIz+lOm8SsGBEHSH+LhUo+0cBMpeMogUSjO0gExTHm/rcXIWwimHnK4mmN
         p2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366063; x=1751970863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp4bVSGoIFyW3QSZPFAFfubzk2+mLro6i9/ObDTSNoc=;
        b=kJD5Y3GnP/1cevO79fZvvSNrG10qP7kt31tk9N9wi0XzW5214dAEvOsGmbePQQhOmz
         m3gI9RoL18+s9ZPluzneQZzVauyg136v2mgxBA3v7duX2ptEwe5aFGX70KQtfFE/z9ld
         Uls2EkfJnd8BEYxb9kL2+s0UEsk7MvlxsqPeCZFrmo3ruu20l8O3a56bq3f2Yt5wWz5o
         5brzy+kkXUcDQo7VSHrgErWCPdhxv/UbbCydOp0W6QvmbCRc7J5lFkW8Gx3K8FMh1ufX
         y7MZCQjH76tgz9+MFXvjcVCBlNzSFEA8vSnwV+qJJyprrX6Pdvy8vJvYGbZ5De4j+CTA
         F2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWT+4y9xecEhFSGUej/LdSDKP5+zN884g06L/PNso2oqq2+Q3oWxZBrNC7DThuL+cGczWgbKZIa8hTotL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/37uFuzZ7UaiEy/mEI6kCz9LvKDElhvAyGDh15Zw8knzYVhUP
	DFzEWG5SWl4KNW1Bb81jLtW6u2G38kc7diXLJICgRwjxjjikUJ4KGQIWgNZa8kmAB1559+zUJAn
	iHP2shlxVH6zYnZj/aiiE3ca3GjqP49osE6vMLUA4
X-Gm-Gg: ASbGnctfWkHemCPMtkwOjPi9MyFxeTfiu6+y6Ei1GqC5pORN7a0mcuv1yrc4eAyx/Vs
	YjHJkxSsMBazNjyh1CjhGckOtRPzEzyD2tXBL62+EYIJMEEGsGSdadplz03ut4+F2y2BBCiA3Yt
	9Q1nEppRG8aTv72ZfTRfK/k223FeBy/qVzgMN/VF6ogKSAju5Tu6HBgXDa16m6QjBbZHSsYdg=
X-Google-Smtp-Source: AGHT+IECcsWBgg3PF6i48r44nlp9IbtTj/EJFncm5u1sICXIyrAefpX9CpH2gIQ3ueQKjUmMICOM70+9nQx4/JJS8NA=
X-Received: by 2002:aa7:db87:0:b0:60c:bf83:65fd with SMTP id
 4fb4d7f45d1cf-60e38aaa441mr50137a12.7.1751366062867; Tue, 01 Jul 2025
 03:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-x86-2level-hugetlb-v1-1-077cd53d8255@google.com> <9179e1cd-d635-4e70-931e-4a85c2e6932b@intel.com>
In-Reply-To: <9179e1cd-d635-4e70-931e-4a85c2e6932b@intel.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 1 Jul 2025 12:33:46 +0200
X-Gm-Features: Ac12FXxhb8kBzQck0JMDVfWECd6qOpwCqgTE5nperjslnwlAJZeksR8-H6YaZhA
Message-ID: <CAG48ez3YcgPz+oQ4shMjaviPNeZjJYg8K3iDPJkLaOKbcgASNw@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: Disable hugetlb page table sharing on non-PAE 32-bit
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Vitaly Chikunov <vt@altlinux.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:39=E2=80=AFPM Dave Hansen <dave.hansen@intel.com=
> wrote:
> On 6/30/25 12:07, Jann Horn wrote:
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -147,7 +147,7 @@ config X86
> >       select ARCH_WANTS_DYNAMIC_TASK_STRUCT
> >       select ARCH_WANTS_NO_INSTR
> >       select ARCH_WANT_GENERAL_HUGETLB
> > -     select ARCH_WANT_HUGE_PMD_SHARE
> > +     select ARCH_WANT_HUGE_PMD_SHARE         if PGTABLE_LEVELS > 2
> >       select ARCH_WANT_LD_ORPHAN_WARN
> >       select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP   if X86_64
> >       select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP       if X86_64
>
> Does pmd sharing really even work on 32-bit? Just practically, you only
> ever have 3GB of address space and thus 3 possible PGDs that can be used
> for sharing (with the 3:1 split configured). You presumably need *some*
> address space for the binary to even execve(). The vdso and friends go
> somewhere and we normally don't let anything get mapped at 0x0.
>
> I think that leaves _maybe_ one slot.
>
> Barring something some specific and compelling actual use case, this
> should probably just be:
>
>         select ARCH_WANT_HUGE_PMD_SHARE if X86_64

Yeah, makes sense. I was also thinking that it would be more
reasonable to restrict this to 64-bit only, but figured it would be
less risky to make this more specific change.

But now that I think about it, it's not like stuff is actually going
to break from this change, worst case the kernel memory usage goes up
a bunch in a very unlikely configuration... so yeah, I guess I'll
resend this later with "if X86-64".
