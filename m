Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998CB1EA7C2;
	Thu,  6 Feb 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848492; cv=none; b=JbhRkbIPWq3zHohp0aorHzsUNifXjS2zkXJKzhVnRP+rnhG4G1NoyVN+zRMX0//lK866RYEtqC1UesalCALRsNW68GX6IxrIr0GoL7ybatxGfniminB33TxVH6vFrtjl5tJ1q/ue4mv/AP+t97vssWI8SVofqf3PhGBwlgLvqHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848492; c=relaxed/simple;
	bh=Gd1a6I/rgNkLBhg+heY/5rsHpIz19/CKISEK4EbgRGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYJustdyogVkqn1Q+ftHrdopEpcDAryfLMnm6dPi/faS7NCI+nPfS3imAAbnxO7nrkKn1PcbLkxOa5sXsroP/jzH9wTn+sTBC21gPtzKMyJGh8BKTMAcJsIwp/+Oez6DrPLAho3M3pEMTs3fbSYUr20xAw5LQVzXaiVQn2Ds+JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sAzPesXY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sAzPesXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834C8C4CEDD;
	Thu,  6 Feb 2025 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848492;
	bh=Gd1a6I/rgNkLBhg+heY/5rsHpIz19/CKISEK4EbgRGk=;
	h=From:To:Cc:Subject:Date:From;
	b=sAzPesXYT5XjA43mn9mjFSddx+URHz4e/EE+TI3tjsmUlMnvvxe3jqJrb2ZlJ1bFe
	 B7+8xsYs0Lf82U6R5w7KQ/X3thA0P5Vsv1IuUIZmkZkTuKAjpJ4muaWX7EGNTjUhC4
	 bZV2MS1WewT5ByL1wNIty3jPoHW4H3Vyor5VoLRrdG99UAFuY9bBiBQc4dDvz1yc/B
	 m4Lis+O+AukrcalbjmakOOzhODUgl5kkuuVbQyLwPVyALQK8q98kZUlzRx0UPIQiAE
	 OI2uNPgsj+QWMfQrPrWgpfkFk3ouWr/Kzq4PvmvXT8ljEvVyUKp1Hs2LJmIW688fhH
	 LSkXPLg4eF0bg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
Date: Thu,  6 Feb 2025 15:27:40 +0200
Message-ID: <20250206132754.2596694-1-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

This a next version of Alex's "kexec: Allow preservation of ftrace buffers"
series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.com),
just to make things simpler instead of ftrace we decided to preserve
"reserve_mem" regions.

The patches are also available in git:
https://git.kernel.org/rppt/h/kho/v4


Kexec today considers itself purely a boot loader: When we enter the new
kernel, any state the previous kernel left behind is irrelevant and the
new kernel reinitializes the system.

However, there are use cases where this mode of operation is not what we
actually want. In virtualization hosts for example, we want to use kexec
to update the host kernel while virtual machine memory stays untouched.
When we add device assignment to the mix, we also need to ensure that
IOMMU and VFIO states are untouched. If we add PCIe peer to peer DMA, we
need to do the same for the PCI subsystem. If we want to kexec while an
SEV-SNP enabled virtual machine is running, we need to preserve the VM
context pages and physical memory. See "pkernfs: Persisting guest memory
and kernel/device state safely across kexec" Linux Plumbers
Conference 2023 presentation for details:

  https://lpc.events/event/17/contributions/1485/

To start us on the journey to support all the use cases above, this patch
implements basic infrastructure to allow hand over of kernel state across
kexec (Kexec HandOver, aka KHO). As a really simple example target, we use
memblock's reserve_mem.
With this patch set applied, memory that was reserved using "reserve_mem"
command line options remains intact after kexec and it is guaranteed to
reside at the same physical address.

== Alternatives ==

There are alternative approaches to (parts of) the problems above:

  * Memory Pools [1] - preallocated persistent memory region + allocator
  * PRMEM [2] - resizable persistent memory regions with fixed metadata
                pointer on the kernel command line + allocator
  * Pkernfs [3] - preallocated file system for in-kernel data with fixed
                  address location on the kernel command line
  * PKRAM [4] - handover of user space pages using a fixed metadata page
                specified via command line

