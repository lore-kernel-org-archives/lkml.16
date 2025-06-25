Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F61E2DCC15
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877909; cv=none; b=hbgn9BARel08uiG+CPLiZoFlYdLA8Ifpfd7+/Pl9P8zvH1ff+Tx3MWjrAyjimAy5IoF8Z6IecFqhuEX64BZPr9Ouuip21gb/FKg2NsVTITx2NenqUc9SzTFY8+h9mWzXHe7E6nhxC0yJpWzF1Za9ICgFg+3DCs/YYnQAgtfkuxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877909; c=relaxed/simple;
	bh=RjlGb7w/AnhlwxzMhXI+xVDeW3FXUUnZ+ueqKPPcNeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QH6oURIKDRxxVwh31VsH8HsfL/o6RA5I3fhvrAJeOf8Rp0C9Wj3q+SahoDHBPwB/xdCTnNLXmEC1GiBCWpAL2Hg8rRBtmzyPFRZ6FdsK3zdb99OrFihH26IrmJj4E052nyiz6QQ5FzybYBrbda9gVUeKhylQKOllJp0T3mRderc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDmKZ1SP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDmKZ1SP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26621C4CEF0;
	Wed, 25 Jun 2025 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750877909;
	bh=RjlGb7w/AnhlwxzMhXI+xVDeW3FXUUnZ+ueqKPPcNeQ=;
	h=From:Date:Subject:To:Cc:From;
	b=qDmKZ1SP9+00sFr8CcP0qy9BUZzeazvNkHopWl1nYQIasIjEgqQ6kkYeNucUIP0cf
	 BR7t5fMsCokWi/6Yv2G7djfPU0dzcihUv/dbVF1YwLpAG686S1/sDW2WW5wXhrvJej
	 gUbdQ08O7oCZBQ4jMCUOCdRQ2/6+/UR+P1C9OBJXul2a1t7Vq1DfAIkLCa6h03fFva
	 4uuKlMSxTvTtz4zwO2avrO1opuF8BUSTesRdfP9gss2oKRlXOEI3R30ONd9uJMyiQO
	 5R7tVFEVIw2Qw4mDBYdx/7ybzqP9fLTLOGfIX2LItxcAozEr+A8lBHgZoBWdVgabvm
	 3eLTz5sMFjIHA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 19:56:34 +0100
Subject: [PATCH] arm64/gcs: Don't call gcs_free() when releasing
 task_struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-arm64-gcs-release-task-v1-1-54cbdc2db416@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGFGXGgC/x3MTQqDQAxA4atI1gYyVqfgVcRF1Kih/pGUUhDv7
 uDyW7x3goupONTZCSY/dd23hJBn0M+8TYI6JENBRUUxELKtscSpdzRZhF3wy/7BF72HLtLIoSs
 hxYfJqP9n3LTXdQNLq9FmaAAAAA==
X-Change-ID: 20250610-arm64-gcs-release-task-307db60fa1b4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RjlGb7w/AnhlwxzMhXI+xVDeW3FXUUnZ+ueqKPPcNeQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoXEbTeUN5t/UlNloC7DPsJVvz95VmKcMJhv+lG
 Sqh4xj8YY+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFxG0wAKCRAk1otyXVSH
 0G+9B/9D8IUxvntv3DBKBNH2U8vBc2ndFy/Axie0znjeibUqabV9UqqSVUvDdfOBT2GrL2IWC6j
 m7rd08BkjcCWu5XiquQP9lR4nLE77Q0PQHOre5TEPuYpEEDZQgTw9CMRYzZl/Y1h8Jp7CzIqGnn
 kOqu0KjExJpzH1PDmJdYtQRkP4l3A2lQ40RwkwxNIgYHBiLTtP1DHfnUdk0LdJ/arTCLqkeqUC7
 dy3DzLknQw2gPL0PGEhPGJ+ZHcNJt2JXAyFDeaFhnbG5T10QuNSJgNxYGyjhWYjr0dfpg8kHf8d
 1J8nSxrIwBHVUEimywPCeQ382SjQLGMjVurkweXkXuCCjKTE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently we call gcs_free() when releasing task_struct but this is
redundant, it attempts to deallocate any kernel managed userspace GCS
which should no longer be relevant and resets values in the struct we're
in the process of freeing.

By the time arch_release_task_struct() is called the mm will have been
disassociated from the task so the check for a mm in gcs_free() will
always be false, for threads that are exiting leaving the mm active
deactivate_mm() will have been called previously and freed any kernel
managed GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/process.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 5954cec19660..5dcfab9ce012 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -341,7 +341,6 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
-	gcs_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250610-arm64-gcs-release-task-307db60fa1b4

Best regards,
--  
Mark Brown <broonie@kernel.org>

