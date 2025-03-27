Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF8218EBA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743094646; cv=none; b=qvCZD9zu0N2RMf7X/z85Cgj1TaIoyQ9jWH07QITkkh4TZ87wmWKQb4drKVxGeCKiH81LcX7mQ4dbMhd9iVZMf5gwTVibMXm6esli4BqtrCQ3TeWm3d8mxjKd9Xiuy8YOzML+kzHjAuUKkE2EGmwxt1TUn999MLqS6LxC90pNjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743094646; c=relaxed/simple;
	bh=IVIGLFnRNzITyoXI9iXcq8GyVD8ay2RvcOHePtMF88Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M6kDXUpnb0LTVaDGaTY/m0ZhsPlr6/FMN4VLzPVTl4pFYVMCcB2ryHm6UhiMKRvZkfkNWKCwbZQ77iagK39IV+WAFWM71uJMEZq8CEfDp/QlF+F9HUCE74GdYYQLQO9RZrSntjoo+LdBwqfkLBdRzU99U6RFMliqmYvlk7Y9T0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF94C4CEE5;
	Thu, 27 Mar 2025 16:57:25 +0000 (UTC)
Date: Thu, 27 Mar 2025 12:58:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, John 'Warthog9' Hawley
 <warthog9@kernel.org>, Ayush Jain <Ayush.jain3@amd.com>
Subject: [GIT PULL] ktest: Update for v6.15
Message-ID: <20250327125814.63968c3a@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Linus,

ktest update for v6.15:

- Fix failure of directory of log file not existing

  If a LOG_FILE option is set for ktest to log its messages, and the
  directory path does not exist. Then ktest fails. Have ktest attempt
  to create the directory where the log file exists and if that succeeds
  continue on testing.


Please pull the latest ktest-v6.15 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git
ktest-v6.15

Tag SHA1: 9da964b26614545e269dd9cce44e4af1070d91c5
Head SHA1: 5a1bed232781d356f842576daacc260f0d0c8d2e


Ayush Jain (1):
      ktest: Fix Test Failures Due to Missing LOG_FILE Directories

----
 tools/testing/ktest/ktest.pl | 8 ++++++++
 1 file changed, 8 insertions(+)
---------------------------
commit 5a1bed232781d356f842576daacc260f0d0c8d2e
Author: Ayush Jain <Ayush.jain3@amd.com>
Date:   Fri Mar 7 04:38:54 2025 +0000

    ktest: Fix Test Failures Due to Missing LOG_FILE Directories
    
    Handle missing parent directories for LOG_FILE path to prevent test
    failures. If the parent directories don't exist, create them to ensure
    the tests proceed successfully.
    
    Cc: <warthog9@eaglescrag.net>
    Link: https://lore.kernel.org/20250307043854.2518539-1-Ayush.jain3@amd.com
    Signed-off-by: Ayush Jain <Ayush.jain3@amd.com>
    Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index 8c8da966c641..a5f7fdd0c1fb 100755
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
