Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711A1EB18C;
	Fri,  7 Feb 2025 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939590; cv=none; b=RA4sAloDUo6JA96Ymuw+nOF/D+72J0VH9VlvPBwws1TL3BIX1knrS0Uy0x8sqmTNG1TGM1SwS1V7ySXwFfP4NIEDEoWdv4ZtOjTQMU/4Ry6z8uesOheoGfL9NGRSc//KijzGmYBp4zT9vowOhwmQhH8UtxyQkf0kjfyP8w08huI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939590; c=relaxed/simple;
	bh=NEvFF2Y1LTbWWAZyUyd8pv2xjBdWXjikltka8ZTTU9I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mVeyGiLH6beTLUTfVQxUdemxKE+faMNg2yUVydRb79b47MzPWb14UI+320IvlwmM4z+5Zfanr+Evq10ZEx0c5AfetsyTraLIO5ctB8xqmK1/plJJIsfxs/MXlzJhzAvgEMgCuT86fVx8/e5HzybiCiWSkzrE2mMfjrBp/8ubWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mmKeQca3; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mmKeQca3"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3673B443B8;
	Fri,  7 Feb 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zotNU7rJ3SVVOWKtFNsAK5uaTmDszXvpsTrfKkmZ7NQ=;
	b=mmKeQca3SwF0SEnls1X8Rt3DCjE9SSenlQicXMWpoMt80HZKE8t/yStGUuRpJDAe4pMWHw
	zhoFObvhK5kggHmjxfi5iPqqlUGcaSo+AbSTR5DdC9IHDOCYEiFGwHEy0uKsj/oYp8w9b4
	sBw9TTqa6xnTFGtBCZ4r+iklF1MxdUn8Qmrz/eeGB9ExgOQeaFAnJnfCQyI3g10WgZSebM
	ybSpBOM+iJ2qZC6GSNrpJYyHpecBfhgDuqTP3vVg2HnCLRQic0gnWVXxA2ifh3wgTnbI2a
	mmYiGE6n/C8xSaCUSNz7b6RV1NfSIX0hhdFV8EApSH/hrXXkalDfM1jykpjfCA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250203213036.9816-1-robh@kernel.org>
References: <20250203213036.9816-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: Ensure all properties are
 defined
Message-Id: <173893958505.2918383.10809886449430911872.b4-ty@bootlin.com>
Date: Fri, 07 Feb 2025 15:46:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtp
 hhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 03 Feb 2025 15:30:35 -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add the missing 'ranges'
> property, and fix this constraint.
> 
> 

Applied to mtd/next, thanks!

[1/1] dt-bindings: mtd: physmap: Ensure all properties are defined
      commit: 038e2ba01cf5ff94dc8f740328ec565d18bb764e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

