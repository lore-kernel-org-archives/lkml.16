Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACB22550AE;
	Fri,  2 May 2025 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194002; cv=none; b=TRrlZ77OWzinGuwwhfjzGKqjjFOb23HNl8QYz+NZE+A0x77BI6XJIfHPBuQIIYAjgSUflsQ/X+pH1W/K96Ep5FOBQE69FrEQz39iuymLwRQMmjHXTOVxnEnXplnyqkCYRhbtu50s1YhyVjfBK18f4ijcxytRJM4KpdyGf7J1Fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194002; c=relaxed/simple;
	bh=vgZsW2stoOUxr+dsHo/BJA6aScmF3s1/I0yOgycAAwM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NOMBInr9S+X4+oVekCzmw069GGN1oC16WabGM11W2RqDyf5+7BpbI3ZSRO4HwlEgyAxzSHb4pz0mMUUYwBp7k8ldVnpMq+78FAcdU6YRDI2jSlZQqYfupyjNgZAzrAU32cEamcMktWO040hiCEHF0vLYAjH3Dose0bu14Hobopg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=di2Ep4gJ; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="di2Ep4gJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEB6F43A18;
	Fri,  2 May 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746193991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q84CAbuYdxgmNlh++XSqTYDf79I7cNHmEsWeZV2JICU=;
	b=di2Ep4gJtA1J+WPizEWdOd5SdjMuuT3ZWjJRhGI+dSG23LNy9nr/VF8Qfvk0isYYby+rrN
	KY0PSuzDGfkibmwTgWhgnOcubtzYpFCTXynpuXfqLrlKfcrcgYUraJ0z+MozMb9pZdDmEZ
	IW+tGrLxFxEye0lifxS+IbYxr/w8hXuORNjqU6ov3ameC6nbNSuW552FuMtBx/ykjc4yDH
	IrvluGwuFZh3sYaDqveWi+W4XV3pfV/PbZh9bVH8foZpk3tppFcrck7wrAe2Qjn/ejinFZ
	jymDo+grlOrjlfyOSzLUv1fSoWpQHJa2umQL4d34XCJgTxfdQkwN6Ucn69DpVQ==
Date: Fri, 2 May 2025 15:53:08 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Kever Yang
 <kever.yang@rock-chips.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Stefan Wahren <wahrenst@gmx.net>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Message-ID: <20250502155308.11a991d4@booty>
In-Reply-To: <8c2e18a9-44d1-47b3-8fe4-46bdc5be8d76@rowland.harvard.edu>
References: <20250414185458.7767aabc@booty>
 <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
 <cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
 <20250415162825.083f351c@booty>
 <8c2e18a9-44d1-47b3-8fe4-46bdc5be8d76@rowland.harvard.edu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedviedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepshhtvghrnhesrhhofihlrghnugdrhhgrrhhvrghrugdrvgguuhdprhgtphhtthhopefoihhnrghsrdfjrghruhhthihunhihrghnsehshihnohhpshihshdrtghomhdprhgtphhtthhopehlihhnuhigq
 dhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvhgvrhdrhigrnhhgsehrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Alan,

thanks for your continued support!

On Tue, 15 Apr 2025 12:14:58 -0400
Alan Stern <stern@rowland.harvard.edu> wrote:

[...]

> > > > It's quite possible that you're getting messed up by link power
> > > > management (LPM).  But that's just a guess.  
> > 
> > What would be a symptom, if that happened?  
> 
> The debugging log wouldn't show much unless something went wrong.  You 
> could see if there are any files containing "lpm" in their names in the 
> /sys/bus/usb/devices/3-3.4/ directory (while the device is connected) 
> and what they contain.  Also, there's a way to disable LPM on the host 
> by setting a usbcore quirks module parameter:
> 
> 	echo 1209:0001:k >/sys/module/usbcore/parameters/quirks

Tried this. There is no file with 'lpm' in the name in
/sys/bus/usb/devices/3-3.4/, and adding the quirk did not change the
result: still a disconnect and reconnect in ~6 seconds.

> You could also try connecting a usbmon trace for bus 3, showing what 
> happens during the initial connection and ensuing disconnection.  Any 
> LPM transitions would show up in the trace.

Tried this, and here are the few lines before and after the 5~6 seconds
delay.

