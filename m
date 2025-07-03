Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901B52D3A64
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534038; cv=none; b=u0+j/0sg2DdZrawwceFUF36suaTtv0V5+bhWJ72Lq2oPMJJ6r9rOrhtrECiOM4EoRjjrgBIFgxYQ/g8tsm42GuqoyQ9faaUbH3wmPVGhxVidHLfaGit3Cd/B10ZsKdh6L7eebdnBtZEkVNRkTAG+20FiwovRPVtZ2/EON7HJgus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534038; c=relaxed/simple;
	bh=2FJhwqOSUxIoDeCZEeXY6Q3vz2o4+XeHIQYBwmnKTZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MTDiYdY5ie4oaHfYTaigIW1iLbgrofCUz7yIchZ3Wgmwc/vDtSRZQlytzdDlyM6Z8WkmWjkwuPYd4zYdW3pMTPBoE1o1I1FXZZzfw8ZUZKxGH+DDlzL6aJs3fDMW1tbXQYknZg4qJWz3uejWckPlB//FJiVVSnGX8w6VdRsxNcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eSR7Ta5F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eSR7Ta5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751534035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OX+ytT49dmTr2vEb7Cm18JPywxCOwr2HkRwXRlWUGbI=;
	b=eSR7Ta5FbJ8RBzVxD+gLE0yyn+BhcKHicUg+CSMYwv80zJpbjt1nubT4iag2Yk+uR/KDI9
	rb2Yp1joZwa9Fq1qEONT8B/C2Xlghgkdp5q+BUu5iKUT/gURStumieOaDx2FiC8JpkHLnm
	kvkvXf/sU8OA/LQEOhRmv0vfJcuadC0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-uy_QIH86ONmx5Lfqh5rqIQ-1; Thu, 03 Jul 2025 05:13:54 -0400
X-MC-Unique: uy_QIH86ONmx5Lfqh5rqIQ-1
X-Mimecast-MFC-AGG-ID: uy_QIH86ONmx5Lfqh5rqIQ_1751534033
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so3850337f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534033; x=1752138833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OX+ytT49dmTr2vEb7Cm18JPywxCOwr2HkRwXRlWUGbI=;
        b=mMnKA/JClzEkRhI8UyPiaxD/nKq5zS/pEUoZ5aINCBvN3ZfFVUtYhHhqOnU7s5xSl5
         a3SbkM2B2hlPDTdZ/UtEvN4/fz95EL72ZcV1RPg9Xt3b48Cg+I0PjMECBcQ1JYPp2Fu+
         grFwpmZe9FOIFZ3I9H5q/rHN3PbJsLtrjXG1TLOcV0bS0Dx7wqAyzKDAgrS9zTk4AzYL
         0auqZjLbBdFf35D+ml0Q7vPW5i/RSI7mIxlW+AANn2yu1ZL56iJorkEyPfDaTRS214zt
         CMDN70IgZLQPI8wM2OtXHuPwKqg71qSsmQS4IqbHi9oiWZys5Y2BsdLSeo+O//v6mabN
         QbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3eOsu5BTm6w99xdDrmow2PnoNp9k8s1cWH2/2L/zdkkXnjGDGVd4fnfcMURYMXuM9EB7Lirb+L07isSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYa1whJvUiTsHu0ua5DQPOSwQWRfdnFFqRG42gnUcBcIys/Sfx
	BjGLAoKhwLq6kgILJNXPd5v9J6CQs1drcciEKvXwyVFOHZrb9sPbhdgxEidAy0jkMqQDqfFiKgs
	H4/kmCTgrFKtodA+AIufFggLETbvKkD/GVMKicWAnqz3ZEDeePzjXuAm0JVAjWXXU+g==
X-Gm-Gg: ASbGncubUrvQ1bDXI9tLHHP9g8rip++7qYGlUXIQ6+ivSXpNsvltQWwdwbS/IVZYDm6
	JM3pLMsGJXum3SIhO41msficoLmw1WKrsZvRlEtJJqcqei5CxcHx8Q1UBaKMHANuqbYSbCaHFBW
	4f2g1vlVah+YHpliy7UwZEpKrJHWoTzOpwkLyFElPoHwrojM0b2cufaQlZeTF1Kp2C8IaxzKnPO
	B9r2a9/6UXNlymQR/sxliGT2daJzcc1akAXMX7UTk8HyE4kojZidZch+c/xo9LxP/2PqEpagXle
	mFha21dDhF5/2kF770AMj8n15Op4RQOJYyCpD7HtaOIokeN5aP2yQa1DBHVNlstI5S0=
