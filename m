Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45131E9B03;
	Tue, 11 Feb 2025 06:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254777; cv=none; b=CKsMJGpMZeBry1OqJlEQQobHX2K0yVVK+3M7559m35sQabgFwQ4lNFhBshSHif9W4AZYdQllNUDvSOF9WR8HIvoiwRSNDE83DJfLawhEqZnD8gI3g54G7u0tPOmu2yF8m1arycbNdK+BsXcge8fhFKHoaVH2IB1NZFOZ303Gzpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254777; c=relaxed/simple;
	bh=fXjChbkoWttk6b9zeSDqzMhiiSdcMPZNU6a7c0viQdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5U5rOasH3h8QsJKXV4c4/VZe6S8pxdC0AfFd+56ay3F9KKaR6ByLgMgB07JGnvEyn9r/U9QyY3QnxJPD/49arxUi4wsYbZt61080RkwYPrcMwJxcxVZH2jGJiAd62mEcvwsTiV84qIpBKMOr4LQeb1pd5wjhaBDk7PVp9a/E7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfYkE78e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfYkE78e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328B4C4CEE5;
	Tue, 11 Feb 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254777;
	bh=fXjChbkoWttk6b9zeSDqzMhiiSdcMPZNU6a7c0viQdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QfYkE78eA/95JRsvfRtfwA6YvgcHiAeCcrPz7tJTvnQaEPBgGqz4iVekj6AW/sv9n
	 60Lx/LyvhDhRfOuai11AQVH50vWx0xQOhKmucA39BLARmsKN9W1RZxN/uoa7z2l/TO
	 OI0TDitdorbWiFzVEbqHdl572Z3ZNkthrg8ZOluu+l+Ej5g+/Jf+3nl2dNXK+ybhIs
	 9h1sMXvJHg74qAsmsKAa6flLs2/FC7YrR6O1EH72U6exI4vz4KYGoWRrrwBks86yi+
	 SVreaPkMP6fhDBcXPUNH5CrPNJEnYjXSW5XOFlZpKMbWdJHmXnhjwpBjUBKe1kGNQV
	 RWGuN2dotMeYg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjcN-00000008Y6i-1RMX;
	Tue, 11 Feb 2025 07:19:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] scripts/kernel-doc: drop Sphinx version check
Date: Tue, 11 Feb 2025 07:19:04 +0100
Message-ID: <0d002e7550476a68547ee53ad06cfd8fdcaf7c3a.1739254187.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739254187.git.mchehab+huawei@kernel.org>
References: <cover.1739254187.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As the current minimal supported Sphinx version is 3.4.3, drop
support for older versions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/cdomain.py   |   3 -
 Documentation/sphinx/kerneldoc.py |   5 --
 scripts/kernel-doc                | 129 ++++--------------------------
 3 files changed, 16 insertions(+), 121 deletions(-)

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index 6596fd00663f..e8ea80d4324c 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -45,9 +45,6 @@ import re
 
 __version__  = '1.1'
 
-# Get Sphinx version
-major, minor, patch = sphinx.version_info[:3]
-
 # Namespace to be prepended to the full name
 namespace = None
 
diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index be5b8fbf373f..39ddae6ae7dd 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -62,11 +62,6 @@ class KernelDocDirective(Directive):
         env = self.state.document.settings.env
         cmd = [env.config.kerneldoc_bin, '-rst', '-enable-lineno']
 
