Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E5D23AD;
	Sun,  6 Apr 2025 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.62.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743940603; cv=none; b=Bmco+UrR/3SzpJXhN65coNF7scv8l4wTRHpMWcjSG5UUXf18dZVmnz6Q965umgS2y3YCYVEbeG7mZsB4n4TnQe23d2gJOWghG3CH7nPCoqk5uEFz2ARrjJudyLaKavnglkkN990KFv3qWgdg1zV0tpFJK5HHtmLlsKBL1FypeAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743940603; c=relaxed/simple;
	bh=BxdzTW8ib3V+3KbWH6xF+U5AcyodTwlXgouajQjRFYI=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=scmjffmQqc1A2C4n18LYk7eVB4vbr0ikJsvvy1FJ/QZvmd5QIRxv4u5jm+ALhL9e6Af/Wz2/Ol7XN+TxkLzra1qiF4pcsbsHN8hzi3Yy2bweuZ3koq8ReKrxRZ4xc9hui9R/DtqDUz4fhvEmMTru01pxw1c7fxNz7JWmFUhSFuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; arc=none smtp.client-ip=114.132.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
EX-QQ-RecipientCnt: 4
X-QQ-GoodBg: 1
X-BAN-DOWNLOAD: 1
X-BAN-SHARE: 1
X-QQ-SSF: 00400000000000F0
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-FEAT: D4aqtcRDiqSwD4GVK8+FEJnPlruXmtq4qU5krjXbf14=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: g5/04QnXxyKpuFGe5poaA+oaNEJlsNa8O24RLm1E1Bs=
X-QQ-STYLE: 
X-QQ-mid: v4gz7a-0t1743940567t8733394
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
Date: Sun, 6 Apr 2025 19:56:07 +0800
X-Priority: 1
Message-ID: <tencent_4FDA7C47625666C054E0F8D7@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <95E3B7B9ECBFB14C+20250406034811.32347-1-xizheyin@smail.nju.edu.cn>
	<CANiq72m55Fi-XyFz=h7_3QNj+mA0N+E9Vo2_anLFyN1sr-FXMA@mail.gmail.com>
	<tencent_3DAE6B923FC67B543D90D970@qq.com>
	<CANiq72=c7yzLM4C-zctYFpUnFbQ2o4i5Uhp73xc4Td3-H_yDeQ@mail.gmail.com>
In-Reply-To: <CANiq72=c7yzLM4C-zctYFpUnFbQ2o4i5Uhp73xc4Td3-H_yDeQ@mail.gmail.com>
X-QQ-ReplyHash: 3557925258
X-BIZMAIL-ID: 3044392774991309998
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Sun, 06 Apr 2025 19:56:08 +0800 (CST)
Feedback-ID: v:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MpO6L0LObisWYwfrzyo9jhYgQzsb451TfQm71Y6r4aQxtEMqRfA99HoY
	cdKWfIKCiPeUzhFg7K/Zakdq5KoLEbrBNzoFomJlbAGUs+hLkN7jI/m+A76EeOwupsXNkrY
	VZ1zCdgh97GbDaMk0vrGYE6HP+wIk90CughPm2X+uT7wCM4WFjubKuMoLl+XWbYWVOboo1d
	YyKhIktWDRRFlLX1b/bOXNmCkyvxQ2ObIX1N3Vk+O/O6hEARTFMFMqSJagV53X3YwI+E7fa
	XVKH+jj0Z29FgywgaYWWPoDNJRIHlYc843bRHaOfHCVyx8T1lmSfNapG2o4nKaT2pnaATl2
	lo+KN9wBWo16kQNMyqKH/0LnmjQ8jlg5h7hAaTAWOXeeOXzc0UbzAhbAaWOQU93PcgYzhDI
	PO7/1gxyXOd+eZsWDyQEtoG5SgRjsjbRVXjepGGNu0hToHOmQ1Oxc3KgKegEltkrHusnT6G
	nT4M2kFCSx7P04+giYFKLrT6tVxgPAHRG/pqP83nbiYAyEOdq+sugGDBbm11sWhC7vCcghw
	FImg/k9TV0Ngwe0SLzL2pwdGeJJPnDH4E/hO4fYLU49z8K97gR8mjEGuSVmBUKXpcBCMSkv
	WTqu23U8hY1Tky9Cc2imTAdMcidQYYS/fB0mXNs9H0i0F77guM5gXseDwqZ3uIy7XUdQ98l
	iJ1IEjq6Z24NGtl4MWoMByngdcT5YVlV38+pJjsWRuOhOQk2VocVfxsQMowmKALQ8LO73Ni
	YdOoNjjVYFKFS5O+fjtxDRu8mGWjgiO69o0OQuXJfFU/rUAFeldCAFPENDT1DLgr/4O8nYS
	M+dHNlE945LF6E4Gh9nsRYmNhnfCl4EMLBRzUOZZX+pnVjauKJlhXjqPT5CHYmAt6G16Y5w
	fO6pse0d5SVWAg3aCvKYP9y0uYhFPOeOsb8UY8/K+YHkkuRvxifDr7FCs+G7K8/mTqwjOLM
	DoFK0TMOC8PSDUMIYm1RcFKzyZJXYmz0pik8BdVbiFUhdBwOYJ/xSOq57
X-QQ-RECHKSPAM: 0

VGhhbmsgeW91IGZvciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRpb24sIEkgY29tcGxldGVseSB1
bmRlcnN0YW5kIGl0Lg0KSSBqdXN0IHNlbnQgYSBuZXcgcGF0Y2ggd2hpY2ggdXNlcyBhdXRv
bGluayBpbiBjb21tZW50cy4gaWYgeW91IGhhdmUgdGltZSB5b3UgY2FuIHJldmlldyBpdC4N
Cg0KQmVzdCB3aXNoZXMNCnhpemhl

