Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312F288A8;
	Sun, 29 Jun 2025 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751229437; cv=none; b=ZCEuT7xT1Z/JDhGVwV9Wq3DPhtKH7z/kdGVEjAObp07DCUFJ2ypzMLXXxpy4Dm7TRnGz1PsObMWZD34Vj1Uvi/GQTnU52XHky0Vy7mNfHJ7dAVP7n76ZvGQN8KRnYancSYKGImVqoytmkR4xRY0XE9DY1imgIMN/cA7jeApzf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751229437; c=relaxed/simple;
	bh=xkCrKZ4b34v3DhYT0LOfv7Tf8ZKD0AFx3TJaxGTwQ2Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=W6elo/OMi8wcUrcga4vkcmUS1E4UuopnZdDYb7hOSVS/fE9FskKUfKYwWPdr3MjxspOsLwiQKlJ9PmRBpkEN+ymKTqPIdOrP4n/dg0Mauw5GDoyx7hp1KihQ58RGiuOUOUv4WMeQG4FUAHydSuLukLJQGBZwwHF2qYI4M2jR24w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=U0/shR2q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gOEvyyPE; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="U0/shR2q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gOEvyyPE"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E06061400111;
	Sun, 29 Jun 2025 16:37:12 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Sun, 29 Jun 2025 16:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1751229432;
	 x=1751315832; bh=LP6McOTsZ5t8dM3HbJrxNhMDYor79d2tpRu9hZs1ASI=; b=
	U0/shR2qbxydbebEtUZg/LiEhlH2ox6/AC51VExpRsxicEC5nEiYJCzqp2ES5Ctn
	Ex0zwrSJuvZVlEjbpyjXDPFGjXboIBIO8bRRC+XKZ5/Lfpxk5pIGXkr2W4hSTRYd
	8mFl6ikIcpbgMjzGEXHzeK1ATaqQMZwwwHF+a4OoyeYcQ+89sHAJ5Q/EfY3nQinw
	RN6KTMswOFwiZXv0QEAOP0imNFW4ANGYipSSEW36wUscdQDTpAKZ8tMnoduHlJLK
	DsdWesaGSaITTGPd57TZbJfauoAH/WfmXj4/OCJVXifHOsFrT9x3s1b2zLbP28XH
	Q7jA8Nu4qYX1ACuSCJ9N5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751229432; x=
	1751315832; bh=LP6McOTsZ5t8dM3HbJrxNhMDYor79d2tpRu9hZs1ASI=; b=g
	OEvyyPEhD81rSqgl5SL7yxYLwtwBl0ViQtvtH5e9MoAqU1QKa5S6fqceXNsiRAue
	wzVCUXigacEyMcQC02+I3uAixhaCXtt+pa1n/WD1xH/AbULZjhsxpzhv8KfdMtVE
	ErL8srTQYuAB88aFOkWHXfdj+wedWA0H9tk/9FDvoENTucBn7bSYh90uTng1rQtT
	swWaVifXYetQCyFq5OeD3OlmT9RfskKWtdeI4P/PPUmKmb34SphjQD84bFx0Sl5z
	dNn7IZktSfBhZBeQFNMNfZswCjTKbfdQv+m1dm2tRwe94s0JU5KPn4Lc2NPSWw59
	+GI1nCxb1tln62KEZItog==
X-ME-Sender: <xms:-KNhaK3RP8i1C9z740RHypHd7BxLE_2312GlD_XQhZAE_iMZDUUfEQ>
    <xme:-KNhaNHQ_zJFsxmogSWmysan45h1Av3yibz8yKbyyQ4MEguWw53Y5oAnF2R1JL3hU
    jzQg8vcdIqxY37kleU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhkucfr
    vggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqe
    enucggtffrrghtthgvrhhnpefhveekjeeuueekfefhleeljeehuedugfetffdvteekffej
    udelffdvjeekfeehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggp
    rhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeighidqjhgrtg
    hkihgvsedufeelrdgtohhmpdhrtghpthhtoheprghlihhrvgiirgdrsggvshhtsghohiih
    sehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghtvghstghulhgrsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepkhhuuhhrthgssehgmhgrihhlrdgtohhmpdhrtghpthhtohepfigp
    rghrmhhinhesghhmgidruggvpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslh
    hinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughh
    rghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekiees
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-KNhaC4HlEJgdih6N6bEfbwX1qIJtQw4dVhEu-vd8vw4NCGCNnkavw>
    <xmx:-KNhaL3OxR5VsB5km6XPCSQlttqmd2GPJqc29J4qVYQ68jTJKWAQaw>
    <xmx:-KNhaNGYdooI8S_kqn7b3bIzLyjmyynUR2iRdIzJhvFiYIwhgLnkbQ>
    <xmx:-KNhaE9zXSHJMy-dcAxREzhM5mOInR1B-afClLQwIFiZbyIwAJK_EQ>
    <xmx:-KNhaBNTeqhGEbH6fCUhmaaDjdRxpTA46-eMcGdgZsY_9-6M7jehR3qM>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1FC0C2CE0071; Sun, 29 Jun 2025 16:37:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T706dce5c18d1b324
