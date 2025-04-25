Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B6822E415;
	Fri, 25 Apr 2025 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565238; cv=none; b=WrevAv1g354EU4Rr5cOQn0xnGJ5A4CKvT5jCEuNI1mha+RKvKddB+sCVu+bpNCxOuQkFK6JIPxCZrgPfnWxK6Uw+XV+gZoCPpBHU/NbRemKYdbten716z+RKULfrpJUEqbf0rt9wzle1oky3UnwK9VEzA+M6ZJRgCDmeW/p5PKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565238; c=relaxed/simple;
	bh=hE2LTNl6/i9rVKhkGSJYeeQV/bDrqESmfqg01MQICJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uDib4YZ5g/ozIFO2pXa+F/lLmFow6Wdo0H6OME990fVCTVDaatZbiG8x2E2DBkesboLATHLlej9+yMOFyGf7chhgJPNrtwk1JmBJiou8ocFDZxCVhJ65uqwtbF9n0i5hRv4hxpNXgD/v4svie4jHWLl02ChHHvAsVuFReZJutKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKQZSAGb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKQZSAGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE68EC4CEE4;
	Fri, 25 Apr 2025 07:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745565237;
	bh=hE2LTNl6/i9rVKhkGSJYeeQV/bDrqESmfqg01MQICJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=AKQZSAGb2uSYghmCImaLgqH/Bm9jZMGQLaKeN3aKl5319c9nVqoY/zrUldjUjnGkP
	 GY19ptYj4D5rIOOkh5T+stoWHKgpjC9ug9urWlgZifiZGmM/rtVQVeMChtxBCn4TRp
	 Ly1UnOBY4r/kibIy6rJk3jV9cnl1HTixoT07OSYHhvtsfEjhlXO+WOtS08R3Nidlgo
	 yY/Elayaky2B+K5nFj0TwH/UyDfEUV0jCASpQH4WDyZ6RJeBIQDBF5k40zsX6SMUOP
	 mPBtNGJsK6X0vo2MDYnt34aiLU4fQ8N0gEqpRsVL0pyLP4s1EwarPmesr1eVfnlD4D
	 bLTG1TcZi35mQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u8DFv-00000000TFx-3ppw;
	Fri, 25 Apr 2025 15:13:51 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Some small improvements for kernel-doc generation
Date: Fri, 25 Apr 2025 15:13:37 +0800
Message-ID: <cover.1745564565.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Hi Jon,

This series contain 3 patches for kernel-doc:

Patch 1 creates a kernel doc class at the beginning of kerneldoc Sphinx
module and preserves it. With that, some caching is enabled;
Patch 2 fixes some permissions;
Patch 3 is mostly a cleanup patch to simplify a little bit the complex parser.

On my tests here, it runs about 10 seconds faster on my machine
and I didn't notice any regressions.

I guess there are still space to optimize the cache, but I don't want to
do too much optimization on a single series.

Please also notice that I didn't check the amount of memory that it is
now consumed storing the entire kernel-doc data on a dictionary.
I assume it is not that much, as I can still compile docs on my 16GB
laptop.

Mauro Carvalho Chehab (3):
  docs: Sphinx: kerneldoc: only initialize kernel-doc classes once
  scripts/lib/kdoc: change mode to 0644
  scripts/lib/kdoc/kdoc_parser.py: move kernel entry to a class

 Documentation/sphinx/kerneldoc.py |  23 ++-
 scripts/lib/kdoc/kdoc_output.py   |   0
 scripts/lib/kdoc/kdoc_parser.py   | 277 ++++++++++++++++--------------
 scripts/lib/kdoc/kdoc_re.py       |   0
 4 files changed, 162 insertions(+), 138 deletions(-)
 mode change 100755 => 100644 scripts/lib/kdoc/kdoc_output.py
 mode change 100755 => 100644 scripts/lib/kdoc/kdoc_parser.py
 mode change 100755 => 100644 scripts/lib/kdoc/kdoc_re.py

-- 
2.49.0


