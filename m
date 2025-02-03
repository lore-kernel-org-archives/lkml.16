Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835E4209F23;
	Mon,  3 Feb 2025 15:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595464; cv=none; b=VG+Cg9BGiEiYWXheCDWOboyThst8FxicDyAMZFPKITxbD0dkrst1iNlvI9QPNVt7UKnVP8REALphMD6G/j6HyAqANVtMMSuQZMTlWf30keboN8v5o1x5xJ51Kvv9cnzNf5CGpPTcfxqNtGHR+Ar47E1WiXJIzc+afLyeqoEo2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595464; c=relaxed/simple;
	bh=aMQOiJg0/az+/dwZD+7hXRHe8iks+p3vCytu9xnUhec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCqdFt6jkQGJN2nZjFYifJOclZD+yWh7hOY1fRRv5djtN8mcF1ftyRJub1qzdjkZV2erkD0eIhmfdIx3jLJg8pGCQ4H+aZ2r0oW9Ufl6c9R/d+mb+rpCcUoyxAPIO9bXguMZlK3FeUmfmwHuxxdBlwyndXg9Pwoq6Q6F+A8TpyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnvoadk1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnvoadk1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74957C4CEE0;
	Mon,  3 Feb 2025 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595464;
	bh=aMQOiJg0/az+/dwZD+7hXRHe8iks+p3vCytu9xnUhec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dnvoadk1oGORlH90eiNC2x+Tw6YzLJL8+Bn1nb4MOzXQJkXrehRr6bUzGTrg5rPOL
	 Xk65AyE2HFzqqlFtH1tdDG0gR4FJpQA689ni9EK2NRD/BIpSVkBHTsoKQEjrJZ7tQr
	 dhX4tB1J+wSPnA6A0Bo8tcnlPww/osU8TYGOcbg5IPusPJ/etOU1aom7QR+bL8hWoe
	 nynPFo+lttYxK6fnTPaL0nCJWVz/2jGTW3yQo2c8Ro/Pt9yUdXCVBeQJijwm4NAlb9
	 NfR7F6YNpzq0U6hUWrrBrvsJ0FDf9bl+KkFurBMxId7YeldpT82aLdQx0lGzmIMg6O
	 PQNfrzth3q66g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:49 +0100
Subject: [PATCH v7 03/14] rust: sync: add `Arc::as_ptr`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-3-189144725399@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=aMQOiJg0/az+/dwZD+7hXRHe8iks+p3vCytu9xnUhec=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvQKrjCssePbzr4oyEYmgf9rJ8ez/pDuFatd
 8LZqNRKcJCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db0AAKCRDhuBo+eShj
 d5DnEACqap/7g3HJ8Gfd9z0oa/mlRuBmg0sJGWpyVvy5LpcSZCXUX4+tFXKpYcg8JdOE9/kXIaf
 UC0dlwEM6T+eLvFTij72/hkNtH0JzASqR+xHgxTGc8PrD87cySYVjImBD5nZmZxvaeX7z/sK5Lr
 VguBgAKkm0Rc0JbhPYzNkd9e3Sxv9V11wnv43N8hjRyGcyP4U2t/o2f/Q6wjxCetfuBdgyD2BYc
 +gMPuLWkG8Ui+uWxFBcDjtynsOQqBnvLMG0f2F6LZTp0r3/BVamptQCiWuVuE3h88cAPUxNDxmp
 AHhlNuCLXP2A9fpmkbSpaaPy8LDN9Yiud4PxX4uJbC/ZXHTxfRjjq5zqWLMZvrkMrZHbvztDWP9
 S+91fjeQlR/otg1nhhsCl4CU3azWJ47WXlRrSGVsLjZ45b33GRief/WOzbysmxkEhZOIw4lC3iL
 2QE0V0ejpD1I65U9xooLSyc2NbBFI6nLavCFziBLF8iYnh+pnnk4pBDO1QOr6ZnLv6qgeTbRNom
 LWKitxE9Z2KmFwPdr8sT1adJK16seMafLXgknmQ3EBi2ohDmKloboPEwKyZ1YFtbBmcn5WZMihY
 VDQXOKNCgORaKZoNTT8kNUKZ1zSJNe7Txh15FUMsOu4POkDOqYomnustls0DM4/nxlECKFlllRL
 NajAtwpqOyDnAjA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method to get a pointer to the data contained in an `Arc`.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---

This is a dependency for:

rust: hrtimer: implement `HrTimerPointer` for `Arc`
---
 rust/kernel/sync/arc.rs | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3cefda7a43725581dc0eaa8441e2528c161162e1..1dfa75714f9d696d138cc40c840cb3aff61b32f5 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -246,6 +246,15 @@ pub fn into_raw(self) -> *const T {
         unsafe { core::ptr::addr_of!((*ptr).data) }
     }
 
+    /// Return a raw pointer to the data in this arc.
+    pub fn as_ptr(this: &Self) -> *const T {
+        let ptr = this.ptr.as_ptr();
+
+        // SAFETY: As `ptr` points to a valid allocation of type `ArcInner`,
+        // field projection to `data`is within bounds of the allocation.
+        unsafe { core::ptr::addr_of!((*ptr).data) }
+    }
+
     /// Recreates an [`Arc`] instance previously deconstructed via [`Arc::into_raw`].
     ///
     /// # Safety
@@ -539,11 +548,11 @@ unsafe fn new(inner: NonNull<ArcInner<T>>) -> Self {
     }
 
     /// Creates an [`ArcBorrow`] to an [`Arc`] that has previously been deconstructed with
-    /// [`Arc::into_raw`].
+    /// [`Arc::into_raw`] or [`Arc::as_ptr`].
     ///
     /// # Safety
     ///
-    /// * The provided pointer must originate from a call to [`Arc::into_raw`].
+    /// * The provided pointer must originate from a call to [`Arc::into_raw`] or [`Arc::as_ptr`].
     /// * For the duration of the lifetime annotated on this `ArcBorrow`, the reference count must
     ///   not hit zero.
     /// * For the duration of the lifetime annotated on this `ArcBorrow`, there must not be a

-- 
2.47.0


