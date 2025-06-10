Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39B01A0BFA;
	Tue, 10 Jun 2025 01:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749518842; cv=none; b=dbZcLPXMOB3OX+lSFU4kNOC2c8Gz312spAMQfKp9yiGq7boo//cqWSVGpN0OqhchyNFcZuHvkWJI945absTIDI4kiKYea1ycE7IkI25W8F5mZDYLNdPsKLNnQfsATOhSwB0WiE4SOnOKHTvs4ygR4giemHyfo4y4RmzcquKzfns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749518842; c=relaxed/simple;
	bh=lababK9PXv3X/Hak6+Il/2t+egD0njFbW7VWIq9mylI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KXWPQHVc4khxR8t1tF06kTdUd2LW/Jz2u6z5r3P0M6mPT6HB4i7Z1Rb/1X82Yphj7e/Ceu1vLTH3QPC5y98V704sJFTknc2KWb7gdo+GfgsdbxOn6zBsK/lB7u+aOo3rN803jUmn10ZOc4rCwED2tuQB9M8C3WJEughunGRZB28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=PpSBxSUi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m0m3HEhr; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="PpSBxSUi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m0m3HEhr"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8D0D7114026D;
	Mon,  9 Jun 2025 21:27:19 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Mon, 09 Jun 2025 21:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749518839;
	 x=1749605239; bh=lU8nvWLBcjap5Wuv+m6wHzcFE5BeUJSBjblgsXqqq00=; b=
	PpSBxSUisBidWcuqEbAZZpZE4tsuxGDlcoYfgFc5AsoMNDC+yKsgIUn6KVHRzh3O
	0q5MUdtIIgJPgLYa+j+bU0t7gLLJRdFK9WksOoTqaThMKpGNLEsoMnG8xyCxmlfu
	OFbHPkuct882I8+S3UKpY55taP2l/xDqn3+LWuHSRKYEZu92adfObM3MEe+tAQ03
	z167lsY9fYVpAjItO2jfFhBDH7qrM77w08ca9+/TcWq32JtRqWBzUYdXvdMd//KD
	ySxMc2xF9aEit7CvE0h8IGI8/KJdbqhNqG4OS2bja85IhcYBidUhVhTPf4Gl1Lqe
	0AKm/pIvOBhqXQjlh0UY6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749518839; x=
	1749605239; bh=lU8nvWLBcjap5Wuv+m6wHzcFE5BeUJSBjblgsXqqq00=; b=m
	0m3HEhrWcOrap9Qbh9dIoSTPvmaPrdSn89gkWt18MuviMsYiQRTHUL2RTtVwdYYr
	k5fNZwSHSey68wgPzCAa/fKwwYQCUf85TbuJ3v9zMy6GwlDlNWcMCx2dq1ZA7jTa
	dbUXATKrVZUehKKGQCAkqP+u8RpaX3BNzs6E3972mFA5KN8XPnOaEmxpdEK7WhM+
	/v/mrx/rvQlDlaG1fvbFPKaw2eXZx2nFNfSXbQCZhUhwoH9z1Y652xl/5JFt/9kt
	rtQrDJ8P4APDQFIx+74wnwbMBt24Guh53rVOsijj5qSB5WQluVVYumJpA5KyNUGV
	9KB1vIR7z7o2uz/+KbEbQ==
X-ME-Sender: <xms:9olHaAKX1uFh-W2JLPV6iZzg27Nov5PvvCbCCI0nRNas8Z8pv5rWwQ>
    <xme:9olHaAI02C2-Z3-z_7UOKi4-lrUZo3tHjCQn5VOJzSJHvT8F8nGUQPgl07gVjDlAl
    -vGN3M1zxDNcQK1dg8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnheptdffvefgtefhveet
    uddvfeelveektdduvdelgfehgfeikeffjeetjeevffektdfhnecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprh
    gtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhkvghprghn
    hhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfigprghrmhhinhesghhmgidruggvpd
    hrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpdhrtghpthhtoheplhhkphesihhn
    thgvlhdrtghomhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnhes
    lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghpihdquggvvh
    gvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopegtohhr
    sggvtheslhifnhdrnhgvthdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrd
    gtohhm
X-ME-Proxy: <xmx:9olHaAtJAGm73zapfHZ1rJNwHJTenFu-ywA75RGz1MTDcUWO1YkqzQ>
    <xmx:9olHaNZnxht25yuYzQPX88yHYbv7CvZjsXts0c4nbvk71NZ21Oq5aA>
    <xmx:9olHaHY-UJ7rmXhxSRKvKPUsLPXVE7pvCvVaZwsrx7EanPl7O8iHdA>
    <xmx:9olHaJA49-mi2Ft4xU2RTqmkX1B00UH1GknOrljJqZr9xYzL5Kr2Wg>
    <xmx:94lHaM7f0N9FRe_JvxmxNth6XUnV3FzkytPDefQrRNwxQZxarXK4Fd0D>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B54F62CE0063; Mon,  9 Jun 2025 21:27:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T95b0e86a2866f664
Date: Mon, 09 Jun 2025 21:26:58 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 ikepanhc@gmail.com, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "kernel test robot" <lkp@intel.com>
Message-Id: <7e0d5241-e82a-42e3-b6ac-ffe9ea42a897@app.fastmail.com>
In-Reply-To: <aEdBy6m_6aQr8l41@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-2-mpearson-lenovo@squebb.ca>
 <aEdBy6m_6aQr8l41@smile.fi.intel.com>
Subject: Re: [PATCH v3 2/2] platform/x86: thinklmi: improved DMI handling
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Andy

On Mon, Jun 9, 2025, at 4:19 PM, Andy Shevchenko wrote:
> On Mon, Jun 09, 2025 at 08:27:25AM -0400, Mark Pearson wrote:
>> Fix issues reported by kernel test robot.
>>  - Require DMI for think-lmi.
>>  - Check return from getting serial string
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/
>
>> 
>
> No blank line in tag block.

Oh - I'd not come across that requirement before. I can fix.

>
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
>>  - New patch added to series.
>
> Shouldn't it be the first one in the series? It seems to me that this is the
> fix of the original code as well.

I guess. I'll re-order.

>
> ...
>
>> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>
> My understanding is that you need either Kconfig or changing C file.

Does it matter? I figured both were valid. Adding the DMI to the Kconfig makes sure it's used and checking the return code felt sensible.

If you object I'll go with just the Kconfig but I thought the extra check had value and was related to the reported issue so did it as well. Let me know if you feel strongly about it.

Thanks
Mark
