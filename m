Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6622F758;
	Fri,  9 May 2025 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775074; cv=none; b=ecUU99OlD0Dyux+PoF3afuLanDA0k/TT/kJZRJOVaxyyEOcB4HMChkkbxMQOkNGb9MY0GAGQr1vO5Rg/m+uOsEQB4CELuqLJ1bAWjbokLOrswwn/SqLOg9wmJYgOWDy0OK2/6wTPrFCPrqWcJ8VSnK6BcP+5FW+y3DiuBGLSucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775074; c=relaxed/simple;
	bh=j7KskJQD/QxQm9RYj+P6lJVOGDGf0M4PLq4r4R5J11w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FYjwtbDbj0EShxtGy6Tx3ezKaH3mhilY4w/ZrjCAYiaeaI6pjzBf0a/+somPiVOOCEu7MT3SxWVmLlZd/8Lh7gPP+gq44P1bxTvryCmEZhYWnLPiKg3szs6sd3rjQfBu0yHGBsOzP8Fh4dGuYHDrjkiVmvaMgxH8Y4Nc4zcCPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Uw+9aVEb; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Uw+9aVEb"
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABF6643985;
	Fri,  9 May 2025 07:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746775062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcqCdaQWQLvWdXe6Z7oq+9bAfdshHsVP1FiSZ+sw6PU=;
	b=Uw+9aVEb0mY31sOw73e+Z5cqRp1l0pnsFCwEpyraXHJx58OJH7KLM+BDhvTJL+fDLlxR6W
	xLrg6hueje5+J6soKsYCnf7+VrzLNWbxGiR4ivN5WphBn3Lh37o6jOvVLsOvKBgXmGIZfJ
	X4E8qOeIeKwCcM5RZQTPZZiQRzj4kZy4IcwF4iQK+afp4QWp9QIVXlA4XPctWifTKtCGRW
	Fe9SXbua6W5HuuAtccwQGkpR34npUs6ED4IN5BesqYitJdoKcnyi+04rKLlnOxLoXkIdJK
	ufOX7OVcd9CwCITuNKGr09bxCDqdUcvDd9SPHgEPYEWg/WQP4kB4aTerpegSbQ==
Date: Fri, 9 May 2025 09:17:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alan Stern <stern@rowland.harvard.edu>, Minas Harutyunyan
 <Minas.Harutyunyan@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Kever Yang
 <kever.yang@rock-chips.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Stefan Wahren <wahrenst@gmx.net>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Message-ID: <20250509091738.4ae76d18@booty>
In-Reply-To: <cc80988c-5941-46f3-8183-f3f9acb7dd5d@rowland.harvard.edu>
References: <20250414185458.7767aabc@booty>
 <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
 <cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
 <20250415162825.083f351c@booty>
 <8c2e18a9-44d1-47b3-8fe4-46bdc5be8d76@rowland.harvard.edu>
 <20250502155308.11a991d4@booty>
 <cc80988c-5941-46f3-8183-f3f9acb7dd5d@rowland.harvard.edu>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepshhtvghrnhesrhhofihlrghnugdrhhgrrhhvrghrugdrvgguuhdprhgtphhtthhopefoihhnrghsrdfjrghruhhthihunhihrghnsehshihnohhpshihshdrtghomhdprhgtphhtthhopehlihhnuhigq
 dhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvhgvrhdrhigrnhhgsehrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Alan, Minas,

Minas: I am reporting new relevant findings in this e-mail and have
questions for you below.

On Fri, 2 May 2025 13:56:01 -0400
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Fri, May 02, 2025 at 03:53:08PM +0200, Luca Ceresoli wrote:
> > Hello Alan,
> > 
> > thanks for your continued support!
> > 
> > On Tue, 15 Apr 2025 12:14:58 -0400
> > Alan Stern <stern@rowland.harvard.edu> wrote:
> > 
> > [...]
> >   
> > > > > > It's quite possible that you're getting messed up by link power
> > > > > > management (LPM).  But that's just a guess.    
> > > > 
> > > > What would be a symptom, if that happened?    
> > > 
> > > The debugging log wouldn't show much unless something went wrong.  You 
> > > could see if there are any files containing "lpm" in their names in the 
> > > /sys/bus/usb/devices/3-3.4/ directory (while the device is connected) 
> > > and what they contain.  Also, there's a way to disable LPM on the host 
> > > by setting a usbcore quirks module parameter:
> > > 
> > > 	echo 1209:0001:k >/sys/module/usbcore/parameters/quirks  
> > 
> > Tried this. There is no file with 'lpm' in the name in
> > /sys/bus/usb/devices/3-3.4/, and adding the quirk did not change the
> > result: still a disconnect and reconnect in ~6 seconds.  
> 
> Okay, so LPM doesn't seem to be the reason.

