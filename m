Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8E190685;
	Wed, 11 Jun 2025 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656894; cv=none; b=qLtF+qmgNDVRfpwP7kemhLxD10mQ/amMB880M2iPvpIpSRviyPInGRLK6G0Qy/Cq/ZJtS2VNPj/yee+Qmxj6ABPc82Gz9439rE3zhRlGrB/ioph5d+QuqSU2d8iXpX2abb1XMqu5St3uXGpub6jOd+u616uE1pDq5FEFid24VOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656894; c=relaxed/simple;
	bh=hQQEGVz2oEM93X69eaFCEcRjw0sJxSCN2d+An8i2jGA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DV4bMTtkFjnz5o9m0QLu4r7lAljGIChYKVChSWJ2KSZ8MGYEkk4fsdOE9aJJRdYK349EomKCHkwfPxA4W+HanTuLoSz+M6TcU/X/CvidxN0m4d5D6t+GWNRw9iVit2BjMQTblHenahCN/tZQTjbRp5yT7HDtqmjmq46YMBou0MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=X3Of+/XD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JQp98/A2; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="X3Of+/XD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JQp98/A2"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 7032C1140266;
	Wed, 11 Jun 2025 11:48:10 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Wed, 11 Jun 2025 11:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749656890;
	 x=1749743290; bh=hQQEGVz2oEM93X69eaFCEcRjw0sJxSCN2d+An8i2jGA=; b=
	X3Of+/XD76EZIVDzVoWaLE3lOKmT33GxAwSp4oCQd9JYvsAbpj6pc/53HRBC6dyj
	eho5L7RW+SdUFiI6yG9eiVfvl+xYk9EBoxPmvnA6pE3C1p0grSRUEZyjk6W0c3G/
	Ova/tbsGCya0ZF3dDXz5XatqhlPfdS7/puj/YRI8bw7X76SGFRbe0/bZdCW+zx2j
	njDcGFak9UerxLuhj+EzK4HIsoi1/y7pSYgbedM5nVXWuUHPnPrVScM4D0ZwIoaj
	93IEaZRP7EOQ8cE1XfFeTuW6s69v/vXAuInDaY3CKPKkN4JszILZ7/GWKmC6xza9
	HlQq/etTI4cYbQxA2dcURw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749656890; x=
	1749743290; bh=hQQEGVz2oEM93X69eaFCEcRjw0sJxSCN2d+An8i2jGA=; b=J
	Qp98/A2TiwuTjKWF+0D2igDXosCZzZFVY0MKIWUaiNxfyTbGNvYZ8H4G38cMqaNG
	9yMeng+MXA/HGX4e7UM/MzxT4v5cn3mzgj0cxgvq/YMv/SOAF97Aad8r68CxyEeI
	MTYj0seofskEb7FbaO5Ln5qeyND0nZA4NcMayW55IE/tS6Jbx5mJ/z8w072XfnFc
	fXzCGUDAz8wMtHkymQqiHguWkzbMfKtBYyDH/lMXi7SlwVirz2RlHdDFX9lSyUyX
	UPtgdW+abJIU/7l9dQX8b3NqHRpbpN5UdJdiD27R0AKkY9PqpAG2DOS5jVl93OgS
	o9CgMqy2wPRLeDVwSzHMQ==
