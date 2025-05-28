Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CB26A092;
	Wed, 28 May 2025 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421780; cv=none; b=Q6wPepQKZG9UlGIuEbIfJSUJGynk7Njovy6FP6g7V0ext9h9OaKkeffIvJH8Vxjjkt0bTfS78rWbyX0Lpf5xNKYoK5LZJqjrgpDn5s/WZXt3u6SnDg30bz2B1QT9SetIzrNsOHLrCvMZkzsvPKgMiqysBkU8IpXXrN0SiwQIOtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421780; c=relaxed/simple;
	bh=3zwfXRlMCmJzAlkW8lMNPC17HbBMhuJcZmRNQOHKhj0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=ZWGzBAOVc1GsSDSypI016n3Q4HEMksI9h/Sc9OBtPlSWOfMa1AhFHDdksvIWyuB1Nfqd0NpPYeIkHqMx6RScuY9iRP9BSDh+kRQmR/n5lRU+sxM5QPLs/Q+4tLO4sSKwMOewwZg07kK4tiw5iFukbGhIL5DLU8FC7oyzFu8tXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E67D943295;
	Wed, 28 May 2025 08:42:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1uKCN6-000rwB-0d;
	Wed, 28 May 2025 10:42:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: Kevin Cernekee <cernekee@chromium.org>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
  linux-sound@vger.kernel.org,  linux-kernel@vger.kernel.org,
  kamel.bouhara@bootlin.com
Subject: Re: [PATCH] ASoC: tas571x: fix tas5733 num_controls
References: <20250528-tas5733-fix-controls-size-v1-1-5c70595accaf@openpixelsystems.org>
Date: Wed, 28 May 2025 10:42:48 +0200
In-Reply-To: <20250528-tas5733-fix-controls-size-v1-1-5c70595accaf@openpixelsystems.org>
	(Bram Vlerick's message of "Wed, 28 May 2025 10:25:48 +0200")
Message-ID: <87wma1w2gn.fsf@dell.be.48ers.dk>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdekudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepkedvrddugeefrdelhedrvddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekvddrudegfedrleehrddvvddvpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegsrhgrmhdrvhhlvghrihgtkhesohhpvghnphhigigvlhhshihsthgvmhhsrdhorhhgpdhrtghpthhtoheptggvrhhnvghkvggvsegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrt
 giipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: peter@korsgaard.com

>>>>> "Bram" == Bram Vlerick <bram.vlerick@openpixelsystems.org> writes:

 > Commit e3de7984e451 ("ASoC: tas571x: add separate tas5733 controls")
 > introduces a separate struct for the tas5733 controls but did not update
 > the num_controls with the correct ARRAY_SIZE.

 > Fixes: e3de7984e451 ("ASoC: tas571x: add separate tas5733 controls")

 > Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
