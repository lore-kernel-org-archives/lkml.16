Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2561EA7E7;
	Thu,  6 Feb 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848573; cv=none; b=O4wC3mtBUwpLDUllndcwqInPvAr0VAlEQlBSfwgm7s8QLpTAUYnP93/eDXWfybk9E09iqA3uMLyRnT+M+fJGdWbHOwjVe50NpbEGB4anKR2otzDC7xppN1OTmgqJn3HqIUBTWaJVCJdULplPzkzuXO6vVNyUHXhUeG56BwkOqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848573; c=relaxed/simple;
	bh=ke287oo305Uam86hfMT5albHkTPGceT7i4ZdUVTV7qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntiSy+mdjkPSxs2d/T1devIYgVXfxeVKacFbcGY9x4tjLbF16tzVStlosgQisbt0dd9HFcHG7NAniQwH3al9CTpGfvx0bAnrSfEM2vjVENPu7wAuD6jcomoJsJgjorjQGFT8Wns4ew/WuQw5hUpjRl3aLCNz+fApoJDKO7aCQgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LI5Cnhhe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LI5Cnhhe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66DCC4CEDD;
	Thu,  6 Feb 2025 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848573;
	bh=ke287oo305Uam86hfMT5albHkTPGceT7i4ZdUVTV7qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LI5CnhheIluEf6E0yT0RtPvHaYAUSlrYt6PYxNsdXVlD1mnmeL23vT7jUPIcsCGH7
	 7bROZIcwG83GSfk1kdHyjFtwYBfJMvN0yFn2dVTzscgnvSojIdtykNyLALyBPdYQdU
	 K0Bch5vpDoeXCbdMAZmaxmA+HlNug5/HmbekVQPF+a4OKOfVqgbaN0WXdL/xm10aMu
	 1y64lYXF1pTud4pkooN5cf/H/xqxZuWY6FVPvRyzqYSrU+K/oMXuPZwJhKinovYfIt
	 QPlHJFDiVyKKaP5GFcG/nG7Q6qzYqH5a9SjjmsXrnhE6IsSJfon/X3ZQz2lzG9adOL
	 g2XwZIlLqNlKw==
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
Subject: [PATCH v4 09/14] kexec: Add documentation for KHO
Date: Thu,  6 Feb 2025 15:27:49 +0200
Message-ID: <20250206132754.2596694-10-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Graf <graf@amazon.com>

With KHO in place, let's add documentation that describes what it is and
how to use it.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/kho/concepts.rst   | 80 ++++++++++++++++++++++++++++++++
 Documentation/kho/index.rst      | 19 ++++++++
 Documentation/kho/usage.rst      | 60 ++++++++++++++++++++++++
 Documentation/subsystem-apis.rst |  1 +
 MAINTAINERS                      |  1 +
 5 files changed, 161 insertions(+)
 create mode 100644 Documentation/kho/concepts.rst
 create mode 100644 Documentation/kho/index.rst
 create mode 100644 Documentation/kho/usage.rst

