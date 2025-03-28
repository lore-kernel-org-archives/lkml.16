Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029421C84B3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743138267; cv=none; b=qRU8fp7YuPHcUdqb2kdFIhLYcp7MWYL4HBK1DJHme69cGgbDS9yU3brKT9U4DxgnPZGbyMr7gS32FdAimNagHPYv5ylyQkhv7vbmuO52mQ8o+IyKVtGhak2i4RE1kO3aTgEJWT6uG2qDLG0daPQ/I7oWLWwHxsOKxrwLSztd0/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743138267; c=relaxed/simple;
	bh=lS79mp1UHWS0SDhbFFU0ZHGEGRIr5Z31iIdfbGeyhws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rN4xOpGoRnLckOKMTkC4ChvJmkqZue4vnQ4KPVI4ygohlrBrVsINWbQTwJ3OIpJR7HHsjFJ93zD17h56BZcl7lOP9O6qec/NASrzL66/CPfi5swbInoeBKvxtTCSWYFAGFtu9nQcfgppKlVE/P5on4oiVCkv08C8zXFQLF0YRaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pr3xPL9S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pr3xPL9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5095EC4CEEB;
	Fri, 28 Mar 2025 05:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743138266;
	bh=lS79mp1UHWS0SDhbFFU0ZHGEGRIr5Z31iIdfbGeyhws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pr3xPL9SQL/NuWCbWMRuSypSfq/2nIUQLGatNaxJiqg90PsjFNDZlBKEAzgTZB6fg
	 +3XHqNogDJyiFbDTJvjz4OIA61bWablshTk+kYd2dlLwdy/SqAysOQtWc/yi+j+BkH
	 utHTktPXuWT1BlBsDrT3FfuPCJLPM+u2v3ExoF4+Ck+9jfNBA7HPP06WEYYownI0sP
	 Ftdub+mTNoWtWJt0XGyZmB7mENY43RQdzIb2vlOX860+s7q5tWIpgJInKgipXJMuA3
	 Yiyjqfhn5m8Xb+n9eGRhokqb8ZwDFr5iy3dBG1YEA0AK41EAkcYB/1STVjvQNNzlBA
	 JvrpUOkJu/ICQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/3] objtool: Fix STACK_FRAME_NON_STANDARD for cold subfunctions
Date: Thu, 27 Mar 2025 22:04:22 -0700
Message-ID: <70a09ec0b0704398b2bbfb3153ce3d7cb8a381be.1743136205.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743136205.git.jpoimboe@kernel.org>
References: <cover.1743136205.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent STACK_FRAME_NON_STANDARD refactoring forgot about .cold
subfunctions.  They must also be ignored.

Fixes the following warning:

  drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_recv_msg.cold+0x0: unreachable instruction

Fixes: c84301d706c5 ("objtool: Ignore entire functions rather than instructions")
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 29de1709ea00..fff9d7a2947a 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1014,6 +1014,8 @@ static int add_ignores(struct objtool_file *file)
 		}
 
 		func->ignore = true;
+		if (func->cfunc)
+			func->cfunc->ignore = true;
 	}
 
 	return 0;
-- 
2.48.1

