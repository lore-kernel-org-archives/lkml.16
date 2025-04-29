Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163182C1E3E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926863; cv=none; b=WDpxtKkVSQLDITXWL1p7px24VX9YuDSZbz+0Udxy3F9Nyf1jKc+Orinpi+sMwf3G2GiIdNPMyWv2FPqSeg65MYE6Nn43wJoRQbVcqn4I9yU2AF0u9A3mBm0rZJuicZOVNHEAX3Tk8sfnoIEVp7B9MpxTApMDMZ6zT52Ub3DHEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926863; c=relaxed/simple;
	bh=7SGr5L2ykKUQUo0zMXmWvlFQAdQphSQN1gFTLVtW/kQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g2ePLOXKNQ82O9aCcOiFm7xMFaGWCo7CPeGBuDqJJui2PE7v2eTMFoaIdFLyo872kEZUSagDzzdUK0Kmo3aXql5eo5fc0wxB5dlxUiqgUjGPEGHkoQHqwSjmIWbMAByIpEeMSnrkamGVBQZz9Ehj5eNciw/dzfWB7RBIf5q/wCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=UEVQA2J0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="UEVQA2J0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22409077c06so93534335ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1745926860; x=1746531660; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IM+UHTytJ9Y87riWBhkcJwJWVcuRu3WOtIkNDsfDBl0=;
        b=UEVQA2J0mnZ4tltQ6CYZbckQXhSFf1fySIZ7Lk1Dtxnv0CobDX0FbIo3vKWP6M5cf1
         1CebRUQHB8RsktP2orHf1RomE1mHvoP+DgqAPrD0LJj4jjs7mfqgJx0HHQ4e7p2T1vtn
         WEGQvUJIWQAxumsvffi3A5yvgWaZx+m8fk5uDe+SiDSrZVZocruf5tHDRaqp+e16V3j1
         urRlk1HX3+ol+DaGlYVlFV6Ocy7pxUPHqsVWkaHe+D3DcEYufSlUxLJU1FnzpNWdbSoE
         Nqr8HZyCI7m/4Sc41p3Zudu9KGfleDQv8vxKeDsLTjLdls7Lgu/zXovnNKbISuwsanvn
         cnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745926860; x=1746531660;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IM+UHTytJ9Y87riWBhkcJwJWVcuRu3WOtIkNDsfDBl0=;
        b=I+jCA2fk2aOioXHFsSeM8rGSRnBiAVmtwkOBlRkZIt76kzKv3kq9QCfRgRWMnFhAi5
         WIOJMPVaXCG2GNU77ad6HaAlK5tW8c0OpWf91zBo/Oq5M/L0mVkXp0CL/m3Ks9Zf8RgY
         /tE3Vs0FTrwG7rXSYsRTXS+cGD8+NoJeVQMAfz0rOM+TUjyQwIS2iSOhzXMw1y/TXy0i
         Ct9awb21H7SoeBlp8bjpef74NtU7WGhrb96aBB96evSsOYqdC6MgFlW8PI9qovj02ayT
         4yhxhJXFzUyliUOPJ13LxBpAClyK4CXmrFOTQlbxnRett0erFOAXVA1NiHFdohg/1WIi
         0RzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeXxE6R7b0woh2zxRXcASqeXzcQAzTRoLGc1o8pV7zsNqSe6aMdlbe/ukgQVxHq1CjzLbTHFcnyI02HfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHoPfpTs0cehtqqBzjV5uoZBjWPfHFWs3j9Xwh44a3OkE/Acw
	q/Xq3tlZEcsMmFPUvOK1Twvtjd6czoYZRhn2KlA1tfgdo3MhmynQy5jkKILDTA==
X-Gm-Gg: ASbGncvsHfjPgmWQtWuSgHzg3Ho+S+qqnrwIJ01x+jCo/W/Pj4tfmwqcFV2Xc2jj0zG
	KbXqlABj/HGl4V9BFZYOtPPUIPdU5uhzfRngzXEXvHtEYsK4V1x3gy8CLNIKCzD72nE00Us19xT
	ximiN5PjALS2nxEj7A2YhFDM7gfSfUE3bOYvYizSjr5qH8b3HBpjwhpki8MRsNIkdBsK5a43E/1
	FoO8PEgwuSUtqKsCdq5JQz+U+Os+4OaRqgqeALBOQ/oA1zcje48hEATmxaAQPyxI88h5PJxaQDg
	cKnA43WM/wg8fPHjIUxocOLbJPxPWAmGoHDpvsrqzqOTP24=
X-Google-Smtp-Source: AGHT+IG6h0HHRXrsi+68eBFAUCkILWGOJ0frcIcsejrUedyFb58NXfg6Bej0I0Y1stpuMX2kzWtw0Q==
X-Received: by 2002:a17:902:da92:b0:224:2717:7993 with SMTP id d9443c01a7336-22de60703c9mr49480895ad.45.1745926860206;
        Tue, 29 Apr 2025 04:41:00 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51051c6sm99984995ad.206.2025.04.29.04.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 04:40:59 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 29 Apr 2025 17:09:26 +0530
