Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B544B283699;
	Thu, 10 Apr 2025 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319425; cv=none; b=iJe4p9AsM8euvsp5iZmN1yvoM7joKI35ZQlrSUVo4HWRo27sP2eKUiOU4FLcMSmw97Pt9o5haTN0CL8D7EaGRDMHnSsP/reeZ0/4tr0AdA+MLdAFTVNTQkTHNRm4HO7ccmm77MF7aILDFlcurYdsdhmYCHP9damSgepoL0rOGn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319425; c=relaxed/simple;
	bh=LwjBjViQ0++5O1rnu8kLLZuctv/Nqm47sICzPz5fhgQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iQVA9SAlFpsiigjuknlwX6YWH3sct07gR/puYm9TmSmnVSGSZY1Od8fsr4Kc94qNncLbI51pycqfZmgOPkf6koh1A9K3JkdawUyCbbyYZSldTECx8qDHwfH8x7byf/UKXDR6rSS2DLYTB8dzGch1ccHV3cyEjFA5OBEl9JGDCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDa3e0zl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDa3e0zl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F19B8C4CEDD;
	Thu, 10 Apr 2025 21:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319425;
	bh=LwjBjViQ0++5O1rnu8kLLZuctv/Nqm47sICzPz5fhgQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IDa3e0zlYEgzXHz42IcIxQzvqqk7dVIYY8gd6mBaotI259tOvG1xJrba54gMWty2a
	 WjC1wxTKHYtzZy3h1yZ+6xb6tNfR6tw8FsKFimmvtU6VqUbEavwFRrCFj/0duz7Zz/
	 siEYbDOuCuIDJXQxn7ljstRZNJaJ9hRksYehwGx8b7fmrLPuBGKaXTOVA9iIgNpPwZ
	 IZk4l8aMnRv3sPESe2Z7lYKox4py8oA2l2yKhewB+KhZkBZvL67McvsPYm5bfxbniN
	 0C8rXla/CWRT7RrqI+cOBz50C0UZb204qQjb3ubVRBZOpV2apdoYYm9XLCtDizW6Wu
	 lh7qwla2/ivRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E404AC3601E;
	Thu, 10 Apr 2025 21:10:23 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v2 0/2] clang-format: format short enums and macro
 definitions correctly
Date: Thu, 10 Apr 2025 22:58:52 +0200
Message-Id: <20250210-clang-format-fixes-v2-0-37894413bbee@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAwx+GcC/32Oyw7CIBBFf6WZtWMA0VhX/ofpgsdgSWppgKCm4
 d/Fund57s19rJAoekpw6VaIVHzyYW4gdh2YUc13Qm8bg2DiyARnaKamogvxoTI6/6KEPZeWLKP
 TWVhowSXSZrTcbWg8+pRDfG8bhX/Vv3WFI8NeGycPSmqpxfUZJve7tp8pw1Br/QBMSKKruQAAA
 A==
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744318739; l=854;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=LwjBjViQ0++5O1rnu8kLLZuctv/Nqm47sICzPz5fhgQ=;
 b=AxltgeguiGoVLirBm2lfFieJ2+Ym3S7GDtGCPVvTu0COqf4shBE8+SByAkyn8d/iMAzb/tSOd
 8ef+Vw0xqhaBaID5ULv19iDlKnM1KYUmU4H4aUExer89Tw/xfLUESuE
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,

These patches set two previously unset clang-format options to
(hopefully) sane values.

Looking forward to your comments!

Best regards,
Michael

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v2:
- collected Nathan's Reviewed-by
- rebased onto v6.15-rc1
- Link to v1: https://lore.kernel.org/r/20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net

---
Michael Riesch (2):
      clang-format: do not allow short enums on a single line
      clang-format: align consecutive macros

 .clang-format | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250210-clang-format-fixes-914ded0e682d

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>


