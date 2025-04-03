Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC320896E;
	Thu,  3 Apr 2025 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707812; cv=none; b=dBWtjeqdPRgDOhL3n882+cyYVKZXjmj+Xftd/OnRmupri9b2BL+1fSLIltyZUO9SSM1+0vwOuxI+ajTFwJbVHFGJ4FT7unqi9lrxQFpFUTdMqhx4OL5utW2Pm+vda++o9CBoMTY0C4vBcpKZx9Uzpq0aZ8Ve5t/gf9YLVzo2l+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707812; c=relaxed/simple;
	bh=y31FT0VPmOIrzrYd/PqdiJGk9lGcZX3x/m2i0JUK/gc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SKkodPwRiOBEsM2DNfwE0x71cIMJcRZVIwRftwwi+yCaToitdW9GSc3jupkjCb8fV1fgLWmx9vY1YNv5O1BNFg/XYDJb5N7eMe5yMm1wFqqhQ6FqijNhXcLqpISi7sDOdFQekmasuADLNea9ZMiKeDkGfeDMpsqkfhLmcIFXzFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QM5wv2oe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QM5wv2oe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D580C4CEE8;
	Thu,  3 Apr 2025 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707812;
	bh=y31FT0VPmOIrzrYd/PqdiJGk9lGcZX3x/m2i0JUK/gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QM5wv2oeBJwRPZPbpH1XWAr1hasB3Xz3WOIkkvAITYQUwQEIEKq5kzFlWCVfegHhe
	 OnzyGddw1nrQS4XUfh3itm2pLsSxlDj3e46tVQ3lDyuQuWTgdZpL7ORdyVJBHzbgLj
	 +G6jqcYIqeZee+nr2OSoGoiQGFVpR2tnInC7hDKi+gJb29NAyVPj3jYtHnUrBWdH9g
	 cPEyannBkoN8b58Ejw4s8CMmiwyNDGa04fCOuBro6zF+MBTRW32pXHJyL8FjtJ+HGC
	 4I7ILUVxyx3XheONSj62lBWHN1GecfSVkkyplqe8uyvvSge3t5UyIJChJbu/ctq6Xv
	 mNq0sPpDU5jZw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ayush Jain <Ayush.jain3@amd.com>,
	warthog9@eaglescrag.net,
	Steven Rostedt <rostedt@goodmis.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.13 35/37] ktest: Fix Test Failures Due to Missing LOG_FILE Directories
Date: Thu,  3 Apr 2025 15:15:11 -0400
Message-Id: <20250403191513.2680235-35-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191513.2680235-1-sashal@kernel.org>
References: <20250403191513.2680235-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
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

