Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F002A1A5BB7;
	Mon, 26 May 2025 04:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748234498; cv=none; b=Bp7AvJ5fZO5TMA3Si0jOGegnQhXBQkYnywdN4gnppCtieo+Xqm9yO8pc8bOcDBG0MCaqfyYJU1/62FWLrf361Z+XSUdTD8LMhpXojl3v1w2dlKByzIZpmuDBWfHXN/8uYGS9XTyN7eNDhIybd9h6x0DQO38pEVQIyP0eDoBtwP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748234498; c=relaxed/simple;
	bh=Y1XraJq9kE/HXXuiK/BxlucfeSWavk0dpOiPe49xlu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaQJWBs8vgGLoWrRn8pcuKPybBqGZQDNu50JIOANHZBEajmIGSHrtjKggrEHMgUH/5GnMqKAMSqH6S8uwPsYSnJyIEuWgsf+IxJ3dgbuRJZNZbiPlNlDN9M3whncCCv8C2n1lwz0UrNSm9kuTcFRHODs/ICPjvVkleL1AKHlCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hx5AEqT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hx5AEqT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFDCC4CEE7;
	Mon, 26 May 2025 04:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748234497;
	bh=Y1XraJq9kE/HXXuiK/BxlucfeSWavk0dpOiPe49xlu4=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=hx5AEqT/jRoHfdnN8vI2gJX2o5yo3/vcXNY9k5Hscc15BhYXJLbQsHZp2ViiWi3/F
	 J12G/RVJIkONTmTxpQ71AACBkh/NooeOjXS5pncPO7Kydl4bKwAHlNTWnnjG6fqzPP
	 190/MVibmkrGk7IIaTc/AL8w8jA1Gju8ex1IgBPMK8mZs4RSXFtxyy0Ec2fQ5ND6t9
	 JhE0FKKOXVkTqWpa4jfuicOv2SLAAFzlbrnOUSXReLX2KsD5QzrtNwZas7SC5vJGYD
	 k5y+W5jYPibxFiNiw4cQhD2nqX3X6vJjl7QnyHjCXflpUt7Wj4O3/8K9YhPmeL/ON/
	 0khvub9Ki0/Xg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EFF47CE0854; Sun, 25 May 2025 21:41:36 -0700 (PDT)
Date: Sun, 25 May 2025 21:41:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	kernel-team@meta.com, akiyks@gmail.com, urezki@gmail.com
Subject: [GIT PULL] LKMM changes for v6.16
Message-ID: <737fd7ca-57d8-47cc-b6d4-e3e701ffc733@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, Linus,

When the v6.16 merge window opens, please pull this LKMM update from:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/lkmm.2025.05.25a
  # HEAD: 5c9e0062989e5d2bd77b75c432b54e8ec7689bc7: tools/memory-model/Documentation: Fix SRCU section in explanation.txt (2025-04-23 12:17:04 -0700)

----------------------------------------------------------------
lkmm: Update documentation

Changes
-------

* Cross-references, typos, broken URLs (Akira Yokosawa)
* Clarify SRCU explanation (Uladzislau Rezki)

----------------------------------------------------------------
Akira Yokosawa (4):
      tools/memory-model: docs/README: Update introduction of locking.txt
      tools/memory-model: docs/simple.txt: Fix trivial typos
      tools/memory-model: docs/ordering: Fix trivial typos
      tools/memory-model: docs/references: Remove broken link to imgtec.com

Uladzislau Rezki (Sony) (1):
      tools/memory-model/Documentation: Fix SRCU section in explanation.txt

 tools/memory-model/Documentation/README          |  7 +++++--
 tools/memory-model/Documentation/explanation.txt |  2 +-
 tools/memory-model/Documentation/locking.txt     |  5 +++++
 tools/memory-model/Documentation/ordering.txt    | 22 +++++++++++-----------
 tools/memory-model/Documentation/recipes.txt     |  4 ++++
 tools/memory-model/Documentation/references.txt  |  3 +--
 tools/memory-model/Documentation/simple.txt      |  4 ++--
 7 files changed, 29 insertions(+), 18 deletions(-)
