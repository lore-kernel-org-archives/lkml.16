Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533B293C6E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017165; cv=none; b=eF7aRPIwAZ7h8Joi3J4xGvXIJMd+EohsDuahJ5cELlvsT4cuFdH4yk3+MWwmZLByDcKy5IOMyXC9KBKy2OMckST1vc0CioIWpesvtBUuckBFkdxtngBCcyl7Wz6e3ACWp1Ciqv2WfZijj9QkkMSic/8ZstcyW6215XeJ0BfFzsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017165; c=relaxed/simple;
	bh=cMBPS7UL7Z9M3GsM6vxgAs14SnbamdvW0l1fLWM1wYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NyxYTA+w/q8JpIa4RW9xKCekbiaSuSX9p1WH2/P4WlXE+uVL5/LQHzrPK0jOfYc/3c/shQz03X3M4aUeJ+ZwQlYCbMu083Tc6KgXCtiu7Trpgcul4s1gjzgoeYtcUGNXxHZKU8iKuH90O4yxTzvmCey5qmbLG5RYDfPN9Nw/TiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=5M0z4Bkc; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Mriq9ZxF; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="5M0z4Bkc";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Mriq9ZxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751017162; x=1751621962;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=iZmlSFy4KF+5xgzlYCUJvQ/v8BY1pzWF9k3tLUMOd/w=;
	b=5M0z4BkcQJPtMNSk1YM1oSuYfov1jWqF/cQNd3w52dHdjZN3zMOcG0YoYxwbfioEKKKkMNEDH61Bz
	 fAxfevYEfbeAqjnpwSDp9AW7seGmpjAcjVQZfuz2MMHxNcq7TGqmAQHOyjY7OtaQOtZ/9ulLtcFZ0I
	 vZEE9Wojt1jL8BWhyPUPi0+WvcIvVszByrgXgzNrLb4raBgADaxMiBKoavMdJdCr9gmBlNHcgjoGco
	 RF8ySaydBmQyXNhhY3WgTaS4J5AAxO/Pjn1HcrI3nvzn0Kp+IyHxtcNk8Y2+VeOl3Sl5+BEslLI4i5
	 YbefVxx8caSXYJc4sPCC5/A4DbkvaWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751017162; x=1751621962;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=iZmlSFy4KF+5xgzlYCUJvQ/v8BY1pzWF9k3tLUMOd/w=;
	b=Mriq9ZxFe+umxklzgZa0m3XrQgsem7CIrFuK4VBWmaIwDf/1rqvhYlj9gO3ioVs2z8KAwqx77XOIz
	 M6hhnyqDw==
X-HalOne-ID: 9a50b852-533a-11f0-83cc-e90f2b8e16ca
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 9a50b852-533a-11f0-83cc-e90f2b8e16ca;
	Fri, 27 Jun 2025 09:39:22 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v5 4/4] rust: support large alignments in allocations
Date: Fri, 27 Jun 2025 11:39:18 +0200
Message-Id: <20250627093918.415888-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627092901.356909-1-vitaly.wool@konsulko.se>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for large (> PAGE_SIZE) alignments in Rust allocators.
With _NODE primitives introduced in the previous patch, we actually
have all the infractructure in place so let's just start using it.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 rust/kernel/alloc/allocator.rs | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 4f0fe2b67593..75c9e4220ac3 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -118,7 +118,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, 1, flags.0, c_nid).cast()
+            self.0(ptr.cast(), size, layout.align(), flags.0, c_nid).cast()
         };
 
         let ptr = if size == 0 {
@@ -162,12 +162,6 @@ unsafe fn realloc(
         flags: Flags,
         nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
         unsafe { ReallocFunc::VREALLOC_NODE.call(ptr, layout, old_layout, flags, nid) }
@@ -187,12 +181,6 @@ unsafe fn realloc(
         flags: Flags,
         nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("KVmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
         unsafe { ReallocFunc::KVREALLOC_NODE.call(ptr, layout, old_layout, flags, nid) }
-- 
2.39.2

