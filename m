Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555423F422
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 20:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748290399; cv=none; b=FP9bs0nAP8KBKPLU63PTiCscnOyJweHnZOfOK2PiqMUXKIn1KPFZbglmf4BtATtSFkc4KKzBQI35e6RTgldkSv467p3qbxAi59lKQTyNtgDo3q8AUEAvIf6W60fWOLpRkE/yVVKzAfWcIK2kI34sUjglmT1ZQT7PUYJtjTvMtx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748290399; c=relaxed/simple;
	bh=udre1uGBOac6motS58as4+M/iSTXL1UBy24ANEE9bs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqu+hFrUpLw4mhclJsluUmnr1SfODCw9fdOyFxjcdsj9y9L+Wt+uwU4iHomMrTTwNVuKBRSoWY+lETCsqzxDApAncs2hAVSuys4gDxfQ6Kc8W7Dt/iZooF6vCSKY/NMbD4qbZ639L9JBs7s4/6eApeojmMzkfBcwM2NjnGII86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dVi6KoAo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dVi6KoAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748290395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hM8pOHSOHM6og3y9wbI886KhOM4ZVpJTZ9nEg3CMFeQ=;
	b=dVi6KoAoOjxGLNDjB2ZCQQ6R7j7mKqlY4WeXdc8uVMmTZcYom17EaixbS8yB9gijPdmeoi
	ygUW/9D42prQm5N/paM3EtPMlWgJ/+Ovcfoa5P9IKxkt/bQ3m64lKWxkReea2u6WPeQKm/
	f/z5iYVcE9IMyWLy5eb1w2iW3PCnpTA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-2TMwL713MpqP_ai1MLaIAg-1; Mon, 26 May 2025 16:13:14 -0400
X-MC-Unique: 2TMwL713MpqP_ai1MLaIAg-1
X-Mimecast-MFC-AGG-ID: 2TMwL713MpqP_ai1MLaIAg_1748290393
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-445135eb689so16302725e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748290392; x=1748895192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hM8pOHSOHM6og3y9wbI886KhOM4ZVpJTZ9nEg3CMFeQ=;
        b=fDaMYDWf0I1F5rMJ2CH1021Q3DzsiXJrwngXH6bkSNcMLo/oqLMfIYNDk7SoodjjrD
         ag+IbYAskBBWPbPpl2MQs/v1a/1S/ZYESUmBO7ZGIngefaDwfPn11UrVPO6IQwtRMLrh
         s4VCvpu53J6iGDZI0sxvqzNLtwinjg+axfxvB0HAO3VknVgoT+3dONcynFkecZVguog9
         u19V3+0JBbjWUQoqGx0AYMVcUtpRGrQbiRCS84/2cpSpAenvwMUPYW9NYLuL5RI74R5D
         2GPBc6+i44jnfc26bk7jLPrSH9d9g0i3WmgsA31qZ4g1X1ExC/iE+cctaoqcC5ZxfLKM
         4p6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdWJSjpxgts5U9yhoCtVC66PQfiPtm/SsUD4RsCKEbLgBuyeQ8ubTXdK/+H/mzftH8NIqJR6r2CbIkQE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUzaDHeYUe2YB9cZ/Nyp56uJ2k7kycLXuWPdvdZGPzwlEvctNh
	2ajARD21dGOsOxC18gZnpWU0KsaBK65r81HwybjcN6VG2sKWkjmxJTte6ns0B4yM/MaNAVPE2Dg
	jzTuaApswh9qyLXvPzv9uMBw3IvyS5TLuDJAXdNEP5S1gFZRDxjvj8+nmi+6EdQsAfiMfTvvfs+
	fniu55KrrE64DkAFqUCPK+hVgLbcj80jemn3IQ2IKHiTg1o0xj
