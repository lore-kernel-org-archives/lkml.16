Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92C4C74
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 00:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743813150; cv=none; b=eomoiqDqVAh30usq3dYMic3NYa0SgSJrsUXaMEZ7/sqp7Hu6KhMuDBkEKMbO57IZAkLonDubnBpF/Ca9bzidtEVCaC7+oOafgpv0oAg6nksC9jAVEW5ZJMAyWNASvVQP5izM0wclXfNDXmyKImI3NHDNPBgDEogmaKd9iRk3hME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743813150; c=relaxed/simple;
	bh=Sp6+0cwU9/FKMgxRKFjmZLvuoauBZNCxKbw0Q3jR9Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T17vFGtCd8Jxv92z3WqLhevpf8sgclfI+ImqqYv9JSClqpNlXNdy/ZBdXnb8lgueax/7FXuJ1wISexLJl7Go4APkSH1+cVeolOzfZFuoMos1jVy586N+yt1alUOnr75+CfMRx9CJvX4QBTzh8OTQRzzy7OEOzClG6W5A13B1Fyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b+znGhJP; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b+znGhJP"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8efefec89so22224306d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 17:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743813146; x=1744417946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG5OgA5u3r7SWYVRvl04U+VJKzgkH/slr5SK5HxcIr8=;
        b=b+znGhJPKQWZQU3bK3r8zjz6I8H+nkZ02nMRgsehsyLEL8phWtYtUrPslpkmHwbmuL
         unBfINr0aeG+wrkDUs5ptoI7knNxT/IzW1p+g+w9b7jW1sxaXhkOdyZhmhk/lz3Kej9h
         srRp0Wvzmt4Kj+uKWD+yYZlcm3X0TDtF/HVT75IOMYpNkdJ5UXTpmt7vPJkDBxv+EST3
         q35aHD9CEstkH/1vtzGycDqMcOurW9TOQLrK6Z3/xCkaO8GyvsWTr6lON00kfbKi84Tr
         HEmkoIlU6oQprpJ3W5Ifz2faxJMOLDwpCg5Rq96llvqv3Wiphj8nKjtUOzn3CVGrHE/c
         YwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743813146; x=1744417946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG5OgA5u3r7SWYVRvl04U+VJKzgkH/slr5SK5HxcIr8=;
        b=Ue4mHaJ9WQ05iqu/qgLM3ZhMClJYHs4HWZDAtuoVmLsCBAEfBWU7zgAEWWb1rwLbkm
         7X4Al22b2o+oTyEcVKML3y6vXg3c2//SnCL0GSlNRgMy3/0gzMryzGjOjJYlyLKJpLve
         JEE2Z+ZQk39DxlV76v9QHDLenQdono/KnRabcTleYp6jnIM9Sp0KpFivR8RwP8BFOn/d
         wx9fGi94sZKqDzOFt4MMDzMkbiqaU6sWwfRi3RWSj+S9OZDa1pqdKC6kPvm9Lx9NMNMw
         qc8JRAkWotRZgvA6k6zn+RvcMVmXYsT26aKD+icwSRBIvNqExbYCLzr8evjYPW6fW8lx
         ZkDw==
X-Forwarded-Encrypted: i=1; AJvYcCUeHJRG5vXw961O8zZ8FjSPpMQ0ooONZhJ79uehYXUcFoB1B0I/0hhj0Pr8XXloPo0LmEEU4Xn/qVNtD/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfwiwj6fbUFyJdPLge0EO1zuvD3P1x/xzdho36tMU59hJjcE/
	XgChHqxaa2EibvHP88zJF6L5K76C/W2pyfrqGhWT33RtEbzz/vYE6mNcxXjNEEwrdy+OSGlhVqM
	2XtervT1vUQbaITv4hEUAy50tiNBso78k48OP
X-Gm-Gg: ASbGncsv/068P+SAKoCyQmmyWAQntjnZaMGna15AarkRpt/5MoQg+X2YGGzvy1saguo
	CC06aD5gPcCUb6FU56ezu0q9BUXwiRxlrtPKjTBZrK6acAEstqbcVofJVNMeTOtmLIIjk/EW1F7
	gJOVqlO65pRS1Ro69igMm2E/+j2xzE
