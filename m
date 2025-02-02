Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971A1CAA7B
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738508371; cv=none; b=kZhNAZ3NQP9MYiE4pGcSUr1XOoL3zB3WaCAXgFB/ZU2ToEbOTp6Toyh0zeMjFz60ofxWDT4LDxVj77SMV2Ki34cNQX1YuofLJEFTaFBTzuOaCuWQLCKD/KrnKjHOmwJmgeaka0gTb8/se+4lltFTFOvAI/Fm1bI4U/za9/9asMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738508371; c=relaxed/simple;
	bh=I3GckS+Bmfn0RBXo0V9D7uiW+6F71KvgXL8u85A42Ww=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=gzpI1U49OR0WnjGMYCWVSbOLIxcefbHOi+v7AyibC6h2eqRV1AuBjAikWlvwT7Z9BgxVPEXOAmW49N11IDJruAYpveJwRo3AO1fAJRNtPA2OeNZs9S0EmxzhvXJlwjaOJbVgNMBB2XcC73HpghdxHcvQwHq6XJHK9jCv22kShpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=D/FYGizI; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="D/FYGizI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738508339; x=1739113139; i=markus.elfring@web.de;
	bh=I3GckS+Bmfn0RBXo0V9D7uiW+6F71KvgXL8u85A42Ww=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D/FYGizItCe8viq85YutynuxBC9UyINWyLCw+fNhFWVXf9czkBVasEkKadv2BBvn
	 ApN8XNpv/QIQllZF2JxPLHqg1xalkJdvxK1ksUikLsl4MhYf+zYDGsS9TLh2w47Eu
	 8v6iAMxWZ92YqsgiLfz/+H7an1EQQ78LgTfq4VKKyGA11iK9jK0LKHiYcTR9Qd1V/
	 kCX0iz4jZPwCF14ihqNc3LZiFgrwQW5P5IuObuTdDaD7qc1zBnJ70ckBIF0BsEp/U
	 3PrHq8o4DTtNFl/WY6xftXw+YaYMCmDQOW7bqPd9JcHm+TtYnF019GDvR4Zla14zp
	 g/LPM3F4zFCx3VfoWw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.26]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPaIK-1trL9t29cA-00Nnjb; Sun, 02
 Feb 2025 15:58:59 +0100
Message-ID: <82b65a27-8e7a-49b6-b7b0-a4721ce0282c@web.de>
Date: Sun, 2 Feb 2025 15:58:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250131222457.1634039-1-jaegeuk@kernel.org>
Subject: Re: [PATCH 1/2] f2fs: don't kobject_put in the error case
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250131222457.1634039-1-jaegeuk@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XJAqUxI1M8FQjColY8RxoBsqzXl3zDmWMHbpsMwu1tWuZScnYdd
 nbeOtIvJUafwAqApMraOiAn6h2GpcmWeKnQetXgC5QsdHSkpgZXpbJwaIREMbGq4lLxZnj1
 x12i3FSgu2g5I83gjHznFO0Z6Xk0Wlj+dF6wsrktNAxKx/KOfOp7v6NfVAnyVadLfMZRv/I
 /Vd3KtzGdQF99EzEETh4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kjE3ZKrgAHI=;KoV80x8oBgXCkO+HLIPmLz0ipCr
 HZND67LhbMgMvU/9woQLIEaA1s0dClimgGi+dyhvaSNdPy1hHqrgbsfsAJLIZW8RlHaCx3dQu
 /CkqjYIB7lRENd+L+df+o92jB7+yZ5y9B96KA8kWCUdldG2bPrq/j0xwbYQmNx4VH5jjJ5ppH
 vycp/g20OcvX7tEBOcFTGiNORcLPD1TvoLos8R3fGvs/shVkqBgR6VkExqjR0/CkpXpo2OwSv
 FSFqddD2xq6x/HI1K5cUftcI5jZPWznZ7eTk7lz1hE170jLTAhB3f+Np8XyruIZrTVJQI/UaF
 5EgXirjX+xB1JlAIgi1AURveFJH8D9ws/MMkYnnsVz0WwHHh+G3zmxeBXMu5g6uNtbuh/wnl0
 mTRv4TLwgZ9vlJC1EwG2EAnUS9fdu0O+U9mQF+gitAj/YRU5ZP1wzQJHtMra0p8tvaJYSXI1q
 hw3aV+Q7dqxjZNF5hO26qNuuDgraTXkIUpyfjTMzGNhXG6ATXi0EHyo7J8h7OmKlBiN496MbP
 BBzVv0UwxxDtf9zjCdfu4/dBwYqkMXDZpFg0PgM70zDHCAMeYONhlkAta5ZJm631WsP/y9CdP
 D2QIXK0DZ9TYvSQvgIMX3vVDmZYXHaot0Dg1t8AuELt7ASCCpq+HRlrJt6EveOWTy5YCvX65Y
 8pdz49c83CTBZJrvt4lSQdJvjE//qipa9yYdOJ9cnGV2FiUXXtlz6GRNMx4f+h7NG9ITJFqUv
 3XRiOP/FypgdkQHDdmnC7RjU3WVjdzw+aynxCfGoFpE1dMnY+IZLkccCQy0Cre0iTTwhyJHSo
 Jn+8+6V3IEdpRzignOwoUtHaoDz29zhy0Zh6y3e9aLSIZCT7tuw6UJdFl0DwbRJ/9BmfggziB
 NyKD9Z109F2YaCufGsZuDIQWO8Qg0qwW/xNH4QgtUWapRp3PYqyJA6VtJLPnnA075B4Lax5rL
 cWSZFETS68hU7jq9Y+kQR7hVONU+leeYVHOhZRJ21qFeKGbVo6Y2lHzLX5MUaGPE9tUXRd5xU
 teNGWR2ZbT7bt091MfKaO3NlyPtPXyVEUwe4bOieLIOfcuPs0H9HsvE7KqkFwNbhtWlQOZUey
 sAU8rVru6Gp/RRG2jzPVNS4/nJO5bbuFDCWQs56rMY/0uVCLaEfX+4v9SuB3AXULpl6jwS2XQ
 V0X6izswIm4Nrah48l18s4Z1tR7AIEduPhvES6bDaW7Rt8ye1YJZDQTMRkgAAVrDSk+NtvzJX
 /LxgkqSKIHwk/9oo05S5Ga1g6vEG+KA38MMFWylMAQcCBvFax+PzdO+OoyJ1JomRGdaYV2/44
 ZAORgkXJGsW24U4FAZ03XYEugoX6xGx/In7eVRusf2w+dVrHvEYSztYVeMj/633eI+z

> Fix a wrong kobject_put in the error path.

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?

* Will cover letters be usually helpful for such patch series?


Regards,
Markus
