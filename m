Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3DE28DB66
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067768; cv=none; b=DVlzGBjtehS40HVyn4biiB19IGI3cnzT68l+Sx5ckPr4qfwDQjxylIJIUujF2PkLw6EzqybwKLhDlMiSZpn/Eiezqo3y3j/ccbf4q8mGausjiqodyFHTgmw/H6h0UssJ6SuQtaUW4PphfpycefosfoeY99GJ7L5RVXNTgvIEQvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067768; c=relaxed/simple;
	bh=nnvxOQ6Zfg5fW4GQM4QVaStJBJvi8K7MFj3QneV7A4U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Y31LjmlfHj17OUBs6TJQYZTo5ao5TZ2Gb29OB8RvHsOZggNe9Q7K8dFh86Fk8tA4OKecJi66oHJ0dSJzT2goH4IIBxWh5HqvpXF1bJKOZ6I/R1t596PWomYKSSYcIoSFrE28VUQTcu7zsR7RAqisKRIN1+rQTwN3oAtxd6ZPZj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SzmQ8K9g; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SzmQ8K9g"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7377139d8b1so336999b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751067766; x=1751672566; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4vQF0qWaH+KoiSQcOMpKMwD5sqvT5hiD7gI32VuC85M=;
        b=SzmQ8K9g4/9Rff0CKMoKDVtl7n4Tj2hFiOKS915O1wNlvF11WkzERSk53AWCDQx02w
         kfiNp+8ehY1EtGf2g4E5hH4fO0Sbp7A5XXKeNJsXS/wG07HgchJixYV2pvBecN59IUT6
         G+Gm6TBpuLbw2JuQoeJp48tfGvzdfZt3sfXsEQ5hhmfwvlxOucQioqc37hHm9pDBGYVY
         0DZCgHSVlqnPSjLzaisWG//pNssKQzeamo4K9udHwsrmWiWW3cdskoee8H7F5ulnkv4x
         rELm2Co9hZ7sfGdHr5KhZmNpHoBYeZ54WdvwdnY0B3b0EOoVHpk7Vriuft5vg8jksUz1
         W8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067766; x=1751672566;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vQF0qWaH+KoiSQcOMpKMwD5sqvT5hiD7gI32VuC85M=;
        b=fCezaLKe2ez8PL+fEe5SxaXsiJffRiPO6GEB8DY6dpdeOG42P+sn3a0tbj6brQCrND
         j9n/BJTxrFpUoqcDQVCUUGVZYSKHwj8ovOsoFK3GspJ9H0aVySDvaPNaWlg7bN7nh5Lk
         KEMJ5b6elsRnpJCJLv5I5cagUEx8xwQnZZRAojYCOSLasHcUXHi/dp7oCTErd4sEwFCD
         Fc8t7eqpU0EfZPsDlJDcGvxZ1mOOHRx7SzTWTCgWhTgGlEuT+HbIpMLDrwuO1JUveKvK
         eMCIyQV8ec7Z4GOFRhQG7rAZyoB+bK9QMyGZ2bekr8bMb3M0Nl3DAcsFvpTyd4m+SY3B
         JYsA==
X-Forwarded-Encrypted: i=1; AJvYcCVO5+OSVgA0har8Y5KNuixnbz7yWflBmfLvTN3ndcFi1ccxec916o/1NWI8Cl8PvEEk3X4JXBEic/1PYWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLhP/0/XlVgrSYzlekiJC2LaT5m1K6q3XYM1pXyam1wJu2oWY0
	O9+cjN+PrB/zCeo6neALsDxEShzGWfiz6ycs+NxJXu4GalqF/UAZ3QNS6eR4MfINZM6awLenJLu
	MnVZMkEo8ig==
X-Google-Smtp-Source: AGHT+IGDTyMlzcDPZnXQjphsiUNJGqUZjKHati/a0YVM21ssunHigdxQ4doU9uECgvvgudvm3h0K1qSroACN
X-Received: from pfhp11.prod.google.com ([2002:a05:6a00:a0b:b0:746:2a27:3025])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9a4:b0:748:9d26:bb0a
 with SMTP id d2e1a72fcca58-74af700ac4emr7215822b3a.18.1751067766066; Fri, 27
 Jun 2025 16:42:46 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:42:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG0sX2gC/x3MQQqAIBBA0avErBPMUqGrRIvSqQbKQisE8e5Jy
 7f4P0FATxigrxJ4fCnQ6QqaugKzTW5FRrYYBBeSK6HZTu6J7KBgyKK7mZ6VtrNou0kaKNXlcaH 4H4cx5w9m37ohYQAAAA==
X-Change-Id: 20250627-linux-miscident-7b67db234a5c
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751067764; l=1378;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=nnvxOQ6Zfg5fW4GQM4QVaStJBJvi8K7MFj3QneV7A4U=; b=7WyseVue4GsCuK1xQJ7NhlDjLxtuIWFRJrqE95/iQCr7LGbUreHivESxRIEPv1gbg6+dQSIwU
 W/C2+K95zNOB7y7hblbkEQOy0V9qlk15IlTe/A1QsvorgflbityXCBi
X-Mailer: b4 0.14.2
Message-ID: <20250627-linux-miscident-v1-1-d37c870550ef@google.com>
Subject: [PATCH] rust: miscdevice: Export vtable testing
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Isaac J. Manjarres" <isaacmanjarres@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

A common pattern in the kernel is to test whether a file belongs to a
particular driver by checking its `f_op` struct against an expected
value. This provides a safe way to perform that test for `MiscDevice`
implementations without needing to directly expose the vtable.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/miscdevice.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 939278bc7b03489a647b697012e09223871c90cd..5f59eda57c38be5f0d54fa9692fe5b2819e31480 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -177,6 +177,14 @@ fn show_fdinfo(
     }
 }
 
+/// Determines whether a given `File` is backed by the `T` `MiscDevice` based on vtable matching.
+pub fn is_miscdevice_file<T: MiscDevice>(file: &File) -> bool {
+    let vtable = core::ptr::from_ref(&MiscdeviceVTable::<T>::VTABLE);
+    // SAFETY: `f_op` is not mutated after file creation
+    let file_vtable = unsafe { (*file.as_ptr()).f_op };
+    vtable == file_vtable
+}
+
 /// A vtable for the file operations of a Rust miscdevice.
 struct MiscdeviceVTable<T: MiscDevice>(PhantomData<T>);
 

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250627-linux-miscident-7b67db234a5c

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

