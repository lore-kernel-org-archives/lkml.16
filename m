Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id AF70BA55;
	Sun, 27 Apr 2025 02:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745720186; cv=none; b=S9HKC/fjuX8aq4/ROXCPDfyreQZflkGiFwaLabcLyvB69zINlhXrat5GBT7rhaAJpilxA92mMCrZ0Sgb3fA1LPDhw0a4YhqDWqFK/uVf/jmN+o0mQUAHcCEqFaGTuKKkr6aGYYnZghnUiU7PdhVDifXRCIDaKD2SsTtlikAPKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745720186; c=relaxed/simple;
	bh=/q0FRE+v1qPsc0eFD8lo0CCwkZ5YXnSjk3zedmKHqR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=ffleMR9OJhZcwAbGiD/9vgAlKzXiFsK2DipAvVdf4D3BPIfwiTu0vy+grnRQoxCJu49cWsT5jSKyAyojQvVns/IHA4kWbbZYbSnnENvc2+ZGW03+PkTup6PhTZr8ZLEYNxzAV/MhZvtn6AvpQlrzyJDsCrOnEAmFlbuWJIPBCJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 24EBC60171E8E;
	Sun, 27 Apr 2025 10:16:00 +0800 (CST)
Message-ID: <d306f10c-457e-493e-8d06-6d9bd90485ea@nfschina.com>
Date: Sun, 27 Apr 2025 10:15:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] alarmtimer: switch spin_{lock,unlock}_irqsave() to
 guard()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: jstultz@google.com, tglx@linutronix.de, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <1ec38ba3-000f-4e26-b18f-95ffb3583836@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/4/25 21:04, Dan Carpenter wrote:
> On Thu, Apr 24, 2025 at 10:48:20PM +0800, Su Hui wrote:
>> @@ -230,15 +226,15 @@ static int alarmtimer_suspend(struct device *dev)
>>   	ktime_t min, now, expires;
>>   	int i, ret, type;
>>   	struct rtc_device *rtc;
>> -	unsigned long flags;
>>   	struct rtc_time tm;
>>   
>> -	spin_lock_irqsave(&freezer_delta_lock, flags);
>> -	min = freezer_delta;
>> -	expires = freezer_expires;
>> -	type = freezer_alarmtype;
>> -	freezer_delta = 0;
>> -	spin_unlock_irqrestore(&freezer_delta_lock, flags);
>> +	scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
>> +		min = freezer_delta;
>> +		expires = freezer_expires;
>> +		type = freezer_alarmtype;
>> +		freezer_delta = 0;
>> +	}
>> +
>>   
> Don't add the extra blank line here.

Will update in v2 patch, thanks for the suggestion.

Su Hui

