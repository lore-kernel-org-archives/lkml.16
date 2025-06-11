Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9F4A0F;
	Wed, 11 Jun 2025 02:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608402; cv=none; b=CHj5kQI/SGxsTDZeJLKiVL4PoT2N5MkvzAHdKLZXIz9DCXTcFjWvybGO3ay4mrmRxXldAIzOPcWc9z0GyRagE9yadpmrv5YcsBucwxqH7gMCukbZy90PB7a7qU89TOKvTIbutoXFyTCVc9wOz2y05+KLh58OzqQHhyo9tzYGyC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608402; c=relaxed/simple;
	bh=uV7LB5me5Ipfl0vRIQU42uYhgDD+Orq+kiYw389Ufsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLINq3WuKj7QMZGD3IMCgnaqUmA3uKzW/lOayg6ULUJ3azLBJu37DfDiGpV7BGclxiIVroMr53LYbQDiE9Db+KX4xdruicvGZg++LeJskUd2JyLnCXUL27AwsLmXe3/kkoJ4V5ZsunO/A8ZS6d2BW0d5GvAnWxRRtT1Tt/maAyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kte6d/wZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kte6d/wZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B40C4CEED;
	Wed, 11 Jun 2025 02:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749608402;
	bh=uV7LB5me5Ipfl0vRIQU42uYhgDD+Orq+kiYw389Ufsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kte6d/wZ35xg7tLBmqdrbep/LadAF33nuWzZ3hNVZxuk8dSI5kELrdgyx4Bsc5+PD
	 MLQ2YQj9pNXsnjP2PSgHijD344hTDotNKDTrVbfymkrfYEqRoCFoJHvFhZ8p7WEamv
	 iE2dy308nODevXQIc4dtLixAcopdhzfetPOEimpYMk8AYEGx0ovrS5vYtdBUJGaZKo
	 kxEccz4aVOu0omcUja7q4HzVpSyLaKoCIIaoN977XE++wRD5bSwwkeDjf3x54muD6u
	 AXEOjcxGjd4Xj4JuMQL73on1hjFGhkj4RgHZxqyX3ej1AA9IXJaqTvSvvQVKiI0OCe
	 21vCoGGk2zhsQ==
Date: Wed, 11 Jun 2025 02:19:58 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tomasz Michalec <tmichalec@google.com>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Konrad Adamczyk <konrada@google.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	chromeos-krk-upstreaming@google.com
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Defer probe on missing
 EC parent
Message-ID: <aEjnznB6dKqT5DYO@google.com>
References: <20250610153748.1858519-1-tmichalec@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610153748.1858519-1-tmichalec@google.com>

On Tue, Jun 10, 2025 at 05:37:47PM +0200, Tomasz Michalec wrote:
> If cros_typec_probe is called before EC device is registered,
> cros_typec_probe will fail. It may happen when cros-ec-typec.ko is
> loaded before EC bus layer module (e.g. cros_ec_lpcs.ko,
> cros_ec_spi.ko).
> 
> Return -EPROBE_DEFER when cros_typec_probe doesn't get EC device, so
> the probe function can be called again after EC device is registered.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_typec: Defer probe on missing EC parent
      commit: 8866f4e557eba43e991f99711515217a95f62d2e

Thanks!
