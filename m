Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F81C22CBE2
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748532410; cv=none; b=OX0hMV0oRdGYbiH6BRhcDRhBqew8Zrpt/P75EKaoUgHTeGUP8FW3rsxT1JXQjfDypMM2dJvCmGWH77yWQ0x7OPBQKvNVFWbyklucjeglGMRze1Bse0mXB10xNA2LQZDJ3NK1mMeGGNWN+ujS8CHPXKCJV2bPGUu5gkDtN4PDhy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748532410; c=relaxed/simple;
	bh=XEg1T5QfcPcZ/HVp8dE3KjQ2QZb3eLEg8fe6ilAvAvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTJykGM+akvZTGjy8H+8lJhY+fQ4ooarQfO2gNIGrKYCYvVwB2oeUAnJivL6/w2VO83zbc4JNS13M+uXYyQS8zGkrGWtfTB7lmHOu2Qs7bdldrnJ41orcyDfdrDDJxbznqR9G05Wa+YTmMfrbz7MPJzi28FChZQxHnlhyjK3Rtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jRXGYYtk; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jRXGYYtk"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-606668f8d51so661408eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748532407; x=1749137207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwNV9XkLQhzGy3LnwouyowzyNAVfOZn4v9Uo2M+zdnA=;
        b=jRXGYYtk94DlPui8hRvVIkt2HwcEeSKt+e3k4iwPxhcrSFCbHYEykYrUUB3YH5vIdU
         kAzEJM8C/gr55LoYl55VH6hfwN6hds1/fzfdPf/4roec+yIrBGRnAaICJ+I5jq/VDZM4
         bitwNW8svI+CTkqjTNzXetiKdC/gDtZh4eExIjCwzZrbZ5CRVKltu51VIEQVNi3gfKCc
         3KrBjJDKLCJnpSYSoj8zUzTEibPi0r9a/1gS5pgNAhm0IQBlOk1M5kvt1naFrUC1+SMq
         weXEeaE/bCVNctfQOKfWw//w+0/NeerSLh36Uq78Jg7M8kFdxvyh0s/eIplVs0Qj2Y9N
         4jbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748532407; x=1749137207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwNV9XkLQhzGy3LnwouyowzyNAVfOZn4v9Uo2M+zdnA=;
        b=qMu2iEzsZMkAzJK7HW541Ru+MC0oxYH81TjQZXUhQqAD4wn8R8Qhf7t94l6U1gEGtu
         qaTt1XgvOwShdjNRfnCSKYb0gr6lijP9sFqxJkw1bPPqcJdn/KYHym1Al0Aa5P4zDTQM
         Mli7DEx5JxDkuURn/JXqnPqCi0F8oDrv5qGrklM7xjKlsIROkCIculX3xRp8x8p91IMA
         DkSsMNv+HbPIHdKAt4Xs+Adpu5OhsDbnaIzH6E/fETCK/3GuV9BvSURNRroRTPn1W63x
         Dz0lb5bjjvBa9CqO/T2O01q/zciukp4vMP3Btq2tDMBOZp7Gxn7L8bITk2c9j4oN43w1
         OXSg==
X-Forwarded-Encrypted: i=1; AJvYcCXwyDVGOCEnl3PZXSZhTsBzLAKqRkQsVeHfahKb/WIoal8jcncUnv/jqu4RHtc+ZNrVM3xQV0lHtlu8Jg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA3L+I1w4Ve4UPFeur5RBUFxQP1zc3RS3CfdvUr3GVtpdA/OSo
	+5DJuJmyLW/VusgiKPp8CCN946DbEdBtwprbo2ccnIGDcTef2f+kHQyb+k03v/o9J/iwORmlPyK
	2pi0L
X-Gm-Gg: ASbGncvEskUFcS6K4MRErnL4PCHPepUMB9gCpTB8N8nGofeix8Awf8+pwT+Pe0KCKN+
	++nwgcYDPR4lGJ/SqYSqpbtKmwkSJ6Rt3R3mFq1tpEs9FDAsDzjnWfC1X/2AXX/5RVhp1cdHaGG
	SQrbVMMVbgpoxwnRNSHcwN54jxc2oalTObetVixhJxGAnPxAWYOXwXhQNRpJ9U3w+t5JP/7HzXF
	xembloJsLcddmMAXFNW9BEflP7bh5eKTwTi5AVCbyt4ESojsKwMOkl1Go6oDWsCBrYvdqs4ShYK
	EbeDDzy3hNJ7rqis+eIIlfHU6uOkXMXd+/44gY8Gz7tIJPSOmhKtjDTDF1Xgf3SsA6tHNsw3Acv
	UifxWkHpgjtBrelCHkPD3a7qadA==
X-Google-Smtp-Source: AGHT+IGPjvnGC1YvRZH9st24obs6F5iZRk8vdE60S7IXw1MFMfmFFESs0FdIBrXXqrBC8I/S4dstZQ==
X-Received: by 2002:a05:6820:d11:b0:60b:cd42:7a0c with SMTP id 006d021491bc7-60be4de19eamr1424084eaf.3.1748532407038;
        Thu, 29 May 2025 08:26:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4? ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c42c16sm30504eaf.7.2025.05.29.08.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 08:26:45 -0700 (PDT)
Message-ID: <b9b9aea9-e02d-4d5f-9f07-ef1c54e46b89@baylibre.com>
Date: Thu, 29 May 2025 10:26:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] TCB: Add DMA support to read the capture register AB
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Please include the counter: prefix in the subject of the cover letter
as well. It makes it easier to see at a glance what this series might
be about.

On 5/28/25 1:13 AM, Dharma Balasubiramani wrote:
> This patch series adds support to enable the DMA support for TCB.
> 
> When DMA is used, the Register AB (TC_RAB) address must be configured as
> source address of the transfer. TC_RAB provides the next unread value from
> TC_RA and TC_RB. It may be read by the DMA after a request has been
> triggered upon loading TC_RA or TC_RB.

Can you please explain what problem this series is solving and why we
need this change?

