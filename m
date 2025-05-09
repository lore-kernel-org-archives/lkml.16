Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06594255F3B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746767625; cv=none; b=ejm/gccEQA0DcLbnGFB8wJFDA1ROJ5lZBqKX9Qi/G8LL8sZWIjNUPV8w/NwLy1PCNeVF6CxRyom2Fk11hYtujlUn95X3xJU/dpFAlYhHG8aNK74fsDb/cAPIgAUp3+RvVuL71k2V1akWie0LJHDeUUcB6ycnyqmqVvkucISPf4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746767625; c=relaxed/simple;
	bh=1KBaudCzRIc9vFdWIdSQSRNikGSHrK+kjrd86BIaK0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmIUnA6K8USDEmbWpLksjcUAS/3NVCW/BgsjYcQzLIrC/1KWxGsocUZlyE6pDZ5OzaZGqL7PFegW5d76iMj/7cry5x6sEfY2o1pXz/8uNrHKSVSwi/peAFR1+SWtOtkiGZW/IK7eHe7f6a1wMqL70hedVirHmd+EoTpb/Xy8bfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XPC35dpV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XPC35dpV"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso14664891fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746767620; x=1747372420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDLCK0Uz19/Y7Q6HkSbcnfKNXhJp+XeOV0z584wVfeg=;
        b=XPC35dpVdK6uVZV0O0WHISiPvzWVpf5mnSjcWH/mQ/SLUBtchU759jXJy1DnxNtwLW
         WiCgj2vHhqYz6d2Tzyr6Uw2wdvpJKkNsq66fs5c/aCYU3QURZs7++YSEX0QAoYM9hoCs
         wOvjMoSdpvo6PGiNzB7BHYCm7ttc0Aq0taTmk444dyOvA440h2ERpdUT9NnVdnRWAmq9
         HHNZKIH/scWTwlPoxGTl2p1xZamwS6/0F3y/ZkS4Nng8xToYvA2/tThh/J1N1efBcO64
         JafqvrBBZ/IP0MSgY43e1+EzstSaeCuh3rx8XcY2a1MxRdj/xOTXmwtGEeRY1zgAqUTs
         XDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746767620; x=1747372420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDLCK0Uz19/Y7Q6HkSbcnfKNXhJp+XeOV0z584wVfeg=;
        b=X/osMHc94XlQ1d1yYY8nJObqGwNfz+XXODPECgA5IbwznF0Ep8BID115UlrzKhg1V/
         s2uHQZz5eMGOGPbp9gGucuaN0dltOdkBm0QQVYVKaijWdwSTautgUeCByIPFdbCZEtMi
         U8gXLCrZBvrk4w3G2KddYx37mncKxkDFG/eoqd29M4DswMxk/f+PQWMqJNL14iwTjQ9j
         8S4X3KA8ExfKOnLLvYOyYmRJIR76/BkLgdFANASRzMR2Vvcj8VAg03sj8jeJDp1sw/qS
         48kVBpP2hoxUCIBI9wSehJLDxfgp0aMC3RDu2G2Anj9u3wz1EPalqJwDn1eRkKKGklIT
         QRhw==
X-Forwarded-Encrypted: i=1; AJvYcCVzsOSLo+mUcoGXESfG/bx6Oa+Dxcxgiog5FaOzxioP7aYXbfw2rTS3pW8gJuea3MjzqXx8CwKMu5k+pqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+gmk6dUbrKuQiwTIK1e66OqobiWS4KMtpFvL1kHeviuvyBNqG
	EXzj8c74I51wFrgJPxOoRxegt07WBxzkFxcornfMDX+EZRpQbK5Lfnw7N+QYWjfK+B+DDfbAHop
	4vXNv2pDvS8jezdJ+jip5eW7iqNAjFUlArqKFkQ==
X-Gm-Gg: ASbGncsVunSw+hrKI6CwO1HeoMw4emxeSv+/1vYfIIGS9f5tbFSyBc/+qIf4HaSC7D/
	F1yuju+0mP0ZJ/wKPpiDljbKkpBNad5L3xADA2L4Er5gbECIp3dQcTbm3C5nRzLjrQR84eYwtyi
	xL7TmIVF6BbG4HasdZxEuQxqk=
X-Google-Smtp-Source: AGHT+IH932onN3LtbuDsB2zIJMZAB7zVyXn9SdYNT5bEdTdpbtKDjtpG9xMpkEjuL1jvH3p5mBmUHA70IkrkqZGMWFs=
X-Received: by 2002:a05:651c:a11:b0:31a:466a:4746 with SMTP id
 38308e7fff4ca-326c4626122mr9560221fa.28.1746767619980; Thu, 08 May 2025
 22:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com> <20250508142842.1496099-3-rkrcmar@ventanamicro.com>
In-Reply-To: <20250508142842.1496099-3-rkrcmar@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 9 May 2025 10:43:28 +0530
X-Gm-Features: ATxdqUEv61ChnZUOzx7yPdXINdl80n6Z4DSE8-_2d7Qt3jd-BEsqt9upnD2bVHQ
Message-ID: <CAK9=C2XpNMmYu_MxcA390+SBm5fMSXYYJ37JeYGHa8OHjWmYqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: RISC-V: reset smstateen in a better place
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 8:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar=
@ventanamicro.com> wrote:
>
> This got missed when the series was applied out of order.
>
> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>
> ---
> Feel free to squash this patch with 376e3c0f8aa5 ("KVM: RISC-V: remove
> unnecessary SBI reset state").

I have squashed this patch into commit 376e3c0f8aa5

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 7cc0796999eb..a78f9ec2fa0e 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -60,6 +60,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcp=
u *vcpu)
>
>         memset(cntx, 0, sizeof(*cntx));
>         memset(csr, 0, sizeof(*csr));
> +       memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_=
csr));
>
>         /* Restore datap as it's not a part of the guest context. */
>         cntx->vector.datap =3D vector_datap;
> @@ -101,8 +102,6 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcp=
u)
>
>         kvm_riscv_vcpu_context_reset(vcpu);
>
> -       memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_=
csr));
> -
>         kvm_riscv_vcpu_fp_reset(vcpu);
>
>         kvm_riscv_vcpu_vector_reset(vcpu);
> --
> 2.49.0
>
>
