Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8B315687D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092115; cv=none; b=Tt/D5UA7Yks436aI/ORaapEHz3Ym2dmKAkg+jN9o9CRcv417wPeE29KgkhukDQZxX/68BRJ09TsfMMBj9ttMJYgajo22NDgWAuYisaYnNw4nmqrrNfdl1jCAREqTQCdGaMaC0SvFt0xk5t9fJhmsCKKpxqmVlVBcjctw42dR8Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092115; c=relaxed/simple;
	bh=qWWCTQ68mq7j+CUwFi2K1aEUZ53AMjvsxRJpUc0PO8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDYdzjEaVBZTvH6buGQBtvnPrGVMr2xkbn3YaMWTRpuSvvZx0N+f6oPpxIJOXun2RO5D0OhEc7U2U5RdkxhafCtlWA6JZvNOGXcaUS6gBzQICejZzMow2ZvYAaAsCOAZMuL1dEC1ZTuX0L1Hw8ADMbTKGAXS18P4esBlfrlTcI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wm0+CTRj; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wm0+CTRj"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-727388e8f6cso815845a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743092113; x=1743696913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnEqDZEWlinHyAAguReDuv9plr3mmwmYbGy/mnA8rGU=;
        b=wm0+CTRjodY77i5hgLK8nMtFll1NDLVnJpX31fyi9QDKk52Z6MYN75egd3KYf0p2Sg
         HgawHQz1jBO74gdTCiF6RO1PsmcZz5jUC0W1ub04QFFqkxW3tV4e3exLSSyvDP0lDder
         TyHhKsQTtaCxWoecyI9AbGw90AysowdEuVfhEqTg+x9m5cF6Fx2czdifJMHASuZeBBcp
         LRkHt/IOo7CDKtS/pceyzVQ8SmNb6VoErOV2YrzuYTBgioi9Ssp5lNqdLjdexacFGmUk
         47wNT8oQgmJ2nOqbH/sgP9csbAaCpQjTmE2+hI8B6b2N9HGFNUhLzn3uBdAvc8pphMFz
         lm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092113; x=1743696913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnEqDZEWlinHyAAguReDuv9plr3mmwmYbGy/mnA8rGU=;
        b=c3fLGxb6bg1wJn38meT3Vad6rfSItj8ZcDplz01Qy+9eKrqFGJnc5+Cs8rhw/nXg6G
         NrmOlN747vgwKKWWal3N83J+8Hen5HAaTmNcwnDRIxU2WcLyj4U3RLmqzcfIOJzvj8W9
         hTUNk15MqdheHnu0pTGSTvnTVKou7HPhoTuZhd6xqLXIX/s6MHF7a1kg34ZzwbNMJzXW
         y6jTltDVL8M+eB52eEe6BoLHvrw+nLzHXacbet/1OQG5zB64GYpRYICBHyJdFwqPOA43
         eYHvPm0AyUPmWvbz8kZUrbhvCyUPYjjELr+g1QgDePvTDALPd2ZvNlcb6wVjXqcaNl7s
         CKfA==
X-Forwarded-Encrypted: i=1; AJvYcCXUNu0AC+UzbEJ4ubBRwQWyEtdIBBvoQSNlxBydxcv+S0raiWEUJmkYdyuWIfNJFy4TLF8WerLohHEvIX4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0G04CmHisAlp/1WVk3t9I5jv5dRcZdgw31sWHEHVPdShp2OPP
	BRh9jwIuYAvkzIs9Rhp9ufLsr8pkD7sHZG2ZB13I22ppv7ONUyE69HoEBDk55cQ=
X-Gm-Gg: ASbGncvoaDzA00KIGITH1kITK1C83hde2ZyWEBu2nUSQ2NbmuK0HbHz0MQn0/Niqu1e
	iSDC0kwqWhxig4x/WwIz98Rhs2OuXbiC4nfPdMrUQz34UtjLBT3Xsbdisj32jYrr206z2Fwbkgj
	oR6RDpT4vwLG2/mLjko8I5OWHh9KOPFgAt4XhrDew+BCviIzCVyRSvS4D2HYtF2vpykF2MVlcI/
	V0Eg8zIBkBUF8kKrSVSCxSHqIDCUh5iAwE2dRUKv5tTXckmx/A1P0dXHSEz7OQbjzhr5BcgcTHE
	qmgyUt0OyOqxgpMQzz3Nw67VVr4SQs0ROPjudT5iq/Bbts7LaAE8NjEOlcNb2VEYaTr5B0XDTsL
	yTp3dOFH2KwxzWN4O
X-Google-Smtp-Source: AGHT+IHiFiIz7UFhPR1z1zzLH+wMQcHJDifB2bdOLA/PHdSiNHWEb/VWM8B3r45fvBHqZCOtSMsSlw==
X-Received: by 2002:a05:6830:4187:b0:727:439c:d18b with SMTP id 46e09a7af769-72c4c97a4ccmr3152769a34.15.1743092113322;
        Thu, 27 Mar 2025 09:15:13 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c5828ae78sm33512a34.60.2025.03.27.09.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:15:12 -0700 (PDT)
Message-ID: <227eaefb-a1d8-488f-9fc3-6d00baa4a56a@baylibre.com>
Date: Thu, 27 Mar 2025 11:15:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] Documentation: iio: ad4000: Describe offload
 support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742992305.git.marcelo.schmitt@analog.com>
 <92b7db8eddce5b11476352405ed7695107ba7745.1742992305.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <92b7db8eddce5b11476352405ed7695107ba7745.1742992305.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 8:25 AM, Marcelo Schmitt wrote:
> When SPI offloading is supported, the IIO device provides different sysfs
> interfaces to allow using the adjusting the sample rate. Document SPI
> offload support for AD4000 and similar devices.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


