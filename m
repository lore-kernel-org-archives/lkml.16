Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695B51A9B3D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257176; cv=none; b=DL9BajRpqkjTXiaK6mvd2deWnAj3PTujJr4+ovAkdz6s/dMmO0iwovcZ1q4xE3/JFW9S2VOpoAwWnGDrdmMqxa46w88ddQsWu+aA3wRiAPDlJKznPsQ2wG3ulbmuh9OaHB0OeErTalL0Sf9HZWSXEHe6waRY3wa0TUK01RjiLms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257176; c=relaxed/simple;
	bh=ur0artwUtDxd3VWQjPf9ERg/1gnT6oE0S1nU8jpMtW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpJJ+lOinPYsIHltyePk5lJ+SmvlRaYYcfkwD307JXoX+RQZ+sqW55Kpc8w/DA8WAO54dTVRfzE8qrqBsDxaXP69dODckcqEVu88D5EJk/XQIUF3+0ROSLEdM4pytwU+BaQFKlQkK0zLS9yM0sWmlCp9TLJvWFSIzXkHW7ggXqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=Y7IMOB3Y; arc=none smtp.client-ip=62.149.156.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="Y7IMOB3Y"
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id JVVEu52H8yJfSJVVEuthOp; Mon, 26 May 2025 12:56:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1748256981; bh=ur0artwUtDxd3VWQjPf9ERg/1gnT6oE0S1nU8jpMtW8=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=Y7IMOB3YeTG94MLghIAKgJR3U1C1bg59bKWbDrcFKYo/h4pFvERSu6JQdtZaG7X34
	 IkJyKJ2T/sGD+6XHPErMqPBoHs6xl0uB2EHJFYViKmF2dxbyk12uQ6wnvjEJnFeFAm
	 fVq8zDXx+0bVaMT7mqjfOpvW1wnaYpTRasZg6ijviZsIDdgfBnLkKi+nlb9e74PAXW
	 20lNWU1DTfXR5GpmcsKlXLZfmEtnMqqoxLCY8sD8bBW0sMMxZPKl3r9DhPxREX35zh
	 6Lux1NUqvqSu4D9I9r8EVj45ZyrQe1AXygB4cztwPgY73CM5eY+oHtuKTmEvZFbna4
	 KTGIhXWhgPOlA==
Message-ID: <a33548d2-040d-4a51-8fc3-ce3042ce4a24@enneenne.com>
Date: Mon, 26 May 2025 12:56:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 2/2] drivers soc: add support for ST stm32mp13xx family
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Fourmont <eric.fourmont-ext@st.com>,
 Yann GAUTIER <yann.gautier@foss.st.com>, linux-kernel@vger.kernel.org
References: <20250519130859.3389704-1-giometti@enneenne.com>
 <20250519130859.3389704-3-giometti@enneenne.com>
 <0fb1becc-94b9-4632-a3d1-501de2607a7a@foss.st.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <0fb1becc-94b9-4632-a3d1-501de2607a7a@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFo1csT4xbgLxuMpGJtJRx+EAf7Y/rHkFZz+TeSUKe+m0DddpvYH74ILxdW+OnmkM57os2Ev2HmySf4TAqHLGXy8QgJJ7cIYLXa9x/k2JxhSUtGUYy7w
 kHpAEW5IdZXxphbZs90oXDCzm0QUy3Syew1Ae+WlyNzLL2CfkpY9m0GNDUf9mkRyeLJblWx7ZiIvubm8Cdt+hb8GeQGTgwL/FiVgot36JrYyWqhE1ADGhnev
 x+G+LFQA4FefRN1TgsroQp/SxaIdfXvb5akAli2y3xZf9CL8CiZ1USnIXtCnXUCrY/uiOWI9HMbp8JcMfxHO9B8y8kXj8sBoDgfPop2kcm6GaeFkXxrPcNW8
 yfR5y4eD

On 20/05/25 10:55, Alexandre TORGUE wrote:
> hi
> 
> On 5/19/25 15:08, Rodolfo Giometti wrote:
>> This patch adds SoC support for the ST stm32mp13xx family. It also
>> adds the special attribute "secure" which returns the CPU's secure
>> mode status.
>>
>> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
>> ---
>>   drivers/soc/st/Makefile        |   1 +
>>   drivers/soc/st/soc-stm32mp13.c | 253 +++++++++++++++++++++++++++++++++
>>   2 files changed, 254 insertions(+)
>>   create mode 100644 drivers/soc/st/soc-stm32mp13.c
>>
>> diff --git a/drivers/soc/st/Makefile b/drivers/soc/st/Makefile
>> index 6c71607f6c89..c84bf510928d 100644
>> --- a/drivers/soc/st/Makefile
>> +++ b/drivers/soc/st/Makefile
>> @@ -1,3 +1,4 @@
>>   obj-$(CONFIG_STM32_PM_DOMAINS) += stm32_pm_domain.o
>>   obj-$(CONFIG_STM32_RISAB) += stm32_risab.o
>>   obj-$(CONFIG_STM32_RISAF) += stm32_risaf.o
>> +obj-$(CONFIG_MACH_STM32MP13) += soc-stm32mp13.o
> 
> Your patch does not applied because the file does not exist. You can't take a 
> patch on our github, push it as it is without rebase it on mainline kernel.
OK, my patch set doesn't apply to the vanilla kernel, and I'm going to remove 
linux-kernel@vger.kernel.org from the recipients list.

Stated this, where should I send my patches? Would the 
linux-stm32@st-md-mailman.stormreply.com list be a suitable candidate? :)

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

