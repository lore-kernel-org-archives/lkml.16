Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B775220689
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748514303; cv=none; b=s2mUB0DIHoIMJwsVWaT4YoeFhlTb+xi+Jnv+91FF16W7x/BGM7Jx/gkQo3/d+G39AXpF2OCQ3Wz+c/AyhAth9yFHn1COa2ZxzX7bUjnSicDEixG6NX246azWWmkMzrM1vnu6yaikXHk/+5WgILnNj/ojEDj+Xy4GMKqIw8GlcLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748514303; c=relaxed/simple;
	bh=ijK9RmqfsG2yNDQvjoza033ZQX6u/cC2iUM8d10DIIA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Gp5jv90jg9XxwuzSL0jFmBjL7CVOgFgtdm8ZVFO/FtP/G+/szSjCbWOBCwMvxuyFQANUxBg53Qc4zd1cJ0hTwkX2N/Dkki9ZysuPArPYh2RdWRiGNIkhLUEDjP4YJXyMf7dyPwOBSK5B4lSn/+p+XlH7YZN3xO2+iI58jk/Nxcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nteKiO55; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nteKiO55"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso128502f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748514298; x=1749119098; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkPmfDr8qV4AFwb/7zNDmYiDn/SPJXtSs6w3iYw5HaE=;
        b=nteKiO55BoaRZ3PQyPwqUWpmXIK8PKChqexrQo/TYUCYuQ0jeriKNKs6iugsISanEB
         LuucSnjVajNDv3prf/4/lGtfxByfWecBBSj288qGmC4WPbQZnfs3OClzxm/mRL71ZiKD
         V4OmR6/H4T69BDEqLUKqaSK0rHZ3Y6mVu1c0nL1hOuRE0lhnSkXG7Dp4X+weya0zqXML
         vcW5nX66H+Ghdihhdo99H1eCmjbTyJQZsHJ7zf0bDeK96K8XjVlMA1tl67aaoUFrRrdn
         kvvtiMMZVeNxlqdJef7BfBNEkfsTZOzNrwNzWYaFA2djKMa/RLvMJNokFHqNl+XTNiz4
         p0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748514298; x=1749119098;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bkPmfDr8qV4AFwb/7zNDmYiDn/SPJXtSs6w3iYw5HaE=;
        b=FrmRzi2yzcDSa1TqwHL+W3WDZsIn3AKbWgcXzTS5xDzGB67WYDqbJv9SAA1IIp7WDN
         uFmc/CIXFlKCrZ317xCOka3kXMYZNr4w6vW2bs9+yd4uGy0Oq8MT+XcVLzrESe9IOthF
         cyXRmDLEfx01N6f+pScZLLiJ13TfLoByVRSRLgrGT1XCuvgxuwqThmED+cqURraFvpB0
         cgcMiCCtd3IYI+TOIFFB+P+rbIpL1hKHSyfzQNwkn7jLX9pQIzWzn52/sMqJNYgDOU9l
         +ftQDXcAUGj1nY8ZEkKXgaTrBC/7PfzGffjlzeRvl2Hb3yr3EIlmV1gettWw8MI7xd+M
         RTwg==
X-Forwarded-Encrypted: i=1; AJvYcCXFE8lSlakrxmqngo94bnuhAZ69h7A7+HjnlZ79VHYTTiJcEWhGCkcdRxu33pzufu9vhIt/7PpzRZY5kyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMrryZTw3wdJD3/90hj4A+Q+IXpVtTujFgqkIV5YrWcrAA3vpq
	8Iai2GebMLjrRuCVmgSqu3HYOX9rslE4ElPsoXorBt8Y+sQ0KQBjsV32W/L+wXW4W9c=
X-Gm-Gg: ASbGncuChJ3cDbxEAFQEjVxWXpZAe26yz9I1k7X5V8tcnHTTqJIOj4/xvv4+S1D3FA5
	rNkbuN4nByM/0SvnF4PuoYeQllDLWCjlMK+8uS6VbVMmeAVDsXhIi1Tist207ONh9sBklwo6fEz
	fxennzBJsjcqdOmhIcWYKdNQIOwAmbGwAL3GPWOvo0iXPjU2e5D+VXTUpu1PoHiMRS/92TbSlDs
	f9m7Zg97bjtSI5yi1T7pLC6xjH+m3SNS4JD1IMMrDbPNPz+Z/SNuWpdxbiLQadL82KTYCXfnU14
	mdWJw692eTH0JZlDfO37UafX5WwIgmFZniP/cQ/f0gU9VZpo1lxIYWJtLMU=
X-Google-Smtp-Source: AGHT+IHTjhkw8mY9U5Lw6amMsITMkGfFMYsq7IkB3jEfobdCq2XVznCgFv/wQTr+NkDTK2KFhJhB5w==
X-Received: by 2002:a05:6000:1885:b0:3a4:e672:df0c with SMTP id ffacd0b85a97d-3a4e672e083mr2365564f8f.13.1748514298394;
        Thu, 29 May 2025 03:24:58 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f5e7:eb4d:155d:d79e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73fbcsm1558329f8f.48.2025.05.29.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 12:24:57 +0200
