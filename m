Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DEE158DD4;
	Sat, 24 May 2025 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081098; cv=none; b=qBzoN1gSBeU/JWCv7WK5FRSRj6q5kH3pE836nvvtS1omqkTvJb9fuVC1lM/0d7zSUHxTXsrnETje2wSrrH3lG15uYEQEJ+GfHZxIzcLC4iX9k1TYtDoyO6JS7TzVr7haMzdrkMbP6bi4godQfjBrNxBH+K10tckKz5H2CnZiwok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081098; c=relaxed/simple;
	bh=fxMnjZiNwhDbwnOGD8pLjX1z1xVnNDl1UnyCm9rdHOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXvDGaqrWb7lzmgXvgxUZ93HS0CNyZfe3RXIyb4Sw/a801QYAcuNbgPyYm+11P24xfkBRXSQQi87k1mpuHN6m2lbBqpU/A7cz+feHkxViBrIPdrGHj8oBFlNQZD3M2EraBrREEQ8uHLetl//247a4IxjCxTVqvUJrRVRwDnSrME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=KXboK10M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=em3n7pT1; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="KXboK10M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="em3n7pT1"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 647101140117;
	Sat, 24 May 2025 06:04:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 24 May 2025 06:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1748081094; x=1748167494; bh=OUnV5SMtE8saeflhpyRbB
	3o2H/2nDtLfE+Juhhf1BM8=; b=KXboK10MeZtrNEwt197MsNZeVM1YY1zn8jOuN
	C51z521N6Qg8M9YKJf2TE6efzdugzghI0P8U2rpKPfoN4zmT1PNyYi4saPLp+MM9
	rTxpzQu3B+pT5f0Pnzca3zL/50Dbj5mmLYDm5pU59J9y7EQxFS4+C66pkC1k+5Ym
	rw2jU3h7cgrowOOw3Zk9Dmlu+cUzoSP6AOeczwcgNtPqjDid7rfZToZUZOpBvY+7
	5k5xEi5Hstj3U0WMAHVzuDf4LCs0UZdFaQf4AnJrPsjwqPB09JLYXW/1lB7vX0BX
	nMeICi098woQAa1POOxEpf3Wrv79ejEsoatAQVhk2h0Ilr3/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1748081094; x=1748167494; bh=OUnV5SMtE8saeflhpyRbB3o2H/2nDtLfE+J
	uhhf1BM8=; b=em3n7pT1fqi1qpN9OUW8J2jLOenXzMsPYd6CSPCr4q4ke+YO3qw
	l5qN2IGeklzlJci12ckFwYNLFG0jXCP2C/sOUJm0XOb/mKc3qgmRfqzu4XeImeqC
	z66zu3HsUQ9rRblb5POpuDGsoIceZQuQ4mQ0LIWo+1yPogWhZSz23RhWzpw+jX1L
	BmyxU8exgZPuECZYn+S+aTntgGginbulwm2Jxf5jMDgrz3dRjF6PBA379MM7IJXR
	k8MwZEIcV8lcQrB5iUDVnkthuMFm6CfV5SOea4e00fFOwW6VvMigX8sBCuSkC95Z
	9LWZQJ3/lCHx7O8Gn7E2jgQ+z3KuAJVwqIw==
X-ME-Sender: <xms:xZkxaBWBcK5ilqi3P7PsRqmklniewulNwAkFJOY_mGlvg5bIifRDDQ>
    <xme:xZkxaBnwMdd_chJG9-uhPkAGyJFdiFB4pj2Gt3Sq2KwDpsQtD7CkSbj0E1x-FuX7c
    SLDY6cEeAPmad9Py7U>
X-ME-Received: <xmr:xZkxaNYIZnqM_o7rHD-0jqEH8JtnC3YAw49EmJb3urg_2GHZmpYigYbC1KqCR1Hvqa3jEIoKDbM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduudeggeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepnfhu
    khgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvg
    hrnhepiefhfeeuueeigffgtdefgeetgedufeefkeektdevudefhedtgfehkeejveejtdff
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehl
    uhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghm
    ugdrtghomhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuh
    igrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:xZkxaEVzjccCD7FcMsJ2SiVqnjGaz7Xl_pJ9zCMyqqVgdRjKQXFCMQ>
    <xmx:xZkxaLnWqWIWhw0TntvfaEeVPhK2edMC83e94pOMX7PzZKuS-gFP1w>
    <xmx:xZkxaBc_rXqjVyXAatGswQQK3rq6OE0tfog3A9mGlPt3mDemJAxtpA>
    <xmx:xZkxaFEYRHBtD9MaY0CL28YHuY1AbgBzfPEJhsUTi1vAshuS9IH6Ag>
    <xmx:xpkxaPFzGgcjFL5TwHEBauGv6PwDLsPM1on7BkNvFgf8iK_IE3o8mLfU>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 May 2025 06:04:52 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	andriy.shevchenko@linux.intel.com,
	Luke Jones <luke@ljones.dev>
Subject: [PATCH v2 0/1] platform/x86: asus-wmi: fix build without CONFIG_SUSPEND
Date: Sat, 24 May 2025 12:04:43 +0200
Message-ID: <20250524100444.34370-1-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes "platform/x86: asus-wmi: Refactor Ally suspend/resume".

Verified using the following details provided by test robot:

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   83579675331059689e2869bf752ca9e17fadbd82
commit: feea7bd6b02d43a794e3f065650d89cf8d8e8e59 [74/89] platform/x86: asus-wmi: Refactor Ally suspend/resume
config: x86_64-buildonly-randconfig-004-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/reproduce)

I've not done anything fancy here and left asus_hotk_prepare() as is, as it is *incredibly* unlikely anyone would ever run a ROG Ally without suspend enabled.

Changelog:
- V1:
  - Move functions and struct together to be under one ifdef block
  - Use wrapper functions for s2idle registration

Luke Jones (1):
  platform/x86: asus-wmi: fix build without CONFIG_SUSPEND

 drivers/platform/x86/asus-wmi.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

-- 
2.49.0

