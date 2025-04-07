Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7132451EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030372; cv=none; b=qaTjQ9qeXkqvmhNvQGoSOKxnMyVasjjJtbFpbY2LqOqneE6MD+evODCkOlIkaCTBhf/MVyjxwwwpx7vfRI6n87Y8I61yKb6RJYUaEKEgbHd6HOAAQgtyPKre94ukV+TvMgcZ2EfZqNnd4OEhyZf+NtZi//+BvGj+nCcEeoIUxCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030372; c=relaxed/simple;
	bh=UXiS6e53ATjOlg1moLZoLxv1EVd80kQyo2/El27n4ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNp+OpF4x5il1u88BLvUxLi3VKyZ3CbEAReKrmxNfS0jlY7RMqbbC+/tnuWqiiyjShgQesVVBF9CQMj8a7NpUd35iFac4ESeAEhENvp+Bc0PedXOPXogXmS1+UXNQ6bDVe4N23K56MQPZrQdwV5k8zEqwT3V4d6UZgPu4UfW2lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NcpuByQk; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NcpuByQk"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c7913bab2cso39213685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744030367; x=1744635167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXiS6e53ATjOlg1moLZoLxv1EVd80kQyo2/El27n4ho=;
        b=NcpuByQkxZHwkER1s7yM+CjwKLhf/6elDU088bRMFHXGiNR4QPpxV/SWgKfZiU2KbG
         TdecuOkz+6WLFAijtBDrfn/BGWabxD4fE4FkHyiMu8OVEihosibzAG5FpKPOPWLPVsN8
         Jmm+GatMe5vtE+AKpyncvMKIHLXS6I18Sfxq2tUt3yE+V0FjRXB20JSxL2PDT1LBJQHU
         UKyY95bXpCG4Wi/kF4E0OHQZJKv3piFlW4vPdhlpNNZE0k48pet1T7sPRdTZgM1vFoU2
         uP569FMxt3hv0f8+O/gHriOsc6s8G+xGR9GvzvLoF3WEkld717Ov9tc6IFoUsq/FUVG8
         0VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030367; x=1744635167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXiS6e53ATjOlg1moLZoLxv1EVd80kQyo2/El27n4ho=;
        b=bxd0gD0T9riP70dfh5fsEz+O3YKZ9Dy4ev9TBsKG5XqwHUMpvzjy3ZHBHvRMVsg1yW
         ZxWqg9nxSQMeWxTGBq9K7N4lT8w90ueymb4hDFJmrkOxr9PBKtt4Y/FtiAfPAFl+LKJi
         yIUnEoboduH52BgiV5LmS7aJwMZgjb3XZFKeIYC3zrQuFq9fVezsGHV3bEMyWkRJO3ng
         nRXlIVl0Z9Ba1mPNGwQT343iEP8j+6YZTieS4M/VKx4CnC6mEKcJ0798osMPaExnumCr
         CF7o1KEdnX5W+/Vqb6jNQG3VUfnRSnpScArVx7hzg73Ap3qM7LePUR2nnfvdSEMjkpYw
         FXFg==
X-Forwarded-Encrypted: i=1; AJvYcCU3pwleeZa9eaHuU62jDYD7xt5fj/Z3RIQbNmfrkWcfzItL8oODG31l+jWtWww4jhrlUVHLmSw8ewEKMCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4PrY2z4z/mwqA+4DuFBWOWLFzWAvAtSUvuij4PzV3rVb7yJ1
	ExjV1WC+YpvedMixAMCO9G4F+/mFusuS1atagefUzqq9rMdtRkGyq7XHD3jB9hU=
X-Gm-Gg: ASbGncvKE4mj3rqbQnXkO2naI6ifpicGUWTElrqs6Y6GxFtoQ0LgK5XlL/1joBRHgGK
	v7wIXghJIH+gxlbgOLwu5IYRUK8Ae7veW1H9BtDx7DXR/DUgyRGHluhTu3mDtNkVoh6+qjhqrk3
	xhHLFPPVCB9t9SzJhJPyH5G2UZsyQBtiQxrOlkgiRRPb/Efz5bs349RaQZKulVWnr+Z7YeH0/pv
	LUayvu7Whu/8zduygMqNA4qKDpe9/oLJcxpZpjjgPhtjQdBhY5Krf6lUA8EH0QZLLxWgdsORrnl
	WOOyzLLswDTIAbMHpv+nwE1ug9y5IDpd71NtB3AXCA2EvIn32vWg0/dk4GiLv6gYiuEgZv5IzDD
	+lFM458Px8gWr
X-Google-Smtp-Source: AGHT+IFFujGf8/OpT8lH0erz6NHkVOvjXDhEBDliLgfZynIA49mD0iVlLuLiU9XRQecKr/w9OCmcAQ==
X-Received: by 2002:a05:620a:801c:b0:7c5:3c69:2bce with SMTP id af79cd13be357-7c774d1c888mr2175938985a.7.1744030367654;
        Mon, 07 Apr 2025 05:52:47 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea58d71sm591892685a.89.2025.04.07.05.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 05:52:47 -0700 (PDT)
Message-ID: <7de1c05b-5f52-4bd7-ac3f-ca5688d39a5d@baylibre.com>
Date: Mon, 7 Apr 2025 08:52:46 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] pwm: axi-pwmgen: Let .round_waveform_tohw() signal
 when request was rounded up
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-pwm@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, linux-kernel@vger.kernel.org
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
 <ba451573f0218d76645f068cec78bd97802cf010.1743844730.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <ba451573f0218d76645f068cec78bd97802cf010.1743844730.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2025-04-05 05:27, Uwe Kleine-König wrote:
> The .round_waveform_tohw() is supposed to return 1 if the requested
> waveform cannot be implemented by rounding down all parameters. Also
> adapt the corresponding comment to better describe why the implemented
> procedure is right.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