X-Received: by 2002:a05:6000:2387:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3b1ff9f58e5mr4716222f8f.29.1751534033045;
        Thu, 03 Jul 2025 02:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRRb+VUMKb5MUe0c9M+TZj8qdoFSn94nolph8HCnGsExIYZmC8zGq2a+/0WeZeN91ewkS2ow==
X-Received: by 2002:a05:6000:2387:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3b1ff9f58e5mr4716188f8f.29.1751534032529;
        Thu, 03 Jul 2025 02:13:52 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e529c5sm18486218f8f.63.2025.07.03.02.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:13:52 -0700 (PDT)
Message-ID: <0547d8fd-e6ee-4f59-8a7e-93d2d11cdf5e@redhat.com>
Date: Thu, 3 Jul 2025 11:13:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/2] net: pse-pd: Add Si3474 PSE controller
 driver
To: Piotr Kubik <piotr.kubik@adtran.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <c0c284b8-6438-4163-a627-bbf5f4bcc624@adtran.com>
 <4e55abda-ba02-4bc9-86e6-97c08e4e4a2d@adtran.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <4e55abda-ba02-4bc9-86e6-97c08e4e4a2d@adtran.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 4:57 PM, Piotr Kubik wrote:
> +static inline void si3474_get_channels(struct si3474_priv *priv, int id,
> +				       u8 *chan0, u8 *chan1)
> +{

Please don't use 'static inline' in c files. 'static' would do and will
let the compiler do the better choice.

> +	*chan0 = priv->pi[id].chan[0];
> +	*chan1 = priv->pi[id].chan[1];
> +}
> +
> +static inline struct i2c_client *si3474_get_chan_client(struct si3474_priv *priv,
> +							u8 chan)

Same as above.

[...]
> +static int si3474_pi_enable(struct pse_controller_dev *pcdev, int id)
> +{
> +	struct si3474_priv *priv = to_si3474_priv(pcdev);
> +	struct i2c_client *client;
> +	u8 chan0, chan1;
> +	u8 val = 0;
> +	s32 ret;
> +
> +	if (id >= SI3474_MAX_CHANS)
> +		return -ERANGE;
> +
> +	si3474_get_channels(priv, id, &chan0, &chan1);
> +	client = si3474_get_chan_client(priv, chan0);
> +
> +	/* Release PI from shutdown */
> +	ret = i2c_smbus_read_byte_data(client, PORT_MODE_REG);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = (u8)ret;
> +	val |= CHAN_MASK(chan0);
> +	val |= CHAN_MASK(chan1);
> +
> +	ret = i2c_smbus_write_byte_data(client, PORT_MODE_REG, val);
> +	if (ret)
> +		return ret;
> +
> +	/* DETECT_CLASS_ENABLE must be set when using AUTO mode,
> +	 * otherwise PI does not power up - datasheet section 2.10.2
> +	 */
> +	val = (CHAN_BIT(chan0) | CHAN_UPPER_BIT(chan0) |
> +	       CHAN_BIT(chan1) | CHAN_UPPER_BIT(chan1));

Minor nit: brackets not needed above.

> +	ret = i2c_smbus_write_byte_data(client, DETECT_CLASS_ENABLE_REG, val);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int si3474_pi_disable(struct pse_controller_dev *pcdev, int id)
> +{
> +	struct si3474_priv *priv = to_si3474_priv(pcdev);
> +	struct i2c_client *client;
> +	u8 chan0, chan1;
> +	u8 val = 0;
> +	s32 ret;
> +
> +	if (id >= SI3474_MAX_CHANS)
> +		return -ERANGE;
> +
> +	si3474_get_channels(priv, id, &chan0, &chan1);
> +	client = si3474_get_chan_client(priv, chan0);
> +
> +	/* Set PI in shutdown mode */
> +	ret = i2c_smbus_read_byte_data(client, PORT_MODE_REG);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = (u8)ret;
> +	val &= ~(CHAN_MASK(chan0));
> +	val &= ~(CHAN_MASK(chan1));

Brackets not needed here, too and adding them makes the code IMHO less
readable.

> +
> +	ret = i2c_smbus_write_byte_data(client, PORT_MODE_REG, val);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int si3474_pi_get_chan_current(struct si3474_priv *priv, u8 chan)
> +{
> +	struct i2c_client *client;
> +	s32 ret;
> +	u8 reg;
> +	u64 tmp_64;

Please respect the reverse christmass tree order in variable
declaration, here and elsewhere.

/P

