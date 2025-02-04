Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330D119C54B;
	Tue,  4 Feb 2025 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738662107; cv=none; b=dtl99/B87/XNCwpGCdG5YnJdHyrq/C6dNkNoPW9Ur8uLWsMti6zXxKePXpJ+3oURwRCsnGWQv6RZP7VI3qEubStGIxbU3WX85T9+HsMcWZMmNQ5kr9uYLdUiFRfPh0mSocy/XLb5smRUTWbygHGmmOxVdX6kiELSWyAbIKhrn7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738662107; c=relaxed/simple;
	bh=hmDF/89UGFdHZOQdLxKg7A6Ve4yC4JgSL47ZunD8KSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDfsR2qR4ad5p6+JXo7kaaFhczCvaRyPbcYSs7iB9hY0WdmFy/PJLOI3vMiwDsuVmxFqAbxwyljclD1jyf6tcfGUIRvm3mvW3U7HsMTRpF4OLkeD47dyespg9gh1o+cKr/ikN6hTuu5jA7MhHfTG9Xj96Tm7OZzPD1kXJeMTW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Af7vOTZB; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Af7vOTZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738662086; x=1739266886; i=w_armin@gmx.de;
	bh=hmDF/89UGFdHZOQdLxKg7A6Ve4yC4JgSL47ZunD8KSY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Af7vOTZB3lttaz7BnG+m/qhQlgy+6XhWQJdSIuXW2kknv6jQBpOFyasU8FqJxPj+
	 eHD3DXP2R4pqgpHOOe9869geKIZHJrRRuriTWtHsSeuAVc+ykX+J8SKNjcEmIc7dl
	 1qmy09O919IZHxhCB+Me0pWI8dPzzZjKdtae541CZe4iCX3PiPzLao99FJCQUxw3C
	 tr78v2TlJ71VhWxUJttg2FyUaUfsm8AswVVDd6yKzQWW41LtYXNbNQDfjWRvtftO3
	 udv7kBxGEOGcdlsh4zC45HTeunT6E9OOgnDEIvaE83PNnJbO0N2ugHvYEVrOU+zm1
	 WdmdcJN70XVX9c221Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.238.232]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1tclXb22cD-00Gd8h; Tue, 04
 Feb 2025 10:41:26 +0100
Message-ID: <e14ca038-e9fa-445d-a26c-de91d99fbd24@gmx.de>
Date: Tue, 4 Feb 2025 10:41:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] hwmon: (hp-wmi-sensors) Use the WMI bus API when
 accessing sensors
To: Guenter Roeck <linux@roeck-us.net>, james@equiv.tech,
 markpearson@lenovo.com, jorge.lopez2@hp.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250203182322.384883-1-W_Armin@gmx.de>
 <20250203182322.384883-2-W_Armin@gmx.de>
 <0266e0b1-43fb-473b-995d-bb92662505c0@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <0266e0b1-43fb-473b-995d-bb92662505c0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:BK3HowZ6nOqAceZkqq/8+FkRoAINgf+3zJLWGY7e8AvVCxWWuZi
 KTg77SgZzNuvj6g1FD2B4WK0gRcbvL7Ty7ZWH0R41ixUpmdLmFFQBwRU68N+7sa/mtcwbjX
 SgziYqUtEeLt2AGUxXLEEZ9pivfZxy8aZSE/fS6xxgwzoIzURCY13nW0UhJYl8w/8Wc92f2
 QenH9EXpjd6hm0JW/1UxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HBVKY/kMOA0=;kIV38TsmmZZUPu1R6id+wR1nCNY
 1/q4Yr6jPM3qT+XoNa1KNNfsF3MGyrOPzJXrHX7J1bPXjEv8vICUcEG7q+Q7inhgjuzZ8LdXk
 MjA44z29HNS6RhTN9HitpvnY7PLaFa/bUdMheg6xQtMacO3vTrVlgRwUZkKug8bX6cjR4zfNT
 v9PR9imdIOFVH5OcxzcWDSGlkYdWSlt/FEKlJczWox4zTHxrXpwf/9FmV9OOW88m05qAlYcMh
 GRQx0HLm0lEktt6ArlElg/Du3DdsjTEyWTqpA2dbhXBLwhHVBRRKejR4rBr7vfnZHrfyPM4Ej
 rslSj3SowX8N54eSJXpGYNxt76DnhXjhDi5OESieXV3ppwGCu4f2fAv/H6QUXjLpTHW1UL5IM
 Qul41eMMDlpEPx1EA4ENmJyom0Hy1tIGgtFlcVqr7NKLKvwcy1tFOrLOnv9CRAnF3B175I44K
 lIM254w89suEsCYKHF0htAaiBweLVdEKF4DHcF+HAuwe0+s7Fwzy3UIawBFNzBJXoJJioLRVo
 MQt2XDCNJOaXtci9h+tsnHZrLq/p5VC6TjGwdboM1nAm1NZaB49P9zdY0y2uOjSG6QOekjB7A
 7MyVC17bOMmtyBLvyzMH44RUeBTMgfNKl6avI6qBI7InMJWynsRjjUtsI2USiEy42TSCx+xKX
 wzJdAJsVx69f75Z3+76lgNeAmXRdRxEcisgOU0pRNw7lDhItIqRhbj+i2w51qHjvG/eryhQFE
 D6li4TOASHxESZEB59auK1/Ip/l0/h8U1E4UQWKOq5QsCVHKvyXOjhsMi2v4KBjPCFTFdGZa4
 GYLT+0tlUXbNGnrGq5Vl6ozTwvN0t5G9/IX/wkl/Df30HY69T26WeBPUdWgBieBeXRXCDPohC
 NOzGboepy1v/QcwKyi61TUv2zHnp5msC8kvWti8ne1AB4mQXQa9+WzORzcbsWSbmyWl/RgMFF
 ho0K4pnTfvj4epOt5cYKjmfGaZV5WBrxczfDBkEMC+piTX+2mPMORK6J7YWsk2L+V/X3MAWpv
 mcITkE0nBrgEPoiAW4kjZUEQIfYm6j8sVSZzmBH4SKbnmt/dGE6lN0ab8Aiam8SPQnUZQ5cuY
 FmD/N6rYYZ88lO0CWkMK52aLolmwN03a5nlh0goLOMNS3kdVFG0K0xOTvV13FvAX4X/SXTCag
 UfpXLJGb2gDC/FsQNyFMotjjyE1bXKk4MGAcxhVNyveBCG2Y8xAsngbUQKKmg2UQFNqiYvfJC
 nUCIAe4RVt48rSkrchRNUzuJrwLRIteoa7AR+EAjOS5t1Iv45gwFf+T//BgUn8VaKmv4+PC/V
 sT4gRZKjydcjVy3yAJNuaHZpJglcu6KHVZD2btacJLw8KY=

Am 04.02.25 um 02:18 schrieb Guenter Roeck:

> On 2/3/25 10:23, Armin Wolf wrote:
>> Since the driver already binds to HP_WMI_NUMERIC_SENSOR_GUID, using
>> wmidev_block_query() allows for faster sensor access.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> ... assuming the series will be applied together. Please let me know
> if this patch should be applied through hwmon.
>
> Guenter

Hi,

i would like to have this patch merged through the pdx86 tree.

Thanks,
Armin Wolf

