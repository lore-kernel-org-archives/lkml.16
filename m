Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD94262FDE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850173; cv=none; b=sUdXA6pTjx4CYvh6Upu+rQBbk7f/cNbtfmJ+t/ZIrBq/OWh5wJfKH2zovXGLQVK7xmy4fH7nQ9PI6J6PTUT618n+tCCl91KI85mHC6WgUsRtyQ6Flt1UPzG9ZRlooVCExo6G6SXVaXSd18FVa3dq1EWNVxSTydOdITAjEbe1gig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850173; c=relaxed/simple;
	bh=hZEdc0bpwJBdYluEz9kgtxHO3SQNNIVXhxeoIhEyHBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JxKxNcpX0QvR9wX7uSkOWG4UFJSnWVBx4YlJSzSZPy+S4/kcuYn4TMmnI8eRIGhIPg8E1H015iUq+zN85tmtYhhzOeOt2FgsxAaJCAtZg1fvzpxlCCPxHRHp/Jb5jIVeyZm/H8PRGFjQZbbEYdTeLTg+RHLt43LrrkPKdD4wOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=slVRI8F9; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="slVRI8F9"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af50f56b862so3299245a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1745850171; x=1746454971; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1VLQpwt/b6cSsAE8AUGeAK7cqEZniw2aJSi1QifTAo=;
        b=slVRI8F9y2Beinolo+2xYjslmN7m0uhtXJ3CrUhoGZ8YMrFPZdITw2JpR/7KUzZbxA
         1MNoGTKRtGlRLFmQq7FkxjszdnKxsAVgALpBbeAihOpNEnSC4IxoJXgwgEX8aBDm8zWK
         SbDZBEawzVYkfF9u9fTNpoCqDNfaiGa9GezOBSqdU72yJaqXtarvI4ATRvx0o9gCYMA7
         s9PKDGNJU2UkdSKwdA8AKlqcLMfKw00c2/M9Cj4MaoAx58sszQA+Js7MOO0fb49L4QMX
         zAm7MvueEmLPh3LzwcPQDeyBEQTFLDNnsKyzGTa+JVMN+INyyKaDAjIrY9IzjbtRq9jK
         24Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850171; x=1746454971;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1VLQpwt/b6cSsAE8AUGeAK7cqEZniw2aJSi1QifTAo=;
        b=TfjrGR6VjsKSkgayVpjRC075H0V0oVWX7pkh6ltP25kncZnfo9RcKVLLS01Z/Ln/hj
         lWpLwyhHCeXXtn+KOcrvs0fXWPV0F2+6J+s5VWgUdgDqqowOwkQHIjkfpc30hi+Us1s6
         MZfUj8jcMhu2cmvR8PxGrLKRjPZudgq8gN1NWCLxU449oy+1s8iVIKQZQs+KiM2b0twk
         yTyhav60AYnGqAWpufCFT5zBDvRp13BZzXgiwNNAH4vJ0pEKcX+3sNDIXwR/ooVJ7aI9
         5anr12fr9xIlr8/m9VlvlcmNqttX1eBM7RM8SxYRQINUgzX9AFK227HxMl/izoqKgglC
         P6iw==
X-Forwarded-Encrypted: i=1; AJvYcCXjYXXU9+TtFt91VtNmlcH7PQWa8kbdcps67wzIpV+2eYzLUyct73XefL9Nr1Lqe+gLKxF3sWWqs3xDqDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwASK+RtiI61dco5rfKx5zgWsrFhKzdAfCMZu8MEu3uk2NGPq7E
	I4VgscvGR+EBRisxjgjs5Fts90IF14ZhfappYsZSM2SQF6fTHNhvN7v+ycW3yw==
X-Gm-Gg: ASbGncsE9QBZ2oF7Q+53zPDg8RS2He3qEG9fsUF4eIk7a9h+EX6EJYgEFSQczD03+ot
	fd0ZKrE1PQZp3y3wRqUHusFuicEKvjZNpPySeePljbt5Yw8kXglWUZz6IzzCmJvcYMbQixiXazr
	kgeDBUijlC4mdcHmIBFMF+TdJlEyO8gfItUIahoJbpxKO+vIGL/IHQeuUr+MZBO/8JF4GNkukYo
	aP28NkgY/FncPgan6IOl4eBVrjr25eP3j5MYg+XhOXZ5JnoWeEFKkW7tDXxWWpYH4miB8nbUSpF
	hPLhQ8Ko0uOuyk9PJHl7Tj71029PgITm/HmIzsd7EbydiJA=