X-Gm-Gg: ASbGnctcbt1K85C6BGgwfGR60VoCVeF2ZP3NCBFyVWEUcNk/nrfsLRuNSmR+68HVZ+E
	dXSIQhyFmxb64AweOFcPhkhXNfScu698XIoLb90HY5EyzqpZc1z/u0TVwXqM3PE0e4Aw=
X-Received: by 2002:a05:6000:40da:b0:3a3:698a:973 with SMTP id ffacd0b85a97d-3a4cb49fa3bmr8695105f8f.59.1748290392179;
        Mon, 26 May 2025 13:13:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0+AxXJPizTpP9QoO5IXtFAO01qqghm8BjYyQ+skkTbjCSgR/3ySaxc11xbULNV7xS2YBFBlH2xIjzip8xtKo=
X-Received: by 2002:a05:6000:40da:b0:3a3:698a:973 with SMTP id
 ffacd0b85a97d-3a4cb49fa3bmr8695090f8f.59.1748290391828; Mon, 26 May 2025
 13:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522030628.1924833-1-chenhuacai@loongson.cn>
In-Reply-To: <20250522030628.1924833-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 26 May 2025 22:13:00 +0200
X-Gm-Features: AX0GCFvALzV40Zi8ewJWNPzDDkxsciCzCRalOrRxez99t8YObAZ1GdsLNkTkCX8
Message-ID: <CABgObfadeF0Er+M7Lv0kB0O1bugDk+_3jbwKU38Ju63YO7NZhQ@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.16
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 5:07=E2=80=AFAM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd=
21:
>
>   Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.16
>
> for you to fetch changes up to a867688c8cbb1b83667a6665362d89e8c762e820:
>
>   KVM: selftests: Add supported test cases for LoongArch (2025-05-20 20:2=
0:26 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v6.16
>
> 1. Don't flush tlb if HW PTW supported.
> 2. Add LoongArch KVM selftests support.
>
> ----------------------------------------------------------------
> Bibo Mao (7):
>       LoongArch: KVM: Add ecode parameter for exception handlers
>       LoongArch: KVM: Do not flush tlb if HW PTW supported
>       KVM: selftests: Add VM_MODE_P47V47_16K VM mode
>       KVM: selftests: Add KVM selftests header files for LoongArch
>       KVM: selftests: Add core KVM selftests support for LoongArch
>       KVM: selftests: Add ucall test support for LoongArch
>       KVM: selftests: Add supported test cases for LoongArch
>
>  MAINTAINERS                                        |   2 +
>  arch/loongarch/include/asm/kvm_host.h              |   2 +-
>  arch/loongarch/include/asm/kvm_vcpu.h              |   2 +-
>  arch/loongarch/kvm/exit.c                          |  37 +--
>  arch/loongarch/kvm/mmu.c                           |  15 +-
>  tools/testing/selftests/kvm/Makefile               |   2 +-
>  tools/testing/selftests/kvm/Makefile.kvm           |  17 +
>  tools/testing/selftests/kvm/include/kvm_util.h     |   6 +
>  .../kvm/include/loongarch/kvm_util_arch.h          |   7 +
>  .../selftests/kvm/include/loongarch/processor.h    | 141 +++++++++
>  .../selftests/kvm/include/loongarch/ucall.h        |  20 ++
>  tools/testing/selftests/kvm/lib/kvm_util.c         |   3 +
>  .../selftests/kvm/lib/loongarch/exception.S        |  59 ++++
>  .../selftests/kvm/lib/loongarch/processor.c        | 346 +++++++++++++++=
++++++
>  tools/testing/selftests/kvm/lib/loongarch/ucall.c  |  38 +++
>  .../testing/selftests/kvm/set_memory_region_test.c |   2 +-
>  16 files changed, 674 insertions(+), 25 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/kvm_uti=
l_arch.h
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/process=
or.h
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/ucall.h
>  create mode 100644 tools/testing/selftests/kvm/lib/loongarch/exception.S
>  create mode 100644 tools/testing/selftests/kvm/lib/loongarch/processor.c
>  create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c
>

