Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2D2A1D7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426950; cv=none; b=Wnu96P+2ez9T7vqXtaPa6E6wv4eVInnsKPa1JtIYZ0Q1dHHJ1b01SqM2Ve9cDY7M6Jh1ukFdQfcDXXeLCCg/h8EPwv3BqsIffx5GGrG78aCyo/bnE/jXM7GSeAUavD2TIbzmqorDxEP/eSlarfdStEs3V3b341JcwoiI12rGMyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426950; c=relaxed/simple;
	bh=TJf2cLWDa6TYKjo0C76hJtuoh8UwAG/Rjz1lFqOav/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gbpsw94SwVEvGgt2yEzLnrAFMGOFPzmzgLHQekazZ2KjBcalY6L7Ei/Qqnfzt8FxEPgYxZGgcGxe7LhCcGxZrIX6aKuOTAMSl5iNC6I9Fm0Tkn4pFsO0ytbV7OKKPYuCjwVh4Uf/A3+9NCJYVbJQeu1L+CvpKaXaDDojVDNcscI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Y5hYQ/KQ; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Y5hYQ/KQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743426919; x=1744031719; i=markus.elfring@web.de;
	bh=BMiqQCMxbQwce1KOTSZq9sTx1HqFGg9Shvfl8jiPWWs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y5hYQ/KQrO7sb+qGFPO/hjoYlGOr0eDckrU4WQxUlO9GV+AxE6nKgbk5L1aDJyZz
	 Q4LjafB+CZtKp+UXQeHz/VsC3GoTD0gtUCSXlSixL9DO3CraQYrv4h3MyKUqGERVz
	 GJqPKGtg6+7J8/qMWrcwVouho1poYmmsV20V4Gl3Huk7n7fN7fwMiTuFRP8AdIGJS
	 G2/A1mJFOS9Wc/4aVxLdfesBwdymbpuPdyK+uJTybSx6NzZdRwjNOtaIUJruaJ94J
	 f9DRDp8xp7YCzXRtVDu9kV67lezM2Bx9wJZ1LMZp5IopwfA0K2tos6Lpv073NQvx9
	 6ncyqkxvhk0D89zOvg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIya8-1teyHF2Ejy-00VtF9; Mon, 31
 Mar 2025 15:15:19 +0200
