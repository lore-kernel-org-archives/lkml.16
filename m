Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655651C84C2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123396; cv=none; b=MgBHOWZGqefdKNQCWWh3RMK0kKG1NEdVjO7pubIA8OxxB3LlBNA+mP/poRRonCTGRfwMitEyO3eQWzHrZUzrRZPHlBQm0Eij82Ao4o6diFa/7ncOyR6e0IF3tYqHqCLyS3+WL3mh3cWHj5ZdO5adKmaRfUpT41y0Hq4wDQ6sBE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123396; c=relaxed/simple;
	bh=5X7WiAHhEsNxH6J2yVsjgQxTBS34hllTgevGnMaFPII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlycUawrzOPBwiBWJbYFZoEKntR1cel/OBpjBiBIGgereOSExdJQ/F/BJ3488+X1J4Qj1yJfndrDdBxwW+9KN6W34f/IbkiIRzh262hK6yFS6wrFnHl5TMqtdzwf4vSub5q+tZWTbMAaphByFAqmBfvvmiEyh5vPSjX0aPjELwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2x91VZV8; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2x91VZV8"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72bb97260ceso1552215a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744123393; x=1744728193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZX0aGXRptTCUQcorsU5tL8EzdmJ/4Dcw0VhDpZ9VkFw=;
        b=2x91VZV8Lly/cctXzyrQ9Zb8URKEcOh3hZczKan0mwYIBwc7K09W0xTihHXoH5Ss7H
         Ml4vaOEsD/eo9wBYYNdMFIjfrv/EHJbWQMufaAsIw+tN2enhc6UanttFzH77AlshTAEo
         Zfw+pjvpz5mJt6BuoS7RxnH73/6MDSpcioNGRJnYHl0zL1Q1I6wPKKnZCpiqL6ixcePM
         yAmzcmbrxN4OSLH99v9ESU+zIvVSxuKR43ATYZaMbMlHsV/wCf6IXTX9TV/Rj7WpBBsH
         7x71k1HV/t+apiPBcLms0nDe2cGMeyMBK3i6Fk2Wy/Y+EYbsLtn2xE2+9UAYq9Uur6mL
         obgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123393; x=1744728193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX0aGXRptTCUQcorsU5tL8EzdmJ/4Dcw0VhDpZ9VkFw=;
        b=q9HXwrcOuzmaf2Ojcu+0KYbtYCvcJq2zFqUx8ijKzm2LhPVGQPxhRmvMFCIjGq+Pie
         DCL1gwEmCS5D5mwiirZiV7c9c6Lt7pqVauaXaNKSSK9TA9DTsr+TCDebyVSD5yKFnDjh
         rs5qwuxenHvYMpL9LhYGh1yV062JHj9zeI4Gxzo38ePEUx0wIJwhOKt7mPoPj60RdIDY
         LEuYF2OJQfpqHH2U+A8zqAzG2W3CWZqp9GotafyJoMUDb6aTRmu59vT9d46Nx778/CRB
         fFi4FWnFU5wrAxyAI/aJtk5s5XLI6400ShugIlfmsU3zv/vdI84zILZMaJQZVcqXZGX4
         aWIg==
X-Forwarded-Encrypted: i=1; AJvYcCVp6gqZzh9CLY37OxU8nXP46Sy0Xqz6RB+4zO9Y/VewfBVVcHQZTKRGIBKczc4arDQDLo+3naJvfIyHJNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOTKZ8lP6f0OLM/soY/KWigfPtNoK4jtU2vhu/8gF11Kh66zO4
	gnt0+/m6vOLx+gXNVOF5lZHCnkkwP0x9wl5JIWkYMSlfXDkYhC45umya49I2Tu7Dw5m65lZOK2v
	u8bo=
X-Gm-Gg: ASbGnctlVAkO2m3CAvyLO9l2yYDLOE2Cmi7mQqHgFv4XK6diB3LzGPPXrWnwWmB/EuJ
	bdJbFkdmsnL5cNc/Ifpg4k/lLfHTCrRoX4UoKgPLqFgK9QzFo2PM0t9fOfkkc6MtH9pnGJz5MOI
	QZFka4KM08asvgr+wLnB6oiY65Orcc/LhWzXYj8N/ELe+93S9sAGl0BhRgHWaSxtn/ySYgykXPx
	ygmHDSWhW60lx61DXQyXGaOqJZ+bKABPVY+Dl8wKIXKZCbUKTV3QUhJgnKSuWaad6R/d6nXfdqe
	zWwcvOXDmmwA4tfW52NWpkAbL0PdkPMmosk+slGKZPBKSEGNoCcbQU/1bB9TpNJ0q0lEpemDUPl
	wtoeT/+7rg3w6eXJs
X-Google-Smtp-Source: AGHT+IHydLilQvszzuRpWvpl8zBnzCfe2oBsCFFQZFAPCcrx+PW2NEIcAFyuNBZbinDzJI3j0Elo8w==
X-Received: by 2002:a05:6808:4493:b0:3f8:7c69:561b with SMTP id 5614622812f47-4004d99ffe3mr7838878b6e.14.1744123393329;
        Tue, 08 Apr 2025 07:43:13 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40069105b97sm475279b6e.13.2025.04.08.07.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:43:12 -0700 (PDT)
Message-ID: <0550fb58-cff3-47fd-b5f4-cbc19113436c@baylibre.com>
Date: Tue, 8 Apr 2025 09:43:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: adc: stm32: add oversampling support
To: Olivier MOYSAN <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403162358.1257370-1-olivier.moysan@foss.st.com>
 <25b34e60-5392-4bfb-b994-49212dfbdb22@baylibre.com>
 <6d12b6fe-85fb-4345-bf32-02c0fbb1a27a@foss.st.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <6d12b6fe-85fb-4345-bf32-02c0fbb1a27a@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/7/25 11:07 AM, Olivier MOYSAN wrote:
> Hi David,
> 
> Thanks for reviewing,
> 
> On 4/4/25 18:15, David Lechner wrote:
>> On 4/3/25 11:23 AM, Olivier Moysan wrote:

...

>>> +#define STM32H7_OVSR_MASK        GENMASK(25, 16) /* Correspond to OSVR field in datasheet */
>>
>> nit: Comment seems obvious and can be left out.
>>
> 
> Oversampling bit name is "OSVR" in datasheet H7, while oversampling shift is "OVSS". For naming consistency, I used OVSR instead of OSVR,
> and highlighted it with a comment. As an alternative, STM32H7_OVSR could be renamed, but I would rather keep it unchanged.
> 

Ah, my eyes do not easily see the difference between OSVR and OVSR.

Makes sense to keep it so grep picks up both spellings.
