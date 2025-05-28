Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F67263A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431719; cv=none; b=bE0/z6J0VDUiKbe+MSzGm+HB/RsrKnAe6CwDK1vGuLMkjfBYNXJtmyIJOZACeChW4c7RG7h64l+ScfilKx59t20xlDpOBI9zU2sJWSA5YfHeA5fJMPzbYQo32cLgzHRwJ0izRWxk/EoE6zedyOnSpvKGr89Fo2Yc7hH3MY6KRM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431719; c=relaxed/simple;
	bh=YA07hUe6QjKaeuIfZls1CxCPVDZDY4ehCtwH1wvQLx8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aHq5xrb4RjKZQqtwajGtoyLWn85bW2f0jQmlVB0V75RgDmx1dva0Dl1P5ASibcrMHZrMUo8seJcTGLE1jgxFcClG+hqe5tqbk1XEj6pl7LCrxqSrXb5Fcm/vRbnXIPbu78DRdfvJ0pxRk4h+N7jML3uOuI/gMDe9P5TEMM5vzi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WIu8D6o6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GMi2exFG; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WIu8D6o6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GMi2exFG"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 8369A11400D3;
	Wed, 28 May 2025 07:28:35 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 28 May 2025 07:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748431715;
	 x=1748518115; bh=UK4SDTFoZN8a248ZSOnhk+uW54YPVwbFm6eiIbQcacc=; b=
	WIu8D6o6E9C7LLNcCKy//BdY3/1fetFwaeQ4MG2CCr+hh51Hlhf4oC6a5rcY3uqF
	xqDhC+9n5IfDU0z/k6zq0WNADft/V8SgOvANqzgWwnOyC3aiCWny1UTpAAR8lRzw
	RbqEWlpvb70W2xAuh5oVtxiBGc7AVC9WJGFvOGl6HsTwCtAPYOhS5/UxZ4NCJBll
	60xIZosN55MnqV7RPAXdxFAQ1FVfoILiHkYejTcqZDMH5pYjOsJUBfhKJFnvQd42
	S4zZ1tgWSqdSOGgrVHPS7/G6ZirqUfWpsne4uAic84rXj3U+NIU8h3/mXT/Ul7X5
	q1ACdT52xtrmT2UUvj1+xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748431715; x=
	1748518115; bh=UK4SDTFoZN8a248ZSOnhk+uW54YPVwbFm6eiIbQcacc=; b=G
	Mi2exFGhNKU2xnRprEiLAnbC/kJGsehU0ZuRLGt7bypFhK6m4AFnstJR6RkP6M2D
	1s0lIsHY/M0RSkCOoMy/C7w8QHMdAqe2HTEAlSn5ec2RRfruiSG72pmO8waARVvF
	SN03jeQNP4IlPv2nuWDJ2W93gaUxsEdLt9jZtRrS5EEEeagWrYmyip9YKcNMoxxr
	LvrMXAq+WVtmNTLaCAnUk1ifCWJ8VTQWdVn30R3s7V1JNPVRT1682xhMiwo3DtnP
	fFglGzUmXOQj+n9q6VDaVMjBWoGze1yNV/IAvIqkSF8PNs7ltiSOgt7GvnJuuxO0
	40qWRHPNTSKdEJ0ou4rqw==
X-ME-Sender: <xms:YvM2aGzmxBxh29eLSqbNbKqwcQMJkDa5QsNDOzHd__4xnygw1ukM3w>
    <xme:YvM2aCRAYYKfE2x0wo7Tksxog6No-HA_1gQcKV8dii6r4QJWQsQGpjhQH2e1sLgSs
    QWcBnepbT4jwGxfczs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfedugeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeeh
    udekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
    pdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsh
    himhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhl
    rdgtohhmpdhrtghpthhtohephhhimhgrlhdrphhrrghsrggurdhghhhimhhirhgrhiesih
    hnthgvlhdrtghomhdprhgtphhtthhopehimhhrvgdruggvrghksehinhhtvghlrdgtohhm
    pdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehinhhtvghlrdgtohhmpdhrtg
    hpthhtohepmhgrthhthhgvfidrsghrohhsthesihhnthgvlhdrtghomhdprhgtphhtthho
    pehmihgthhgrvghlrdhjrdhruhhhlhesihhnthgvlhdrtghomhdprhgtphhtthhopehroh
    gurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:YvM2aIX_mDM44nwxcZ0hqH8Q1u48GBwR3x2YH85HjW5-rRmL4iJBtQ>
    <xmx:YvM2aMi1NZfexU8rZOrzfBsFR_6g_WFOA9C1ONJxa6vMz2uHAwjsoA>
    <xmx:YvM2aIDa0-O9_cx4ERpI8VxBPYh_HAj_IKsUAfARcG8540buYKOYdw>
    <xmx:YvM2aNKkaUYvLDfano_-zCaUQ6_OgEa15Utmb80fseaYV_VU6mOsmw>
    <xmx:Y_M2aGTAxX8xHCl048q7DmVW1-GFO_UVhj-T6s12Np-nuITOoVi0uXc0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DD8E7700060; Wed, 28 May 2025 07:28:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tea118988e335f97b
Date: Wed, 28 May 2025 13:27:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Christopher Snowhill" <chris@kode54.net>
Cc: "Lucas De Marchi" <lucas.demarchi@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Matthew Brost" <matthew.brost@intel.com>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 "Imre Deak" <imre.deak@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
Message-Id: <dd8f913d-1d6a-435b-b9b6-30a3d950e4a8@app.fastmail.com>
In-Reply-To: <aDbl5CIGulMng3de@smile.fi.intel.com>
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
 <aDbYs7QZRfr2i80A@smile.fi.intel.com>
 <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
 <DA7PSM1WUKBI.3JA6THJTRF5B7@kode54.net> <aDbl5CIGulMng3de@smile.fi.intel.com>
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, May 28, 2025, at 12:31, Andy Shevchenko wrote:
> On Wed, May 28, 2025 at 03:17:03AM -0700, Christopher Snowhill wrote:
>> On Wed May 28, 2025 at 3:03 AM PDT, Arnd Bergmann wrote:
>> > On Wed, May 28, 2025, at 11:34, Andy Shevchenko wrote:
>> >> On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
>> > I think ACPI_VIDEO is at the center here, and changing all the
>> > 'select ACPI_VIDEO if ACPI' instances to
>> > 'depends on ACPI_VIDEO || !ACPI_VIDEO' would solve a lot of
>> 
>> Maybe you meant 'depends on ACPI_VIDEO || !ACPI' ?
>
> I believe not. The depends on FOO || FOO=n is idiomatic in Kconfig.

It depends on what we want here. 'ACPI_VIDEO || !ACPI' would
be the direct equivalent of the existing 'select ACPI_VIDEO if ACPI',
while 'ACPI_VIDEO || !ACPI_VIDEO' would allow building with
ACPI=y and ACPI_VIDEO=n, which is not possible today. I'd probably
start with the version that Christopher suggested to have a lower
regression risk.

     Arnd
