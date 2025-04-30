Received: from 6.mo581.mail-out.ovh.net (6.mo581.mail-out.ovh.net [188.165.39.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1461D2DC771
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 00:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.39.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746057700; cv=none; b=SeQoo0l+FNORPF/kzTacN3MDzM04PEcR8BrGlx3uCBB1L1Db0R+YtI1BeFIx6XuibRMoNvZLGfwua2M5k58U2V9vZ+6gJ8MZ7X2gmACeeO+2xN3ey/QVg+BdtW9MPqW1QCFzItHBxQt+WFRvjXJod9yPQeDbegc1xoZEs5mbEoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746057700; c=relaxed/simple;
	bh=R6IceUwMr0LDFa2629e3oGBZ3BcVaeTj7CZ0L8ipPHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yk/rqDX9dUGfChHkvLIk6N6eg5NRVvhSXs5/Q4ARj/55wYsdxKhb6Umd36+m65K+fibrPZixsaxdTllT8W0+CAzBX/tfr7oVZi2/rGkYan9t0OgJHeGq8Ffy1LHRy+uLYGSrHHPJZFbIlO8TJlPCEFEo2H5nPbehCCi8zzM5zzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=eYRStlys; arc=none smtp.client-ip=188.165.39.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="eYRStlys"
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.148.49])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ZnshM00Xvz1KrG
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:06 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-lsxl9 (unknown [10.110.188.136])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A6E571FD1E;
	Wed, 30 Apr 2025 22:45:06 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
	by ghost-submission-5b5ff79f4f-lsxl9 with ESMTPSA
	id zNP6HvKnEmhEPgsA7JqBbA
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:06 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-106R006e662464a-a362-49e1-98a7-ed03813e7455,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com
Subject: [RFC PATCH v2 1/9] Documentation/x86: update Secure Launch for AMD SKINIT
Date: Thu,  1 May 2025 01:44:43 +0300
Message-ID: <c942fc219566a9a39de48918fb6608849abf4383.1746037489.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
References: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12101735152036918428
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfelgfdtleejhefhffeileetgfffjeekueejudegieekieekvefhgeevtdelffehnecuffhomhgrihhnpehtrhgvnhgthhgsohhothdrohhrghdprghmugdrtghomhdpghhithhhuhgsrdgtohhmpdhfohhsuggvmhdrohhrghenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=JuWliCcAsReBMdU+nYOowwU7TndfwJwkdSza/u3yJXQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053107; v=1;
 b=eYRStlysuOo+/q+RdvWt3UH2J7ocC0t7u2I3DySr15q70NgkKutCMMHLsXqnYGEToY44JjnV
 UM8qvO/gRkUqZXVbqIQlPW5Z9crGNac1bWjLx60GJdZp/SlDTzHEqNHifHViUPQvYBzYXhzLBOx
 1CEj4VNZqz8YRSSyGP08RIyKidjnJp0WtH8HzRt9J5IUAMnkE6nZUk1KHxHfgDgsh4FNhrWWSrU
 A5AviAs3ONB14f9v0ijpXOJg34uDRH/GR9P5unXn7DEDbbfyxumhUIsXXNCueKbK6rN2uhjdf0X
 ODTiXyqQOIJDZOXuGGEJFkI01gfR2cErG4pZA36eY52mQ==

* Switch ACM to DCE where not talking exclusively about Intel TXT
* Switch MLE to DLME where not talking exclusively about Intel TXT
* Add information about Secure Loader
* Update information about Secure Launch to account for AMD SKINIT

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 .../secure_launch_details.rst                 | 83 ++++++++++++++++---
 .../secure_launch_overview.rst                | 61 +++++++++-----
 2 files changed, 113 insertions(+), 31 deletions(-)

diff --git a/Documentation/security/launch-integrity/secure_launch_details.rst b/Documentation/security/launch-integrity/secure_launch_details.rst
index c58fa3a6a607..0936c29fd113 100644
--- a/Documentation/security/launch-integrity/secure_launch_details.rst
+++ b/Documentation/security/launch-integrity/secure_launch_details.rst
@@ -18,13 +18,13 @@ The settings to enable Secure Launch using Kconfig are under::
 A kernel with this option enabled can still be booted using other supported
 methods.
 
