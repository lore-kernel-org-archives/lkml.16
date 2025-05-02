Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EC242A87
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746208567; cv=none; b=d//IJgI2LJiaEy/akt5GdLPiirpWwB/f41AEo9sO1241KjjDsIWWGxSvYBmaIFD09T0B52Lkmoiwb5a9GcxNrnOUa164tL4HvZrxWn80Pz5M+uhqL55MtpvFJeudWNFJowQmfklFCK9IQrk8zf7nX7iQ+sB5VB+N3tCRbzo8yes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746208567; c=relaxed/simple;
	bh=KvveWAjwqVFgssku8tGZhCRRyNqTYVRXhVVXsdUCYdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxZTOp3kpF6ippNcpsP0qEJRSKsgBgiswd3PTUbtXzg7UNDgIQmfCZtVyxNWVZcXC132hEYnVhGZL2QsoBNZSQPiiNQSisspTVwKWvZBE/W1PpnmQBlmqxemvHzGa0VIKSo8emYeQzBKazSRPhqcDwwJY0Jo4b2SDGnyejdWTC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tUnKdhdP; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tUnKdhdP"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4768f90bf36so28180921cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1746208564; x=1746813364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8A+uE7zMHwtLlOZkAqNpBHirPhVQLpUhDkZtF/8t/a0=;
        b=tUnKdhdP9IioN+ReLE/pGUvIKVLlO+p+3gA8GQOfVL6lNM4dsEFkudqXsPjHTJjY+f
         b44f7X75HTVy7ybAtZ4pWFwjNLg1toLC2qozzrNCP8Jitci2Dx8TCnCOSKhyluYRYWKw
         /23ZcuYwX4+h3Gi9oHAoTHvSIh8Fm0iIWLevp3tSmVaqSIvJTAmrTwbXR0QLpeGKHMRi
         ZiWSMG+eP/0LwS1K3AFYOKxD7vqTssi2E/fevEdB7b0LD4aJsnpU1vRHI0opgknU3Wx9
         Ts+4ibFNCqp7CTqXRgL56W1ENlpOtWSk8/O3WcP23B1ho1adf6KABYZztfwFeAHt5BP/
         0r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746208564; x=1746813364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A+uE7zMHwtLlOZkAqNpBHirPhVQLpUhDkZtF/8t/a0=;
        b=Msb1K2HSHZgZScnX8pvnwkj2zGC9hwzikp9PgSjP66ylHsr4zcQKHNKz6QOrnV5ram
         RCX8UMbjDpCsk2ON7wogrYXoHaOwXd9hLr9nN90mDaAxefnUyoMKhFFXeSqtKHpLRlcq
         rU5aBPslVvI9+MJv0fYwdn6vCgJVX0V/+/HruI2zwShxuLGliKasXnU1C7IB/ETmIiIw
         GkDRHHAUj1YOd2cBHliOXINT0TMXlVF+bisl3uEnjf03gS5jy3lQM6dxyYRbr1lOIOHW
         M12Fnms1EJErBJMKH9icoiH2sZ1ShufwXIXZsOrTwoBNRybjH6y0qrc+72e5hsbTrrxv
         GoUw==
X-Forwarded-Encrypted: i=1; AJvYcCUHnO9LIbeGauySZd2PkviJb1xF2kYEeUlNXrlGGFLyDMB5OaMEuXaF9jrS+3S363BU2amIb5iXTFT1z1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YziflaJ3DU5jxl6bF8bYNNhT7Y3lAfqQxxyKRwRLH/NNXhmvq3n
	CRH9wDBFsgiNZk09vjTVq2kFgmQ8VLCllwG656MvZme9sskzjXyhgMkgOsKLQEPQG7UbvH+aIqo
	=
X-Gm-Gg: ASbGncv/MQ8i7YV0iHBitTYtIegoHrijygQRP0HcdIHhC2z5tf05oK7KwtCcedEiNgU
	2kJTdXjKCS/PL7KKzFbV0RP1QqE90qJqNX7gHuXst/Ck0CEQj7kGyRM4seUE7TZ1DOi2LvYqXFt
	1RFH8gW+0jHcek8wASYmHP3oLPkYHriFJeYfSVzMBdIXlYgHPY34rZ9KwaBGpPhqWzSuk6Nei4n
	Il0CRm1Pfhw6w1Z9Y3JlWtvx1cOh7n1g6LAKCjIvaQrxF2PhN18MGY3vM14q3Py0lqqrpxUdc3m
	fmgct0jUw0jsi7ksLgxjxi5fvy51En5Fsfhq6r4rjZ2/d6eONICIchtpGEsmse3POh3cUYC6JNp
	DT9W5Gs6Ke7Fqgx/Z7pbIGDoEOs/XxyCWSEr1n7pQYFAj
