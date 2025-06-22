Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8818DB0D;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572172; cv=none; b=Jg0teteQp76lftMDhUNnsVqLLJ2OwLDSr5wkqZgv+zdIgDgtHARHVge2UxAUlP8Y8eVCvk/VNMOa/GtyupL9EJoTjHnxVA0bmMYS5R5WGyqAE46eJhGGSS81RhsoCzXmvHa955r42guqHJoYkIQ+7hnGkdBmc1BxlPPqGr0g6Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572172; c=relaxed/simple;
	bh=oiyShiLy6Ub+4Mg4ssKBBXxMfSoqaxymRvpCFzMMomw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyYwuQ8JnbcOwzxU5C1SNEj/Ywf7r9WphO7sPDqb8FHmiaLEC68J53TuraIV4+jo6zqhlT2id5TyG10/N7HLsQBODZOGOjqosqBnAKc+RqpsBGP3OB6KF9dUYOo7RPkMY9WTpSpAG52vc5M2js++ByYTmkzdo29F+lhfrVpkl5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYWLXDkD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYWLXDkD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBBEC4CEF9;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=oiyShiLy6Ub+4Mg4ssKBBXxMfSoqaxymRvpCFzMMomw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PYWLXDkD97MZypYFkQjCNd/buPQ3+OqNPHDxoIg1ga1bFQcuBbOftQxcqpsdXaApl
	 E1Ez0l4sCq6dfY6+8k2Q/Ncf6ikSHwgkVMEDq+Ou412EOSHQx93iXeqL2Cej6q8YeX
	 2xZJzI0mCDlHKKTtx6AH5VRr3ykyx6rwo5ORHWXaX7L/b0oQDjsW0cHclJ8/IgPWJE
	 jcEnEbwIxg6WwtURsyFPSjoWPmzCm/r/oDBbEnl8uIfpAFumwMNaosETS1pAwCfBtQ
	 KWFj+EifRyEhZfd5cZRDZQWKA475s0HHlm7FBoYmbXxEhD+yTbGGfEqbwMsDQBiBoi
	 Dt8TUSTcB7fFw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o2W-22dr;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/15] scripts: test_doc_build.py: improve cmd.log logic
Date: Sun, 22 Jun 2025 08:02:37 +0200
Message-ID: <2436f37ab7945673f26bcfc94c10e6e76b93c2d8.1750571906.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750571906.git.mchehab+huawei@kernel.org>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
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

