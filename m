Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE08C139CF2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621231; cv=none; b=NvSB5lo4ZkOO5tSw5IPKUqfMBPexuBTM0URVTESo5MrhI340RXGUp073WXOKDgBqL8cwVrorZwJhM5UgsMx4/wWS0O0ScxBUaryvfVMK7PY4PD/pbEwY1n71kBkuYGXGlfdNggainKle8hvvS+rY+jTIOPs/rN2Iyvd3TLaQkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621231; c=relaxed/simple;
	bh=YpofQFwIvCVyxZPNWfzHdfjvLBjY8hOmPZucYsVbXJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8TybvaQUaLUiEdd2AhsBt9PKvEw3iuiLakerhmfjEt3q/mwuHi6HwHVjjdQ51CZLL51zoVRNL7QSpe8z7la7CgslIQCYX4f0ktbdhiW5WGoyizMH1edHalwleqzPFpn971nPKMgCVDIqOcxSstZ6YnLwa1hcm7lVvw3/CNLqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clgBGfau; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clgBGfau"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B47C4CEDD;
	Wed,  2 Apr 2025 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743621231;
	bh=YpofQFwIvCVyxZPNWfzHdfjvLBjY8hOmPZucYsVbXJI=;
	h=Date:From:To:Cc:Subject:From;
	b=clgBGfauWI15UmY4C2mGjxk6lLCWsSrbHIX2m1Anzk391Qhs4/xmij4x+w58Tb8QW
	 aZFabx42ey1JCtkeKf86mpqtjDM7GycrF4d9kjPWiutC9AnnN56cxWKAFM+RKsXz9g
	 YbCDl9kh8h7N7naxhz4Dv6M4BpKZR8n0YRqAwdBNiD4+jIdq7NKnjp2T5JxjSgCshx
	 SR37h/hQPM6TlVJ9Z/nHpDQrv6Wlko+NgbaPpuEkDOZIXW7OyC2ikvPhs3LlW1eAVE
	 9/m5jIx9sEQb78m/KD23XxKEIzbspyvNM8UAL33K+JunC9MZtkqELoImD7ar+MVw6E
	 N2cvW9LsUfDrQ==
Date: Wed, 2 Apr 2025 09:13:50 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH sched_ext/for-6.15-fixes] tools/sched_ext: Sync with scx repo
Message-ID: <Z-2Mbg1BWnTUwaua@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 2bac648dab395be0ad0d55b9c2ae7723e71e233e Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Wed, 2 Apr 2025 09:08:33 -1000

Synchronize with https://github.com/sched-ext/scx at dc44584874f0 ("kernel:
Synchronize with kernel tools/sched_ext").

- READ/WRITE_ONCE() is made more proper and READA_ONCE_ARENA() is dropped.

- scale_by_task_weight[_inverse]() helpers added.

- Enum defs expanded to cover more and new enums.

- Don't trigger fatal error when some enums are missing from kernel BTF.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
Applied to sched_ext/for-6.15-fixes.

Thanks.

 tools/sched_ext/include/scx/common.bpf.h      | 85 +++++++++++++------
 .../sched_ext/include/scx/enum_defs.autogen.h |  3 +
 .../sched_ext/include/scx/enums.autogen.bpf.h | 24 ++++++
 tools/sched_ext/include/scx/enums.autogen.h   |  8 ++
 tools/sched_ext/include/scx/enums.h           |  3 +-
 5 files changed, 94 insertions(+), 29 deletions(-)

diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
index dc4333d23189..8787048c6762 100644
--- a/tools/sched_ext/include/scx/common.bpf.h
+++ b/tools/sched_ext/include/scx/common.bpf.h
@@ -586,36 +586,48 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 	}
 }
 