Message-Id: <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
In-Reply-To: <1169138f-8445-4522-94dd-ad008524c600@linux.dev>

I originally gave up on the idea, but I feel kinda bad for Drew now, so
trying again:

2025-05-28T12:21:59-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/28/25 8:09 AM, Andrew Jones wrote:
>> On Wed, May 28, 2025 at 07:16:11AM -0700, Atish Patra wrote:
>>> On 5/26/25 4:13 AM, Andrew Jones wrote:
>>>> On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Kr=C4=8Dm=C3=A1=C5=99 =
wrote:
>>>>> 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
>>>>>> On 5/23/25 6:31 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>>>>>>> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>>>>>>>> Upgrade the SBI version to v3.0 so that corresponding features
>>>>>>>> can be enabled in the guest.
>>>>>>>>
>>>>>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>>>>>> ---
>>>>>>>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/in=
clude/asm/kvm_vcpu_sbi.h
>>>>>>>> -#define KVM_SBI_VERSION_MAJOR 2
>>>>>>>> +#define KVM_SBI_VERSION_MAJOR 3
>>>>>>> I think it's time to add versioning to KVM SBI implementation.
>>>>>>> Userspace should be able to select the desired SBI version and KVM =
would
>>>>>>> tell the guest that newer features are not supported.
>>>> We need new code for this, but it's a good idea.
>>>>
>>>>>> We can achieve that through onereg interface by disabling individual=
 SBI
>>>>>> extensions.
>>>>>> We can extend the existing onereg interface to disable a specific SB=
I
>>>>>> version directly
>>>>>> instead of individual ones to save those IOCTL as well.
>>>>> Yes, I am all in favor of letting userspace provide all values in the
>>>>> BASE extension.
>>> We already support vendorid/archid/impid through one reg. I think we ju=
st
>>> need to add the SBI version support to that so that user space can set =
it.
>>>
>>>> This is covered by your recent patch that provides userspace_sbi.
>>> Why do we need to invent new IOCTL for this ? Once the user space sets =
the
>>> SBI version, KVM can enforce it.
>> If an SBI spec version provides an extension that can be emulated by
>> userspace, then userspace could choose to advertise that spec version,
>> implement a BASE probe function that advertises the extension, and
>> implement the extension, even if the KVM version running is older
>> and unaware of it. But, in order to do that, we need KVM to exit to
>> userspace for all unknown SBI calls and to allow BASE to be overridden
> You mean only the version field in BASE - Correct ?

No, "BASE probe function" is the sbi_probe_extension() ecall.

>> by userspace. The new KVM CAP ioctl allows opting into that new behavior=
.
>
> But why we need a new IOCTL for that ? We can achieve that with existing
> one reg interface with improvements.

It's an existing IOCTL with a new data payload, but I can easily use
ONE_REG if you want to do everything through that.

KVM doesn't really need any other IOCTL than ONE_REGs, it's just
sometimes more reasonable to use a different IOCTL, like ENABLE_CAP.

>> The old KVM with new VMM configuration isn't totally far-fetched. While
>> host kernels tend to get updated regularly to include security fixes,
>> enterprise kernels tend to stop adding features at some point in order
>> to maximize stability. While enterprise VMMs would also eventually stop
>> adding features, enterprise consumers are always free to use their own
>> VMMs (at their own risk). So, there's a real chance we could have
>
> I think we are years away from that happening (if it happens). My=20
> suggestion was not to
> try to build a world where no body lives ;). When we get to that=20
> scenario, the default KVM
> shipped will have many extension implemented. So there won't be much=20
> advantage to
> reimplement them in the user space. We can also take an informed=20
> decision at that time
> if the current selective forwarding approach is better

Please don't repeat the design of SUSP/SRST/DBCN.
Seeing them is one of the reasons why I proposed the new interface.

"Blindly" forwarding DBCN to userspace is even a minor optimization. :)

>                                                        or we need to=20
> blindly forward any
> unknown SBI calls to the user space.

Yes, KVM has to do what userpace configures it to do.

I don't think that implementing unsupported SBI extensions in KVM is
important -- they should not be a hot path.

>> deployments with older, stable KVM where users want to enable later SBI
>> extensions, and, in some cases, that should be possible by just updating
>> the VMM -- but only if KVM is only acting as an SBI implementation
>> accelerator and not as a userspace SBI implementation gatekeeper.
>
> But some of the SBI extensions are so fundamental that it must be=20
> implemented in KVM
> for various reasons pointed by Anup on other thread.

No, SBI does not have to be implemented in KVM at all.

We do have a deep disagreement on what is virtualization and the role of
KVM in it.  I think that userspace wants a generic ISA accelerator.

Even if userspace wants SBI for the M-mode interface, security minded
userspace aims for as little kernel code as possible.
Userspace might want to accelerate some SBI extension in KVM, but it
should not be KVM who decides what userspace wants.
