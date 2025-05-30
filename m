Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19629231836;
	Fri, 30 May 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615108; cv=none; b=XQbQ3BzcaGGH+IVvEHOD98yjkpriUjJ2ap4JpE5loAAhIqp9Dtf4EjsfZaLGuhMFXnEuFN7pWF+9eSYEM/QHDd+716pVA7htXJNaMESgohfMGgIGJj68ODDBNNhY53CpZva61bIy/rfpkwb0/h1JvxGsaopzxkZl8/xVlkyHGiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615108; c=relaxed/simple;
	bh=HxNXcpo2opSxFgS5iz+zLkP/tQgdDrjNBAzxpDiD8C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBzK/cE8gRbSJSmrE6spl1wa0ZfBbKXbsKRD9nNra4sbUt2MP4JeF6M8ZwLX/VGf3f3zGw4E5neN8pf9LGOaQeNt4AGa9rntJWqozeZWHueZJdazEIN3v5fNSKQvCLvaxHmNWvbZGwCZgzs0ytkhiy7fa+q18ihskkKX4oT5buw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCOQa0kJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCOQa0kJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBA9C4CEEB;
	Fri, 30 May 2025 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615107;
	bh=HxNXcpo2opSxFgS5iz+zLkP/tQgdDrjNBAzxpDiD8C4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oCOQa0kJd5GgBQkKsclbpyO9HG34OqN3vQCSMVLFIZpmV9Fj2KyvuFokxYYofhSrj
	 Cui2MLKX/a73GWZ7vcKgC4Kfx0pxsTKyHHKjU11omPJf+p/z8lAu/XGUiwAAQrby7t
	 DI667zbHBg5gMN2vqYqpXhUapNjPNAB7EZl+KtAWlATxuiEe8x0SDkGPXj/DlJcu5m
	 4097pqAKapBv1FtIYjsVFhyL/zVY+ttuzPIdioCevtzFLJDx3ls4d13ar4+1E0Klew
	 KM2Q70rdtU//3MGWD3j4hN5LHMaTcENDDmjD9eRbrd7AndPlnlyRJQfXrkI1aJuyWc
	 pJVpfPx/PklQg==
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
Subject: [PATCH 4/7] rust: faux: impl AsRef<Device<Bound>> for Registration
Date: Fri, 30 May 2025 16:24:17 +0200
Message-ID: <20250530142447.166524-5-dakr@kernel.org>
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

The device contained in a faux::Registration is always bound, hence
consider this in the registrations's AsRef implementation.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/faux.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 8a50fcd4c9bb..395cb1172cb4 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -50,8 +50,8 @@ fn as_raw(&self) -> *mut bindings::faux_device {
     }
 }
 
-impl AsRef<device::Device> for Registration {
-    fn as_ref(&self) -> &device::Device {
+impl AsRef<device::Device<device::Bound>> for Registration {
+    fn as_ref(&self) -> &device::Device<device::Bound> {
         // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
         // a valid initialized `device`.
         unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
-- 
2.49.0

