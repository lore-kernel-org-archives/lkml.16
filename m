Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB5435957
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087968; cv=none; b=QQvPhQcqfi+tPxtyck6buQYSafKLBVRGQjSVGt4+fVJRgnSKc0LIA7ptPU81p8Efsl2Tq9lKahSBQ86vRBt8Dv4ofyK61BcgrBz8oVFezcEq7dGXElYvAjWJZ5IyrqZC1pxw+WvdtmoOZQGpeqnef/hoddR1McFTW77exjJwWtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087968; c=relaxed/simple;
	bh=Oc4HlqCoJnV7jIDygaPvu7y9WnX1Qq3j1lOvFDKhkHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qINSM6dS8C9rQ/93zqngMNKctRpbRCU4cR6tkzqyY3EMtNzbtLRzK1FmI2lamQtJShASzTkPv02y/1AU+18/z1DL70nOETKv99c5gcBQtMMkkQ7H+I7lURO5G7h6e/EoBM7oOFQspXOwUbW9nukXe9t/i0DtQ4IHLiE2vBkXJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=H82cPS/1; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="H82cPS/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743087941; x=1743692741; i=markus.elfring@web.de;
	bh=Oc4HlqCoJnV7jIDygaPvu7y9WnX1Qq3j1lOvFDKhkHk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=H82cPS/1vPtnSgOTtkjjXV6JBPZG1azsR30Jp11zyuHmQQ3E+fN+R2TLDu3NmpzB
	 D/QBbFA/9sm27O11UfGbT3nesxx1mYWQKhp8LUZFaTdn8JSuTkn5knoH696OsQkjf
	 hvvQPxv46Sp5tw5E9jZbRF4Edl1UtNIcYTU4F5aTt8ELwC/f2u2yUflfmys7HNN5A
	 Tt3vGa1Fc5o7504Gg2U/k188XfxEAs+c7AmIWE7e3Yd06pyci2oLwgsJlD1cfMm2f
	 Y5LMCmss8EkaKN6L4IU9GgXz7k+4R0EdjA+C4bQqh0GgYckWJt9m0nC2wCMonqeRg
	 lKTbBEnjfCGitVtMiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdwNg-1tODOl2Msg-00bJWW; Thu, 27
 Mar 2025 16:05:41 +0100
Message-ID: <49276ee6-6eb5-418e-99ad-3ed9d3e82414@web.de>
Date: Thu, 27 Mar 2025 16:05:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Ye Liu <liuye@kylinos.cn>, linux-mm@kvack.org
Cc: Ye Liu <ye.liu@linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250326011752.917564-1-ye.liu@linux.dev>
 <0ceb4ab8-adb5-46bf-98e4-61a1bd908e20@web.de>
 <7c278ba6-c1a2-4ef7-a4ac-48c233dce7a3@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7c278ba6-c1a2-4ef7-a4ac-48c233dce7a3@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wpAIhCth5swCXSkgJ6ytdCPabeROu+FRL1sBRwMdxNtkBYSi0zl
 L63x+U0NvWP8WK+uXqrbggTJLU54WZR6VnZoA2zDMxOhqRhdH0KHK2dvI6SqeLm+NGmGkSh
 r5r3rgcJMEf387Ixr9aH/quc7ICqeAe34TG3lgG+6qSf9n3yVZVMHKSYxEUBianPGZn2g+8
 A2k7pAQdbZKVMEw1eyTDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vj8KNkbA55I=;tyF2Zr3Xc0d12YUI7ZiQQg3GZOj
 8VcJhf/l4gJbrEiJy1oMxv0ebR0fx6fPdYtPNXqmpJfDORbc5Fh6JPGoI3bNLc32vXwqAskbz
 upmkrtd6CSdtb7PxbnfXLlkBZasu6KpPmxzM42Exxt9m8ZAJKYxhgQtv6d5Ud0r2MwKVVnbXY
 fqkB0hDxXmqu4wtxkWh6MVZPfMugbwa4zbJ8H1uCH8PHpg1AcgCKLOuSBeoUTZELSnnHMnvMV
 fm4Mlm3p7QTDDcwv+QyGmhTeDPojhftHo1l/7YN4kaUu6ect8pRV5gHeeqwgeyRdw82/4owCT
 ZlBQdwmn3RR0RrULGYTXzb6OZi3C4aL9uMTATHJlcfWAT6pGKkLpnCie516599isrfhyDH8Eq
 gy8GzkT8e6NteOrzl45d6D1AkXjBJir2aTYLasqhpW+EW8KosB+csC6xNtZcS9biO/eB/HjP6
 qkxsCst3P9btgA8sAHXOtlqYVLsRNh/Kg4LEr2CSw7V+dHLEJVcTDpqd8igQC5nWxk0Mv7zNm
 f+tbi9d/Ij3g51B6s8SqlQH4wyy7gHXgiewH3llFxEhHNnof6c3jPhfPrDy67bYs1F9Gpl8gp
 bpI3z/WX1jVvbi4SBQzR0qR5+HntWqZPJaDrcciWnL7Fr2mh4T8/I6oco3/F8n+TQWPqFWLLe
 cxbMwBbaaPlS8TOU8VBH2UqnVwoe+tBBDYolOcWIFzN6E8uxTJCJMkSx9jUJ0a9LLQL84f9Dx
 QSP9V+NThw+TnHvVhkolkQn9sGKIzDqJ5ZEnK/1odlNomyoZ0NaE5/ocyCgkBGibhnqFHr3fw
 XlA+BRt3PfUDAPHl/ZOg/yDtgXSCMwyZkw1oIaLK+eXLmT6tG7n0Wn6BLotMG2X9nvaHShyVn
 PvSi8zfNfJXI8r8wlrLjBt5bI26awZaUOBM8yn+TVOtljM784oKusd59uc3LCyQGJHNirXRDf
 jJpgPDPbCxDj2Usnx40HNA+Fy3oNQqxk+KoyAt9YxigquxyOkRMSCKhFmRi0YA0Opslj7/Djj
 8rTt9Cuodpv4B9SZDhAsS2Mky79vIYm4/o8egsVGKptZbMN9Ewyhosgte13QbVEb0f2LZjk+i
 pXZRZvoAFMMrq38oVEf9EOTM57QupZrCOUUihuwJzk5oHzei+ot4FmLLwrOBff48SUF3yjTZO
 kDmLTQ5PK1wMT//+5P4u/a8NsTk0u/QgSV3tp2Jeqf8qCHkXbbYxb7fo0axvDE7e5rnqkVDfs
 GeiWpWuff/HmRZm8CAH8FWuTGkF2jteNC9Hk6NeYKJ7V6HOgJdvDe74tv4kaAdUTpAIpliwPx
 +kjURyu2k1Kg+9QmF5qLGwtb3sckqv8kVYEUXj2EOS1sTm7sa7BjsebUBoF57Qdg76tn7WrQp
 0yECWOTJY8GLYIQQt1ejFOcUea4MmgxOOGx96mXp38N0LuytOFml4szX27JWGvEEro6reoDm1
 eE+Pp4GxY+ZdHXBULJl4RxYhqN4fsuNNzsmca+pdhrduIa4nx

>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n94
>
> How about this?

I hope that such review can trigger improvements in change descriptions
for further patch versions.


> Consolidate the handling of unlikely conditions in the page_expected_sta=
te
> function to reduce code duplication and improve readability.
=E2=80=A6

Would you like to append parentheses to any function names?

Regards,
Markus
