Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7506522F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718162; cv=none; b=W5J6aZlN+CHyC1PGfV2zuNQE56uUwv9IjpcIV6Fcu8IwXzzplfLMFIE+6FgJvZS2tNkEND2GCD1e2EkDytUKZo+OHxq2Ho7LXhH880KRGgq3NROVJbqgGr0V9c5C70zzM6gd6zXA84wFoeAyx0jMO14z910e7BicntU7St2LQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718162; c=relaxed/simple;
	bh=FFQQ/BU33qPIc2knTz+etqlj/3dpV8vvOqeC/62hQNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8WhRdVZvwdoRTLxTElN/ZpMzUYMBgD4aywvMbLEtEO4WmB/vsEZGEIzn28ZretjRntiPE76OfT5sWcDZ3NwvK+KUtH52VHhb3yAf9ZzuH9SY02zhX8Hprls/fCoPG9WDrvd46M++5PHE3lEC5X8CcTPolOFM2HyDS5+YmaO2O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bV9gmDmC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bV9gmDmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749718159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6IteP7BP9moGyYHUNtJgLr0pJFVsqjJ7MguYFjZTR8=;
	b=bV9gmDmC4JFWnawb8P4U/WWPT4c3PrWtpUp79eNtxddrY5/xOv4jlmBY9naYE8AmJymISu
	XtbWInvjGeCvg2NFxFW10EbO4D21RVeNmAsaSoGCpNyiL6IVO+h6yED+ZQbqcYjx4ab16+
	KbyfB/KejWmtyhHrMTK7mzV7rUYjm9w=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-_asHJOVSMv-qPKyySbadxg-1; Thu, 12 Jun 2025 04:49:18 -0400
X-MC-Unique: _asHJOVSMv-qPKyySbadxg-1
X-Mimecast-MFC-AGG-ID: _asHJOVSMv-qPKyySbadxg_1749718157
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-73654601d7aso222027a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749718157; x=1750322957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6IteP7BP9moGyYHUNtJgLr0pJFVsqjJ7MguYFjZTR8=;
        b=qG+plwyM65TicTijp+U5RCv0ipt2PmAaTKXbb1O7bt7gqF2QXDsyBkT+xyxRtliEgJ
         2aJt6Xdzr128FBiXT17iS/DHP4Ll67dwAu9wZWE9Bp6XglQ8mBs6Upt2DQfO+h4O7/Zv
         x8+pyPapA6ygcULIpfDiw2b4uKZJKSmhN9s5+Vn41czt80vxKlXdprap1Sbq7cCEaOm3
         RDQHolCoP78tr9Io7VCEq4Z6k/AdgkApFa342jtqs9ENvZo5qJdKzRsNyq+jv17ijgBp
         Q9JkRvRVesTqvtWRlw/nMzW6Qo6e/g+iLeM7Ld2U2lvsY4w8fSe6pHrz8CBxpr5KoqiJ
         /dew==
X-Forwarded-Encrypted: i=1; AJvYcCVUbiBPbSN4eG+xRemuaAV+IhK/4XnE644P5zCkBVVU8zxbgooamBAv55HD+qk5pyTEYLo9/Xl8DsqhRk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+kkU9Be27zeKqNynSTm8uU/qOlLzMofepNnPE+FBU/jv51kx4
	zPXUGhrkI5+PnnYy6podLhsQlLST0eWQAe6moXGJyQKNpBqao9pbrQUaQpyNsX72NhF1GWQoh/f
	OqoQaOrDpalxqwiqlesdDqQH+HcVExX7hTfT4pLPSPBFqp3fL3kH/8jr811or4ij1wjZu7fi+Ht
	B4I2rzgZuONBYHccOE+i3B3Eor4bTozzEjiOiF8BalBSEXvVZU
X-Gm-Gg: ASbGncuj5j5//d4CJi45UW9JEpVa3azDDa51BxnBK4K8hA8Qbja6LiZw6PaD3MTP9RU
	v+hy3VGTSqZy2Ua4Hd84QHLrTBpg56YDZCUHYUED6//+TMywspdEGtoqEChbfNaWDiqpjc+VJYh
	YIcpA=
X-Received: by 2002:a05:6820:481a:b0:60f:880:6082 with SMTP id 006d021491bc7-610ef6f0f1fmr647774eaf.1.1749718157194;
        Thu, 12 Jun 2025 01:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwPFH5xCDRpuf1s5d5mJAfNQIldXb2TcD3mthjSOwkVxy4npvtOqbY5CzUVlMoXgCj/fxjsyNscrEZA/vemEI=
X-Received: by 2002:a05:6820:481a:b0:60f:880:6082 with SMTP id
 006d021491bc7-610ef6f0f1fmr647769eaf.1.1749718156873; Thu, 12 Jun 2025
 01:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109121614.754466-1-s-vadapalli@ti.com> <20250109121614.754466-2-s-vadapalli@ti.com>
 <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
In-Reply-To: <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 12 Jun 2025 10:48:20 +0200
X-Gm-Features: AX0GCFucWcc-KrL-D5Adt3auExiV1GTxSbUzP5wSIA--M9Ad_QrNh0O58OSRSGM
Message-ID: <CALE0LRsdsTU-NLN4fgh2c8qnS-pPP1BDJvjnvsSOnud8amk3=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, vkoul@kernel.org, kishon@kernel.org, 
	sjakhade@cadence.com, thomas.richard@bootlin.com, 
	christophe.jaillet@wanadoo.fr, u.kleine-koenig@baylibre.com, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Jan 9, 2025 at 5:35=E2=80=AFPM Roger Quadros <rogerq@kernel.org> wr=
ote:
>
>
>
> On 09/01/2025 14:16, Siddharth Vadapalli wrote:
> > From: Swapnil Jakhade <sjakhade@cadence.com>
> >
> > Add register sequences to support PCIe multilink configuration for 100M=
Hz
> > reference clock. Maximum two PCIe links are supported.
> >
> > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
>

These patches seem good and have been reviewed but look stalled here.
There is any chance to rebase it on top of the mainline?

Thanks,
   Enric

