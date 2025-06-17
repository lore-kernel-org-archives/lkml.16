Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D18C1DE4F3;
	Tue, 17 Jun 2025 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147352; cv=none; b=qKDPHMbfZOoj0Ot55ZlVLx5fP7pJe7DCdQNN3xWZ70JXX2HjdMNhVJxOKtBMhRCBSnLcbzWKpAWXpisKKVY3Ki2Z8dVDK0NovjCMEIB6TwzNmeSw1eGsTKwDec6/SPLC+Likt1aXCJahaD0MeQILZMBYffrBHVNaapyzAHh6I/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147352; c=relaxed/simple;
	bh=6g0yIQ00wX1zZxlyQNwgV3b8raB+qC4qKfp/RiMpLqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUsiMr7nJl1LH+V3wqTmh0ADOQGofLS1mwFEuK8/oAPUHcV/+xQa+0dCj7gZtj1d55OpAQcKByqJoaU7EbmzDMlduW0g4gAoNBlxXRA/acgDrF6Lf7FYBJYjwGSUrQ7Sy+PwFVhcbahlNJucsEANmrT9rFcuUX5/YZi/aJiiosg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdAUzRNd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdAUzRNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1681C4CEED;
	Tue, 17 Jun 2025 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750147351;
	bh=6g0yIQ00wX1zZxlyQNwgV3b8raB+qC4qKfp/RiMpLqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pdAUzRNdl/kLKTWq7AnH7OOdYVyT2kZ7KH8WACyDVeOiWFZC0dMl1jyUJado4NNFB
	 kEcq1ZoqTy8fbGPQHkdSNfxGY99Dqer2p5/N3/6pgqCYleiveXwUomW5KmeviBWDzS
	 GGYRfsPwA/q5W5TwTWwl0DJsuqLrZr5S0joPJmFvYrtKrsCS99do3WWGSUyvfDZ5la
	 Mun/k/49kz7iR1BGuPpHJ0aNrZNmCy42jOg4AefCVkBaLrOFcKjMTwb2E7NTXuL7fB
	 WgEO06RVyuAth4TSeaSo/hg5tvp2eMHhnDilkHvj2JvOM3vL05TEAH+ksyXPG5KmJp
	 B1I7gLkCX0g4Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uRRH3-00000001vcu-3qqN;
	Tue, 17 Jun 2025 10:02:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Breno Leitao" <leitao@debian.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Donald Hunter" <donald.hunter@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Ignacio Encinas Rubio" <ignacio@iencinas.com>,
	"Jan Stancek" <jstancek@redhat.com>,
	"Marco Elver" <elver@google.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Ruben Wauters" <rubenru09@aol.com>,
	"Shuah Khan" <skhan@linuxfoundation.org>,
	joel@joelfernandes.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev,
	netdev@vger.kernel.org,
	peterz@infradead.org,
	stern@rowland.harvard.edu
Subject: [PATCH v5 02/15] docs: Makefile: disable check rules on make cleandocs
Date: Tue, 17 Jun 2025 10:01:59 +0200
Message-ID: <e19b84bb513ab2e8ed0b465d9cf047a7daea2313.1750146719.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750146719.git.mchehab+huawei@kernel.org>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

It doesn't make sense to check for missing ABI and documents
when cleaning the tree.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index d30d66ddf1ad..b98477df5ddf 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -5,6 +5,7 @@
 # for cleaning
 subdir- := devicetree/bindings
 
+ifneq ($(MAKECMDGOALS),cleandocs)
 # Check for broken documentation file references
 ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
 $(shell $(srctree)/scripts/documentation-file-ref-check --warn)
@@ -14,6 +15,7 @@ endif
 ifeq ($(CONFIG_WARN_ABI_ERRORS),y)
 $(shell $(srctree)/scripts/get_abi.py --dir $(srctree)/Documentation/ABI validate)
 endif
+endif
 
 # You can set these variables from the command line.
 SPHINXBUILD   = sphinx-build
-- 
2.49.0

