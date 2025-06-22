Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF618DB24;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572172; cv=none; b=VahG2xuAOy8eqfkj1eiYslbzXqZWRBr6ZwNYvBjkhJ7XK8rw9SF4o7LK38BPf4pu77yZq1ZrBqnV+T8Errdhlhjn4ViTX4DYTQdVZsAjCEF9SdKBSJT8/pEZBgfuCuwdzskCbkVdXh4bjQpYnEbu7wzxzSe6FwEUwEX8BYgRWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572172; c=relaxed/simple;
	bh=xKHdi1MzGV/x00/8kd5tjimHShTBiCS8QJzsV6mUa0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hDb2+C9VxqrJxMS4Ri/xwHjPl0eCGRkbnxen/t3QQDpg+6C6nFZZDDnuoM69TFpUjLWAZjKykSUh7Pqu0Al4T0t0WsKWcs6pM0EQqPsswI/bT/B3s22IAHsiUmSn1P0mryVi10Op5R8951MCC0JYcFIjNqaGh6fWVQBuOHOgoZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUgC2q06; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUgC2q06"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4792EC4CEF8;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=xKHdi1MzGV/x00/8kd5tjimHShTBiCS8QJzsV6mUa0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hUgC2q06W3kAb8jjG2HN3me0Fz6uDl2l/9Eqmp7m7WmjaYQyOqITJ5n7o6zEN6MCh
	 Admu6iW5i/o25jZHQ3YBGqcM9ZgbE2IyL2rziLDwO8xGiQHxOJHFRdkDlga00RyUiq
	 OqV1wtboAn8eRSots4Emuml32KP0i0N3/93y9TBCdUVb9GQyp+k9eWbDsOJ9TAKxvu
	 goBWjdrZtjpHiWerFcjjBDM4Vb+ilts61onkrh5JVo7fxkQ6ugCPjD6HC//gezUkl+
	 xfypyhIx8IH+nYrO5WQ7DbJLGP+odcnieU2pQlRLYRBDEaq72ehwuRJ4cGRoylVtMw
	 K98Vxz1zrX2vA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o2e-2GsQ;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/15] scripts: sphinx-pre-install: properly handle SPHINXBUILD
Date: Sun, 22 Jun 2025 08:02:39 +0200
Message-ID: <b0217df871a5e563646d386327bdd7a393c58ac2.1750571906.git.mchehab+huawei@kernel.org>
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

