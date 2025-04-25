Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C80521D5A6;
	Fri, 25 Apr 2025 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571330; cv=none; b=PE1HHBduG3lWDTBsXYMJTCLjU+E2K4tkHwTj4xTUVfi5FAC0IkoDYWGgGbYyGr1GYoNYNgTM3iI4CGc27Z23GUSarh9I73StjBIo4Wn81wqDFezHwA+Tt5Pq74TtwB5jbWujzkWJAdBr/9SBHzsDIgOpYAurqfMeG4FIUdZ9das=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571330; c=relaxed/simple;
	bh=2rHqo5iAjG0b/hNzovE1R8cm9rsn9pApt5tCHJ1LOPA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=BY/pSNNg0IoeFUuvTtk5Pv56DY3+IGMV15PXg1ECKQiQpDoXUbUsoCjI4BYWeYmeZ4ppivhHqKDRojUpP9gIa5qa/3c28BT8PS9lJ6IYyR41qbQ4T7gb/otzIftvfNr3okUvarKerc/FLL6P9KwF/wNTIBuQ9Gb1rYl1+JuUbRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=iGMDy2bN; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="iGMDy2bN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745571317; x=1746176117; i=markus.elfring@web.de;
	bh=2rHqo5iAjG0b/hNzovE1R8cm9rsn9pApt5tCHJ1LOPA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iGMDy2bN2m3KL0jkWCUdZDelp6CzZdbPTWPRzyQAbCZA4HYGz3D+BQ+Uo1qdv+CX
	 Mz7F0bp8QvcjDPS5L2L5285ZEXjL2tWMhNHf7IB9g+Y4VXuu5uVNmWiXp3Cqnf3XY
	 D6nwml0A5iyPrLemqV3JmxEcR08my2UW24vD07zjaU4ny+ax8x6ljebgghvGRZZy1
	 Ngq5+bY5Jsb2xMZHXnvWw/RnnNCrzn/w5U4/16PeTrYCKeyH6wJ2HEMlHRUKGAktp
	 Iv8XUKMqa7LrEamUKJfgDjPTT7GBCHRQcOY3//Tfs16T81S3Q3Rbb9VtR+hYP4gJq
	 MGYLoawV8ot3GYyW0g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.30]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MK52w-1uO6jT22xC-00Z2H8; Fri, 25
 Apr 2025 10:55:17 +0200
Message-ID: <6f4ee1e8-aa28-4d20-96bc-b2a7343ddbcc@web.de>
Date: Fri, 25 Apr 2025 10:55:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix NULL pointer deref on acp resume
 path
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eIdHnT89rCkS98IKHq2dzDYSrd2l7G7FiHWxoJLvaoiJJqUoU+V
 SFLBbfRsBieyYQYcTZbwgsMZndheHKhEkzFY3AWzYEWsGwDAdi6nY01fAHzR0MRic0Kh4Av
 M9UR8PhegAFlJzjAwRpQLWaQ479ze4HCWm9XH91gt5G7c9rf2s+cL6HpQ+wHYkHqCeRy/3A
 AUd+22rDyk5rmoO00udlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bmmKuV/3kyA=;N1Dc1Br7anU8H4uR3L6l0IjYBbo
 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
 8V1trREApySn7803S2skJc=

> update chip data using dev_get_drvdata(dev->parent) instead of
> dev_get_platdata(dev).
=E2=80=A6

* Would you get into the mood to replace the text =E2=80=9Cderef=E2=80=9D =
in the summary phrase?

* Can a cover letter usually be helpful for such a patch series?


Regards,
Markus
