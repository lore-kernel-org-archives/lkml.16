Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2502C188A0E;
	Fri, 30 May 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615101; cv=none; b=AzRKO0AbXkaja4Jt39Okbx7nSW1JhyEG3ircKdCo4AmyraiFkMDeuHCMNQlxL1ZDLygHzgJvzP22qeHjjauFVT06j6lUZPIExdhP9n2bHc/cNczldMVH67xwtJn/omDZDFQN68LrTe90nMHDha9X4YCpT83SI6y/oztQ2mKGSe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615101; c=relaxed/simple;
	bh=Fdsa9c0TznozF7NTXCN5fSMXio8uVFJkPAphFsl2jPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYuO3piegukLwsii/NwYueDF4dSH3yU7vhm8ZHL4sMI+bRATRcQ04v1ePUKUH67v4sJuwSEfOI6hvtTF8DddQDmH7bU4wI7712BidWWeao7o4yvXlPysN+AsH7NELuvethyYNm7ExT6F/mV4uKBNBft+XI+ONKDDzw5EafQx924=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENFHCPF/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENFHCPF/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1DEC4CEED;
	Fri, 30 May 2025 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615100;
	bh=Fdsa9c0TznozF7NTXCN5fSMXio8uVFJkPAphFsl2jPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ENFHCPF/4/o2MPF6ksZAyLIY0dX9PYGIAwhqJFhJ94MCuaqbxVwfR/DKimfvRlcwA
	 aZUJfLGWGd6+goCpwATGJe+QzDDpy7uUUsEIt4uC3h2m4JkhVGmA9/aGe3KgroUM1r
	 BZNkjH9YVWbFEs9WM14Tdx4U49UzDnggdl2cpbrJodtN0TOTPqpDGCmJl4rVZ/pr7c
	 CSDUqdS/0Q5sot8L1srpH3J8lgoZNHCWcZ+wDbdJnzCZ+x94FPAVZEbtTcb5CLHvO6
	 6rvFN4bXa0tUJMp4wRKAh3WuNcRLF1E87tp63qFuMlbv6GLK3XLGx3Psa0WLhDhtdz
	 5qJtUsoADj2lQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	chrisi.schrefl@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/7] rust: revocable: support fallible PinInit types
Date: Fri, 30 May 2025 16:24:15 +0200
Message-ID: <20250530142447.166524-3-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530142447.166524-1-dakr@kernel.org>
References: <20250530142447.166524-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Revocable::new() only supports infallible PinInit
implementations, i.e. impl PinInit<T, Infallible>.

This has been sufficient so far, since users such as Devres do not
support fallibility.

Since this is about to change, make Revocable::new() generic over the
error type E.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs    | 2 +-
 rust/kernel/revocable.rs | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 0f79a2ec9474..2dbe17d6ea1f 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -98,7 +98,7 @@ struct DevresInner<T> {
 impl<T> DevresInner<T> {
     fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
         let inner = Arc::pin_init(
-            pin_init!( DevresInner {
+            try_pin_init!( DevresInner {
                 dev: dev.into(),
                 callback: Self::devres_callback,
                 data <- Revocable::new(data),
diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index db4aa46bb121..ca738f75dc10 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -80,8 +80,11 @@ unsafe impl<T: Sync + Send> Sync for Revocable<T> {}
 
 impl<T> Revocable<T> {
     /// Creates a new revocable instance of the given data.
-    pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
-        pin_init!(Self {
+    pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, Error>
+    where
+        Error: From<E>,
+    {
+        try_pin_init!(Self {
             is_available: AtomicBool::new(true),
             data <- Opaque::pin_init(data),
         })
-- 
2.49.0

