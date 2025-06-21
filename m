Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41963270EBB;
	Sat, 21 Jun 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=W+/viKaC8dVx2g58QulOav0z/a2iY6mpLCv3wZIPe+UmLWZtV+OcmxcRTvzEpTO4IHk/BpX2mO7gEKxHI+U4vNLIlDgggDxulci4p3bKueBHhVwDxQFFg0H0CotoBhOXTuavpIqbyoFJH1ZnlgQFF4F0GLP4vuE8Puof/Xojd7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=oiyShiLy6Ub+4Mg4ssKBBXxMfSoqaxymRvpCFzMMomw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hebPHuVefkOVDAJ5ikT1AboJ2ETow+6gUmEudHGl39B6QOzxer29GVZF3UndkOElgob7YVoFDpaivf8pnk6mRph1scrFpfLl47H9r1beMPPvtBHdRBM204+Sr3MZC7CBsK7b+iUBx7xLnntNjmQk1SkbA5sK+Pk3UGyuhL25zP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L210lewo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L210lewo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA56BC4CEF4;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=oiyShiLy6Ub+4Mg4ssKBBXxMfSoqaxymRvpCFzMMomw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L210lewoTx/bkGvcjNi6kCGjARZfGNNhxfm9nfNA14b0iiCRrfZs563PY2peN+EAe
	 WrXV+gb0/+NVub2kiVObZOOWpV+/uxPK6My/j8WdV6ZbErpBXkmG8uvWpMB5VVI/gr
	 Jb3hB2/Qqt2VrbbrwzpX0O9AEfMlrNE0kCfY7qyTur7ySPpN8SjSXtDvhn9tO/0ihO
	 wrjf81tw9DwD3gEgevi+3EuQOnnIlp2P821o5AKHTRacJ5uH0KzxLBT/1YGevT6FcW
	 IE3O5E7hVQBBiwA725BV21NYWE5Oq16mBZeTMnjLnaqL8zplv9GH2GLkhy3Ubar7FP
	 ku6PavIR4hSaA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e44-39j2;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/15] scripts: test_doc_build.py: improve cmd.log logic
Date: Sat, 21 Jun 2025 21:55:47 +0200
Message-ID: <48078563434a857be8077d9707e539faa70a3521.1750535171.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750535171.git.mchehab+huawei@kernel.org>
References: <cover.1750535171.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Simplify the logic which handles with new lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/test_doc_build.py | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/scripts/test_doc_build.py b/scripts/test_doc_build.py
index 087b8c476f05..7ea6add48f9a 100755
--- a/scripts/test_doc_build.py
+++ b/scripts/test_doc_build.py
@@ -157,14 +157,16 @@ class AsyncCommands:
         self.fp = fp
 
     def log(self, out, verbose, is_info=True):
+        out = out.removesuffix('\n')
+
         if verbose:
             if is_info:
-                print(out.rstrip("\n"))
+                print(out)
             else:
-                print(out.rstrip("\n"), file=sys.stderr)
+                print(out, file=sys.stderr)
 
         if self.fp:
-            self.fp.write(out.rstrip("\n") + "\n")
+            self.fp.write(out + "\n")
 
     async def _read(self, stream, verbose, is_info):
         """Ancillary routine to capture while displaying"""
@@ -301,10 +303,10 @@ class SphinxVenv:
             make = ["make"] + args.make_args + ["htmldocs"]
 
             if args.verbose:
-                print(f". {bin_dir}/activate")
+                cmd.log(f". {bin_dir}/activate", verbose=True)
             await cmd.run(make, env=env, check=True, verbose=True)
             if args.verbose:
-                print("deactivate")
+                cmd.log("deactivate", verbose=True)
 
             end_time = time.time()
             elapsed_time = end_time - start_time
@@ -356,10 +358,11 @@ class SphinxVenv:
                                        python_bin)
 
         if args.make:
-            print()
-            print("Summary:")
+            cmd = AsyncCommands(fp)
+            cmd.log("\nSummary:", verbose=True)
             for ver, elapsed_time in sorted(self.built_time.items()):
-                print(f"\tSphinx {ver} elapsed time: {elapsed_time}")
+                cmd.log(f"\tSphinx {ver} elapsed time: {elapsed_time}",
+                        verbose=True)
 
         if fp:
             fp.close()
-- 
2.49.0

