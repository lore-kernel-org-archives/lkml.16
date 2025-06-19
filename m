Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B48627F166;
	Thu, 19 Jun 2025 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345819; cv=none; b=GJTzgBAzc3luf5gLxJ2bDxo8TD+YjzzlgGPzr6JGbTx7O3pcu6Udbx0ltN+McCZ3hed82hpDD6sOi7NXlMfGl3t1/aKxeEvj4wRk1pwocUmtssbbAjqimoPbAov8fThw/RWOsAr9yeehI6boA0dDaxYQAiYGXRkHCUQdBAfDLvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345819; c=relaxed/simple;
	bh=+3uwOPQkqMo1nGkLpRbuTQf2OirBtqIa/5IdHIEU6zE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RMWnsUhBzvok1k9Nie0G+oUCxA8sZmg8pv5tbdd1W1tJPN9vth/IAvjsD+gcA+6K4ZPAoGBJcdx8IWNU7/ZLzrJ0vjw1gHfQ4ED6XRDHOuMQV2vIMHwQ0VfGOF/Pqpo5O239W44yXVX1FsGU+BHQ8t8s13/IVrkiP7/IJnQYG4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QH7wjRez; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QH7wjRez"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6facacf521eso8657446d6.3;
        Thu, 19 Jun 2025 08:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750345817; x=1750950617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lejb7bXJVgE3NrEDanzqMW/n0z8ycFLXS900A+s5SWk=;
        b=QH7wjRez+FO2L8Rle/jmyXYFN6qV3LLfHWNA1tch+x9AU9HYIFkLBxKJc6cv/L5S7q
         PUNsQJx3t+3F50SFEWHZ0iBn7NpKgqaJWJxxAhs0RY0O1CbVDUDGNMsivfhP9ko0CDGO
         bnxPPZ68a82xJYz/1yqm/L6LAn6zVlOswkLwc3UCUCdOwqaeXmv8PXYwIwyVc6s71046
         bMt6Nc3rjmHwXJJVaZXNtA7HWDwoHIKyDFSsIoup9/icwhsxNLRugzs5rlLThLCfMPBI
         rULrtRl6SpehAIK28Mfm0ABC8dWYHCv7XUGGnSoZ+5UYcJDyCU5WD8ouk3WjqmqSz0Wu
         ki3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345817; x=1750950617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lejb7bXJVgE3NrEDanzqMW/n0z8ycFLXS900A+s5SWk=;
        b=FYaAbohXNHOBvDxfT/0MrxLAAhhbr6ffW5nOYy1iyFjr6/fHo8Gai4NJU+C7hAszqZ
         wxh1xUU7rQV7u9vamyccMPzgROlmg4xwnEK4Fs9zxEbO14pp7P11A1zzs3YCqRiMA/4Q
         DwyR3s00pithzgXMLZe2kinjqV38+qa+YpeW3cJYO1nN7TgVSi9Vssj8WbbGNeXiapj3
         6lJxNLmwoBqRSSI1U1JHBu+ylARRG/ZxlbyDLCLgWdD2tu9ItgPtLHhiXrlWb7Nb62BN
         EjJNF6+6c7jRv/f2hHp6bTOBxZk2Q9WX9s72KygLLHw193Hl6/PsI0BWRoVnB8uKMASH
         eFyA==
X-Forwarded-Encrypted: i=1; AJvYcCX0HQ+GL0DJAcFDq698Am5mkFkN1zbTLUrQdc8Ie0Yb/aIaqiEzG2GRgmtXts5J2RmSNCavPUqhoCCblBzhpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGoYJA5jOosN9V7jsQOzVpEmaIZ4r8Y7ITkK5BKvWu371IDIvq
	mkGxcNSyU2o3wu5QBKAppmCah7bc0GVHgBw5qu8q0kDGPyp6T9V3ZeHy
X-Gm-Gg: ASbGnctU3JjySRCvLyl6UnhUK8ifMQ7ssP8Kop4/wmqomiolBkUwDM3HXXYdrKISt/y
	SP3Tc6VsNLD7uXn6W5tHEr5AlDqtXli+8TBSumFpA82NmhEpzgzr9Zf+ZDSAvwbwejChp3o/UZ6
	HdtiE58CUrNrqgJFNnad0KcacmRbRkTF+lptvkv9zPjkK4ZrpYcn9GEyeKL14z35lAU2AnlDiq/
	/dEsnfoKfwOn+XEDeB8oMCLISmY6QIUnUOUliENqlt1M9s39zHNtfKSK43axr/Ct/umqoKacBsm
	xu91v/y79KkvjIWZSDykWjE+pGyF9PsySYDjr0B8hJopMHe2V/F5lTmuu8xjLiPthboL+5dJRGq
	UgVwOMON9/3v/YpHxfw6z6Dv3T2v2GHVfmjyFOD9fk+uYIqo0Wwwg
