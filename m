Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A36C2F850
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750376250; cv=none; b=KqC0KjHu1t79szRIUg7ai8NhU20uq98hkVBmDWwdGyKN3yCFvmaIHk+e0wSVIoIwrZrhGh446E1souBhGunI2jCoEulQaHPxGo+cm/3kinBiXAbnIQudJVY5JsibSMGmeALwgMSK5tF2o+GrBB1tr0vGx/hQfOkTgRr7qa4/itc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750376250; c=relaxed/simple;
	bh=2B3FnV7iqmSX8w+I+jGLfnh85EqqFWd7fW8sPDuwA30=;
	h=Message-ID:From:To:Cc:Subject:Date; b=ELH90asqP+yod0k7p3FV6LPPhm3FRir7sNiDhNx+VtBNn1HHM0noKP8SdbiAIK3Ku2Ba8uXwgMgCrS2ENiMU8ZkmQWxlW98aH8XLYAdNdeJy2iC4vb+z2HvfUdYV0um8QPTZrVUsBKvmRjGP5qkKQYk49Wv47l/GTU+KSGCq/N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3jjX7J9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3jjX7J9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE21AC4CEEA;
	Thu, 19 Jun 2025 23:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750376250;
	bh=2B3FnV7iqmSX8w+I+jGLfnh85EqqFWd7fW8sPDuwA30=;
	h=From:To:Cc:Subject:Date:From;
	b=D3jjX7J9TG8obNmKDN+BpaWekYUjzTHajdJHTpnE+bED5sNXztqGwnQ+3Ub1ESSOe
	 2VoPmvM8txTTgTEDpwXnGa5O4oXXFTNq0B5mtlSme4FXeTSgkmBvaiMieIIDJGkVua
	 c+gTRL0kcf8Y+PPSF0T61OdWtFtGShZnowPtIkJ4v76gopcJm8VUtoMG/oihRVNXNB
	 xqPIrf95qP8AL/wQplZUs9MAeUBb+ujEsBTJqgAxPCwexygrZuAovtMGyIHB9xClEF
	 QhjehUn6U7r6vKgLyPqqPG6MYMubOfPRysgGtH+SWGllEpTYoWw5b+lGgTTT53zp6r
	 0tOlNXXEdB4aw==
Message-ID: <dad88a06b17b2b7e6c0146ab9292cb18.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v6.16-rc2
Date: Fri, 20 Jun 2025 00:37:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc2

for you to fetch changes up to 8acfb165a492251a08a22a4fa6497a131e8c2609:

  regulator: fan53555: add enable_time support and soft-start times (2025-06-16 13:26:23 +0100)

----------------------------------------------------------------
regulator: Fix for v6.16

One patch here from Heiko which fixes stability issues on some Rockchip
platforms by implementing soft start support and providing startup time
information for their regulators.

----------------------------------------------------------------
Heiko Stuebner (1):
      regulator: fan53555: add enable_time support and soft-start times

 drivers/regulator/fan53555.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
