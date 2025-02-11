Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205F1E3DF7;
	Tue, 11 Feb 2025 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259805; cv=none; b=Q13f9b+sXbJjkzsnUwreSZRmZMrfA/lasKELfJ6iF9qowWN8Q55QXVjKNu9dHRrAvIaUqlyrxITbqaVy65OIeR12cL7BO1CFKd7z2t+Kvwz3n6/Dao+fQgYdx9yjqDqaXlgVMS5dsy9eBlp0S9wsuO+j6CEQrEP35l1B/SplQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259805; c=relaxed/simple;
	bh=oRRZwA+3nRz5ZsShMWR1n+ks6euaa0KdqP8VlEr9Rms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RlfvTteQQQ3+hO+Wa0rwGL+6ZJSSABQBdyko4dHMuivDb4j61jdpCcqMmQbnpIFfKXTVlQvvw4lRd0xrHeVg+NksU6sLPNzIQiL4kCFhu2lszrneelfTnjDxatrOWpsEYCguFbV0pA+b/gfi/mIhiv73XvhOcqT8htYvQTTcAXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJBsNRDg; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJBsNRDg"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f9c6d147edso26429457b3.3;
        Mon, 10 Feb 2025 23:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739259803; x=1739864603; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BA3Xjm98xGYQDaLVMIndMYAC/SUzS8KFdvaM9sU/BE=;
        b=jJBsNRDgB/jiTRHdILW0gprbV+PyyJoDTRhOIZ8ftPHruZ3ymImDHney8gXuO9+3H+
         VrAsNO9WdLRE3uxadiPSo0B5HFG0TM1dMi+HOnXRIi2d1D+dSr0wEcN1CsnNKOdXJvya
         JNKl0hYq/cIudTfMiFiHGA8TrlU2ltxbDVxjNnxYXP2HxnlMk83U2YA7LtArydsquitk
         dDF/FVp9I5m2Dknupu2aWQF/fBktd8WsnMDW2x9385yuJjUbTrPzSsLqaOyyzOilygU+
         IdBgQ3deirMCt+bRMFaSnS2wrG+WjRD+ze9502XP3n6e1Ehuhvr9h3RKrJLpTC3GK9GF
         xo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739259803; x=1739864603;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2BA3Xjm98xGYQDaLVMIndMYAC/SUzS8KFdvaM9sU/BE=;
        b=hz9swnu67PY2AKEg57MBbARWG780H0hnmTfzGiLqEI9HLKi7q7M8RHX+cN8d1Udo7+
         pgqmhmHaVMp2v1vL3yNh9cIJ+FClmmcd+XUVgE3V4c9Rl/0eDh7AjmAcJkpAU9On4tGO
         ORtIZgsv1snvtcAsDfU8b+2QA2knyw4gJVDVKBVTjlLknTr5vmTrnvQzsbytmkOJj9t1
         52q6i94dSxBgZAMKqTmPXkWAVidGdP1Aj7ZkmhgtlmbIvx3eyBPxCq8r8U3APIECY/+/
         HbwE2XGGLIwipq0LmOWe17qLxAFjlnscUn9rjnmv79XF2wpMfKxz2G/auS8vVpCQf7xg
         ktJw==
X-Forwarded-Encrypted: i=1; AJvYcCUYmbqayqd7CRKuacaSMFvmGXb1I29Zyaym/9qPscbW2M+QdKVTUgahHiHjg/ToByYTp85KhS+mohQ=@vger.kernel.org, AJvYcCVSMCF/ErNlrR6Od5Pc5CbgnwLYAf4+sUehJtL0SnDTIapj5LgSSNNa723BN4DDxoJWXOERrxslmcrgKWmPGcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy9yswTvXS5h1pZCO3kpTfZTpExluPGbwDIJoPuy84ZQZqoK20
	EF/EFv8kqkSBdtBowegf47VvQBkP/iKSLRkwnvcttduCEK17LyM/
