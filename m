Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88E1E32D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229069; cv=none; b=s8lmZOsV8JbBpHzw+G0dcgAQ39NlZiiF/ttt6qIv8PLOm/KCWEMQEjVd9nHe4hIcDpR+bq3XEVR3EghpTG/L793G475c3tH7xEWj046pg5dYU0kwaU69S+TumsLXQuZxnwEr220COGAUl2gyU5D/UCnR4Q4R6GYT7W4GzsysKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229069; c=relaxed/simple;
	bh=V6sRKuetJn5AbaXphKCel7x1TyDGI8JOUEdRcyW6CHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GWsh1wAVTKl9CQDO8XgBXg+bU/Mss/B6fRnTDRX0S49qtgP9+RZucOJssn5odKx8VKZmBinobNN4RgzHJr4dCATG68hH0uVfWr8z3G7VXXlDIf/p2VMkQUd6zhtfSUnF/XZgsZ2iB4fNw6lp+U8Hoc1/URQAzo8t050oNV3XEQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d5t7ZIhw; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d5t7ZIhw"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5e39d1e0eso7787285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744229063; x=1744833863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2zrkJPw55Y9UfxsEFvyWMHfC80VpPTQSx/31eYU2UIg=;
        b=d5t7ZIhwKFAl6dUNirf3cDay9D/vEH7MfERiyaoLL5v/wFRhH33u6TmTW1+F/ny3zV
         JzeRdK9k6HWm2nfFaOd8ezy+RohSsUN3ZZNULE7noMsuy36PU+HPCW0ZkRB5s6ntH6cP
         ODBpqUYtGQuWBkg62gY/Ir5SFVW1CYOG603iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744229063; x=1744833863;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zrkJPw55Y9UfxsEFvyWMHfC80VpPTQSx/31eYU2UIg=;
        b=JsWvS26dpqk67v0wf90BJPKWUzmzk+JrGS3LiLZYw9wGHkR2fqDKiKYtUDWp/8mGnH
         sCcRcbG29glXSsb/qzJhTlQvQaw4QMmu1VB/xF4M7ZYwKPT0KGw5yATe2swlg2vu2axD
         LxX00YKX1QkjA+k33EKzNyKafKMeSwkQEzgLgdhx6g0hEqY7XfIS6vJBkXpffPYOi/wL
         btPBWUo0Dl+rNqJwgnzD07CDEUGSfMsHVixcoauE9O6e7X/mE3T2D5iyAIQ0ucegMsQQ
         R+NFp+FM/Mdiw4TM/uuSvDfC0t1PC1HwI1BTNmddUlnl5ILwf+wPxiqy35Wq1WFnTU6W
         6ynQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtaxg8B7aFEqQRciFp4twyNpEHNQC/4akIQrpmM3YgCcknfgTpqDBO7DM5Rh/YBKWZT5DeuVt+DTuW238=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5jvMcSAeS5q3uu3abWkfIs5m3PozRKKlBbgyZgPza4OE2Jpg
	8XB6LvxQQlAicw8p6gtquEd6ewZ27MT5ZUPtKE/H1sGPegXd8i9MdSFZQBRdvw==
X-Gm-Gg: ASbGncvS1WePoQx8UXuA5lznFc4gkdA7mhH9UsUGEk0JuTb0+t/8K0Zna3PvmUx7iXF
	TA3qDhKddfW4ihDzWlhwXRlu2mC6Q0MhoK2I0OSprZmAXaTg13cZs7em4TMM40jsv+osuh5jmW7
	UkfiDieQAdQYgGWvu/ul2K2cdCQ+P1IpALl9k6ykrqi3qW9dbo3r45ORsrW8hONl2x3M2GfaaGC
	8W71PCoh9eO4kreHCKWHrE4FT/tSDrjC53pbDH2UUjUuXYoWuiviQtMjo/r1EBzGmfxk9VhizVO
	6j9I8/8gdUgqvgvRG1n3nE5DgfWW0IUgmB5PiwDyAVD3elBhVySCTHkDWV/SOa7391rOiAJvoL5
	DwHaVdrJvpiivl8W6wA==
X-Google-Smtp-Source: AGHT+IF/OgVz1Lw3IHaAPZg8e6Tzq6TMokI1iBKCA0SJBYl53v3u98C2/mmtHWybZPD+2AjUYirn8g==
X-Received: by 2002:a05:620a:24cb:b0:7c5:5a97:f770 with SMTP id af79cd13be357-7c7a76c3d8bmr13043785a.41.1744229063262;
        Wed, 09 Apr 2025 13:04:23 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a10a4d66sm114608285a.6.2025.04.09.13.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:04:22 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 09 Apr 2025 20:04:19 +0000
