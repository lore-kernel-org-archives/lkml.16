Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAFE1E9B1A;
	Tue,  1 Apr 2025 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507947; cv=none; b=bi7GCYhoZNo11wnMK0f4WqHi2KGgN3nIkP01VrjkxfAaOA9dQ2gQ3ejHpQ6sTiwRjZAMosDRqR/qJczyCkZfxxk+clMyXwXKjq9Y5/zTXsPLr7BIk0ZQABSE+QkEY+l7PxCRYD6wCAnOwaAZOOtG6BIwiB4dh/joB8FQiqGhFkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507947; c=relaxed/simple;
	bh=aB648o5YY1TqC9NWUirl7q6IvvMzNQQ6izOuYdpRBGc=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:
	 In-Reply-To:References:Date; b=Loyx7pvPhPsCHd9yhz850Ki8JfkF99iDYqt6PMD6iQwMR3OYjlIYL8Tysaq0Gr+mIEWfnnQVLz1wSOyIHblxS1ggSJELIizAuILamRef1vMqndPvGPmjJt07tVmJsnuXcK863IqKCL2Ozvdm0OEOFJBBJs4j7CM2HGToitgGFYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=ApD74cxw; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="ApD74cxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1743507920; x=1744112720; i=frank-w@public-files.de;
	bh=aB648o5YY1TqC9NWUirl7q6IvvMzNQQ6izOuYdpRBGc=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ApD74cxwr60+65cSJzVQOLtyufSKqdjWNZwpD/NTqtjv8ePB0mjaosgMo6CtUauK
	 qrl9Wx26wZdXYmH88IW5HO/n6HgdxU97eJXsP+vhq+DfhdyOT6/ZQF0RsAnzolXbb
	 1ZeahTX8FEMcvSiiNLKvuBsTQXPDbBlfxXYgY0RcyQS9Aq98XmEs6UBrRRPNreyjT
	 7mX3wZg0d+gEEIfaA5gzgHuVBrZLp5lAVr2lnuauQ1ANGv7ALqohrq3I8cjyRIWk4
	 YlN+rZnGPq1UaaY6ngbn+Cs+bNszHXX5UxORM0ZAGF0Xsoc91R7CQBOT699CyoZQq
	 R6xZDrKjmb7kEvlEAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.145.244] ([217.61.145.244]) by
 trinity-msg-rest-gmx-gmx-live-5779db864f-xlr59 (via HTTP); Tue, 1 Apr 2025
 11:45:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-2fa9ed21-07af-4fbf-a20e-32684dabdd82-1743507920209@trinity-msg-rest-gmx-gmx-live-5779db864f-xlr59>
From: Frank Wunderlich <frank-w@public-files.de>
To: angelogioacchino.delregno@collabora.com, mikhail.kshevetskiy@iopsys.eu,
 matthias.bgg@gmail.com, daniel@makrotopia.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Aw: Re: [RESEND][PATCH] arm64: dts: mediatek: mt7986: fix pwn fan
 settings for sinovoip bpi-r3 board
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
Importance: normal
References: <20250226050132.547353-1-mikhail.kshevetskiy@iopsys.eu>
 <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
Date: Tue, 1 Apr 2025 11:45:20 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:yO9aGdXbvADh/oQI0VHxmCucpkTB+ojEJkMcxZCfRjv2ZJ90aw3qVZTkH5cLASUJx9Nur
 Og6p2s8UaNE0KwUXlloc/hHbG+wzNhFp78q5Vb54eEYjbbxuOEEMsZbN8jEuT+i88ImC/O40hrPc
 sa/urpEYkekuNC7/Nn617V93ul1xotaU/38Qeu7qVhQhF4LulL6URd/E+03t4AGJifoWdA3GDs2F
 Gapu3bI/UMBg5UxJ30b/ZmATIPFiG3aPwmnXU8bPKyUceaiVlyGVgo0k+57a49RdUiTexGve4McC
 +sLUlTB+bslcL0DhNrAOfN565uwEItKzvxrLR47LOH6zknPCe7RbVFgRzsSKWa5q9I=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ou5OEG+zFwg=;aKeVcj8YEdkxAf8v4DSOSDw4ziz
 NcJfgTMEfH2INfC98FxnMo9HOmJbOoYVBVOPX+sBjoCQn2CqqAyqrNAyxmtz5CgalDpPQn1ba
 xfZGBrshdMQUBqu31xsG+oZSc3SE8PU+pniCSbUpXDXEqJa5HTQcuqoaYLn4HFHvqgwEJKvbI
 7fHQeE2sePpXv5JGaSps91PxWdqpIkcEkFyA0P/AvcHaPl5HC2i4gTkRh/Lrvfefo35mrV7fk
 BxYodTWmHRHib2pFY6ikV+6SJGArijoxL1RA/j16iEjZIcMFelElBLeZ3hshh+3yhlXQwaeii
 sNrZOiVYRUUOVU+BrfZsUC+5Jjze4tn+ZLS58nb6r0u+OGmpQpErB79sXVrwQPTfNgX+5SsaE
 o2kkWV8p9GVWxfNYP5pyhn9HPOJZf1IEfvj+ppWJtx4aUxzns63QPKM4WRfbpTPgHC48pi2pW
 ZnamhlbJQgL7smDq1lB/aJMaIktH2cZ1nXsOKA3v+zt+t2I68Ob6Q0LSDHZaEnHY+npTDEF4S
 61qUgYsBHuYfAlRC+exDCYGhb2i11ebgk+UhaXh+c2OsjkCAicy34JAaKeZ1ZCiJenqVqsTIZ
 IFI2eeKZgNlCHMN641uF4N8ImMLYUlZ4853piXi6iLEIHw0+bykkR2jUjzDW4kSO9j5jio8NA
 QSUNEwq9eym9OAuK9Id8FFmHikmNZSVxbWh9yX9CGbSPcbiUFv+sAKb0I6Lkqs7aeE53e1O3R
 JQeQAYnGuDSV6Cf+HN9+DXas6HMbqfFiMuhQCLDnU0BMjjJrhzUuEAqXZX941nIfea7FIh622
 C6/hRVOugy3qK71SE0fNtb5jtpT7nHSqqWy2vVu/qSyytQR5cbEWQNKaEn1UwwRnsZGjFwmhy
 gKLMHY9gSThbzDXkWXA8K681pg2kVQYOKsVwmDVD3+x2RfI0K65gVuCabQO1y44SqMixp7kvr
 KdFseEnxVF5riYLsiRXcJiEbKjuKkR7LmUywICt6aDVzkbsR4vy88T1AcT6eeL29O2sNjOhWf
 SP6TgCo4K3yPyf/6HHQNlvOiwOR6HVNMlvhLMzAFyA/VD2ph5CYRxaeVoF3/lfiiuo+ij8Hf7
 GWWE46ExXT6RG2cShw7Rx8+PT7lQF3utvtzPwPG0bRGzdQ2lF5Xsc15Z/eoqemxiDJEikjtrM
 cNdyQh7blA9z74XpNhpOOjzDwKxFxF182JUqFhLIIz/lFMCjZdbynMs6zs7CfINikh/qwb/Um
 dn7KZs0NFa2y2htkkhM9IMcwopsK/QSbzekajGsaPtB10eRvk2cPlkU=

Hi

ping (and noticed a typo in subject)...it does not look like you picked the patch up.

> i have the fan from sinovoip and that was working for me, but if your fan only works with new values, i have no point against this change.

> btw. angelo, how is state for my r4-dtsi change?
currently i only can add a blank dts for the phy variant, or do you have other recommends?

regards Frank