All of the approaches above fundamentally have the same problem: They
require the administrator to explicitly carve out a physical memory
location because they have no mechanism outside of the kernel command
line to pass data (including memory reservations) between kexec'ing
kernels.

KHO provides that base foundation. We will determine later whether we
still need any of the approaches above for fast bulk memory handover of for
example IOMMU page tables. But IMHO they would all be users of KHO, with
KHO providing the foundational primitive to pass metadata and bulk memory
reservations as well as provide easy versioning for data.

== Overview ==

We introduce a metadata file that the kernels pass between each other. How
they pass it is architecture specific. The file's format is a Flattened
Device Tree (fdt) which has a generator and parser already included in
Linux. When the root user enables KHO through /sys/kernel/kho/active, the
kernel invokes callbacks to every driver that supports KHO to serialize
its state. When the actual kexec happens, the fdt is part of the image
set that we boot into. In addition, we keep a "scratch regions" available
for kexec: A physically contiguous memory regions that is guaranteed to
not have any memory that KHO would preserve.  The new kernel bootstraps
itself using the scratch regions and sets all handed over memory as in use.
When drivers initialize that support KHO, they introspect the fdt and
recover their state from it. This includes memory reservations, where the
driver can either discard or claim reservations.

== Limitations ==

Currently KHO is only implemented for file based kexec. The kernel
interfaces in the patch set are already in place to support user space
kexec as well, but it is still not implemented it yet inside kexec tools.

== How to Use ==

To use the code, please boot the kernel with the "kho=on" command line
parameter.
KHO will automatically create scratch regions. If you want to set the
scratch size explicitly you can use "kho_scratch=" command line parameter.
For instance, "kho_scratch=512M,256M" will create a global scratch area of
512Mib and per-node scrath areas of 256Mib.

Make sure to to have a reserved memory range requested with reserv_mem
command line option. Then before you invoke file based "kexec -l", activate
KHO:

  # echo 1 > /sys/kernel/kho/active
  # kexec -l Image --initrd=initrd -s
  # kexec -e

The new kernel will boot up and contain the previous kernel's reserve_mem
contents at the same physical address as the first kernel.

== Changelog ==

v3 -> v4:
  - Major rework of scrach management. Rather than force scratch memory
    allocations only very early in boot now we rely on scratch for all
    memblock allocations.
  - Use simple example usecase (reserv_mem instead of ftrace)
  - merge all KHO functionality into a single kernel/kexec_handover.c file
  - rename CONFIG_KEXEC_KHO to CONFIG_KEXEC_HANDOVER

v1 -> v2:
  - Removed: tracing: Introduce names for ring buffers
  - Removed: tracing: Introduce names for events
  - New: kexec: Add config option for KHO
  - New: kexec: Add documentation for KHO
  - New: tracing: Initialize fields before registering
  - New: devicetree: Add bindings for ftrace KHO
  - test bot warning fixes
  - Change kconfig option to ARCH_SUPPORTS_KEXEC_KHO
  - s/kho_reserve_mem/kho_reserve_previous_mem/g
  - s/kho_reserve/kho_reserve_scratch/g
  - Remove / reduce ifdefs
  - Select crc32
  - Leave anything that requires a name in trace.c to keep buffers
    unnamed entities
  - Put events as array into a property, use fingerprint instead of
    names to identify them
  - Reduce footprint without CONFIG_FTRACE_KHO
  - s/kho_reserve_mem/kho_reserve_previous_mem/g
  - make kho_get_fdt() const
  - Add stubs for return_mem and claim_mem
  - make kho_get_fdt() const
  - Get events as array from a property, use fingerprint instead of
    names to identify events
  - Change kconfig option to ARCH_SUPPORTS_KEXEC_KHO
  - s/kho_reserve_mem/kho_reserve_previous_mem/g
  - s/kho_reserve/kho_reserve_scratch/g
  - Leave the node generation code that needs to know the name in
    trace.c so that ring buffers can stay anonymous
  - s/kho_reserve/kho_reserve_scratch/g
  - Move kho enums out of ifdef
  - Move from names to fdt offsets. That way, trace.c can find the trace
    array offset and then the ring buffer code only needs to read out
    its per-CPU data. That way it can stay oblivient to its name.
  - Make kho_get_fdt() const