-To reduce the Trusted Computing Base (TCB) of the MLE [1]_, the build
+To reduce the Trusted Computing Base (TCB) of the DLME [1]_, the build
 configuration should be pared down as narrowly as one's use case allows.
 Fewer drivers (less active hardware) and features reduce the attack surface.
-As an example in the extreme, the MLE could only have local disk access with no
+As an example in the extreme, the DLME could only have local disk access with no
 other hardware supports except optional network access for remote attestation.
 
-It is also desirable, if possible, to embed the initrd used with the MLE kernel
+It is also desirable, if possible, to embed the initrd used with the DLME kernel
 image to reduce complexity.
 
 The following are important configuration necessities to always consider:
@@ -39,7 +39,8 @@ other instabilities at boot. Even in cases where Secure Launch and KASLR work
 together, it is still recommended that KASLR be disabled to avoid introducing
 security concerns with unprotected kernel memory.
 
-If possible, a kernel being used as an MLE should be built with KASLR disabled::
+If possible, a kernel being used as an DLME should be built with KASLR
+disabled::
 
   "Processor type and features" -->
       "Build a relocatable kernel" -->
@@ -64,7 +65,7 @@ IOMMU Configuration
 
 When doing a Secure Launch, the IOMMU should always be enabled and the drivers
 loaded. However, IOMMU passthrough mode should never be used. This leaves the
-MLE completely exposed to DMA after the PMRs [2]_ are disabled. The current
+DLME completely exposed to DMA after the PMRs [2]_ are disabled. The current
 default mode is to use IOMMU in lazy translated mode, but strict translated
 mode, is the preferred IOMMU mode and this should be selected in the build
 configuration::
@@ -109,9 +110,9 @@ Intel TXT Interface
 
 The primary interfaces between the various components in TXT are the TXT MMIO
 registers and the TXT heap. The MMIO register banks are described in Appendix B
-of the TXT MLE [1]_ Development Guide.
+of the TXT MLE Development Guide.
 
-The TXT heap is described in Appendix C of the TXT MLE [1]_ Development
+The TXT heap is described in Appendix C of the TXT MLE Development
 Guide. Most of the TXT heap is predefined in the specification. The heap is
 initialized by firmware and the pre-launch environment and is subsequently used
 by the SINIT ACM. One section, called the OS to MLE Data Table, is reserved for
@@ -571,10 +572,68 @@ An error occurred in the Secure Launch module while mapping the Secure Launch
 Resource table. The underlying issue is memremap() failure, most likely due to
 a resource shortage.
 
+AMD SKINIT Interface
+====================
+
+This DRTM comes in two flavours: with DRTM service running in PSP/ASP and
+without one. The DRTM service effectively extends basic functionality of the
+SKINIT instruction providing stronger security guarantees at the cost of more
+complicated programming interface.
+
+As of the end of 2024 the DRTM service is available on Milan/Genoa platforms
+running suitable firmware releases. When firmware doesn't provide the service,
+simpler DRTM process is used.
+
+Basic SKINIT DRTM workflow is straightforward in its design. It defines only
+the bare minimum necessary to perform the DRTM and to pass some data from pre-
+to post-launch code. DRTM service extends the workflow by adding more metadata
+and performing some of the operations itself instead of leaving their
+implementation to a user-provided code (Secure Loader or SL).
+
+Secure Loader image is a binary to which SKINIT instruction passes control. The
+binary must start with a short header defined in the second volume of AMD64
+Architecture Programmer's Manual to have only two required fields. DRTM
+integration guide [4]_ adds an extended header which is mostly opaque and can be
+treated as reserved area in the kernel. Together these fields can be presented
+as the following structure::
+
+        struct sl_header {
+                u16 entry_point;
+                u16 image_size;
+                grub_uint8_t reserved[62];
+                /*
+                 * Any other fields, if present, are implementation-specific.
+                 */
+        } __packed;
+
+Secure Loader is loaded into Secure Loader Block (SLB) which is a 64 KiB area of
+RAM below 4 GiB that starts on a 64 KiB boundary. The smaller a particular SL
+image is, the more space is available for passing additional data which is to
+be placed after the image so it doesn't get measured by SKINIT.
+
+Passing of the information from bootloader to the kernel is carried out by the
+SLRT which is placed after the end of Secure Loader. A platform-specific entry
+of the SLRT is additionally linked as `setup_data` structure allowing the
+kernel to discover location of the SLRT by traversing boot parameters looking
+for the entry.
+
+Description of the header:
+
+=====================  ========================================================================
+Field                  Use
+=====================  ========================================================================
+entry_point            Offset from the start of the image
+image_size             How much of the SLB area is actually occupied by the image
+reserved               Data for DRTM service
+=====================  ========================================================================
+
 .. [1]