Date: Mon, 30 Jun 2025 05:36:50 +0900
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>, "Kurt Borja" <kuurtb@gmail.com>,
 "Jackie Dong" <xy-jackie@139.com>, alireza.bestboyy@gmail.com,
 atescula@gmail.com
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <7f2496e7-7092-46a2-885f-8e8f44fc0af1@app.fastmail.com>
In-Reply-To: <50361e3c-c947-4df8-97fd-4963d18ee4f2@gmx.de>
References: <20250627195436.3877-1-W_Armin@gmx.de>
 <DAXLSMRH9E6Y.3Q8Z59YG2B50C@gmail.com>
 <fb08672d-881b-458c-b8ed-1a27ca93fe7d@gmx.de>
 <DAXMVOI4AXHY.18HUV9THTG0DJ@gmail.com>
 <50361e3c-c947-4df8-97fd-4963d18ee4f2@gmx.de>
Subject: Re: [PATCH] platform/x86: lenovo-hotkey: Handle missing hardware features
 gracefully
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Armin & Kurt,

On Sat, Jun 28, 2025, at 8:01 AM, Armin Wolf wrote:
> Am 27.06.25 um 23:29 schrieb Kurt Borja:
>
>> On Fri Jun 27, 2025 at 6:17 PM -03, Armin Wolf wrote:
>>> Am 27.06.25 um 22:38 schrieb Kurt Borja:
>>>
>>>> Hi Armin,
>>>>
>>>> On Fri Jun 27, 2025 at 4:54 PM -03, Armin Wolf wrote:
>>>>> Not all devices support audio mute and microphone mute LEDs, so the
>>>>> explicitly checks for hardware support while probing. However miss=
ing
>>>>> hardware features are treated as errors, causing the driver so fail
>>>>> probing on devices that do not support both LEDs.
>>>>>
>>>>> Fix this by simply ignoring hardware features that are not present.
>>>>> This way the driver will properly load on devices not supporting b=
oth
>>>>> LEDs and will stop throwing error messages on devices with no LEDS
>>>>> at all.
>>>> This patch makes me wonder what is the policy around issues like th=
is.
>>>> In fact I've submitted and changes that do the exact opposite :p
>>>> Like commit: 4630b99d2e93 ("platform/x86: dell-pc: Propagate errors=
 when
>>>> detecting feature support")
>>>>
>>>> IMO missing features should be treated as errors. i.e. The probe sh=
ould
>>>> fail.
>>> IMHO the probe should only fail if some features are deemed essentia=
l, like
>>> required ACPI methods. Optional features like in this case LEDs shou=
ld be
>>> handled by the driver in a graceful manner if possible.
>>>
>>>> Quoting documentation [1]:
>>>>
>>>> 	If a match is found, the device=E2=80=99s driver field is set to t=
he
>>>> 	driver and the driver=E2=80=99s probe callback is called. This giv=
es the
>>>> 	driver a chance to verify that it really does support the
>>>> 	hardware, and that it=E2=80=99s in a working state.
>>>>
>>>> And again [2]:
>>>>
>>>> 	This callback holds the driver-specific logic to bind the driver
>>>> 	to a given device. That includes verifying that the device is
>>>> 	present, that it=E2=80=99s a version the driver can handle, that d=
river
>>>> 	data structures can be allocated and initialized, and that any
>>>> 	hardware can be initialized.
>>>>
>>>> Both of these makes me wonder if such a "fail" or error message sho=
uld
>>>> be fixed in the first place. In this case the probe correctly check=
s for
>>>> device support and fails if it's not found, which is suggested to b=
e the
>>>> correct behavior.
>>> The driver should only fail probing if it cannot handle some missing=
 features.
>>> In this case however both features (audio mute LED and mic mute LED)=
 are completely
>>> optional and the driver should not fail to load just because one of =
them is absent.
>> I agree, both are individually optional, but at least one should be
>> required.
>>
>>> Just think about machines supporting only a single LED (audio or mic=
 mute). Currently
>>> the driver would fail to load on such devices leaving the users with=
 nothing.
>> That's very true.
>>
>> But I do still think if both fail the probe should still fail. Maybe
>> there is a way to accomplish this?
>>
>> I'm thinking of something like
>>
>> if (lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev) ||
>>      lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev))
>>      return -ENODEV;
>>
>> What do you think?
>
> Normally i would agree to such a thing, but in this case the underlyin=
g=20
> WMI device
> supports many more functions that are currently not supported by this=20
> driver. Additionally
> the driver cannot control when the WMI device is registered, so it has=20
> to be prepared to
> encounter a device without the features it supports.
>
> Also keep in mind that a failing probe attempt produces a irritating=20
> error message.
>
>>>> BTW this also leaks `wpriv`, which would remain allocated for no re=
ason.
>>> wpriv will be freed using devres, so no memory leak here. However i =
admit that there is
>>> some room for optimizations, however i leave this to the maintainer =
of the driver in
>>> question.
>> Leak was a bit of an overstatement :) But if both features are missing
>> it would be kinda leaked, in practice.
>
> I see, however i would leave this to the maintainer of the driver=20
> because i have no hardware
> to test the resulting patches :/.
>

As a note, I'm on vacation for three weeks and avoiding accessing work e=
mails, so won't be able to discuss this with Jackie properly until I'm b=
ack.

For history/context - this particular driver was a bit of a oddity as th=
e Ideapads aren't in the Lenovo Linux program (hope they will be one day=
). We had a Thinkbook that is using the same LUDS interface, that we wer=
e Linux certifying, and LED support is a requirement to work.

I do think this needs revisiting a bit. I am leaning to agreeing that it=
 shouldn't error out - but we were also being careful to not have this c=
ause problems on HW we ourselves don't have access to. It would be nice =
if it could be extended to more platforms though.

I don't have the specs handy right now (would need to go on the Lenovo V=
PN for that). Is it OK if we re-visit this when I'm back at home and wor=
king?
Jackie - please do have a look and think about this in the meantime.

Mark