X-ME-Sender: <xms:OaVJaHzghqFRVqOiOLkIyjSWB_lXpi8sDr5tDjt26U_yUmrWYH7eFg>
    <xme:OaVJaPQYY7Zb12KWq0TPeyarazm60DI-3RfJwCigbgX37AIOvJb2Vu2z5NSOP5ril
    rEDKv-u-Tc4-veBvgM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfevkeejueeukeef
    hfelleejheeuudfgteffvdetkeffjeduleffvdejkeefhedvnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehikhgvphgrnhhhtgesghhmrghilhdrtghomhdprhgtphhtthho
    peifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehhmhhhsehhmhhhrdgvnhhgrd
    gsrhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhi
    nhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugi
    drihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlheslhhi
    shhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehhuggvghhovgguvg
    esrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhhvrghnuggvrhifrggrsehrvgguhhgr
    thdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:OaVJaBUw7UBc8EJ9EMMIOoXlBIDNET9Kb1sqbHAXm7o00BfarBfZRw>
    <xmx:OaVJaBjDb4xy3kppbzzMqEEf4DLP3vdwnauMy7nQM-1ukHSTT_MIPw>
    <xmx:OaVJaJBlQRthaqR2Oeo8iQ04htQkswflgyx2O0RsmwCG5p8nVD4brg>
    <xmx:OaVJaKI6vl1McZNEeHnYonA6eFhtOwtO02EoBNO5MAu-E6NFkFAYPw>
    <xmx:OqVJaPtrdSdDe6kTahyWgyQR-9H_uVKYQ-KZtohpLPpMQL0x4uY4Qepz>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ABFE12CE0066; Wed, 11 Jun 2025 11:48:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Wed, 11 Jun 2025 11:47:49 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Jelle van der Waa" <jvanderwaa@redhat.com>,
 "Hans de Goede" <hdegoede@redhat.com>, ikepanhc@gmail.com,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Message-Id: <dbdcd6fb-a84d-47fa-b3d8-d161d8a1b361@app.fastmail.com>
In-Reply-To: <aEmbwiciy81fL58O@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-1-mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-2-mpearson-lenovo@squebb.ca>
 <aEiVHXI4vS9BDOPW@smile.fi.intel.com>
 <002d39fe-44ed-45a4-9410-4fecf1c2163f@app.fastmail.com>
 <b8af4da0-bd7f-1d65-8645-73dbd08ff3a8@linux.intel.com>
 <aEmbwiciy81fL58O@smile.fi.intel.com>
Subject: Re: [PATCH v4 2/2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025, at 11:07 AM, Andy Shevchenko wrote:
> On Wed, Jun 11, 2025 at 06:01:36PM +0300, Ilpo J=C3=A4rvinen wrote:
>> On Tue, 10 Jun 2025, Mark Pearson wrote:
>> > On Tue, Jun 10, 2025, at 4:27 PM, Andy Shevchenko wrote:
>> > > On Tue, Jun 10, 2025 at 03:28:25PM -0400, Mark Pearson wrote:
>> > >> Create lenovo subdirectory for holding Lenovo specific drivers.
>> > >
>> > > Assuming Kconfig entries have mostly been copied'n'pasted, the re=
st LGTM,
>> >=20
>> > Yes - no changes from what they were previously.
>>=20
>> Indeed, no changes, too bad that the addition "depends on DMI" was mi=
ssed=20
>> because of that ;-). I've fixed this for you to not delay this patch=20
>> further.
>
> Oh, thanks!
>
Ooops - sorry! That was bad :( Thanks for fixing.

>> A diff-of-pre/post magic trick helps to validate while preparing and=20
>> review move changes like this:
>>=20
>> diff -u <(grep '^[-]' patch.patch | cut -b 2- | sort) <(grep '^[+]' p=
atch.patch | cut -b 2- | sort)
>
> AFAIK Git can do something like this for you (patch to the patch) or `=
b4`.
> Never used personally, but interested to try if somebody tells me what=
 to
> do :-)
>
>> The sorting is not always needed if no core reordering is done in the=20
>> patch but regardless of sorting or not, the unexpected differences ar=
e=20
>> usually pretty easy to spot from the output of that command. It's how=
 I=20
>> found out the lack of depends on DMI on the post side and have found=20
>> plenty of similar issue when changes are rebased/reordered in a serie=
s=20
>> that does contain a move change.
>>=20
>> While applying this, I realized I'd taken Jelle's ideapad patch which=20
>> resulted in this move patch not applying cleanly, so I ended up movin=
g=20
>> Jelle's patch after this change to make things easier for me.
>>=20

Thanks - hopefully this doesn't cause you headaches for the rest of the =
window.

Mark
