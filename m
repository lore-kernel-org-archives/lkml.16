Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E7A2036F3;
	Tue, 22 Apr 2025 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326615; cv=none; b=cxPgExpDHMv+RD+vBDiTXpmF+m2hrhLq0RX14UhbDLRGEoSflYHuBqmdwf5HLNveahB8B9RAg5JTciL5xVgpk4NQMRDf52cQRtX1695YAMCoCxukFZbrvpPm+tx6RkVmujcHvkqeUc38Qq5MBLqCCgDpmiAGYrot8Tibl1EOFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326615; c=relaxed/simple;
	bh=y8ihA9xM3F8vLDO0to0+a31KSyQ+qiH8wzsdSBfkebo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p3YaXiG9ErZHlrhrBqZY3EO+a2vc67wX2rxWQpnkfThyCxrqim5RFVcxTM7hkPs25n3fFenlE7BYs3SKg3EYc0Gefo8DBfk3SAN0OaiE5b/K8cG56V8NbYmfnqmnINgV4gp3OXqBUJI2tamuJv0FijzdtqcmJHkAl8iITBjPKCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 2BF373CD51F;
	Tue, 22 Apr 2025 12:56:44 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
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
Subject: [PATCH v3 0/2] checkpatch.pl: Add warning for // comments on private
 Rust items
Date: Tue, 22 Apr 2025 14:56:33 +0200
Message-ID: <20250422125633.30413-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174532660477.19425.2801981240070484205@Plesk>
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
 documented private Rust items (e.g., // comments instead of ///)
 through a set of heuristics.
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
fn table(&self) -> &cpufreq::Table {
    // SAFETY: The `ptr` is guaranteed by the C code to be valid. - should not trigger
    unsafe { cpufreq::Table::from_raw(self.ptr) }
}

// Meaning of life - should not trigger
fn test() -> u32 {
    42
}

/// Proper doc comment for a private function.
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

// Test - should not trigger
struct Point2D {
  pub x: f32,
  pub y: f32
}

// Test - should not trigger
pub struct Point2D {
  pub x: f32,
  pub y: f32
}

mod test_module {
    // Module inner comment - should not trigger
}

// Comment before macro - should not trigger
macro_rules! my_macro {
    // Comment inside macro - should not trigger
    () => {};
}

// Comment before public macro - should not trigger
macro_rules! my_public_macro {

}

// Comment before unsafe block - should not trigger
unsafe {
    // Comment inside unsafe block - should not trigger
    let x = 5;
}

// Comment with multiple
// Line
// Youhouuu
// - should trigger
fn with_unsafe_keyword() {
    println!("test");
}

// NOTE: important consideration - should not trigger
fn note_marker() -> bool {
    true
}

// Comment with code example: - should trigger
// ``` let x = 5; ```
fn with_mixed_comments() {
    println!("test");
}

which led to this output:
WARNING: Consider using `///` if the comment was intended as documentation (line 5).
+// Returns a reference to the underlying [`cpufreq::Table`]. - should trigger
WARNING: Consider using `///` if the comment was intended as documentation (line 72).
+// Comment with multiple
WARNING: Consider using `///` if the comment was intended as documentation (line 73).
+// Line
WARNING: Consider using `///` if the comment was intended as documentation (line 74).
+// Youhouuu
WARNING: Consider using `///` if the comment was intended as documentation (line 75).
+// - should trigger
WARNING: Consider using `///` if the comment was intended as documentation (line 92).
+// Comment with code example: - should trigger
total: 0 errors, 6 warnings, 96 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

test.rs has style problems, please review.

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
Link: https://lore.kernel.org/all/20250420184700.47144-1-contact@arnaud-lcm.com/
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
-- 
2.43.0

