Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2223B293454
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881917; cv=none; b=F1jA88pSlAUnVBoxzOaEhx72DWbGaD6PA/OhRqxIsZM8JcUVMnLPQ8s/pwkkG0LENF3pSYWvtbycOkVPWwQd/Km8NL77deeioDm/LXs6sfhwx0IJK+ugKjoOwe+uNkmVX64mY6aOEpcxmAyA928+jqzgAwjCP6TzmwQzDBzlIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881917; c=relaxed/simple;
	bh=ajImuHw9dHJfEfF7tntmwUJ+Z1/AOwGqsKyr3FXGHk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgsmqauo+Ld9tI2oQd4/JJAq7FGpldR3yJvwBdiqApced/slYnKupOM4Y5AakwJSwwUBG5iGN2VGsczCVIR23ZA1qb1P7sg3OuHEY5BdWrikrSDFek8Cv2/p/vzPw3Jh1PArpCnqXNzYq8X3CpXMnSesBQWMyQFw0zNtgEFiNfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E1yOP5Y0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1yOP5Y0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1478629f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751881914; x=1752486714; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79T548hQN5814nBTBXiq81/NbOB8dSsfA+CdUxZMwGs=;
        b=E1yOP5Y0kWxY5xa15UE6HeUJv+RAYCG5aaxMfUK4VRucVtXuEdVWRNp/qdwtUdWafL
         NbYlEz8zCysG9/bOtnB0nLHuBNfMKLf6DeVQ9KoD70NuSjmqOHztVUbfIgtl51S1pZ2t
         aCtIkj9kTgchJBfJ5CTS4bUsoHGr5j7PHx6IpdK3+ZxK00lNhAnMSf+kbkXtkvQpSso6
         tSK3abm3uD0yzzfLlMcoKYq6K0Oy8dmhtpyKl1wEpHrmtZUp308MpyIIc1RUP1PBfZRX
         02Opaf2Iqa2+T+1EbfPc1O7D9oK9rU+fQ/VNWGgm4BQBiMwjPs5wIgUCSU375R6N7uvx
         Opxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881914; x=1752486714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79T548hQN5814nBTBXiq81/NbOB8dSsfA+CdUxZMwGs=;
        b=WoyBwEmKQKFl+v2DwtxFI5wS2P4DOkaeH8X1hBD6qhrzjLV75iUF3JwCqLDddr01CT
         SkjEa5vlMNdoEeRYpGQnaNh2GTp3l4756UaoHBJKrry1yjzMv4Ra26X/2+cuB/+k3Nqn
         udddLJARLV+ZbPWbU9PBEcvw6GBEBn2gODYMCAEwwEiEjhJU1f0417zjUUJTIu24vDyU
         IqiecUU+NavWKYckfnKX9q8B4vk+I2DeP9e0dH1D+Fgxo65aA+tNtr0pqlPYfCnmbv4n
         AmYvT2keq0bTTKc1bs/aU9RNvaAIfzGWXnX0Vz0zZhOIV8Pfjv6jd29EbDw/Nx3ZM4fA
         70rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVxiBq0wybYX/EE2BShxiRC4bb7qBPM3VqVUrwOCenntiF1xZSqsthK64k4plhtPYlwFSr0jtD09oxVoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6bc9/Zy8xcDr7TDq7Ol7LQ5HPxImPVdtH2VwA5R+hSApYA+e
	vmSgeP+wKOYDwLcTIylDxLAXNdlka/ZnKOoYL8KMA7pVJ/uDuagUfUuF7JWnqhMqn3M=
X-Gm-Gg: ASbGnctbx44TwO0TakQjHyHDRoWhSu7zS817hEY7pOcRpBd+fe9wQjOQPlKwl8VoXLa
	w4LAJg42vfkSGrinsJUoXgVl6mPUq+Q92O/GSle6WezR0W1e9z7aed0ovYOS+SkfPcUckeR7frg
	ZpHNQA2WZgs/fayxC7QzD/3QHjus5Ok43pEhOgUSBegb7FyhCKPT1JkiQ+gzqW82A3ra5Xcpjsk
	gQyOnsNvAWVTnlfR4cu3QxhHCQuESfYhIYT0KA2Ol84TqIdQQu1MX84aqzn3FoYv3glCeqX/F+x
	6e8Q7kjPWfgWltIaqbq+kRckUl661kaiCBEfI0TPJ58chLiLBrWNJUnqPz0sT1kAOTYv3Q89dnd
	Btwf9Uc1P8jEoWjbtaHsYi5I3
X-Google-Smtp-Source: AGHT+IGbBvD3G+FSdzwFOCs8u0Qb5KRrn3BFktAkDC8zaXAaZYuaw8fsJOebPSukrMKvjGqrPVXcNA==
X-Received: by 2002:a05:6000:2484:b0:3b3:9ca4:ac8e with SMTP id ffacd0b85a97d-3b49aaa141amr6531664f8f.44.1751881914436;
        Mon, 07 Jul 2025 02:51:54 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b472446fddsm9775271f8f.66.2025.07.07.02.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:51:54 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:51:52 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: tglx@linutronix.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
Message-ID: <aGuYuHx5qlKCur8P@mai.linaro.org>
References: <20250703110415.232741-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703110415.232741-1-kkartik@nvidia.com>

On Thu, Jul 03, 2025 at 04:34:15PM +0530, Kartik Rajput wrote:
> Currently, if the system crashes or hangs during kernel boot before
> userspace initializes and configures the watchdog timer, then the
> watchdog won’t be able to recover the system as it’s not running. This
> becomes crucial during an over-the-air update, where if the newly
> updated kernel crashes on boot, the watchdog is needed to reset the
> device and boot into an alternative system partition. If the watchdog
> is disabled in such scenarios, it can lead to the system getting
> bricked.
> 
> Enable the WDT during driver probe to allow recovery from any crash/hang
> seen during early kernel boot. Also, disable interrupts once userspace
> starts pinging the watchdog.

Please resend with proper recipients (linux-watchdog@, Wim Van
Sebroeck, Guenter Roeck) and the changelog.

Can someone take the opportunity to split this watchdog code and move
it in the proper watchdog drivers directory ?

As previously discussed, the auxiliary device seems the appropriate
approach [1][2].

Thanks
  -- Daniel

[1] https://lore.kernel.org/all/CABjd4YyXwznntcLVcYL6qx16YEwv4_VWzrXrE7_QHmQxiE0pXQ@mail.gmail.com/
[2] https://lore.kernel.org/all/20250521-vt8500-timer-updates-v4-3-2d4306a16ae4@gmail.com/


 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
