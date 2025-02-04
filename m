Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A159221CA0A;
	Tue,  4 Feb 2025 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711800; cv=none; b=HnacoV/8WnQkLtpWk/W9K1PYS/sgyuBCOW6Nre3bcp7itWGYu0xrHZuesiH9ZJOryWdBXcM1QzvbnamDRhomPiZL0/xRugq3NcAs7ivYVECVn6ROO81jRN9flRjhIwTaHy236cuXir3Ud7HujzYq4NvpyUbDZwKDzU6ez+QljgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711800; c=relaxed/simple;
	bh=YOlrxkZ8d22LPE81YpV1JzX5Qd2R8B1n0xsY6MbNM/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FdpQAvnIA96v2RjaEXbab6i5h6jHuAT7ROpRT8qhRZ+PIvPjhReUh+oV5kIo2VhgANiKrqeLXFtwJbUdMgFTA976xifMFNZRvm8k5ewGYNSCnZmYgwKE4U5kaRIKG9n8E18088qRDyxcytjsSAsxY7mlUB0ChRN2ZA6OYVPtHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orCccSLH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orCccSLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C1BC4CEDF;
	Tue,  4 Feb 2025 23:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738711800;
	bh=YOlrxkZ8d22LPE81YpV1JzX5Qd2R8B1n0xsY6MbNM/w=;
	h=From:To:Cc:Subject:Date:From;
	b=orCccSLHeL/JnWevwnadrdLjPia3jN/UXkyKZjypID+DtrZhmThL98XDzlk7HcuyF
	 MOBe4oyUuYWWVc9LZnf5HF9T8M4TTzRUfdNy4VEn0HGXSqDhHGLU3UILIU/LiwymT6
	 hBmjyLbbVw+vkSHOV49kp79I355rI5hoVkky6OZxnAQwFdOJ5vg5laYyrx6HbUrimt
	 Q1brzR51m9yKD1q9GOJ93sRypuSHNC+8VIhuUKPcEon4yeReyZV/gsXxZOxafzfI7D
	 pmhqoBpZxBIcKkh5qAPhAYeWKSDoOaotCfOI52hBUwYMLJiiDCyEuB4sikY7VuMKwT
	 2+kvpi012Thdg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Beata Michalska <beata.michalska@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] drm/panthor: Convert IOCTL defines to an enum
Date: Tue,  4 Feb 2025 17:28:24 -0600
Message-ID: <20250204232824.3819437-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use an enum instead of #defines for panthor IOCTLs. This allows the
header to be used with Rust code as bindgen can't handle complex
defines.

Cc: Beata Michalska <beata.michalska@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/uapi/drm/panthor_drm.h | 86 +++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index b99763cbae48..97e2c4510e69 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -129,48 +129,6 @@ enum drm_panthor_ioctl_id {
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
 };
 
-/**
- * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
- * @__access: Access type. Must be R, W or RW.
- * @__id: One of the DRM_PANTHOR_xxx id.
- * @__type: Suffix of the type being passed to the IOCTL.
- *
- * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
- * values instead.
- *
- * Return: An IOCTL number to be passed to ioctl() from userspace.
- */
-#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
-	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
-			   struct drm_panthor_ ## __type)
-
-#define DRM_IOCTL_PANTHOR_DEV_QUERY \
-	DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query)
-#define DRM_IOCTL_PANTHOR_VM_CREATE \
-	DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create)
-#define DRM_IOCTL_PANTHOR_VM_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy)
-#define DRM_IOCTL_PANTHOR_VM_BIND \
-	DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind)
-#define DRM_IOCTL_PANTHOR_VM_GET_STATE \
-	DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state)
-#define DRM_IOCTL_PANTHOR_BO_CREATE \
-	DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create)
-#define DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET \
-	DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset)
-#define DRM_IOCTL_PANTHOR_GROUP_CREATE \
-	DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create)
-#define DRM_IOCTL_PANTHOR_GROUP_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy)
-#define DRM_IOCTL_PANTHOR_GROUP_SUBMIT \
-	DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit)
-#define DRM_IOCTL_PANTHOR_GROUP_GET_STATE \
-	DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state)
-#define DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE \
-	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
-#define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
-
 /**
  * DOC: IOCTL arguments
  */
@@ -1019,6 +977,50 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
+ * @__access: Access type. Must be R, W or RW.
+ * @__id: One of the DRM_PANTHOR_xxx id.
+ * @__type: Suffix of the type being passed to the IOCTL.
+ *
+ * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
+ * values instead.
+ *
+ * Return: An IOCTL number to be passed to ioctl() from userspace.
+ */
+#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
+	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
+			   struct drm_panthor_ ## __type)
+
+enum {
+	DRM_IOCTL_PANTHOR_DEV_QUERY =
+		DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query),
+	DRM_IOCTL_PANTHOR_VM_CREATE =
+		DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create),
+	DRM_IOCTL_PANTHOR_VM_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy),
+	DRM_IOCTL_PANTHOR_VM_BIND =
+		DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind),
+	DRM_IOCTL_PANTHOR_VM_GET_STATE =
+		DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state),
+	DRM_IOCTL_PANTHOR_BO_CREATE =
+		DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create),
+	DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET =
+		DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset),
+	DRM_IOCTL_PANTHOR_GROUP_CREATE =
+		DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create),
+	DRM_IOCTL_PANTHOR_GROUP_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy),
+	DRM_IOCTL_PANTHOR_GROUP_SUBMIT =
+		DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit),
+	DRM_IOCTL_PANTHOR_GROUP_GET_STATE =
+		DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state),
+	DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE =
+		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
+	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.47.2

