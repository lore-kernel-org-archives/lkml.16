Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54AF28EA5C;
	Thu, 10 Apr 2025 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319425; cv=none; b=pu29E3fhZUvG/oMikZXviObj2ZqfsLr4FKNTZ8QyCRc6nrcfOK5zApYOhbgHc1l/wrVxMnINqkk4WjaQ9RgBoPCcHM1JQlLyzdqVdmNOvn1w/x/+KyXXxKPvXLUed91XheCxZvag7m0xJ9etEGEMpI9iRKF5OtlXz08KNqopo4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319425; c=relaxed/simple;
	bh=nQlZdTU+lS/Y/JHfgCk5WHjlwHAdkn/xnnQCVl6khHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBLb5kgZyhTudAIphSdy0Q7gpOGF9MSclK2wuemFIBKnlRWwW0Y3U9XMNpf3cixXznk/VQ/SkrMS+drbURmeG9apXwNnvH+TrKvYuS1dDVqnyqmMXA2zRV22ucnoi3ek7iEsnsfO5C1jgHAvxDF+7JDU3T7hqiMuA0JQjfcFut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0t5e1Qh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0t5e1Qh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32426C4CEEA;
	Thu, 10 Apr 2025 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319425;
	bh=nQlZdTU+lS/Y/JHfgCk5WHjlwHAdkn/xnnQCVl6khHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W0t5e1QhLQu/pFuBZ3cngf7c3cuqKpcQ9FABlAuzqwrJnWZ/f9fbElrMgD0O0SRTW
	 7YAkeXAhf0Z7/TfLX03tSuiQLkwoRJKH/NzdlkrO7rF13iwo4FFLfYXruULuG9qokw
	 QMLm38S/jYCJL08i6Eq7VLc9fQ7hKiTw5gAwwfAmflS1KnODHbTBhzKb8pGPcEmFVN
	 01tHx/gwz20jrws9i6e0l77ag0ZuvB3ZVly8qn7Fobr74aSCsq5UPzvKCtcE2TI1rQ
	 CpKThSDd10+oJvObwfO17XhvTXdnEYhg7dkZVdF0v/b9FAglZRNxJVq+vxyu53EeET
	 +LD/ccLhYjewg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0E4C369AA;
	Thu, 10 Apr 2025 21:10:24 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Thu, 10 Apr 2025 22:58:54 +0200
Subject: [PATCH v2 2/2] clang-format: align consecutive macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-clang-format-fixes-v2-2-37894413bbee@collabora.com>
References: <20250210-clang-format-fixes-v2-0-37894413bbee@collabora.com>
In-Reply-To: <20250210-clang-format-fixes-v2-0-37894413bbee@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744318740; l=1371;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=GCAcQLFrMA5v4a8RQ+v4hX/83CyGkOIzdbZt9W/iAMo=;
 b=eQYqQ3YfPADGuVnklkfGZ8zn5fc1Ke7BHBl6FyFpdefybbJRw2NKRRgfdiT6BGn/jlXU6U0L/
 32RqDjGfhLxDmqi61M2ZhSnT4keDU3L/iW3teyy6fMOiOL7q/ex73wB
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@wolfvision.net>

clang-format 9 introduced the option "AlignConsecutiveMacros".
Set it to "AcrossEmptyLinesAndComments" in order to avoid macro
definitions of the form:

    #define MAGIC_REGISTER_1 0x42
    #define MAGIC_REGISTER_BIT_FLIP BIT(2)
    /* important comment */
    #define MAGIC_REGISTER_BIT_ENABLE BIT(12)

    #define MAGIC_REGISTER_2 0x43

With the option set to "AcrossEmptyLinesAndComments", they will
be converted to

    #define MAGIC_REGISTER_1	      0x42
    #define MAGIC_REGISTER_BIT_FLIP   BIT(2)
    /* important comment */
    #define MAGIC_REGISTER_BIT_ENABLE BIT(12)

    #define MAGIC_REGISTER_2	      0x43

which seems to be the convention in the kernel code base.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .clang-format | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.clang-format b/.clang-format
index 8040b516185b..30d09cb88170 100644
--- a/.clang-format
+++ b/.clang-format
@@ -13,6 +13,7 @@ AccessModifierOffset: -4
 AlignAfterOpenBracket: Align
 AlignConsecutiveAssignments: false
 AlignConsecutiveDeclarations: false
+AlignConsecutiveMacros: AcrossEmptyLinesAndComments
 AlignEscapedNewlines: Left
 AlignOperands: true
 AlignTrailingComments: false

-- 
2.39.5


