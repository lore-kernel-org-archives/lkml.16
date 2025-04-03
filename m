Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E502505AF;
	Thu,  3 Apr 2025 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689371; cv=none; b=iBeo8/baItajWTQMIZS/EyS0vTIa8cToC43n9NqnLUQrRxtlgjOXvTERKftMvN2I9hawHexRmaTMj1skuh3OjFEBhs+nkC+ZqQ0psNshiRGr7T0lFCNiYQ3szDqiF/fRmBPdbCdIaxhInjocI22dPZfhCNpAy/j0n0e5DGeNhFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689371; c=relaxed/simple;
	bh=8+GYuJJORNXwm8msrV6LzgUs+zEbzIX7ocSGiHQNjOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdfQkOp9cov4YobmNH9BbXqK1tgcE9oslKVdV81stAjAlp6pcPzGDVHCNeniGZ4us7Dt3UphvhcHy7u48ajDUgEsb/O1tzASQ1S0/qw0X7HL+zREComsUHYa3DpjeMlqKAZ5Gr+/diqUx7mhNYUdmjk1i3gSbIe6gzD3q8icH1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slYIak7Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slYIak7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46270C4AF09;
	Thu,  3 Apr 2025 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743689371;
	bh=8+GYuJJORNXwm8msrV6LzgUs+zEbzIX7ocSGiHQNjOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=slYIak7QPSVSgUDzicllo5BtQhUjPzDp+ZqpUWSN61d9mdeVlJ0PknyrFoANP/ReV
	 C1wnya5XKEMdEs/moTMXhve8B+cIYVsHnYy1Ajzg7x43LG9JbUo9Zj5dMDEcQTOrRk
	 02Wr4MJwhj7lXrpUOXtBtJL69huQzfwH7q2g1CylcGukI0DTYojh4jGxWpSP77Maay
	 /hwCZcXM0TSIRR9MDxlZxVOTVsqlQGqiCV/jRVlTsPzhEMo9K79OY0Lrqy1pwC5YvE
	 HQAxP9KE39vIydLG27kezwJudCnYmmgQdZIZSxCGE2Rob91R9mRHMzslKpQOY+25B/
	 OJeUvj/ts+77A==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 03 Apr 2025 16:09:02 +0200
Subject: [PATCH RFC 2/4] pidfd: remove unneeded NULL check from
 pidfd_prepare()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-work-pidfd-fixes-v1-2-a123b6ed6716@kernel.org>
References: <20250403-work-pidfd-fixes-v1-0-a123b6ed6716@kernel.org>
In-Reply-To: <20250403-work-pidfd-fixes-v1-0-a123b6ed6716@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>, 
 Lennart Poettering <lennart@poettering.net>, 
 Daan De Meyer <daan.j.demeyer@gmail.com>, Mike Yuan <me@yhndnzj.com>, 
 linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=678; i=brauner@kernel.org;
 h=from:subject:message-id; bh=8+GYuJJORNXwm8msrV6LzgUs+zEbzIX7ocSGiHQNjOw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaS/mzZlyc0JT09Enl73/YrT7SOTnfYH3C4seanJf/zQn
 MPBAaseqHSUsjCIcTHIiimyOLSbhMst56nYbJSpATOHlQlkCAMXpwBMZM9zhr+yV07/dDxw4kxc
 zrx1vffUPXPKu9y5Ix6+cjMs7nA5XnKUkeHlV5OItMfX++8cWRGzQJiBQz+4p6jyT1xE4EdWqds
 3tvICAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

None of the caller actually pass a NULL pid in there.

Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index c4b26cd8998b..182ec2e9087d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2110,7 +2110,7 @@ int pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
 {
 	bool thread = flags & PIDFD_THREAD;
 
-	if (!pid || !pid_has_task(pid, thread ? PIDTYPE_PID : PIDTYPE_TGID))
+	if (!pid_has_task(pid, thread ? PIDTYPE_PID : PIDTYPE_TGID))
 		return -EINVAL;
 
 	return __pidfd_prepare(pid, flags, ret);

-- 
2.47.2

