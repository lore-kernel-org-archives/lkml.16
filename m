Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA7B8F54;
	Sat, 19 Apr 2025 19:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745090420; cv=none; b=ObZLR2pPfRI4p4AseSG7mVsDrFhndWSZmjuL6X7CEJkb2Pcer/rwnC2kw148uBdtx5FDmRavPgVQ3LEF2g3MlCx616aoReCEF86z+tertVzW7M/tYmaJsT2pKrFeoiuau0aIcESCw4zR65cWz2bIHH5QfGbAwI8Q+M9grCcCqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745090420; c=relaxed/simple;
	bh=Uo2UT1Q7UtdrIvUQNgEy4vX4zGbDLfyNfqQiy/5CWZc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UHRAGQdUfrqxb0jcGkKyI7EgYH93l9CRMkAkXRTuvqGoGpWAjpxJNL8oPX//QKCDItexn03OdKA85WsYhl1aTWRyU9yAFMtNTAbcpGh/3zDjclWBY52T2ZzZOYrmQ9zzaOKdE0bg5AqgSb7OzPb9C12aXN9EqWyzX7Pm9C6qaPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [127.0.1.1] (unknown [IPv6:2a01:e0a:3e8:c0d0:5f83:1f5d:4371:dbb0])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id E908953875;
	Sat, 19 Apr 2025 19:20:07 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:5f83:1f5d:4371:dbb0) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[127.0.1.1]
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
Subject: [PATCH 0/2] checkpatch.pl: add warning for // comments on private
 Rust items
Date: Sat, 19 Apr 2025 21:20:01 +0200
Message-Id: 
 <20250419-checkpatch-rust-private-item-comment-v1-0-89b2ccd32fd9@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGH3A2gC/x2N0QrCMAwAf2Xk2cBaLai/Ij5kXbRB2pU0G8LYv
 1t8PDjudmiswg3uww7KmzRZSgd3GiAmKm9GmTuDH30YL+6GMXH8VLKYUNdmWFU2sq4ZZ4xLzlw
 Mp+lMwV8dh5mgp6ryS77/zeN5HD+0yeUVdgAAAA==
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, contact@arnaud-lcm.com, skhan@linuxfoundation.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745090407; l=4922;
 i=contact@arnaud-lcm.com; s=20250405; h=from:subject:message-id;
 bh=Uo2UT1Q7UtdrIvUQNgEy4vX4zGbDLfyNfqQiy/5CWZc=;
 b=o7Cg/tf+1ZhNWe2n7Jd/Qkt3jaGC0f2EDINy4gUIvfEoD3KcH1nHJ10q/Q6OmncwtenVWeChA
 0nYaFbNxLzaBS3cQGBdEbAOInGEtMjJh8I5pBnMNhfa+S2VypMKSutk
X-Developer-Key: i=contact@arnaud-lcm.com; a=ed25519;
 pk=Ct5pwYkf/5qSRyUpocKOdGc2XBlQoMYODwgtlFsDk7o=
X-PPP-Message-ID: <174509040856.22801.8973078304144591016@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Hi,

Background
----------

The Rust-for-Linux project currently lacks enforcement of documentation for private Rust items, 
as highlighted in https://github.com/Rust-for-Linux/linux/issues/1157.
While rustc already lints missing documentation for public items, private items remain unchecked.
This patch series aims to close that gap by ensuring proper documentation practices
for private Rust items in the kernel.
As underlined in this issue:
https://github.com/Rust-for-Linux/linux/issues/1157, the purposes of
this patch serie is to ensure the proper documentation of private rust
items. Public items missing documentation are already linted by rustc. 

The actual solution comes in several parts
------------------------------------------

 1) Patch 1 : Implements detection logic to emit warnings for improperly
 documented private Rust items (e.g., // comments instead of ///).
 2) Patch 2 : Adds an auto-fix mechanism via the --fix option to help
 developers correct documentation issues.

Results
--------------------

The following implementation has been tested against this input file:
// SPDX-License-Identifier: GPL-2.0

// Simple comment - should not trigger

// Returns a reference to the underlying [`cpufreq::Table`]. - should trigger

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

struct Point2D {
  pub x: f32,
  pub y: f32
}

// Test - should not trigger

pub struct Point2D {
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

// Comment with code example: - should trigger
/// let x = 5; - should not trigger
fn with_mixed_comments() {
    println!("test");
}

which led to this output:
WARNING: Consider using `///` for private item documentation (line 5)

+// Returns a reference to the underlying [`cpufreq::Table`]. - should trigger
WARNING: Consider using `///` for private item documentation (line 12)

+// Improper doc comment for a private function. - should trigger
WARNING: Consider using `///` for private item documentation (line 33)

+// Test - should trigger
WARNING: Consider using `///` for private item documentation (line 74)

+// Comment with unsafe word - should trigger
WARNING: Consider using `///` for private item documentation (line 79)

+// Comment with code example: - should trigger
WARNING: Consider using `///` for private item documentation (line 80)

+// let x = 5; - should trigger
WARNING: Consider using `///` for private item documentation (line 91)

+// Comment with code example: - should trigger
total: 0 errors, 7 warnings, 95 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

test.rs has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

Link: https://github.com/Rust-for-Linux/linux/issues/1157
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
Arnaud Lecomte (2):
      checkpatch.pl: warn about // comments on private Rust items
      checkpatch.pl: add `--fix` support for `//` comments on private Rust items

 scripts/checkpatch.pl | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
---
base-commit: 250b341caf5e0e099dcf789be652178ca57a68cd
change-id: 20250419-checkpatch-rust-private-item-comment-bb3a5281e5da

Best regards,
-- 
Arnaud Lecomte <contact@arnaud-lcm.com>

