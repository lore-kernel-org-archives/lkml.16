Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6F02750EE;
	Thu, 26 Jun 2025 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936739; cv=none; b=Y05leEuSf7w5D9hevsCHP0x/KNw7SiHpsljNRgtVcbpmkKGWkhN8TQZ4eEHY0oMlItHYHysMMwSYt9D5r1LfdGl6PmPpPSosH8ShsaKQ2gT+z8Tbfb1HfRtTACo6z1nVkqT5lufNtmdgjZPz2VEHP7FGFdBkrum+HDbEdIDaZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936739; c=relaxed/simple;
	bh=tMY/QvE1RwQKfHEi+oTl/T3hBIkqTUHKT0qz5d8oUZc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NqQraGh9LSvzUEZ/8Ar85Uxx6NocpyeOzhLJuSw+aIVcmXozZjeEroy6kqlFk2VNiuFZUDAbmTOvSTiWtbJkDXHJs2cmI5Vqj2W3VVf9RBqi040vOQE53Imr0oTg1sVn3bYZ7HqqMbdrDU0B6VmCLiXmkllaK4csgjCMp3FXsfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=AGwyVDkV; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="AGwyVDkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750936735; x=1751541535; i=markus.elfring@web.de;
	bh=ungKwFOtEzIYKnf/yhZWuG/t/MagGOMM96bsTQ1jq00=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AGwyVDkVszpIu4jZ5zemtB7nhBruYc5bAPXwnjyrr7bKU7BwCv2aUeD7FWUM8KIc
	 XbePP/wTF5k4Rgc6zu3jCTvQ7bQG1CupRaeR8xPDFzHjLjxISTURUA/wA51/BJcPW
	 ArTIfZEghSPzqlfihW2JlG7vGBpF25fSX4IzN9arUZOWzZH5XpxT2OxT6h/q5CdVL
	 odQO2ptJL/KiCuN3lIZg/58jjY+U29i8mv+oqAKEimAQCU0vYU3H92eAJOVf36Ylu
	 g0RiM0IJsBQ/09U9IeMIlvn6zJ5uBJ0WFXPeuarrhvrMCB/oZ6kojFVgubWeiw61o
	 OYR1SWirlzcaqjZnxA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.202]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MSIEs-1uJmII2m76-00LgRI; Thu, 26
 Jun 2025 13:18:54 +0200
Message-ID: <5682c295-0c4a-41e9-bf80-fd14fd5c94db@web.de>
Date: Thu, 26 Jun 2025 13:18:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Passing code replacements by APIs (for SmPL)?
From: Markus Elfring <Markus.Elfring@web.de>
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <2dc257b4-d310-47dd-90ea-9b081727be2a@web.de>
 <481faa1d-7171-4657-8dc0-c37b153e6eaa@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <481faa1d-7171-4657-8dc0-c37b153e6eaa@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:WUmnOIsrbZmldbhsDvrqqPwFzwR8D07shP8Wv3Q1JkdxQbbend+
 RLA3Vdb5SGjKGKTfiF/1gm91RZmZy7PTx0Juinw5HBm9hoyCdDkO0tIPUJGpy1P6GsvGWex
 +nHiYNPMdVxfYnNPv61Evku8pKv7d1IpSbTQA0snP/P72ihmokDkTCOSi4/cX4un+HmsQyf
 veA6svSlrv+eZzGU8DqDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WMbcRzyDllo=;m5JuxULKfomwhoM9nDCiZ+jejwZ
 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
 OU2CTmLzSMckt9sTaeBXQJ/SzY9UznF4=

> Would you become interested to convert contents from any header (or source) files
> into more advanced transformation approaches?

I demonstrated that expressions can be extracted from selected function implementations
also by the means of the semantic patch language.
https://lore.kernel.org/cocci/481faa1d-7171-4657-8dc0-c37b153e6eaa@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2025-06/msg00044.html

Now I am looking again for further software extension possibilities.

1. I would like to sort found expressions by decreasing complexity.

2. Some expressions will probably refer to known function (or macro) calls.
   How can corresponding identifiers be replaced by previously determined source code?


Regards,
Markus
