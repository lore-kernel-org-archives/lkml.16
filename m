Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEA12DFA41;
	Tue, 15 Apr 2025 03:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744686799; cv=none; b=t6DtKMkspY/cVM3GOqOxmMwaZ+PAjCYh3ZU2yYjYW34O1xRpdshUqPbI5C4vwyPUP6bD7wPm3pnmwBphdeTT2zS6b7mV1yqKnajKgx1LRchqSElf4f5/hLJZ5QAyDagx9hJiSH7S0vV0DUFbGG1/2f6Mahq6v/+V9FJToRpxzTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744686799; c=relaxed/simple;
	bh=h3uu4qXBIkG9b6aYOyE2Bexh5w2J8hSXMd0ynXOv4iU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvxgQnxPJDz8e/0YBgXcBLvkxMXr7dAejT5X6im15L8BUdO5I9UwUzA5Ullfjd3+p+a0XCrxZzg9kqOj0RLjMOSqaEx1M0x59eVPbBd9ab/9VTx2xTNU2j6TS0aCRJ3nf2QZgFbk/EA3WdpHmwLoZzUTfU/k9fyh8h3ezEU/ICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNOfDGn7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNOfDGn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFB0C4CEE2;
	Tue, 15 Apr 2025 03:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744686798;
	bh=h3uu4qXBIkG9b6aYOyE2Bexh5w2J8hSXMd0ynXOv4iU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNOfDGn7S+3D5YO8rRh+0AA6NKTwHXAqJiaqhn2AP7vf4iSiMTnAQWrkfvrL1d4xs
	 NAYO5Yfr3l9SgiXnKNXX8nTyuP3hspUqR93UfHeEGj8lUKtuicfDAqQjdaB81T/Y+i
	 +pHXYDqNqXM2dz8qdjPlC0vCDz6xgKllki5kBcI6yG4BnrbYFMrkwNZ4i8Kx3Tb8Xs
	 gi8vSh6aR66PDpJsxS9hpwxJtETY4Aa7/ofoXKx7Nitvm6XWPBj9LpSEmSGpfKD5Ly
	 upd7deRRzp8lA4jUGkPZsPVocdMCeHZkUkYR7FMJbBsg35aMBFvnqONNvcPEuOky+c
	 IBcZX+v+isE2A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4WjU-00000002FHJ-40Fa;
	Tue, 15 Apr 2025 11:13:08 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] scripts:kdoc_files.py: use glob for export_file seek
Date: Tue, 15 Apr 2025 11:12:50 +0800
Message-ID: <21657afdd4f8effe0752a5ec258d74b8a4101f55.1744685912.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744685912.git.mchehab+huawei@kernel.org>
References: <cover.1744685912.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

As filenames are expanded using kernel-doc glob, just in case,
use it also when checking for exported symbols.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_files.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 2e51e5f3bb77..630aa5ca6460 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -250,6 +250,8 @@ class KernelFiles():
         if not filenames:
             filenames = sorted(self.results.keys())
 
+        glob = GlobSourceFiles(srctree=self.config.src_tree)
+
         for fname in filenames:
             function_table = set()
 
@@ -257,7 +259,7 @@ class KernelFiles():
                 if not export_file:
                     export_file = [fname]
 
-                for f in export_file:
+                for f in glob.parse_files(export_file, self.file_not_found_cb):
                     function_table |= self.export_table[f]
 
             if symbol:
-- 
2.49.0

