Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0535C201261
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668979; cv=none; b=aSeltNKCe2SjNQdxwrQTfl8fAHZD2iop/EuAXBK9YwuWKcsFh9wIADzLaOzfX2rj+c7B6zaD6Iwgtw3hIYtpnmE5ZWnhSi7rnNDb2KafA8RD+2lAome400SaP9ZtcY9csK+ACe4RjPCC8XxSHmHE4rejHhgUN2wDlQKdzU6nGA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668979; c=relaxed/simple;
	bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DD9ofk7xfHkP39B6jLvwtFp8HQ419o3lTXu5qkvD3Md8jvOQiGPnpZ7MM2eQXmCPYPRL8+JdTXXNkazesnKzwlRptAF7YRy2zk1z48EyabQG7pjnUCNFoT5NrYCCfi4DDFR82XhJyRS6EjRa9GHjlmkb9iWdHWr9FQEfh1x/CDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=Cmn7MFzb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="Cmn7MFzb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45377776935so4515145e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750668974; x=1751273774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
        b=Cmn7MFzbwJNMdkIe955KZB2BTmHIMg20MH/BA+NaTGT7fogT0CUMeHoO1um/yM47FT
         9Aa+pBtMLF7LsJUczdvKfjF+UZFl9Tq1ynxqDy4a3eGbuBGXpbkJ2jEPacAl4XJheSIX
         xgs1XfsakxD0DD/hfGQKcVrJgsXy5gYyUcTjg8NfUNJevJWTtEs3mMSUxrRNd5IbB+Kz
         clHIFcLDT0Ep2mqYpQYAFlBl1VevBB4GWxYNvNEgo1OgZ1qytDvUnL+ia2zSJM4DPeEa
         BMe0w3YpHVwdKQaDnt4VgBEUolXvNQJlOe3CZ1AQLaB2YsYHRVmyCMyvCMVpjAeJhtNe
         auQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668974; x=1751273774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
        b=IhmufKZ0WxAsCFItC0VUj31k+HV3psk8h+kx4bIrt/WyKesLpquMmK0uMHEMSJoE/d
         gloWth4zzqvp2ga7NXZ2BSCeX6siFZ9dwJ5w5+dTHjaUJ0gTYzjwF+LLx5OU0eDPUqXK
         tJuJX+H6bVYptsKkCCEf3fXTsvbb7YxcEAx76NV70eOmojsfQGNLpqWGtrFOJalYCP6V
         q3A1aYmb320cqWMgBBfbRLinFaoRMe1ZDObEPtyDjLw1eud9B8uA2XcoqQcpNBIs7N1U
         I9oVhC98knbPNETJiRLvDYuu3Dqg0FVvMSI/Hj8ir6ojisCsWW9zHUd2XgzRDBv+BYru
         taOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsLxU9s+UrnUXR8yl7sqlyGNqf7orz8+wNB9rMt20ZqB+CAWPrZXXQ6JyRq0HqPx7AYlOt9tK+5V2qsW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7LzydMpt43jOODmeCLuH1LySohO3dqaSoLNZ9x3shWOIlhKU9
	Nj+Cha15lIbF+BOC0pI++kWglLdxqjrD16YOTr/uvWcnDb9JpCHpmHajr4uu8Qw3VfM=
X-Gm-Gg: ASbGncuBRJ4m3ZxSJvIv3qdemnXvU6hySo39spR4jJcFB69eYP4AdmB01FxT2/GWWNY
	Y6lXpxANgRZJltkpnX6JSsZHczJ+HgTK7M0LQHNKhURwC1GuH2nsQgNLdz/cm5BjdkyZZQUsRRi
	3jLJt78nmVMqcrcA6dKR2Fcb1I1z3C6ranJw6LHFaHeGwDmT/vcz52VbmIiBsr7CWLJckN6RZoa
	eg8DctXpvLHFIVm5eYam1TdIjqXZ5GZ56s/FROOzCJEVLEKayXrjMcQ4SKF/f472iiw2jKUMWGY
	YzDCOCJC5HN9VON1T/z0teyGGyAbE2KkNqPDyTjmrcVLmbKXxqwYZTgztONB0OlEG6JESflI1EV
	D3UZ+jCHrD1/ReLQcYk5zOn6MQXuZ148s5dawDhrN9bttPKWlAiRa
X-Google-Smtp-Source: AGHT+IERqVhXUuZaycJ9TXWhRB2gxybcEMP4NaEWUk1qVF4LE8ISnCBkZkByr7Mu7swhmGQOyICAkw==
X-Received: by 2002:a05:600c:4512:b0:453:5c30:a1d0 with SMTP id 5b1f17b1804b1-4536e0da765mr49058295e9.21.1750668973790;
        Mon, 23 Jun 2025 01:56:13 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:8778:2532:8a32:106a? ([2a02:1807:2a00:3400:8778:2532:8a32:106a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536466596asm107238875e9.0.2025.06.23.01.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:56:13 -0700 (PDT)
Message-ID: <643db411-d72c-4542-82a2-056d7d745967@hammernet.be>
Date: Mon, 23 Jun 2025 10:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
 <d2d321cd-7ca7-42d9-8eb8-7ab639dddfa6@wanadoo.fr>
Content-Language: en-US
From: Hendrik Hammernet <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <d2d321cd-7ca7-42d9-8eb8-7ab639dddfa6@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/20/25 21:56, Christophe JAILLET wrote:
> Le 19/06/2025 à 14:07, Hendrik Hamerlinck a écrit :
>> Per Documentation/filesystems/sysfs.rst, show() methods should only
>> use sysfs_emit() or sysfs_emit_at() when formatting values to be
>> returned to userspace.
>>
>> Convert the uses of scnprintf() in sysfs show() methods to
>> sysfs_emit() and sysfs_emit_at() for better safety and consistency.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>>   drivers/usb/host/ehci-sysfs.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
>> index 8f75cb7b197c..3786e81b0ed9 100644
>> --- a/drivers/usb/host/ehci-sysfs.c
>> +++ b/drivers/usb/host/ehci-sysfs.c
>> @@ -12,21 +12,18 @@ static ssize_t companion_show(struct device *dev,
>>                     char *buf)
>>   {
>>       struct ehci_hcd        *ehci;
>> -    int            nports, index, n;
>> -    int            count = PAGE_SIZE;
>> -    char            *ptr = buf;
>> +    int            nports, index;
>> +    int            len = 0;
>>         ehci = hcd_to_ehci(dev_get_drvdata(dev));
>>       nports = HCS_N_PORTS(ehci->hcs_params);
>>         for (index = 0; index < nports; ++index) {
>>           if (test_bit(index, &ehci->companion_ports)) {
>> -            n = scnprintf(ptr, count, "%d\n", index + 1);
>> -            ptr += n;
>> -            count -= n;
>> +            len += sysfs_emit_at(buf, len, "%d\n", index + 1);
>>           }
>
> Nitpick: extra { } looks useless now.

I'm fairly new to kernel development. I checked the coding style guide and
indeed saw that the curly braces should be avoided if they are unnecessary.

Thanks for pointing that out. I'll fix it in the next revision.

