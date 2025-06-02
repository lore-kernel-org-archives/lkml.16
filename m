Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483301C3039
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879172; cv=none; b=oyvpLqbb3qtTG1pB7pKd3TGzqOKCYLc5e6jCcZfKR82LKsJG+aByhKhVEMJVUB6ooGOss73LGmcqMqMHxmzUKTUe3k6FWTHkXXWNgylHscwTwX/2nTGA9xc1fSDyQybFD34WAhvSvDc08gTIIaeOPjtGD6YjUWbtuxwsDTqku8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879172; c=relaxed/simple;
	bh=ZcEwmbm2ErgIbM11h7Z3Pgoa9qezYaFpTtZvnHygmUI=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=B72BneZRsYm1YZxqKJKs9QkFB89Dl9Ju/YCSTxfFVUHmkb96Yb3RWQTwCVc5xS2ghZ9e6Ugkm5bs4QYnW9rhsMTvvrME570QobF4ea5oVeMHQks4WopYfIxBZFk9rQiPvUZKqKbnBSYigpJZfgklUZVprbdxSOTMDTFfiojUxDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELzDGqbF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELzDGqbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585BCC4CEEB;
	Mon,  2 Jun 2025 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748879171;
	bh=ZcEwmbm2ErgIbM11h7Z3Pgoa9qezYaFpTtZvnHygmUI=;
	h=Date:From:To:Cc:Subject:From;
	b=ELzDGqbFrlqXt1Dcvsvf2w2IJ2/2DzN+drhfq7Uk0YrfgB3nV8i89NHk7njigOJtv
	 jRmzoWkno3az3lJ4b8b8z7oiriWZJ8uiHGafhtRZOuQW//NuMBU3ncnC3+GL2b6GId
	 comPxHX8MsMPexPD3nbv5doYu/CBGSpFMdOeAkBQ8XFvxcaLNsX1ra8SdIY6EtdxG6
	 X50ExcD/U6F1vLoaQqCCpXEeuP4y2/dRY9LVZ27GDftGOvbaGFu8fG8seyDH/znAy+
	 ycVSv5Ns/gAxAbsL002zNw0HUIoEjKmRsAOxPA1M+uXj/4z6Di3sbIcTFD5azzqg+n
	 C0lt9eC6jTLLw==
Date: Tue, 3 Jun 2025 00:46:07 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Masney <bmasney@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] bootconfig: Update for v6.15
Message-Id: <20250603004607.91f48cc8ec27e09e24c993c7@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Bootconfig updates for v6.15:

 - Allow overriding CFLAGS for tools/bootconfig
 - Allow overriding LDFLAGS for tools/bootconfig
   Both allow overriding build flags for tools/bootconfig, for
   example making it a static binary.


Please pull the latest bootconfig-v6.16 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
bootconfig-v6.16

Tag SHA1: 0e48955b14e75b5f0c386b2ef4bab92274c522a1
Head SHA1: d81bab116b485643a08f2147165cc257b3734188


Brian Masney (2):
      tools/bootconfig: allow overriding CFLAGS assignment
      tools/bootconfig: specify LDFLAGS as an argument to CC

----
 tools/bootconfig/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---------------------------
diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 566c3e0ee561..90eb47c9d8de 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -10,7 +10,7 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
 LIBSRC = $(srctree)/lib/bootconfig.c $(srctree)/include/linux/bootconfig.h
-CFLAGS = -Wall -g -I$(CURDIR)/include
+override CFLAGS += -Wall -g -I$(CURDIR)/include
 
 ALL_TARGETS := bootconfig
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
@@ -18,7 +18,7 @@ ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 all: $(ALL_PROGRAMS) test
 
 $(OUTPUT)bootconfig: main.c include/linux/bootconfig.h $(LIBSRC)
-	$(CC) $(filter %.c,$^) $(CFLAGS) -o $@
+	$(CC) $(filter %.c,$^) $(CFLAGS) $(LDFLAGS) -o $@
 
 test: $(ALL_PROGRAMS) test-bootconfig.sh
 	./test-bootconfig.sh $(OUTPUT)

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
