Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4841991BB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533723; cv=none; b=pjOSVz7QHZh1ylUsV85g2XbWH9XvMjF6uAtTWccI+d55pxjqRoQhPKwtWNr2rurROLiimPlxxqMxBB9jrIFiW5sP2aglRzIE6ptw+wXqtJiGdC56rCb8jQPFgUiqvLvc92prX/qVRly28sk+oh+2kvSPYtAjfJDaoY+M9NZQlas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533723; c=relaxed/simple;
	bh=Xe0lKdnaWUybW9AgN4y/zvh4P/p6aR5hGPw3NxEAy6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZCtCfG0etGhEk5PsBEXm08dbvFA8wQBv5t8QbjpenahITzed1iEQq1ZojF8tY+LcGzgIBoi6s4FgA9cuODpzK6f11eWyHRoSV0vJZmdQ8WIpdO569g9VbaZINWQa8/I45dvkWH89GiHjldvhqx77ik/uKoey7RQe39Sv2k61Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auq4GjL9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auq4GjL9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58286C4CEE7;
	Sun, 13 Apr 2025 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744533723;
	bh=Xe0lKdnaWUybW9AgN4y/zvh4P/p6aR5hGPw3NxEAy6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=auq4GjL9nLNJPn7xdUtWRqjR5YdFZ6FC5XPYkpRCH2rlHMTcG+siOC97uXVlAl4IJ
	 lHkaFSHL6uKuBKrdaIKVWJk2xIo032emEfo2JdkHi8kKvEZzeSZcsn/HHKtTmiCQEY
	 UrRSZ1XY79Tx3y+/2jxynDiY92P7gojlVOm7o4C3LBZkHCO2Oy1fKaLK0n3Vnqsd/x
	 x9eRtVw8iz371ebYpp34yKoV1Vi/4KkjKBJbmTPey2YG30VM8devnf3oKd0BhRoRJU
	 30At0OeNo86vElHxgi7rY9j+3TPltGlYRKl6GpEevQ7doza3zZj6XAkbt+w8YKK7Bu
	 M8s4rLsBWt5GQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH 5/6] x86/platform/amd: Clean up the <asm/amd/hsmp.h> header guards a bit
Date: Sun, 13 Apr 2025 10:41:43 +0200
Message-ID: <20250413084144.3746608-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250413084144.3746608-1-mingo@kernel.org>
References: <20250413084144.3746608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - There's no need for a newline after the SPDX line
 - But there's a need for one before the closing header guard.

Collect AMD specific platform header files in <asm/amd/*.h>.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 arch/x86/include/asm/amd/hsmp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/amd/hsmp.h b/arch/x86/include/asm/amd/hsmp.h
index f3253d27bf49..7674ad9c5cbf 100644
--- a/arch/x86/include/asm/amd/hsmp.h
+++ b/arch/x86/include/asm/amd/hsmp.h
@@ -1,5 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-
 #ifndef _ASM_X86_AMD_HSMP_H_
 #define _ASM_X86_AMD_HSMP_H_
 
@@ -13,4 +12,5 @@ static inline int hsmp_send_message(struct hsmp_message *msg)
 	return -ENODEV;
 }
 #endif
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
-- 
2.45.2

