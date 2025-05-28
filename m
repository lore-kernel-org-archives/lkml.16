Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E3548EE;
	Wed, 28 May 2025 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439972; cv=none; b=SyK+3iLtBxRzS0l+K+LBCwWr6YxxTcDyAvXiLlqd4FcJiPl2+VQbdTCa/KyikHt7NlHigrSBzYtC+sAqSMb3cuGquqkMARkX3W893Ei+ENjDH0P7J42k14aXmbOMSyBwEBkaFZA/m4Z1eCA4SIouii1uAZ9fLvHKrT06x7yiP0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439972; c=relaxed/simple;
	bh=9QsVaD96h9TZ8yRguSQmceVk5sbKpRXUCWFq4YA94Uc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=c4nsfwiunfqzhRfqHRUTnpHaUT1t5FChEcOVNV5Fxz6PIcmPf3+Xv4ugUYCyEUkNiTh9p5Cfb523nx4BK7osMQZka8+TR7jNGzLqD1oB7a8PJHvPAKEzoNFULsDVKIvT7AxhVkept2+j1RcaNyeRq1J2JPzA9T5G6/rM4m5FpE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42762438DA;
	Wed, 28 May 2025 13:46:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1uKH6Z-001CgK-2G;
	Wed, 28 May 2025 15:46:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: Kevin Cernekee <cernekee@chromium.org>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-sound@vger.kernel.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: tas571x: add support for tas5753
References: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
	<20250528-asoc-tas5753-support-v1-1-a50c3f6734ee@openpixelsystems.org>
Date: Wed, 28 May 2025 15:46:03 +0200
In-Reply-To: <20250528-asoc-tas5753-support-v1-1-a50c3f6734ee@openpixelsystems.org>
	(Bram Vlerick's message of "Wed, 28 May 2025 14:10:08 +0200")
Message-ID: <87plfsx2zo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeegvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepkedvrddugeefrdelhedrvddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekvddrudegfedrleehrddvvddvpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepsghrrghmrdhvlhgvrhhitghksehophgvnhhpihigvghlshihshhtvghmshdrohhrghdprhgtphhtthhopegtvghrnhgvkhgvvgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrghisehsuhhsvgdrtghomhdpr
 hgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: peter@korsgaard.com

>>>>> "Bram" == Bram Vlerick <bram.vlerick@openpixelsystems.org> writes:

 > Add support for tas5753, device is similar to tas5733 but with added
 > headphone / line driver.

 > Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
