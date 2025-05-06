Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D824E2820DE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542869; cv=none; b=cLCOOhm8Widi1Hmw0x6aInrUEaFzrgH02s+ol5JYRdbyGxhblAQaobeSLTJRMpotR6T6yG6TB4w97bd+/qe8udOnaoVgQSM4gRsx+7oAVJEuvMwXQhb13thGvPriSR1LwxoQA9HWhPIfvtScPRrDZebf8Vi2gljTC8qwazgk5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542869; c=relaxed/simple;
	bh=MDJBuL1RzWn4HeHi6fe1HfBITOzG68lYUGph30mhD9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx/JiqRNyp7Rp/Faghu3D0v3KuJ+h6q6dGu2FoNqQ4HXHLfNAIB/wG5BZ/x5jNlxpAh4d7dL+lnNE6HtF37xljNfnO4A5VkTyBJXpPRQ3CjhRIhXqN9LS0R5dmpTzf5p70gCXTKr6dSTsopoNyiwvQrIosH6Boti/b5MiMuecJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lyBTH5As; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lyBTH5As"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0618746bso40689845e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746542866; x=1747147666; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tdn9b7Ao6LumL2AK75QMki8Vnby7kIyvCLDKsENV0Ws=;
        b=lyBTH5AsDIe9AHIQ8aaX3fd8SjspDaDIHrJg6sDLbiWRFAvUGgBqR6pWRi4UTf/Oc5
         Nc/FLBXB8ThrKgVdnHp06RpZuytcUKfmx0+DaHkmeu7BCxvXEhctUUW9esj+ulVorPIl
         j0ad0yGKEXOVw+9fIbK+gJtWKCvUN9mkDAfvUjFOkyqUB+JQ/V1nvOgHlyQ5lgkpFlCJ
         B//ccqWyc5aFppL1pXqtg7hmbJusmybOXubALdpi89B6s9+a5GeKZqY4Vmzl5+IYIiVQ
         NX4aIxFvXPMWsHBcFArapgoXJi3QvXeyOZx9KW+ATnCx97aQ+tRhekFOYusXhebgKvgT
         QWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542866; x=1747147666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tdn9b7Ao6LumL2AK75QMki8Vnby7kIyvCLDKsENV0Ws=;
        b=P6BYptlwh4Fw97gMDb0+xMojGRZTiRRYrmwas3drqGhF1VN9zG+MMNdOdeK6Nfmc/j
         K7VyNwxc6daqB2dzskAcBGaSrUOxfe5uOyoG3OSOqiqHU7hE45qQPMGVfgbZz3CwtVc8
         wLetKtdJaVDi9QUhSUR3V2p4u9GL5KfWObsID7xp8qKgjzA+0f39AvS4FoYTD3YfpMM0
         YESzh/IEE3EfR2lkj3tsb2nrvYZrdOCr85dqblbzAveg9zgiBk1RNmAAruPzv5Q5GxVY
         0XAgLveOiI+QRnNsI0EigMKL9wBGNLJYl2tUyzo27BoyRNEiQH09ZYiWgR9WTn/W6XzL
         T4iA==
X-Forwarded-Encrypted: i=1; AJvYcCUzYZ56KrGe/UYgXNzgW8WbPul2CDwShWGYTphtpGGiil+7aJ0gj0t2jNRlChGNpOephuTIodAjyoiiSNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz86VT9pFNOCf6tjXegZCCcXPQZIr2wWz+kZsIYLdhdtlZTQJ3Z
	ZV8A9U+0N6E1STdgnoxLSMT65XPuwNwFVwutLOTHgIwok9rijOEh9HvX//U0nFk=
X-Gm-Gg: ASbGnctlmBvz+WHb4/GsdQxqYofiFWdvPlOJq981BHTACHdYOUO+cu9trB1mLzs4V7v
	rxsbIo+N39qpe/h5Vb+vq6TiajmA6MuBYzk1UVc9ovnV1r5wLn5e6jY7DyxIpIp43eVm/KUB6iw
	QKjGV7X423mBl3ACHAJhvRtjQKNvsRG3ubRXfqpPnvghlIsgpO66k7rwvSlF8T4W8NBE8tt64tV
	ARtqtKx5+0PPJFxaOqWLr58LFlgnNdw0UUEWFRpi/T4hsF4d0QgMX8R9ZudEAsj6VxlmaOsTBQd
	MgOQPQnjT2T88MABc4NYNQX5uJBbKbHc7lpQbu8AP9xY7df5mOXBy3SIXeqfk7HYepV1yiyWdXf
	tDh5pRo4=
