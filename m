Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA5517B50F
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748164068; cv=none; b=pagOs8y8kyuRa+KNiF5EcJTA9oDbTVk2d377FxGPQajtwMv0T7SEEviOgrC/s1UDgheoHamv+594aQMSN8tFZOzsXMc1llPVGBO0B7OUB3VlvNk0ISdD4whTpqk2j+8FHl2TPCJe1VGS6Ph9vqIfZKQhzmlP5RkSZMpxyiHxZwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748164068; c=relaxed/simple;
	bh=POMmmRFrUmlLMNKS7Mh30KX4H2BGMaHfAENsIfkmQVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VuKonsZwC5bwKSTgs4DJH+Bd5RUH9AQqkYJoBMWF9Tyo92f/0GzzgrJRgg5qIA8CCRHcSCrCQa7Jbr7Hc6GgY2ZGiDd8j5pp3o4RsSwNzP3xWGw4yaIuI1e5V+uM4I10JUvraIOBtkHZ/4bT4JW+fBqpS5ymGKjMWok2b9SOz8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVQbHgoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVQbHgoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA90EC4CEEA;
	Sun, 25 May 2025 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748164067;
	bh=POMmmRFrUmlLMNKS7Mh30KX4H2BGMaHfAENsIfkmQVc=;
	h=Date:From:To:Cc:Subject:From;
	b=EVQbHgocei1FRWGkMlTESOflisIneCwrXr/RSHvbkVH9jvf4YJvn6+utrwglp526T
	 BqyVGGhDnTYfPqrIJR7uKIKOwKU30/+F/Xs8g+DadYyMYa2z32e3PKP2etRzrbPmPy
	 ou+MP5y4fBpttd7kni0KWVd+YaL/8i5igyS+feogIbomE3npgdZjDsWSl+ABk6iGon
	 zaoG3vS18T+dcxR/jsOUIW7y8DaSHrcRZrqFv8hz/CnLtWA2B3OwkeNGI8TEWZH2b9
	 tD+c6/cQhMnMwhJTDjKaYZFtZMcOJa5PjxETrHNEdJCmKZLDDa+ZeV+H7DF5ywwIzs
	 V2n6p25bKGglw==
Date: Sun, 25 May 2025 11:07:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] objtool changes for v6.16
Message-ID: <aDLd3_9ofvEyYXb7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest objtool/core Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-core-2025-05-25

   # HEAD: 4ed9d82bf5b21d65e2f18249eec89a6a84df8f23 objtool: Speed up SHT_GROUP reindexing

objtool changes for v6.15:

 - Speed up SHT_GROUP reindexing (Josh Poimboeuf)

 - Fix up st_info in COMDAT group section (Rong Xu)

 Thanks,

	Ingo

------------------>
Josh Poimboeuf (1):
      objtool: Speed up SHT_GROUP reindexing

Rong Xu (1):
      objtool: Fix up st_info in COMDAT group section


 tools/objtool/elf.c                 | 38 ++++++++++++++++++++++++++++++++++++-
 tools/objtool/include/objtool/elf.h |  1 +
 2 files changed, 38 insertions(+), 1 deletion(-)
