Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BD6247DEA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734808; cv=none; b=IyjcmzkQhl3PiR4gXB28m/zt5PuucJ/vA/KhcUSbR/k7uktIxjXV8UWH9FQj7wllbMYaYHhcs0j5+EzkagzAujAs5uQ8Ezf7K1Ecb2ZmWSeezQEeC5kjNn/OS8PjHrOFunqPC2x9Hlw4NXBn2uF5QTAjZH/KlRCfhP8cUYzizHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734808; c=relaxed/simple;
	bh=CVQ9VovITFp4al3duc780000P3ZE3EpGg5M4UugODQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtimHL/YxQS6+6Fv+ld5Hj8UrNwTVYOaXVu2DSdyrr+Xw40k/Mc4fkkCiOLeDr3GwTPqCOqZsmD1mS+7X8IYTx8TjOqIH0qyuFUl0WH67+OFqvAvTnooJpPX6/YNQ7sm4vr21OlPeIFVriZUA4/gLO9RlrSamiCnG8zdjblFI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=Uh9DXPNF; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="Uh9DXPNF"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ddd6f2d911so4042025ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749734806; x=1750339606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eN3swV8AIIuWWlJ3gYBwChYsvkIrC7SYyJzazn/BSI=;
        b=Uh9DXPNF0rmS4hO/A2moRXrF7EqWLUsG33MFYRgsajNC+EyEIi15DBT6cUAcUeDr/O
         Y8tdbyH4SurOAhZ9aKgO1Sqb3u9Ex091HtfWSLd0mVvWqHAWSQWk3ggvl8CDiiIvXbVs
         SRot/VnAGpn4VMGeJXmjeTZ0jVYuiHX2VPtNolzSRajwi6zsNeCAcVz6nzmySNonBL07
         A8FkhwUzuLrbDmp4cDs1WiQOGYqjYwNyVuD4UvlSA7cXIX7boYEr0vYecdHeFuYe8TYD
         j0vUmpCPgi7C4ypudoQ4bupP6YKcrU7elqQDGfzJ/8kXZcV/20+dP4sw/alXG/LfIZA7
         DUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734806; x=1750339606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eN3swV8AIIuWWlJ3gYBwChYsvkIrC7SYyJzazn/BSI=;
        b=p62DrmQrlnJ9zuJpNtC273dwvDDDzvOQyak270brf5SKQgxAxxeOR48/+UrZPExfkN
         GLb8eBRj5G+oP9ApecEqcyoZ5BSSCmeEUaaSh9XTzXfW5d+wRSE+QGKB30mcmyQ3GVPS
         VABRDT/rzAldzpEJmp9YaaFhcjTL6rd4jdVtzUhi0vW2ZZuK6TLKgBpWtQyXfWDP6QoU
         mfqXamlBHVBYbzzsF5D9G1vPhbKJ3PZmGy/UqXsRHq4ptMJCPgYGBwcWa6ccgtvdhFyB
         aUAD68x33SCMtgVGJA61f1MpfeLCy6QzP/VfUdFQoGAAn0zQsqOU10zqQ+jJu6OIg87a
         fuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvX0PIXn+9IbXjM2weyzEkDcSJixdxQwbVWU+JkKPoMiYiATBrLYLFvTduuC8SMCb5av56pSomG9C+Rz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQD+04GVM1dPaIiUHwaBtNI4tBCZSFwyZbQbfnbc4uVPZMMxvX
	EiSePzyv+Qs3XloXHT91r+ipLr4Chv027KAnsWK8w2OkdJ8NzurmywTVSku/luW+QiSVDsnVI0V
	GGuzbpiU0AqW7ozCJUc/HlOsIhT0qApFW/Ou5m/HLhw==
X-Gm-Gg: ASbGncvdzcuI7IbOA0LxFSDn+HJj+b9f312v5WudXEn+90cdIutfhO/exDHc6cuTtwo
	zoaWdch4DAJLiJXIJcEMPpRcU5r9kZWaLEGL2ArUbqn+3h9BY0SJLFkQTABrZP0YvOCV+SOfkEy
	UkmLahBkxR8KIq3vG9fcRQJKtkoPoySdwE/U/iHcEYe0kz
X-Google-Smtp-Source: AGHT+IG2iBZqXBZpblYqqV1CfizkbcXBVYuUqCYGloOAj0H2lvAJwOXwnS5XNnZkQ46BncD7OmhOhE+Hobvx1RtA1UQ=
X-Received: by 2002:a05:6e02:1807:b0:3dd:8663:d182 with SMTP id
 e9e14a558f8ab-3ddf42c5b4dmr72461125ab.13.1749734805782; Thu, 12 Jun 2025
 06:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-15-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-15-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Jun 2025 18:56:33 +0530
X-Gm-Features: AX0GCFtHBaD1dkadFboJHCaCDko1UoltJB37LuW30sdZ0j57mmaziXXBSUbao7Y
Message-ID: <CAAhSdy1qnRYOh0ka4PeJDf5ybviMrf+bpYaOOka3BXVmwAPSoQ@mail.gmail.com>
Subject: Re: [PATCH v8 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 3:53=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
> misaligned load/store exceptions. Save and restore it during CPU
> load/put.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for Linux-6.17

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index b0f66c7bf010..6770c043bbcb 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -14,6 +14,8 @@
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_sbi_fwft.h>
>
> +#define MIS_DELEG (BIT_ULL(EXC_LOAD_MISALIGNED) | BIT_ULL(EXC_STORE_MISA=
LIGNED))
> +
>  struct kvm_sbi_fwft_feature {
>         /**
>          * @id: Feature ID
> @@ -68,7 +70,46 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_=
feature_t feature)
>         return false;
>  }
>
> +static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu=
 *vcpu)
> +{
> +       return misaligned_traps_can_delegate();
> +}
> +
> +static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu=
,
> +                                       struct kvm_sbi_fwft_config *conf,
> +                                       unsigned long value)
> +{
> +       struct kvm_vcpu_config *cfg =3D &vcpu->arch.cfg;
> +
> +       if (value =3D=3D 1) {
> +               cfg->hedeleg |=3D MIS_DELEG;
> +               csr_set(CSR_HEDELEG, MIS_DELEG);
> +       } else if (value =3D=3D 0) {
> +               cfg->hedeleg &=3D ~MIS_DELEG;
> +               csr_clear(CSR_HEDELEG, MIS_DELEG);
> +       } else {
> +               return SBI_ERR_INVALID_PARAM;
> +       }
> +
> +       return SBI_SUCCESS;
> +}
> +
> +static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu=
,
> +                                       struct kvm_sbi_fwft_config *conf,
> +                                       unsigned long *value)
> +{
> +       *value =3D (csr_read(CSR_HEDELEG) & MIS_DELEG) =3D=3D MIS_DELEG;
> +
> +       return SBI_SUCCESS;
> +}
> +
>  static const struct kvm_sbi_fwft_feature features[] =3D {
> +       {
> +               .id =3D SBI_FWFT_MISALIGNED_EXC_DELEG,
> +               .supported =3D kvm_sbi_fwft_misaligned_delegation_support=
ed,
> +               .set =3D kvm_sbi_fwft_set_misaligned_delegation,
> +               .get =3D kvm_sbi_fwft_get_misaligned_delegation,
> +       },
>  };
>
>  static struct kvm_sbi_fwft_config *
> --
> 2.49.0
>
