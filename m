Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106891A3172
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779400; cv=none; b=tV+LnuvK+UU0EW9k2odoDn61bSwZ7SoO0CHthqBoJWMRXDtbVrrFi8dDHFdHzc9BT69x6FTzZNVseT5gGU89g/9ldVhG/p1JD6RCLLTX9Y6w+7S6O/ySVeqM3z9f0Abusc/8mUOBn6MUkbwiP5plZ5tTv6hNum6CdVLUWRDOQ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779400; c=relaxed/simple;
	bh=oKLbeOTFd8BHwF7Nezk8vluZK3LVk21rmvApN9Aeu7c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=gJyzkG4rKH3x+MePZ7zeNemF0Vt1ku5zQUQp4cHoExY2WEcYy6UMCrk2hRnGLtrZr8Vf0EqVUwo+i1H0JbTdnrHggYurjQrfsbeFUoG6y6Gji0gNNPSZBWygWQbmquxgw/2zazrUh/Q1QYEVbLm1QyvmCn/b5baYyPTEpf2l3zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BFcPvZNM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RY3UsWRb; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BFcPvZNM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RY3UsWRb"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 0780B1140160;
	Fri,  4 Apr 2025 11:09:57 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Fri, 04 Apr 2025 11:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1743779396; x=1743865796; bh=0U
	N1zEQHh+3iAICbKR3Qfw/BEbHddaeGqLeTAPFJgLU=; b=BFcPvZNMxp2G07QEFC
	FtfCRHKf+y7LDSSgX+wqoiMVxUXkaLaRkdFb47Ukfi8p7xvPeKPy58b2e+NNiTe+
	Ag/exsVsBFEqP4MjS8AH6KqTlprvCJzecQtlMH8FGak7IpjI4xEezbdiKdOUOLe/
	rijhD7a12hlTpSY6Cx6L6FPRae+eJ2SLhBW0yC0Pvdb+Wb7pEL7YIwhBcP48D/CY
	3v2tnT46KknvqnCcjig+ofeZEdnWtSWkRTeGNJPb8hqaiJQu2unKeT5Lu+lg7JsF
	k5THmSjWw3vpB+iOKojLG38HX0mOe2MwWDfF2H/pJjX2uxM4pkILkZEJD6m3QoxS
	hQJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743779396; x=1743865796; bh=0UN1zEQHh+3iAICbKR3Qfw/BEbHd
	daeGqLeTAPFJgLU=; b=RY3UsWRb+2UHgffX4xV8KUskbOLVlIBBE6Zi/G0i5h4L
	CPdOkfqzBnhAcLlTK+EDb5yNJ9R/8vpdORrElVWVHjILQqq16p18Hba4wyWbz2EW
	7MrTseMQb5i2RH/60amsC6x5oGF4/wwBzeSZRnVugIQBo4MhM/H7XNrLK+AnJHbI
	qHS0RJ/tZlpQNQPBwgiRoSTrdgVm8777HUaSVycpkAkJUq7coUAI5onPwNcDIP9W
	tNM4UbGVzRhMDi6HvC3m+emo+mGdrcGg1NaE/zp9Slh2O9twOpVJLgyVQ7eUSGLD
	QJD7JiSSOtFigQaYCfceTDj6yxiFNRZgotF99/+W2w==
X-ME-Sender: <xms:RPbvZ2MvkEFU3wDt8I_5tJMnPUqqbN3E1xNgw6sUKnYRrPC1lLaqVA>
    <xme:RPbvZ087MUYdSuFHlB4jcRNttrnvZ3JQW5xiTRzVqT8svOMhBs85gf63mMMJyMEOK
    8-UdNrJo-20ShyE3jA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledujeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepudfgfeeuheelheehfeeigeeigeeiveevheelteel
    leeijeeikeekvddthfejieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhith
    hhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepkhgrsggvlheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrggu
    vggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtohepihhorghnrgdrtghiohhrnhgvihesnhigphdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RPbvZ9SSc0SvdTZwEYcJ1NaoSvJmt7rBZrYYbUcXv91eAFCFIMH96w>
    <xmx:RPbvZ2toc3OhQomFrsi6iWeeCwJNulPM-FUSyjVk37CluQhcQ81p-g>
    <xmx:RPbvZ-db2yB5F3Z44XPWC_YRW7PJ9kfrarFTNENa4A_8PmXfttoNnQ>
    <xmx:RPbvZ61H0p1E6P8uzNRolZOp8tDb-W4E7e4UFNZSlB_QU1OwfuG_PQ>
    <xmx:RPbvZ8utDE_4OumfRF9zjijdevK9Kgw_cCjKo0eSPjxRanvNK5GXru2E>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 60F592220074; Fri,  4 Apr 2025 11:09:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 04 Apr 2025 17:09:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Ioana Ciornei" <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Message-Id: <cfc8fd0d-9d32-432b-a5ba-1477265670e0@app.fastmail.com>
Subject: [GIT PULL] soc: drivers for 6.15, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-2

for you to fetch changes up to af34290cdc60a289e43f38a87621a3e9dd63c67b:

  Merge tag 'omap-for-v6.14/drivers-signed' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers-2 (2025-04-04 14:37:41 +0200)

----------------------------------------------------------------
soc: drivers for 6.15, part 2

This is the promised follow-up to the soc drivers branch, adding minor
updates to omap and freescale drivers.

Most notably, Ioana Ciornei takes over maintenance of the DPAA bus
driver used in some NXP (originally Freescale) chips.

----------------------------------------------------------------

I had a hard time deciding whether to include the platforms/cznic
driver changes in the pull request or not: The driver changes had
caused some build time regressions and I actually made fixes for
all of them but wasn't quite happy with them either.

In the end I decided to send out everything else but skip the
cznic driver since my fixes (finally sent today) hadn't been
part of linux-next or properly reviewed so far, and the merge
window is basically over. Sorry Marek, I should have been
more active in making sure they branch was in shape. Let's
make sure we get a new version into linux-next after the merge
window. I have uploaded the current version to
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=cznic/platform
and I think we should just rebase that and squash my three
fixups into the original commits.

Andreas Kemnade (1):
      Input: tsc2007 - accept standard properties

Arnd Bergmann (2):
      Merge tag 'soc_fsl-6.15-1' of https://github.com/chleroy/linux into soc/drivers-2
      Merge tag 'omap-for-v6.14/drivers-signed' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers-2

Dr. David Alan Gilbert (1):
      bus: fsl-mc: Remove deadcode

Ioana Ciornei (3):
      MAINTAINERS: add myself as maintainer for the fsl-mc bus
      MAINTAINERS: fix nonexistent dtbinding file name
      MAINTAINERS: add the linuppc-dev list to the fsl-mc bus entry

Jiri Slaby (SUSE) (1):
      irqdomain: soc: Switch to irq_find_mapping()

 MAINTAINERS                              |  6 +++---
 drivers/bus/fsl-mc/dpmcp.c               | 22 ----------------------
 drivers/bus/fsl-mc/fsl-mc-allocator.c    |  5 -----
 drivers/bus/fsl-mc/fsl-mc-private.h      |  6 ------
 drivers/bus/fsl-mc/mc-io.c               | 20 --------------------
 drivers/input/touchscreen/tsc2007.h      |  2 ++
 drivers/input/touchscreen/tsc2007_core.c |  5 ++---
 drivers/soc/fsl/qe/qe_ic.c               |  4 ++--
 include/linux/fsl/mc.h                   |  2 --
 9 files changed, 9 insertions(+), 63 deletions(-)
