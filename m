Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46E1F09AB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625678; cv=none; b=TogNdpdRU+FshD/yuuZmaC0cSYFBCoc84A+GD5/F9LP+oqkuZlPOXCurOxMljmF2EHMuGBHILRaNu5KRYJOykkeqbLoD9is37bKDgJLTxxM+gNSeRAQXImkrHlPOhPaLIkZSqLSUM7VRC1I8hOaqJ7nTsPMwrhH6gC+YgD4AzPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625678; c=relaxed/simple;
	bh=iL+v0YyDgRKPSv4xdqmcB4SFH3CEqcRuTZ8liW/+9JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQYbSpnrX8GzgI2djDiAMOfMt6aE7x7GxCZ34xNRtDg95dJ79Br3gWVr/ZBeLQC0NgC0yjo6ctDRAX07HdgKayYhU5ye8Q4ov1+kv+/bLZLwX+APan92Krs+8PQTtDeB7VwS31yxW5uoHBqBh5umsb2lVSBSuM3odYJz7nGNKL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JXfaWFVC; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JXfaWFVC"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2c769da02b0so77281fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743625674; x=1744230474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bb3uLjaaplMI5rmcO3yUoLQoxyYMzts0THKqJNK384g=;
        b=JXfaWFVCyxteJrsHYCy/JNknRQPYh9ea+sHbUBl01dPwvT2CmoCMOujmRidZJP04Mg
         8RggPW7O/0Sc3f8XefW6u5TCBdJg3+jE+fiwqt0uNVAls8EmsOgRrqBOK6AwxKI0nYRM
         WHkB+6koiO7ZtvFKRfRRJMrm2CpzNsRdHC0qByWDxQWhwvMV5De1NjicLkn8dG3FYXKl
         sbNxXnRCaLRjQt4H0YJTETKJOdbIoKNh5u+zJf7A1aKbVPp+dgMghRlZ/32eGFZS/CGU
         65fgwKezAq+8D7oEhqnaJeEfq1Vv7WYpCbKtP42WQ0pchORPCd1FZDuqnIi6bJ+owkX2
         6pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743625674; x=1744230474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bb3uLjaaplMI5rmcO3yUoLQoxyYMzts0THKqJNK384g=;
        b=xQ36h1mz5NqKv28cUTXEthZM8e6LU23Gr+ASWt3dHBOa6B2HHpAZfNX8TJB2tPzGiZ
         AlmGQx1qKhgLrTrNW2ykvKfubNVTrUcThkONaEe9fV/rx9c7FtDCLgTZFrN23OpaH+ww
         wij+O64XcCHbGj7S4YVTxfz6zA+2W2Nm3ourLDdd604cp3gm5dBj5LxAwihHKUEFf0tQ
         JsmnA/zRmuzNzM3mX8i+N/jRWuiY9+XJlIm9sWR94qeu2Sx+v8WEciNiVnDWz8g0h53z
         3H+8VSuTQB2LROoneADrphZSdwiif1QSrBXzFyy0EyVvCCnRethgILJbDuRwySxq7MPd
         wkiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYuvX11BzXOP1aoP4j5mhXhfPpADpGqc8uGvqAOQ85CTzs2t25aa+8zU8Rn6C/SWeb++Rv5idmgoA98oE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnRTAuysIOPrHqM0BHgZV/Vb+4J9sgA4R1ogSC9Yu2ZQOYAUpv
	k8aJ/4bWZbW5VXvWGZzn3yzM7waOHUfDSP2vHBdxzN4txkTe138rtaQLLnfOMZY=
X-Gm-Gg: ASbGnctjSNHgLa0VqXIQKjmkVZACGWOPf9h7b1gQu5FZ4wJ5azu8Bwmctu0PvkiF9ck
	oC1snO2voeTl77jV8QRVANNXjyFYJL2xS0qgDrVb9A4hgWVpYTyEB1t/T/r3exUARVL2YaORfUs
	6IuS8wbHGh5hx9YzWbzEv/wczKn5EArpcNW9TFv3auyr59yIquXb9XnOi6MjNmlRfpi3KMOHGcN
	ZIkNUZd0hHEf35IN8WCMrW2WCtgRRUKOxy79AUKjvtLbLV2sT2cH7/M7R24oi/UYoQbOiKiZ9wU
	i6NYdSdw0rUZTA9nFn4IufXu5XJIhM/4Z9ooBp2okzaf3S5/iklerY0oP/UTfhhmZVbq1a6ts8k
	Hll1fAQ==
