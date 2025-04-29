Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C52D321A;
	Tue, 29 Apr 2025 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936735; cv=none; b=oMY+tQuVev0pahFrS8oOCjw/s1d7i1Ox9UOcYXwa7BRXX0hZVMjbCNvznzcT3nKZiS2mOvf8YwZWE2s0rhfQ68DX+qhTahT7pUuMoV09qhFTfxzhZ14z0U4UN8SORJ3rpr1iayUvtJ6nu9C+lYyNO5ZMI55tM/R2h0gKMT6Y5y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936735; c=relaxed/simple;
	bh=HHHetzLClcVyYWk8l98u58LIcuM9dJ1z/dYCNokcUQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjJSLotYhPQ9E9cSPax24pxgxiIhxpJUnlGm4MJ01Apy6odOlT7TfYJX5ufMg6w/ygBA7Zg/Rkz8uHMR71CWEjK1rSqSuXkbh5VRiZ8tmef6RbvTNhgB5u1kLq3bdb5FH2f5yxcW1Whm3t4pA/oQoIqiRPKPrBb+8j8EOoXpSAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0JJAKMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0JJAKMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01254C4CEEE;
	Tue, 29 Apr 2025 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745936735;
	bh=HHHetzLClcVyYWk8l98u58LIcuM9dJ1z/dYCNokcUQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V0JJAKMSEGVTjCwPFtyo8go+iibWfKjH21D3IHWH/elVlYCuBN6XNSH8v3feeDIRj
	 4DduDmZNPcPI00kLYwDAtJRtRtrf23mVgOcgzRGRGqG8DZMLXcX/HIW0VHzAAEDpgf
	 t3OHbqJAMKEHDxRciwllPq6taUB1x7mNMTzvSnXA48xZXrJ3uqFUIfNusUAp7BamBG
	 A/6qGRqV+k3nBx5tVaghxlU8bBd2265WD7ojHMsEg3C3JIO4PDTqmBg6JEA8Raekmc
	 7fpXRCbUDgPqY0W868RyW1OFiGhLNTTwY5oi7VTc5ygv4cwX8FmB2Ddp5UJob9jPzx
	 RjjA1XGQhWQcQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso7807846a12.1;
        Tue, 29 Apr 2025 07:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDqE5mnSIiiToCACsLun7epkHLfErzHK0hss3fAvACBMHqQCCWtMTCRqJELOwmzuKnmo+YsFOfuHuz3Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGchZh7xdCaHC4LYgyK1VnO2U1+uciTCnhDiErVlSJKGnVFg0
	ATcZCCJ5XC3zGRftFntscEZqDd+lRZ/CDpDts/JptyhHpvdlO58FTLN3v49Sf9hzl+UvV2Fj3E5
	Vqgm+pBnPFnjslLnHirfU3Eor9w==
X-Google-Smtp-Source: AGHT+IHfroQjiVVCpl99LNHJxjRUar4RVaGCvkl0v3xBaP9iBGHIfGCUcloWbvPs8CSF2by68p4lpBN+j6whe6viwkg=
X-Received: by 2002:a05:6402:4304:b0:5e0:752a:1c7c with SMTP id
 4fb4d7f45d1cf-5f839204819mr3535728a12.1.1745936733598; Tue, 29 Apr 2025
 07:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422084340.457-1-alireza.sanaee@huawei.com>
In-Reply-To: <20250422084340.457-1-alireza.sanaee@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Apr 2025 09:25:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mDoT=XFcPzx5V4dREGfBSGpWo6cnVo0-dsa+dD2tc2A@mail.gmail.com>
X-Gm-Features: ATxdqUEHELZ1OjOnNJfx6ZMPIlivh56dcvLWcKfe4o76j4u1lowH3t3yLvFF3WI
Message-ID: <CAL_Jsq+mDoT=XFcPzx5V4dREGfBSGpWo6cnVo0-dsa+dD2tc2A@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] DT: Enable sharing resources for SMT threads
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree-spec@vger.kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com, 
	linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 3:43=E2=80=AFAM Alireza Sanaee
<alireza.sanaee@huawei.com> wrote:
>
> This patchset allows for sharing resources between SMT threads in the
> device tree (DT).
>
> WHY? Given the current use of the DT, it is not possible to share L1
> caches, as well as other resources such as clock among SMT threads.
> However, DT spec in section Section 3.8.1 [1], describes how SMT threads
> can be described in the reg array, this is how PowerPC describes SMT
> threads in DT.
>
> CHALLENGE: Given discussions with the community [2], it was apparent
> that it is not straightforward to implement this, since cpu-maps must
> point to a particular CPU node in DT [3], Section 2.1. However, it is
> not only the cpu-map but also there other nodes that point to cpu nodes
> which indeed need care and changes.
>
> SOLUTION: This led to more discussions on what the solution should look
> like and based on recent converstations we ended up with the following
> approach [4].
>
> core0 {
>   thread0 {
>     cpu =3D <&cpu0 0>;
>   };
>   thread1 {
>     cpu =3D <&cpu0 1>;
>   };
> };
>
> In this layout, first parameter is the phandle to cpu-node and second
> index would be the local-thread index in the reg array available in the
> cpu-node reg property. Further, when reading the property in the cpu-map
> we must know how many parameters phandle has in cpu property. Therefore,
> we optionally introduced "#cpu-cells" property to indicate the number of
> cells.
>
> [1] https://github.com/devicetree-org/devicetree-specification/releases/d=
ownload/v0.4/devicetree-specification-v0.4.pdf
> [2] https://lore.kernel.org/linux-arm-kernel/Z4FJZPRg75YIUR2l@J2N7QTR9R3/
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/cpu/cpu-=
topology.txt
> [4] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=3DD8K+=
+mXHq0Rmv=3D1i6DL_jXyZwXAw@mail.gmail.com/
>
> Alireza Sanaee (5):
>   DT: add infra for finding CPU id from phandle.
>   arm64: of: handle multiple threads in ARM cpu node

>   driver/base/arch_topology: update CPU map to use the new API.
>   driver/hwtracing/coresight: Use of_cpu_phandle_to_id for grabbing CPU
>     id.

You kind of have the path, but it's 'drivers' not 'driver'. In any
case, that should be dropped. Use the prefix of the particular
subsystem (git log --oneline path should tell you).

These 2 patches do the same change. Use a consistent subject.

>   DT: of_cpu_phandle_to_id to support SMT threads

Patches 1, 3, and 4 are useful refactoring regardless. They should
come first in the series.

>  arch/arm64/kernel/smp.c                       | 74 ++++++++++---------
>  drivers/base/arch_topology.c                  | 12 +--
>  .../coresight/coresight-cti-platform.c        | 15 +---
>  .../hwtracing/coresight/coresight-platform.c  | 14 +---
>  drivers/of/cpu.c                              | 45 +++++++++++
>  include/linux/of.h                            |  3 +
>  6 files changed, 100 insertions(+), 63 deletions(-)
>
> --
> 2.43.0
>
