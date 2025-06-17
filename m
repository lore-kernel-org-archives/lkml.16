Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67B2116E7;
	Tue, 17 Jun 2025 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171351; cv=none; b=Q6xvPet0LligkR+x1ld0oiUYkCoMB8JPiCHgqKcjRJqQD160buUQgl/7T5yhyVz923xhV4Ruf9UDCF/jKj2LqAVSUf98uh/DhczK+hU+lNxN+YGH4Ccw1XWDg5U5KAeLpDhoCNTdTPDfvW08/cb8Hs6X7TuH6k/WgGLBcR3ViMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171351; c=relaxed/simple;
	bh=oq2cDF/zR8EzNKOLxgHvmAj1WbosaJUFZMVD0uA5tNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NToNKHEZfl8oZ7REDjRc3IWMRABzVtbAtWzMUX2Z5PFDz9LitXt77LKs7tvCyfO4WnaVy0w5KJFu2Wyv6xcEfxrb7iS7f/eDgFWeNnYaaPd/b0oFgIZC4nMqeNW74Yab7hC2Vb0CJriyu68jTf1p8uE1a2rDaMv+hhJz15B1Xtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjzveQyM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjzveQyM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2350b1b9129so40956345ad.0;
        Tue, 17 Jun 2025 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171349; x=1750776149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qugsedRspCOT3k2Y9Ut1plSd/xFZLKCNKoG53daejUA=;
        b=CjzveQyMaYzlMPptkapnh7KwjboEA2YSMhhcCiemxWRKVTubBYttnQXmnuUIF5/URd
         nxXOszXTrT6J9rz+ZGmMqHWZFQU8fY7YUNFonXhqlg5sMln/EaYFPenBg8EL/no851tP
         UXfQ37QUpHGyD/NLn2WtqNLVL1dJM74Ye9JUdJG+vbcE38N8fMT3SWEfQzdF1Oxiyy5n
         g4S+xY5v6S8IZDYCDzBPoTFWqxQ01gCoyRq4wkf2l57VdRzcjAtTdfCcX9e57n2b0bxb
         E8jFXmQZMP0lkWwt7g9x0eQal2vD3NNsANLvTn4cnAgzpL01D2hZIzoVuhgiRnHq4LSv
         KeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171349; x=1750776149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qugsedRspCOT3k2Y9Ut1plSd/xFZLKCNKoG53daejUA=;
        b=vEwy27+aQcncT1ntFj5/7BzhrzFrGceqOG51s9xo3oOlZQ3hCztxoQYir0X3/9ny+f
         w8zXYMJ+0paHpb93SkQy/THnTRB8Rk4gHz/crGlVa7HGRQln7Mc+LLqcckMKsNxM+aOF
         6649tiiCPr+qleTc4WJrFTy/G4FZ3dJ2bHOqnzZASHKB2JbdjOaGSLW7jPpTCnGt6+7D
         w1otArD6Q1hg/5wF0NgLRg6513Ukdh7p4qlFg+GspaaoFpVAzp4EutUcxbgzoIaowSQF
         H0qIHL83TR2JJUNhBzVkYeQh+VFBojTw/vqdg0jEsX8x6LRobV1IkphLiJw0WJgwxUaY
         D7uA==
X-Forwarded-Encrypted: i=1; AJvYcCVWdWUqeCoLxqVtJHzC5kH1Qbwv1T8+0nsBhUPsG43rY941jzdFt+iaOjLHGeua4mOlHN161lPXsPv28539XdU=@vger.kernel.org, AJvYcCXzi5zsrl895pza2fzgjK7cObuzsvWqsSxKVMd5Hycmg10JZDPIFAorjJ0qhfmoM32NB2XfS4y7ooLy7sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YymW9HRfBDqmG9FsozTh6s0eBJrS66jFgK/fikLaK9/UrMC4Aqi
	mMvYOalIZXYXVDMtgVHFV/bBhMgyWapgw28nv4P1EM3ujTXt7z+0u8qt
X-Gm-Gg: ASbGncuptWLlhVDZrG/xzVzBFKSHJ7EdfPy12KRTJOBYSvskXvDSysWhWNndwOf6WvQ
	g6OGF1GR25M1pkMkAz4NtBXJlVRH+XmNOQTpvobGo4XM1c5wXcfu63EKMShaIxBsaulUoQxuhro
	39Horly0MkJcw7xv55bP9eMUWYXLRbqRt4ge99BRSBt9M/L54+SwpR1I/NnyAcqDsDIDWGjDZT6
	CKw1+cbZVz+6qfD2UCSDJfmSiQSSI66E9nJ654oURZRn7o2fv1wcUNyxCjgoN65odqzC+4l3rko
	M7wOnJG7A+mTs6RFXj5Om8M7dQln6vvK0/dA0YNh7rh05OW78MyiOF097sRrx6k/lop2AukJ7Cd
	eSenKf3o0nGM40Lamd/HhT2ns5E8+yl9w5O8=
X-Google-Smtp-Source: AGHT+IHkhbI4xYHnXmb8K2KIGwgFjmTQOT+Kgl1D6tkmAAcfn5bn7/iqXdYu6wLAuwN9PgW0bbut6w==
X-Received: by 2002:a17:90b:2688:b0:313:2e69:8002 with SMTP id 98e67ed59e1d1-313f1daa7a9mr21777236a91.20.1750171348666;
        Tue, 17 Jun 2025 07:42:28 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5feebsm12029828a91.41.2025.06.17.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:28 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil and as_millis
Date: Tue, 17 Jun 2025 23:41:54 +0900
Message-ID: <20250617144155.3903431-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the Delta struct's methods as_micros_ceil() and as_millis() to
into_micros_ceil() and into_millis() respectively, for consistency
with the naming of other methods.

Fix the commit 2ed94606a0fe ("rust: time: Rename Delta's methods from
as_* to into_*"), wasn't applied as expected, due to the conflict with
the commit 1b7bbd597527 ("rust: time: Avoid 64-bit integer division on
32-bit architectures").

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index eaa6d9ab5737..445877039395 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -284,7 +284,7 @@ pub const fn into_nanos(self) -> i64 {
     /// Return the smallest number of microseconds greater than or equal
     /// to the value in the [`Delta`].
     #[inline]
-    pub fn as_micros_ceil(self) -> i64 {
+    pub fn into_micros_ceil(self) -> i64 {
         #[cfg(CONFIG_64BIT)]
         {
             self.into_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
@@ -299,7 +299,7 @@ pub fn as_micros_ceil(self) -> i64 {
 
     /// Return the number of milliseconds in the [`Delta`].
     #[inline]
-    pub fn as_millis(self) -> i64 {
+    pub fn into_millis(self) -> i64 {
         #[cfg(CONFIG_64BIT)]
         {
             self.into_nanos() / NSEC_PER_MSEC
-- 
2.43.0

