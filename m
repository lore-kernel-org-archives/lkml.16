Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830B13AF2;
	Mon,  5 May 2025 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483264; cv=none; b=R2mInjPDozHKxQoZgZuCDrErOOO+6/x1kFryT8Bbd//x/Q4oPqH6dyQP/wgxP7pgDbw5FFZgRZSuf/1yPxLMcZrlWpjRSNsjc7B4YgXxBcQmlU3qg6nXhUNU1i8tqBjVO+m7w+DDLfImX3X0HJtfRqMKvFzqi5wtliaFCR9CbTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483264; c=relaxed/simple;
	bh=JCdTVHeAiF0SMN4hqWeIRsGnSNa8+AKoDVxqQWbHrto=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c5JV0ZtwyE0loEVarhEW8z2xqGyWCCCXEIQLmHME398C0n5bQc/ggAhw0N/jCdzenUBkW0Af+hHEMCIdJIWMR3JUa3vgfSmbYyGe9L3cY0uwCxYw2kFqdtq2XRc5fDztCeR9nnhH4sMsX6ySBud1pV52mG7C3EBLTcO+CUBDz/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILzqhfNb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILzqhfNb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3503C4CEE4;
	Mon,  5 May 2025 22:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483263;
	bh=JCdTVHeAiF0SMN4hqWeIRsGnSNa8+AKoDVxqQWbHrto=;
	h=From:To:Cc:Subject:Date:From;
	b=ILzqhfNbvYCWWYNei9NySyINnqmj+vX4Uo4YCwnNjClRr+XCNFhMeTFETL/nNN7e1
	 JawE5UF1X0oD/0SlVRr46MxRg2t/6Z9RjHT9z2Iv9jdRtJXfMbEezwQQp1vxJV2Lgt
	 S5fhTEbcCpfMZ+1tp9hc1shvXu2OTvSSkfKHVEizmU4nvQExX4U/6hhNpHGXNqgsMy
	 w9oKV2vLfyQqu8erislSZuZVh5SaJfO4JBzSkfakvlZ7J4LYvR4+iWrHbeBTN2i0pN
	 OSqO+q8mwASWIrUVK1aJthDGNs6GzEvE5o+ZxNvzC/moA8SMovng1b2pveMOUROC/i
	 ltKIztPq4E/PA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 001/642] kconfig: merge_config: use an empty file as initfile
Date: Mon,  5 May 2025 18:03:37 -0400
Message-Id: <20250505221419.2672473-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Daniel Gomez <da.gomez@samsung.com>

[ Upstream commit a26fe287eed112b4e21e854f173c8918a6a8596d ]

The scripts/kconfig/merge_config.sh script requires an existing
$INITFILE (or the $1 argument) as a base file for merging Kconfig
fragments. However, an empty $INITFILE can serve as an initial starting
point, later referenced by the KCONFIG_ALLCONFIG Makefile variable
if -m is not used. This variable can point to any configuration file
containing preset config symbols (the merged output) as stated in
Documentation/kbuild/kconfig.rst. When -m is used $INITFILE will
contain just the merge output requiring the user to run make (i.e.
KCONFIG_ALLCONFIG=<$INITFILE> make <allnoconfig/alldefconfig> or make
olddefconfig).

Instead of failing when `$INITFILE` is missing, create an empty file and
use it as the starting point for merges.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/merge_config.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 0b7952471c18f..79c09b378be81 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -112,8 +112,8 @@ INITFILE=$1
 shift;
 
 if [ ! -r "$INITFILE" ]; then
-	echo "The base file '$INITFILE' does not exist.  Exit." >&2
-	exit 1
+	echo "The base file '$INITFILE' does not exist. Creating one..." >&2
+	touch "$INITFILE"
 fi
 
 MERGE_LIST=$*
-- 
2.39.5

