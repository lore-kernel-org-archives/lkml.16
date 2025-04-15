Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C91B4248
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707742; cv=none; b=t9jtd4n12NNv8zM1yj78Ug2ruZS98uV+VMMoJg1AYvLlAuHuO+yZBuIneK3QhqYqcBIxjLIkY4J2kmF73cOwUU5rP4L1X7get26XIXHKbKOGGNE12IlFy8c+3ME8cLR3JSd34MEkXrIWjwhCqlT4gyyJdx0Nf7ohnbBt4gjCIFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707742; c=relaxed/simple;
	bh=1mr1OG1oFrmxCKxLaRg8P0aZeIjpmCBFGRrJZ4EUQVo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=jG3D+V+Qsa12qDhA2xMUrcgREAIK1Ku5Ia/YHCMAO12ShdXmjwVkaDZ/GnlrMrKXRNzVH/gXn5hQn/1Lv2Kpbzpxw51u2RTZ1rK3pMqNlviaxXraXrbapObGj+6LfO9QOunshYc5VV8+NxxLg7mgJe4/BQCQBC5zXTir1VAeWPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=i4+Z8M34; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="i4+Z8M34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744707719; x=1745312519; i=markus.elfring@web.de;
	bh=1mr1OG1oFrmxCKxLaRg8P0aZeIjpmCBFGRrJZ4EUQVo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=i4+Z8M34gvBp+cG/jJetMRCF74J+MtGgBx/mehrSYuJJVaW94uKNA6ewUg/E9IVh
	 GDdbCKdH3G/YBVRE3TsNLTyPhGErGq3C4kQS74xY6NmYhDZicK9WZ4ekmgiR/EJqc
	 yS1uaDoDCJwZriTlLIZ2v3TSrYRqyDMBy4dWtf7BZzxFx6JVFMOGh1GLOvSX0zrmm
	 DgoMgCsVecyxzzdHwYsK2LGzChcK4CJBgZcQluZPamQI0oD/9EXTpftOsEYts8t0T
	 2uN7WhpO1M4GIGgun/UTYFraEQxzU8RQvUQFGoRkW74c97wkL6GORgWDJ4yC3MnCo
	 T8v6SSu+a7Wr8RJBTQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.24]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MG9DE-1to6zT22Lk-006HlA; Tue, 15
 Apr 2025 11:01:59 +0200
Message-ID: <e667ee00-12cf-4bd4-9c97-2dad4f2f1f02@web.de>
Date: Tue, 15 Apr 2025 11:01:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xavier_qy@163.com, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Barry Song <21cnbao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 Gavin Shan <gshan@redhat.com>, Lance Yang <ioworker0@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Will Deacon <will@kernel.org>, Zi Yan <ziy@nvidia.com>
References: <20250415082205.2249918-2-xavier_qy@163.com>
Subject: Re: [mm/contpte v3] mm/contpte: Optimize loop to reduce redundant
 operations
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250415082205.2249918-2-xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LJgOMD6FLVAODD0F3B3mIIMTWD8GkOxcEBBdb9b59akGTDGNBGm
 jZsmTkV4Osdi2P776szcbfhHWpgXgS9a7xppOgU3lKIHQKtfO3vLv9J6SRisiWaHQH0YFgy
 DQyzGTXcI4W5MiUEbxqETgv4dBA2wOOwZ04HAsJiyZqvUUkCsdXuoMjL655n113YKFh0W2T
 lOG49yqcvx8LStXsTrdoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aukuR7+DYGA=;3n4nKZetm2ZBk7c5pkctImDLSzK
 uQYSftoWfLOInjQWDTvziN2xFDNZpz9NeeV8N7+sO0H23onprxPGoGN0d8/KPAagBfTlBa1lK
 15OJyb/gccH3sIcKHIvTK6IKymPqyFoLn/lIP9sUFfLnlGUnRkXndZ5dBPmp/YMhOvwaH3UsR
 dEQOWAg3v3Zsgf/poXJ29Asufq3h4o5+qiSMcyW258FL9q2MRL3ybcLJ1TcBB4HUcY/+ebw+g
 rIQ3LWcS1dLiqocS3nTNC/5lnNZN6xg/+FN9vt6EZF+qe9Gg7G6jUgrlSEFR37SpAMiv0mFWa
 gq2A4KdA//Yw4gsXWgDFGFE+c1Op83olX4pPeSW/B0z3ecHmYYgEjE7uBNG5RKbw/AWHlHy0K
 xaxQRKnmm5P5sPQI2xi1f8RsMuEcUv1NDGVjGvoVrN7bD7g0NJX910ek+q+K2Kch3wbjkEkiP
 9CzH0i/I24JMVT6Eeoju69ads0VVAXZYnM0DG5aHQhmkUq7g7S7FTL/sqx+UcenUZKnTHI3Mw
 TqkoZ2hmeGUD+jgR3HXYDyymViwTU5tO1yV48KzDl05znishD1GJZbrU9N7ykjOKrbTpgiVKV
 ZOD3DGrCzVO0Bd+m+4OJ52iVprR8+5SAwTXtp5v/8jIKSiDUGSZ8MvHppzn5D4fteQ++q0oI9
 ol675b8txM128L/h9h60ZWTE/EW+QQZFt4N7QqUvTHrq1ivKsVkESqHo5pT8IPfW17sT8vbXr
 0Ms/U4qAAs4n0OwQKgCS5IrNYdZ35JKR6Qt06HnEPxyoBO5jgFbBXDzP/zeqkOFzHZHkM/rd2
 kz6TmDALf47eCFe0UXa7wh2se9uxPpSwX7u5RoasJzbK78aTjOqR6jYA/KIYD6CZQkana58qt
 kDvYlm2qocJpXA0xkxW1pIC3aPS5z5TY8nnPonxUMZmHbYuP9OIcRB4VOkIB+92BASDCoOF6s
 qBHY3o90RA3GEaHyM7+lj070zMP1kMYMgIRRcyhRQR3unAYMgpUQFkhwc3MvTWObQeaRd5k3l
 jTyIhXRhCDfDKsOPu5QlhU3uRj4QcKyq0zA6pyocIWWxZfwntEIVrUHdBnRW2OVcY1tL0eRQW
 2CE3mHo51gOPuuDRtR7U3+FmkwKdAqiI4/o2yESq7XVfm1tOp6hx03X7nuLQKfl6dAgUDMf9z
 PzXo6FXe72jhE6YiUyZ4euVUsMwgW9qcoR989iXGGQ93lA52UNVOX3jw6rn/mzJh0A84ffstQ
 wPSZguPlaRrch5iEOd+fRD+aBpIHo03Jh6KQMegxOTS/iha4UmrSzKGfqk37plAlPjBsrG8wn
 ythLgU+6GOdLBYBhPiJzIWShohIXXaGvDEANepydd3O534q37fxfSqYbssBVXfGRCt5kdYSMK
 h+n+GWCOpjOxMUT1IQRMRt0beWOUhEdjN4ratkMq/3nTEFCzhiaXRDK2KOvkh8CHcKrfPARw8
 +8EVXwiFrVnAlvsfD35DSSOJAnxiw5g9+ZJMbpOvJZOvhLXPdO5O3f7dzAyN6a6/qpx0ehA==

> This commit optimizes the contpte_ptep_get function by =E2=80=A6

> Signed-off-by: Xavier <xavier_qy@163.com>

I guess that a complete personal name would be more desirable according to
the Developer's Certificate of Origin.
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.15-rc2#n436


Should an other key word be specified for the prefix in the subject?


See also:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.15-rc2#n94

Regards,
Markus