diff --git a/Documentation/kho/concepts.rst b/Documentation/kho/concepts.rst
new file mode 100644
index 000000000000..232bddacc0ef
--- /dev/null
+++ b/Documentation/kho/concepts.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=======================
+Kexec Handover Concepts
+=======================
+
+Kexec HandOver (KHO) is a mechanism that allows Linux to preserve state -
+arbitrary properties as well as memory locations - across kexec.
+
+It introduces multiple concepts:
+
+KHO Device Tree
+---------------
+
+Every KHO kexec carries a KHO specific flattened device tree blob that
+describes the state of the system. Device drivers can register to KHO to
+serialize their state before kexec. After KHO, device drivers can read
+the device tree and extract previous state.
+
+KHO only uses the fdt container format and libfdt library, but does not
+adhere to the same property semantics that normal device trees do: Properties
+are passed in native endianness and standardized properties like ``regs`` and
+``ranges`` do not exist, hence there are no ``#...-cells`` properties.
+
+KHO introduces a new concept to its device tree: ``mem`` properties. A
+``mem`` property can be inside any subnode in the device tree. When present,
+it contains an array of physical memory ranges that the new kernel must mark
+as reserved on boot. It is recommended, but not required, to make these ranges
+as physically contiguous as possible to reduce the number of array elements ::
+
+    struct kho_mem {
+            __u64 addr;
+            __u64 len;
+    };
+
+After boot, drivers can call the kho subsystem to transfer ownership of memory
+that was reserved via a ``mem`` property to themselves to continue using memory
+from the previous execution.
+
+The KHO device tree follows the in-Linux schema requirements. Any element in
+the device tree is documented via device tree schema yamls that explain what
+data gets transferred.
+
+Scratch Regions
+---------------
+
+To boot into kexec, we need to have a physically contiguous memory range that
+contains no handed over memory. Kexec then places the target kernel and initrd
+into that region. The new kernel exclusively uses this region for memory
+allocations before during boot up to the initialization of the page allocator.
+
+We guarantee that we always have such regions through the scratch regions: On
+first boot KHO allocates several physically contiguous memory regions. Since
+after kexec these regions will be used by early memory allocations, there is a
+scratch region per NUMA node plus a scratch region to satisfy allocations
+requests that do not require particilar NUMA node assignment.
+By default, size of the scratch region is calculated based on amount of memory
+allocated during boot. The ``kho_scratch`` kernel command line option may be used to explicitly define size of the scratch regions.
+The scratch regions are declared as CMA when page allocator is initialized so
+that their memory can be used during system lifetime. CMA gives us the
+guarantee that no handover pages land in that region, because handover pages
+must be at a static physical memory location and CMA enforces that only
+movable pages can be located inside.
+
+After KHO kexec, we ignore the ``kho_scratch`` kernel command line option and
+instead reuse the exact same region that was originally allocated. This allows
+us to recursively execute any amount of KHO kexecs. Because we used this region
+for boot memory allocations and as target memory for kexec blobs, some parts
+of that memory region may be reserved. These reservations are irrenevant for
+the next KHO, because kexec can overwrite even the original kernel.
+
+KHO active phase
+----------------
+
+To enable user space based kexec file loader, the kernel needs to be able to
+provide the device tree that describes the previous kernel's state before
+performing the actual kexec. The process of generating that device tree is
+called serialization. When the device tree is generated, some properties
+of the system may become immutable because they are already written down
+in the device tree. That state is called the KHO active phase.
diff --git a/Documentation/kho/index.rst b/Documentation/kho/index.rst
new file mode 100644
index 000000000000..5e7eeeca8520
--- /dev/null
+++ b/Documentation/kho/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+========================
+Kexec Handover Subsystem
+========================
+
+.. toctree::
+   :maxdepth: 1
+
+   concepts
+   usage
+
+.. only::  subproject and html
+
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/kho/usage.rst b/Documentation/kho/usage.rst
new file mode 100644
index 000000000000..e7300fbb309c
--- /dev/null
+++ b/Documentation/kho/usage.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+====================
+Kexec Handover Usage
+====================
+
+Kexec HandOver (KHO) is a mechanism that allows Linux to preserve state -
+arbitrary properties as well as memory locations - across kexec.
+
+This document expects that you are familiar with the base KHO
+:ref:`Documentation/kho/concepts.rst <concepts>`. If you have not read
+them yet, please do so now.
+
+Prerequisites
+-------------
+
+KHO is available when the ``CONFIG_KEXEC_HANDOVER`` config option is set to y
+at compile time. Every KHO producer may have its own config option that you
+need to enable if you would like to preserve their respective state across
+kexec.
+
+To use KHO, please boot the kernel with the ``kho=on`` command line
+parameter. You may use ``kho_scratch`` parameter to define size of the
+scratch regions. For example ``kho_scratch=512M,512M`` will reserve a 512
+MiB for a global scratch region and 512 MiB per NUMA node scratch regions
+on boot.
+
+Perform a KHO kexec
+-------------------
+
+Before you can perform a KHO kexec, you need to move the system into the
+:ref:`Documentation/kho/concepts.rst <KHO active phase>` ::
+
+  $ echo 1 > /sys/kernel/kho/active
+
+After this command, the KHO device tree is available in ``/sys/kernel/kho/dt``.
+
+Next, load the target payload and kexec into it. It is important that you
+use the ``-s`` parameter to use the in-kernel kexec file loader, as user
+space kexec tooling currently has no support for KHO with the user space
+based file loader ::
+
+  # kexec -l Image --initrd=initrd -s
+  # kexec -e
+
+The new kernel will boot up and contain some of the previous kernel's state.
+
+For example, if you used ``reserve_mem`` command line parameter to create
+an early memory reservation, the new kernel will have that memory at the
+same physical address as the old kernel.
+
+Abort a KHO exec
+----------------
+
+You can move the system out of KHO active phase again by calling ::
+
+  $ echo 1 > /sys/kernel/kho/active
+
+After this command, the KHO device tree is no longer available in
+``/sys/kernel/kho/dt``.
diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
index b52ad5b969d4..5fc69d6ff9f0 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -90,3 +90,4 @@ Other subsystems
    peci/index
    wmi/index
    tee/index
+   kho/index
diff --git a/MAINTAINERS b/MAINTAINERS
index e1e01b2a3727..82c2ef421c00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12828,6 +12828,7 @@ S:	Maintained
 W:	http://kernel.org/pub/linux/utils/kernel/kexec/
 F:	Documentation/ABI/testing/sysfs-firmware-kho
 F:	Documentation/ABI/testing/sysfs-kernel-kho
+F:	Documentation/kho/
 F:	include/linux/kexec.h
 F:	include/uapi/linux/kexec.h
 F:	kernel/kexec*
-- 
2.47.2

