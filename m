Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06931A60;
	Mon, 16 Jun 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112171; cv=none; b=T7mVU2diSpMkDBNSI1uzHH55jB9kIT1TT4SzUm1DMxZ+CaEiHeImPRGxI+tujfmnnNWVVBU4ui3Dl+XVrdrlq+zCxLu/02Fj5QDQBsQzTuWfMzK80QIPNfqvThi6huBqEof58MS7k8UcRgcjJAOiIxWbaO8k/QMSPhA7TNqCV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112171; c=relaxed/simple;
	bh=ijhXuY/+FH+ilubfbP+vAqRx7K+apmTeIDWZZ1AOA+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an/TOh+DR0ITYx0K9Lprl/t91HqWL7p7yYc/rpmYKWVgCJ8OVpd8XGYjzYmeorTwbg5LW+u1Sh9Wa04vM0FknKGOpl+gnH/wCbDFYplagzVAAzvXCu/e2TXIatxMu1y1UvsYizzUS30twbk9zPi5GqxoFubai+31znRLJGVo50Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrzxTMq0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrzxTMq0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23602481460so46882855ad.0;
        Mon, 16 Jun 2025 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112169; x=1750716969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqzxOBMLH7wnd4MoqI+z4U0qu3t3OgvxHrZ5MX4ejcA=;
        b=FrzxTMq0OLUizzxWOga5VaWD6pCulQNpBi/Rw67YkGZrJazZJGLLbXv6DGfv7HFhPi
         W2/hK2S+YJzlj43TXbOsl6pY/rARswdpFJ+RZInmkHcxcpHqrgOmP6UNmyPbeBos2Wwr
         6sIOes0dVI6B9+23TokBHRn1d7MTxMHfHjUIzvxTcavRx11NxMr3/T00Za81hpmorlze
         0PZGNDlI4Fpe9geNAtf3W2CbcjAgPnQG8wzb/+LwqoMhqGszFZqeSEKyCWF8qgqsMGop
         r++N0x8DxyEmGm34WReYWY5KHn4TNRhZdg3mogRoYxLpFX2Ujhrt6GP32n/bzvqdBCES
         r8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112169; x=1750716969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqzxOBMLH7wnd4MoqI+z4U0qu3t3OgvxHrZ5MX4ejcA=;
        b=Idl0mamEtxdoJmTylBnOkRQahAgQUgS5ewEtPpIXJcNEozseleZiDVu49WDgx7JGd5
         Tdr751gZoAkaB7CzqYdIDTHXY4jHNZxHhfzlFk8h5NhY9PtCgEiEQEqiAdqsO0iveUaC
         +K9OrYAevwdsmdQSO+p9hNZnBn33M5WdezvBV6SjRnuvBiRf7IPdIRfTzr2dSzEqzRdp
         Z4YWqklsWaRGHgqt6R/X5/uFLysEozdZVEqznxOf8/hpscupECSEks6//IZBeyux7HY/
         +PnOvLM8XWsj1W00D6cDLBONlKhIa35uD46LQp0d/oziKsXIt8ffQ9rCOimy0MPu6KOY
         U79Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVAPYKXrNl5mmxRhITf3OsrJX26bQZlLa9vDjNh7CybrspQjb7vcfP7nKGUeJs12e/BxncvfXkryClDhjd@vger.kernel.org, AJvYcCUyZ2yoxzUiOcmbFIF/y1w9fTyUqSHITh1s8O1JZ+HHXHAW6ISX4/5mnYS31PRl9+3Vbcj9fYLCo6VLzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywusps50BgNicjdazvWlgDt73OqZPcZ5GvBO7azh2wnfKdfj6ss
	5eogkf7vp+DiXS1Wqw5gOxXUi6y7vW2VHO1C4AdztKKG1WSVmwo34l6LFqyD6g==
X-Gm-Gg: ASbGnctCXRp/zyMXHFkSnHsOGyrYn5jX7FGYU6jNfpGSuKllVbxoHkeftzi9S7nH+ZX
	4mUTT3t3Dy6IScThKHlZFj/SVA/GaGbJdlnVdnlGtkaO7AQohTueny7n1lHKAyoGt60ivjc+H9b
	MeVFsojnGhn1XBYlxnoSAIOV/8vpohz3VqPACxURmpFE9nwLBwDGTJeRd4T39nY5YncJlNNj83f
	PGPiXZL1tpVwqNarSGsoScSe/4agnultnWCB2EU3E0MFeh3Ldi+gjPbea/NP3FjXqShePupwzY6
	luGm1ZWRM1Cx/bcNuuf4A9Har4YJ5l0llwvngAR3USuiEzhez2IMnHElV7xCFWhQdrIIRKT1Lwd
	08GnIKW/8gg==
X-Google-Smtp-Source: AGHT+IE7D45OxaXOpEnSNmrkvBGVxdNdlxgSulu93jAwXQec/wc9R/9wjbBwJ4aaqqfW5jX8XSaVRg==
X-Received: by 2002:a17:903:320b:b0:236:15b7:62e4 with SMTP id d9443c01a7336-2366b1443c8mr181687065ad.38.1750112168797;
        Mon, 16 Jun 2025 15:16:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639dffsm6286948a12.3.2025.06.16.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:16:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 15:16:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 1/4] hwmon: emc2305: Add support for PWM frequency,
 polarity and output
Message-ID: <d6a0d179-1fce-4b3e-9f3c-3dacf05cc22c@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-2-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-2-florin.leotescu@oss.nxp.com>

On Tue, Jun 03, 2025 at 02:31:22PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Add three new attributes to the driver data structures to support
> configuration of PWM frequency, PWM polarity and PWM output config.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter
