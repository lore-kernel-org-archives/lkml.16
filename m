Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ED12AF14
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743623862; cv=none; b=Jo4d8+QeB947L1eAQ1OciNFexjADOek5ef4JzYM+qf9RIu4h6SdW81Hk2KJJtp3SMf6y7XQ4MkzeAfQtYS8GaBpQpdBH76IjYZHeUamM/3C+RZ5OxcaaeVeyJszyml5wUHC6UXGQc/DpByVm4z9G/lCN3QsgqSUMYYXT6XAl9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743623862; c=relaxed/simple;
	bh=y3JVmLGpCtCfcuyraejjYQhoD8SSnVO/VvVoJaMKtDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NIo/nVMTptdoxN6YvXGN7fIEDywRskCK1cITQbAejwndzjQ61ougcfn65qrvOOeT/tg35jwBVqYkW6VVDB5etjCEAsw+vU+hclR1bDwOFFgaj8tcxG3nSwoPHwUtN/U/9yUYHZ3eigiXSBCCqxGUhIBNruGk39VpkZxvMJCb6Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q81R00as; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q81R00as"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE70C4CEDD;
	Wed,  2 Apr 2025 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743623862;
	bh=y3JVmLGpCtCfcuyraejjYQhoD8SSnVO/VvVoJaMKtDU=;
	h=Date:From:To:Cc:Subject:From;
	b=q81R00asJsrom0gEE/ufD7oWYMXFcxic65vcYEeTh3G/92xFh59O791dEYpTi/vvv
	 agQfUMtFWAfhm4pkK0sViKyOa6eYz92vaCFTAUZI3cGfoCpzn6vJnNotShALWUqSz/
	 3LPYL7wx/jTwrXMkWCtWZofbRy7XRY2a30DTD9h8=
Date: Wed, 2 Apr 2025 20:56:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc driver fixes for 6.15-rc1
Message-ID: <Z-2WXkaNHGqsvPNm@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc1-2

for you to fetch changes up to 2dc25093218f5d42391549de6fe45e1aa9325676:

  Merge tag 'counter-fixes-for-6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/counter into char-misc-linus (2025-03-14 08:50:49 +0100)

----------------------------------------------------------------
Char/Misc fixes for 6.15-rc1

Here are 2 counter that I realized I never sent to you for 6.14-final.
They have been in my for weeks, as well as linux-next, my fault for not
sending them earlier.  They are:
  - bugfix for stm32-lptimer-cnt counter driver
  - bugfix for microchip-tcb-capture counter driver

Again, these have been in linux-next for weeks with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Fabrice Gasnier (1):
      counter: stm32-lptimer-cnt: fix error handling when enabling

Greg Kroah-Hartman (1):
      Merge tag 'counter-fixes-for-6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/counter into char-misc-linus

William Breathitt Gray (1):
      counter: microchip-tcb-capture: Fix undefined counter channel state on probe

 drivers/counter/microchip-tcb-capture.c | 19 +++++++++++++++++++
 drivers/counter/stm32-lptimer-cnt.c     | 24 +++++++++++++++---------
 2 files changed, 34 insertions(+), 9 deletions(-)
