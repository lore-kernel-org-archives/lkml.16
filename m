Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7C2063F4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583773; cv=none; b=L+sJbb1KDDaxNkzkQWDsCGBDb7giFXMHwnj0BVEN5atQr8oEQHau0UfYgVyk3GtA9+yAyx2G+hsWWaQ3Swp91oQmm8KyVkVXLsGJcgPxL37tDfU7Gd9rMnag9OTbOHEbZuztjGP6XY2RsAtdhBjGYAg5K+QuobZSuahApwGGWGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583773; c=relaxed/simple;
	bh=5VO8qxHdPv1GlCfSqdK9sL6Lqc78mt2FtDInjR+r4xE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=STzXzAenSMqWqXFDKuP5idcz+MOiZuBQbfNNuTl2gpL4LN1sJZDCi0bjLFKkAZYnlFvFNpoKeruaIQThdNcM2V3KvLUTYAdzkHlnY7wKRjLUATne/SWulc1yNz5a52TQiavq79DxdhxkkJmSkTk0Ig/toGNBcJCnUjKTRTY4wFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UY++Gbq5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UY++Gbq5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434f398a171so5644405e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583770; x=1739188570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf+nXVuq0n7+9Hzbsc1pHZN283D6/tls331wlf2T5UA=;
        b=UY++Gbq5oALjic2kiOL6Y6hx3NYz7TLaTEuDiFgSUfyOd/d5KoeixoJEi0gmy8Bpbd
         RAc4vqJkhwL+BIrCT1teZYSX0kEof3cFT61U1ZL9GDqTE3x8qfK5+g33EddyXkzCmIgI
         QakZntsvRsbN8TyFRl2O43OKnHuPTskB/5702h5bZzjupoHlZmIKHY0YBljxaGrWmyzi
         povy+oQIk3MeQthGJj91UNlkbLdn8blPqaJL8EPoJPCgqA6SpNkV1k6WZQF8oiuKqxIk
         DHDge6l9jKS6mn+ZFPQgW2O5oQl2tzP5BGeAHVj138Sv3onnk/MA9UL7qVu5ghlT73K8
         KM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583770; x=1739188570;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hf+nXVuq0n7+9Hzbsc1pHZN283D6/tls331wlf2T5UA=;
        b=K28HL0y66bn55Vhr9iH0Rud+STvsGkdsocbpmK0xV60ScMPcU/cuVa6XuiimfC1DaB
         18KctKEX8zkTx5txaTPwXLlNkaWyqbiQ/ECT2k6VD0jdaPVkaPkxG/4Vq37AQfFRtWH8
         1mMFCZm+cxtS7kUk4VMrwQ6ykIS7kzL6qSbZEiK4+ODxEjV67Y86JINGEV7PBgtkEs0V
         ToAOqUACcmXoeR7Wy3dhreGU+/IS5N60yAtFmL+BDd+9AeMvYqYQl/ROvkty/tJvfv7z
         utRUX9hQvmb9n2iYQRaAGQyCBnfaaKWqUoAz/gGLj0UTQT74vBsMMBfHo8vZ10RQNhOw
         x2aA==
X-Forwarded-Encrypted: i=1; AJvYcCVWORaOIhN+FKPQCbvKbxfhmLMiSsPgdrQLZQXTliklX9jdMvXLMSHtZNQ+S3z4vwgu0C6UPBdzHcxvDhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrhWaifIduwYmjGZDPRMXK29nHEJbzGRhExcV4gBBW33DUJPc
	LnYKf+TE4TcNCnE3uPsx0N8XBo2DzXriPleWDm8CHojfjrwD25bVJzMe2SaIgx8=
X-Gm-Gg: ASbGnct2HCtUZ405SvGVafgoYCOey4hQVMOZ6vpf7BpcpdAnDfqx9c2V2APffYZI6DA
	cy4mOq0srvOq8ce35thj84SyToqYI+0AoAOT9u2bLIpaknfdl7094PKyfUtrwtKkpu5JjmtZe0w
	KgC90xfcPOjGRpuZyCVU5ql0Cz3DUM0guQlEtKtmKeB4sA9bBHXiFUShlA/JC2A3NKQhKb8A3zk
	RdGbEkjv2haibGvDNhaiEdcBGtmdaELuPZ54MG7I+OHb2ejwIBGyXnAtqBttT1pW2O/fz3LIc4I
	pX2qwKISxvhvtwzhzuIv0dib7klOxmg=
X-Google-Smtp-Source: AGHT+IFQbSU80i6YQYi6YzPYyBsllYWbDkIcbgELZu/FC2dJYOz3ZShx5Senfvr4yJ63Nm+XoGt8PA==
X-Received: by 2002:a05:600c:1994:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-438dc331eb2mr74266625e9.0.1738583769775;
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7558ba2sm166790545e9.0.2025.02.03.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, netdev@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Huisong Li <lihuisong@huawei.com>
Cc: oss-drivers@corigine.com, matt@ranostay.sg, mchehab@kernel.org, 
 irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 louis.peens@corigine.com, hkallweit1@gmail.com, linux@armlinux.org.uk, 
 kabel@kernel.org, alexandre.belloni@bootlin.com, krzk@kernel.org, 
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
In-Reply-To: <20250124022635.16647-9-lihuisong@huawei.com>
References: <20250124022635.16647-1-lihuisong@huawei.com>
 <20250124022635.16647-9-lihuisong@huawei.com>
Subject: Re: (subset) [PATCH v1 8/9] w1: w1_therm: w1: Use
 HWMON_CHANNEL_INFO macro to simplify code
Message-Id: <173858376808.132674.4568544450122043067.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:56:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 24 Jan 2025 10:26:34 +0800, Huisong Li wrote:
> Use HWMON_CHANNEL_INFO macro to simplify code.
> 
> 

Applied, thanks!

[8/9] w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
      https://git.kernel.org/krzk/linux-w1/c/33c145297840dddf0dc23d5822159c26aba920d3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