X-Google-Smtp-Source: AGHT+IHjImMh9GFj90QT1j8aWcdS/wU5nityrf44gpoeLEocPGs8cm/kHTdPtLX+BT0XeJiGxRlytw==
X-Received: by 2002:a05:622a:1b2a:b0:477:41e5:cb8d with SMTP id d75a77b69052e-48c32fbf01amr57673411cf.44.1746208563948;
        Fri, 02 May 2025 10:56:03 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-16.harvard-secure.wrls.harvard.edu. [65.112.8.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b98d0fed1sm20752941cf.68.2025.05.02.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:56:03 -0700 (PDT)
Date: Fri, 2 May 2025 13:56:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Message-ID: <cc80988c-5941-46f3-8183-f3f9acb7dd5d@rowland.harvard.edu>
References: <20250414185458.7767aabc@booty>
 <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
 <cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
 <20250415162825.083f351c@booty>
 <8c2e18a9-44d1-47b3-8fe4-46bdc5be8d76@rowland.harvard.edu>
 <20250502155308.11a991d4@booty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502155308.11a991d4@booty>

On Fri, May 02, 2025 at 03:53:08PM +0200, Luca Ceresoli wrote:
> Hello Alan,
> 
> thanks for your continued support!
> 
> On Tue, 15 Apr 2025 12:14:58 -0400
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> [...]
> 
> > > > > It's quite possible that you're getting messed up by link power
> > > > > management (LPM).  But that's just a guess.  
> > > 
> > > What would be a symptom, if that happened?  
> > 
> > The debugging log wouldn't show much unless something went wrong.  You 
> > could see if there are any files containing "lpm" in their names in the 
> > /sys/bus/usb/devices/3-3.4/ directory (while the device is connected) 
> > and what they contain.  Also, there's a way to disable LPM on the host 
> > by setting a usbcore quirks module parameter:
> > 
> > 	echo 1209:0001:k >/sys/module/usbcore/parameters/quirks
> 
> Tried this. There is no file with 'lpm' in the name in
> /sys/bus/usb/devices/3-3.4/, and adding the quirk did not change the
> result: still a disconnect and reconnect in ~6 seconds.

Okay, so LPM doesn't seem to be the reason.

> > You could also try connecting a usbmon trace for bus 3, showing what 
> > happens during the initial connection and ensuing disconnection.  Any 
> > LPM transitions would show up in the trace.
> 
> Tried this, and here are the few lines before and after the 5~6 seconds
> delay.
> 
> ffff99621e768840 4009009102 C Bi:1:009:3 0 2 = 696e
> ffff99621e768840 4009009104 S Bi:1:009:3 -115 256 <
> ffff99621e768300 4009009115 S Bi:1:009:3 -115 256 <
> ffff99621e768840 4009009144 C Bi:1:009:3 0 6 = 3a383534 2033
> ffff99621e768300 4009009155 C Bi:1:009:3 0 1 = 37
> ffff99621e768840 4009009178 C Bi:1:009:3 0 2 = 0d0a
> ffff99621e768840 4009009180 S Bi:1:009:3 -115 256 <
> ffff996080f11900 4009009361 C Ci:1:014:0 0 26 = 1a034300 44004300 20004100 43004d00 20004400 61007400 6100
> ffff99621e768300 4009009615 C Bi:1:009:3 0 3 = 5b2020
> ffff99621e768300 4009009624 S Bi:1:009:3 -115 256 <
> ffff99621e768840 4009009645 C Bi:1:009:3 0 3 = 203233
> ffff99621e768840 4009009646 S Bi:1:009:3 -115 256 <
> ffff99621e768300 4009009692 C Bi:1:009:3 0 4 = 2e383738
> ffff99621e768300 4009009694 S Bi:1:009:3 -115 256 <
> ffff99621e768840 4009009703 C Bi:1:009:3 0 2 = 3731
> ffff99621e768840 4009009722 S Bi:1:009:3 -115 256 <
> ffff99621e768840 4009009933 C Bi:1:009:3 0 2 = 7472

It looks like device 9 (the lines containing :1:009:3) and device 14 are 
unrelated to the problem; neither of them is your DWC2 device.

> 
> <<< 6 seconds delay >>>
> 
> ffff9960828e9540 4014796128 C Ii:1:001:1 0:2048 2 = 1000
> ffff9960828e9540 4014796145 S Ii:1:001:1 -115:2048 4 <
> ffff996080f11900 4014796162 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> ffff996080f11900 4014796189 C Ci:1:001:0 0 4 = 00010100

This shows the host system receiving a disconnect notification (for port 
4) from the hardware.  Which is odd, because earlier you said the device 
was 3-3.4, indicating that it was plugged into a hub, not directly into 
the host controller.  But the notification here comes from the host 
controller.

On the other hand, an even earlier email said that the device was 3-2, 
indicating it _was_ plugged directly into the host controller

Which means you've been changing your setup while running these tests.  
Not a good idea.

> ffff996080f11900 4014796201 S Co:1:001:0 s 23 01 0010 0004 0000 0
> ffff996080f11900 4014796219 C Co:1:001:0 0 0
> ffff996080f11000 4014799627 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> ffff996080f11000 4014799679 C Ci:1:001:0 0 4 = 00010000
> ffff996080f11000 4014826132 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> ffff996080f11000 4014826166 C Ci:1:001:0 0 4 = 00010000
> ffff996080f11000 4014852075 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> ffff996080f11000 4014852122 C Ci:1:001:0 0 4 = 00010000
> ffff996080f11000 4014878210 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> ffff996080f11000 4014878253 C Ci:1:001:0 0 4 = 00010000
> ffff996080f11000 4014904049 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> ffff996080f11000 4014904088 C Ci:1:001:0 0 4 = 00010000
> ffff9960828e9540 4014948427 C Ii:1:001:1 0:2048 2 = 1000
> ffff9960828e9540 4014948456 S Ii:1:001:1 -115:2048 4 <
> ffff99621e768300 4014948461 C Bi:1:009:3 0 2 = 5b20
> ffff99621e768300 4014948472 S Bi:1:009:3 -115 256 <
> ffff99621e768840 4014948488 C Bi:1:009:3 0 2 = 2020
> ffff99621e768840 4014948489 S Bi:1:009:3 -115 256 <
> ffff996080f11000 4014948522 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
> ffff99621e768300 4014948545 C Bi:1:009:3 0 58 = 32392e38 31373337 325d203e 3e3e2064 7763325f 68616e64 6c655f63 6f6d6d6f
> ffff99621e768300 4014948560 S Bi:1:009:3 -115 256 <
> ffff996080f11000 4014948607 C Ci:1:001:0 0 4 = 01010100

And then about 150 ms later (the second column of the log is a 
timestamp, in microseconds), a connection notification.  Nothing 
preceding the disconnect to explain what caused it.

> ffff99621e768840 4014948639 C Bi:1:009:3 0 10 = 37395d20 3e3e3e20 6477
> ffff99621e768840 4014948644 S Bi:1:009:3 -115 256 <
> ffff99621e768300 4014948657 C Bi:1:009:3 0 3 = 63325f
> ffff99621e768300 4014948663 S Bi:1:009:3 -115 256 <
> ffff99621e768840 4014948689 C Bi:1:009:3 0 5 = 68736f74 67
> ffff99621e768840 4014948693 S Bi:1:009:3 -115 256 <
> ffff99621e768300 4014948718 C Bi:1:009:3 0 2 = 5f69
> ffff99621e768300 4014948720 S Bi:1:009:3 -115 256 <
> ffff99621e768840 4014948759 C Bi:1:009:3 0 4 = 72713a33

Unrelated material.  Evidently device 9 is running some sort of 
serial connection, because everything it sends looks like ASCII 
characters.

> Does this give you any hints?

Afraid not.

> I'm afraid it's going to take time before I'm able to decipher these
> hieroglyphs. :-|
> 
> Full log is available, if needed.

It wouldn't hurt to see exactly what happens when the device is first 
plugged in.  It's possible, though unlikely, that something at that time 
causes trouble later on.

> However I suspect using Wireshark to capture the USB traffic should
> produce the same content. If it is the case, I have available a
> Wireshark capture as well. The first logged event I see in Wireshark
> after the delay is a "URB_INTERRUPT in", which is possibly matching the
> "Ii" in the log above.

Yes; usbmon and Wireshark capture basically the same information.

> However IIUC both the usbmon debugfs interface and Wireshark are unable
> to capture disconnection events because that's handled by the hardware.
> Correct?

I'm not quite sure how to answer.  Yes, the hardware handles 
disconnections -- because the hardware handles _everything_ that happens 
on the USB bus.  And one of the things the hardware does when handling 
disconnections is to tell the driver that one occurred; that's why the 
report shows up in the usbmon (or Wireshark) trace.

A USB analyzer could tell you exactly what's happening on the wire, but 
they are expensive.  And in this case, I think all it would tell you is 
what we already know: that a disconnect happened.

The fact that the disconnects don't happen with the vendor kernel 
indicates that they aren't caused by a hardware problem, such as a bad 
cable link, but rather by something in the device's software, i.e., the 
dwc2 driver.

I don't know anything about that driver, though.  Minas is the expert.  
You really need his advice.

> I hope useful hints can be found here. Otherwise I guess the only way
> out will be comparing the behaviour of the 4.4 Rockchip kernel (which
> works correctly) against mainline. I expect this to be a long and
> painful process, though.

Is there any way to compare directly the driver used by the vendor 
kernel with the vanilla driver?  Such as porting one of the drivers to 
run in the other kernel?

Alternatively, can one get additional debugging information from the 
dwc2 driver in its disconnect pathway?  I don't know what would be 
expected to show up in the log if the driver deliberately dropped the 
connection.

Alan Stern