X-Google-Smtp-Source: AGHT+IGWnyz90KvTmiIQWpZLqETqxFIeIRkLJUcNIerHzLwaG535iH8yJPYvWsNSlo1qXQYSnksCtw==
X-Received: by 2002:a05:600c:34c7:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-441c491fcb6mr89623205e9.22.1746542865994;
        Tue, 06 May 2025 07:47:45 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28045sm216060085e9.35.2025.05.06.07.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 07:47:45 -0700 (PDT)
Date: Tue, 6 May 2025 16:46:35 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] iio: adc: ad7606: add offset and phase
 calibration support
Message-ID: <wvflf3rmqaonm6gt45gqtxndprkqbhgvce5z7c4z7c7jgdg4tm@kofkvcbvnaav>
References: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
 <20250502-wip-bl-ad7606-calibration-v2-3-174bd0af081b@baylibre.com>
 <aBTLBvw_88hQBbns@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBTLBvw_88hQBbns@smile.fi.intel.com>

On 02.05.2025 16:39, Andy Shevchenko wrote:
> On Fri, May 02, 2025 at 03:27:00PM +0200, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Add support for offset and phase calibration, only for
> > devices that support software mode, that are:
> > 
> > ad7606b
> > ad7606c-16
> > ad7606c-18
> 
> ...
> 
> > +static int ad7606_get_calib_offset(struct ad7606_state *st, int ch, int *val)
> > +{
> > +	int ret;
> > +
> > +	ret = st->bops->reg_read(st, AD7606_CALIB_OFFSET(ch));
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*val = st->chip_info->calib_offset_avail[0] +
> > +		ret * st->chip_info->calib_offset_avail[1];
> 
> Something wrong with the indentation.

Can eventually adjust to:

	*val = st->chip_info->calib_offset_avail[0] + ret *
		st->chip_info->calib_offset_avail[1];

this is genrelly ok.

> 
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int ad7606_set_calib_offset(struct ad7606_state *st, int ch, int val)
> > +{
> > +	int start_val, step_val, stop_val;
> 
> All need to be signed?
> 

would keep them all as int, to avoid different type comparison later. 


> > +	start_val = st->chip_info->calib_offset_avail[0];
> > +	step_val = st->chip_info->calib_offset_avail[1];
> > +	stop_val = st->chip_info->calib_offset_avail[2];
> > +
> > +	if (val < start_val || val > stop_val)
> > +		return -EINVAL;
> > +
> > +	val -= start_val;
> > +	val /= step_val;
> > +
> > +	return st->bops->reg_write(st, AD7606_CALIB_OFFSET(ch), val);
> > +}
> 
> ...
> 
> > +static int ad7606_set_calib_phase(struct ad7606_state *st, int ch, int val,
> > +				  int val2)
> > +{
> > +	int wreg, start_ns, step_ns, stop_ns;
> 
> Ditto.
>
here too, val and val2 comes in as int, and subsequent operations
are int, so would stay as int.
 
> > +	if (val != 0)
> > +		return -EINVAL;
> > +
> > +	start_ns = st->chip_info->calib_phase_avail[0][1];
> > +	step_ns = st->chip_info->calib_phase_avail[1][1];
> > +	stop_ns = st->chip_info->calib_phase_avail[2][1];
> > +
> > +	/*
> > +	 * ad7606b: phase dielay from 0 to 318.75 μs in steps of 1.25 μs.
> > +	 * ad7606c-16/18: phase delay from 0 µs to 255 µs in steps of 1 µs.
> > +	 */
> > +	if (val2 < start_ns || val2 > stop_ns)
> > +			return -EINVAL;
> 
> Wrong indentation. Please fix in all places where it happens.
> 
rechecked better now, tabs in this place was wrong. Fixed, thanks.

> > +	wreg = val2 / step_ns;
> > +
> > +	return st->bops->reg_write(st, AD7606_CALIB_PHASE(ch), wreg);
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
regards,
angelo
