Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227871853;
	Sun, 20 Apr 2025 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745174838; cv=none; b=hHgrDNsu4JUWOp/ABHNO4n/CDNYOn4NlTI3s136wKc8u8/SKIgHl/U1ULG6muL3HVEUOmj17RofcsoeIdBWkD19p+PG7N70fF/l9s7BQLNZbjINXS9LVw+YjXJzcd4h8ecL3VgUHTZQ2ryQk6PNSuEggOfiQ1Ld9Y5hzlGBNEmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745174838; c=relaxed/simple;
	bh=S913B2MOZt5/aXQTO5QqrTDrBHGlJ9jTSkJEjk056yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fboc2lZZ1uGY7gCTKVTxOlSBSoEMdGOdl/swAZaAiCvqxvF33NkrpYwe399CblERZbKFY4AqUNcbWqI5W8/NZOB8MMqPwbQ5ncvtW+GSPpu6xSCC8Y3wXP0UgLNCfBZ1Igo7WSpEUWKH/rsMepKDs8I0pfsRVMHsPdQ28+EL244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:729e:aceb:e7bf:d311])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 2C84153F3E;
	Sun, 20 Apr 2025 18:47:11 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:729e:aceb:e7bf:d311) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	contact@arnaud-lcm.com,
	skhan@linuxfoundation.org
Subject: [PATCH v2 0/2] checkpatch.pl: Add warning for // comments on private
 Rust items
Date: Sun, 20 Apr 2025 20:47:00 +0200
Message-ID: <20250420184700.47144-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174517483182.6702.4574765664478934960@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Hi,

Background
----------

The Rust-for-Linux project currently lacks enforcement of documentation for private Rust items,
as highlighted in https://github.com/Rust-for-Linux/linux/issues/1157.
While rustc already lints missing documentation for public items, private items remain unchecked.
This patch series aims to close that gap by ensuring proper documentation practices
for private Rust items in the kernel.

The actual solution comes in several parts
------------------------------------------

 1) Patch 1 : Implements detection logic to emit warnings for improperly
 documented private Rust items (e.g., // comments instead of ///).
 2) Patch 2 : Adds an auto-fix mechanism via the --fix option to help
 developers correct documentation issues.

Results
--------------------

The following implementation has been tested against real patches:
 - https://lore.kernel.org/rust-for-linux/dc63bdc4bff8f084714e2c8ff30e4c0d435e85b7.camel@redhat.com/T/#t
 - https://lore.kernel.org/rust-for-linux/20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com/T/#t
 - https://lore.kernel.org/rust-for-linux/20250420-nova-frts-v1-1-ecd1cca23963@nvidia.com/T/#u	
and this file:
// SPDX-License-Identifier: GPL-2.0

// Simple comment - should not trigger

// Returns a reference to the underlying [`cpufreq::Table`]. - should trigger
#[inline]
fn table(&self) -> &cpufreq::Table {
    // SAFETY: The `ptr` is guaranteed by the C code to be valid. - should not trigger
    unsafe { cpufreq::Table::from_raw(self.ptr) }
}

// Improper doc comment for a private function. - should trigger
fn test() -> u32 {
    42
}

/// Proper doc comment for a private function. - should not trigger
fn proper_doc() -> u32 {
    42
}

// TODO: implement more logic - should not trigger
fn todo_marker() -> bool {
    true
}

// Just a regular comment not followed by code - should not trigger

pub fn public_function() {
    // Public function - should not trigger
}

// Test - should trigger
#[repr(C)]
#[derive(Clone, Copy, Debug, PartialEq, PartialOrd)]
struct Point2D {
  pub x: f32,
  pub y: f32
}

// Test - should not trigger
#[repr(C)]
#[derive(Clone, Copy, Debug, PartialEq, PartialOrd)]
pub struct Point2D {
  pub x: f32,
  pub y: f32
}

// Test - should not trigger
#[repr(C)]
#[derive(Clone, Copy, Debug, PartialEq, PartialOrd)]
pub struct Point2D {
  pub x: f32,
  pub y: f32
}

mod test_module {
    // Module inner comment - should not trigger
}

// Comment before macro - should trigger
macro_rules! my_macro {
    // Comment inside macro - should not trigger
    () => {};
}

// Comment before public macro - should not trigger
#[macro_export]
macro_rules! my_public_macro {

}

// Comment before unsafe block - should not trigger
unsafe {
    // Comment inside unsafe block - should not trigger
    let x = 5;
}


// Comment with unsafe word - should trigger
fn with_unsafe_keyword() {
    println!("test");
}

// Comment with code example: - should trigger
// let x = 5; - should trigger
fn with_code_example() {
    println!("test");
}

// NOTE: important consideration - should not trigger
fn note_marker() -> bool {
    true
}


// Comment with code example: - should not trigger
/// let x = 5; - should not trigger
fn with_mixed_comments() {
    println!("test");
}


which led to this output:
WARNING: Consider using `///` for private item documentation (line 5)
#7: FILE: ./test.rs:7:
+// Returns a reference to the underlying [`cpufreq::Table`]. - should trigger
WARNING: Consider using `///` for private item documentation (line 12)
#13: FILE: ./test.rs:13:
+// Improper doc comment for a private function. - should trigger
WARNING: Consider using `///` for private item documentation (line 33)
#36: FILE: ./test.rs:36:
+// Test - should trigger
WARNING: Consider using `///` for private item documentation (line 61)
#62: FILE: ./test.rs:62:
+// Comment before macro - should trigger
WARNING: Consider using `///` for private item documentation (line 80)
#81: FILE: ./test.rs:81:
+// Comment with unsafe word - should trigger
WARNING: Consider using `///` for private item documentation (line 85)
#87: FILE: ./test.rs:87:
+// Comment with code example: - should trigger
WARNING: Consider using `///` for private item documentation (line 86)
#87: FILE: ./test.rs:87:
+// let x = 5; - should trigger
total: 0 errors, 7 warnings, 101 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

./test.rs has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

To: Andy Whitcroft <apw@canonical.com>
To: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Alex Gaynor <alex.gaynor@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <benno.lossin@proton.me>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: contact@arnaud-lcm.com
Cc: skhan@linuxfoundation.org
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
Changes in v2:
- Tested against real patches
- Link to v1: https://lore.kernel.org/all/20250419-checkpatch-rust-private-item-comment-v1-0-0f8bc109bd5a@arnaud-lcm.com/ 
---
-- 
2.43.0
