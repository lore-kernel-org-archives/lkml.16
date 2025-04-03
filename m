Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C337C226CE1;
	Thu,  3 Apr 2025 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707892; cv=none; b=azbHBJRvvybLXWBg98gFc0Xt1srozzjm4t1ISAvXwxvWA9jxKrnb9O9mS7AbbwNb09kflyqt299BgnpX1BvFaN2i1n0Od3dMmn2+Na/7t2oAs2HFRBoQ1MnXNXE304FWBq0XBWBgZEXjOVe02+kvARxnl1vaenv9PqpXzIc6k+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707892; c=relaxed/simple;
	bh=y31FT0VPmOIrzrYd/PqdiJGk9lGcZX3x/m2i0JUK/gc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KMKPc9CbRi93EQ7SQ50ftnzEuIQhnbC1leFpAZdIXl8kkE1HeCHD+HIap72CHKhLahSdUDZ13NbRm5jaLnglWPHJ5woVMKPoB+eB5SbfErQOpQmbGHnLUsxPrvA2ABC4wRXSjSmKOkfK++64snLdMk7EgRnVlbu+LUDnUiGJ0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1EsDvnJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1EsDvnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF408C4CEEB;
	Thu,  3 Apr 2025 19:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707892;
	bh=y31FT0VPmOIrzrYd/PqdiJGk9lGcZX3x/m2i0JUK/gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1EsDvnJPaMcsA9Dfc/pq33RBDux/nwqkmk7y9e1k1BqccbFDhpa/wnMbBQQVvSgR
	 +p551lVRL3E3sUxYVwN4OqNzOk8OQaMQUCH9kgxHxO0nAqDc3br7PZEP4J2erGX61b
	 mwOT3/e6n8ceKJEdH3hP3jn5k3r36jd0Ns/mTWWpd5SEVuj7XCk8OPcGKe352xWU1/
	 DnDRH4v0e1nBch7KczlinNoMUYoj6JgU+4jjgEuGryf3R78fCleGgqMHTlctMoImD/
	 xF+rCNCUuQ5Wg+Hw/azw9oxCx5gYwkNEs6pY9WrRI8bgs6ESg/dU+yKCzrNyutUKVz
	 VJxQ69dUsfbvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ayush Jain <Ayush.jain3@amd.com>,
	warthog9@eaglescrag.net,
	Steven Rostedt <rostedt@goodmis.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.12 31/33] ktest: Fix Test Failures Due to Missing LOG_FILE Directories
Date: Thu,  3 Apr 2025 15:16:54 -0400
Message-Id: <20250403191656.2680995-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191656.2680995-1-sashal@kernel.org>
References: <20250403191656.2680995-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
Content-Transfer-Encoding: 8bit

From: Ayush Jain <Ayush.jain3@amd.com>

[ Upstream commit 5a1bed232781d356f842576daacc260f0d0c8d2e ]

Handle missing parent directories for LOG_FILE path to prevent test
failures. If the parent directories don't exist, create them to ensure
the tests proceed successfully.

Cc: <warthog9@eaglescrag.net>
Link: https://lore.kernel.org/20250307043854.2518539-1-Ayush.jain3@amd.com
Signed-off-by: Ayush Jain <Ayush.jain3@amd.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/ktest/ktest.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index c76ad0be54e2e..7e524601e01ad 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -4303,6 +4303,14 @@ if (defined($opt{"LOG_FILE"})) {
     if ($opt{"CLEAR_LOG"}) {
 	unlink $opt{"LOG_FILE"};
     }
+
+    if (! -e $opt{"LOG_FILE"} && $opt{"LOG_FILE"} =~ m,^(.*/),) {
+        my $dir = $1;
+        if (! -d $dir) {
+            mkpath($dir) or die "Failed to create directories '$dir': $!";
+            print "\nThe log directory $dir did not exist, so it was created.\n";
+        }
+    }
     open(LOG, ">> $opt{LOG_FILE}") or die "Can't write to $opt{LOG_FILE}";
     LOG->autoflush(1);
 }
-- 
2.39.5

