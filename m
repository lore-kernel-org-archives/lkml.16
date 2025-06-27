Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441A294A0A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017874; cv=none; b=MtnZsgBedLo4E60FBIE+oYfNMiXy0iI9Is6xyDmKcPSdWH+CMnz3dHFqstKdnPHqQtVyADC1BOZ6FKQhsWeOemEhJP4WRCXGUP5RZVHMHK+zN0HP2tIQd7j5S78fJlVH+N1emzb4ETexhMq9kBfFtnfdvIvDnuAUVM3mGzU+L+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017874; c=relaxed/simple;
	bh=aWKcXpIWktZltEWw9bV+4dTcFYdfkePr8vQGnsvS0L8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=M3InwbwAywonh4/T2vs0JTSmTxnY6Mkw/lTCXfzosafo3baTlzklzLN7mV1zP2RaZk29hXamqL0YmL3DKfWZzGvX8dCg8m5BrGdd1Zg0OLx8IF05FSgUcynIe3dVcnTCdRvbrmEh2vCX1JgnvGc0LsG7NgHdNRkf8LCUUQKIfC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=b+s3++zS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="b+s3++zS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so6537535a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751017871; x=1751622671; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAKHP6eBszL2hrHuqZ8PH7OxIF1g8NegvI8NrbNa5H4=;
        b=b+s3++zSepQ4S4cYgIbhk7yjxvsm6zEP77GL9A0UtH191upGTtno6/LVyRd7nsOcGX
         jcUx7PmJ752d5E59djEVPIAGTt6+JozAXSRKUqMYpFwTUVH3N7xkACYM481s5BDiWoSj
         aROfGSbvsQOtth9mA/4+VxiAn9QF7oQ++ZFcNbPMeVqr0RIwXajdIAbQxgIYxf5FiEQX
         JMRph+JlXaDwRm9+wWRCkGkMl1qXtXbAWRAUZR5josbCHvK43e1MeZcTBWuea5EmFfjt
         WZB6+sBAJAKx7+qc0xXz/K2IY0Z3CDPz8YpoJh2A59Y+WpE2ugj64uli5JkzbafwO42J
         eYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751017871; x=1751622671;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TAKHP6eBszL2hrHuqZ8PH7OxIF1g8NegvI8NrbNa5H4=;
        b=ctrXk/Dn5h1tG7Odpe9tnZ/4KuUnCuwNXDao6MUn6kxa0TKzxY3mPND86L5FxyWaad
         Pr0qkwxQe23yDOJjbYrNM0Rck9Cc8/LQzWbwcESCdvOWiMZqauA0f5GVeNZMmKrNA+B9
         +Zop4nIFVld7bKQs2VForbGR1dyu4kgTuGJObdR//wDWKeUb3kwfHSRQ/9Juuv5JtGDw
         WZIXZkfFSwIlTPMO38AWl2bk7/+oBZf/B7F1zd2f4B7uJsUzqET6IAOpD7z9szsls51T
         4ReLECntvva9RJouydjDvGYRxSbBQy6FZzU+EeFWwK2UWOoJMPx9nriaI8jBEzPCjPWH
         TfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0bpFPamuGVC4ajGsr0U40mG6TXdRFMRc3kkVB1/GaeTYXaNG3l+YUSYJbveZp66UCz0ne5oNwU+N+7Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/5d2awRt/8g4yZnviuuhh32GG8R+/GCZXliaUUMI01BtB1P8
	vmAjN49ataviTc8+IKTEVDU+3kBl7kRSq0Z5fhUP/Q9OzAHE0x1pH7ZT3Jpldkt3Xr0=
X-Gm-Gg: ASbGncuQVIwaI2KdJve9Tex2CLxI322wA0QWGZQb9EONPBMyix1QsBcoK0MZKxEsrEy
	V+HOuwSjFPR3IdfcbE/GLfa7E/ERY6WV8m+OoFVw2rf+BP/U1K4n024szJDhibub4UOR7k/8T7K
	JjlrxtbXCFjjMyMxu3HZZ5EIBzYgZg0YwR+dC4QIUhgVXDeYpx/k7UZ2uOejEmEXMpUUE3d9F34
	RjB+abAhdBAkylzKsUS3TgIoCduaJFLj6DPLVvlZxtrwxjl0HYbPNnAuNB4yWoo0+b58oDss+Yw
	Bb90jc4uKcCb6xlMorgU7GQWei3PhiKEBhpLCSdAHfD+PI42TbZPQ0VJPVkXRVsDKqJtSyUqgsL
	RRqfDt+ic+xDEq4dgnt9KgdVUy1F+//lz/Cc1Zwk7jw==
