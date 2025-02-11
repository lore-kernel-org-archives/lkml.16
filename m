Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA91F1315
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266180; cv=none; b=SbZHp9bfRgqHRyDuUlXsGHfu/ukrlERYgThazjusnrfy1C9oPSN055K7svGCJMBofy7ZhekqDiF4pYTzxMhMPCN3iyABnbV9ola3UK6/6aAGxM5oirOHvGYsB+xqE0zt/dFslF1rapqkQjAud5sHYcKlnGZPES++y0jKo+AWJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266180; c=relaxed/simple;
	bh=TWcdXF5YdzjrUVf4d+A72F9BIg5KeFUnRBaLRGzLEvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlDRzHnA0zyfstN4vcYxbPV83WVL82vqVgd1J3zNGabRJs7WPBe4uefcd765n7XOBlJ6fpT4mGJYXcrG5npmYBRSCZVwTy7n7scYuXv0zGRtaSBjuWIsQ2nhbcZ52Pj5iOA2YaAZ7D7I4p4kVLXDzq43jjDfKGfHcIdn+Sr/Xig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kbvqiR9N; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kbvqiR9N"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41C54431FA;
	Tue, 11 Feb 2025 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739266171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWcdXF5YdzjrUVf4d+A72F9BIg5KeFUnRBaLRGzLEvE=;
	b=kbvqiR9NHyaSynuagwnGsZGAtY4oAkbATISIs/vzcsLNNrRBRdMGi16PSk6LZwa92D4Xvx
	sAxdHTWK0bAGaLHLTXdiAl9Y466lYPUTcJGn0cENdKhkPvvfkQYLfskZAToNAN+7L12O+q
	/1+86W/qsBqxHiEPpfTkNjt3ISJI7pmZmG2knSKA1iREVNRC/21bmSCEgJbzhrlSFrxnb9
	ph6yM89y2FrbwZ5Y9yJ4Lcc3oQMTRjAGZSdTCeNnK4G/HTaoR6mVdyMKbjQ8f680cLkTNR
	cq4IGALfGX/5vqiRLJcUKpfnQSl0a7RDGn+vLhjlqm0Ey/2FbuFPB013/Zkn7A==
Message-ID: <ce717364-5255-44bd-95a1-aacf76a2c79c@bootlin.com>
Date: Tue, 11 Feb 2025 10:29:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mux: mmio: Add suspend and resume support
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, gregory.clement@bootlin.com,
 thomas.petazzoni@bootlin.com, richard.genoud@bootlin.com, u-kumar1@ti.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Davis <afd@ti.com>
References: <20250203-mux-mmio-resume-support-v3-1-a2f813c0d227@bootlin.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20250203-mux-mmio-resume-support-v3-1-a2f813c0d227@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeetkeefveduuddvudevheegjeeugfeiiedtuedvkefgvdeghfejtdffudefgeehnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopeglkffrggeimedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiegnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepphgvuggrsegrgigvnhhtihgrrdhsvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrghgvnhhouhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuhdqkhhumhgrrhdusehtihdrtghomhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

On 2/3/25 11:02, Thomas Richard wrote:
> The status of each mux is read during suspend and stored in the private
> memory of the mux_chip.
> Then the state is restored during the resume.

Hello Peter,

Is there any chance to get this patch merged ?
Or maybe you have some comments to do.

Regards,

Thomas
