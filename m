Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D65F194A67
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232316; cv=none; b=XSaMgbZrC4lvq5gNJL62fEqQZJ5Wm2jOmnIdeZOrmmdpXX3U3/xPmsK25da8zYiaLrRfmSjy2/6AGxGZaRW7ZgaD5l4hJrnizaqofW4svX86G94uyS3Civ98UuI3hzXKr5S4nQbfFtAsBR/1MU6TwggJrS6yAmr/hjNHirJHYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232316; c=relaxed/simple;
	bh=jHsA7WLaZAQUssN/Gkcz6ehZZJvqAMZ8Q9SHY06sn3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQqcz0vQjclio3jZuSTqZnJzsxaKlkyMbMHeswcO/oUF24hCO5wCC7PWT8anEC0lBuV+GSrree+Kj/AQn6MU8x1KadIASEaJT1auQhC20eUoFehtTg9/wWsrI592R6kZEDTYKJURvbET8eOxB1/rNE/ZjdTa44b8wKcYMhdamvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRxzxuTT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRxzxuTT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso3218726f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747232313; x=1747837113; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=SRxzxuTTbN8XuYsKfshneQIHrI5xt+1ppK/djF2971+1Vy2jJPp8qGCBQSi44Lb3On
         IoSuu9bwVirXecmJZr9wN/SZAibIDkPiBFbvrcXYxq0f98nanuoIxGhmRSAyzdjLHn5Z
         YZKICCCExK5lvbtaJQgGdWOGmTvhVZcFRCqwYWm3XJhDVXnqgyvMjz2UdAr1be+8IZft
         GSwAoc2v6qsQsTaW+4fQaie8L7gyAEzYNzB/oEPtcw96/OzG7FAL32/1E2iSwYUPTDyC
         MYWAjiNwuJ3Fxb4m/AL66Yj9MckfVVP019Uv49fTE5zB2LAg7Jk+e2Al5kuc6sbDDRq5
         GmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232313; x=1747837113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=SjNJsTG3OpGFVY0qvQpP7vt8vZNYkHiDt2FrfBkp8o8FRPCyHRLdpv1cHlB+SyhJJp
         j99bRyMQOtaEc/OqDLaAXWAxqwoLmbErYZC+++Id8qPSnw7P1wpW68YmKEE4b2070tPf
         YpgrKnZOkAkqp7sIKPVBuDDXAkz7KVKHhEv+aAptCGjm0xosFUaNkhX20xEsGkqCxkkC
         Mw1ntyfqB7ryCwU81GXbSAkbWMNbDBshtLd2d+YwfnpV5BqVcymrmwODue4JbUuhiEmj
         mrDguyGiHq56UOG1IjSKuAqP+PsqzWiy1jkPcku/z8tIJP4T9AKLrtp2F9R685BZvODn
         7piQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0UgS8HcQHKqFpDfOe5Cn3Qc8ucKSwcPofMN5IU9wqxYj2c5fxDoyaPEtB8LTfLEAbCM5FXmhBi+4qSwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzAAHnEv7jJ86VDSB9EDSsDCt/kpn/5I9+shT3M7xLJ3Tb92TQ
	/CqzdwuhIrov/10nOaWuiwN9T0icNUJsDbjD+/nPKDZLEagt/uwjvIanBOcdJN8=
X-Gm-Gg: ASbGncuZQa+H0ud4nGWcotZRG7iKg7Y2o4Ds0KivlmC+lKOILlr81jzk27rCEemrWKf
	5XKRaM/y0IcQk/kYzMyFGa3Hijnk0Yx8oIHgTpXG00qnuDgawjEWutqvOs/kResqnOEmJAXKYF0
	zWVLVg74JOdGTvyKk53MDYOtDBQhj0MG1nzDpzyzXvtE7N8/3SUwFotHVErce/T2V4/pBfw4a8+
	1RmSDy8ejmgriHe95D9/VovAILgVbv+nIezS/hyg6JLIhwFti4t3u3K6g6Na6/IMfDwpuHAM6Rm
	F7eoFKektxInoVsAa4slnhCl0+84JGM2qVVhqjZpdFGYjJp0IaLcdhjxSVXrxh4d3/FhBsO5fI1
	+zaUVYPxEWW8LTA==
X-Google-Smtp-Source: AGHT+IH4+d+Pry2CNpgKUNvxX7a5CyUBEerUkhvVVYoJxhPCGMW/etsCZMqBlMg4OuejtHCSPvBihg==
X-Received: by 2002:a05:6000:40c9:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3a3496c1ebdmr3217848f8f.25.1747232312583;
        Wed, 14 May 2025 07:18:32 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm19729450f8f.86.2025.05.14.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:18:31 -0700 (PDT)
Date: Wed, 14 May 2025 16:18:29 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Message-ID: <aCSmNRTVXQ51xj0m@mai.linaro.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407010616.749833-2-inochiama@gmail.com>

On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
