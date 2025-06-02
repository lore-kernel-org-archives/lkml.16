Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B25620E6E3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873987; cv=none; b=m4I0AJGbaP6WJOsMSsY5VawpbVZ040iBeCBkJBwNHXP2VGEagNu9c7BXyUBy5yFHRSHAI0/BAWGi3FwAaSRFBNThsnQ/siA6Z/sgOxszI0owxqbG1zk+uLfz/ThcP/NEGfv6KIhYNOhxj0fnr6qfGxC6+IKER6K0wqYo1ANR1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873987; c=relaxed/simple;
	bh=Ev6iNL22PFHIL/H7k7mv5eeLl0WdLTXXN8qyBlvf9KQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hs0uB05DJ0wZJqRkaLEM6+1xDigNuAaBWalCM75k9dSBqlXprWfCobbgFbycOo6XbmXoQ7mvsU0ALTwsrzT6K2pDL8cbFor9et2NaKUKSjGe7/6TkBU5vGqh+oSestGJONtBSGFtmgwE3uRd/+23J0gzdGQXTeiin8wGs2lp+zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yhcjc4Dx; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yhcjc4Dx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98B1143917;
	Mon,  2 Jun 2025 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748873977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev6iNL22PFHIL/H7k7mv5eeLl0WdLTXXN8qyBlvf9KQ=;
	b=Yhcjc4DxVpktZG2sfeGOKAu/dtCMwVl5FNgFFfgFjN3slTiJUtJJF+ikpi/fX3QH+OYtKA
	9KL9rvadfV5+7ugK0PxfdB8Zj8yPYzfxIQ3WbjmPn8JeJCRXuvq0c5Ret7yYt95QYsuny3
	0uemBmiFPhwloDZrclMZfGRm5HEvxyzHIiFB2rp4ltO2HWaSMYUuPvPLdh6FXpDq3EQf/u
	UCT/Ywvwgng4Z8SP13e8Qf98i9yx7h8bvtyu9NOV3ZGqviB/DVS4Ez7+7SeuOf1LqJmpaE
	sHxb7/R1CrfVnwTbNR7+YL/TftLazYh+CdIOLXUQ3sEcjmSiK02soKfLrKvkfQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  bcm-kernel-feedback-list@broadcom.com,  william.zhang@broadcom.com,
  anand.gore@broadcom.com,  florian.fainelli@broadcom.com,
  kamal.dasu@broadcom.com,  dan.beygelman@broadcom.com,  =?utf-8?Q?=C3=81l?=
 =?utf-8?Q?varo_Fern=C3=A1ndez?=
 Rojas <noltari@gmail.com>,  rafal@milecki.pl,
  computersforpeace@gmail.com,  frieder.schrempf@kontron.de,
  vigneshr@ti.com,  richard@nod.at,  bbrezillon@kernel.org,
  kdasu.kdev@gmail.com,  jaimeliao.tw@gmail.com,  kilobyte@angband.pl,
  jonas.gorski@gmail.com,  dgcbueu@gmail.com,  dregan@mail.com
Subject: Re: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
In-Reply-To: <20250530034713.4165309-1-dregan@broadcom.com> (David Regan's
	message of "Thu, 29 May 2025 20:46:59 -0700")
References: <20250530034713.4165309-1-dregan@broadcom.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Jun 2025 16:19:35 +0200
Message-ID: <87ecw2ns3s.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeeltdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepughrvghgrghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsr
 hhorggutghomhdrtghomhdprhgtphhtthhopeifihhllhhirghmrdiihhgrnhhgsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegrnhgrnhgurdhgohhrvgessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

On 29/05/2025 at 20:46:59 -07, David Regan <dregan@broadcom.com> wrote:

> Currently we attempt to get the amount of flipped bits from a hardware
> location which is reset on every subpage. Instead obtain total flipped
> bits stat from hardware accumulator. In addition identify the correct
> maximum subpage corrected bits.

This change does not feel correct. We gather two statistics:
- the maximum number of bitflips corrected in a single ECC chunk
- the total number of bitflips among the whole page

The most important one is the former, because it may trigger wear
levelling from the top layer (UBI, usually). It feels like you are
breaking this, am I wrong? Would you mind to be more explicit otherwise?

Thanks,
Miqu=C3=A8l
