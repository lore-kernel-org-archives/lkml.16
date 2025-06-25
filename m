Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995A325BEEC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851629; cv=none; b=DuUH3192rD3BtbeDExQID22MTvtb8cHKw6Rel27MnVb/tFz4nZ2uDaJVtVjGQ+lLqrGF2dGops84LscIB1WnLpg8vCN3b2MldDh8aqexvQ66TG7q3w65tm/pSByryFOY9GvjUVLJrUkT/PmwcQyIEiSqGbhqOYdaUDPcgQOz9y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851629; c=relaxed/simple;
	bh=DDsaWEyFeHz75TetdwbTXXC5BNl+pjLGrj08BQxMqQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4m69kIzsUIxvyd7yo3lsSncNN0l1wUoCDmgXdLxg6rh+D6mWf62dx/r9MNJKgfwpHqbKHwlbPezWJ62ZUNSWz79NIydw6uR5q7r5qZRUZc15cof/5JP2zM1dmBTDekwL10lw6tLOSm5IFFbAlzH87y/ekqJs7U156MM2fuaZf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dr1Y25Xh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dr1Y25Xh"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0a420431bso372669166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750851626; x=1751456426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ta2U+QcnogTft9XpE1aWdMlfFtTXMxtf8HD/ZE2i+8=;
        b=Dr1Y25Xh4kLGK9GU252HU3sBWF0eoR3UAXOGdTVYkh8TW/Wa358NEui8zxYj6wheqO
         j2coi9sUpACavpZe8+/uiwLo/fcKhrQ4rqO1UGuuWjgbBCFRphPRHXnQHA/+IsiAUhBt
         XNZe1LgqGjqxUP7Klt8iX3hk0vanKnRTx9C+aGF4LeOpmNHBpSfNIR1oAW6JRrytomUW
         xPyd8GdOiu0wW/03891BW6rvMy9b+wTKooK1xXvcO8uSru02IrAYlsZ+fedjlPubixK6
         75r/hx39rvcP7bSPy3lPu3GINvcB3m1EZni7hOMm7JsMXAdChAkiDKeIdibfZNHVzHtE
         3tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851626; x=1751456426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ta2U+QcnogTft9XpE1aWdMlfFtTXMxtf8HD/ZE2i+8=;
        b=aonTrDYUpOXJuzg1k5lkUhiGeQmjhrjjQ5HvTBjZ9NBJfqbdlwQLXnaoUyI5mLhMWf
         hwZ0Z8kQREdjHHEsgQ8PZCCWU+e0frCE7rCaLOhY9Y5yyyL05M8BlkTAx8tNJiXyMzO4
         pAjB+XJraM2p8tdrjZFqcb87WpwFKAdsysW1aTTzaBvP1aaaXNYqgmVpQgIdgF8q8m5J
         CEFKnZ98WvLVVMgwO2fNN6pbTSzo+lR04r1x4zqrYzlJ2wcSwoXp7ODn4rJuN4MQRYPO
         RP3VE4CThCJZ3qWcm42ar7J8QALlZvc2mQibCorDzML4gp2IhUUq3EH40bxkP8LAWqjp
         mXsA==
X-Forwarded-Encrypted: i=1; AJvYcCXOvtmGgvPs/10gh0FkfEUOUh7ZF71Mjlc/7FzSqsdY6f0RGaKixluvlQDGp0VFD0H5HWPmfa2UV9kb1C4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBYi0NSXtJq5jq0AJcfkEMb9onwC7v864zzN661QeZCHc5y/bi
	nYes2jbTcZ1uYHivksAHrm6uQ4M4IXYyRuX7wM6JxOZ1jxjv6lmKpoZJR1rUR4lvkzg=
X-Gm-Gg: ASbGncuKNsc8uLUw8hvQoD6tPHkiRiYdzoItRlqHRsHTi8mPMQEuJeO+L7/C+Dm4Hir
	M+kNTWUlAtG/YK7CQ4QVF0JXJwwo1QOdvbgjppF1kCdrKomlbnCNcDD+ktnUkDjXa17ZPGWClMg
	/iTcAer40Lho2C4csgmNfNTAXOhFmH+IQ0AZRiem6VEZylEDuW1YVhHhw+hq8nzZjP3DeWQkTo/
	DeczJwHAlmqPUBtHESG3EoIEcXSt6xclH2meO+FY7jvMmKu3nONb6dblIZQWZJwm8lFcZzfKAlJ
	RB53UGKwy+6istaaXlUk25c61Pt2XC0ufpeIETXw0pd4IJP/MnNmxZK0mCE4dXFoxRlYhg==
X-Google-Smtp-Source: AGHT+IGymkDJa2PepqWKYweFBWWgXgdsKbBJ6SsAwFL8JIz/ma8KQ3iqRebiC+IPQmWTbUJCcGFyWA==
X-Received: by 2002:a17:907:9482:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-ae0bef1b3f1mr265885666b.39.1750851625821;
        Wed, 25 Jun 2025 04:40:25 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b1b1ba3bsm235787566b.93.2025.06.25.04.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:40:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:40:23 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add support
 for PMIV0104
Message-ID: <aFvgJ9euu1RwHXl+@linaro.org>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>

On 25-06-25 11:14:59, Luca Weiss wrote:
> Add support for the eUSB2 repeater found on the PMIV0104. There is no
> default init table for this PMIC, just the board-specific tuning
> parameters are used on top of the default tuning values.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