-    MLE: Measured Launch Environment is the binary runtime that is measured and
-    then run by the TXT SINIT ACM. The TXT MLE Development Guide describes the
-    requirements for the MLE in detail.
+    DLME: Dynamic Launch Measured Environment (which Intel calls MLE for
+    Measured Launch Environment) is the binary runtime that is measured and
+    then run by the DCE. The TXT MLE Development Guide describes the
+    requirements for the MLE in detail. Because AMD SKINIT doesn't impose any
+    specific requirements of that sort, TXT's format of MLE is used on AMD
+    devices as well for simplicity.
 
 .. [2]
     PMR: Intel VTd has a feature in the IOMMU called Protected Memory Registers.
@@ -585,3 +644,7 @@ a resource shortage.
 
 .. [3]
     Secure Launch Specification: https://trenchboot.org/specifications/Secure_Launch/
+
+.. [4]
+   Dynamic Root of Trust Measurement (DRTM) Service Integration Guide:
+   https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/user-guides/58453.pdf
diff --git a/Documentation/security/launch-integrity/secure_launch_overview.rst b/Documentation/security/launch-integrity/secure_launch_overview.rst
index 492f2b12e297..e9b8082314e1 100644
--- a/Documentation/security/launch-integrity/secure_launch_overview.rst
+++ b/Documentation/security/launch-integrity/secure_launch_overview.rst
@@ -47,9 +47,8 @@ documentation on these technologies can be readily found online; see
 the `Resources`_ section below for references.
 
 .. note::
-    Currently, only Intel TXT is supported in this first release of the Secure
-    Launch feature. AMD/Hygon SKINIT and Arm support will be added in a
-    subsequent release.
+    Currently, only Intel TXT and AMD/Hygon SKINIT are supported by the Secure
+    Launch feature. Arm support will be added later.
 
 To enable the kernel to be launched by GETSEC, the Secure Launch stub
 must be built into the setup section of the compressed kernel to handle the
@@ -112,22 +111,26 @@ Pre-launch: *Phase where the environment is prepared and configured to initiate
 the secure launch by the boot chain.*
 
  - The SLRT is initialized, and dl_stub is placed in memory.
- - Load the kernel, initrd and ACM [2]_ into memory.
- - Set up the TXT heap and page tables describing the MLE [1]_ per the
+ - Load the kernel, initrd and DCE [1]_ into memory.
+ - For TXT, set up the TXT heap and page tables describing the DLME [2]_ per the
    specification.
  - If non-UEFI platform, dl_stub is called.
  - If UEFI platform, SLRT registered with UEFI and efi-stub called.
  - Upon completion, efi-stub will call EBS followed by dl_stub.
  - The dl_stub will prepare the CPU and the TPM for the launch.
- - The secure launch is then initiated with the GETSET[SENTER] instruction.
+ - The secure launch is then initiated with either GETSEC[SENTER] (Intel) or
+   SKINIT (AMD) instruction.
 
-Post-launch: *Phase where control is passed from the ACM to the MLE and the secure
-kernel begins execution.*
+Post-launch: *Phase where control is passed from the DCE to the DLME and the
+secure kernel begins execution.*
 
  - Entry from the dynamic launch jumps to the SL stub.
