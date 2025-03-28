Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015720DD7D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743138267; cv=none; b=K8h6LTEKbby2PrxEjnsE+RLOb1uVkfXkAjbNZ3umbWyljG5SgahjQfOk6H6EshGfntcsQZDNYbv+xZitjaUkW+DOVRgnUIFHHMDX8XXPeQA+G+uAjOPnWVMTRd4m+7cp8u7rf2rfkg15S/hZ/h64eJ32rBKtMdfSeohhzl405Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743138267; c=relaxed/simple;
	bh=1yj8dhgzDIV8G0WRIClQNYLJgUPmkwlcqABMXs/7pjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlyareZQWC36ERI7exWL7xC7IZG8E/LtQJP1oQ5h31GYvT8Zzg/5kPsnSSJwyVb//4/YptMU9eS0IfrMuey1ERY6NHBAEBRlv9uxTHWOHobcvCDZk1auP4hZyTQY2VDNuQB5cRZg9BV3kUikVV4CbTQYuqFCP/3EBjmiVYO+RBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL+fZg6v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WL+fZg6v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7498C4CEEE;
	Fri, 28 Mar 2025 05:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743138266;
	bh=1yj8dhgzDIV8G0WRIClQNYLJgUPmkwlcqABMXs/7pjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WL+fZg6v+ghExi/6DoqKiuFO0T3wgr8pLyItZozndv6ZrWky5ZjnW1t7ia4h7Edtf
	 jl8zTlR3u/Mn5UfTFXIaV7FNgq/4Lr22Unh7xBIUTV0Dk0VgQWXhMxT0owKez/z9YH
	 0h0ngMX/GCgH+ngxBD1UFvIOU2GopXGo40z4/GD/6uuUEcM9y/Djne82ogFNShPmZl
	 kT41JifkmyAxdmwTjslASB16ZCg/N7BG2trVgxQ2MpUjcRbLuskfVUauCBtmQ734kb
	 WcmwCfoVsdfCEtCaXmWGtWPtCg4v/VTNSaHXEgyPqdib3e9UJsMi4GLgodRlm6oQU5
	 oPJ6+cegCBr8w==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC
Date: Thu, 27 Mar 2025 22:04:23 -0700
Message-ID: <eff3102a7eeb77b4420fcb5e9d9cd9dd81d4514a.1743136205.git.jpoimboe@kernel.org>
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

The following commit:

  0b0d81e3b733 ("objtool, drm/vmwgfx: Fix "duplicate frame pointer save" warning")

... marked vmw_send_msg() STACK_FRAME_NON_STANDARD because it uses RBP
in a non-standard way which violates frame pointer convention.

That issue only affects the frame pointer unwinder.  Remove the
annotation for ORC.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 1f15990d3934..1d9a42cbc88f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -289,7 +289,7 @@ static int vmw_send_msg(struct rpc_channel *channel, const char *msg)
 
 	return -EINVAL;
 }
-STACK_FRAME_NON_STANDARD(vmw_send_msg);
+STACK_FRAME_NON_STANDARD_FP(vmw_send_msg);
 
 
 /**
-- 
2.48.1

