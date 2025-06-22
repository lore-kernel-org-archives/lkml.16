Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C59F1EE014;
	Sun, 22 Jun 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750597153; cv=none; b=HIq0DJNwmBxemKb/Q98mipo4NfEDpz1AiJTligHbn5Mv/HgP9D8ki/+eDa2h7vzD7e1lWJ6YXvV3lTyG5MPLovVGCLwVmTESEqOmnkEMN7g8VRnHKttXrXS6z/RnsCFy0W4arshpvVOnnJpTzTOO841KVagERAfVoFSRBqShDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750597153; c=relaxed/simple;
	bh=DegIZG5nRgb42bQiCjvamAH1DbQpFsEF6l+dBDpYsqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmsm0Y95pHK2peK6aVsIdti0K7+zchMZORhtzPR248c16DD4Qyk+eldwHh7Bj+BsZyXnrTqJN3irI22qO6SqXKEqkcTJiA4gxMp5Ekw5eSlQFuXr9Bkc0sHZ9DCkfQ0ufJ3+PcY/z5v/6cJ5wY7Tm6aJA5tvMKWJ7tG1UFJWpCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=do6WK4kC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="do6WK4kC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33636C4CEF4;
	Sun, 22 Jun 2025 12:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750597152;
	bh=DegIZG5nRgb42bQiCjvamAH1DbQpFsEF6l+dBDpYsqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=do6WK4kCM9g2kHGeNIgRMNXWarL3ae93J/De6Rw7CNYkF4OL1TL4qPPqCzrQUYSUp
	 i4jMYI4Q4Wi/nNRhsZx49KBBqQV6B2X65C49B+O1kXhD3eg0cOLTuJT/L5Ruxak+W7
	 nV29+vj1n0QBK3hWZ9sTRYQy/BLwdkPI7gaSzzJxSjaim0sW+Lyvzy1ZsQFs1xJF5l
	 ERLhcGF2yI4REHlQ6lFqe+WM9VQ+64heNudz4K6cEgO79YR8fByVaNPG2eVr1JxCjQ
	 F53+tDi1dApkmTLV1ATrNRlLTtS655tG46HHSOV4NuwMSNfESo0blXFr2YxdTEFFLZ
	 yM1LJZrsX8Gug==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] MAINTAINERS: update atomic infrastructure entry to include Rust
Date: Sun, 22 Jun 2025 13:57:31 +0100
Message-ID: <20250622125802.3224264-6-gary@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250622125802.3224264-1-gary@kernel.org>
References: <20250622125802.3224264-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

I would like to help review atomic related patches, especially Rust
related ones, hence add myself as an reviewer.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b8..85305709b8c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3896,12 +3896,14 @@ M:	Will Deacon <will@kernel.org>
 M:	Peter Zijlstra <peterz@infradead.org>
 R:	Boqun Feng <boqun.feng@gmail.com>
 R:	Mark Rutland <mark.rutland@arm.com>
+R:	Gary Guo <gary@garyguo.net>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/atomic_*.txt
 F:	arch/*/include/asm/atomic*.h
 F:	include/*/atomic*.h
 F:	include/linux/refcount.h
+F:	rust/kernel/sync/refcount.rs
 F:	scripts/atomic/
 
 ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER
-- 
2.49.0

