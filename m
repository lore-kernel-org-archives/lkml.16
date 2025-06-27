Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47382EAB6B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041646; cv=none; b=ge6qJg/oDfCccQbrr3m9uPaOWldb+Zg/ClqenoTxOzAked++AP9Dt70ACA49E8Adrmv/CVkkK1jSJtC2CnUPnZn17HPnsdot8Z78EX7uWsDSfU1dM5p0E445QksTLxpmzYtZuOnJie6E2KfW9kJhb9lXUVOQZDMHnWAMFH9hDqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041646; c=relaxed/simple;
	bh=7J2Wa3sPySlrGHq0Zg1mHnl8WJ1dcQzGUqhzealuGNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSdDHnCCfMTq/wa6mJcSBZho7er+kVklCn5bVz+cX8uH6MeoBjx02bUJ0f9N5jVXXbufBs70r+iJrzStDHsWRSUkVH2nLN2vkXdJCyAyHe9iXAv6JglJWdPLm6WyGlK6KTuXnQgzrEZ9b6KXDsUM5WajcrnshRJh2EWRfL7XTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X1nlui+a; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X1nlui+a"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c16e658f4so44330a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751041644; x=1751646444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qKlvmyFZn+CwFvf1fECS/aASkNiuv6sHWrjfdb8eanA=;
        b=X1nlui+a7hfnXbLlfBkw3/0Xeh4Sfe7WMnIF+PsXEezNP81cVRQmHcHcFhsjeC0B6R
         HVHENZvHbb1LFwwQiw8cCLMl42z44cgNTfYy4DqhoP4Xxo3kZmchHO3aEHFacHtvkLrE
         zDgX8H1NoXp4b6Qxex9DE/GfUMULdHrQHo3xvjZd73mq54TxAiJSnVVNI6I3eYYJQ41f
         AJ5LeBIrrSVDU67epftXH/gdOKKkj3lJFl+UVVEH/ilqCADwxCWQ4F1VqFw1yfxf9KDd
         66BB1OZ4aQkvYgEnQZHkNKStfWJXexUAAcyhxbCB9zQ6cxuzyPTxqKV2uix28H4/oIWP
         sN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041644; x=1751646444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKlvmyFZn+CwFvf1fECS/aASkNiuv6sHWrjfdb8eanA=;
        b=s0nCmtdin2dli4Lbs/tPSHErDThsRyU9WaGVXNiBjR3e8uiCU2Udi/+KvSZRuanIP7
         EL/NpKYIezebbwjyXPLFFhQFkg2i3B7hzOrh2QjTx8bWymoloVG5O7CZyv0qrrcZMDrR
         WTU0Dt3UrIoBUmmEEVHqog5dVbEf7by2M5UpWj42t/OOT2yaB32HHyD5TfUnYWVlF+nX
         D5i2A0Ymt0ZMnAyZY9ZvpRqqnHJw0/1g4cPnZU43FLDE6hQ91zB9l0K4mdTfkmTDUik6
         xBvfbcjaLomB/ozrlwddlgE3s/1zOS2W89ATeHDfo7UblZ0AMLgAzHNpzJiWAUSqp0Cz
         EdNw==
X-Forwarded-Encrypted: i=1; AJvYcCV94rEq5vJ16DCOtZm/Cmn0quQ5uDW/MoIASM1sQjmoT4mf1FCwy0xQW5Z9D+gDI5Syajxi3CySIZPbUW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxav4VqGNIbgVwaeFG8iCbpZt1DOIzjwzss0rMRHG6aIl+nZ+Qw
	D9H3/JkRiAEXXRd1cR6i+UTdGKjWr9CVQjltcyTLL7AJps9m0s45Xprwana8S7e14gA=
