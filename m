Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90DC2309BD;
	Fri, 25 Apr 2025 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565238; cv=none; b=V4+d2uQH5DzeZmte/1Jepu4s7eTSk9OaUr5RH7zNU5m86XAOBbqugaHFrzwkuGg34SNlNp9xDjulSYznxQN/blr8va3yv+gTQ+FljGdsOh7UjDEtUWIUmY46Ic2yOGguXPBvTpSLucwYlHNrW7PIl+OvJGR+BTgf7/SAyPcTUJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565238; c=relaxed/simple;
	bh=e73mxh6g7pPdU5IQV9QrUPN4paBARSHM/bPj/DASL0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmQBO58JDNx0g4nGScgbxyp5ret1PB4Ab7R2Rw2Pz7wZ7VgxlxXeRB+JXX+4aFsHcyQbsOk3nQqc5ConN5bbIA1oBmIq0q+cUI6a2yMuhOQlsKhUWJXXYBRMHb7a2TBd9iDvniY7n1FGOZeoUpOo4jHK8ilNkkK43gHnOlrr3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpWHiEUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpWHiEUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3B7C4CEEA;
	Fri, 25 Apr 2025 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745565238;
	bh=e73mxh6g7pPdU5IQV9QrUPN4paBARSHM/bPj/DASL0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpWHiEUk5utvkts/u/WFDpHgdtPTxLZb+Y85bT3vkUeOa8vYzDcxw3O4jw8TYkZcM
	 PLtUu6WBRbhlqLfzV6vALgbVmJ+5d6WWUOW32UZzBjEFaO38wouR4h2hPk/qKXJF95
	 EPArfiQOrsW7R3MrLZue1sFo+rNzJuhea4lcta5wwhQ6ApTHLUkHQqq4SMAk2d8fxJ
	 E+bX6Bm03NHdMYUCg+cJZL/ZTeWBBix4l6UlqrTkcbIeu2grPw5ej3oEFJ3aGmQvfu
	 F2Mpcc9/kn08rMhOzT+tREFBqGjoPk1b2jLYQvuOmVDqmSDOw9Ev+vBG7Vybs1L6iQ
	 cidAzDPxIcaeA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u8DFw-00000000TG3-05Ht;
	Fri, 25 Apr 2025 15:13:52 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] scripts/lib/kdoc: change mode to 0644
Date: Fri, 25 Apr 2025 15:13:39 +0800
Message-ID: <be0b0a5bde82fa09027a5083f8202f150581eb4e.1745564565.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745564565.git.mchehab+huawei@kernel.org>
References: <cover.1745564565.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The script library here contain just classes. Remove execution
permission.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_output.py | 0
 scripts/lib/kdoc/kdoc_parser.py | 0
 scripts/lib/kdoc/kdoc_re.py     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 scripts/lib/kdoc/kdoc_output.py
 mode change 100755 => 100644 scripts/lib/kdoc/kdoc_parser.py
 mode change 100755 => 100644 scripts/lib/kdoc/kdoc_re.py

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
old mode 100755
new mode 100644
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
old mode 100755
new mode 100644
diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
old mode 100755
new mode 100644
-- 
2.49.0

