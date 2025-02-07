Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656823F267;
	Fri,  7 Feb 2025 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939410; cv=none; b=UynhSmKUM9+PHFxwAP/OdGY5ulO/xH4qzT/oJfnwEnQkC7V35KNOgSMAgkdgm00sXW0AqT2EwzpTEJBfSRy1XBBwEuxXDr+8ryu9+tSz0NSnzxeHJufChizEPFz467DyA37A/ais5UPpFZqrpK116EZaHjr5O7j1qh/OSig3LcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939410; c=relaxed/simple;
	bh=eee7hXn2WhCoXvDLpp0omx4YK+YJaZ/zUZ8CPI55We0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhIjybRHhbpCibdCEY4Q1fEO5OIa9ZLr+pTMea/kDK7RwdFnfesRq6UKCJ5/tt+0Z22qEY7ZPCPOREPHsXfnKBgRbQDE+g/EgG0Tcp/smF46nNMYHn63/VRMRQk9TrVMVAyC1VlXCK3ua/0X8AAwhKbRP2/04xrhzsFQJ8hNiIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGJrPoZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGJrPoZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863D7C4CEE2;
	Fri,  7 Feb 2025 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738939410;
	bh=eee7hXn2WhCoXvDLpp0omx4YK+YJaZ/zUZ8CPI55We0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZGJrPoZBIZQz0/DnSgM1EQ4HEabN7DOYqRzEsjcQlqOVHZejB9hHf0z/dZR686ntP
	 9/c5u8peXURSOxtUAedHHvMwwOyYI69+2c92JFz4Kji/iT39eDKahKj8ce/y2h4YEM
	 OSofcAk+Aw78MgBPGdVPbT+6KlINARLLLofc3xrpXyXe1976C2c4zoVuWA0TDOrusZ
	 DTDIy2O0z/kLYgCI18TlBqxNXbaI0euDiD/24LeWZhVJdrN9l1cBrzl0A8AR3eUjMd
	 tQ9mFZXKRGq1ssmynBQ1Gktq0q32u//WnnWJ7TaJN979sOKfChn+2lRztcDT24Km1A
	 8QPP6g6WV62tQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 07 Feb 2025 15:41:22 +0100
Subject: [PATCH v2 3/3] MAINTAINERS: add entry for configfs Rust
 abstractions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-configfs-v2-3-f7a60b24d38e@kernel.org>
References: <20250207-configfs-v2-0-f7a60b24d38e@kernel.org>
In-Reply-To: <20250207-configfs-v2-0-f7a60b24d38e@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
 Charalampos Mitrodimas <charmitro@posteo.net>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=707; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=eee7hXn2WhCoXvDLpp0omx4YK+YJaZ/zUZ8CPI55We0=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnphvGwgCxD0Uhu2TOU9gei3WhDPCvHDkUYI9Pq
 9e9lRvlnoKJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6YbxgAKCRDhuBo+eShj
 d8FVD/wM8KpXqqrabMREsjxkTuHDgENOi9kgOvTOaPn+L5mMQMQIbJTfsYLltLuZXprO2uKdMek
 OLTh09o72CtbcucFNtzcEUIKypGewBe/h5gu/1XFgCT21ty8Rcd3Zp2ScbyhJ9LARyRBc9MgXPB
 u1MEG5aYxFny0Vrt61euS/PzHSmTaPSPPClD1OdjxQ//JiUJvhVEJ1pEV66YM9EXckldr92YoX+
 yQF9M0pQb1c7jdhZ0J8pS6DId4VdAU2b1MtG5eJMQf8vUXKJTq2k2uTok1dd7WYyU95IWLjRB7+
 uRbVTOwvE6CaC+9z0X/pULP+qDNgZXfn5hy+obRNXetbN6rNUsFw528KHn276DMl/oWHauoEOJO
 ttBd8rMLT/rQJZf6VmiL0NsKG2sGrF7iY3i2FE8oZ6Ihk8ThTsR722eGO2xS0kM4Kv/uUtdrGLt
 yVJWDuyZuPuZJQd2JwxmvPNQLYqjDClXLxtVNpq6BRUuUG7I+UOUYsNojonHqsz3drou+IKEKP0
 TL+b7WDYPK4VVuey4Ou2vh3cNYRwHtq+bIFDOLTl8qcr6QDSoA/4+40Qt24x3EF+ATqc48jQ2dF
 4pUTXCcxWkymJbCffcgy2/mSaklpDiCbTIK9ZiWBSnPxMa1Wg3+eN3ifcD9HNylX+UniOP2yRQH
 uY4rPPmYZCI+qVg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Update MAINTAINERS with entry for Rust configfs abstractions.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa0654..9b4d5c12eb438 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5870,6 +5870,13 @@ F:	fs/configfs/
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


