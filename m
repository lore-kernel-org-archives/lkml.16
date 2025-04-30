Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A8E20CCE3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003428; cv=none; b=rl9+wtoiBif0h7Xktdcd77hVQOfY2wpWI7uW1sF0baEGRxkSfT9+v7S07nak+pEUz8NbEooomufE6B2oTiPi1YExvEQEYwukbMhjc2Maqwp2xGf8pAANPb98jibfgTeijtxQz5+YFyL/k2gGodUWhCdVtxJ0CSfDMnB8dyFjAoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003428; c=relaxed/simple;
	bh=HmpObSFeO5UPNf7n0OOoutsgQy3EA21CQ+IzvXSYVJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kku5YMgMccjK5Vk8CEDfdWqEUsYLjxaHPxnrmd8rjeXo6QHzWN4nFlWqnVJ6RdO9pebviWWnDkfkD1T9j46kYDQWYS9MTNz1zXqVcUob4ebK6KXB7g3x9SpIvR0AnEu0hgTPlEpJTzz1H4/bikLrtve/QloWnNE1ZqFjBBD6+No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLxLhbJE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLxLhbJE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso47924135e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746003425; x=1746608225; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vsX5iZ0Xf1hk18vldFSG+c7ZzQ/lrYQmQz9RDMkRt9Q=;
        b=RLxLhbJEZ0nNjOXZiR/RtFUSUeWHthN+OVlaqc02ZmkJEkVDFO/ZmHVBIcmjkKiSKj
         VpoFASn+Rl7wM+7TRyylj/nmNTa1jEx6cgxUb1H4M3ycKbfDRtK9DTj/Use9mGaelDg5
         VbOUBpoG6cArILinOhOouXbMuzx9lUtFGrM/keskoqOtx1TZUPOrnl+AroB9q7SA0hMq
         F98T9RWaFhnDKQ1lDyrEQe9Nq7Davc4qOBOJTweHFDGX8XedkFYh08YB6MARuvhCQwk+
         8YeSmn/+HIlqiT18fJqgU+uzzn2+VA5CfvU9axIl7KyMgE9BmHDgbo1Oqnb7EvPRzVfX
         aUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746003425; x=1746608225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsX5iZ0Xf1hk18vldFSG+c7ZzQ/lrYQmQz9RDMkRt9Q=;
        b=q4pcmqPZsA5miKc+vlLt/ng5GNSIqhtOAJiHznxcGyRjSjrDe6UAixHAvef90XMfRw
         nWY6gGCdtPfZDt4y5X6gwZlkIEMksu1SMmtxIbLQWPesOoMg9k7PhPPyhk4dna0wAtUR
         6xaADrCChtasb2jzDiZXR55Mv5xNXZ/VbNvoxLHhSStxe/onSIv+6w3i1y9gBqela/WZ
         aZG8BmYZS/oAd/NNXI8ZBFcOEr+6sbMcs0WmRpZxt7ULK5rX67ClrS1lwnbz1g9gQeIO
         Tpm7WcU6UCByvDt7zn9pdQ8A/BpWmr68k/KaGiAtXLzWKL0x9sUHkRBeVd+63v8ivzOh
         jcJg==
X-Forwarded-Encrypted: i=1; AJvYcCW947Ota/+x8uPsHMHiSgfBgPhtf4lZ1K6wUCU6mKhMb0QEVYAKKKpPATMyA7jGbLFO4iImOuhuObQqLCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyehYWaVQ9t63ExTT3rkZ/aN/EkrEvPedE3WB2KTYl/PKau6wYr
	njBGb9SWaTwDZvRFkv4gAm0JeDRmvoQvDsfODw23PT9OBhJH8V4jfBcqeYeIcGI=
X-Gm-Gg: ASbGncu0bIdTC7P6eT44xu9pRykATNdnt85fGgRrIpOysvcYE2gAAy5s/UBdNToACOU
	QMzbNdvPbokfx8wBxHVxKSglyQJcUrIkwRr5Q2FXpVCaHiGvGoPnwrswbZRg5ZJlBzhCdHfK3jA
	bNuxZSwg6iH25Ce6qMxABijL50Pg1Y3gQGvCLUC0eOeRAJUh8m3KtVZ9PyMxzkqMfusxiOG7YTS
	9JmTSYPUdI9BzcIld9JxJdd7iW4jSkqW3e07HlvLeoRsnpmrJBoI/0tk2uArul1+dZdI3KHJfps
	VZCs9JGxzAvknKTxYVd2oxQ/HD8ZQvIoCocmVEU3p4chORMLrpdA5JycJeAuQ9FpMh2ycdFJXvG
	pvxU=
X-Google-Smtp-Source: AGHT+IFBjJKadcBgfxEfVMoyFdea06C48IeyCLSwft1QGBmLuLkmOrJI0pimONPp/u0K6tmc6/97nw==
X-Received: by 2002:a5d:584f:0:b0:3a0:6ac1:93a1 with SMTP id ffacd0b85a97d-3a08f7997f9mr2181857f8f.7.1746003424853;
        Wed, 30 Apr 2025 01:57:04 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5225sm16654910f8f.33.2025.04.30.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:57:04 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:57:02 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	Guenter Roeck <groeck@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v9 2/7] reboot: hw_protection_trigger: use standardized
 numeric shutdown/reboot reasons instead of strings
Message-ID: <aBHl3n0yWF53nmKY@mai.linaro.org>
References: <20250422085717.2605520-1-o.rempel@pengutronix.de>
 <20250422085717.2605520-3-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422085717.2605520-3-o.rempel@pengutronix.de>

On Tue, Apr 22, 2025 at 10:57:12AM +0200, Oleksij Rempel wrote:
> Prepares the kernel for the Power State Change Reason (PSCR) recorder,
> which will store shutdown and reboot reasons in persistent storage.
> 
> Instead of using string-based reason descriptions, which are often too
> large to fit within limited storage spaces (e.g., RTC clocks with only 8
> bits of battery-backed storage), we introduce `enum psc_reason`. This
> enumerates predefined reasons for power state changes, making it
> efficient to store and retrieve shutdown causes.
> 
> Key changes:
> - Introduced `enum psc_reason`, defining structured reasons for power state
>   changes.
> - Replaced string-based shutdown reasons with `psc_reason` identifiers.
> - Implemented `get_psc_reason()` and `set_psc_reason()` for tracking the
>   last shutdown cause.
> - Added `psc_reason_to_str()` to map enum values to human-readable strings.
> - Updated `hw_protection_trigger()` to use `psc_reason` instead of string
>   parameters.
> - Updated all consumers of `hw_protection_trigger()` to pass an appropriate
>   `psc_reason` value instead of a string.
> - All structured logs now go through a single `pr_emerg()` in
>   `__hw_protection_trigger()`, providing consistent output:
>     HARDWARE PROTECTION <action>: <reason-code> (<reason-string>)
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thanks!

[ ... ]


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