I see, thanks for checking.

> > > You could also try connecting a usbmon trace for bus 3, showing what 
> > > happens during the initial connection and ensuing disconnection.  Any 
> > > LPM transitions would show up in the trace.  
> > 
> > Tried this, and here are the few lines before and after the 5~6 seconds
> > delay.
> > 
> > ffff99621e768840 4009009102 C Bi:1:009:3 0 2 = 696e
> > ffff99621e768840 4009009104 S Bi:1:009:3 -115 256 <
> > ffff99621e768300 4009009115 S Bi:1:009:3 -115 256 <
> > ffff99621e768840 4009009144 C Bi:1:009:3 0 6 = 3a383534 2033
> > ffff99621e768300 4009009155 C Bi:1:009:3 0 1 = 37
> > ffff99621e768840 4009009178 C Bi:1:009:3 0 2 = 0d0a
> > ffff99621e768840 4009009180 S Bi:1:009:3 -115 256 <
> > ffff996080f11900 4009009361 C Ci:1:014:0 0 26 = 1a034300 44004300 20004100 43004d00 20004400 61007400 6100
> > ffff99621e768300 4009009615 C Bi:1:009:3 0 3 = 5b2020
> > ffff99621e768300 4009009624 S Bi:1:009:3 -115 256 <
> > ffff99621e768840 4009009645 C Bi:1:009:3 0 3 = 203233
> > ffff99621e768840 4009009646 S Bi:1:009:3 -115 256 <
> > ffff99621e768300 4009009692 C Bi:1:009:3 0 4 = 2e383738
> > ffff99621e768300 4009009694 S Bi:1:009:3 -115 256 <
> > ffff99621e768840 4009009703 C Bi:1:009:3 0 2 = 3731
> > ffff99621e768840 4009009722 S Bi:1:009:3 -115 256 <
> > ffff99621e768840 4009009933 C Bi:1:009:3 0 2 = 7472  
> 
> It looks like device 9 (the lines containing :1:009:3) and device 14 are 
> unrelated to the problem; neither of them is your DWC2 device.

That's probably because I ha connected an entire USB HUB to the laptop,
which had in turn a USB-serial adapter to access the console on the
board headers. I understand this creates more noise, so I changed my
setup later on to only connect the relevant cable.

> > <<< 6 seconds delay >>>
> > 
> > ffff9960828e9540 4014796128 C Ii:1:001:1 0:2048 2 = 1000
> > ffff9960828e9540 4014796145 S Ii:1:001:1 -115:2048 4 <
> > ffff996080f11900 4014796162 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> > ffff996080f11900 4014796189 C Ci:1:001:0 0 4 = 00010100  
> 
> This shows the host system receiving a disconnect notification (for port 
> 4) from the hardware.  Which is odd, because earlier you said the device 
> was 3-3.4, indicating that it was plugged into a hub, not directly into 
> the host controller.  But the notification here comes from the host 
> controller.
> 
> On the other hand, an even earlier email said that the device was 3-2, 
> indicating it _was_ plugged directly into the host controller
> 
> Which means you've been changing your setup while running these tests.  
> Not a good idea.

I had to change laptop because reading usbmon debugfs files is not
working on my main laptop. I still haven't figured out the reason, but
on the other laptop it works, but unavoidably it changes the bus
number. Sorry about that.

