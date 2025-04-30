Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91391A3177
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027251; cv=none; b=WClpZOB3kTAH6D9ArF2+HiEor/w1IAQPl+Vk0+WsRYepMQOgdnmiBrpZFfe97LMTg9D6SGBs3db4VYOkJIENhS+Z22PTKJHVubM4iwrzEkPN8V6RKoeB1saLtY/PFk6LOxxM7Plym/c2Pr8XIU2AFCAX9J0PBZ58g3URk5zucaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027251; c=relaxed/simple;
	bh=U8PfB3vRdSpLPOvw/HbrFY+hQ9DQyYoBFwqRognx+kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaJKgLzFFLDa7xfhef5nM3X5fZlZIAcZ5WJF8U9SxD9BQ0RddUIkFq+l9s9d+Do5I9btt6DgpFmjFZLAxvgQfktUEo09etuVPZaxYD7Cj0jgEhQY2Q179VAMATW7GskslbYL0aM3x7VMsKGvI/nuqS84EBuWCZZyTnbNPtEQg8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P5WlaSgH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P5WlaSgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746027248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJoPaucZIFnXnjQ/FLCpU0B/Hs2NKUJWGsU9FtU7bzo=;
	b=P5WlaSgH4eCr6o+osADaJYIWi8JaafLYd9X5H9GG2mmIi5Ug8Z4xnpcMtQGqTgcC3KqDyQ
	yVCEp2xpEYqO4RqCoedJNmtHhC2OA5+mBofIA4tDb0gBgr/2NWMKgFrfMir4uRUPz5FgRu
	NSAEAs3cCDJXUzI5FuXNCLI0xdidQvE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-I8jBXFThNBe1quFC0eRMKw-1; Wed, 30 Apr 2025 11:34:06 -0400
X-MC-Unique: I8jBXFThNBe1quFC0eRMKw-1
X-Mimecast-MFC-AGG-ID: I8jBXFThNBe1quFC0eRMKw_1746027245
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so2620403f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027245; x=1746632045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJoPaucZIFnXnjQ/FLCpU0B/Hs2NKUJWGsU9FtU7bzo=;
        b=nzAKCaze/iY+2ZXfw6+hFH3efs1YQvmPF0Wzzjjw794t+oeAbKWg+2KZCvWNJ/QDaO
         5V9MFWwm3JoxkXeImiBoC/JD6GkTQ+T/CO/KSgYEj6GGxlETKf0PkZFlMDRz7dDM9TPA
         1qHWcg+CtxOJTr0bpG7efNe+NmwJgXOwC6KaFsMovmn3vIH2Xw7M660BnOqASRpntGnX
         gC9HnM0CySs3lpGC8Da3XSbyrbweo4jVt3sF/JVEmx/cW4Bc9+/JdLAoOd2TxpoRBdGz
         rvIHMK7T8JtvnRg+lkmNX9+ckJG0VsiUdjMM8KM21b/kvmrtLeE3as58kGQbIYbT7S/o
         +Gfg==
X-Forwarded-Encrypted: i=1; AJvYcCUI5jkUQbT+vJl0mAAiZly8VEKUYfqIFpiDyQph0mVK1r5h0ykwmHY4SQtoopZxOwHl1e0eWEdcqBXhJ7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YznYJj5U1Sl9TJHatvuy4sOj0z3MIu5UCIkjoGU5DOk40T+HtdX
	PWjY54gvXdx/LceUo8sX8lCnfmyk8rvy3xFGoSj9LeX7Y2flildTEq2kPIaOSWU6HNUHDA17DXg
	qzVKDyy4gmYSQKmFp/Cfi7Ez15CXfcttmw3sYBDmaMGdAapCbiphPEJQG09s4JQt+zrdLU3CuGR
	Suw2Oq2PyIa0cIcTytVgQMrjqvmmpZyKT6r+QR
X-Gm-Gg: ASbGncvrErgvV+JOlsLLQY1K0xMh0CQl6Fm7Mx0A2k7cqwvL710cUAUPCBA17o1bFcP
	5okLCZxyROWXuGI9tKhriG6eTwXKnVLYMp0hG18tREtVEfrJQSPlEJqAAPk+VjR6E/Cc=
X-Received: by 2002:a05:6000:2401:b0:391:412b:e23f with SMTP id ffacd0b85a97d-3a08f765388mr3341420f8f.15.1746027244915;
        Wed, 30 Apr 2025 08:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHov0v5K/n6/DRccdHjKs5WmhgmpFrJkqxQNq/Ywqeh0XLYmlSqiXndUXHVAiZ/ZlcAJ4dhe3vZdGR3coN91jM=
X-Received: by 2002:a05:6000:2401:b0:391:412b:e23f with SMTP id
 ffacd0b85a97d-3a08f765388mr3341385f8f.15.1746027244490; Wed, 30 Apr 2025
 08:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
In-Reply-To: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 30 Apr 2025 17:33:47 +0200
X-Gm-Features: ATxdqUH8YC4jX0Iz8XoZNaSKHHlD0K50_lPFdPbF6ryiUzBGB2fjQyjacawuu7k
Message-ID: <CAASaF6w4Y5oH+eWE_ap95H_zpewbjs05xY77oCfZd91qy8d5cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] vdso: Work around and reject absolute relocations
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 11:23=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> GCC on arm64 would incorrectly emit absolute relocations in vDSO code.
> Work around those and break the build if new ones appear.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Link to openend (invalid) GCC bug containing more explanations
> - Refine commit messages
> - Don't fail on commit absolute relocations in debug info
> - Link to v1: https://lore.kernel.org/r/20250429-vdso-absolute-reloc-v1-0=
-987a0afd10b5@linutronix.de

Tested-by: Jan Stancek <jstancek@redhat.com>

v2 works for me with both reproducers. LTP syscalls run passed as well.

I did a scratch builds of latest Fedora rawhide and ELN with this
series, both passed on all arches:
https://koji.fedoraproject.org/koji/taskinfo?taskID=3D132140190
https://koji.fedoraproject.org/koji/taskinfo?taskID=3D132137468


>
> ---
> Thomas Wei=C3=9Fschuh (2):
>       arm64: vdso: Work around invalid absolute relocations from GCC
>       vdso: Reject absolute relocations during build
>
>  arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
>  lib/vdso/Makefile.include                  |  6 ++++++
>  2 files changed, 19 insertions(+)
> ---
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> change-id: 20250428-vdso-absolute-reloc-a226293c1761
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>

