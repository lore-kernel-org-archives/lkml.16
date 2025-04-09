Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D825D546
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192432; cv=none; b=X7mERQHgB+rqjdB9Y027nYj5c8K46K+qpogqIAS2vI5pzRD1EYa4l8OsgHmTz7M69EIDjrNSRxirESiI7PmObwnfOG/zwil+XqO1sdvHuh444W1cAZy34kEot/qkIImi/EMgEPtu+UdTuHPBo1ijVX7RDZvKS1ibNTTKhwEjA8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192432; c=relaxed/simple;
	bh=PFvrNo9j6y7zvXyiDXIUX1acNrqpxZh8/0+R+IG/dhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=icG/U9N9Gnm0PElvODsGtzLs0GrwFWVDZCvFpAg08JZjqGMs24A3akULSCC59Kg3/PVgH0DEeMSXg7hH5jh11/o44HP9QYkaiGd4O5xxwgO6mUKArqpdaPlwts//PJiSORIXxoErAMcmcE7UH1N0MG6IfyTTTqgJUbeHUT+8sSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from ubt.. (unknown [210.73.43.1])
	by APP-01 (Coremail) with SMTP id qwCowACnTv+ZQ_Zn4FyFBw--.56470S2;
	Wed, 09 Apr 2025 17:53:30 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH RFC v7 0/3] riscv: mm: Add soft-dirty and uffd-wp support
Date: Wed,  9 Apr 2025 17:53:17 +0800
Message-Id: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnTv+ZQ_Zn4FyFBw--.56470S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1xGw4rKw48Zr1xCryfJFb_yoW8Ww47pF
	Z3Ww1rGFW5Jr1ftrWfCry0kr1rXan5J343Gay7J34kJ39xWFWjqrnYkFy8Jr1rJF4FgrZY
	93W5Cryru3yqy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j2E_tUUUUU=
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiCRAHB2f2QJgO3AAAsC

This patchset adds soft dirty and userfaultfd write protect tracking 
support for RISC-V.

This patchset has been tested with kselftest mm suite in which soft-dirty, 
madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
and no regressions are observed in any of the other tests.

This patchset applies on top of v6.15-rc1.

V7:
- Add Svrsw60t59b [1] extension support;
- Have soft-dirty and uffd-wp depending on the Svrsw60t59b extension to
  avoid crashes for the hardware which don't have this extension.

V6:
- Changes to use bits 59-60 which are supported by extension Svrsw60t59b
  for soft dirty and userfaultfd write protect tracking.

V5:
- Fixed typos and corrected some words in Kconfig and commit message;
- Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste
  error;
- Added Alex's Reviewed-by tag in patch 2.

V4:
- Added bit(4) descriptions into "Format of swap PTE".

V3:
- Fixed the issue reported by kernel test irobot <lkp@intel.com>.

V1 -> V2:
- Add uffd-wp supported;
- Make soft-dirty uffd-wp and devmap mutually exclusive which all use
  the same PTE bit;
- Add test results of CRIU in the cover-letter.

[1] https://github.com/riscv/Svrsw60t59b.git

Chunyan Zhang (3):
  riscv: Add RISC-V Svrsw60t59b extension support
  riscv: mm: Add soft-dirty page tracking support
  riscv: mm: Add uffd write-protect support

 arch/riscv/Kconfig                    |  15 +++
 arch/riscv/include/asm/hwcap.h        |   1 +
 arch/riscv/include/asm/pgtable-bits.h |  37 +++++++
 arch/riscv/include/asm/pgtable.h      | 136 +++++++++++++++++++++++++-
 arch/riscv/kernel/cpufeature.c        |   1 +
 5 files changed, 188 insertions(+), 2 deletions(-)

-- 
2.34.1

