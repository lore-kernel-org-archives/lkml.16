Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C66231835
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987217; cv=none; b=HRA83TmGrgvO25s5MON7weaQCtbMUalWAVDuNNyeHHkveIbcnnSUcCSiYL7cEHeVHvNY07o8on6UnNjxVYdwQKsuoUJ0+RiSxH8MLnEfQWDEIcWviJ7gu0mILmgSmlegdPzRHCqwA9ObMb8drAjulfo1Gi//FLm9cgNzZJkFusA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987217; c=relaxed/simple;
	bh=7OkVmia+kAhC2psjz5g/UQyEwFQL6hlzlynJfKibJrY=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=SOhJiIJ64DuSnbWuL5PF4dZ8QPC9WC0kGaxYowad2PVe9FrUJ7ynRhKeFxkb9088YLtJ4OK18/rHEC3Yt7DDqUjOGoZ4uiG/aNNlP5/geYtiCdSffYcIw6f6g1VKxA7jVCh3zDu2uNuB/qn64XkyTQiZ9wr29eqCROl2wV+0hfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bi3hxfIg; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bi3hxfIg"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72c0050a956so4751370a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 14:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748987215; x=1749592015; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LccXvjPYPBUKmolpHX2IrRx+++KKrUgiEoyHX8qZbOw=;
        b=Bi3hxfIgHRRST+ts6mfaolap226t0NctWhE6kDXuMLdh9p7VCLfiUh54mQOMVBdPjM
         H0S8Oe4ctU4zeJ4WkQvBD1axE9ErDgf05eVYRpbsX1g9/9XX6x2Q6WQMukvKVHIplJkc
         k/+kDNvsy2kXUHA+FE/F9SU1K+JFUWObFpVQBUdWy5rNaoY8kRoZ8Ej4uqJZtMyAcDvp
         YFkfttFGdyptJMZ/P30qbgY7DDbfMDyyXPI/9iXhnakAxZyDOaYxVrZcwy8S0sKYgLxF
         94XoWkPTGfJhE+bim2J2zpq6Zw31Px4q4uhsqHyktsGyL6R/pauQbnSrmZ5p9Y/Wf8gy
         t/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748987215; x=1749592015;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LccXvjPYPBUKmolpHX2IrRx+++KKrUgiEoyHX8qZbOw=;
        b=F0EJw+nCqfdpU06RNXDMhXznkVpJra1pKEq85nnpI5ZsjlbciolfPVlVT2KvU0XMmr
         AUiSOrwaPj2xhK4jkqQ9de7W+vVzmIO7sLlyt+B+I9t4OCZeovlnkR872J2PJBbQAtXu
         Q8nWfVRUQmZgPpZXrv3GQ4HyGFoLxu/+KPdhJaVimaGce9YFfx0UMzrLynebDzUtLnRw
         cQDz5cLYA2YXTqr/YJSloo3EdkgI6ddCBrxTnR7MHgvNBLicfuBdBuGhCc9PUNslL0tK
         QUiFa+Z6xYHWPE0A4cEv4I99fddiwllR3PI1lKKk5p9Ygr6uKD3iL8bpJ357M0KDEBFG
         fxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKXACth3XHj1ohsGxILcDkZ7cbemeaT++h3hsvs2oMChTOjOJ3rGaGhlVEPRGHiWWcFkSzpyv8v3/sY5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpb9liX+XfMVkoYFMi5PgLVkfWuEDhARGFL93uOgPuip3Bz0K
	Bcs9P7DpWdioW2ItvBxmTB4swDBouHaBGvF4DeSJrJpM6i/u2rdJ2C5f3uZvV+ivoXrWbw/In6+
	n6jW28ohA9G9ySP2w4QwRbR4bTQ==
X-Google-Smtp-Source: AGHT+IGVKt5ILqjSdW8OtKLqE/y3WeywMj3vX4/DzsQoxvrjy7RrNHS3PkxJz64AV7HAzQffHQulShSVI5b7iylTEA==
X-Received: from oobdi8.prod.google.com ([2002:a05:6820:1e88:b0:60f:868:60e1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:4882:b0:735:ebf8:b241 with SMTP id 46e09a7af769-73869d7c158mr529938a34.14.1748987214770;
 Tue, 03 Jun 2025 14:46:54 -0700 (PDT)
Date: Tue, 03 Jun 2025 21:46:54 +0000
In-Reply-To: <aD4oS1_tnMPlgDJ6@linux.dev> (message from Oliver Upton on Mon, 2
 Jun 2025 15:40:11 -0700)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsnt1ps033ch.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 16/17] KVM: arm64: Add ioctl to partition the PMU when supported
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 02, 2025 at 07:27:01PM +0000, Colton Lewis wrote:
>> +	case KVM_ARM_PARTITION_PMU: {

> This should be a vCPU attribute similar to the other PMUv3 controls we
> already have. Ideally a single attribute where userspace tells us it
> wants paritioning and specifies the PMU ID to use. None of this can be
> changed after INIT'ing the PMU.

Okay

>> +		struct arm_pmu *pmu;
>> +		u8 host_counters;
>> +
>> +		if (unlikely(!kvm_vcpu_initialized(vcpu)))
>> +			return -ENOEXEC;
>> +
>> +		if (!kvm_pmu_partition_supported())
>> +			return -EPERM;
>> +
>> +		if (copy_from_user(&host_counters, argp, sizeof(host_counters)))
>> +			return -EFAULT;
>> +
>> +		pmu = vcpu->kvm->arch.arm_pmu;
>> +		return kvm_pmu_partition(pmu, host_counters);

> Yeah, we really can't be changing the counters available to the ARM PMU
> driver at this point. What happens to host events already scheduled on
> the CPU?

Okay. I remember talking about this before.

> Either the partition of host / KVM-owned counters needs to be computed
> up front (prior to scheduling events) or KVM needs a way to direct perf
> to reschedule events on the PMU based on the new operating constraints.

Yes. I will think about it.