X-Google-Smtp-Source: AGHT+IEt8RP1WvtnuTRTfpnfybVllpyHk6xGLunHxwe8XiEec7EztheZvoJ3VjB2D1Z7tNHFkLyDmQ==
X-Received: by 2002:a05:6870:e0d2:b0:29e:4d0e:a2b6 with SMTP id 586e51a60fabf-2cbcf4a1e6fmr11102767fac.10.1743625674383;
        Wed, 02 Apr 2025 13:27:54 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a4a3984sm2976967fac.17.2025.04.02.13.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 13:27:52 -0700 (PDT)
Message-ID: <20e8538f-7a73-42a5-87b1-0c04b54375c6@baylibre.com>
Date: Wed, 2 Apr 2025 15:27:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: ABI: add oversampling frequency in
 sysfs-bus-iio
To: Jorge Marques <gastmaier@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael.Hennerich@analog.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250321-abi-oversampling-events-frequency-v1-0-794c1ab2f079@analog.com>
 <20250321-abi-oversampling-events-frequency-v1-2-794c1ab2f079@analog.com>
 <20250330181320.0ec4351c@jic23-huawei>
 <3ad6f137-5f67-4448-b0c9-2e760bd935a7@baylibre.com>
 <20250330185353.150fc33a@jic23-huawei>
 <hf5dwxs62oof3gom43c6rkdsq3gky6eplxej627t46ktt5blfr@kpmjpxku4inc>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <hf5dwxs62oof3gom43c6rkdsq3gky6eplxej627t46ktt5blfr@kpmjpxku4inc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/25 8:47 AM, Jorge Marques wrote:
> On Sun, Mar 30, 2025 at 06:53:53PM +0100, Jonathan Cameron wrote:
>> On Sun, 30 Mar 2025 12:34:39 -0500
>> David Lechner <dlechner@baylibre.com> wrote:
>>
>>> On 3/30/25 12:13 PM, Jonathan Cameron wrote:
>>>> On Fri, 21 Mar 2025 15:50:02 +0100
>>>> Jorge Marques <jorge.marques@analog.com> wrote:

Once you dig into it, the current situation is even more complicated than
I expected. :-o

This reply has ended up being mostly a brain dump of my observations. I hope
it isn't too confusing. Consider this more of a brainstorm on a future
documentation page on sampling rates rather than commenting on what to do
on this particular patch. :-)

---

To make sure we are clear, I think we need to define some precise terminology,
especially with regard to "sample rate" since that can be used to mean a
lot of different things.

There is the "IIO sample rate" (could also call it the "effective sample rate")
that is the rate that we push one complete set of data to an IIO buffer. In
many cases, this would be the frequency of the hrtimer trigger that is configured
as the trigger for the iio:deviceX.

On the other end of the spectrum, we have the "conversion rate" which is the
rate that individual ADC conversions can happen.

What I had not seen before, but now I see in existing drivers, is that these
may actually be completely independent. In other words, the hrtimer trigger
only triggers reading the most recent set of conversions and conversions are
driven by a completely separate trigger, generally some sort of clock in the
ADC itself.

So I think we should expand the diagrams below to show more layers for the
completely general case.

>>>>   
>>>>> Some devices have an internal clock used to space out the conversion
>>>>> trigger for the oversampling filter,
>>>>> Consider an ADC with conversion and data ready pins topology:
>>>>>
>>>>>   Sampling trigger |       |       |       |       |
>>>>>   ADC conversion   ++++    ++++    ++++    ++++    ++++
>>>>>   ADC data ready      *       *       *       *       *
>>>>>

For terminology, let's call this "burst mode" oversampling (maybe also
referred to as "triggered mode" in some data sheets).

>>>>> With the oversampling frequency, conversions can be evenly space between
>>>>> the sampling edge:  
>>>>
>>>> I'm not sure what this second example is providing.  Are you suggesting
>>>> that if we don't provide oversampling frequency we should assume this
>>>> pattern?  i.e. it is the default?
>>>>   
> 
> The default is to do the n-conversions sequentially (n*t_conv),
> "left-aligned" as in the diagram above.
> The main application for oversampling is to average out the noise over a wider
> bandwidth.
> 
> I looked into some of the drivers with oversampling and the supported devices
> datasheets:
> 
> * ADS1298: Single field for sampling rate and oversampling,
>            I assume the values are the maximum values that the
> 	   oversampling time does not exceed the sampling period.
> * RTQ6056: Field for oversampling and conversion time,
>            maximum sampling period is roughly n*t_ovr.
> * MCP3561: Field for oversampling and conversion time.
>            maximum sampling period is roughly n*t_ovr.
> * AD7380:  Field for oversampling and fixed conversion time,
>            3 MSPS for the AD7380 and 4 MSPS for AD7381,
>            maximum sampling period is n*t_ovr, e.g. f_samp=(6/4MSPS).
> 
> None will or claim to stretch over the sampling period the oversampling
> conversions, but rather, do the n-conversions at oversampling rate,
> providing the conversion as soon as it is ready and idling until the
> next edge of the sampling frequency.
> 
>>>>>
>>>>>   Sampling trigger |       |       |       |       |
>>>>>   ADC conversion   + + + + + + + + + + + + + + + + + + + +
>>>>>   ADC data ready         *       *       *       *       *
>>>>> 

