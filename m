Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53DC6EB79;
	Thu, 10 Apr 2025 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319425; cv=none; b=UeFWQzw+j5oqpHojEaWroXud0LOWDUcjNKVUq6l2q8CY4Vx7bT022SZTZ1D0hbI4nuSnIUrgkT+npZNv82Xr0L4iLv1b9xw6J1vhIvkT9JjFt77Xq46ZkrOAhe48HCR4sD9oa+2mO/3zzCxBpvj9V3Gtyk69xs8olNDk5zg8h/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319425; c=relaxed/simple;
	bh=HxR8i9KioPJ2kVY1Z/Bo5KCbFRvEVY4AlBuJ05HKATI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9kn7GQMHbRDL2BkhdU1XHzg2Z8J4Ji66yfwgSJ4A0POAN6YFgyXfoN0wOygFsayTMxT9wFBoS5jOuXYNufABJjXZXqwF7FLDRIUC4XQY3Q5xHSQ8X7PshnRggcUCsB0YgpmJp7pSFsn4fPjSrD++l03Yq9FU0mb0azAdI7hUkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXnb9pCa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXnb9pCa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D032C4CEE9;
	Thu, 10 Apr 2025 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319425;
	bh=HxR8i9KioPJ2kVY1Z/Bo5KCbFRvEVY4AlBuJ05HKATI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZXnb9pCa/qiu1OqiOaqtfh14EKo7wdEIFd2XA6v2SSwCzzmTiqJE8Mw6igP27k0CG
	 FU0dqWq9mxfuX2duBgJakG0h6VJkovu5na4tAIbwMZnafDuTdT+i2uKrCjgVoH848I
	 po7MC+k9KKJxTFAPibc+onh8a5OY1/AH+KqQSq7pEoHLfFrcdSL4tD2WhnEKeCeUD6
	 5i93sUwaFJGDVVA8qegNaHKjo3clU6ni2N6/Pl+QIvNTVx950iPVeHF6PZ9FQ2vKet
	 OnCQ8ggD7tTyd6o3zQ3z94D+9QOToGjP9WFWX4rTEYg4t1HZYMl5TUiGpQnAwY+WaM
	 XqJC+R+9HIiqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00832C369A6;
	Thu, 10 Apr 2025 21:10:24 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Thu, 10 Apr 2025 22:58:53 +0200
Subject: [PATCH v2 1/2] clang-format: do not allow short enums on a single
 line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-clang-format-fixes-v2-1-37894413bbee@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744318739; l=1102;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=2Vs71mWhfKOIVP32H7x/aEA2nZetyj4bgJc+AhIa5D8=;
 b=/C8t4Grf9AMtPycJW4PsRdu/pbt3F2HJFhPsBKHdfK+fQdOC0Ajc9AZiR6tERomdTwtV/l2o0
 R5UMxx2M7vVBkLyJOxUiOYwWe5btE08DwH0+rh/3jYgtJz6FY8P6wxT
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@wolfvision.net>

clang-format 11 introduced the option "AllowShortEnumsOnASingleLine".
Set it to "false" in order to avoid short enums of the form:

    enum my_short_num { green, red };

With the option set to "false", they will be converted to

    enum my_short_num {
            green,
            red
    };

which is consistent with the definition of enums with more items.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .clang-format | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.clang-format b/.clang-format
index fe1aa1a30d40..8040b516185b 100644
--- a/.clang-format
+++ b/.clang-format
@@ -19,6 +19,7 @@ AlignTrailingComments: false
 AllowAllParametersOfDeclarationOnNextLine: false
 AllowShortBlocksOnASingleLine: false
 AllowShortCaseLabelsOnASingleLine: false
+AllowShortEnumsOnASingleLine: false
 AllowShortFunctionsOnASingleLine: None
 AllowShortIfStatementsOnASingleLine: false
 AllowShortLoopsOnASingleLine: false

-- 
2.39.5


