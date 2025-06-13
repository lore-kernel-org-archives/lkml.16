Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41008E555
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842054; cv=none; b=sLLc0nfnGpg0ujXPHYD+T8Ks3YoT0xyIp6asyqqNfxCtuZ/1Uj2+I8ENCMKlWgd0YxtdrNKnpkNiXhmntBSuiuBs7caz+cJlK/ZZI7031o4oxOyugw87gGmTG5l/RKKfY/vtaLJAyLwnxwNKR36bBO1xtFVmOWQXz/OW8yjgcls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842054; c=relaxed/simple;
	bh=E5qL4848nhxlQoZifQwBiH5+0qjVgqck0htkV9GuQXg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XP3l6t3sYcEQIkbONHz7Ca/YplOOtRtcGW/rFueGdzpS2BI6cr3Xf7iLuary30/GX0pcZVhc4tR0cXEk1n0fWXSitUFLJLeJihchZ+SnanuEZ5byqdk3tu9jg1tPoA5rh0enp/LzPbW/N1crohQXD5yHCsRef4K+rlV6Jznqv68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qcheD9VV; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qcheD9VV"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740270e168aso2107183b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749842052; x=1750446852; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UEuA+8UJ9Tc4ZgBRsZcUNhOteyKujcYr6hfqjPHDiBU=;
        b=qcheD9VVSDRL9w0EwsBRAlezG/k/SCzqrMoeNyul71H8KyFPpwiGpK+Z2pFRIqjy6W
         u0gpKaUKxn8N06Bk6ZxAMHUxb0P0k8WrN7kFWx1lX++dJTOaR1yInkV0CyNoo6QSd9A5
         8ugZuR3S0VHYhcOC0I0yCkg1/2JIwLGE4yAgU6OpQEkiBhBbAb31xxsm2CNWTqcudfei
         GAxNusuxcp3gyCtNQb6vKsWiHSymD7Ift7upxdd00lIzdRBksQrTZjqHkf8t/dnz4Zr/
         Rp2s16QnSoayVU79gtFUIZLOuwFk49qPxfKgcTxlmAhgeWAE/nFhbKzgDIwYDpmSO2xn
         jwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749842052; x=1750446852;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEuA+8UJ9Tc4ZgBRsZcUNhOteyKujcYr6hfqjPHDiBU=;
        b=iS+7LxrRH9XIFs6HTJ8WDN7goresW7eEBQLi2nYCnxWmljBDu3iq/EGmMeMSrSaNLP
         cWjp1nzPbjDS833FNdQqrY0wAt3QjwmFz8OW3LawI0baYaPZsCIH/gjhp+7WsXfnXrPJ
         IyDgMkMocnkSi+x0GCjhDODsHunYXCVPdwNFxmktKE2fDXFzt0kreCWWzHN3AGUFfuH1
         0OfufMzhxWdKokMX3+yDiiSbwSeE1PvEmM4wWEkliDdmvIDb95GhwlhM3J+/QD9ncMO7
         HxVXsJvmCGgr/bfeF9dVNultyXY2RxM3FWTWGMIy80xAtAnkcj6kRRiZDd/frJOVes9n
         5fZQ==
X-Gm-Message-State: AOJu0YzZJs5rL+9Y5LJG9uj2DGYIQD5z4OXVCd1SIdLo6F2gdAd2f7d+
	HSDoA2ebt1OX1IKuQLHzGtIUVG2E2cP2fUMLCuKWtKIdojIwZjwIPzlrMWmz0OrQEfeVqMBx7uY
	uZg==
X-Google-Smtp-Source: AGHT+IFG326e6cz9aqxiBddfpig3D4ht+CdC730H44desqWNSe7m7gFGvUu4mLiDJ+v2WIsgrLNmXn0ePw==
X-Received: from pfbhx21.prod.google.com ([2002:a05:6a00:8995:b0:747:a9de:9998])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:41:b0:21a:ed12:bdf9
 with SMTP id adf61e73a8af0-21fbd525bf9mr562909637.17.1749842052493; Fri, 13
 Jun 2025 12:14:12 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:13:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613191359.35078-1-sagis@google.com>
Subject: [PATCH v7 00/30] TDX KVM selftests
From: Sagi Shahar <sagis@google.com>
To: linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Ryan Afranji <afranji@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sagi Shahar <sagis@google.com>, Roger Wang <runanwang@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This is v7 of the TDX selftests now that the base TDX patches have been
accepted.

This series is based on v6.16-rc1

No major changes from v6 asside from rebasing.

Thanks,

Changes from v6:
- Rebased on top of v6.16-rc1