v2 -> v3:

  - Fix make dt_binding_check
  - Add descriptions for each object
  - s/trace_flags/trace-flags/
  - s/global_trace/global-trace/
  - Make all additionalProperties false
  - Change subject to reflect subsysten (dt-bindings)
  - Fix indentation
  - Remove superfluous examples
  - Convert to 64bit syntax
  - Move to kho directory
  - s/"global_trace"/"global-trace"/
  - s/"global_trace"/"global-trace"/
  - s/"trace_flags"/"trace-flags"/
  - Fix wording
  - Add Documentation to MAINTAINERS file
  - Remove kho reference on read error
  - Move handover_dt unmap up
  - s/reserve_scratch_mem/mark_phys_as_cma/
  - Remove ifdeffery
  - Remove superfluous comment

Alexander Graf (9):
  memblock: Add support for scratch memory
  kexec: Add Kexec HandOver (KHO) generation helpers
  kexec: Add KHO parsing support
  kexec: Add KHO support to kexec file loads
  kexec: Add config option for KHO
  kexec: Add documentation for KHO
  arm64: Add KHO support
  x86: Add KHO support
  memblock: Add KHO support for reserve_mem

Mike Rapoport (Microsoft) (5):
  mm/mm_init: rename init_reserved_page to init_deferred_page
  memblock: add MEMBLOCK_RSRV_KERN flag
  memblock: introduce memmap_init_kho_scratch()
  x86/setup: use memblock_reserve_kern for memory used by kernel
  Documentation: KHO: Add memblock bindings

 Documentation/ABI/testing/sysfs-firmware-kho  |   9 +
 Documentation/ABI/testing/sysfs-kernel-kho    |  53 ++
 .../admin-guide/kernel-parameters.txt         |  24 +
 .../kho/bindings/memblock/reserve_mem.yaml    |  41 +
 .../bindings/memblock/reserve_mem_map.yaml    |  42 +
 Documentation/kho/concepts.rst                |  80 ++
 Documentation/kho/index.rst                   |  19 +
 Documentation/kho/usage.rst                   |  60 ++
 Documentation/subsystem-apis.rst              |   1 +
 MAINTAINERS                                   |   3 +
 arch/arm64/Kconfig                            |   3 +
 arch/x86/Kconfig                              |   3 +
 arch/x86/boot/compressed/kaslr.c              |  52 +-
 arch/x86/include/asm/setup.h                  |   4 +
 arch/x86/include/uapi/asm/setup_data.h        |  13 +-
 arch/x86/kernel/e820.c                        |  18 +
 arch/x86/kernel/kexec-bzimage64.c             |  36 +
 arch/x86/kernel/setup.c                       |  39 +-
 arch/x86/realmode/init.c                      |   2 +
 drivers/of/fdt.c                              |  36 +
 drivers/of/kexec.c                            |  42 +
 include/linux/cma.h                           |   2 +
 include/linux/kexec.h                         |  37 +
 include/linux/kexec_handover.h                |  10 +
 include/linux/memblock.h                      |  38 +-
 kernel/Kconfig.kexec                          |  13 +
 kernel/Makefile                               |   1 +
 kernel/kexec_file.c                           |  19 +
 kernel/kexec_handover.c                       | 808 ++++++++++++++++++
 kernel/kexec_internal.h                       |  16 +
 mm/Kconfig                                    |   4 +
 mm/internal.h                                 |   5 +-
 mm/memblock.c                                 | 247 +++++-
 mm/mm_init.c                                  |  19 +-
 34 files changed, 1775 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-kho
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kho
 create mode 100644 Documentation/kho/bindings/memblock/reserve_mem.yaml
 create mode 100644 Documentation/kho/bindings/memblock/reserve_mem_map.yaml
 create mode 100644 Documentation/kho/concepts.rst
 create mode 100644 Documentation/kho/index.rst
 create mode 100644 Documentation/kho/usage.rst
 create mode 100644 include/linux/kexec_handover.h
 create mode 100644 kernel/kexec_handover.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.47.2