X-Gm-Gg: ASbGnct+YOjZY17GXpMPABHzWwSL06bKeWpcIosEm4hEjhaKhwsFbYSmj/+mWhVU5eK
	jEy5zsHwqosPbtHphsg+oyJRkPgZyKHdlPuPokF9XuVlYJ6Fvz8Vbxwn0H2EjoolIth9DJVJh8I
	PuC336bsWQ95u+mQcJHtmUtbfZIYq+i9KeaPLxq+y91VaUxhn/cztTo0NgR6fMxYiuUhFL9VfDY
	je6jd6rvwCHR3yaKdcnmjQ/fGg7WEhjiR5uC5PUT6E/6n5zpaIcoGnH4HSv5Agc4wa1yyO2zLMp
	nn20AUo=
X-Google-Smtp-Source: AGHT+IG/xWweHDauxG5LybBO3423pM5lSqbvUWmC+FSu0+H9dDcCalf35Rpz3rGUt9VQuNSJNmH2IQ==
X-Received: by 2002:a05:690c:6a0f:b0:6f9:aecf:ab34 with SMTP id 00721157ae682-6f9b2a0c8c1mr151629287b3.38.1739259803321;
        Mon, 10 Feb 2025 23:43:23 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fceff51sm20394467b3.12.2025.02.10.23.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 02:43:20 -0500
Message-Id: <D7PG55S1KG10.27S2ZIBE1TCUC@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexander Lobakin" <aleksander.lobakin@intel.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Lukas Wunner" <lukas@wunner.de>, "Mark Brown"
 <broonie@kernel.org>, =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 "Robin Murphy" <robin.murphy@arm.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Zijun Hu" <quic_zijuhu@quicinc.com>,
 <linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a
 simple device/bus is needed
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OYKAYV14AZ.2D8Q4XP557FSR@gmail.com>
 <2025021111-landowner-gleaming-5971@gregkh>
 <2025021113-hundredth-pandemic-4529@gregkh>
In-Reply-To: <2025021113-hundredth-pandemic-4529@gregkh>

On Tue Feb 11, 2025 at 2:33 AM -05, Greg Kroah-Hartman wrote:
> On Tue, Feb 11, 2025 at 08:27:26AM +0100, Greg Kroah-Hartman wrote:
>> On Mon, Feb 10, 2025 at 12:56:46PM -0500, Kurt Borja wrote:
>> I'll work on adding "if probe failed, don't let the device be created"
>> logic as it's a simple change, BUT it is a functionally different change
>> from what the current api that this code is replacing is doing (i.e. the
>> current platform device creation code does this today and no one has
>> ever hit this in their use of it in the past few decades.)
>
> How about something as simple as this change, does that provide what you
> are thinking about here?  Only compile tested, not runtime tested at
> all:

Yes, LGTM. However dev->driver is set to NULL if the probe fails so
wouldn't

	if (!dev->driver)

do the job?

I understand your point about groups. This of course solves it, although
isn't there a small windows between device_add() and device_destroy() in
the failed probe path, in which a show/store/visibility method could
dereference a NULL drvdata?

--=20
 ~ Kurt

>
>
> diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> index 531e9d789ee0..e2de0697c0e3 100644
> --- a/drivers/base/faux.c
> +++ b/drivers/base/faux.c
> @@ -25,6 +25,7 @@
>  struct faux_object {
>  	struct faux_device faux_dev;
>  	const struct faux_device_ops *faux_ops;
> +	bool probe_was_successful;
>  };
>  #define to_faux_object(dev) container_of_const(dev, struct faux_object, =
faux_dev.dev)
> =20
> @@ -48,6 +49,9 @@ static int faux_probe(struct device *dev)
>  	if (faux_ops && faux_ops->probe)
>  		ret =3D faux_ops->probe(faux_dev);
> =20
> +	if (!ret)
> +		faux_obj->probe_was_successful =3D true;
> +
>  	return ret;
>  }
> =20
> @@ -147,6 +151,15 @@ struct faux_device *faux_device_create_with_groups(c=
onst char *name,
>  		return NULL;
>  	}
> =20
> +	/*
> +	 * The probe callback will set probe_was_successful if it
> +	 * succeeded, if not, then we need to tear things down here
> +	 */
> +	if (!faux_obj->probe_was_successful) {
> +		faux_device_destroy(faux_dev);
> +		return NULL;
> +	}
> +
>  	return faux_dev;
>  }
>  EXPORT_SYMBOL_GPL(faux_device_create_with_groups);

