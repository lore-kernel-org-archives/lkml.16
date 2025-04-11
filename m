Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFBC1E8854
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406324; cv=none; b=pMZMIox8i9h41s17I5bItHXzYwestlde97vkevJhCqmNkoqyBM+/cN33npta8M6Vvwi7tErtxbTXmeNGG5nXESPtRA/tl4JvwD/+eXAEYFLyK4Vazf0hfloY3Qc9YaITaJjC9QJDQllvhbtRTQaYSwum31LUn2Qd96a2lqVpzQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406324; c=relaxed/simple;
	bh=rag+QXq4vWakUy9sDsqwNJhEerW8S3rA/5RcjaDWrNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYP1IptKwHUfHf1j0tpuMvlK5BcBRHOlCO7pfTVth2Hp/jwOJc8ccEGpKerD8Zu02+ypOMb9/w4Ri1NvKbNTmHe5OrszjLaU1navq9s1JRdftlIvW6pDbmsHC+r3uPMdJRaouW0aa3kyFdS0Ey/J4v/Ukl4U1YibJv5XOZjUF5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C5CGA81+; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C5CGA81+"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72b7a53ceb6so1372660a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744406320; x=1745011120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sorNIy6LIPWEsa+dR7etTvE5w/Ir6yxO/CI3OrQDhzY=;
        b=C5CGA81+q7th0x0t1dHgFf6HR9f7cGqpZZGqgSPJyc3iuxoHHsHxemOLXPNIvBMRM6
         PvaHf9BVFZ/lzHwUtJzqfR23LfQZInmXbwXehW37JJOuRG8fykb9HAsuPAbwQHSQcUKK
         8Z1VvzTOuJIaT5d328xtRA9PzOqgp4665CZARAA3xLIORLDtT6JJwG2YGpOu5mKK4gFN
         UHzyq/p+1Pry9IiwvJvYP/RaKc9wyAVz+BRvHLGWMSoFLHrdJ0cVBzsVX9GskU+MWTDF
         lGRRZynNvGW/nncDWhFcDpEY/Vmp2hsEsL86re3WPEBiiw9s23jl5R+GkgQyioohaYDB
         doXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744406320; x=1745011120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sorNIy6LIPWEsa+dR7etTvE5w/Ir6yxO/CI3OrQDhzY=;
        b=afvgQGLGXNZHsX77q8aW100kpCs7WfOwXaFZkmoCM129JDrxzkUS1bcwxH4N8eEUTX
         NX70ODAS9xu4j+v1A4Ia/F3fPKjc+hiaxLBH63rrM6IBAyu5shXQejMa9coHGXVC47s3
         3rdfIQ4EMCS/C85FJhPyIiYXe7jIm8Zo4KHhkQgFr/LKfWMAj4u26MY/XK3fZJgoBjPS
         pa4tsbBhN5AYN+MHZZzcq0cW3Dv6PItI3KSls3g8geE9fQ38U2LkbCQa+/ok61nNlden
         j3FQtd9fcMsEq8TSC5Ku+YgEhxRY7lg/Fx0HQW6xCN1SDIzKuBHMSs5cKjONAu2bQQzY
         RShA==
X-Gm-Message-State: AOJu0Yw7HFviwc1gbVszNswmidsziUMqvQIvZ3OJ6ypXdD9VYnn2d5wj
	zyi1U7RqbwQz9Xza0IA+Eq2jvt3eei3ttY5oMJLyN9DResbBkB4sDJIFd9ktq0o=
X-Gm-Gg: ASbGnctzb85RkWTvfL2PAZSl7/fAX+CiVb6F5R21I4T9zMN4NJ83/27bZG9emRTT1HW
	WzZwu833EK6wHgCA/Nr2nD4WHPTY7xyDNY3Caa2Ha313q8vrPMVCzJuGM2QDFP21HU924q/SDen
	VjesaL2uDYs0ZY+5g3LWKuUAOyOVXGePZVqNvpMDHHa4HtRAjCsG2vObJx5kjYTDK2EBF9IAJYq
	PGus1jcQVNcvlUkClSBE5BvnwsugWdS3bTtRY1YNytTinMSzBua/etnRerWlJKI0A5qj/EuVAfS
	PnVyw6roq5w7s+/Yw/mo9CmyLRwEyUrNlHLhtVfFIU0G6qjpXpX5XrsdVnfFUTZz+ZAcByPuQTc
	qmw==
X-Google-Smtp-Source: AGHT+IEQ7gV6ZTG0Y504SCL7jpKeuLLtLbDwYjcmeg4BjGRNRDE++XVtQ96KcNIUD2IdTct72Q7wAQ==
X-Received: by 2002:a05:6830:6407:b0:72b:2513:ad54 with SMTP id 46e09a7af769-72e7c173715mr5591645a34.10.1744406320668;
        Fri, 11 Apr 2025 14:18:40 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e67444sm1082695a34.63.2025.04.11.14.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:18:40 -0700 (PDT)
Message-ID: <4460df06-6da1-4b23-8789-82945e90a09c@baylibre.com>
Date: Fri, 11 Apr 2025 16:18:39 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] dt-bindings: iio: imu: Add inv_icm45600 documentation
To: remi.buisson@tdk.com, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250411-add_newport_driver-v1-0-15082160b019@tdk.com>
 <20250411-add_newport_driver-v1-7-15082160b019@tdk.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250411-add_newport_driver-v1-7-15082160b019@tdk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 8:28 AM, Remi Buisson via B4 Relay wrote:
> From: Remi Buisson <remi.buisson@tdk.com>
> 
> Document the ICM-456xxx devices devicetree bindings.
> Describe custom sysfs API for controlling the power modes.
> 
> Signed-off-by: Remi Buisson <remi.buisson@tdk.com>
> ---

IMHO, it is more logical to have the dt-bindings patch first in the series
before the code that uses it.

>  .../ABI/testing/sysfs-bus-iio-inv_icm45600         |  37 ++++++
>  .../bindings/iio/imu/invensense,icm45600.yaml      | 136 +++++++++++++++++++++
>  2 files changed, 173 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-inv_icm45600 b/Documentation/ABI/testing/sysfs-bus-iio-inv_icm45600
> new file mode 100644
> index 0000000000000000000000000000000000000000..8d2d9b68ad9e35fe0d6c157e984afc327eab92ec
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-inv_icm45600


ABI documentation is separate from dt-bindings and needs to go in a
different patch.

Also, it looks like /sys/.../iio:deviceX/in_accelY_power_mode is
already a standard attribute in Documentation/ABI/testing/sysfs-bus-iio
so we could add to that instead of creating a new file.

And there is Documentation/ABI/testing/sysfs-bus-iio-inv_icm42600
that has the same attribute essentially. So it would be good to
delete this file and consolidate everything in the main file.

> diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm45600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm45600.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..51455f0b5cb90abdd823f154e45891ad364296e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm45600.yaml
> @@ -0,0 +1,136 @@

...

> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

Since this can be connected to different buses, I don't think we want
to always ref this. It gets included implicitly for all child nodes on a
spi controller node anyway.

