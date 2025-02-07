Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FFF238D3F;
	Fri,  7 Feb 2025 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939639; cv=none; b=tZWZv8oLX053FMKfa26vWw4x4Bd9Q6lYLeaTRY1o/pwGS5J/iy8Jj6R4mCNnozcbBnjkbxcrpLlX+Lxd5CGCDw+NWmnou1bBXnSruvO9tVDE6tMiiQXYObs6+zp47CyD98X9GXLrURcyWaFpJ1JZ8knxPvx8JTZlxVmtY1QDqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939639; c=relaxed/simple;
	bh=X1gPX6GM/Qmucx7cwDOtgdok+4v2hVhbtfmI16ZcyNs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WbA13iHSwuMc1oFDzxfcEvs4V6JiciCvuN9G3vBdsUXuVqS94EZh0qyHsEPfyCQeM4Ah+L8KaERvi5QJGCrlaYYgBgnE+x48yjbzPdLpILD6fNaw0Yx4ixSQ+5PbeqEiu3TI9RtgtB2tG5TcqNkXFgTxohXyC+Rns1onaM6gGsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bMxpm791; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bMxpm791"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12868204A9;
	Fri,  7 Feb 2025 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WpI2edtbUAkl7Pk3+d3AA5YEgCOsQaOIF4NmC7POzv8=;
	b=bMxpm79108QBRUdxCCdN5krj6MIdBumPFmBPh1gWXDPYYu0yVb8lZs4VYWUd3wkrW6r8Cf
	bJWsszmSt0FkvB/KZKu+msKcUDFlx4zcm/rpFRNNPlRAitkBX6PRsGeLarfaXU8Z7cVsvs
	4+RJUB3mLfGDvZpRMmuTfOMKhGe+pCrPTllnpZDITeY/MZ6RLs4A9ZnGdZuPZROOovMYjJ
	H0kn+ai+XGSBV1JIJN0z98u4nY/fGG1/5WvUkz3+sjrzHu/BATX46NRQk2stkO+cwDhjMz
	LNvlCs9dKNqvpMsCJQwJz/UUVd8aKQ/rIhj301OvEPcQw3KHXF4npcBv6Cy/pA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250203213042.12657-1-robh@kernel.org>
References: <20250203213042.12657-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: arasan,nand-controller: Ensure all
 properties are defined
Message-Id: <173893962795.2918632.15480410452310039878.b4-ty@bootlin.com>
Date: Fri, 07 Feb 2025 15:47:07 +0100
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhou
 gdrrghtpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 03 Feb 2025 15:30:41 -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'unevaluatedProperties: true' allows. Fix this constraint.
> 
> 

Applied to nand/next, thanks!

[1/1] dt-bindings: mtd: arasan,nand-controller: Ensure all properties are defined
      commit: 499a4b16a4869a901a9bc601bc1e0b8f60151e93

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