Subject: [PATCH v2] scripts/spdxcheck: Limit the scope of git.Repo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-spx-v2-1-168115798db2@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMLS9mcC/1WMQQ6CMBBFr0JmbU2Z2oCuvIdhIWWgs4CSqTYY0
 rtb2bl8P/+9HSIJU4RbtYNQ4shhKYCnCpx/LhMpHgoDarQa0aq4bsq06EZ7MabRBOW5Co28HZV
 HV9hzfAX5HNFU/9Z/P9WqVnQ1tseG+lYPd+clzPyez0Em6HLOX8YktsKZAAAA
X-Change-ID: 20250225-spx-382cf543370e
To: Thomas Gleixner <tglx@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-spdx@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Andreas Wendleder <gonsolo@gmail.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If the git.Repo object's scope extends to the Python interpreter's
shutdown phase, its destructor may fail due to the interpreter's state.

Exception ignored in: <function Git.AutoInterrupt.__del__ at 0x7f1941dd5620>
Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/git/cmd.py", line 565, in __del__
  File "/usr/lib/python3/dist-packages/git/cmd.py", line 546, in _terminate
  File "/usr/lib/python3.13/subprocess.py", line 2227, in terminate
ImportError: sys.meta_path is None, Python is likely shutting down

Make repo a variable of the function read_spdxdata() and scan_git_tree()
to limit the scope of git.Repo and ensure proper resource management.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Make repo a local variable
- Link to v1: https://lore.kernel.org/r/20250225-spx-v1-1-e935b27eb80d@chromium.org
---
 scripts/spdxcheck.py | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
index 8d608f61bf371647e7ca0129f583e94e535b6193..d5c4c37f1b068486af28110261f74c67301618a9 100755
--- a/scripts/spdxcheck.py
+++ b/scripts/spdxcheck.py
@@ -45,7 +45,9 @@ class dirinfo(object):
                 self.files.append(fname)
 
 # Read the spdx data from the LICENSES directory
-def read_spdxdata(repo):
+def read_spdxdata():
+    repo = git.Repo(os.getcwd())
+    assert not repo.bare
 
     # The subdirectories of LICENSES in the kernel source
     # Note: exceptions needs to be parsed as last directory.
@@ -295,7 +297,15 @@ def exclude_file(fpath):
             return True
     return False
 
-def scan_git_tree(tree, basedir, dirdepth):
+def scan_git_tree(basedir, dirdepth):
+    repo = git.Repo(os.getcwd())
+    tree = repo.head.commit.tree
+
+    basedir = basedir.strip('/')
+    if basedir != '.':
+        for p in basedir.split('/'):
+            tree = tree[p]
+
     parser.set_dirinfo(basedir, dirdepth)
     for el in tree.traverse():
         if not os.path.isfile(el.path):
@@ -306,11 +316,6 @@ def scan_git_tree(tree, basedir, dirdepth):
         with open(el.path, 'rb') as fd:
             parser.parse_lines(fd, args.maxlines, el.path)
 
-def scan_git_subtree(tree, path, dirdepth):
-    for p in path.strip('/').split('/'):
-        tree = tree[p]
-    scan_git_tree(tree, path.strip('/'), dirdepth)
-
 def read_exclude_file(fname):
     rules = []
     if not fname:
@@ -348,12 +353,8 @@ if __name__ == '__main__':
         sys.exit(1)
 
     try:
-        # Use git to get the valid license expressions
-        repo = git.Repo(os.getcwd())
-        assert not repo.bare
-
         # Initialize SPDX data
-        spdx = read_spdxdata(repo)
+        spdx = read_spdxdata()
 
         # Initialize the parser
         parser = id_parser(spdx)
@@ -389,14 +390,13 @@ if __name__ == '__main__':
                     if os.path.isfile(p):
                         parser.parse_lines(open(p, 'rb'), args.maxlines, p)
                     elif os.path.isdir(p):
-                        scan_git_subtree(repo.head.reference.commit.tree, p,
-                                         args.depth)
+                        scan_git_tree(p, args.depth)
                     else:
                         sys.stderr.write('path %s does not exist\n' %p)
                         sys.exit(1)
             else:
                 # Full git tree scan
-                scan_git_tree(repo.head.commit.tree, '.', args.depth)
+                scan_git_tree('.', args.depth)
 
             ndirs = len(parser.spdx_dirs)
             dirsok = 0

---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20250225-spx-382cf543370e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

