Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571B27D76A;
	Fri, 11 Apr 2025 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744354760; cv=none; b=GS8wDTLg6euxIRUs2Cx4XLUQullPDn+5ji1i6BEoGF2jvBcf4jzCBOM8N3YgKL105uJzt1Ikd+igsDL7chyxM2oRdKFYzF5vt33EdnD+0/O+aaVeQps4t7wtC6i5v0GY4ApWvGS8aucA50mcPmE0SnffcJgjmvV+rCDmkHJ7TnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744354760; c=relaxed/simple;
	bh=6F4HUAFfF7EtSOMyUi8mc0ZMpUtoK7zVy9sayApOEpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WA3PGa4CS8+OoUL6ZVEZ9fu2qxT3cMbh61nloCuDjcbbdaj3QD6SIDOfgOBJrnFMGtcL+sI3KtPDZB2z+n3WfofYBVdtBtYN2koAL6aaSdWCcsuyspHvIw3c4mR4SsV95bvYVLcOMfTPgkw2qMOrmnJVtuaiZNW17e09AUBaiik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hg7tz7m6; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hg7tz7m6"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so2183694a91.3;
        Thu, 10 Apr 2025 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744354758; x=1744959558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qJFhQZDSWw7uMFXVtdsGZR2IE2c3S88vf7fwMBNJsM=;
        b=Hg7tz7m6BQli0DsO9R+JlkPwVKdQWFkUoGMv+6BvbFVyZ+Y+tuyC8ffN09LyVJ4o5L
         dPrTMfZb43R8d2pz5wf8UjsaAVCMfbfnusIcacMRNiuB8gLUs+hFlc3r2rjzsLRq5h6O
         xeJzzRELegFKA9edzYcGhMyPESTlDd6VXXFmruWJRaSzF8OPFMpqAemr/GNaweYg78M1
         whNjNvoLrMGbLomrZ8cz1cfKAKcZPSHytIJwsEXyaoBF8x7LT1P9wr++qIniDReFCySq
         D39jnvu1YaSXfsN9/dj4I2QMzoGXdQsxS4rpuvK89Hh5XNzXf0MeRKATVTf6TJpJ3LxT
         W+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354758; x=1744959558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qJFhQZDSWw7uMFXVtdsGZR2IE2c3S88vf7fwMBNJsM=;
        b=oS72fil2u/Hc6b6rOxXDk6XGZSHka+FBYQt4JfBPkn63lNNIgAOYQitJNC6fW84KZb
         4W68hv+/787hPMNlDA1T/jXRCrLByXAT+ViPHXZoy3BT6ezMEfZ2pcOAxlJaGRMN0GQB
         BMLhfS1qI3a9ZA6FwLYZZatP47B0zKz2FV3LatDtP/j/Bg2ARO4XK1PhWKPZ3omRmhjM
         PJ4sGWm33k6Z7vpByyryH/BrzaxrdMqkO7mYakRfp6YAi9JDs3dwudDCAnkQpGMyuxm4
         usBN9ya6najFtYrL3AFPcClJpnIvjL8bxUbiGMXIYVRKjYKFozqJq2dg55px3Kt3m9XY
         ESXQ==
X-Forwarded-Encrypted: i=1; AJvYcCULIBSTQbmyUm2AbxgnisHyWqjVDFyWUJWU+uIOqqtZcS5biwPYEwbzgVY0vgPoCPu1Hvc5aQg5oFJHW5A9@vger.kernel.org, AJvYcCX0ZwYNc0lCqm3zeZXVYp8wdjC6KAMyQ7ZH/6biZl7YXoarq5RbY4IbZgWyLmuQJv+kwW+6OFEJI1v+6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+TKgs4Bvjv1Q7Z/VBKFxcJUFRJMPuEgV59kmpQ36dZrxMdUD
	6WgZZkJUt7Uejks8WrosnQwBVQJgM8tWGIiyQRaQIs/6DNorjRvY
