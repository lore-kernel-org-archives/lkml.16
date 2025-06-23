Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C932940B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716679; cv=none; b=pcVyViiCinE1z7X1tCre8T3E+rIBPEvI97v2m/JdIHD03WS29lRWmzl9bn6QeAdvCTjYWG5tWQORRjmNKTfWJiut9yUgrn+Ad2HZpS01nsWDZKPScx8k/8Te84OCQbH5Qr+kz7yzuA2L6djFPSQLmUJkqZXRu38bXhLOIRAdvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716679; c=relaxed/simple;
	bh=D7atcKrsikBtKn+dkIVbHfHd96Aa/xzh+Jcn54xGazo=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=UowGf5pWagyVLaGDeq4qUimL66oCjpAj6lJt/cg7t2qfTZ+ui48EaS+ihXqXom1UIKZEJpdUZy70zC8Z2XDemH6jPVAgRuVS6jMSiqyyA0vHLZnuG4CrH7tS63sia7yl11XdCx7QYa+QCQWBxIT8Q96v9uNn47Nfj1bl4xxLlxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bGB61CYI; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bGB61CYI"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-86cf753423cso409281539f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750716676; x=1751321476; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGQz+pPj9rguv78Mk1DG88zZ+C5YYmZS8y1NwOe8IHE=;
        b=bGB61CYIjxiMMk7ExweFZl8ed1XFA+qc2eVHDL3x5ZRWn1R1Un/K0VgUbQBLoJdVIp
         n6Avm+KftNSah/p6+BgsIU2/B0gqwcJ6QUvKoAVWaOKSaLJEiyQmvW+hRlMjdjk45n2z
         mnQUCqmNQweTCMH7v2qKRig7xCPJLbZoYQUrlE/V7bDXIgCo36WTTkymnWE6qvlRpftg
         6g+LdfgYQ5idNPutdjrTEsVMclwjWNJ+PnXpllN+/wUzUItACTtd1Q7p4NAYm2tdl/ru
         j/vpp+TsWHfWohs2h/FviZz6AC2kmRP4KhV3KCmNFlmTH9UIfxcN7b9n6SApFthdiD4C
         8tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716676; x=1751321476;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGQz+pPj9rguv78Mk1DG88zZ+C5YYmZS8y1NwOe8IHE=;
        b=lPjmKxGiapwvFJk+sIg6OEUx2ybnhmeVA4eC4zXytvh5QyCS8qYHGH0qHfTCZkLo5L
         sD4SZdKZFj/mSLm1mRF3OrTxHhmLy/II115rLelypyLyWBiuUwKjdthzJ7KLI6PoiBnT
         YQNz9MLudSKmKlSEEjzxXnxW10iwhPqlvn+NeibU3OnFaCxLvbF5kZIRNr6RDL6AaD5k
         6HgROFa6WFSOCqLEeCBSdw7NQWcWNM57l/2FROFJTcubzF8ofKnz0OTd7Y0PAXdYVdmF
         F5ALL09Tk+PGdSE562WxDt70/I0tH8hRI0x+h/JstfxXxbe67oIrAfRWUx8FlKCwUQg0
         cNIA==
X-Forwarded-Encrypted: i=1; AJvYcCW7WTTnRHzvXAVT9N5rlMmPf1uy/1cTN/j2xEY2hLaXEvIqQyvDsZSqueupJFbXnXENwdufrA4qXjwqZK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdNbk5ei48XFhaJ5X4yOZzFAEwgBO/R+ZTtAmsA7YG8B5yPwT
	v64twsORYSvDoABHswju3ZwlWqhGtfFHYyFwoWzSJbs+RB//tsqNaTQuIf2BZkfYEqRhMdk8raF
	XikA/I7hEq0qDZMJPo9LlFxtklw==
X-Google-Smtp-Source: AGHT+IFROh/q8Un43k3KAN6/Y7TN0oBqMJ1o65GnORb3dUVRyme5Qfos+kVCSSkafOZNJv6Ve5iTj9GtWD2hqiOqYQ==
X-Received: from ilbdr12.prod.google.com ([2002:a05:6e02:3f0c:b0:3dd:b580:4100])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3499:b0:3de:119f:5261 with SMTP id e9e14a558f8ab-3de38c1c019mr212245545ab.3.1750716676655;
 Mon, 23 Jun 2025 15:11:16 -0700 (PDT)
Date: Mon, 23 Jun 2025 22:11:15 +0000
In-Reply-To: <202506221711.tFNGpzj4-lkp@intel.com> (message from kernel test
 robot on Sun, 22 Jun 2025 17:32:31 +0800)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntikkm9kho.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 17/23] KVM: arm64: Account for partitioning in PMCR_EL0 access