Subject: [PATCH v2] rust: kernel: device: Add
 devm_of_platform_populate/depopulate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAG26EGgC/32NTQqDMBSEryJv3RTz08a66j2Ki6jPGBATXqK0S
 O7e1AOUWX0D880BEclhhLY6gHB30fm1gLhUMMxmtcjcWBhELW61Eg2jLSbmJxZ82BaTkPViety
 5bqRSHMosEE7ufSpfXeHZxeTpcz7s/Nf+ke2clYxSaq2V0IN69mjsgr03NF49Wehyzl+3ODG2t
 gAAAA==
X-Change-ID: 20250428-rust-of-populate-b2f961783441
To: Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=7SGr5L2ykKUQUo0zMXmWvlFQAdQphSQN1gFTLVtW/kQ=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoELq7qod87HsYICQmfxD37VQj5JMKjlH5zmmss
 sxUP2OTqw6JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaBC6uwAKCRAFzvXHieVa
 dPZDEACUNeVD0+9TD2cq2U5DhZLNx2BQL9Rc6QKKvwLvD3ZglCCSZDltWrCoFoC1g8xtzrPOGHP
 HspKUMsTlILXLmmqI9dCyHlDsHDak5UJSDzXm4BWJcr8py2jbZbVKQ0uZ3sQpRK6c4hO3RwZ1NQ
 pYZEE9hHVJFlLutOXvfmC7idYIi+1hvEAVB0XpPcOInkGVdBXhWFxeme19/TxphVDRqeSr3Aq7e
 FodBQ3tM5TB5Ann/Yt4naeTaIU8sHlbFle/4NY9rGJIG/nNFJGkOFdgJQ+kx87N71po1yRIQQXr
 nIVL7qK8811i6BpRXDa7tvM8ZoSRaDlVMo0QvKTs3MhGH01N9bSSAZN2DNFxzIKSdoPPnGkvR2o
 +ZxD1xz6wpztcCKxnWSYiUpsfZoqtADM6yg/83tcmO42AXvgH8o3dppK6hzeOAi/Px7t/8sN3RP
 0lTHo00JVRYSW2QutKwvsO84Fma7tJHX4B+YNljluR4xYXcZBNxBxCbBLts/MqrhMWd9GW0KGG5
 8zJXomFwcL+s8SX3RBpYcTmetsxmPwk1y2zDBPyX0o4iQRgeRBn77Sd5Y43SkzUHUmuwJ0qF9Q4
 AwRPdAjeoLD48g7WafqZ9uw21vKZYvUtESTu4wIxpRR0G1vSJ8sPAq0RleCaniGhFvZ5H/RlOH3
 RJJuro8NEDElntw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add abstractions for devm_of_platform_populate and
devm_of_platform_depopulate.

Can only be used with a bound device.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Allow calling platform_populate/depopulate from Rust code.

To see how the bindings look in usage, see my working tree [0] for a
connector driver  I am working on.

[0]: https://github.com/Ayush1325/linux/commits/b4/beagle-cape/
---
Changes in v2:
- Rename to devm_of_platform_populate/depopulate.
- Add SAFETY comments.
- Implement only for bound device
- Import to_result
- Link to v1: https://lore.kernel.org/r/20250428-rust-of-populate-v1-1-1d33777427c4@beagleboard.org
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/device.rs           | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8a2add69e5d66d1c2ebed9d2c950380e61c48842..51ec0754960377e5fc6bc0703487bf2086eff0e6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -25,6 +25,7 @@
 #include <linux/mdio.h>
 #include <linux/miscdevice.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/pci.h>
 #include <linux/phy.h>
 #include <linux/pid_namespace.h>
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 40c1f549b0bae9fd9aa3f41539ccb69896c2560d..dc52abeb114792fcecce469c11e336c23c4b1c00 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,6 +6,7 @@
 
 use crate::{
     bindings,
+    error::to_result,
     str::CStr,
     types::{ARef, Opaque},
 };
@@ -209,6 +210,20 @@ pub fn property_present(&self, name: &CStr) -> bool {
     }
 }
 
+impl Device<Bound> {
+    /// Populate platform_devices from device tree data
+    pub fn devm_of_platform_populate(&self) -> crate::error::Result<()> {
+        // SAFETY: self is valid bound Device reference
+        to_result(unsafe { bindings::devm_of_platform_populate(self.as_raw()) })
+    }
+
+    /// Remove devices populated from device tree
+    pub fn devm_of_platform_depopulate(&self) {
+        // SAFETY: self is valid bound Device reference
+        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
+    }
+}
+
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
 // argument.
 kernel::impl_device_context_deref!(unsafe { Device });

---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250428-rust-of-populate-b2f961783441

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

