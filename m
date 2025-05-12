Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AF2B9B7
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041928; cv=none; b=aEH1psOfXIdcNUdVzgYLVI+rC9IBPcU6N3lTxMvDt74FFEBm37GmOqdZuuTXWSTFlZyl3gXHqycCPzIuNgJYRHgRKJbYat3v+GJtXb6+llHdCVnH/FQV/LIypcCIfynhXEjWFKRXn+1pGlKRGQ+G9sG5yBhuY+Yw9UVZcvG5FyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041928; c=relaxed/simple;
	bh=OLSHO2Ibs2uoIHZrl9Xn5cSfahZ7tkgcZIzEwxzVdy4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xf6lr1T3cwaDfe8XzYiuuQhcVMl8P2uMn7LiE5wSZCq5hCc98ZIZn5pkOySiOLB0GVOI0lZjHevhrkg2doFidElakvuE5z+9vLAlRlkeV3VSTbhWRroCi0TVYzSOkKwj6SDWLkTlL3yAQt4gpWp0sv/kX0k2nyWlRrWAtTdqa2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oM8oOPXd; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oM8oOPXd"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8ED743284;
	Mon, 12 May 2025 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747041918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OLSHO2Ibs2uoIHZrl9Xn5cSfahZ7tkgcZIzEwxzVdy4=;
	b=oM8oOPXdDFoFnYhlHrGrcIe4CG/Ex8eoF29mMpTzDa4skMFmN0wxKB9InrYu0A2XX5kISl
	IdqwbEeqroNrcN3vwnXjqC3FdPTwcDeWfszZ2jyK6vuFvi0ySKsjFklBXL3Z85xbIRcaQz
	9fdOPyuALkEEK0sX81UP0Fr+yWf11p0RM/95lQ8PC0UFTetPReRsHX4vzDdsAheyLjqmrg
	gYBmJ3H06k6HsW9VAOl6DpBxf0gwr+ub8dvIe2eaWcJHrTY1ni9wpL62lxudV4RTwtaq+n
	ZL2OmAiMPKplVLAImdwI9QqBS/D3amh9wBr6qJRJSz17oLUQZf4qTXw9flfs5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
  linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE
 MASTER),  imx@lists.linux.dev (open list:SILVACO I3C DUAL-ROLE MASTER),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 1/1] i3c: master: svc: skip address resend on repeat
 START
In-Reply-To: <20250429054234.4013929-1-Frank.Li@nxp.com> (Frank Li's message
	of "Tue, 29 Apr 2025 01:42:34 -0400")
References: <20250429054234.4013929-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 11:25:16 +0200
Message-ID: <877c2mmb9f.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On 29/04/2025 at 01:42:34 -04, Frank Li <Frank.Li@nxp.com> wrote:

> According to the I3C specification, address arbitration only happens during
> the START. Repeated START do not initiate arbitration, and In-Band
> Interrupts (IBIs) cannot occur at this stage.
>
> Resending the address upon a NACK in a repeat START is therefore redundant
> and unnecessary. Avoid redundant retries, improving efficiency and ensuring
> protocol compliance.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
