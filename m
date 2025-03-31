Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D0155393
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423714; cv=none; b=OVuVZ15COXBWFzlG9VuvhpcoHHhFYiOLox1SlJE3cSREnqVPNVB4j8f3AvSg6DT6wMDyAKLqR6B60RqozYYoSQJPhi8bKW5qZc9XZRMQ+jBVwZEMocYXf08YYNrWRlbR4tvbLEPqyuW6RXzYdQpB69YUu1Q+57Qm8a65tXjHyCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423714; c=relaxed/simple;
	bh=2ev02OPAZCcfKnCjdtmiNypsC+78ymrjGNiBfTGbmT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzSsvCj9DO1aLXmxoz7tptjZA0Z5shIK2zvNUtCwARczK95mtpB2Wta9s8iHaRcA/euuQAw2rK+PICO9EL+ooPvfuPwQ1B7p0F/O7RGXkotuim1bV160VdmAPKuHxon6HfTkjobbPuR4kvupUfXpxtksdNFAIMCyPCq/8r990HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=rLn/2ux3; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="rLn/2ux3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743423679; x=1744028479; i=markus.elfring@web.de;
	bh=DjDoYxmvCVWYmhn6yiewCABDUAnyg1UkNh7/ZQXPA5A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rLn/2ux3iYS+HLWcF3HNUwMZUoSRA7xig6Br2ymUdLIOOnkPzCPedUy8bzLNcTjl
	 FtDIKdWS8Hdwp8WGwPhI3iiYOlq8PvBvwn+lLP8yOZZdYxP9OzSfCJN/HkSn+FJyT
	 MCAMDXcIStLVG6jLh2ZWlXOPGBK9jREZWztFLi7l4orUFfWMrsa+Ha1CGMHol4ZEL
	 SAIDm4k0dd0+8j0Ty4joB4VC2ggp2Lxu0cuBPGESBbKrC0KE0Vbjo+oq2wUxge4lB
	 XTPUZN6muXAEQWAehQ+ziPra8fy3Xyr6xy1+APvmBfM39BLsfTT2mbybCadJHG68h
	 kDjHkq/ZVSTzmrCCiQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1My6pZ-1tBP040Ktz-011MWB; Mon, 31
 Mar 2025 14:21:19 +0200
Message-ID: <05ebb2eb-5f66-4613-a39e-40194c96341f@web.de>
Date: Mon, 31 Mar 2025 14:21:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Ye Liu <liuye@kylinos.cn>, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>
Cc: Ye Liu <ye.liu@linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:15MxX/BlGGioOW8kCn4cYZi8i6GsG3ln3MiPcEY4lZhyrEmQykM
 n1PpaYxD3jewkBeN/Tvq4KEyUpgcIrnZdIXCxDHFjy/uet+i3lPCLXecRsuWobRV/hoM73/
 YzCDPXyXQW9kL3HMxuMhMgIgi4DjxulUvFxO9kvCxebB050oMbqlP+CgVh/Ney7fL0YiGwU
 QOpdOiFOUiT5C/EpqVGXg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6ng9HWNU9GU=;wg0s6oOGJkFi/x+hb6OZf/OvQJ7
 9OaNWauUB0azf3olt6qMvzaTHXUuZN/+/I/cwKubSqOgaZ//q62x+ShOLJ8XDh1ZGtUvfRHPI
 PrlUVShQjYy3Wva/3Ajy24LDlUXfJk0x2WfIed0eT3NZIELhOdN7mfiQA2o9G1rYbbZqRzcOT
 4sS4KB6eV+5rQ/7OO2tq4rO+Nt2fN09NKiyHJIVs5XnckZddzfdis3uXNl2XvoO+nKwsK9YwV
 ECsPVqpPl06mSYpw8V5IP5RG9VweWRYSEMkw4a5vQ7+Gl7yHPa3dlGoDe9w7C3DtuH+oyXNpX
 XzWKjujjoDjgiFHpk0gq5Qyb+OiEWyMnFGmjx7RKfpXF/fTv6VYXWapX8WdxZ7ciasxIQNJyf
 5QS9T+iVw5FOKbM4SV0VFCkUlAIG/q61KBMH7Pv+wvWnW0wy1duVxbWCUwWWqf9utFgLR8lMw
 wiMbQgh+DSPKKZlUjAvnStB+8tX9EiEvs9ROD98850e1SB3dCU3k9P/jtGYkVDycUZmdszkUe
 R5PI0clM2J41q57ijIT+qKEEz4k/fSvumMRFDIoUunGV6CztevTrWCgmS47AayCmJGF8p0Bdf
 B6psA8QVBYdh5eAygHWCkNkVOZ1OeImLiX6DF+1WpSGGgn4Sir8DpGO1zkERuYRbDS93IFqCS
 CaL9oEzLWBsUE4U8t2vHGZOZH+sigcmywfqEX9UQg1Tm5RS5RBjc73m1dajCzW+aE2bIxdSd8
 M3UswrUYnguzAFef2D2IAhCu8btOVAXbKHLx5wAtbyamDRAdzvSjeF8ZAvs9JVSFOjimgAu6m
 IRLnX1XoDYB1hXm4jIEM2M961QlE1WSvBxR+FMIG7iXx76yypijRAZ4jG2/AIjWplUOe2I14A
 8BPCnQBriMDyDryNt5IdN3vHxF3GIEGDVF9uvauiAfRpb8eM0W6Df/ES73jnbld0rrIQe2vJk
 M9EWdpOyIbAY/a5QUakLSss0DqCCF7shk6nJC+FjN3G/k8fPKvD9ZBUUBqR9MrpIA/WUQX6we
 l8DSEaWd08Jfqf5UYbWZ/CvCZnLm7syJqFKh7EiJUQiDjfSSElgJDzaGKom4iP5DBLRQORHvp
 UlRqcbq4WY5ihXKfXhiNrFRTVqG2EDdp0BCboxQm5wQpXHFiZ1bo8d/8v5us9nCCBGO+qpzwi
 rXQKTAjKCA7syO6CMYoeTj+qhIaJiHbcjLjzk+X+JIclZJmXFa7Cg8g9F9luNVyVEnOkmfIpD
 y7AajkBotVX+2P0MS4YaWsf977iNCBZNEcHyZsEf6qK5ifTSB22OeQj7iL/w8y15fh1KbtnC5
 v2PhZrlum3/IlpA4YIGHenMB2vJXwhtC5xJ9mAGTEbv5/Oh8lTgvwkN7t59o9IsIaVXg1ye20
 i4mbihXqEM7P8p2Q7RoXToT5yEjyEpA3TAY2JwHUR67Ne7foBurW86hsxGV1j1WBHKbzDcU2m
 3tltOVbODc2V/v83vK63KlgW5/BYR+KHO2Crsv2hiOrguRHtc

> Regarding the reviewer shortage, I=E2=80=99d be happy to help by reviewi=
ng
> other patches as well. Could you please share the process for becoming
> a reviewer?

Under which circumstances would you dare to comment information from
other contributors?

How will your development interests evolve further?


>             What are the requirements or steps to get involved?

You can try to improve communication skills as needed.

Regards,
Markus
