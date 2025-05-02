Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE55C22A7E6;
	Fri,  2 May 2025 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746229946; cv=none; b=TKMNSuZV1+TH0IXqqi3j4+rl2qc9VV0fl5Jes+bK5XWP036DoVKvKfhkoKaq/87xz/xw7ro8el53HSGhLXreMpSDkyVO9mZF5mBo/QDBfUMk3j64GyjKlKImgraCP3UZr+FH7miNCKlNUUyuYbyycguNExld0mTNiMuqglTOFQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746229946; c=relaxed/simple;
	bh=eZOEOSxxQULxVWpJDomE/0+x0i5Lkm1zEXtAipVp/u0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+QVEdPHmeHfyZBKLnaknbWgQfa+ETCrfH6MP6266n3jnCL5Mqa+lZ+2qOtYgs59e9WXITxYqbQxkVUcKkkLhEr2or4SoEUXj28XfGB4wZtRFwcnvM48fdRmGXhhdI7nhkLI7RGdoEgAyQuCljo4w30sNm5oWHXVayNUMIlL3d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=m7Wv+Fpm; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="m7Wv+Fpm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=va9IsHqET1A3s7aZ7ErF0kOk849czvIJ2Q+KaxA0rGM=; b=m7Wv+Fpm1iGaTO6M
	q1HY9w1Dsd5PZEH+KpqqJySRcL8+1DDfckFh5hRr0FCusK7cpNBlbV/+AqSuiFmntmXd3NiNewoaO
	Dz5ef4fog8IsJyQ0iTvRwXQyE3eEGJEuKFDZ5s6c9P1anGANr4Zx140Cb8Wx0TbdJwZ0hafvkSI0G
	U8p4C/OYCT7KT4eE8nS64lnV6MH/LFsv8HluFbhjvDyMk4toQfsuVG8Qv81yYNquk/Veo+8qTCP5j
	wsO9K/r6ZQx0cqUaoftvZxEHQUTRtlNRFnCx6pnk5NEhRRXxsEpyvVnaOJAbFjaN0bB0Qi++3WB62
	SsFb8YDVczFLULTicg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uB0B2-001BML-1U;
	Fri, 02 May 2025 23:52:20 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/5] ALSA: core: removing unused functions
Date: Sat,  3 May 2025 00:52:14 +0100
Message-ID: <20250502235219.1000429-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  This is a small set of deadcode removal from sound/core;
they're all full function removal rather than changing the
code inside functions.

Dave

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (5):
  ALSA: pcm: Remove unused snd_pcm_rate_range_to_bits
  ALSA: pcm: Remove unused snd_dmaengine_pcm_open_request_chan
  ALSA: seq: Remove unused snd_seq_queue_client_leave_cells
  ALSA: core: Remove unused snd_device_get_state
  ALSA: core: Remove unused snd_jack_set_parent

 include/sound/core.h          |  1 -
 include/sound/dmaengine_pcm.h |  2 --
 include/sound/jack.h          |  6 ------
 include/sound/pcm.h           |  2 --
 sound/core/device.c           | 23 -----------------------
 sound/core/jack.c             | 19 -------------------
 sound/core/pcm_dmaengine.c    | 21 ---------------------
 sound/core/pcm_misc.c         | 30 ------------------------------
 sound/core/seq/seq_queue.c    | 16 ----------------
 sound/core/seq/seq_queue.h    |  1 -
 10 files changed, 121 deletions(-)

-- 
2.49.0