X-Google-Smtp-Source: AGHT+IE99Ck1XKmW0mBEtookC0EaO8U9aF4JHALURpPgmU1+B2UobnemydphVmXY2CO9mnSZo3zaVg==
X-Received: by 2002:a17:907:940d:b0:ae0:da61:71fc with SMTP id a640c23a62f3a-ae0da617483mr523043866b.10.1751017870669;
        Fri, 27 Jun 2025 02:51:10 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35417b9d8sm91937666b.184.2025.06.27.02.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 02:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 11:51:09 +0200
Message-Id: <DAX814DZF6AT.31N8TZWL5LMDT@fairphone.com>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect
 paths
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Javier Martinez Canillas" <javierm@redhat.com>, "Hans de Goede"
 <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Helge Deller" <deller@gmx.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
 <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>

On Fri Jun 27, 2025 at 9:56 AM CEST, Javier Martinez Canillas wrote:
> Luca Weiss <luca.weiss@fairphone.com> writes:
>
>> Some devices might require keeping an interconnect path alive so that
>> the framebuffer continues working. Add support for that by setting the
>> bandwidth requirements appropriately for all provided interconnect
>> paths.
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/video/fbdev/simplefb.c | 83 +++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 83 insertions(+)
>>
>
> [...]
>
>> +static void simplefb_detach_icc(void *res)
>> +{
>> +	struct simplefb_par *par =3D res;
>> +	int i;
>> +
>> +	for (i =3D par->icc_count - 1; i >=3D 0; i--) {
>> +		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
>> +			icc_put(par->icc_paths[i]);
>> +	}
>> +}
>> +
>> +static int simplefb_attach_icc(struct simplefb_par *par,
>> +			       struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	int ret, count, i;
>> +
>> +	count =3D of_count_phandle_with_args(dev->of_node, "interconnects",
>> +							 "#interconnect-cells");
>> +	if (count < 0)
>> +		return 0;
>> +
>> +	/* An interconnect path consists of two elements */
>> +	if (count % 2) {
>> +		dev_err(dev, "invalid interconnects value\n");
>> +		return -EINVAL;
>> +	}
>> +	par->icc_count =3D count / 2;
>> +
>> +	par->icc_paths =3D devm_kcalloc(dev, par->icc_count,
>> +				      sizeof(*par->icc_paths),
>> +				      GFP_KERNEL);
>> +	if (!par->icc_paths)
>> +		return -ENOMEM;
>> +
>> +	for (i =3D 0; i < par->icc_count; i++) {
>> +		par->icc_paths[i] =3D of_icc_get_by_index(dev, i);
>> +		if (IS_ERR_OR_NULL(par->icc_paths[i])) {
>> +			ret =3D PTR_ERR(par->icc_paths[i]);
>> +			if (ret =3D=3D -EPROBE_DEFER)
>> +				goto err;
>> +			dev_err(dev, "failed to get interconnect path %u: %d\n", i, ret);
>> +			continue;
>> +		}
>> +
>> +		ret =3D icc_set_bw(par->icc_paths[i], 0, UINT_MAX);
>> +		if (ret) {
>> +			dev_err(dev, "failed to set interconnect bandwidth %u: %d\n", i, ret=
);
>> +			continue;
>> +		}
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, simplefb_detach_icc, par);
>> +
>> +err:
>> +	while (i) {
>> +		--i;
>> +		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
>> +			icc_put(par->icc_paths[i]);
>> +	}
>> +	return ret;
>> +}
>> +#else
>
> These two functions contain the same logic that you are using in the
> simpledrm driver. I wonder if could be made helpers so that the code
> isn't duplicated in both drivers.

I believe most resource handling code (clocks, regulators,
power-domains, plus now interconnect) should be pretty generic between
the two.

>
> But in any case it could be a follow-up of your series I think.

To be fair, I don't think I'll work on this, I've got plenty of Qualcomm
SoC-specific bits to work on :)

Regards
Luca

>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