X-Google-Smtp-Source: AGHT+IFdsVd/lCa/5EHlC59IfCvD5ejt4ymZP3PtjMovWWTZHQUVaynKa8ekIZOHGPXU7kyqQ3Dv7qIk0/P6Afy4pSo=
X-Received: by 2002:a05:6214:212e:b0:6e8:f4e2:26e1 with SMTP id
 6a1803df08f44-6f00deededemr91976776d6.20.1743813146236; Fri, 04 Apr 2025
 17:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250405001042.1470552-1-rananta@google.com> <20250405001042.1470552-3-rananta@google.com>
In-Reply-To: <20250405001042.1470552-3-rananta@google.com>
From: Mingwei Zhang <mizhang@google.com>
Date: Fri, 4 Apr 2025 17:31:49 -0700
X-Gm-Features: ATxdqUEh8xXy0f-Tg56BnLvVp3zRksb0Z3WI3QPNIi_wEpzrRIgGyHaX6LOUeOs
Message-ID: <CAL715WKaAHSgUhtMMT3Ztw90mMoHpVLdKUgVM15xx6yoUws9+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: selftests: arm64: Explicitly set the page
 attrs to Inner-Shareable
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

.

On Fri, Apr 4, 2025 at 5:10=E2=80=AFPM Raghavendra Rao Ananta
<rananta@google.com> wrote:
>
> Atomic instructions such as 'ldset' over (global) variables in the guest
> is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
> DEFINED fault (Unsupported Exclusive or Atomic access)). The observation
> was particularly apparent on Neoverse-N3.
>
> According to ARM ARM DDI0487L.a B2.2.6 (Possible implementation
> restrictions on using atomic instructions), atomic instructions are
> architecturally guaranteed for Inner Shareable and Outer Shareable
> attributes. For Non-Shareable attribute, the atomic instructions are
> not atomic and issuing such an instruction can lead to the FSC
> mentioned in this case (among other things).
>
> Moreover, according to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte
> load/store), it is implementation defined that a data abort with the
> mentioned FSC is reported for the first stage of translation that
> provides an inappropriate memory type. It's likely that Neoverse-N3
> chose to implement these two and why we see an FSC of 0x35 in EL1 upon
> executing atomic instructions.

nit: It's likely that Neoverse-N3 chose to implement this option (the
first option) instead of reporting at the final enabled stage of
translation

I have minor question here: The DDI0487L C3.2.6 (Single-copy atomic
64-byte load/store) mentioned

"""
When the instructions access a memory type that is not one of the
following, a data abort for unsupported Exclusive or atomic access is
generated:

=E2=80=A2 Normal Inner Non-cacheable, Outer Non-cacheable.
"""

So, the above is the "Normal Inner Non-cacheable", but in our case we
have "Normal and non-shareable" in stage-1 mapping, right? I know it
is very close, but it seems the situation is still only "one bit" away
in my understanding...

>
> ARM64 KVM selftests sets no shareable attributes, which makes them
> Non-Shareable by default. Hence, explicitly set them as Inner-Shareable
> to fix this issue.
>
> Suggested-by: Oliver Upton <oupton@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>  tools/testing/selftests/kvm/include/arm64/processor.h | 1 +
>  tools/testing/selftests/kvm/lib/arm64/processor.c     | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tool=
s/testing/selftests/kvm/include/arm64/processor.h
> index 7d88ff22013a..b0fc0f945766 100644
> --- a/tools/testing/selftests/kvm/include/arm64/processor.h
> +++ b/tools/testing/selftests/kvm/include/arm64/processor.h
> @@ -113,6 +113,7 @@
>  #define PMD_TYPE_TABLE         BIT(1)
>  #define PTE_TYPE_PAGE          BIT(1)
>
> +#define PTE_SHARED             (UL(3) << 8) /* SH[1:0], inner shareable =
*/
>  #define PTE_AF                 BIT(10)
>
>  #define PTE_ADDR_MASK(page_shift)      GENMASK(47, (page_shift))
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/te=
sting/selftests/kvm/lib/arm64/processor.c
> index da5802c8a59c..9d69904cb608 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -172,6 +172,9 @@ static void _virt_pg_map(struct kvm_vm *vm, uint64_t =
vaddr, uint64_t paddr,
>         }
>
>         pg_attr =3D PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE=
_VALID;
> +       if (!use_lpa2_pte_format(vm))
> +               pg_attr |=3D PTE_SHARED;
> +
>         *ptep =3D addr_pte(vm, paddr, pg_attr);
>  }
>
> --
> 2.49.0.504.g3bcea36a83-goog
>
