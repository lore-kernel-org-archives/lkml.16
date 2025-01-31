Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507FE4A07;
	Fri, 31 Jan 2025 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738330327; cv=none; b=LK6oVEi+DzTvi6sWRPjgh1ys+7NV0Y113AdNoYjp6+n0Z27LtgQCwiiwzR1BRQHTsP6ts0KYTlVc4i8eXlhhzFC/CsMfDYPOq8HaMXR86f/+1JquJLrhxdhkWaX7C4aslqLLK0PkgxDm3DQPHjClJ5o/SjnmcR4idJb9nwWXcEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738330327; c=relaxed/simple;
	bh=jYdCxBRQsq28Ql1ctvq0LlUY6kmD+tpiLL9GHuxgW/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4qMkJYbT3yAeqM+XpxBoSX9+HgmrBW1mxooWuy4KVwprxaXnHfX65xjjnR+s/YZpKtxs0t/PPFh9c8da8mMccvpvmrtTdOBBFVb2/7891ROtFaqv+LdsTgaK89zt/nlURZDftasfeIT1KQ3KT/70e+rONWPllNtYac0R0NvCWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6dGyb1s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6dGyb1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9865AC4CED1;
	Fri, 31 Jan 2025 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738330326;
	bh=jYdCxBRQsq28Ql1ctvq0LlUY6kmD+tpiLL9GHuxgW/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m6dGyb1sZ7PV3ZhtIBX1syFOzkQ/L5tl0S5Bhrt3JRiMqGtbty8Rz5o79gPuMfkdJ
	 ulHFMHVR5x5DN9pki9oB5ohklVooRvQXG2pWz/j9vN/8KohYDXF1paTZhbfE6MsdWe
	 dM9qxoGyq4/sFfwhjDBug1HiWlvMFGhrmpqsyFRwexQQxz3dpXVsT3+MNkwDr4EMnV
	 osUgVtPIVZsc+F1Lyj+K3YwDhO7zMAwAkiK4+Al/4moXGwRlAYMA+TJdlKZyK6wnu6
	 CfpLrDeJGCkhFfg7baSmEacO6Fw0HvPdOB/rOmrOedJpSZczRmcPo5pq5OC6bEq6I9
	 hdADI6KUBoYyw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 31 Jan 2025 14:30:11 +0100
Subject: [PATCH 4/4] MAINTAINERS: add entry for configfs Rust abstractions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-configfs-v1-4-87947611401c@kernel.org>
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
In-Reply-To: <20250131-configfs-v1-0-87947611401c@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Christoph Hellwig <hch@lst.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=761; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=jYdCxBRQsq28Ql1ctvq0LlUY6kmD+tpiLL9GHuxgW/o=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnnNCGpYHw+GfgBcO6nZ+V1Nufvqqqf6BLWBAia
 MXVfOM1nzOJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ5zQhgAKCRDhuBo+eShj
 d7mFD/0VGxUVtVOepbPCnRO8F9U2VR1DBipgbSYawB8Ul2UwQH5gKvp8l+LqOgzgC0xmkDXq7Y3
 vJ0yqOV+q5rIvK0i+jSX+rgKA0R4JHKGX22X54VZNrjq3zswoD2e2uPdbwh7J4EMc+JqItMXuA5
 oC6ZPouKhNVUoO8IUQs4KVcRDEtCgjdMMDXut2rI9cFNOrQX9K7Bk3eA5s8bwz5AisChW8qui29
 iuh7sflloe1w+EYWTGBw59bBwV9p/F1QVIEMhR5cEhf1zRHNcKKSLLTQq077UcLhR3fv+CrpONo
 5GmtOBsz6R3VlVak0f+FNPGbXN8uYtRoRaDVwJcEFVmXlmxwsjjpciIQxMwHKYXVBzLBHp9ZPUf
 N71P5joS2Degs5l/2g/0BimpChBf5XKGcqtmVK7jm8PGv526V+UCkiZ94FeuCmwWW1zvNIDoFka
 1a2HeTZW4BDu5Hyb7+hcknu8nQ5SMRzoU5LNSVOEkFYTOGy/aUYcNIzE5LY6FDA4OeSgwnqXSM9
 5rfDlsNWoiI4ejxqWinlRYTCl3mZzij3al/WBumUrAzd+t3VqMLX1ePF/FwRxaXihUREFpQnpGj
 EqHe5vZdxPIVb7Re9SQvPaKzy0DTO8H4/zYf1u4c5bFyA1fyyJWeSd4sMprEdrM2WXYKUvQOons
 dXvjHYVlcTXCyWw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Update MAINTAINERS with entry for Rust configfs abstractions.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baf0eeb9a35548fd3a4c5a39096dbfe17b967cdb..7e3d238ef21cabb7608b004d0d807c801446a18f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5806,6 +5806,13 @@ F:	fs/configfs/
 F:	include/linux/configfs.h
 F:	samples/configfs/
 
+CONFIGFS [RUST]
+M:	Andreas Hindborg <a.hindborg@kernel.org>
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+F:	rust/kernel/configfs.rs
+F:	samples/rust/rust_configfs.rs
+
 CONGATEC BOARD CONTROLLER MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
 S:	Maintained

-- 
2.47.0


