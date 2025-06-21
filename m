Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64EC26A0E3;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=tiWUUMWJ6qfMjKNlrsbD76pgL6iSqWcIvQs6VYvgyaocAlDILOpybR5DW/ooiHHsIWNQA1qIURa084Ah1SLbYZFARtC85hPHlIeWB2C7+Cbb085ivd3bE8rztnctfELm2KoAqYfjhSlhz1Fr9hiO0i5+KVpu5+WrUyYxen/vhEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=xKHdi1MzGV/x00/8kd5tjimHShTBiCS8QJzsV6mUa0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqRN1KXQd+DIjA4Pdvh3IRbrIq9J8gG2rUk7bHCtoIdnLnlggqM4c3GKQB0oDRZE2eODbDu8ljC8d+/B+5W8xauRJaUChrjTdVchQKmOaXEgw98wjukslQKkuIdTY1QeXNuGxCmF6qyEDEhz1r3ilmDnC/KkoVQxXOFG6RtAJE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RV35sHqH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RV35sHqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5D7C4CEF0;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=xKHdi1MzGV/x00/8kd5tjimHShTBiCS8QJzsV6mUa0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RV35sHqH6ola1xIUhnjFLvaDe7ZSJixw5XXymGgFldOSccq1B8pnA0h+VCGeyKg0N
	 NwUoWDD7svR4FhcOcmOIIPfkyOh8qHoAPtQawVfxWANvn85IohKh8quZyV+F8aVo3G
	 vB4uw4r3UpnvOK6uK9LUQzNbMZ0SkmkLBwo5NT/NGHfiahOy31xJyIvvk6SUsdHTYp
	 QB3VlBh5WnusXi4pekzMn/iIt4LQT+35SznRkwO7bFipVEPqUGQq/c5/7qzpWxhM5N
	 57CSHe8QgTva0TezM91ouBYEvRJD+CeOPvoejyeGpm6P6UnU0fAye0E7sL6Z8UWOn4
	 jaUpLTxAXh7Dw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e4C-3NTX;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/15] scripts: sphinx-pre-install: properly handle SPHINXBUILD
Date: Sat, 21 Jun 2025 21:55:49 +0200
Message-ID: <907016315b18e17b113670f2ea81a927c22dcb80.1750535171.git.mchehab+huawei@kernel.org>
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

Currently, the script ignores SPHINXBUILD, making it useless.
As we're about to use on another script, fix support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index ad9945ccb0cf..2a311ed00179 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -245,6 +245,10 @@ sub check_missing_tex($)
 
 sub get_sphinx_fname()
 {
+	if ($ENV{'SPHINXBUILD'}) {
+	    return $ENV{'SPHINXBUILD'};
+	}
+
 	my $fname = "sphinx-build";
 	return $fname if findprog($fname);
 
-- 
2.49.0

