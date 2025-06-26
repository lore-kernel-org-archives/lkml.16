Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862AE215191;
	Thu, 26 Jun 2025 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936879; cv=none; b=NLCDVcvK65Jg0+Ve5WcG6On8+9XXCQuCaLtz1OI5ECgv0Sg57vNP8PVVweaCGSsrsGGnwrOIU535uTUsTL7LWBE8EReXx2lQJgZohLl+aar8xXfpPEkkRZINCvyoF01n23boRVsxyS/h/qJjMhk8xSxCANGd3+DNBBrrZDlppyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936879; c=relaxed/simple;
	bh=m0CL5AizdnwL+eTdcWO6GvAVudTqSmnqEQW6X1g/RNw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gMoF+jOoJOwuiWCi5yvaEdyxNcsUiICivPMd+pEHNEhC4WxOj7goRERF3vFHUqxD+PLWVV2b9y3+xgVO8ymF8OHXGbk9CmUa6xHQMeuTuOXtoX4woMWHUuUQ1voWbN1zBAtsadNtIKNvDF8JE7SsgKU2LYc7OIL/DGAbZhoN20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; spf=pass smtp.mailfrom=arunraghavan.net; dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b=aUx+u+Pz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NRG2LYb7; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b="aUx+u+Pz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NRG2LYb7"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E8E0A7A0112;
	Thu, 26 Jun 2025 07:21:14 -0400 (EDT)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-05.internal (MEProxy); Thu, 26 Jun 2025 07:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1750936874; x=1751023274; bh=/SW6QnMa4UOsnOldpJxTY
	j4HpI4vmk6QAX148MJm4ns=; b=aUx+u+PzXKbeDI132DZ2ONFxkdH6gfjSsGmKw
	LhkbkptfdDlCPANSyk+2Bkd+kDEcbxzb94N9Up+FzxNO4+6gDc8rlXByLp00xhbE
	xId5r/ZQ0P5ONQOs86lo5KjzNkUJzaFJpWxea6IjuMPt/uKlQN4uNMRJY33A6/58
	IB/lmcovDFjeXZXP90xWOnv6FZYINgPt3B6HxjzTc2TSbnCGYq/hx4G/KgXCV/yu
	sL4ku2txNt+7CjT7v57M1wiicMJatqqn+53cXSXFzTnn4WxRCfZfvSieyQQUiDhh
	g1k3mqmfAQ9QgxFflG/9CV1bETx1SXU6MNuB45ps7GYL+W7FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750936874; x=
	1751023274; bh=/SW6QnMa4UOsnOldpJxTYj4HpI4vmk6QAX148MJm4ns=; b=N
	RG2LYb7lyvgK66RNHxMP2CVf/66oR/HvesiSg0o/yRNAbM1flPJb1uZcbmULKLKB
	zuk1/OeXJORMEb8g2ypKnmHTGueztzegfzD9AFeu8ontPClhD6vlt85/5EtGWEmJ
	VtHvRY5FUXshcJ6DhowbC0OTlBk2MzeGL2PjdSlS+AxFpn5oel23s2xUxpvHM8qS
	Q8hW+oLjNqO9iNtNIv3MMtizKYmzl7W87J7lA+nshKFiEQSwoZG9AxPt48VDVZF9
	HE470lpbdFbP2u8XsRtGYTQFRXqcTHjhoa/3e6HbeIqBtyCH+0Pmrp1LZNvURvPJ
	vYl8+V+2WalbQ3ZgTQKeQ==
X-ME-Sender: <xms:KS1daAv6z_zNa4zVJuOP1jePfcoHBnxuZ8msBrtdBQw3QdWss4XOtA>
    <xme:KS1daNd0TdMOzbquTdW5r9iKZwFDDBNm0CD51EuhLtg6nGduyUAz4D0tlbX15B8Yl
    YI31YMyLAGkAQ-3Fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhunhcutfgr
    ghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqeenucggtf
    frrghtthgvrhhnpeegheetffehudfhiedvkefgheelfeetueeutdetudeutdeiveejvdet
    jedtjeekveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtpdhnsggprhgtphhtthhopedu
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghruhhnsegrshihmhhpthhoth
    hitgdrihhopdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirh
    gufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrg
    hilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-ME-Proxy: <xmx:KS1daLxBiK4O07CHZKKWp79mrEvtOfzkrr84FPRq6FXIWGYG-3VYvA>
    <xmx:KS1daDNRRqFdRtx8zQ0LijpBD5UyM8CFXcV9zkL1drh0GM7_llrd9Q>
    <xmx:KS1daA8pLCnUZgXi_PRFVvohuApAJmExpSNgGTswvPZSACSOa-4czg>
    <xmx:KS1daLWRa5GH67FAqb10ebX73zqVeyNxb6xZ0ZBp02ft4JauvjCOKg>
    <xmx:Ki1daC5yvRr1RyhXBx-MjzS9t-gLeycqPGOAGqmjG7BDVXGLAvkQ6VIW>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8C444B60069; Thu, 26 Jun 2025 07:21:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tbce6b10f0faf42d7
Date: Thu, 26 Jun 2025 07:20:53 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Shengjiu Wang" <shengjiu.wang@gmail.com>,
 "Xiubo Li" <Xiubo.Lee@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Pieterjan Camerlynck" <p.camerlynck@televic.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Arun Raghavan" <arun@asymptotic.io>
Message-Id: <4d4d15dd-3f2e-421a-be5d-005d6422385f@app.fastmail.com>
In-Reply-To: <aF0qMiPiNfDBXZld@finisterre.sirena.org.uk>
References: <20250625130648.201331-1-arun@arunraghavan.net>
 <20250625235757.68058-3-arun@arunraghavan.net>
 <aF0qMiPiNfDBXZld@finisterre.sirena.org.uk>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting in consumer
 mode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025, at 7:08 AM, Mark Brown wrote:
> On Wed, Jun 25, 2025 at 07:56:16PM -0400, Arun Raghavan wrote:
>> From: Arun Raghavan <arun@asymptotic.io>
>> 
>> In a setup with an external clock provider, when running the receiver
>> (arecord) and triggering an xrun with xrun_injection, we see a channel
>> swap/offset. This happens sometimes when running only the receiver, but
>> occurs reliably if a transmitter (aplay) is also concurrently running.
>
> Please don't send new patches or versions in reply to old threads, it
> makes it harder to follow what's going on.

Ack, sorry about that!

-- Arun
