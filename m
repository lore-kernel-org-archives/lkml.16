Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA81204F74;
	Sun,  6 Apr 2025 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743942462; cv=none; b=ukqG+qniAXBXY3TgeyDoX9e+xnwXmVdZM0sqKp5sIlP5eqTePOaldWD+K18AKQ4miH7aHuK93IKUbHJ+IInKEI+ebA3Muv3mOsOEhaHoFaKacI5nMcNdrnDR/3mg3dhBqgPOa9M5F6LC4MA8Oo6i5LRm+QqIVLhXuvAfWrNRR2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743942462; c=relaxed/simple;
	bh=pQRFZENMWMTlTRsYmIZ12fbtvFY9s3UsPhZeNTIwvGI=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=PIZlMtPsgG5qpWfthum3sfB9UQv8KaLaDNdvUl/CtBKB/XtUW/+o2aXuUGOIReSjnFLo5NN1/M82QNP2ksTr9C7JyInQSVB1n5EVimEugi+ByqFcSf3E+lNXBqKEgpWDk/6t32KXuno78j072+f56k3/GFVjGdV4EsHtGEM8dfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
EX-QQ-RecipientCnt: 4
X-QQ-GoodBg: 1
X-BAN-DOWNLOAD: 1
X-BAN-SHARE: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqR8S82H7qn1Oxm2FVl4Q1iwpPBgFFupyIk=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: ss4VGnAs6WCJ/TFeYpQOoaxZZGY5oCZhqIJiIOrICoI=
X-QQ-STYLE: 
X-QQ-mid: v4gz7a-0t1743942420t7357572
From: "=?utf-8?B?5bC554aZ5ZaG?=" <xizheyin@smail.nju.edu.cn>
To: "=?utf-8?B?TWlndWVsIE9qZWRh?=" <miguel.ojeda.sandonis@gmail.com>
Cc: "=?utf-8?B?cnVzdC1mb3ItbGludXg=?=" <rust-for-linux@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?TWlndWVsIE9qZWRh?=" <ojeda@kernel.org>
Subject: Re: [PATCH] rust: convert raw URLs to Markdown autolinks in comments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sun, 6 Apr 2025 20:27:00 +0800
X-Priority: 1
Message-ID: <tencent_2441D11C4D8973701A185871@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <95E3B7B9ECBFB14C+20250406034811.32347-1-xizheyin@smail.nju.edu.cn>
	<CANiq72m55Fi-XyFz=h7_3QNj+mA0N+E9Vo2_anLFyN1sr-FXMA@mail.gmail.com>
	<tencent_3DAE6B923FC67B543D90D970@qq.com>
	<CANiq72=c7yzLM4C-zctYFpUnFbQ2o4i5Uhp73xc4Td3-H_yDeQ@mail.gmail.com>
	<tencent_4FDA7C47625666C054E0F8D7@qq.com>
In-Reply-To: <tencent_4FDA7C47625666C054E0F8D7@qq.com>
X-QQ-ReplyHash: 3724270157
X-BIZMAIL-ID: 17346718197558786399
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Sun, 06 Apr 2025 20:27:00 +0800 (CST)
Feedback-ID: v:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MMnP0fEUKo/hiXEs2LNYYgK0zOJYS2960t0ZAUQ2t07P+3WNOOQKTlmV
	jzpXiVj2//gfg8BjZIQuG0uHHXVibJ2HoQBhhg6IazKevFzZOhNK1WY1M+mJjlSy/ujYmDl
	mMxICBvP9N67eRncPCSDoWeAEkfXb7NcztiB01qw3Z9dYzaVg9IodGKzo5y15hhiwgqfdNN
	eNpubbte09vmcMjNpa2bFW//bH+UZ13rIIC65xS8Lq9IY1XTj73ChMcEPQZC1j1/+0nFtTj
	MBV5OcyEqY0RGzAajW3PWcjUtwtClqYnj8U3cTT/LGYh+Uepid8W604JsOOzLRN0JETl2Yb
	VWFjhdTX1BDmOo03+O/1A8u64RuTAgMaIRU2Y47RcC5BbXgwFwRn7ndeXGyXNxMAbFWp42o
	k3UhaUlQCFBCxhtx5A8jbFDcq8B0nzQEXprq4hY2DomLHnri5IhznR6qJToSeTx6HeDcI0O
	sCQ2+C/O18UzyF67g+JpiRiULOUqhfFRBlCq/9Z1rh6EBTDmjuS42nxAKwXnDy7YJWlhI9v
	IPLERYZAP0fY5kDN1T4nzh1YnJvVkr03ikBHFNF9OqoAZkp2h9/JV2pdddbgplGPZjR1Uh7
	7bGz6Z8ZnaC6wvbpXiQrzDHDuR5VStimRzwIpn4gh3nWOaKYjgl48okasQyhQoTxfSTsBb7
	7xc3AExLMm53eV3Mbq/QJPophNHTp6vBmNHi+28z/ZarMbDlxWeDX+JeYd7vfwIEOCcgJdo
	29jsyv3yeIYmpw7LbeANLiP7vBLIx7/X8pPSz5X7lLMeWjRgehCvzSa/tuRcShvvtXekR1j
	Ai0DOKLmjdzo7oRRWie1WOqImbDjdkrlmmpbkPMzFKSJvPRhfgXfxf5p3FTF2ucBFLSIVIV
	WnaTkVWi+EQEfQEFHt751nQAftA+WVE18S14lo7vKdHngpypWqgYgIi5Bc1bY/47N8tBSAf
	BiN0oVWC4ZmPs2lwNAGAnSf1q+jpIXRKtD/LKJr/PuuLoVOd0pKjvlW8nwElvVtSCo0P1+x
	9AT70gSK6fY9L1+mHh
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

SSBzdWJtaXR0ZWQgdGhlIHYzIHZlcnNpb24gb2YgdGhlIHBhdGNoLCBzb3JyeSBmb3IgdGhl
IHRyb3VibGUuIEFmdGVyIHRoaXMgc3VibWlzc2lvbiwgSSBhbSBmYW1pbGlhciB3aXRoIHNv
bWUgb2YgdGhlIHByb2Nlc3MsIGJ1dCBJIGJlbGlldmUgSSBuZWVkIHRvIHNwZW5kIG1vcmUg
dGltZSByZWFkaW5nIHRocm91Z2ggdGhlIGRvY3VtZW50YXRpb24uDQoNCkJ5IHRoZSB3YXks
IHdoZXJlIGNhbiBJIHNlZSB0aGUgbGF0ZXN0IGVtYWlscz8gSSdtIGludGVyZXN0ZWQgaW4g
dGhpcyBwcm9qZWN0IGFuZCB3b3VsZCBsaWtlIHRvIGtlZXAgdXAgdG8gZGF0ZSB3aXRoIHRo
ZSBsYXRlc3QgcHJvZ3Jlc3Mu

