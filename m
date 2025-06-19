Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512BE18EFD4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331097; cv=none; b=TlHEmP7NjSwlrOkzPUbpAuH6bbm33+XrQS2s18W6VRB9WlQHy4f4S7AMwatCv2y6x/dCY+4M2Fr5Hsk2qLlT10FZO9VeyEY2HJGPeCVLt3v7Lv8OHwVzs5XUzv7vP8HqzwTg76Xyt82BYais9K4qiGH2Rfw+CFoQrz5lQ/BFtb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331097; c=relaxed/simple;
	bh=+RfqGckwxwcHYgdjrU+RS4QMxLQZt9BYXfAOSJHKVAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G2cJ8mQrenFgOxIdo5CtqMkur66KbSZlv1dA8xR+KmyZ/QZC6+3YR5iPs6Dl/l7b/Yw3yUcGcZ1jnxtqshIa8TTiFT/21Y2UBoxXGfGjDawNIHHLXV4ihxwJGVWbviDYFzmek/TZwLNfBxdlc+qXcmDCuwI/ryOVaB6OuLuBW6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUM3EKwG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUM3EKwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84093C4CEEA;
	Thu, 19 Jun 2025 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750331094;
	bh=+RfqGckwxwcHYgdjrU+RS4QMxLQZt9BYXfAOSJHKVAs=;
	h=From:Date:Subject:To:Cc:From;
	b=LUM3EKwGY9TzCNVjlKvBidys3+TgJOuGq842TLKi+NSBrVraIvycxKMnBx1jKhgJj
	 QkiUSGg1KbqawALie7HnpYTQkjLMs0gfINLqo9qQFqglmepZ3YclkZamTurta8X8cG
	 j1Bj2ySpJNml9z6I3sZ7PNLO3YYABQhKoXm9S5/lZeh1lkGBymEmST47QENTuym9MP
	 14N25uXQOSBGQGRkNHGRv24LVZInAH88NZT29XO6je06eP+jID1J+O9kWFqIqfMqgo
	 kQOaFMyO+YO3LyC5b/wrd8I9mOn4RxCdRo7nF7BrQTu0Q/469aoaWwUOXiOhB6vfeo
	 vH/ZPXPo/5xcw==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Thu, 19 Jun 2025 13:04:48 +0200
Subject: [PATCH] scripts/gdb: fix mount flags for lx-symbols
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-fix-gdb-lx-mnt-v1-1-ad2ba742048a@samsung.com>
X-B4-Tracking: v=1; b=H4sIAM/uU2gC/x2MQQqAIBAAvyJ7bsGETPpKdKh2q4Wy0AhB+nvSc
 WBmMkQOwhE6lSHwI1FOX6CuFMzb6FdGocJgtGm0rVtcJOFKE+4JD38jWWpo4dY646BEV+Bi/MN
 +eN8PzIVXumAAAAA=
X-Change-ID: 20250617-fix-gdb-lx-mnt-d6d5dfe76828
To: Jan Kiszka <jan.kiszka@siemens.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Stephen Brennan <stephen.s.brennan@oracle.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@kernel.org>, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=MBiONReEZiRd3v0czU332gZd5k4j3XAko4ZOnFKqFjk=;
 b=owEBbQKS/ZANAwAIAYX1bqTp6BOPAcsmYgBoU+7Tl95NvK4dmwcl4ie3M+iVGvRQ2F/1URg7C
 p1PH84LgKWJAjMEAAEIAB0WIQSyp6nP3QO1QP9YsnGF9W6k6egTjwUCaFPu0wAKCRCF9W6k6egT
 jzuFD/4sskL0de035sb6coRjCeQ9XnxOcMEa4wHg50a/I+0Z26+LHvxWocD65btWOFHVk7w/bS/
 PBYmRzZUWVnhlBtLXLZvgnIS0SXmQPDkg+x2Bnfu2QseZ6M2ao5jjRjf7rwU8N7avQ04tH6cNaI
 wtg8loBL+sPle6QOov84aJkII4OZoX0ouAnYSx0mcM3WDVq8/ouT39AAjwlLHUZn2cIAH20AgM9
 56JlOKZPhIE4Vx1XwKjHuwoMXu+S12Iz/LTuLrGKzuDrNnfF8yMLD8RJuAiNgAkEIWjrj3kYdKB
 eVL/pMYWNhJxM+htVnqzqltnmKFml33Izvhkfr7q4zKkel/0BxPJnyFrD4PDmQ65SPSTIz+yYh/
 ZPafx9E8ARuARu0zbUQI9rFEWgVURre3gYSHjfGbI9D7NNWuwLn3Drjngw2cQLDQvvPequXhEeU
 yJDPlo+iy9ozfPjZj3N4FIR/r+Tf/7iN18qKibiyR1tVZ2e1+NvEIYF4rLGm78jOsYEUDiD3Z5j
 m6OyR+G4h0IuKkT6A5J41sxFmgHXalG3YnKre5gLgeIA1fxGgiiy7o/Nyj5f3wXRGhAzaTDZXRV
 Jggf9IfWldMfoeQkAI6EbJ7zsiz4yPa744zVGSpoSXFNSRnlmZ+Ez9KsDJC9lyRygKiOOB6GoZ+
 lp7h7B5+WBoKkcA==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F

From: Daniel Gomez <da.gomez@samsung.com>

mount flags have been converted to enum making lx-symbols not able to
find them when debugging. Use the appropriate LX_GDBPARSED macro for the
new enum.

Error:
Reading symbols from vmlinux...
Python Exception <class 'NameError'>: name 'MNT_NOSUID' is not defined

Fixes: 101f2bbab541 ("fs: convert mount flags to enum")

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/gdb/linux/constants.py.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index fd6bd69c5096ac540efb93979d5eb03cb410deb5..d5e3069f42a7c0e07c4a79eeee5ca1842e6ebf86 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -73,12 +73,12 @@ if IS_BUILTIN(CONFIG_MODULES):
     LX_GDBPARSED(MOD_RO_AFTER_INIT)
 
 /* linux/mount.h */
-LX_VALUE(MNT_NOSUID)
-LX_VALUE(MNT_NODEV)
-LX_VALUE(MNT_NOEXEC)
-LX_VALUE(MNT_NOATIME)
-LX_VALUE(MNT_NODIRATIME)
-LX_VALUE(MNT_RELATIME)
+LX_GDBPARSED(MNT_NOSUID)
+LX_GDBPARSED(MNT_NODEV)
+LX_GDBPARSED(MNT_NOEXEC)
+LX_GDBPARSED(MNT_NOATIME)
+LX_GDBPARSED(MNT_NODIRATIME)
+LX_GDBPARSED(MNT_RELATIME)
 
 /* linux/threads.h */
 LX_VALUE(NR_CPUS)

---
base-commit: 6e5ab6fee68df8c40b338baeae6e269fa25a7e25
change-id: 20250617-fix-gdb-lx-mnt-d6d5dfe76828

Best regards,
-- 
Daniel Gomez <da.gomez@samsung.com>