ffff99621e768840 4009009102 C Bi:1:009:3 0 2 = 696e
ffff99621e768840 4009009104 S Bi:1:009:3 -115 256 <
ffff99621e768300 4009009115 S Bi:1:009:3 -115 256 <
ffff99621e768840 4009009144 C Bi:1:009:3 0 6 = 3a383534 2033
ffff99621e768300 4009009155 C Bi:1:009:3 0 1 = 37
ffff99621e768840 4009009178 C Bi:1:009:3 0 2 = 0d0a
ffff99621e768840 4009009180 S Bi:1:009:3 -115 256 <
ffff996080f11900 4009009361 C Ci:1:014:0 0 26 = 1a034300 44004300 20004100 43004d00 20004400 61007400 6100
ffff99621e768300 4009009615 C Bi:1:009:3 0 3 = 5b2020
ffff99621e768300 4009009624 S Bi:1:009:3 -115 256 <
ffff99621e768840 4009009645 C Bi:1:009:3 0 3 = 203233
ffff99621e768840 4009009646 S Bi:1:009:3 -115 256 <
ffff99621e768300 4009009692 C Bi:1:009:3 0 4 = 2e383738
ffff99621e768300 4009009694 S Bi:1:009:3 -115 256 <
ffff99621e768840 4009009703 C Bi:1:009:3 0 2 = 3731
ffff99621e768840 4009009722 S Bi:1:009:3 -115 256 <
ffff99621e768840 4009009933 C Bi:1:009:3 0 2 = 7472

<<< 6 seconds delay >>>

ffff9960828e9540 4014796128 C Ii:1:001:1 0:2048 2 = 1000
ffff9960828e9540 4014796145 S Ii:1:001:1 -115:2048 4 <
ffff996080f11900 4014796162 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
ffff996080f11900 4014796189 C Ci:1:001:0 0 4 = 00010100
ffff996080f11900 4014796201 S Co:1:001:0 s 23 01 0010 0004 0000 0
ffff996080f11900 4014796219 C Co:1:001:0 0 0
ffff996080f11000 4014799627 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
ffff996080f11000 4014799679 C Ci:1:001:0 0 4 = 00010000
ffff996080f11000 4014826132 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
ffff996080f11000 4014826166 C Ci:1:001:0 0 4 = 00010000
ffff996080f11000 4014852075 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
ffff996080f11000 4014852122 C Ci:1:001:0 0 4 = 00010000
ffff996080f11000 4014878210 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
ffff996080f11000 4014878253 C Ci:1:001:0 0 4 = 00010000
ffff996080f11000 4014904049 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
ffff996080f11000 4014904088 C Ci:1:001:0 0 4 = 00010000
ffff9960828e9540 4014948427 C Ii:1:001:1 0:2048 2 = 1000
ffff9960828e9540 4014948456 S Ii:1:001:1 -115:2048 4 <
ffff99621e768300 4014948461 C Bi:1:009:3 0 2 = 5b20
ffff99621e768300 4014948472 S Bi:1:009:3 -115 256 <
ffff99621e768840 4014948488 C Bi:1:009:3 0 2 = 2020
ffff99621e768840 4014948489 S Bi:1:009:3 -115 256 <
ffff996080f11000 4014948522 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
ffff99621e768300 4014948545 C Bi:1:009:3 0 58 = 32392e38 31373337 325d203e 3e3e2064 7763325f 68616e64 6c655f63 6f6d6d6f
ffff99621e768300 4014948560 S Bi:1:009:3 -115 256 <
ffff996080f11000 4014948607 C Ci:1:001:0 0 4 = 01010100
ffff99621e768840 4014948639 C Bi:1:009:3 0 10 = 37395d20 3e3e3e20 6477
ffff99621e768840 4014948644 S Bi:1:009:3 -115 256 <
ffff99621e768300 4014948657 C Bi:1:009:3 0 3 = 63325f
ffff99621e768300 4014948663 S Bi:1:009:3 -115 256 <
ffff99621e768840 4014948689 C Bi:1:009:3 0 5 = 68736f74 67
ffff99621e768840 4014948693 S Bi:1:009:3 -115 256 <
ffff99621e768300 4014948718 C Bi:1:009:3 0 2 = 5f69
ffff99621e768300 4014948720 S Bi:1:009:3 -115 256 <
ffff99621e768840 4014948759 C Bi:1:009:3 0 4 = 72713a33

Does this give you any hints?

I'm afraid it's going to take time before I'm able to decipher these
hieroglyphs. :-|

Full log is available, if needed.

However I suspect using Wireshark to capture the USB traffic should
produce the same content. If it is the case, I have available a
Wireshark capture as well. The first logged event I see in Wireshark
after the delay is a "URB_INTERRUPT in", which is possibly matching the
"Ii" in the log above.

However IIUC both the usbmon debugfs interface and Wireshark are unable
to capture disconnection events because that's handled by the hardware.
Correct?

I hope useful hints can be found here. Otherwise I guess the only way
out will be comparing the behaviour of the 4.4 Rockchip kernel (which
works correctly) against mainline. I expect this to be a long and
painful process, though.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