Ackerley Tng (12):
  KVM: selftests: Add function to allow one-to-one GVA to GPA mappings
  KVM: selftests: Expose function that sets up sregs based on VM's mode
  KVM: selftests: Store initial stack address in struct kvm_vcpu
  KVM: selftests: Add vCPU descriptor table initialization utility
  KVM: selftests: TDX: Use KVM_TDX_CAPABILITIES to validate TDs'
    attribute configuration
  KVM: selftests: TDX: Update load_td_memory_region() for VM memory
    backed by guest memfd
  KVM: selftests: Add functions to allow mapping as shared
  KVM: selftests: KVM: selftests: Expose new vm_vaddr_alloc_private()
  KVM: selftests: TDX: Add support for TDG.MEM.PAGE.ACCEPT
  KVM: selftests: TDX: Add support for TDG.VP.VEINFO.GET
  KVM: selftests: TDX: Add TDX UPM selftest
  KVM: selftests: TDX: Add TDX UPM selftests for implicit conversion

Erdem Aktas (3):
  KVM: selftests: Add helper functions to create TDX VMs
  KVM: selftests: TDX: Add TDX lifecycle test
  KVM: selftests: TDX: Add TDX HLT exit test

Isaku Yamahata (1):
  KVM: selftests: Update kvm_init_vm_address_properties() for TDX

Roger Wang (1):
  KVM: selftests: TDX: Add TDG.VP.INFO test

Ryan Afranji (2):
  KVM: selftests: TDX: Verify the behavior when host consumes a TD
    private memory
  KVM: selftests: TDX: Add shared memory test

Sagi Shahar (10):
  KVM: selftests: TDX: Add report_fatal_error test
  KVM: selftests: TDX: Adding test case for TDX port IO
  KVM: selftests: TDX: Add basic TDX CPUID test
  KVM: selftests: TDX: Add basic TDG.VP.VMCALL<GetTdVmCallInfo> test
  KVM: selftests: TDX: Add TDX IO writes test
  KVM: selftests: TDX: Add TDX IO reads test
  KVM: selftests: TDX: Add TDX MSR read/write tests
  KVM: selftests: TDX: Add TDX MMIO reads test
  KVM: selftests: TDX: Add TDX MMIO writes test
  KVM: selftests: TDX: Add TDX CPUID TDVMCALL test

Yan Zhao (1):
  KVM: selftests: TDX: Test LOG_DIRTY_PAGES flag to a non-GUEST_MEMFD
    memslot

 tools/testing/selftests/kvm/Makefile.kvm      |    8 +
 .../testing/selftests/kvm/include/kvm_util.h  |   36 +
 .../selftests/kvm/include/x86/kvm_util_arch.h |    1 +
 .../selftests/kvm/include/x86/processor.h     |    2 +
 .../selftests/kvm/include/x86/tdx/td_boot.h   |   83 ++
 .../kvm/include/x86/tdx/td_boot_asm.h         |   16 +
 .../selftests/kvm/include/x86/tdx/tdcall.h    |   54 +
 .../selftests/kvm/include/x86/tdx/tdx.h       |   67 +
 .../selftests/kvm/include/x86/tdx/tdx_util.h  |   23 +
 .../selftests/kvm/include/x86/tdx/test_util.h |  133 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   74 +-
 .../testing/selftests/kvm/lib/x86/processor.c |   97 +-
 .../selftests/kvm/lib/x86/tdx/td_boot.S       |  100 ++
 .../selftests/kvm/lib/x86/tdx/tdcall.S        |  163 +++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx.c |  243 ++++
 .../selftests/kvm/lib/x86/tdx/tdx_util.c      |  643 +++++++++
 .../selftests/kvm/lib/x86/tdx/test_util.c     |  187 +++
 .../selftests/kvm/x86/tdx_shared_mem_test.c   |  129 ++
 .../testing/selftests/kvm/x86/tdx_upm_test.c  |  461 ++++++
 tools/testing/selftests/kvm/x86/tdx_vm_test.c | 1254 +++++++++++++++++
 20 files changed, 3734 insertions(+), 40 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
 create mode 100644 tools/testing/selftests/kvm/include/x86/tdx/td_boot_asm.h
 create mode 100644 tools/testing/selftests/kvm/include/x86/tdx/tdcall.h
 create mode 100644 tools/testing/selftests/kvm/include/x86/tdx/tdx.h
 create mode 100644 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
 create mode 100644 tools/testing/selftests/kvm/include/x86/tdx/test_util.h
 create mode 100644 tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
 create mode 100644 tools/testing/selftests/kvm/lib/x86/tdx/tdcall.S
 create mode 100644 tools/testing/selftests/kvm/lib/x86/tdx/tdx.c
 create mode 100644 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
 create mode 100644 tools/testing/selftests/kvm/lib/x86/tdx/test_util.c
 create mode 100644 tools/testing/selftests/kvm/x86/tdx_shared_mem_test.c
 create mode 100644 tools/testing/selftests/kvm/x86/tdx_upm_test.c
 create mode 100644 tools/testing/selftests/kvm/x86/tdx_vm_test.c

-- 
2.50.0.rc2.692.g299adb8693-goog