X-Google-Smtp-Source: AGHT+IFhDRZasLWzYreSoVHtE29Eoz0rL8n8l2unUGWLW4ysgVhFNqHQroyMVilFT/a4TTGY4GdyZw==
X-Received: by 2002:a05:6a21:3942:b0:1f5:8e94:2e83 with SMTP id adf61e73a8af0-2046a402b0emr13340137637.8.1745850171204;
        Mon, 28 Apr 2025 07:22:51 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45b1sm7294859a12.1.2025.04.28.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:22:50 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Mon, 28 Apr 2025 19:52:29 +0530
Subject: [PATCH] rust: kernel: device: Add of_platform_populate/depopulate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-rust-of-populate-v1-1-1d33777427c4@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIACSPD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3aLS4hLd/DTdgvyC0pzEklTdJKM0SzNDcwtjExNDJaC2gqLUtMw
 KsJHRsbW1AG/5dUJiAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=hZEdc0bpwJBdYluEz9kgtxHO3SQNNIVXhxeoIhEyHBY=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoD48r/9QXO1GQ26m1PVIh4wMiOl0GiUzNErDjd
 1JLRf4dKUaJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaA+PKwAKCRAFzvXHieVa
 dKFvD/0cneVTvkFhFrmGWokLYNi5Ku9sTRvwELaqEiTh+ADmyIvHxTq1fUWq0iK74amHKsUSGzX
 0Uo/Z7HVIEt7nFdcKN9iIsUUcIf2u62GJBSK7GB7mI7nKAJaqzP86TeU7MvnhaWhY4YHJ4swOWT
 ycJ3EEsRQy8udKMn8hpq0qcgN+hBipnZISxyyT0Rg16fOXNYUA3G7gABp+NqwXhAH3/7HzLn78A
 Bs6wrNC3tRMSV3lnjlMdXDlVZBqPmKgsbHUXwN/bFcAaoAehreXJt7s3a/xJkG4P5j/44kFl7JK
 TX+R26iYVBZgegXgdHdL5LLg3WbMRfCRx8y3lMLhll1Uk+/fx6X+oI85PPhoj5KtHfCjsGL2w+Z
 0rxen4xj373HB+AVfTRDICmAOYPihCuI4H4Ls45eicOvosh0PTZIz5EvnzpwPvJ8Cu4blx+xv23
 p4m++tzJ5aqB7Yul9x54AZ6snPZ6KDtuK63RUkPboHRQ0E4LwB/i2ky7vPssn8mO95uGJV0KisV
 q6DUD9HF8Zo7Ss2/ZK1BFcCMe8Qii8AT1MgTFBPxsA40hwGYtlK1w+3pugSjqCUF6WXX1Rkqq3T
 9nPKLqs9HPtIC62HpKpdfQgkLqo+DU7EnpAouwRs0JTbx3n47q76VsiB6MSDb0S3PDmHIl92b3D
 7izHlHjHJXOA9MQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add abstractions for managed of_platform_populate and
of_platform_depopulate.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Allow calling platform_populate/depopulate from Rust code.

To see how the bindings look in usage, see my working tree [0] for a
connector driver  I am working on.

Open Questions
***************

1. Function names

The rust implementations are based on devm_* versions of these
functions, i.e of_platform_depopulate() is called when the device is
unbound. Since in case of Rust, these are methods on the Device struct,
I am not sure if the `devm_` prefix is required.

2. Maybe should be functions instead of methods?

Not sure what the policy is regarding this.

[0]: https://github.com/Ayush1325/linux/commits/b4/beagle-cape/
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/device.rs           | 10 ++++++++++
 2 files changed, 11 insertions(+)

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
index 40c1f549b0bae9fd9aa3f41539ccb69896c2560d..7186fe9658ff2a143a43bd6b3500c9a6d6ef9630 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -207,6 +207,16 @@ pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
         unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
     }
+
+    /// Populate platform_devices from device tree data
+    pub fn of_platform_populate(&self) -> crate::error::Result<()> {
+        crate::error::to_result(unsafe { bindings::devm_of_platform_populate(self.as_raw()) })
+    }
+
+    /// Remove devices populated from device tree
+    pub fn of_platform_depopulate(&self) {
+        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic

---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250428-rust-of-populate-b2f961783441

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

