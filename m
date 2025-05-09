Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810F220F58
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782599; cv=none; b=NrNI2zZ2ch+7O5sTDl+//ZID78xrjKuQjfzOBksirh1cSn9D1VJlE9lQ2vKT5yYx8y0eCyiW3pMYN1NA4FUg04/0d4BkEH+paxUUP/iCa5kLybEJGQHcritMk9T6HeYVwkLbGWfH5yT8bSR85KKINCOPelfcoWaPUUjiv/4jgqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782599; c=relaxed/simple;
	bh=nbUdKnSjm4LnOuyzo/lWOvIEbOAfnZHdu678REqEbkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sYNd6pm8fIoJh4gCW9lRTMudsLKyQGGfgdQDP8YGzlcXhz74B0xfD4sCFcE0uRD5re4vLJpwPFb7pmMNjJ173+Jj7gDPDJoqLxNr8yH2bS+ItdYJKmZi7X8D7Mh53zeDUySOtbSRqVr6VxWNdnjVKkTnvoi+l+td31+aGmSd8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cacheline.de; spf=pass smtp.mailfrom=cacheline.de; dkim=pass (2048-bit key) header.d=cacheline.de header.i=@cacheline.de header.b=bcfaLdxd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dEli/C46; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cacheline.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cacheline.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cacheline.de header.i=@cacheline.de header.b="bcfaLdxd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dEli/C46"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C0B5713801E0;
	Fri,  9 May 2025 05:23:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 09 May 2025 05:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cacheline.de; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm3; t=1746782595; x=
	1746868995; bh=viP7kjlIVlpBSBpxSKbfEK6gKGtSEFGuYX1YWNLPR6U=; b=b
	cfaLdxdElqb/vfLGCHY9Rw+E5kzUXzFLWcdjgFHOwy2Mt3paLigZmlM/gX14He1r
	NgGqAzW1G26Uf6Xhpq6Jx065niv28iIZyMZcTnjx25kFtk/3iZVVvJ0awNvw1N0D
	Q4vvRTyrLb6Js0FT8S91mfEeV+520/aWmDRh6T4PPH3lmK1l4mR/4BCkewq0wk7Y
	sDlpqmTa4JzvyJlQo2S5xa28qCnXg7HOq1LGJI7/vYi/+FQ72H0cTkgy/c6QCKEG
	UZu/Ols2zljvkjs1HSDTVg7ktXVUi/LRhdiZeYJbFnY6QimOw4GH2EpHn9ySXNFa
	N7/C+VC5OuLx2hFVeNx8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746782595; x=1746868995; bh=v
	iP7kjlIVlpBSBpxSKbfEK6gKGtSEFGuYX1YWNLPR6U=; b=dEli/C46v68Px9Yzu
	aAW4euSH5Z0JcDufEr1fVLPL9PmkyQ/iB1irYavrcE7Ncs02IRls1jw8Qgyp0YAJ
	vA0wVvmzh219HfsM6lqiRQuMco4J/E24mxJFLZtrOUE7PqIihBo1B7X4wlLD8Hq2
	ddvBM+4VWSovqZBUhgWK7eexFf0QvrfEs86x6WXzAFfcpRqMgncCEc9f+uW1/g05
	0f0uXzl0LE4uJBoNMbtP+/ePzA91bjfc7fEN60ofY1CuLvsMNmU6kiZ9J185NlJL
	YSl1BA47g1ILSbnBWgcVN1tQ3EuwUJluxnZXyJzLgxMhWx1tyJSdHScigbxzTsDe
	R7yzA==
X-ME-Sender: <xms:gskdaHhdC9RLJTSx9rxy2AGotZVnfOfFwvYa3t1qMzBealfqUQCkAg>
    <xme:gskdaEC4ZgHDpv7hqsJZvv0av5zsQim5s8jjr2TnER4DnnqLA8e0Y8GHK-B82VJz5
    _gXx4oB6A-LokQRwQw>
X-ME-Received: <xmr:gskdaHFLpjRti3T9JSkNE_lceh02KeKPR4tRLv5sPWFhxKl7uhJf9snaduMHxKNdR1n2q4svgWVXvddM1rMf2ALQlIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkgggtugfgjggfsehtkeertddt
    reejnecuhfhrohhmpedftehhmhgvugcuufdrucffrghrfihishhhucdluggvvhdmfdcuoe
    gurghrfihirdguvghvsegtrggthhgvlhhinhgvrdguvgeqnecuggftrfgrthhtvghrnhep
    uddufeeuvdevtdffkeeuleejfefhfeelhfdvgffgueeukeetlefhveegveeihfetnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrrhifihdr
    uggvvhestggrtghhvghlihhnvgdruggvpdhnsggprhgtphhtthhopeduuddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhi
    gidrtghomhdprhgtphhtthhopegurghrfihisehlihhnuhhtrhhonhhigidruggvpdhrtg
    hpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghpsegrlhhi
    vghnkedruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgt
    phhtthhopehhphgrseiihihtohhrrdgtohhmpdhrtghpthhtohepjhhohhhnrdhoghhnvg
    hssheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopeigkeeisehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:gskdaEQRpaGKBc2plN1EwY66j7rW7CpGh2fSuIzMYnFkRw-uyDeF7Q>
    <xmx:gskdaEw2vz8iPSEankoDONMW2M86Hq5WGIg8v44711imMrS2eRUZ6w>
    <xmx:gskdaK4CKWaEfR2ig3AmH2Xc10B8UzyENYh4FLywK-soGIDFSCav_A>
    <xmx:gskdaJwJ5Cbc-h39Z0JpKUnKD7YDcsw7XM8ekzvaS7XRHHPBbTV55g>
    <xmx:g8kdaA1Mluu4fcCSCpKyF77H871OI18LJ5hNRmk1I-aUVJDJJ3aFkpf9>
Feedback-ID: i7c5149e1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 May 2025 05:23:11 -0400 (EDT)
Date: Fri, 9 May 2025 11:23:10 +0200
From: "Ahmed S. Darwish (dev)" <darwi.dev@cacheline.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 02/26] x86/cpu: Sanitize CPUID(0x80000000) output
Message-ID: <aB3Jfta9e9fdqZFs@lx-t490>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b0c87e0-d98d-4394-85bd-8abf556ebf0f@citrix.com>
User-Agent: Mutt/2.2.14 (516568dc) (2025-02-20)

Hi,

On Wed, 07 May 2025, Andrew Cooper wrote:
>
> On 06/05/2025 6:04 am, Ahmed S. Darwish wrote:
> >
> > CPUID(0x80000000).EAX returns the max extended CPUID leaf available.  On
> > x86-32 machines
>
> How certain are you that it's all 32bit CPUs?  AIUI, it's an Intel
> specific behaviour, not shared by other x86 vendors of the same era.
>

Sorry, I missed responding to this earlier.

You're correct.  I indeed assumed that for all invalid CPUID queries, the
CPU repeats the output of the last valid standard leaf on /all/ x86
machines — thus CPUID(0x80000000) behaves this way also on all x86-32
machines lacking an extended range.

I've done a quick check on some Intel vs. AMD machines, and indeed, this
is Intel-specific.  AMD machines just return all-zero instead.

(The patch content is still valid, and I guess that's what HPA was just
 hinting at further down the thread.)

Thanks!
~ Ahmed
