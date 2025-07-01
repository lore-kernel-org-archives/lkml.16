Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A1C26FA52
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378197; cv=none; b=k06Cm1hSblVCeJMr0+g/gz5s81SOBtiYiw5/QVnqZCkGeCeeySBJICEOd8bTzHIG1RM5jIGjdU/r6ijYKmCRUWPETGw1X9oqKr1+H12zYESdJwB7IbbxjB0PZdzHmVd3iE9hpZ6m6gfizp+OjOD72ulRMu6qiAeHB0C7Ld3kD74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378197; c=relaxed/simple;
	bh=njI8MgUtYO6adxTImBLYIQZAiw8t/8iuCI2/kYFqDmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IF8lUprMxZ8/7AWdc9I7tLq2GOoY+vMnizRzpAozKsX53yXLtzNIQRUl8rWzUMLsRw8uBCgudCLIiQ4VEK5QqmX2SovVSRm5tbW2rOALqo8060uRzp7Xd95rkqlIpdq9PKPoVjNvCNwKxiDHV4+lS058dS8BSSh3jkqO3qD2SAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7682A2379;
	Tue,  1 Jul 2025 06:56:19 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6563F58B;
	Tue,  1 Jul 2025 06:56:33 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 01/23] regset: Fix kerneldoc for struct regset_get() in user_regset
Date: Tue,  1 Jul 2025 14:55:54 +0100
Message-Id: <20250701135616.29630-2-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7717cb9bdd04 ("regset: new method and helpers for it") added a
new interface ->regset_get() for struct user_regset, and commit
1e6986c9db21 ("regset: kill ->get()") got rid of the old interface.

The kerneldoc comment block was never updated to take account of this
change, though.

Update it.

No functional change.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>

---

No Fixes tag, since kerneldoc is rather best-effort and the kernel
works either way.  Kernels with users of the old ->get() method
wouldn't build any more, anyway.

I can add a tag if someone wants it.

I've made no effort to track down all kerneldoc discrepancies
introduced by the same changeset, but I need to update this particular
block for another patch.
---
 include/linux/regset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/regset.h b/include/linux/regset.h
index 9061266dd8de..02417e934845 100644
--- a/include/linux/regset.h
+++ b/include/linux/regset.h
@@ -151,7 +151,7 @@ typedef int user_regset_writeback_fn(struct task_struct *target,
  * @align:		Required alignment, in bytes.
  * @bias:		Bias from natural indexing.
  * @core_note_type:	ELF note @n_type value used in core dumps.
- * @get:		Function to fetch values.
+ * @regset_get:		Function to fetch values.
  * @set:		Function to store values.
  * @active:		Function to report if regset is active, or %NULL.
  * @writeback:		Function to write data back to user memory, or %NULL.
-- 
2.34.1