X-Gm-Gg: ASbGncuEbjY6iPxkx85y1bChqQOxY/X0PNN3FcNq9Hy1pOkxMBvDdWSdj2+ibKF6YSU
	/eAtGqrnvY2YKExYFiYX6yfxosm7B6p1BCawqJcXjjs6k+DHOjfatQGkkY4yiX0mM0G2dEz/1vD
	Rd6a7EEkLHVV7EXyFjrMq2hBLLNyOddhMK/vJZ+D6yQTUL+B1si8SvuhbFH4laO/OetnkOoHVWT
	MAZP1oWZ9eOWB2AYC1z6fn/nxke5I0SWAKjqbW4JHnMgY6n1YKJUNmRu3eeOx6Ayd5trLNP+qPG
	0D727d4v+mkXHTl7YhAGjHAttKJAz0WIKvY0SGbv4lKDPXDpFppEQvFIziyB
X-Google-Smtp-Source: AGHT+IEm345yRqrIPVOO3GmovNac5+SpLcJAHRcaWnKAQDIYNPWD6od4fbgDprWNQntPFm+8BrWw0A==
X-Received: by 2002:a17:90b:2d87:b0:2fe:b8b9:5aa6 with SMTP id 98e67ed59e1d1-3082367ef21mr2675905a91.31.1744354758518;
        Thu, 10 Apr 2025 23:59:18 -0700 (PDT)
Received: from [192.168.0.161] ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a735sm4777636a91.3.2025.04.10.23.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:59:18 -0700 (PDT)
Message-ID: <0a1ea318-20e3-44b8-9d5e-f603c5341087@gmail.com>
Date: Fri, 11 Apr 2025 12:29:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: asus_atk0110: NULL buf.pointer after free
To: Guenter Roeck <linux@roeck-us.net>
Cc: Luca Tettamanti <kronos.it@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250410183450.15514-1-purvayeshi550@gmail.com>
 <bba9ff87-90de-4eae-99d1-647ee413d480@roeck-us.net>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <bba9ff87-90de-4eae-99d1-647ee413d480@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/25 01:34, Guenter Roeck wrote:
> On Fri, Apr 11, 2025 at 12:04:50AM +0530, Purva Yeshi wrote:
>> Fix Smatch-detected issue:
>> drivers/hwmon/asus_atk0110.c:987 atk_enumerate_old_hwmon() error:
>> double free of 'buf.pointer' (line 966)
>> drivers/hwmon/asus_atk0110.c:1008 atk_enumerate_old_hwmon() error:
>> double free of 'buf.pointer' (line 987)
>>
>> Smatch warns about double free of 'buf.pointer'.
>> This happens because the same buffer struct is reused multiple times
>> without resetting the pointer after free. Set buf.pointer = NULL
>> after each ACPI_FREE to prevent possible use-after-free bugs.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   drivers/hwmon/asus_atk0110.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
>> index c80350e499e9..83ee7f25bb8e 100644
>> --- a/drivers/hwmon/asus_atk0110.c
>> +++ b/drivers/hwmon/asus_atk0110.c
>> @@ -964,6 +964,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
>>   			count++;
>>   	}
>>   	ACPI_FREE(buf.pointer);
>> +	buf.pointer = NULL;
>>   
>>   	/* Temperatures */
>>   	buf.length = ACPI_ALLOCATE_BUFFER;
>> @@ -985,6 +986,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
>>   			count++;
>>   	}
>>   	ACPI_FREE(buf.pointer);
>> +	buf.pointer = NULL;
>>   
>>   	/* Fans */
>>   	buf.length = ACPI_ALLOCATE_BUFFER;
> 
> buf.length is set to ACPI_ALLOCATE_BUFFER to trigger buffer
> allocation in acpi_evaluate_object_typed(). The old content of
> buf.pointer is irrelevant (and not initialized to start with
> in the first call). The problem you describe does not exist.
> 
> Guenter

Thank you for the clarification, Guenter. I appreciate your review.

> 
>> @@ -1006,6 +1008,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
>>   			count++;
>>   	}
>>   	ACPI_FREE(buf.pointer);
>> +	buf.pointer = NULL;
>>   
>>   	return count;
>>   }
>> -- 
>> 2.34.1
>>
>>

Best regards,
Purva