-#define READ_ONCE(x)					\
-({							\
-	union { typeof(x) __val; char __c[1]; } __u =	\
-		{ .__c = { 0 } };			\
-	__read_once_size(&(x), __u.__c, sizeof(x));	\
-	__u.__val;					\
-})
-
-#define WRITE_ONCE(x, val)				\
-({							\
-	union { typeof(x) __val; char __c[1]; } __u =	\
-		{ .__val = (val) }; 			\
-	__write_once_size(&(x), __u.__c, sizeof(x));	\
-	__u.__val;					\
-})
-
-#define READ_ONCE_ARENA(type, x)				\
-({								\
-	union { type __val; char __c[1]; } __u =		\
-		{ .__c = { 0 } };				\
-	__read_once_size((void *)&(x), __u.__c, sizeof(x));	\
-	__u.__val;						\
+/*
+ * __unqual_typeof(x) - Declare an unqualified scalar type, leaving
+ *			non-scalar types unchanged,
+ *
+ * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'
+ * is not type-compatible with 'signed char', and we define a separate case.
+ *
+ * This is copied verbatim from kernel's include/linux/compiler_types.h, but
+ * with default expression (for pointers) changed from (x) to (typeof(x)0).
+ *
+ * This is because LLVM has a bug where for lvalue (x), it does not get rid of
+ * an extra address_space qualifier, but does in case of rvalue (typeof(x)0).
+ * Hence, for pointers, we need to create an rvalue expression to get the
+ * desired type. See https://github.com/llvm/llvm-project/issues/53400.
+ */
+#define __scalar_type_to_expr_cases(type) \
+	unsigned type : (unsigned type)0, signed type : (signed type)0
+
+#define __unqual_typeof(x)                              \
+	typeof(_Generic((x),                            \
+		char: (char)0,                          \
+		__scalar_type_to_expr_cases(char),      \
+		__scalar_type_to_expr_cases(short),     \
+		__scalar_type_to_expr_cases(int),       \
+		__scalar_type_to_expr_cases(long),      \
+		__scalar_type_to_expr_cases(long long), \
+		default: (typeof(x))0))
+
+#define READ_ONCE(x)								\
+({										\
+	union { __unqual_typeof(x) __val; char __c[1]; } __u =			\
+		{ .__c = { 0 } };						\
+	__read_once_size((__unqual_typeof(x) *)&(x), __u.__c, sizeof(x));	\
+	__u.__val;								\
 })
 
-#define WRITE_ONCE_ARENA(type, x, val)				\
-({								\
-	union { type __val; char __c[1]; } __u =		\
-		{ .__val = (val) }; 				\
-	__write_once_size((void *)&(x), __u.__c, sizeof(x));	\
-	__u.__val;						\
+#define WRITE_ONCE(x, val)							\
+({										\
+	union { __unqual_typeof(x) __val; char __c[1]; } __u =			\
+		{ .__val = (val) }; 						\
+	__write_once_size((__unqual_typeof(x) *)&(x), __u.__c, sizeof(x));	\
+	__u.__val;								\
 })
 
 /*
@@ -648,6 +660,23 @@ static inline u32 log2_u64(u64 v)
                 return log2_u32(v) + 1;
 }
 
+/*
+ * Return a value proportionally scaled to the task's weight.
+ */
+static inline u64 scale_by_task_weight(const struct task_struct *p, u64 value)
+{
+	return (value * p->scx.weight) / 100;
+}
+
+/*
+ * Return a value inversely proportional to the task's weight.
+ */
+static inline u64 scale_by_task_weight_inverse(const struct task_struct *p, u64 value)
+{
+	return value * 100 / p->scx.weight;
+}
+
+
 #include "compat.bpf.h"
 #include "enums.bpf.h"
 
diff --git a/tools/sched_ext/include/scx/enum_defs.autogen.h b/tools/sched_ext/include/scx/enum_defs.autogen.h
index 6e6c45f14fe1..c2c33df9292c 100644
--- a/tools/sched_ext/include/scx/enum_defs.autogen.h
+++ b/tools/sched_ext/include/scx/enum_defs.autogen.h
@@ -88,6 +88,8 @@
 #define HAVE_SCX_OPS_ENQ_LAST
 #define HAVE_SCX_OPS_ENQ_EXITING
 #define HAVE_SCX_OPS_SWITCH_PARTIAL
+#define HAVE_SCX_OPS_ENQ_MIGRATION_DISABLED
+#define HAVE_SCX_OPS_ALLOW_QUEUED_WAKEUP
 #define HAVE_SCX_OPS_HAS_CGROUP_WEIGHT
 #define HAVE_SCX_OPS_ALL_FLAGS
 #define HAVE_SCX_OPSS_NONE
@@ -104,6 +106,7 @@
 #define HAVE_SCX_RQ_BAL_PENDING
 #define HAVE_SCX_RQ_BAL_KEEP
 #define HAVE_SCX_RQ_BYPASSING
+#define HAVE_SCX_RQ_CLK_VALID
 #define HAVE_SCX_RQ_IN_WAKEUP
 #define HAVE_SCX_RQ_IN_BALANCE
 #define HAVE_SCX_TASK_NONE
diff --git a/tools/sched_ext/include/scx/enums.autogen.bpf.h b/tools/sched_ext/include/scx/enums.autogen.bpf.h
index 0e941a0d6f88..2f8002bcc19a 100644
--- a/tools/sched_ext/include/scx/enums.autogen.bpf.h
+++ b/tools/sched_ext/include/scx/enums.autogen.bpf.h
@@ -13,6 +13,30 @@ const volatile u64 __SCX_SLICE_DFL __weak;
 const volatile u64 __SCX_SLICE_INF __weak;
 #define SCX_SLICE_INF __SCX_SLICE_INF
 
+const volatile u64 __SCX_RQ_ONLINE __weak;
+#define SCX_RQ_ONLINE __SCX_RQ_ONLINE
+
+const volatile u64 __SCX_RQ_CAN_STOP_TICK __weak;
+#define SCX_RQ_CAN_STOP_TICK __SCX_RQ_CAN_STOP_TICK
+
+const volatile u64 __SCX_RQ_BAL_PENDING __weak;
+#define SCX_RQ_BAL_PENDING __SCX_RQ_BAL_PENDING
+
+const volatile u64 __SCX_RQ_BAL_KEEP __weak;
+#define SCX_RQ_BAL_KEEP __SCX_RQ_BAL_KEEP
+
+const volatile u64 __SCX_RQ_BYPASSING __weak;
+#define SCX_RQ_BYPASSING __SCX_RQ_BYPASSING
+
+const volatile u64 __SCX_RQ_CLK_VALID __weak;
+#define SCX_RQ_CLK_VALID __SCX_RQ_CLK_VALID
+
+const volatile u64 __SCX_RQ_IN_WAKEUP __weak;
+#define SCX_RQ_IN_WAKEUP __SCX_RQ_IN_WAKEUP
+
+const volatile u64 __SCX_RQ_IN_BALANCE __weak;
+#define SCX_RQ_IN_BALANCE __SCX_RQ_IN_BALANCE
+
 const volatile u64 __SCX_DSQ_FLAG_BUILTIN __weak;
 #define SCX_DSQ_FLAG_BUILTIN __SCX_DSQ_FLAG_BUILTIN
 
diff --git a/tools/sched_ext/include/scx/enums.autogen.h b/tools/sched_ext/include/scx/enums.autogen.h
index 88137a140e72..fedec938584b 100644
--- a/tools/sched_ext/include/scx/enums.autogen.h
+++ b/tools/sched_ext/include/scx/enums.autogen.h
@@ -8,6 +8,14 @@
 	SCX_ENUM_SET(skel, scx_public_consts, SCX_OPS_NAME_LEN); \
 	SCX_ENUM_SET(skel, scx_public_consts, SCX_SLICE_DFL); \
 	SCX_ENUM_SET(skel, scx_public_consts, SCX_SLICE_INF); \
+	SCX_ENUM_SET(skel, scx_rq_flags, SCX_RQ_ONLINE); \
+	SCX_ENUM_SET(skel, scx_rq_flags, SCX_RQ_CAN_STOP_TICK); \
+	SCX_ENUM_SET(skel, scx_rq_flags, SCX_RQ_BAL_PENDING); \
+	SCX_ENUM_SET(skel, scx_rq_flags, SCX_RQ_BAL_KEEP); \
+	SCX_ENUM_SET(skel, scx_rq_flags, SCX_RQ_BYPASSING); \
+	SCX_ENUM_SET(skel, scx_rq_flags, SCX_RQ_CLK_VALID); \
+	SCX_ENUM_SET(skel, scx_rq_flags, SCX_RQ_IN_WAKEUP); \
+	SCX_ENUM_SET(skel, scx_rq_flags, SCX_RQ_IN_BALANCE); \
 	SCX_ENUM_SET(skel, scx_dsq_id_flags, SCX_DSQ_FLAG_BUILTIN); \
 	SCX_ENUM_SET(skel, scx_dsq_id_flags, SCX_DSQ_FLAG_LOCAL_ON); \
 	SCX_ENUM_SET(skel, scx_dsq_id_flags, SCX_DSQ_INVALID); \
diff --git a/tools/sched_ext/include/scx/enums.h b/tools/sched_ext/include/scx/enums.h
index 34cbebe974b7..8e7c91575f0b 100644
--- a/tools/sched_ext/include/scx/enums.h
+++ b/tools/sched_ext/include/scx/enums.h
@@ -14,7 +14,8 @@ static inline void __ENUM_set(u64 *val, char *type, char *name)
 	bool res;
 
 	res = __COMPAT_read_enum(type, name, val);
-	SCX_BUG_ON(!res, "enum not found(%s)", name);
+	if (!res)
+		*val = 0;
 }
 
 #define SCX_ENUM_SET(skel, type, name) do {			\
-- 
2.49.0