- - SL stub fixes up the world on the BSP.
+ - For TXT, SL stub fixes up the world on the BSP.
  - For TXT, SL stub wakes the APs, fixes up their worlds.
  - For TXT, APs are left in an optimized (MONITOR/MWAIT) wait state.
+ - For SKINIT, APs are woken up mostly as usual except that the INIT IPIs aren't
+   sent before Startup IPIs to avoid compromising security. INIT IPIs were sent
+   to APs in pre-launch before issuing SKINIT, thus halting them.
  - SL stub jumps to startup_32.
  - SL main does validation of buffers and memory locations. It sets
    the boot parameter loadflag value SLAUNCH_FLAG to inform the main
@@ -137,16 +140,19 @@ kernel begins execution.*
  - Kernel boot proceeds normally from this point.
  - During early setup, slaunch_setup() runs to finish validation
    and setup tasks.
- - The SMP bring up code is modified to wake the waiting APs via the monitor
-   address.
+ - For AMD with DRTM service, Trusted Memory Region gets releases after
+   successful configuration of IOMMU.
+ - For TXT, the SMP bring up code is modified to wake the waiting APs via the
+   monitor address.
  - APs jump to rmpiggy and start up normally from that point.
  - SL platform module is registered as a late initcall module. It reads
    the TPM event log and extends the measurements taken into the TPM PCRs.
  - SL platform module initializes the securityfs interface to allow
-   access to the TPM event log and TXT public registers.
+   access to the TXT public registers on Intel and TPM event log everywhere.
  - Kernel boot finishes booting normally.
- - SEXIT support to leave SMX mode is present on the kexec path and
-   the various reboot paths (poweroff, reset, halt).
+ - On Intel SEXIT support to leave SMX mode is present on the kexec path and
+   the various reboot paths (poweroff, reset, halt). A similar finalization
+   (locking of DRTM localities) happens on AMD with DRTM service.
 
 PCR Usage
 =========
@@ -224,17 +230,30 @@ GRUB Secure Launch support:
 
 https://github.com/TrenchBoot/grub/tree/grub-sl-fc-38-dlstub
 
+secure-kernel-loader (Secure Loader for AMD SKINIT, a kind of DCE):
+
+https://github.com/TrenchBoot/secure-kernel-loader/
+
 FOSDEM 2021: Secure Upgrades with DRTM
 
 https://archive.fosdem.org/2021/schedule/event/firmware_suwd/
 
 .. [1]
-    MLE: Measured Launch Environment is the binary runtime that is measured and
-    then run by the TXT SINIT ACM. The TXT MLE Development Guide describes the
-    requirements for the MLE in detail.
+    DCE: Dynamic Configuration Environment. Either ACM (Intel's Authenticated
+    Code Module) for TXT or SKL (secure-kernel-loader) for AMD SKINIT.
+
+    ACM is a 32-bit binary blob that is run securely by the GETSEC[SENTER]
+    during a measured launch. It is described in the Intel documentation on TXT
+    and versions for various chipsets are signed and distributed by Intel.
+
+    SKL is an implementation of SL (Secure Loader) which is started securely by
+    SKINIT instruction in a flat 32-bit protected mode without paging. See AMD's
+    System Programming manual for more details on the format and operation.
 
 .. [2]
-    ACM: Intel's Authenticated Code Module. This is the 32b bit binary blob that
-    is run securely by the GETSEC[SENTER] during a measured launch. It is described
-    in the Intel documentation on TXT and versions for various chipsets are
-    signed and distributed by Intel.
+    DLME: Dynamic Launch Measured Environment (which Intel calls MLE for
+    Measured Launch Environment) is the binary runtime that is measured and
+    then run by the DCE. The TXT MLE Development Guide describes the
+    requirements for the MLE in detail. Because AMD SKINIT doesn't impose any
+    specific requirements of that sort, TXT's format of MLE is used on AMD
+    devices as well for simplicity.
-- 
2.49.0