> > ffff996080f11900 4014796201 S Co:1:001:0 s 23 01 0010 0004 0000 0
> > ffff996080f11900 4014796219 C Co:1:001:0 0 0
> > ffff996080f11000 4014799627 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> > ffff996080f11000 4014799679 C Ci:1:001:0 0 4 = 00010000
> > ffff996080f11000 4014826132 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> > ffff996080f11000 4014826166 C Ci:1:001:0 0 4 = 00010000
> > ffff996080f11000 4014852075 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> > ffff996080f11000 4014852122 C Ci:1:001:0 0 4 = 00010000
> > ffff996080f11000 4014878210 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> > ffff996080f11000 4014878253 C Ci:1:001:0 0 4 = 00010000
> > ffff996080f11000 4014904049 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> > ffff996080f11000 4014904088 C Ci:1:001:0 0 4 = 00010000
> > ffff9960828e9540 4014948427 C Ii:1:001:1 0:2048 2 = 1000
> > ffff9960828e9540 4014948456 S Ii:1:001:1 -115:2048 4 <
> > ffff99621e768300 4014948461 C Bi:1:009:3 0 2 = 5b20
> > ffff99621e768300 4014948472 S Bi:1:009:3 -115 256 <
> > ffff99621e768840 4014948488 C Bi:1:009:3 0 2 = 2020
> > ffff99621e768840 4014948489 S Bi:1:009:3 -115 256 <
> > ffff996080f11000 4014948522 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> > ffff99621e768300 4014948545 C Bi:1:009:3 0 58 = 32392e38 31373337 325d203e 3e3e2064 7763325f 68616e64 6c655f63 6f6d6d6f
> > ffff99621e768300 4014948560 S Bi:1:009:3 -115 256 <
> > ffff996080f11000 4014948607 C Ci:1:001:0 0 4 = 01010100  
> 
> And then about 150 ms later (the second column of the log is a 
> timestamp, in microseconds), a connection notification.  Nothing 
> preceding the disconnect to explain what caused it.
> 
> > ffff99621e768840 4014948639 C Bi:1:009:3 0 10 = 37395d20 3e3e3e20 6477
> > ffff99621e768840 4014948644 S Bi:1:009:3 -115 256 <
> > ffff99621e768300 4014948657 C Bi:1:009:3 0 3 = 63325f
> > ffff99621e768300 4014948663 S Bi:1:009:3 -115 256 <
> > ffff99621e768840 4014948689 C Bi:1:009:3 0 5 = 68736f74 67
> > ffff99621e768840 4014948693 S Bi:1:009:3 -115 256 <
> > ffff99621e768300 4014948718 C Bi:1:009:3 0 2 = 5f69
> > ffff99621e768300 4014948720 S Bi:1:009:3 -115 256 <
> > ffff99621e768840 4014948759 C Bi:1:009:3 0 4 = 72713a33  
> 
> Unrelated material.  Evidently device 9 is running some sort of 
> serial connection, because everything it sends looks like ASCII 
> characters.

Perhaps the USB-serial I mentioned above, to access the board console.

> > However IIUC both the usbmon debugfs interface and Wireshark are unable
> > to capture disconnection events because that's handled by the hardware.
> > Correct?  
> 
> I'm not quite sure how to answer.  Yes, the hardware handles 
> disconnections -- because the hardware handles _everything_ that happens 
> on the USB bus.  And one of the things the hardware does when handling 
> disconnections is to tell the driver that one occurred; that's why the 
> report shows up in the usbmon (or Wireshark) trace.
> 
> A USB analyzer could tell you exactly what's happening on the wire, but 
> they are expensive.  And in this case, I think all it would tell you is 
> what we already know: that a disconnect happened.
> 
> The fact that the disconnects don't happen with the vendor kernel 
> indicates that they aren't caused by a hardware problem, such as a bad 
> cable link, but rather by something in the device's software, i.e., the 
> dwc2 driver.
> 
> I don't know anything about that driver, though.  Minas is the expert.  
> You really need his advice.

In the meanwhile I did two event captures, one with the mainline kernel
and one with the vendor kernel, using the same laptop setup and no hub
in between, and for each test I captured both the usbmon log and a
wireshark file. Both are available if needed.

By analyzing those captures I found that the communication between host
and gadget is almost identical. The only differenceis the get
configuration descriptor response has one more descriptor in the vendor
case (the working one). Here it is:

OTG Descriptor:
  bLength                 3
  bDescriptorType         9
  bmAttributes         0x03
    SRP (Session Request Protocol)
    HNP (Host Negotiation Protocol)

I don't know exacty what that implies, but for a quick test I went in
the mainline kernel and found that it can add the same descriptor if
both of these is true:

 * dr_mode = "otg" in device tree
 * "DWC2 Mode Selection" is "Dual role mode" in kconfig
   (i.e. CONFIG_USB_DWC2_DUAL_ROLE=y)

While I had:

 * dr_mode = "peripheral"
 * "DWC2 Mode Selection" = "Gadget only mode"
   (i.e. CONFIG_USB_DWC2_PERIPHERAL=y)

With those two changes the mainline kernel now behaves correctly, just
like the vendor kernel. No more disconnection after 5-6 seconds.

For the records, the vendor kernel already had dr_mode = "otg" and
CONFIG_USB_DWC2_DUAL_ROLE=y.

Based on my very limited knowledge of USB, intuitively it looks that:

 * in peripheral-only mode the OTG Descriptor should not be sent
 * in peripheral-only mode SRP does not make sense
 * in peripheral-only mode HNP does not make sense

Are the above correct?

Whether the answer, I think these new findings do not yet explain the
problem nor point to a correct solution. Apart from the added
descriptor, all of the initial enumeration events seen by usbmon is
identical in the two cases.

Minas, were you able to have a look at the info I collected?
Do they suggesting you anything about the dwc2 driver?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