Message-ID: <fdba0c3b-dd83-4fb4-a8ad-950facc68127@web.de>
Date: Mon, 31 Mar 2025 15:15:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Ye Liu <liuye@kylinos.cn>, linux-mm@kvack.org
Cc: Ye Liu <ye.liu@linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
 <05ebb2eb-5f66-4613-a39e-40194c96341f@web.de>
 <9ee54186-b56c-4876-a36f-1e4fb1835d09@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9ee54186-b56c-4876-a36f-1e4fb1835d09@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sBx7LaCk3pshpDXgZTnnj7mHU6ZWA46u/hedLVvT3YSRn5QRibK
 F6rYsfzCNug8haqJlCbgTsZn6t4gmLkTvoRP+881Y5UJpGyrDlQRAUqBK7eezinQq8VxmoC
 4os8V3V2ljfXzcKA/C1vD1bvWYeDZoYck452WwglkBfsYzv7GZG4FiF63y53Ey9cN82E/pf
 SjoLm6VqJC6kOwtjKyPEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sob06aztCDo=;sg5KEWIspUoUURjlrrFVRkASxY2
 qWyuvnYbF5HW8l6HyMD9cHW4DtTB8cd/xQYhUH0M/XsYe89wpeHbHCBuUJH4sGw5cdgrSJrh5
 ZLTFWLhfVzEEI9fNGxH8kDytWjwbV+GPBZ0ue0ezLbowzjfNjD2QjVwppehNmAzMLhHnY+vp5
 X/0ojHvLZoWcrxUFDK9+Geac3D/aLnbsDwjmSM4WKLxMRCJTbICRg73TyQCz7QCurrq45pH13
 jcoYTd6CbwIQ1kysOtfJiyxw7FgsAblqYSNgPkKkIZxvTSpAkE7hGxsgtFc8y3ci/8O45JuoD
 V6A6oA3YLyDicMFRbnmxHEWhB1TASxDI/vg+HCDsR2RPAVWwuJkFszvMucssWGgiW8NB691Fi
 2O4YVk+W7kMiHrfsnE9dNE26hE+ndpWQtLJqRsMi9UaKuMJnN10V6GIeysLL2o2RX3JPK8s/6
 GGQjfvJ4BWNg97toM+Efx6v70+FxXuTSnz4bvNlam8RSJ+62iUpzSKLmxjQyXT42NDe908wjL
 9cZ6s4+tzjyp5wyc0piANJXqkSCNKa6eHLZJo64nStu47AE+3IWMNs7W91kvtt2uyFB8QboeR
 sN1lP0+8+uAljnvlB3sH+khdXmdToUTpGwozgu9DQflEqoS/45j1ADkuSmE74l5mHELBhAPXZ
 7ojwGo8TI6YQxzIEgNQV5//J6pEGXlMmGdROEIU+Iz644Kv5wqyTgN7OoEOK+tSs/WwRdZDjp
 PWlSIhhBr+2seXCCtHtzSrq0QVVhJXdI1W2PvDeo7YGKcQqw+GXrmjD4TgtkFRdizXcxZROLI
 aOsgoKFS3umBbcI8UPPCdUlJC81/dII+tlHcUXG57eVctlQsx9Hsz+CmTEeDwHlQH7F3O1QSn
 NaMpgkE+MIizfqQiN4sDvEEm0HeAmCXbCS54kBe00Ov/Bz062MX3wp/pDRtOSCya0zyFAsD77
 5GnMaCyJjhPPwUtY5Gs+UqSvUNCcUBkEXRMlAlxqOMcvWsk6KE+p0fOEEvU9IyU0fn6mKdtYo
 MDh4DUyg9BugObhkXHZjx2Pdvyv0VXx/Q7Bg38staqFvmSmZHwIAHK+1EJRWQh4kITnUJqZ9b
 DHh+j3GDIBi6JwYak1mntuRtnqWZgDQv/23GT1FPgZm+5XEVv5YTDxsE5RU7PNkDBkW7n/lID
 ssMXUTMHuLqgm0mmT0nfLKQ8hboR/PzqEgNfo+47dMVGcT/Zl1IDFdtA2BvOwH3c77rTYNREq
 L/iZx28a4hks71kBXKa+ltJFBsW8K/kFpjVtQ21PshIpW9sfUwYDFiVVbPLpM1iOG5V9xqP8b
 Zpe5I898j0qzEal5gCUV2qTor+xdKrC2Am+dzNKGB/C5K+3T/6rfaiVPwIQZVE+qxaFJxMzMU
 /g2gsKWJk7IN5GyMqKAYnG2eyftDc4kuR1Umb6i7d1tm+uz6o5XIpK/vsWDq3q4trDAczTFCU
 YUGGTYEBrc6XNuJwf4O4LpCH2cZSAo+fqgM+Eg1Pn+xxycoKCWjsptV90T0sLns0UTEjDig==

>>>             What are the requirements or steps to get involved?
>> You can try to improve communication skills as needed.
>
> I don=E2=80=99t see how I=E2=80=99ve offended anyone.

This might not have happened so far.

But some information from communication approaches can occasionally make
participants feel uncomfortable.


> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -- I was simply asking =
about the process to become a reviewer.
> What exactly is the issue with that?

There needs to be a desire to review selected items.
https://en.wikipedia.org/wiki/Code_review


> How did you interpret my message to warrant such a response?
I would like to help another bit with corresponding clarifications.
You can get further impressions and experiences from published review appr=
oaches,
can't you?

Regards,
Markus
