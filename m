Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3C0283691
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288361; cv=none; b=n4rUHhKqU7MZpZDgzJBwduYF7XKdX3uL3ei/XQ3U2fq9SQcKyn7zZVofE5hPgA2mHnkAopuRXJK+C9l+YjS0FyS2hyUPkKr+u0nUJSfzxm++u+Qt1SZ8UYoOKZ4CU8IjUlBB+oEBbsE16sU1XDETrI+HelyFb3PVxsK6aJ7vZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288361; c=relaxed/simple;
	bh=vaduyXSktTjHWIM6mMUVuzB/JU/7o9Vgbb4ojf5mTUE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LMbhJ2WjPQ4k4k2W1G3XO/7RdR1q2IpKaaCOvAco9wgeK0lrG330rU7MdggwKgiPvxOOLftad9OmsQRYdApjQsxLxzNr9Xf82VRTyNA8UteVfArRyOjiH7+nWfluJaKx913L/MtR1BMliuU1Rjc47gH4qGDacNONEpCAqYRQILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wAcr0Kz7; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wAcr0Kz7"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3fbaa18b810so188633b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744288359; x=1744893159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvSNTACO1SZCY31F0gRrZZq+wvkmlB8UFBxIZ9DVjtE=;
        b=wAcr0Kz7P6zFsFwt5BfIPOsSF+2tNShxV8aRC1lu6GJ4Og3+aB0bcFOUrzv/M3dhKv
         FIebYKdLbbqWlwVw8ZejZFvl15rw2avJp2inoI7GNJAGz+iGp9Y++3ZWu3yqGmpB0Itk
         FPYHH7KjpeZ3jx0R+tVjcTJushdG4J4JpDy0yUEGNvMS/JAZQabieAIVeKExMqqt3WkO
         nVO3vw2anuWnBVpq591W/UqcgkpGisHHFiRi5prN9Gk8PbeNpCkjvuNgcisQKMYT7uH2
         /FYTnyTIMLfyipjnKmdZM2sGCjyJKEK+ParzF+zONIfNGoDuDVJCri61PuOZv+SQRF9z
         QZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288359; x=1744893159;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvSNTACO1SZCY31F0gRrZZq+wvkmlB8UFBxIZ9DVjtE=;
        b=BgfnYvibZCgbddJNuzKjoqJYyReN+h+emP4AB5l4Z2AnzN1bwbqFq+Fl87L6VFkzTr
         8mAWdEafGQWiz9DJd8DJzYxLXCcGSQj29saG6rJeiP+sZERt9dcpaZC1Ar4d0CQrNM39
         YmBRuqc7TIMag9jK1eI8EMxR7Grl82gTboOSVI3erokfs5rhw6/XGB+3uiXf9PCfcT1d
         7w9BFaOxGMq8I2W5i8eY/55bsTviCLduPg+g3uBCLc2qHmlWjd35KcXpWveT6YMse7Ft
         6PSPdItMiP+bXPeDXYTm4jPEGfHc4afNMAGZPToPJyoCbcdQAM7ueBe7XLy7KlIPACne
         d/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVmz0KOxf9vM889eT6ivRiG8ck2BFv7t7lvCCVgDRgIrJ2ZxWVN/YhKCraKhuZv+CBwv1XAu/VWxlkRnic=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjVMGGWMkzvNKCNe1d5gTPfEKJJJKzT10OkroWtWjeJ6B0triH
	jmTo3zlcTwYLE73q5yz+f1CqlLfqjotMFvizcheQUS4WnguioR9ciWxCqpDZFGM=
X-Gm-Gg: ASbGnct0ik3uE/YPheF2iLKxZ3tXhr8PzdgAJVI0yUZL144FArjDszGd+h95c/6iB4e
	q4zoiuVzw1n8qTToZwFEUFm6tmXOgy14esvbjNU2+pOzCBmJjiQhkrik0gqncPwFbUP0ACWO/I4
	h6HWAzXxoPX082TSXWV2Ug0Ot2Yeiq2/qEOyosX2ADANUgXvLpE39tOk7zQpKomcdQsfZWN0nnW
	kFTVXDNy3JOVFtfEme4YJFkzA0jxRdOumsI9RjhxVz+ZMupeHBtiBJO6p4Zvwr9ciGfH0nuUV8m
	d7EBV5f0YDnXTnI3Y8mgcKPwLanyH8+J1CD+Kc4kh9ZdIaGYY3gL+ZT3xKlE50PR9HXnlk4mWmQ
	lB528
X-Google-Smtp-Source: AGHT+IEJuAZEVXhBtSWrNjlEQvBiq7KT4K1Km9MSzZyjIkHUjkvVril1VSVFFBGM/J31v9xCTSVpWA==
X-Received: by 2002:a05:6808:7004:b0:3f7:f7b7:88b with SMTP id 5614622812f47-4007bcdc348mr1582330b6e.21.1744288358751;
        Thu, 10 Apr 2025 05:32:38 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f5b28basm505694eaf.36.2025.04.10.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:32:38 -0700 (PDT)
Message-ID: <0ed3ce4c-9be0-485b-a1ea-6a34931179db@riscstar.com>
Date: Thu, 10 Apr 2025 07:32:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
From: Alex Elder <elder@riscstar.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
 <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
 <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Content-Language: en-US
In-Reply-To: <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 7:30 AM, Alex Elder wrote:
> 
> I'd like to see that be the only thing there, and have
> various SpacemiT modules define default values that
> depend on ARCH_SPACEMIT (or _K1) in their Kconfig
> file.  Like:
> 
>      config SPACEMIT_K1_CCU
>          tristate "Support for SpacemiT K1 SoC"
>          depends on ARCH_SPACEMIT || COMPILE_TEST
>          default m if ARCH_SPACEMIT
> 
> I *think* Haylen said that's what he's going to do.  You
> could make it "default ARCH_SPACEMIT" too, though that
> builds it in to the kernel.

Nope, I just reread what he said, and I'm mistaken.  Go
with what's preferred by the clock maintainers.

					-Alex
