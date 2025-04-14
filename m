Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084215575C;
	Mon, 14 Apr 2025 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744670467; cv=none; b=cc0kmdE31+QVyot3OU5r7IXqViLdrya2t6bi2tQRSjhBN8oXoehAqQ8Nx+/FPj9Ir25lm6hkcnifEHWxcsjL9wyxgtEMj7ASBoDgy0WE60hF5lzzweMyCfqfk5/aoVYgEJB46I3GYKcuSHb/7t53nbJNolzZWCI7P94+iqZBITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744670467; c=relaxed/simple;
	bh=ldMSiQkOyPBhitSXyv8sKKPN5ENwcjfyon+M2V/pMt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeyoygkH4WCWAxZ8mta2oe4+VFXCBKtnkSpPyc0oC48X2ls1hPwhh27LwESyASDYqVBBGgg69Z46VHH2oViy8WEloLghJAsnDifby2r1n0FTBtoLOG+nhLsb3AxeW2TYFV9gNxMLRW5gGJ+Ro7r2pukS/Q63M0QUGPuuhRbzXuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9ZS94N1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9ZS94N1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227cf12df27so39235215ad.0;
        Mon, 14 Apr 2025 15:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744670464; x=1745275264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jXcwoMRZUoCG1V6l5OuwVgwoWhD6qHiM37Nc8E/zQjw=;
        b=e9ZS94N1obxNkpt2evDZ3rP5wNCYsAlfzH5VcvYmdVt06XB+z9dXaTj+NcvMT6OEF6
         H1MZnSWGf3tvxJU8qN2Vnkx11nKUb6g81u3jxhAPTso1fZ2sSv8bVxhhvmOJEl70382B
         qY9EzhGt3BBPvhfhIfRxuIKhn/meBnt/s3aiBiEejsFmL3Z95aZ5ApkgXVibU/QRNpRu
         Dk5d9+LjehT6hn86kwkXEd4A+9xViJ748uOxFeaIeu/dqWSqOJZX6fgb9V4imtmsYCEW
         MoXINmQFsYnifSIr+At5EEu7/4an2TXnrliWgmTmfuIbr9gpPMf0Y9fNXd/sTRjY9AKo
         tr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744670464; x=1745275264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXcwoMRZUoCG1V6l5OuwVgwoWhD6qHiM37Nc8E/zQjw=;
        b=Axm21/gMHacO7WD1XAVrW5mwjIC6WdLERNxzT9DmdkpU5Yp2tFZAwdYqNFnHhiSlea
         qFdf72jm57Rg58aIdVDqCbpAQdmBeXQcLwJU9chDgdhF6156Fo24YqK6gstHchGQzYo4
         pIlcOhw6aox9Peg6zht23MDMTYR6CuSnRb6afXNFIFMve4pz8YdppQ+NQqPa5fmwlZR7
         e8KNOFKLzwcbg7KermlC87pv9efY9+uNN87BNmZJtexLgmXocKbG0QI4FTWSzJHDQiuX
         sRy4tR2egXz9OWcVtf5UZiHNRIUxHvvkfJQLyJ5l1F3vtcqb6dJ94kk8OTEhsdPImst4
         V3BA==
X-Forwarded-Encrypted: i=1; AJvYcCULLm9ACJC+zG7YQD8cgVCAnhN85WoF1qZYRSsAtzirqG+zvcDHZxex07zQPuxT9Ja4zj+pv56VBAOkBmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz72i7to5vWMWB6LgjR6iJxV2F0FSUAOW9aqhkj2fhalXXA1Di
	RLWXNOOCZLHFpQzfZ+eROUe7U38Gz7rFfhD6bsR3lTG/D7KLoEDG
X-Gm-Gg: ASbGncvaIJ0ZrDYdO7+jtL7GjtwVPhiDxBNKXbgB+Hx7QEkTOCmPV54wR0Td2BZXNbe
	ueT/B+7LBdqM2876Hbck4mQoq1rtYTr9Pmgb0c4q+M7Y4jvao1lXIHDs7O3O7j/9aRmbjRqYKtb
	TO0cBecquqtOlsAXLn3Q6OKd7dDoJ4nP4GNhfcK2kEUBuX5/AiD5qH/oX6awsHUDajz4onQiI9k
	3xfB3JKV00WgNTfq6kNKS1JpXzTL6JYqUr1EKqOo3B6w7zDIwWvx2wjW3RmWQufEPlfbQO4z4Pq
	JahDzAnnVWOagiDNqoMpk4eKO/BaMcm4vDViS02FCd2W1nOZYps3eonGWkE6VZAHBMiFSQx4MHl
	L5qStrLjeVJ4iVA==
X-Google-Smtp-Source: AGHT+IFPQJv6jK6g4UTLNezYKcU9a1drlJU2UlwgWmCIU8y0Bt6cWHQ1fTiyIZ5utfrsMKMY9Eb5eA==
X-Received: by 2002:a17:902:ce8b:b0:224:7a4:b31 with SMTP id d9443c01a7336-22c2496415bmr12182065ad.6.1744670464312;
        Mon, 14 Apr 2025 15:41:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c6b3sm104800585ad.77.2025.04.14.15.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 15:41:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e50730c5-3203-4aec-ab08-b5965dda71af@roeck-us.net>
Date: Mon, 14 Apr 2025 15:41:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: acpi_power_meter: replace deprecated strcpy() with
 strscpy()
To: Yacov Simhony <ysimhony@gmail.com>, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250414220145.4111-1-ysimhony@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250414220145.4111-1-ysimhony@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/25 15:01, Yacov Simhony wrote:
> Use strscpy() instead of strcpy() to prevent potential buffer overflows
> in acpi_device_name() and acpi_device_class(), which point to fixed-size
> buffers.
> 
> This change improves safety and aligns with current kernel cleanup efforts.

ACPI_POWER_METER_DEVICE_NAME and ACPI_POWER_METER_CLASS are constant strings.
There is no danger of buffer overflows. There is no safety improvement.

We should concentrate on fixing real problems, not imaginary ones.

Guenter

