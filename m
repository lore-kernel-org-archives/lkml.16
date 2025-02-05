Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834B1193436;
	Wed,  5 Feb 2025 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774368; cv=none; b=bXjo7bGWcgQgYKGvzwauHEsjcghCN3epnTdEbUqSywC2cqUZDmYSI8a7HDLU6M8+Ca+bSR8O+NM1Z6kDtSOwWJa67sUu2fkzewEYBMUwL2Cz6z6T2pJPlr26S8WDXdh5a/ZB+3mNN1vMq/4Dib84zuohZGuO3JIUEYwzLld8v+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774368; c=relaxed/simple;
	bh=J0qwZQAz7xoDo5KlLLTXV/sQxYN5hZMtizxYz5Vxtg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBbdHpktXokhDnCRUF8XVqKS2WHGVJSIXUsdK6z3VmrYAq85flvuNiK5g28ALdBqM01OXBJ8T1pOMdYvZxQZWHR81S45B6Jf4HVElvmQWwG+58eKm1txhqu8ziFizA2QI8gg+zyPTubECfXTCsz61Tn7QvbPGbBpOZXTP4K/UQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3HIvoLr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3HIvoLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B472C4CED1;
	Wed,  5 Feb 2025 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738774367;
	bh=J0qwZQAz7xoDo5KlLLTXV/sQxYN5hZMtizxYz5Vxtg4=;
	h=From:To:Cc:Subject:Date:From;
	b=u3HIvoLr8X1qacSQSz0g2RArl/tCjD8/6LjZO/m/0AzZKJ7kq97S5XU4K9VESJaaw
	 kLXJoByca+qq/RHX6w6/FT5f7ZOSgUQuhk56QWp3PLJYKW/PJFLc43P0bLpEjlqYVK
	 F/7p6o5Fxy9yIdtQGM1MCu7XIL6q3v6gYYaLzTiJJKR0qXTeyU9YNQFqNlN9LX1vHn
	 xWP73B5XzxcTcP3tsevNQ2tIoPpskoZh15yi4Z08Um/DCO0UEPrIc9wdhjlpn/1FbV
	 YIl2bDnd7JejD2dQ/J8R/CX9Vb9/8MM7AVf6t7SUqXttDZCJfvyM4YVS0S0pfwTK0T
	 rzMCSx3VTwwHA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: dapm: unexport snd_soc_dapm_init()
Date: Thu,  6 Feb 2025 01:52:16 +0900
Message-ID: <20250205165226.3466137-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The symbol provider (sound/soc/soc-dapm.c) and the symbol consumer
(sound/soc/soc-core.c) belong to the same module, snd-soc-core.ko.

There is no need to export it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 sound/soc/soc-dapm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b5116b700d73..3fa53ce80189 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4865,7 +4865,6 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 	/* see for_each_card_dapms */
 	list_add(&dapm->list, &card->dapm_list);
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_init);
 
 static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
 {
-- 
2.43.0

