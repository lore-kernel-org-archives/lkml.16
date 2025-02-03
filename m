Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25371770E2;
	Mon,  3 Feb 2025 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738608038; cv=none; b=ARu5+hImsO021lhNp7COej6PIOL44jJVu4Nm+tXe9TMukWnB79SK8rUhhZiypp79O7yZeKxQEAUhFwFNNAvfHigmHBg8LUItMh3W+wHEZ1d2uYBoVrNRn93+k9fYqeQ201DnupDqZ36PHqR3flVrOkRV3+V2438cdY2oYfTuXxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738608038; c=relaxed/simple;
	bh=+6ckti/z1a7X8H97U3gdQmYqIcQSGnKdX9UNyUe7tB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gzeE8WPMb0L6N3dlaNUXvXawA5ZmtACxhMyDCoAxU3WtrW8ZIKdLsbYbKQLzH4501LN6KiGOxwidgJTt7qMOP9pAJe2fHCjkTkruIO8nd0O17BlFDjm932qXdpLTThxnt8RqEvC+/B7LyDTdWoEGv169WKVgkGWQQ/WU0fp3yoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=oQ+Bm6u/; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="oQ+Bm6u/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738608033; x=1739212833; i=deller@gmx.de;
	bh=SPsrMCij8N12q9ZkI/NgCYBnAHlTtBTY61jNeAqIMAE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oQ+Bm6u/TOAHWfaJ4ShkrmdWo+7gb6IMpAjTUMmJHUflWDKOFJ+yX5i9dxZ1ut0d
	 JcYmgpJ/uS9BifPh1GK9M9stZAdLWOUiH6QF4vZqEvXebFOgof8R/7nsR5F9FMGp6
	 A68lAiPkRgFfXfP9kEG69QfEBLr8f3qHCbiSqN8jZbMrpl24ujGjW90pP+2b3J0Du
	 XpuZHi3u4hhySWyb0idN2ftKy1aF+EO30w1WhuQTxd0GcDqL1uAGb66dt+YW/V5tM
	 pL5ZktuM5gdz4PK/JDcx0QGxAN8LJdCetV2zKwiZvaJz6thbXuIbc29oLbr3F31kb
	 WVCH7wkaXVThg+22Qw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hvR-1tGEcB3xnr-00wjdT; Mon, 03
 Feb 2025 19:40:32 +0100
Message-ID: <aabef8b0-8344-4fee-a581-5c09345b77f9@gmx.de>
Date: Mon, 3 Feb 2025 19:40:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Fix formatting errors in io.c
To: Julian Vetter <julian@outer-limits.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130134810.2646219-1-julian@outer-limits.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250130134810.2646219-1-julian@outer-limits.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tsQ5T0/WHZye1Y0OEYo+ztuSCDhlxs02gN+bcqXs/uo5YLeEeiy
 E4C4QUTR6s8Vtc5bTna+LJj2EfpeBKmzOrAS6h+68R+mRxjoOeIpkmQdKNCSXgMASAQ56tg
 vCBxwKA80LupciN4dbpS1h+JYzrTTYGbGnGcuTqKq50GhKvAquMyoC1tvC/qkP1fUdML7Ew
 QcutoyWORWfqJjxpI7lMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0tDUDlNvEn0=;/VPRIzTjK5EXLgAgxuP0+wzxEIe
 TSW0pgpOkACzpyFtjjy5AX/X855ccYK3khzVdkjevLpGMZq8O00LY4WTuzzsGtOgnLycQ66XC
 QoedzDvFHrh3E/0CQQBzjyigmJs5nzNwkZ6+IgcXerzP720hG9RqsS37lsl8Rw6kLqbWYyPbf
 csQ5Xo3gdtbIxpxoDPhpBO6j956KqcCLtwyl0OHwRmRb8Wh6d3wRm38pV5RmRedWY42l9SWtO
 ypQ5ZdFDehrnAUpdB39UnEk+8MXSAOQDGAyqPP1KHt0BmZP/ocbSjfAHtcj5fGYeClNp8uLeO
 atUoru5Npf+n4kxQUoRFOyDxuJbSuMuF9BiAOfNb+4U/QJqEyrKiAV5AO0VYKWH0AjUDo3Nyz
 EiyIg+KIW4opNETVQi3zm+oSLdL3/d4aMFiD1KzcTatP+ZXhcvrMPDD3KXeL5r/hG/ldTkHtK
 dbxIgKLfCUcIyyd+VFczsX/awxwbwvq9AodPEuRbbP+8R/AordT5Pevol+z819XekDGCVC2Qy
 MFwjaVw9xWeqTgdGXWbTn2orQWQp0cFKYA+9ouYG4w1NFuKe/KneP3DL5cVhl5GNPFcfvXgrc
 ICyGsUBo6ukeTHnYPyl4aOJMX7B2ba2exTYDw/jcYUkpYewYXzym04bo+QFWZ3t0UjOJrjdJF
 pNBN5sUe3z9y1gtfLdEXJiMnJ3NfRdPOLJYxc9FVIrU7D/ufKtgbq4QeDbPZt7Li5wkXKpNIb
 vSjRUAanjEJ12NqKf/SfogufDF95vieeFRYorQBogitrzUNHxxUCeK3wMy+qHZuQQVd4VvYHV
 tmtpVK1yvYGJiNHlLqVRijP22oKSLpX04YqiDVps24aQRC3bVBrIVErr0vStDan8b26lHdysD
 6ZDxMn+ljciVvZxdZpYc1hr70cRfMYMxw641mwE9emtnTgzbF/fMg+uXubPrFZckf2VkUBjNb
 HvhPyI5FajVzCV6Kn/wkrg6g+JIbbwM5OemShEh8/ao1jw32bTzDLJ2syyySsLNe2KesjPRFn
 o3IWIWHcsT9huGFe7PJjMI7TeVl9ZpATsUcwryoqgNpEbmaEGIluocujBJLvtwk17k7MEGdyL
 g2OhXu5W0b808239Katis+efLfyYFmp1Ifo2eLZvi4HZKAbO5ud0fXSbfpmq0TRJ/a5kTy8Di
 UqZ/sPCCm/xo1GIVt+uxvfqGdfnjXa7NZgyr7AfImjMwtaJ7o9DwC0X/ZUrVq4dAF6SQVA8dI
 JBtyYXh4quaEzshFydb1GdOTpREe6fp2oQJ3di10onxJtkLyFGChJJQMvd2keF8eq3Pwzoon2
 90FCCjMLbxXnDPfV2jQMNP1WIU61rjcekbcZBZnplPkJwc=

On 1/30/25 14:48, Julian Vetter wrote:
> Mutliple lines in the file contain tabs in lines where there is no
> code. Just remove them.
>
> Signed-off-by: Julian Vetter <julian@outer-limits.org>
> ---
>   arch/parisc/lib/io.c | 58 ++++++++++++++++++++++----------------------
>   1 file changed, 29 insertions(+), 29 deletions(-)

applied to parisc git tree.

Thanks!
Helge