X-Gm-Gg: ASbGncumWSLQE04R3xC+dafpJEan3xu7gFSX2xr9Z8tS0ikEeGKQaugnBcXjIrL3jfL
	/y1175qpu6DsKNJUOF1Yh4l5O2w+XHbMkijoAQDQ6EgSu7IPeNPEQzaOYYxaEwSlG1Zp2b5U6Sd
	P8jGz7/2pxqFSMoUodmp1nZUiyJv4jfE8l1YbKBjQd9FilCUy6+llqWeCGrvEmnsYjGSiJPuxyw
	cP4TYk1AzRjxy5eApaAjZ0DoVrzmb+odXjRV1PL+8s+X4BeErIMVo5udjNkHbyu3lPMe3nDG77l
	5ckiHpJ6rGc4wOIiB4dLF4KYWaFf3Q5jgr2zHg2Y3AgvdXrrxBWQ97aJitnzGMQnXiBY7hzthId
	27mEFFlKJ+9zKRpxzCBTVIMb9Hcfl6PBve3OydfGq1eVwxxE=
X-Google-Smtp-Source: AGHT+IGEpoH/3E0MWa+cvzBIlqmwlVY4mNTlSxULk1nWLfgYXMeesrrQZCCQRr90YGb8TriAyAKjbQ==
X-Received: by 2002:a05:6830:418f:b0:739:f3b2:80f0 with SMTP id 46e09a7af769-73afc647c7dmr2567896a34.12.1751041643919;
        Fri, 27 Jun 2025 09:27:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1715:453e:e133:7d6? ([2600:8803:e7e4:1d00:1715:453e:e133:7d6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb122c68sm407770a34.65.2025.06.27.09.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:27:23 -0700 (PDT)
Message-ID: <4d01de83-7b85-4127-960d-0563359a0844@baylibre.com>
Date: Fri, 27 Jun 2025 11:27:22 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] iio: adc: ti-adc128s052: add support for
 adc121s021
To: Lothar Rubusch <l.rubusch@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, nuno.sa@analog.com,
 andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sukrut Bellary <sbellary@baylibre.com>
References: <20250625170218.545654-1-l.rubusch@gmail.com>
 <20250625170218.545654-2-l.rubusch@gmail.com>
 <8eb80697-e76e-412d-82a9-5a95d4ca4f2a@gmail.com>
 <20250626192802.0079d579@jic23-huawei>
 <CAFXKEHZ8zDEXLT57BD5Dg1mTN-Gj0Z7uhxX5Xx=XH0wFeAhe6g@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAFXKEHZ8zDEXLT57BD5Dg1mTN-Gj0Z7uhxX5Xx=XH0wFeAhe6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/25 4:33 PM, Lothar Rubusch wrote:
> Hi guys,
> 

...

> Perhaps just one little question here to you. You used the regulator
> name "vdd" where others
> before used "vref". At the end, this seems to be pretty free,
> depending on how it is set in the
> DT or how you name it in the DT (in my case it was "5v0", but I wanted
> to keep the convention,
> if so).
> 
> So, my question is, is there a naming convention what to take for a,
> say, default
> regulator naming or fixed 5V regulator?
> 

I don't think there is a naming convention for supplies other than making
it match the pin name from the datasheet.

If we were to try to come up with some standard naming convention though,
I would not include the voltage value in the name. Rather, the properties
should be named after the function that it does, like vref-supply for an
external reference voltage, vio-supply for I/O pin voltage supply,
power-supply for a whole-chip or main supply, analog-supply and digital-supply
for chips that don't have a whole-chip supply but rather split the
analog and digital circuitry. These are the most common ones that I have
seen on ADCs.

The fact that the TI chips in this driver use "vref-supply" doesn't really
make sense in the DT bindings. V_REF is an internal signal in the ADC.
In other words, it's kind of abusing the binding to specify the reference
voltage without actually saying that the chip also has power supplies.

Chips like adc128s052 should really have va-supply for the power supply
connected to the V_A pin that also serves as the reference voltage and
vd-supply for the supply connected to the V_D pin for the digital I/O
supply. And adc121s021 would only have va-supply because there is no
separate V_D pin for a separate I/O supply.

But there are lot's of ADCs already incorrectly using vref-supply like
this, so not sure if it is worth trying to fix them or not. But if we
wanted to fix it for these TI chips, I would suggest to deprecate the
vref-supply and add the actual supplies to the DT bindings and implement
a fallback in the driver to check for vref-supply if the other supplies
are not given so that we don't break existing dtbs.