And let's call this one "continuous mode".

But as we will see, both of these are a bit ambiguous in their current
form. The complete picture is a bit more nuanced.

---

Let's take the RTQ6056 case (since I actually looked at that one before
as inspiration for developing another driver).

The chip itself is programmable and can operate in either a burst/triggered
mode or in a continuous mode. However, the way the IIO driver is implemented,
it is configured in continuous mode to trigger ADC conversions. But uses an
independent IIO trigger that triggers reading sample data. So from the point of
view of the data in a buffered read, it looks like burst mode. But the value
of the sampling_frequency attribute (the ADC device attribute, not the hrtimer
trigger attribute) is for the hardware continuous mode.

Hardware:
sampling_frequency   |       |       |       |       |
ADC conversion       + + + + + + + + + + + + + + + + + + + +
ADC data ready             *       *       *       *       *
sample number              S0      S1      S2      S3      S4

IIO:
hrtimer frequency               |                     |
I2C read                         *                     *
push to buffer                   S0                    S3

The IIO (hrtimer) trigger only reads the most recently available data, it
doesn't trigger any conversion. The clocks are asynchronous.

I think adding an oversampling_frequency attribute to this driver could make
it easier to used/understand since oversampling_frequency would be exactly
the "conversion rate". Compared to the current situation where the "conversion
rate" is the sampling_frequency / oversampling_ratio.

It is also interesting to consider that if someone decided to add SPI offload
support to this driver, then there would be the possibility of using burst/
trigggered mode or continuous mode and might want to support both even. In
fact this is exactly the possibility we have with ad7606 that I mentioned in
a previous reply. So we might even need an oversampling_mode attribute to allow
selecting one or the other. But that is something to save for a ad7606 patch
series.

---

Another driver probably worth considering is ad4030. In this one, there is no
internal clock to drive conversions. So, for oversampling, the sample rate is
just "as fast as possible" (currently bit-banging a GPIO). So it doesn't actually
have an oversampling frequency.

If someone ever decided to hook it up to some hardware that could actually
trigger a finite number of pulses at a specific rate, then this new attribute
for oversampling_frequency would become useful. For this particular driver,
the presence or absence of an oversampling_frequency attribute would have
a meaning, but I don't think this generalizes to other ADCs.

---

AD4695 is an interesting case to consider as well. When used without SPI offload
support, we actually don't allow oversampling currently. If we did though, it
be similar to the ad4030 in that we could either make it "as fast as possible"
by banging a GPIO or the CS line depending on how the chip was wired up. Or it
could use some specialized hardware to generate a pulse train to actually get
a known conversion rate.

For now though, oversampling is only implemented when using a SPI offload.
It works like this:

Channel		1   2       3 1   2       3 1   2       3
OSR		2   4       1 2   4       1 2   4       1
Trigger		| | | | | | | | | | | | | | | | | | | | |
ADC Conversion	+ + + + + + + + + + + + + + + + + + + + +
ADC data ready	   *       * *   *       * *   *       * *
IIO sample                   S0            S1            S2

In this case, there isn't a "sample" trigger that triggers a burst of
samples. Rather, there is only a "conversion" trigger that triggers
individual conversion. In other words, we would call this "continuous mode".
And it also shows that some chips allow individual channels to have
different oversampling ratios.

In this case, it would be nice to have an oversampling_frequency
attribute as well because it would exactly correspond to the conversion
rate. Currently each channel has a sampling_frequency attribute that
is oversampling_frequency / oversampling_ratio (same as RTQ6056).

---

So my conclusion here is that the new proposed oversampling_frequency
attribute has nothing to do with "burst mode" or "continuous mode" it
has the same meaning in both cases. It is effectively the rate for
individual ADC conversions.