From: Colton Lewis <coltonlewis@google.com>
To: kernel test robot <lkp@intel.com>
Cc: kvm@vger.kernel.org, oe-kbuild-all@lists.linux.dev, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

kernel test robot <lkp@intel.com> writes:

>     In file included from arch/arm64/include/asm/kvm_host.h:32,
>                      from include/linux/kvm_host.h:45,
>                      from arch/arm64/kvm/sys_regs.c:16:
>     arch/arm64/include/asm/kvm_pmu.h:236:50: warning: 'struct arm_pmu'  
> declared inside parameter list will not be visible outside of this  
> definition or declaration
>      static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>                                                       ^~~~~~~
>     arch/arm64/include/asm/kvm_pmu.h:241:52: warning: 'struct arm_pmu'  
> declared inside parameter list will not be visible outside of this  
> definition or declaration
>      static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
>                                                         ^~~~~~~
>     arch/arm64/include/asm/kvm_pmu.h:246:53: warning: 'struct arm_pmu'  
> declared inside parameter list will not be visible outside of this  
> definition or declaration
>      static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
>                                                          ^~~~~~~
>     arch/arm64/kvm/sys_regs.c:856:6: warning: no previous prototype  
> for 'pmu_access_el0_disabled' [-Wmissing-prototypes]
>      bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
>           ^~~~~~~~~~~~~~~~~~~~~~~
>     arch/arm64/kvm/sys_regs.c: In function 'access_pmu_evtyper':
>     arch/arm64/kvm/sys_regs.c:1076:7: error: implicit declaration of  
> function 'kvm_vcpu_pmu_is_partitioned'; did you  
> mean 'kvm_pmu_is_partitioned'? [-Werror=implicit-function-declaration]
>        if (kvm_vcpu_pmu_is_partitioned(vcpu))
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>            kvm_pmu_is_partitioned
>     arch/arm64/kvm/sys_regs.c: In function 'set_pmcr':
>>> arch/arm64/kvm/sys_regs.c:1271:33: error: dereferencing pointer to  
>>> incomplete type 'struct arm_pmu'
>            new_n <= kvm->arch.arm_pmu->hpmn_max))
>                                      ^~
>     cc1: some warnings being treated as errors

Looks like the main problem here is struct arm_pmu is not defined if we
don't have CONFIG_ARM_PMU. I'll provide a dummy definition for that case
and swap out the field reference for a function call.

Secondary problem is making sure there is a prototype for
pmu_access_el0_disabled in that instance.

> vim +1271 arch/arm64/kvm/sys_regs.c

>    1253
>    1254	static int set_pmcr(struct kvm_vcpu *vcpu, const struct  
> sys_reg_desc *r,
>    1255			    u64 val)
>    1256	{
>    1257		u8 new_n = FIELD_GET(ARMV8_PMU_PMCR_N, val);
>    1258		struct kvm *kvm = vcpu->kvm;
>    1259
>    1260		mutex_lock(&kvm->arch.config_lock);
>    1261
>    1262		/*
>    1263		 * The vCPU can't have more counters than the PMU hardware
>    1264		 * implements. Ignore this error to maintain compatibility
>    1265		 * with the existing KVM behavior.
>    1266		 */
>    1267		if (!kvm_vm_has_ran_once(kvm) &&
>    1268		    !vcpu_has_nv(vcpu)	      &&
>    1269		    new_n <= kvm_arm_pmu_get_max_counters(kvm) &&
>    1270		    (!kvm_vcpu_pmu_is_partitioned(vcpu) ||
>> 1271		     new_n <= kvm->arch.arm_pmu->hpmn_max))
>    1272			kvm->arch.nr_pmu_counters = new_n;
>    1273
>    1274		mutex_unlock(&kvm->arch.config_lock);
>    1275
>    1276		/*
>    1277		 * Ignore writes to RES0 bits, read only bits that are cleared on
>    1278		 * vCPU reset, and writable bits that KVM doesn't support yet.
>    1279		 * (i.e. only PMCR.N and bits [7:0] are mutable from userspace)
>    1280		 * The LP bit is RES0 when FEAT_PMUv3p5 is not supported on the  
> vCPU.
>    1281		 * But, we leave the bit as it is here, as the vCPU's PMUver might
>    1282		 * be changed later (NOTE: the bit will be cleared on first vCPU  
> run
>    1283		 * if necessary).
>    1284		 */
>    1285		val &= ARMV8_PMU_PMCR_MASK;
>    1286
>    1287		/* The LC bit is RES1 when AArch32 is not supported */
>    1288		if (!kvm_supports_32bit_el0())
>    1289			val |= ARMV8_PMU_PMCR_LC;
>    1290
>    1291		__vcpu_assign_sys_reg(vcpu, r->reg, val);
>    1292		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
>    1293
>    1294		return 0;
>    1295	}
>    1296

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
