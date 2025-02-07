Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23EE1A0BDB
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738912792; cv=none; b=p68mPY1AkGewdtuG+InqzI/HTPXhtHLOiKoi/ubAoyHDxCB96k2s2ae1h78EAVfd4x2qCqCyl/GqWS9UxFFznzemh4LAVzFUQuLhYLMAwn4qNtXHYi8yeij+NHgjPimFVFdFitzx1947jITsnSU9VLzePehRV8kb1EbeVue28zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738912792; c=relaxed/simple;
	bh=xQXlQ4WSBU3KQIIWpFc1oMW6o15OIZFdSlwJ3ea5d04=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=Ft6IwXWVaWhnFxi4+IXnx7h97Pdh4oYGU61K0D9oXYE5t1Zhu3sNaszRYL2tEPcwI95mQKBoCIPrnD/Xcd6tUaD+FmrW7MZkRo2neOl2pJ8RXFE9+2WSO9d4nuyEerLVNBtLykvkYAp+SPwkQGb8eisTUy1Zpg7BHs/FH1nHH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=koENBGzn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hKDnfIs/; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="koENBGzn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hKDnfIs/"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 6FBDE11400E4;
	Fri,  7 Feb 2025 02:19:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 07 Feb 2025 02:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1738912789; x=
	1738999189; bh=IGJ8/iyL+ahdVPpahwegMir9dYYvEoDAou0Ag7AFvSc=; b=k
	oENBGznNkVSFzeATVe1dD2MOR+2ksXjgLzECplFdNpWvz1aZxOGuniGgJxEfYitr
	RTbmgk/aS2bL0BxE7niSefhJqq3ASOFIoRUaSkF+zUavElHrdv97XvekO34wA4gG
	qcgaqeoLs1weRRVP+lEdVWF0sadp3Y4+CLrwyX5bNAng8NK3NIYehBZdIEXYUGgL
	QGM1FDgF6cB3UHvsJIAMLmcp0CBvUtKMKeQhoDw46VARQeKMlcE/KaNj7DlxDhLo
	Dnb4JTQvjm3ca5XxN/YdClWHj+rLMH+TsI4wVHHK4DE9PKHjDf4r1VMrGhYOv0r4
	ueJKCYgp2r/UI+tKIysfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1738912789; x=1738999189; bh=IGJ8/iyL+ahdVPpahwegMir9dYYv
	EoDAou0Ag7AFvSc=; b=hKDnfIs/ckHAJzD3Mn79cByrQe+t1B9B+8eMrGt9SdrG
	NSaBLlCuHR/t/eCWnq2wv4Asp1PNyCMyBhkfUorXBFH6j+J0X+E31Ay/Xp2aObUa
	Y9B9FNTKUrMpm2ly5Y5au/x7I0DPiuwKCPltA7YZ3kc9tU0dGXY/dVb6L5sADIS/
	xPXfMXEGQJVApMwvAPHEo7w/CXpyMWo4T3ovQG60/15CgtFngNjyoGoi+oUvMg8k
	JRrRAxD7BQvfTcW/vPA0soFJuC6urB+D3dwXMV0VgIAVA50ELRAEDWyQutsD/RrD
	UFVBM0AHd5y4ASDdUopyqEXmjUTbOgjnzuLnfhDFnA==
X-ME-Sender: <xms:FLSlZ0Ii9ayzt20YRpskGZNFes7LMkHTEsRh_FavHo-_2yRLFGBNCA>
    <xme:FLSlZ0L-9PlxasfDlOuOt6Or8eF5sN_iTRMpl1HO0g79wBV3EeX-Qy9CKFEMnI1tt
    OjR2xZRbFcS5we1kvc>
X-ME-Received: <xmr:FLSlZ0vm9yHqmt3ezwQlDEPckI0BM9SIF3ESPswdacB51d9Ilr-OtJNjRUuu8tNB618>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpegtgffhggfukfffvefvofesthhqmhdthhdtjeen
    ucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvg
    hvqeenucggtffrrghtthgvrhhnpefgjeetudefveeludevuedvgfetteevhfffjeduveeg
    fefgueeuteevfffgueetveenucffohhmrghinheprghpphhrohgrtghhrdgrphhplhgvpd
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtoh
    epkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdgu
    vgdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpth
    htohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehtohifihhn
    tghhvghnmhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhlohhfsehlihigohhmrd
    hnvghtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihho
    nhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsth
X-ME-Proxy: <xmx:FLSlZxbce8uxeNc2IQU6pW97eTB5iEcamxkShGYNTL3Fl7yNq5ud8g>
    <xmx:FLSlZ7Y9BCBahyQyNHBrrgFrG7F8dXTJGoX0TVN401DhknGccczncw>
    <xmx:FLSlZ9Bm7qkZ1rwA6y8HC-nkfpOTTMTx1ZJW18T6GF6sTnE5CKeojw>
    <xmx:FLSlZxY4PiXuRYD6RAhnshnsPLUDaBty-oXlu9pRi2hx2rGzsYGMbg>
    <xmx:FbSlZ5P3aEGC83w50F_alNTmU9TG4lbnQc1aaQSLKGVFqXwr6xPERhzu>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Feb 2025 02:19:47 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Sven Peter <sven@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] MAINTAINERS: Remove myself
Message-Id: <2D08D1CF-B03C-479B-8BCE-17082402DE58@svenpeter.dev>
Date: Fri, 7 Feb 2025 08:19:26 +0100
Cc: Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev
To: Nick Chan <towinchenmi@gmail.com>
X-Mailer: iPhone Mail (22D63)

=EF=BB=BF
>=20
> On 7. Feb 2025, at 07:15, Nick Chan <towinchenmi@gmail.com> wrote:
>=20
>> =EF=BB=BFHector Martin =E6=96=BC 2025/2/7 =E5=87=8C=E6=99=A82:21 =E5=AF=AB=
=E9=81=93:
>> I no longer have any faith left in the kernel development process or
>> community management approach.
>> Apple/ARM platform development will continue downstream. If I feel like
>> sending some patches upstream in the future myself for whatever subtree
>> I may, or I may not. Anyone who feels like fighting the upstreaming
>> fight themselves is welcome to do so.
>=20
> Hi marcan,
>=20
> It is sad to see you go, I believe there are issues in the kernel developm=
ent process as well.
> Aside from Apple Silicon Macs, your work has greatly simplified the work
> required for booting Linux on iPhones and iPads. However, Sven Peter is st=
ill listed as
> maintainer, so for upstream purposes, will the https://github.com/asahilin=
ux/linux tree be used
> in the future,  or perhaps the tree should be removed from the MAINTAINERS=
 file as well?
>=20
> Nick Chan

Hi,

Give me a few days to figure out what we=E2=80=99ll do.  I think we can keep=
 tree going forward.



Best


Sven