-        # Pass the version string to kernel-doc, as it needs to use a different
-        # dialect, depending what the C domain supports for each specific
-        # Sphinx versions
-        cmd += ['-sphinx-version', sphinx.__version__]
-
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []
 
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e57c5e989a0a..9b1e28426c0e 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -26,7 +26,7 @@ kernel-doc - Print formatted kernel documentation to stdout
 
  kernel-doc [-h] [-v] [-Werror] [-Wall] [-Wreturn] [-Wshort-desc[ription]] [-Wcontents-before-sections]
    [ -man |
-     -rst [-sphinx-version VERSION] [-enable-lineno] |
+     -rst [-enable-lineno] |
      -none
    ]
    [
@@ -130,7 +130,6 @@ if ($#ARGV == -1) {
 }
 
 my $kernelversion;
-my ($sphinx_major, $sphinx_minor, $sphinx_patch);
 
 my $dohighlight = "";
 
@@ -347,23 +346,6 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
         $enable_lineno = 1;
     } elsif ($cmd eq 'show-not-found') {
         $show_not_found = 1;  # A no-op but don't fail
-    } elsif ($cmd eq "sphinx-version") {
-        my $ver_string = shift @ARGV;
-        if ($ver_string =~ m/^(\d+)(\.\d+)?(\.\d+)?/) {
-            $sphinx_major = $1;
-            if (defined($2)) {
-                $sphinx_minor = substr($2,1);
-            } else {
-                $sphinx_minor = 0;
-            }
-            if (defined($3)) {
-                $sphinx_patch = substr($3,1)
-            } else {
-                $sphinx_patch = 0;
-            }
-        } else {
-            die "Sphinx version should either major.minor or major.minor.patch format\n";
-        }
     } else {
         # Unknown argument
         pod2usage(
@@ -387,8 +369,6 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 
 # continue execution near EOF;
 
-# The C domain dialect changed on Sphinx 3. So, we need to check the
-# version in order to produce the right tags.
 sub findprog($)
 {
     foreach(split(/:/, $ENV{PATH})) {
@@ -396,42 +376,6 @@ sub findprog($)
     }
 }
 
-sub get_sphinx_version()
-{
-    my $ver;
-
-    my $cmd = "sphinx-build";
-    if (!findprog($cmd)) {
-        my $cmd = "sphinx-build3";
-        if (!findprog($cmd)) {
-            $sphinx_major = 1;
-            $sphinx_minor = 2;
-            $sphinx_patch = 0;
-            printf STDERR "Warning: Sphinx version not found. Using default (Sphinx version %d.%d.%d)\n",
-                   $sphinx_major, $sphinx_minor, $sphinx_patch;
-            return;
-        }
-    }
-
-    open IN, "$cmd --version 2>&1 |";
-    while (<IN>) {
-        if (m/^\s*sphinx-build\s+([\d]+)\.([\d\.]+)(\+\/[\da-f]+)?$/) {
-            $sphinx_major = $1;
-            $sphinx_minor = $2;
-            $sphinx_patch = $3;
-            last;
-        }
-        # Sphinx 1.2.x uses a different format
-        if (m/^\s*Sphinx.*\s+([\d]+)\.([\d\.]+)$/) {
-            $sphinx_major = $1;
-            $sphinx_minor = $2;
-            $sphinx_patch = $3;
-            last;
-        }
-    }
-    close IN;
-}
-
 # get kernel version from env
 sub get_kernel_version() {
     my $version = 'unknown kernel version';
@@ -859,9 +803,10 @@ sub output_function_rst(%) {
     	$signature .= ")";
     }
 
-    if ($sphinx_major < 3) {
+    if ($args{'typedef'} || $args{'functiontype'} eq "") {
+        print ".. c:macro:: ". $args{'function'} . "\n\n";
+
         if ($args{'typedef'}) {
-            print ".. c:type:: ". $args{'function'} . "\n\n";
             print_lineno($declaration_start_line);
             print "   **Typedef**: ";
             $lineprefix = "";
@@ -869,25 +814,10 @@ sub output_function_rst(%) {
             print "\n\n**Syntax**\n\n";
             print "  ``$signature``\n\n";
         } else {
-            print ".. c:function:: $signature\n\n";
+            print "``$signature``\n\n";
         }
     } else {
-        if ($args{'typedef'} || $args{'functiontype'} eq "") {
-            print ".. c:macro:: ". $args{'function'} . "\n\n";
-
-            if ($args{'typedef'}) {
-                print_lineno($declaration_start_line);
-                print "   **Typedef**: ";
-                $lineprefix = "";
-                output_highlight_rst($args{'purpose'});
-                print "\n\n**Syntax**\n\n";
-                print "  ``$signature``\n\n";
-            } else {
-                print "``$signature``\n\n";
-            }
-        } else {
-            print ".. c:function:: $signature\n\n";
-        }
+        print ".. c:function:: $signature\n\n";
     }
 
     if (!$args{'typedef'}) {
@@ -955,13 +885,9 @@ sub output_enum_rst(%) {
     my $count;
     my $outer;
 
-    if ($sphinx_major < 3) {
-        my $name = "enum " . $args{'enum'};
-        print "\n\n.. c:type:: " . $name . "\n\n";
-    } else {
-        my $name = $args{'enum'};
-        print "\n\n.. c:enum:: " . $name . "\n\n";
-    }
+    my $name = $args{'enum'};
+    print "\n\n.. c:enum:: " . $name . "\n\n";
+
     print_lineno($declaration_start_line);
     $lineprefix = "  ";
     output_highlight_rst($args{'purpose'});
@@ -992,11 +918,8 @@ sub output_typedef_rst(%) {
     my $oldprefix = $lineprefix;
     my $name;
 
-    if ($sphinx_major < 3) {
-        $name = "typedef " . $args{'typedef'};
-    } else {
-        $name = $args{'typedef'};
-    }
+    $name = $args{'typedef'};
+
     print "\n\n.. c:type:: " . $name . "\n\n";
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
@@ -1012,17 +935,13 @@ sub output_struct_rst(%) {
     my ($parameter);
     my $oldprefix = $lineprefix;
 
-    if ($sphinx_major < 3) {
-        my $name = $args{'type'} . " " . $args{'struct'};
-        print "\n\n.. c:type:: " . $name . "\n\n";
+    my $name = $args{'struct'};
+    if ($args{'type'} eq 'union') {
+        print "\n\n.. c:union:: " . $name . "\n\n";
     } else {
-        my $name = $args{'struct'};
-        if ($args{'type'} eq 'union') {
-            print "\n\n.. c:union:: " . $name . "\n\n";
-        } else {
-            print "\n\n.. c:struct:: " . $name . "\n\n";
-        }
+        print "\n\n.. c:struct:: " . $name . "\n\n";
     }
+
     print_lineno($declaration_start_line);
     $lineprefix = "  ";
     output_highlight_rst($args{'purpose'});
@@ -2387,11 +2306,6 @@ sub process_file($) {
     close IN_FILE;
 }
 
-
-if ($output_mode eq "rst") {
-    get_sphinx_version() if (!$sphinx_major);
-}
-
 $kernelversion = get_kernel_version();
 
 # generate a sequence of code that will splice in highlighting information
@@ -2471,17 +2385,6 @@ Do not output documentation, only warnings.
 
 =head3 reStructuredText only
 
-=over 8
-
-=item -sphinx-version VERSION
-
-Use the ReST C domain dialect compatible with a specific Sphinx Version.
-
-If not specified, kernel-doc will auto-detect using the sphinx-build version
-found on PATH.
-
-=back
-
 =head2 Output selection (mutually exclusive):
 
 =over 8
-- 
2.48.1

