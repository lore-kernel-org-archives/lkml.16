Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A320226D08
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887785; cv=none; b=EVNkRQBxYQ1PZD1YBYHgt4+JzvaVCf0ZmOgKHXlrq9aMO4LordTpBcv4lXXuPyeDOg9oDyB/M20G3Tpqjuc5vpbwd7cCwEcc3O5EmzuG/+Gp+k22GNudczELsBET6csnHctcQL9/kxtxfiuU10ow7oGB5vl6rWAS3a6EYKo3QzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887785; c=relaxed/simple;
	bh=JHvjlluIgoCgZdww1HLkSx92SKwvfnV6QWHxnPzuEyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EcOXStWZTfn7P5yEHWdFBf9Le7GPoHMs2Kjhs25adt/4nw0QJx7JZM70zlbNiGo/qpHTSYk+QabRUQeGjmtqbAtwoFa51IiCHiQbOy1IZdkMRprRhZq6SU8hBi21IbTrmHfB3SM5iqxfT955ZOMZidQ8YT46l4nKYynXgBOkLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOm78rLb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOm78rLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852DCC4CEEB;
	Mon,  2 Jun 2025 18:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748887782;
	bh=JHvjlluIgoCgZdww1HLkSx92SKwvfnV6QWHxnPzuEyE=;
	h=From:To:Cc:Subject:Date:From;
	b=uOm78rLbmePEMSVJ7PRfM90AMHm1JWo+yi2n1TLhqeshcDqJfbRsB9Xm7piZvVXZD
	 2ogvNO9A36IHi4gcaWcjlKLvxDZYmig9GZ92n8Q7d1B+GSg0bjheJ/6wDkVJPUdrwu
	 pOTtiknAoMdTpEfAK2H4aC0fOU9m5EKkd5Ad2fIqSzAT6e9RAeCksFrHiNdZfNkute
	 6YdndmE+s3x3NOvuHpmNPM8KbbOCdIcBQHCLoDj5O3fJBO9AgxAmiE0r1rQPn5g0zp
	 lLJXjA5O+F+PYCeDw5BXX56mVsSO7kDxjCkekIm5lgoCA0Cf2+tqE4GTlg4plrYQB0
	 wrPp0bRs/ktIQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: pi: use 'targets' instead of extra-y in Makefile
Date: Tue,  3 Jun 2025 03:09:35 +0900
Message-ID: <20250602180937.528459-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

%.pi.o files are built as prerequisites of other objects.
There is no need to use extra-y, which is planned for deprecation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/kernel/pi/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
index 4d11a8c29181..211e1a79b07a 100644
--- a/arch/arm64/kernel/pi/Makefile
+++ b/arch/arm64/kernel/pi/Makefile
@@ -41,4 +41,4 @@ obj-y					:= idreg-override.pi.o \
 obj-$(CONFIG_RELOCATABLE)		+= relocate.pi.o
 obj-$(CONFIG_RANDOMIZE_BASE)		+= kaslr_early.pi.o
 obj-$(CONFIG_UNWIND_PATCH_PAC_INTO_SCS)	+= patch-scs.pi.o
-extra-y					:= $(patsubst %.pi.o,%.o,$(obj-y))
+targets					:= $(patsubst %.pi.o,%.o,$(obj-y))
-- 
2.43.0

