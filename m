Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7D517D2;
	Thu, 19 Jun 2025 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352084; cv=none; b=eDDXznBozgd/3ic59+T40UGMRWxYqCRXpz2yH3uI5zefynUsklHRlcEvap7K7K/rhy1+szczTTnhW7lIFjhVEszqHiQLuEMqNkcjKqemo5lCg5Qb5wV5SyNIgXmA7rayBsjMzF2WfXpYsQ/+ZwHyiZMAnC79X/QJJ6WDgtMa+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352084; c=relaxed/simple;
	bh=G8nDe1xYqSPBotQsr/c0ZepN71BFZA+OreLgwskwLCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/wRP9CeI2KGuTYnmG1mK5jzs70mF9HZa1o7AOTWVWmPLVlCTlWIswRkKFnbSjooqP3qnJK26BwiKsKuweq/SaqzwDz2zdsNsW1HJWjqmjLjHK+bW+xgSL8aNFPUE3VbGSLnLH48KQCw1ku/UOvQ62jghMr1q25fkDF+7+QpwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDznS8/P; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDznS8/P"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so751810b3a.1;
        Thu, 19 Jun 2025 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750352082; x=1750956882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=of26Rw7FHJ278cEqaJi+BJfD2sA6X+6UYCqN2K8XIEw=;
        b=NDznS8/PhybZ1rWpirFwhnIyvAlYIca+JEtfjfVaH/1qxA9fyKMlx00oUrsa7QnVQl
         YT+bWNo2Wu70EGjMCVm2RCSwRPstzWVtL5hj6R7P6TX0D6UJklJIPIlVpUYn0YUrkED1
         lFrfluCH3nUZhMNwBIH8JtSdjYb68wJhXbg4yFc0UVcD1kppXzS1ats8+1+hPNaJr2nc
         EfTx5jP14hj4jWA1JhB0o0twKpR1IFOvKlpOzNwzqT0kf1429zmUpZpRRf9hxprGV6mq
         gamvid3wY1iN7vt7IzMWH9g8O6DBh47M+evaBeKkgHg8XwqduL8PYq/VOleloVWXEO1D
         d8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750352082; x=1750956882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of26Rw7FHJ278cEqaJi+BJfD2sA6X+6UYCqN2K8XIEw=;
        b=vLJxsSZtbY7hKnak92lqiu44byoXvhtp4hAKOMM5RTtKzP+kcFnQRCVrywLtKmFMFU
         rb5BulmRSzxKRHvHp852C1ZgKS6nZrn0mf2hJXJxNSym53BQm63kcwATARcA2/C14sor
         YVpT3v8q68p23oHUTiAB/qcZKCDNgUXJmawi14fc/b8pBZMr+E3qOmn/trL24GxDtWdU
         bvagOV6tQ8e58GGf9qbb97aPfM60VRZLvswqosHYk0/GTSehWdRWlagcdkjntxvXgvpP
         C1A6thB8qkUQGd6RJVV/MQl9oEbBsQU6kzd5YmZ4mqO9wYjIeDUyxlkoc/LSLwZJ6zrF
         KdfA==
X-Forwarded-Encrypted: i=1; AJvYcCULB8uNQRHRn3QuRVZsStLXk0QBwsBCC8Eed9tQEFK7A4BhYGBXwO7/c0mo4ma6HvaW+xoujgs+UiCjGTA1@vger.kernel.org, AJvYcCXyDLdpT1QgcxSFpfA79gSNpfX0b2mo3kKn4Y/JADVFQ7dk9G1aRNcadpWJlOGG/xvnEW4QzA86zfnkGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKIA60N4spJRDXF8oaUX3XyP+xXb2TXk53BuMWoylEVRq9nQoy
	29ULPxqgtp3Bu/JbwWVpp0T/Tg5xug1GznZ+jqC6iQDwQ2JTZDFJBlNL
X-Gm-Gg: ASbGncvN9a4niK/5rQrcL4nzaAp5FboI4fXYsPNUUzC7oaQNEkK3oEAdt4Qw9m3epHq
	FCWUUKFC6rj1gCJv4x560Pjz3YcqjXb9PUkfamXgu1wmJfYZxbLaukkq90n108+BViw5wknlV7I
	kKVQmBBRJomXcD0FgaEB7Eum55POHQXA+00JMO01s5hHAPbmK/Up2CJ3bCLNPgI0NFLdNSkhdb4
	Y6hCanry4hyPf3rgV5chsdLAPVsJ8jCWSSxAFcKZ8V41lNOpxthUGHoJWhM8/5qm+veA6Pr0dQb
	iVZXMN4IuzZhk8rYxE6Tzu7Vz9abM1MsUruk3uWyMz2YHeeoJH+0ecJlMZW90x6Wgwlw7cN5xkY
	rGWLxPJbpjPh/n5T/KSRrX/n8y9UaBfHBlWbVbOhlncEzmA==
X-Google-Smtp-Source: AGHT+IGn6WQ9Hz4ZioLBTDujfrdFRMYXwRLoTsR4pKhAlZyUtl3opBcW6ZajkLagxEVsWysIHxaCNg==
X-Received: by 2002:a05:6a00:22d5:b0:73d:fdd9:a55 with SMTP id d2e1a72fcca58-748f79427aemr6221865b3a.8.1750352081686;
        Thu, 19 Jun 2025 09:54:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a489bb0sm260018b3a.45.2025.06.19.09.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 09:54:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8b737d87-a7e6-4a01-959e-d0b65b54eea9@roeck-us.net>
Date: Thu, 19 Jun 2025 09:54:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: fill it with 0 when data size is insufficient
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, mail@mariuszachmann.de,
 syzkaller-bugs@googlegroups.com
References: <685392a0.050a0220.216029.0168.GAE@google.com>
 <tencent_5F7E6FB82C0D6CF49454E862ED32CFDC780A@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_5F7E6FB82C0D6CF49454E862ED32CFDC780A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 06:37, Edward Adam Davis wrote:
> When the data size returned by the sensor is less than IN_BUFFER_SIZE,
> it is padded with 0.
> 

The subject is missing the affected driver, and I really very much prefer
actually validating the return data instead of just assuming that it is
ok to fill the buffer with 0. So I'll take Marius' patch instead.

On a side note, please don't send patches as reply to some other e-mail.
That only asks for it to get lost.

Thanks,
Guenter


> Reported-by: syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3bbbade4e1a7ab45ca3b
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   drivers/hwmon/corsair-cpro.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index e1a7f7aa7f80..274864e8a8e7 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -157,6 +157,8 @@ static int ccp_raw_event(struct hid_device *hdev, struct hid_report *report, u8
>   	spin_lock(&ccp->wait_input_report_lock);
>   	if (!completion_done(&ccp->wait_input_report)) {
>   		memcpy(ccp->buffer, data, min(IN_BUFFER_SIZE, size));
> +		if (size < IN_BUFFER_SIZE)
> +			memset(ccp->buffer + size, 0, IN_BUFFER_SIZE - size);
>   		complete_all(&ccp->wait_input_report);
>   	}
>   	spin_unlock(&ccp->wait_input_report_lock);

