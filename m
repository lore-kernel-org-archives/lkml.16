Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C12D5C99
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813959; cv=none; b=TntUL7CH2qz93F1kWx5RSVttM8Ladv2mEA04paTE0DMQq3O1+enzLgw2YiHK332fa0+ArETGLqh0cLs8IKtmQJQb+ZuhJXdEbSXxDTjN6qeTSI3H2yUdwjn7Vsdd4FHLm7jW5JmfSXgsz9Bo8c5jbSGKFp/MAUxLF981v9QuFKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813959; c=relaxed/simple;
	bh=pk9HppbaBEfEzasCa8/FcOZZbSVG39tJMmN6FNqxJZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5UXwjmulW4tNKmc0lzCq4NcKVZ1i1IKvWCb+KIrFcY2rV2Hij1Ut9prQNm21E5H7/4DaPD8G0VqwkUp3nMDOAyz5gh/KzdTQjyqGOfrkNP1fbh450Fn+V2FuqHToBkHCc2HiOS2PfwuV5tC9pwN1raPp4evoGYA3o5nBb/MEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jb+4zaY3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jb+4zaY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749813957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtTPCernLeO8trjul5Ba7rf8xkqDU8wN6cWgKdmxGDA=;
	b=Jb+4zaY3hv2sF1tjlkYqjSCbUlsCMa2jIEhdfHrbuqPbKamNLeqeCYpwuMixXKRQpYsOTJ
	hXiim+g4aEs70toYQEJSUM5gaPc4CBTJy566+xhahFZ2ZSg/rkYK9NL35SLtE4mn2iPfEQ
	zfCfxAfAGGP/vOten2xruQiYxTLJJmg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-dUz6T8ZLMY6M_ro7OrfAiQ-1; Fri, 13 Jun 2025 07:25:56 -0400
X-MC-Unique: dUz6T8ZLMY6M_ro7OrfAiQ-1
X-Mimecast-MFC-AGG-ID: dUz6T8ZLMY6M_ro7OrfAiQ_1749813954
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so1323314f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749813954; x=1750418754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtTPCernLeO8trjul5Ba7rf8xkqDU8wN6cWgKdmxGDA=;
        b=uXMZ8X/2z9glMdc8JqLfSc/mmESXFrnE2fihCeoTlBExkXTZkiyJgRFMY+6Yn/buB8
         bIGmXMm57Pacxfv6Nrzd29Iy0VNHJFMudHqXVQWMKgpQ/n+K1G60qU14P0ufxbj5Il91
         7bnHMXljBMmJnQIqXswRbpfnWJSD3+TNb+url5buptMmXgiRiyKhoJ5INjGwT/pUsyI7
         a9y/pOcpnWHfqSs4heZdGUWqiTgMJMgMc81CNMAusLiNoI822F1iFpyYmx31H1woyg9c
         7UdKwRq8kmwQMw3d65uan4zU2Oclh457zii1r5b4URxQl+ZsqyMkFiXJzD5jDCtm7Gp+
         pKdA==
X-Forwarded-Encrypted: i=1; AJvYcCWvJ1vL/dcOyi3Hq7QxfIAW9QdXzysNnoaPXCOT4r9nn7CRuFHRHU0Vvu+ulHPSqGIcHMLQ7mD4OQbfow0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+WR0Sl3h7FbbXi7dOx5hb/GGgB2xIP/kfJT8FrH5oe+mswJC
	HrItAKGs6m5kAqcIctavJbbUcqH7XNLvZX+ovtF4BWgu0LLDbYbidXxZs79uwqYGXiKdP8XHZ5F
	eP/URCZfGqNfsMXnV83Uc2OOBvuCy1qgXdLI3qeP084uvb3pZAb6lodlKlHAQs4NActV2WZ+MX7
	6FuYD0Dw12nhFEaXs/eOjFawLNAmZYUepjjtGos3Id
X-Gm-Gg: ASbGncvfdPwhaHuLRPKjV731HkUcy96l+0vny+DFCO8QURVt11k6bk3QOYdFrKJhbfW
	uwNVtiKMEtbtQkE150WbZe1W7isXXnyrIsmrXHzpUCxlNbXyXK1p869iCCFg5FRb8tCmbNTNEZ/
	iQzw==
X-Received: by 2002:a05:6000:2088:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a56876b131mr2099562f8f.40.1749813953763;
        Fri, 13 Jun 2025 04:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMld/3x4YDwMh90w2NXyk+VWJ9yeQ982c+CE56+xJI0QCBv9oJAuu33eFBBEhkpIF8/oIrlYNLdizJLcDlXXg=
X-Received: by 2002:a05:6000:2088:b0:3a5:287b:da02 with SMTP id
 ffacd0b85a97d-3a56876b131mr2099541f8f.40.1749813953402; Fri, 13 Jun 2025
 04:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613111023.786265-1-abinashsinghlalotra@gmail.com>
In-Reply-To: <20250613111023.786265-1-abinashsinghlalotra@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jun 2025 13:25:35 +0200
X-Gm-Features: AX0GCFsG0Z1jia4q1FPk20VzM1smi77t2aAcOYaXOXqRREflDaqyTL_Wz5tjY4E
Message-ID: <CABgObfbGXpEWtfYNYsEhEANNaR+1to1U-O0s5h1bBsY-u2384g@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: x86: Dynamically allocate bitmap to fix
 -Wframe-larger-than error
To: avinashlalotra <abinashlalotra@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, vkuznets@redhat.com, 
	seanjc@google.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	avinashlalotra <abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 1:11=E2=80=AFPM avinashlalotra <abinashlalotra@gmai=
l.com> wrote:
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index 24f0318c50d7..78bb8d58fe94 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -2005,7 +2005,7 @@ static u64 kvm_hv_flush_tlb(struct kvm_vcpu *vcpu, =
struct kvm_hv_hcall *hc)
>         struct kvm *kvm =3D vcpu->kvm;
>         struct hv_tlb_flush_ex flush_ex;
>         struct hv_tlb_flush flush;
> -       DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
> +       unsigned long *vcpu_mask;

The default KVM_MAX_VCPUS is 1024, which is not too bad; you're
probably compiling with CONFIG_MAXSMP and accepting the default limit
of 4096. Adding an allocation for every hypercall is not great, I'd
rather add it to struct kvm_vcpu_arch* instead.

If instead we go for having the allocation, you can use this:

unsigned long *vcpu_mask __free(bitmap) =3D NULL;

and avoid changing the returns to gotos everywhere else.

Paolo