X-Google-Smtp-Source: AGHT+IERR1rjxNOrB7yL/HYp1QTHURd0m6NvjwOFcG8s+VGvXq/PD3LbmprbercuSZYHNCHEHuYxcw==
X-Received: by 2002:a05:6214:5906:b0:6fb:474:42b4 with SMTP id 6a1803df08f44-6fb4773495cmr401501266d6.18.1750345816969;
        Thu, 19 Jun 2025 08:10:16 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0953b5e5sm674666d6.75.2025.06.19.08.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:10:14 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id CFE2C1200069;
	Thu, 19 Jun 2025 11:10:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 19 Jun 2025 11:10:13 -0400
X-ME-Sender: <xms:VShUaJpIbJYCWQG2Hyhuk16XpfRI6BUFUkZIpSQXDp_qGuyJPhzomw>
    <xme:VShUaLphQxcIRg3v9hXSMX9Fxy1bSwuZQGqETtpDuNzyHhHsgRBgxZHSMkpNFwLVl
    9H5Am3uJdvdbnmpog>
X-ME-Received: <xmr:VShUaGMQVszjqdE4ONVj1QpAiMrb6nCgPJSQc8hsg7g-IXdjWx5f2YYp3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertd
    dtnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghi
    lhdrtghomheqnecuggftrfgrthhtvghrnhepgffhffevhffhvdfgjefgkedvlefgkeegve
    euheelhfeivdegffejgfetuefgheeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhope
    hojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprg
    drhhhinhgusghorhhgsehsrghmshhunhhgrdgtohhm
X-ME-Proxy: <xmx:VShUaE5YhY3mM5ohPNLRVEv4DtJbfTmd3E1PWDzt98-0wnPLY2EXjg>
    <xmx:VShUaI5xSFeWF8dRxeNRWWmsayW-2rIw8dDC9ZNl4zx1XRpSIDmf3A>
    <xmx:VShUaMiJrJMcvFCjaQ58YUsNdiwpdkA7MeauJhKwguhtLWxXcCJYZA>
    <xmx:VShUaK7rPcvElzHS70FOgCrWM2h9fwhRy0Tmy2jA-oYZqg-D19xPVQ>
    <xmx:VShUaPJ5NFzpte3AbjYox5pE2m1XhTWWXqStz08fIYMp3EhOLITmexiS>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 11:10:13 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	pmladek@suse.com,
	fujita.tomonori@gmail.com,
	mingo@kernel.org,
	tamird@gmail.com
Subject: [PATCH v4 2/2] rust: task: Add Rust version of might_sleep()
Date: Thu, 19 Jun 2025 08:10:07 -0700
Message-Id: <20250619151007.61767-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250619151007.61767-1-boqun.feng@gmail.com>
References: <20250619151007.61767-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add a helper function equivalent to the C's might_sleep(), which
serves as a debugging aid and a potential scheduling point.

Note that this function can only be used in a nonatomic context.

This will be used by Rust version of read_poll_timeout().

[boqun: Use file_from_location() to get a C string instead of changing
__might_sleep()]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/task.c |  6 ++++++
 rust/kernel/task.rs | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/rust/helpers/task.c b/rust/helpers/task.c
index 31c33ea2dce6..2c85bbc2727e 100644
--- a/rust/helpers/task.c
+++ b/rust/helpers/task.c
@@ -1,7 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/kernel.h>
 #include <linux/sched/task.h>
 
+void rust_helper_might_resched(void)
+{
+	might_resched();
+}
+
 struct task_struct *rust_helper_get_current(void)
 {
 	return current;
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 834368313088..7d0935bc325c 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -400,3 +400,27 @@ fn eq(&self, other: &Kuid) -> bool {
 }
 
 impl Eq for Kuid {}
+
+/// Annotation for functions that can sleep.
+///
+/// Equivalent to the C side [`might_sleep()`], this function serves as
+/// a debugging aid and a potential scheduling point.
+///
+/// This function can only be used in a nonatomic context.
+///
+/// [`might_sleep()`]: https://docs.kernel.org/driver-api/basics.html#c.might_sleep
+#[track_caller]
+#[inline]
+pub fn might_sleep() {
+    #[cfg(CONFIG_DEBUG_ATOMIC_SLEEP)]
+    {
+        let loc = core::panic::Location::caller();
+        let file = kernel::file_from_location(loc);
+
+        // SAFETY: `file.as_ptr()` is valid for reading and guaranteed to be nul-terminated.
+        unsafe { crate::bindings::__might_sleep(file.as_ptr().cast(), loc.line() as i32) }
+    }
+
+    // SAFETY: Always safe to call.
+    unsafe { crate::bindings::might_resched() }
+}
-- 
2.39.5 (Apple Git-154)

