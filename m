Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF8C1EEA59;
	Tue, 15 Apr 2025 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732712; cv=none; b=qAXTy9tfUV1DSGADkDnO4IxuPoIzdXNj7bz9Lxtcm7jOSulD8PL+231V/NHdc+QsY0LRZKRx+Q4sij0zNE5/C3Fqu5/gNy2vQS/PR2vrtfYtQVkFe7s0t73S6/TegyFU2XJOY7dPusKNm5sx3F7Pahtzuygl+5O9oFsxX1WHvEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732712; c=relaxed/simple;
	bh=U/90jjP4V82IWeUHDUxtkeYDFaNHX8uWtKXtAFSsFl8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iyFze5HB0SyWPopFZ4rTtgJPUPgz509oQ+H/43e7pQ76f/NKombqaGsnUdHJmII1VWLRBtp8ovSzBGy9QY3SjEXjI5ihtRAFk/dxKsKyJr77Bgf2rfRSJ43J5dY4sK9mbQL3nnosGiXBgpFvwku2pJvFNMYCsnBbe8c+lLy56MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b0V7KNwe; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b0V7KNwe"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B771439B2;
	Tue, 15 Apr 2025 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744732707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IlFkx92zqrdGnm1jCeRAQEwZS/CqL7sPlGLEJRx74h8=;
	b=b0V7KNwesW/RB5bRjvYoGOgVAOQ7/cpgJaxMGipjFpY6pbjyIi3yUJ0qNiM3435fwvrxel
	OeaDpkTYGIv5v/+Yhs+Bao3GgzyBwK4f9ySFlu09P9Aa2wlsGDvFHQO7UOwImrs7yBnbtj
	LPOoIdkqxdDXKhZfI4riu4smPhJYDvBu6q1Fbwv6f1bxG2PMTo8SaeSnCt5VA+cWTcUnLG
	NwFTfJYfM+ny0xNWylXSU+bxi2wVkYOIKqLfs5EsebwWDXay/1N2ssDfxSFzyGQTO9BkEi
	kZrTTcIaFpVfSSl1AyHDBKpbhTWZhukKzKxGdMvstO6VYEx0Y6Yn25k8VVH+yg==
Date: Tue, 15 Apr 2025 17:58:22 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, Kever Yang <kever.yang@rock-chips.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Stefan Wahren <wahrenst@gmx.net>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Message-ID: <20250415175822.1c537ae9@booty>
In-Reply-To: <20250415162825.083f351c@booty>
References: <20250414185458.7767aabc@booty>
	<a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
	<cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
	<20250415162825.083f351c@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueevveettddtieegveegffdugeevgffgleeuleejteeggfehueeffeffkefgkeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopefoihhnrghsrdfjrghruhhthihunhihrghnsehshihnohhpshihshdrtghomhdprhgtphhtthhopehsthgvrhhnsehrohiflhgrnhgurdhhrghrvhgrrhgurdgvughupdhrt
 ghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghvvghrrdihrghnghesrhhotghkqdgthhhiphhsrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello again,

On Tue, 15 Apr 2025 16:28:25 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

[...]

> There are two more facts that may hint at something:
> 
>  * using the Rockchip 4.4 vendor kernel the problem does never happen
>  * using a custom board with the RK3308 the problem happens if the
>    USB-C cable is connected before booting; it does not happen if the
>    connectror is connected after the boot has completed
> 
> These two have been reported to me and I haven't reproduced them (yet)
> so I cannot provide logs at the moment. I can prioritize working on
> them, or the 4.4 vendor kernel at least, if it is deemed useful.

FWIW I managed to try the 4.4 vendor kernel:

git repo: https://github.com/radxa/kernel.git
commit:   4.4.143-23-rockchip-796-g09ee299143e4

As said, there is only one enumerations, not two.

Here's a log of the host during said enumeration (same host as before,
no changes on the host side):

[110685.837058] hub 3-3:1.0: state 7 ports 4 chg 0000 evt 0010
[110685.844824] usb 3-3-port4: status 0101, change 0001, 12 Mb/s
[110685.848278] usb 3-3-port4: indicator auto status 0
[110685.958750] usb 3-3-port4: debounce total 100ms stable 100ms status 0x101
[110686.053638] usb 3-3.4: new high-speed USB device number 116 using xhci_hcd
[110686.163756] usb 3-3.4: skipped 2 descriptors after configuration
[110686.163775] usb 3-3.4: skipped 4 descriptors after interface
[110686.163996] usb 3-3.4: default language 0x0409
[110686.164557] usb 3-3.4: udev 116, busnum 3, minor = 371
[110686.164567] usb 3-3.4: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00
[110686.164574] usb 3-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[110686.164579] usb 3-3.4: Product: foobar
[110686.164583] usb 3-3.4: Manufacturer: ACME
[110686.164586] usb 3-3.4: SerialNumber: 12345678
[110686.165279] usb 3-3.4: usb_probe_device
[110686.165290] usb 3-3.4: configuration #1 chosen from 1 choice
[110686.169116] usb 3-3.4: adding 3-3.4:1.0 (config #1, interface 0)
[110686.169384] cdc_acm 3-3.4:1.0: usb_probe_interface
[110686.169389] cdc_acm 3-3.4:1.0: usb_probe_interface - got id
[110686.169827] cdc_acm 3-3.4:1.0: ttyACM0: USB ACM device
[110686.169868] usb 3-3.4: adding 3-3.4:1.1 (config #1, interface 1)

The only potentially significant difference I could spot from the
previous host log is:

mainline:  [105021.396995] usb 3-3.4: skipped 1 descriptor after configuration
 4.4:      [110686.163756] usb 3-3.4: skipped 2 descriptors after configuration

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
