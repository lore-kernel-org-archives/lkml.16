Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06D209F5B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611592; cv=none; b=MYRGKbAOt9ZI3x9ckjSCqRIASrjA7zB2WtjGNCOtVqS9Wvsoh79nCm6c6yT5yVIbo+uS74K6h4wPJwfBRG1kQ02xMrGQZoUMdbaE7QvcT9NqdPKSuhFMc4J1GHPf32b4r274fqs9Wxg1NKDzyr1vQqxTEwgD/HrixfMNKm7MzKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611592; c=relaxed/simple;
	bh=/nukz/GWXKZKSnXA4M0zIsiw93sVPIl9e86Sl8alprc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxrpyLCa6ppp7tAxBxf/cqjdyXw3SwY3/QJlJ5I4ts8i/X21z8C465hbThFLl6h1yBOfGe4R5V7Mf8A7ohcIU3VIi+nQ2E9baAW8y3jgr0pb0thBzEQgmYFXo00z6vCCSYkEUgsveWaNl9QDhO0dlTcntMspB2LPaqx+vZsx2bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DXYl5a+o; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DXYl5a+o"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2a383315d96so2272030fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738611588; x=1739216388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLhKJbpbcl0F3714e9Wmp/i7a0BEVMhErOhbjcvQ7kQ=;
        b=DXYl5a+oMMXofEHcAXfdG5TLGzWFaLn4Spt6/ZVpsV5Z9TcNm4/k8hbCkJHmwEIpuw
         xE6VIk+PVzD2GCN5Txn5Bg4EPWjrwPtQxfkDF3WSFV1fN6h4wLWFL39I+ZaOR726yU5T
         yXAse3KwG2+mARuZkdWKcj5Ji2xZ5zIL3Tb20BAk9dlV2YlVm01n66Lc87IzzTN7FmIj
         JTBRPnxf8mYKYCC0hoVIwYhkmmVKH/YIedzqf0kcQ03Ku+KNvzwcnkpWeVE8lzqXH4DI
         muFOZPgAfF4MXleeyhChBq50TOTF3yGCvJbZOHO7z7rUHSOlU2rF+epTol86ud5TRkhS
         hdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611588; x=1739216388;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLhKJbpbcl0F3714e9Wmp/i7a0BEVMhErOhbjcvQ7kQ=;
        b=ScmwCBPOsl0JxufuWh6r7QQBZrjwj+jvRwrJ89zCMjcIPLKaB5MkjNs9w/HYIwlpPS
         dFAkwSDnhuiazmcqM0aARIfnh7MLoyRPNDPe+tsERgj4Bv5VLzKjSGmGB2bUf8oBzjSS
         uX91bJGZYogbBM8J1hfg2rjogKhkv0cU9Kag/qDvXFulDMvKnFPh77DSngvF6B8jQ10a
         s0q1O7/4LJeuDniVEr7BQiTCwTqzpM4jcsXwFHz3IMcZMn9cQhl1qdIo7JyzKNXke38O
         CXic5vTqF2QaX2uTBkY0PXutCIDNKdEZWbXHF9q3Ka6I7d6EjQz8eV847xDwJTPIwwVM
         KsZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKZR//JxiMr+Qkq/RDEV3efGtunpUoYRk9rxbC5ngvD2wdHq5wBruFIhlDcNFb2YlWabECeBAjFitT2Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx73xeAkveODkJ/SAx/5Bg8Jky+9JzuNPTUtbLAEgp656Xwk0Kg
	Q7NkaLOmQ1/lU+TAgij5gREUKZMRhDE0qAB9cPTj2uk4IxZ7LA5BMRfUpuUSFuU=
X-Gm-Gg: ASbGncsndF5DwGRdy+hCcwsCHpZNzLbfUB9RsItRi0/DaQyLtejUFqUEN69NDNH2/dq
	cDr/hwYQlsZ3mJU1sLcTUAqfqZco59MbW6uv6okVWyledJY9W8e1pIW+GKkGyNx+xI6hl18Ay6g
	PIXoMwkvXOjPm82zP9vaj1qiAwyvqWMbHh+uxrdnjYDRJNMbS+ibZDQeDZh/l/fqRUxzDJrTlw/
	XrVsBl5opXm8u6Fg/OSNTQIwz5iv8oPJVZoS6uyskMWNzVCL0wnM4PJD1ZT8yK8XryC3bJM+OvV
	YNiA7gnQJpK2W5jzpwxApSnfqPf2ktYJFOuFqunLActhZIJ2uXEq
X-Google-Smtp-Source: AGHT+IFfucymIugob4KH/abdiJ8VQNg7Vw5VVSmJVGXkdTO2+o2v+fhCLzJBh3eeVsgDk3LVoCc6nA==
X-Received: by 2002:a05:6871:a0ca:b0:29e:70c7:a3f7 with SMTP id 586e51a60fabf-2b32f100b1amr14887069fac.4.1738611588131;
        Mon, 03 Feb 2025 11:39:48 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b3561a582csm3488650fac.13.2025.02.03.11.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 11:39:46 -0800 (PST)
Message-ID: <06a2cde6-f725-486b-b3f9-beefe3c227d2@baylibre.com>
Date: Mon, 3 Feb 2025 13:39:45 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] Documentation: ABI: IIO: Add filter_type
 documentation
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: cosmin.tanislav@analog.com, jic23@kernel.org, lars@metafoo.de,
 granquet@baylibre.com, u.kleine-koenig@baylibre.com,
 marcelo.schmitt1@gmail.com
References: <cover.1738608986.git.marcelo.schmitt@analog.com>
 <cd749bbbf13b27caac5734b22c716124565a7216.1738608986.git.marcelo.schmitt@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <cd749bbbf13b27caac5734b22c716124565a7216.1738608986.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 1:11 PM, Marcelo Schmitt wrote:
> A previous patch added documentation for filter_type_available attributes.
> However, the description for the value attribute (filter_type) was missing.
> Add documentation for filter_type sysfs ABI.
> 
> Fixes: 01bb12922b60 ("Documentation: ABI: added filter mode doc in sysfs-bus-iio")
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>
