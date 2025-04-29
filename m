Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3429D2BE642;
	Tue, 29 Apr 2025 23:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970750; cv=none; b=eLR6dFzO1JJPjyvAjue6YjVIKRmQOCWGxt5maLof7UerXg9D7BpqtVS4Wd1p9vk3MuqDkB+2x5ByQoZoFiVmq3H9JtA6oBfg5nVscuW3yErla73NZn9CNBzsVDrN+xm23Hmtptk/fyCR1p5pxiM0xRrriA/oY0wxkJ/ivQ5cg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970750; c=relaxed/simple;
	bh=M7DfSalEfQUmz6ViDdHnXlWr6K4czZ429fliA3dRkhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dw4B31q21MX6eUTDrDgFnvKErZeLXrjaGRYlJr0fBnml7jWibhPEGuwD3PJT6rb94yU/NUI+JPv/AG78Cu7yudY6zeB76BJmeRlnpb2MROiRvWTnjsH8RjNPGLmbmNkFDRpuQWDiagh10cr8k8qa5gajW8WeC1nFPvRHyVPeUT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lv/iQvOg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lv/iQvOg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B6AC4CEEE;
	Tue, 29 Apr 2025 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970749;
	bh=M7DfSalEfQUmz6ViDdHnXlWr6K4czZ429fliA3dRkhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lv/iQvOgF0xu5NKSvr+PaJTl0reP1FQvXWFvHc+LIMci8gBYPw6IlnN1M9jtvSweh
	 +mFsx5Etak0CAcByEyJCuEs5sBJZB7nSV1JFRGY5D0hIsljStPtke7vHLzuCrO6xWk
	 UGcfssNIJ8VHFIeNYz2fIkDREB3xaKX4BQPq4cf0CNVNhJQAZcwFz4gstEd4CgbuDf
	 txLj4p2kUvDLSRqNlmtLmvnVzBISH54ysY7NVLZDMpu8E3Wdyrx3pNTf3KLbnBMzET
	 ri0wpu5TJOQScTXjhn+6J9KVIdQwUTWIyE3UWOsUaZuC4HMddMYn9gU+qE4XAJkGgx
	 rMosJk21eycxA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 35/37] io_uring: don't duplicate flushing in io_req_post_cqe
Date: Tue, 29 Apr 2025 19:51:20 -0400
Message-Id: <20250429235122.537321-35-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235122.537321-1-sashal@kernel.org>
References: <20250429235122.537321-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.25
Content-Transfer-Encoding: 8bit

From: Pavel Begunkov <asml.silence@gmail.com>

[ Upstream commit 5e16f1a68d28965c12b6fa227a306fef8a680f84 ]

io_req_post_cqe() sets submit_state.cq_flush so that
*flush_completions() can take care of batch commiting CQEs. Don't commit
it twice by using __io_cq_unlock_post().

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
Link: https://lore.kernel.org/r/41c416660c509cee676b6cad96081274bcb459f3.1745493861.git.asml.silence@gmail.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 io_uring/io_uring.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 19de7129ae0b3..ef24988af8cd5 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -887,10 +887,15 @@ bool io_req_post_cqe(struct io_kiocb *req, s32 res, u32 cflags)
 	lockdep_assert(!io_wq_current_is_worker());
 	lockdep_assert_held(&ctx->uring_lock);
 
-	__io_cq_lock(ctx);
-	posted = io_fill_cqe_aux(ctx, req->cqe.user_data, res, cflags);
+	if (!ctx->lockless_cq) {
+		spin_lock(&ctx->completion_lock);
+		posted = io_fill_cqe_aux(ctx, req->cqe.user_data, res, cflags);
+		spin_unlock(&ctx->completion_lock);
+	} else {
+		posted = io_fill_cqe_aux(ctx, req->cqe.user_data, res, cflags);
+	}
+
 	ctx->submit_state.cq_flush = true;
-	__io_cq_unlock_post(ctx);
 	return posted;
 }
 
-- 
2.39.5

