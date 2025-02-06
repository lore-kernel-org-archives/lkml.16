Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF61624F3;
	Thu,  6 Feb 2025 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848619; cv=none; b=OhgbIjJJCWa3f7TZzExgVFsTQoxDeyUdeDgfd31TW8Zz+q6oZUdIIU8wyEVWlJo7658sVO7sTtKxtrVF+YKQS/hktBu0ojvGEuS0bSP8pGZDnMb7v9BeB+iSgPXa7dnaZFwtUZXWLCxMt5XfVjIJg8QZI2PJEzs311CvPfgZPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848619; c=relaxed/simple;
	bh=DEPWTj2lMxZNBMBbVuId7YwohjOTilwE4mRuWlbJrXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjJA4jr+XA/UIa6hW8PTz42zv+nfi5nOleCefnUIeL+7OJh7OnZByfFJR8hCgscLbkjUeIaASX4rLWYX3F0eMoGcuE5EJILSeuwrOMTEe8NGnKtQ+IpZgzG5JAWoVFKqheRigex+/0VmUqebbjk9+nyxjoKvW0YJTUYSkhJS3CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHyCveIB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHyCveIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB81C4CEE8;
	Thu,  6 Feb 2025 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848618;
	bh=DEPWTj2lMxZNBMBbVuId7YwohjOTilwE4mRuWlbJrXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JHyCveIB+H+hP369+oAVupUsNOhw1rXCFbz/HMMrekGHYAW5g4PNpWIwrA8MwexgL
	 4yMDEsor1brMgVYnrKTNOKQMYqerjM3u2rtawVm++rzJDLZojHWhKDBkq33U5MfHSV
	 NQtV2EFA/lMKTVnsQP2JZSAaMs3oEfA7VLfyV889coTXhhEVxMdqkij+tqxaqUj2Tc
	 +ihizHttzw+XGMKcXveRsjk85ki9HH1SFWo0iThELJ22q8Xi9jHv9Q91sHpsMVossU
	 ZgFgJe+G3yxv9QmNthG7QhvnBHAriJsMyUex426XIiM46CWpwr37AZ05MfQc08FbZ1
	 R1sab0YI6csgw==
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
Subject: [PATCH v4 14/14] Documentation: KHO: Add memblock bindings
Date: Thu,  6 Feb 2025 15:27:54 +0200
Message-ID: <20250206132754.2596694-15-rppt@kernel.org>
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

We introduced KHO into Linux: A framework that allows Linux to pass
metadata and memory across kexec from Linux to Linux. KHO reuses fdt
as file format and shares a lot of the same properties of firmware-to-
Linux boot formats: It needs a stable, documented ABI that allows for
forward and backward compatibility as well as versioning.

As first user of KHO, we introduced memblock which can now preserve
memory ranges reserved with reserve_mem command line options contents
across kexec, so you can use the post-kexec kernel to read traces from
the pre-kexec kernel.

This patch adds memblock schemas similar to "device" device tree ones to
a new kho bindings directory. This allows us to force contributors to
document the data that moves across KHO kexecs and catch breaking change
during review.

Co-developed-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../kho/bindings/memblock/reserve_mem.yaml    | 41 ++++++++++++++++++
 .../bindings/memblock/reserve_mem_map.yaml    | 42 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/kho/bindings/memblock/reserve_mem.yaml
 create mode 100644 Documentation/kho/bindings/memblock/reserve_mem_map.yaml

diff --git a/Documentation/kho/bindings/memblock/reserve_mem.yaml b/Documentation/kho/bindings/memblock/reserve_mem.yaml
new file mode 100644
index 000000000000..7b01791b10b3
--- /dev/null
+++ b/Documentation/kho/bindings/memblock/reserve_mem.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memblock/reserve_mem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Memblock reserved memory
+
+maintainers:
+  - Mike Rapoport <rppt@kernel.org>
+
+description: |
+  Memblock can serialize its current memory reservations created with
+  reserve_mem command line option across kexec through KHO.
+  The post-KHO kernel can then consume these reservations and they are
+  guaranteed to have the same physical address.
+
+properties:
+  compatible:
+    enum:
+      - reserve_mem-v1
+
+patternProperties:
+  "$[0-9a-f_]+^":
+    $ref: reserve_mem_map.yaml#
+    description: reserved memory regions
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    reserve_mem {
+      compatible = "reserve_mem-v1";
+        r1 {
+          compatible = "reserve_mem_map-v1";
+          mem = <0xc07c 0x2000000 0x01 0x00>;
+        };
+    };
diff --git a/Documentation/kho/bindings/memblock/reserve_mem_map.yaml b/Documentation/kho/bindings/memblock/reserve_mem_map.yaml
new file mode 100644
index 000000000000..09001c5f2124
--- /dev/null
+++ b/Documentation/kho/bindings/memblock/reserve_mem_map.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memblock/reserve_mem_map.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Memblock reserved memory regions
+
+maintainers:
+  - Mike Rapoport <rppt@kernel.org>
+
+description: |
+  Memblock can serialize its current memory reservations created with
+  reserve_mem command line option across kexec through KHO.
+  This object describes each such region.
+
+properties:
+  compatible:
+    enum:
+      - reserve_mem_map-v1
+
+  mem:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Array of { u64 phys_addr, u64 len } elements that describe a list of
+      memory ranges.
+
+required:
+  - compatible
+  - mem
+
+additionalProperties: false
+
+examples:
+  - |
+    reserve_mem {
+      compatible = "reserve_mem-v1";
+        r1 {
+          compatible = "reserve_mem_map-v1";
+          mem = <0xc07c 0x2000000 0x01 0x00>;
+        };
+    };
-- 
2.47.2

