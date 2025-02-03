Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC420897E;
	Mon,  3 Feb 2025 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595429; cv=none; b=ayAW7bYdCdCqqGxRxZZICMNYaLSRpxLopFXUz0r+7QFwBJtfefvuyfWs7T3b0zx4Nqe3Ud7r+eR65CHxJp33gF2mnZ04AvH7oxYXzIhtxv8PHkRfDZhYl7hrOKphjBDyeL2q3KGJgCL8BeRdhHqCka5PFQb6kb+RrWt91wDk8Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595429; c=relaxed/simple;
	bh=J2HWkapAlDPb03vUi+fyTbxy9Aafi2wdXodrO3hGSEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfiSalB/gkJLU5r2UJ9sOYcLBUaeCNjTxeRLhjWedkF7581paMB5Lkpbsosqtp3PZC8XxUdSw/C/SfrgmV101VkaWn25NYfkA0+LTOyYYn2HFQ66l6m2lkJ+RwzVsLHapEQSWVbqLknraJglU+NOlH1B0PF+e2bU530bmKUJ/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfOyfWdX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfOyfWdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA19C4CED2;
	Mon,  3 Feb 2025 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595428;
	bh=J2HWkapAlDPb03vUi+fyTbxy9Aafi2wdXodrO3hGSEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RfOyfWdXP68WZSbeS1/TVughysecDzQ+NBUm26QxVy5B/gRmEOZzlwSsgKy8qqdzI
	 hWxNQtzLhWTOgq+Xzd/IgdRS/gExucdcU8rRzUo9BKV0wuXhfjKoaZLmzFJ/36n6hh
	 ai1S21yeiMU1D5SRqAtmkO+4clVfOrMMYxGd6treW2e0zjY9jCbu9Gc5nzrrCg5bdN
	 WBtmW2zZhHmdqVMbwQo8lWP/CXXw6W5fLimncN/uYV625xzVauQjT0IMHo0E2Y4LvC
	 MHBRg2TsWrbd14MuxwyIOp4BPRMc03E20ZjsbvOL6xluz76lqBUcR0bn2dI1dYRxBo
	 IVb7eSGU+xq+w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:56 +0100
Subject: [PATCH v7 10/14] rust: alloc: add `Box::into_pin`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-10-189144725399@kernel.org>
References: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
In-Reply-To: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=J2HWkapAlDPb03vUi+fyTbxy9Aafi2wdXodrO3hGSEg=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvXEsY5s7zwXQhuY+I3r7Qd31/OjS1dRfx6e
 4uARiB3STuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db1wAKCRDhuBo+eShj
 d6soD/9pY/y5DQzhpFj6Hd0wYDwa12Rw4UBMO7/xT+9XYfy36rDLKhtaqqVQJb4S/EzbiLFH23p
 pp8Twp2QuIBr61MZvQngUZf3ONYplWN68CwdaohOEsvmzvKNXgQ5PMkDBLPD3Cg8wvd5Ugx0y4x
 oVezjhOpmcyNiTYZwJqpQ6f4Q0hQ4Ff8PazBv9O9zWj02BnuTFJcbLHqMKtGu/Tm3Y4ffvpMj+S
 lYSuWkTimjtnTbhxelXPE4xh8cheFcJG/Oc3f9fY2XfbJcsb7dZxcSyPZTJUW/ORJSJt3adWfJX
 He/RLp4VlG0v8bwDs7bxSxFQddP6XiGQUcsZQQSxPQRq/6F4HMzB8I16IGxTmFH6xxSeCfWVYtp
 n98cEV65msdAP0H1dQpQAQPCZi+n+NiEmZ5GwKn4evaDbFjnNUrcMEDr+/tzhBmpJHcPPqt98OG
 sRMz5nuA6tSHRkw/Z4PGOrjlE305EVMYT1nCpCAjDF5qsyOUGAk71BoeDnEhMIWyCUDGyo4mWYa
 kLcz13iMESbckId3moTSBbnA+Rod2taSH5Efr0418AmdomN/tqKzCYvoxQYQTty0O5PdGkvkiIQ
 C93m6OPAjxRX5x/ho12AwTmfd3BVLHHXKTBEQKQ3fKVD3hSfBS81RJtuw/lRbOrUOhZW92V74AO
 vj5YsihPSrxr5Yg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an associated function to convert a `Box<T>` into a `Pin<Box<T>>`.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/alloc/kbox.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index cb4ebea3b07422ca0f402512b7c66d66fd212042..9da4a32e60bc3fdfe88e595a38ecb9e3454e083f 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -245,6 +245,12 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
         Ok(Self::new(x, flags)?.into())
     }
 
+    /// Convert a [`Box<T,A>`] to a [`Pin<Box<T,A>>`]. If `T` does not implement
+    /// [`Unpin`], then `x` will be pinned in memory and can't be moved.
+    pub fn into_pin(this: Self) -> Pin<Self> {
+        this.into()
+    }
+
     /// Forgets the contents (does not run the destructor), but keeps the allocation.
     fn forget_contents(this: Self) -> Box<MaybeUninit<T>, A> {
         let ptr = Self::into_raw(this);

-- 
2.47.0


