Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5A5770E2;
	Mon,  3 Feb 2025 18:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607992; cv=none; b=j0SmQ16kY6mQ+UILAL76MNQy+gQoF0i5A+sXfXHfLTXnS3TiTCW0hiRXnuHbPB0HzVof7EfRIWjSMTebbPtNaezosm672p4T1nsglax6sko3xLBAN0VxcD/7Q3af6dSHOzcqgDMD9xwVQQ+WfGL9iF+n84m9hKnguxj7VOZ6HPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607992; c=relaxed/simple;
	bh=1ECSg/FdzmSV0OQodMbSYlZPzPP5tXnGfeHYyV+4P1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGCOp/wXApuN7av2+dRAp57NW+fZb2OCeJiycu8E4XCFUM0crk5nsVFW4KxujcL3sMvO1wMSOA+tqAV2G+aOvYGWB2jaQpkKn+pJWCfPzP/YfTuo7BZ3pi26c2SBbc2Q34KQeMZdxONpn5DqAD0y0VVKi2fSRAbgb/hci0jFUvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=MC2ryNCF; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="MC2ryNCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607987; x=1739212787; i=deller@gmx.de;
	bh=1ECSg/FdzmSV0OQodMbSYlZPzPP5tXnGfeHYyV+4P1M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MC2ryNCF6Q1Tw5QGpmwWP9+J6wiv9nK6O21t90ObJRMKKGEJ1clnlGr5Ljr4aQ3m
	 D6NuaF0N9GFsehmFO/8Cs/rMABc07WtTv7yx6Ntgsybkqecq3Wj2yqwLfk5nN1Ev/
	 zmS1C+OA/yluJtC4pRRuyj2DBYme8UsMAYXcNyX2HQkz0/v7xKORfq0048RxPiR9N
	 4ui8GiJbMiLw6RBk7mfr5QcOKRK5D+2gIDzhcjOLAlz6OPk8vbHOan42XsielpPY7
	 AobEze3Uh0UTmxlJcoa1qLx070RftQDm7mGPvgGRJPpWaHBr+QBKotKPihlmd9zaa
	 xI388EIFS7W9tprsdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1t1tAm2k8R-00Zgw6; Mon, 03
 Feb 2025 19:39:47 +0100
Message-ID: <61390496-2066-4b9f-bf1f-235d29b64135@gmx.de>
Date: Mon, 3 Feb 2025 19:39:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Remove memcpy_fromio
To: Arnd Bergmann <arnd@arndb.de>, Julian Vetter <julian@outer-limits.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130134825.2646380-1-julian@outer-limits.org>
 <543bd0f6-b25d-48b4-8039-496b8ddd10ce@app.fastmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <543bd0f6-b25d-48b4-8039-496b8ddd10ce@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NJykvA3vcriUa0/YiN0vyq6lejL9Ru4P+kP4MRJ481XlM62U42P
 gX3HtutHu+6P2XXJX8F07XGibpWsSxRdrlJD/JnHIr/2OTXFSYfRINmCas1B/Te/3zj3uxb
 mWXJVDmBqVJH0DH2EsrMhaEejb2jH6wlvkRj42oCxEPSus/kw4+9gPaECCkrjxbsD4njR6i
 qnwuQqTi0HUeU8yhTD3Og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K7pVWQhOrTw=;roAyh53KDu9P1GnOD1aWSNkKpE6
 Fcy8dJ2cq1Q9M11pkKY1fz2FKkpQbR4oCt2I5T0AKdpADQrK3fh3LAGnUZWOjEkEkRrSFYr5H
 8ldpbGZnmwEDOcIMW/a9wn7dLtrEcwsqxm41kwQ1MG6fgfPr1xuPe/EeeubAS6U7+CYp6+N/e
 jLjrylseLFplZROe4W42g7ZeemvHnUXs5VNadlT+LqLq32ipUDgMWQXWliVbbD1DX+jRinEGZ
 zS3CexaDxhgjyXe0JAGV5xN3qN2CnM+tHeQonSX0V+YcAF4lliuTWHJywHzQWHIgmfW+T+wjO
 W3wEEeBGMMdq3i8XCdIgHBoDu485nuzt0xxUZFC6pITIp1MTiWhCOEG/2vnRiHbIcCtitv4V6
 WYgdlyTYzLIhk3tGOqZjiSN6+6Qj1VS6Bf1MvrIkPxVXfU7TUC0UJouHd8sNWrp9SrKMrFL0f
 3LNKMfGXlr/9fUhKtFAnl3qmX0FiJv2F6DFYxIcom1PMFkIt1Ou0jrH6ktIvksuQl49AZ/BB9
 o3TlSM/9kVy34rdvnW/jS7ScZ2fiOHZgSt4QSKhK4kAqhTgrxDryXS8Iv9ypeFvtM/71KjYqK
 g9gXQ7Ge7Z98Coy3is2qB1Ej5a47o8jY+98SfVB9ASWFcVCeeC5fTGjiBGeHw5eGI4FlTGnkl
 77uROCKlgFWM/TgpHSdXE0FI49F2v5BaPJBiL4nRYkFMTUIFj0/quHPKZzaUzse5kYXKDtZ/5
 yt3Bt/rg8h2zEj8mE/YaAQHwog9Qsa6MgKZIOIv6RmNZPCQ8F4vTZ2XOl6VDUmIz0eoN0QgVM
 40m5DqJ8DQSgMRN8bMblqysc7WTFQ81F2PhK9RHX2DgRrKoDk51w1r1iH25y1LJHwjl2bT2c4
 NzLrRP/GNy8Y/pULiCZOdvVpoS+3AweEWghWTlGy4nmM1tPn1FcsK6tO2UqG7i83kQIRpidUt
 JRqBpzPVSeQvxMDwjkwjE3i7TpBt8yMbQaglFUOfdxodzcVnZ5bp2GEJAOTuNCSpnZ4a9Vlqi
 xedlmIv+QEgd5+M1DL+iLZoZp44oJU1hukZOsZablWMXILzmJwl/G5TnLUFVfAgwQ6D3ctEAV
 yUTKNFjNNHAjFt9VfI73oz+j1LbfetOcQKjmJmkJo7DNGxQEmMu6kuf7XU5/yQPwbORTxStbk
 CmwzUvg84k9bvUceaCMtnN2sTN2snZmmfISY18Jw4kp5RRDKeJ2NXdOWkfnldJvycA+L+x/0C
 j9M2915RGHVGMtm5kSfrw0fCS/QiMOHXhll/zdPV4AYH7vsorY3NSFUWd8rtANXsMhgnmqGro
 4CxXQFIzqOD14OpvAC+oUP2p1Ckpe7DT6qLR4/idzZCd2I=

On 1/31/25 08:28, Arnd Bergmann wrote:
> On Thu, Jan 30, 2025, at 14:48, Julian Vetter wrote:
>> Fully migrate parisc to the IO functions from lib/iomem_copy.c. In a
>> recent patch the functions memset_io and memcpy_toio were removed, but
>> the memcpy_fromio was kept, because for very short sequences it does
>> half word accesses, whereas the functions in lib/iomem_copy.c do byte
>> accesses until the memory is naturally aligned and then do machine word
>> accesses. But I don't think the single half-word access merits keeping
>> the arch specific implementation, so, remove it as well.
>>
>> Signed-off-by: Julian Vetter <julian@outer-limits.org>
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks!
I've added the patch to the parisc git tree.

Helge
