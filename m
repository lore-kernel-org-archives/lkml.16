Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726C323CB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748390930; cv=none; b=TkGTB5XgIJisFtccVWXP3azBshb0A1RChYBtjd0mq0hwyky+vmV9VHQJc/0At4UkB750D+iwsnOr5WIpo/i6OZqm2Buzf1T6vbCv1kQPbSA+nRMpLx5yRQmzmMHNUUm2fznzJ/KH6FIxBlKuVl91m5tBwJ8/425lgavteaNbC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748390930; c=relaxed/simple;
	bh=TR0ZxYypZZy0i1CaeTOe+YTdQQcFYzl9mwiHMZdHDFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aP7cZk0q+/wEdXLZgivcxL6Ll+H/7a6BJIQYJYTie7qdD8pjKx0lq73SEhFJ/vcSptB1wv3pHz9jcpqP12ugSU0tQXmj3wdwnB6ywEybeIZ3n++BW3DmPkDsYU2FK2Hla9MZUzkJJEYtIoIpbxP0fCY96yS2xrb1MW42MlPqBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dOxJDg1w; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dOxJDg1w"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad89f9bb725so36169066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748390926; x=1748995726; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=edlHaC7UGBhxSlzvX5IeW6JsmYljoWpUJVytG195zA0=;
        b=dOxJDg1wNE8ydeBSTmW/Q+ZCDhDUqp1ic+O+xllpZJPFNQ+tLTmRYkorkWxNSrIjdh
         pl+xwwKENb3mZcX54EcnQzZQ/EZO2NPYUYe/gYjqLXn1vc5cjjvfqGqrfSBTcFumMeoh
         Tf2W8NFtzWgFzGot8873bpkL+u2dLwQlBG4VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748390926; x=1748995726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edlHaC7UGBhxSlzvX5IeW6JsmYljoWpUJVytG195zA0=;
        b=PHPN8FD1DEM6a3nQe4gp41BcmHdcIxFaLZ/XxKWxfq3Tls+O7jFiZ7XTQPW2NdU++F
         kjtVSGM/fWOh2qyDUG6w1fUNUjs6RPo+VC/I761JFZfelqfMnogF2R+jeJz4+mtnyCM5
         iB98SrwynCZ+Q9lxy60vMd1xzE1E36p9YsQ6/RgC0y51JwU6UkMYfR5ctOVR8KsYbVpU
         bOFHuMbOSWIwQ5Sc1OgNfsJj9moZdS3gZqloXDA0flJnn7OIglL9OEzbBXln5i5SugFk
         z+Na6oKvByOyfSVKVM8NBm+2AjBR4//ool44ndmNhxkN+n3qv3E8UJOW0ItIEshiFU4L
         OxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVocFlg7UOnRTUQyueE7ni78cknT+bgeven0FSETv6Ee9UebEeKFpDKiLFSAtOlgIZvmJKTPVa2uwgaah4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wZ49eOZ+P57hyKU4LKYHH7fBijsQ5xL1HeeyNn0pokJBtRhC
	rwlUwxo4pLnNoxWrgS8GFn1bTgk00gKanMwHBbnWl0wzOrtRHZ4dcpnzxKThi6/eyqrmlY63My3
	AaNSO8m4=
X-Gm-Gg: ASbGnct3IlpuOyFAAfrENE50d1iSXn1SzNB13w7GZrURkb1Y3tO0AMJL5JMXW5UosJF
	YcRZjegnEmFufljKB4mJ0IZvKHO2hTZpNxT80eD5Dtv5NfsuKPeybS5Q5b/Ng5nhlY9+egS/wdY
	ahYEGjXC5X57feZrcH5STEPvktDk9+ivuNQkQxspjFodbfuCqYJRyOgIMafNgNL5TdQhD8aRbaH
	6Et6nb7Maos85513dpYXQv9ZEAtBc7XddJrMahDS9rImMJolEIwkN/AuV6k7hy6PdIRhk2y9Ofn
	KK70ylhS9NyAtxltK3LsAkz2svGPYXdVIH4MoaHfK9J6gItBrWl3irloOLhVqXTGr5iiUtdWEJV
	Pi0JyRrOZTp8dnRjvwrDGWbyibw==
X-Google-Smtp-Source: AGHT+IGDOKGwKuw4oCePEeQafm3G7m0RiwTx13J2HF2HcQZQogGWpG7BehiU80j8tud+HmI2Qg/EmA==
X-Received: by 2002:a17:907:8686:b0:ad5:b251:17f8 with SMTP id a640c23a62f3a-ad85b185a24mr1409337066b.41.1748390926358;
        Tue, 27 May 2025 17:08:46 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19caf58sm8380966b.69.2025.05.27.17.08.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 17:08:45 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad89f9bb725so36163366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:08:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCJmSxkX7XG405px2DXyaXmkOj3I4A5Lm4BmBaYlWOnvRnSNUbjpRKIn/GDu1bYfNJiePXz9mah6rFOfQ=@vger.kernel.org
X-Received: by 2002:a17:907:3e06:b0:ad5:27f5:7174 with SMTP id
 a640c23a62f3a-ad85adbbbf7mr1420194866b.0.1748390924696; Tue, 27 May 2025
 17:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4a1559fc9c5d1fec91f1ac5d425871b5.broonie@kernel.org>
In-Reply-To: <4a1559fc9c5d1fec91f1ac5d425871b5.broonie@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 May 2025 17:08:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wixqijS-ptVfduV-tAdfKjnLUBicwsXL1xf5PETfktv+w@mail.gmail.com>
X-Gm-Features: AX0GCFunwcx56f-t3WhtxF7QDIIPFE08vsP33GUiGJbUKXYqA7CrWkCSD440jBs
Message-ID: <CAHk-=wixqijS-ptVfduV-tAdfKjnLUBicwsXL1xf5PETfktv+w@mail.gmail.com>
Subject: Re: [GIT PULL] SPI updates for v6.16
To: Mark Brown <broonie@kernel.org>, Raju Rangoju <Raju.Rangoju@amd.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 May 2025 at 03:30, Mark Brown <broonie@kernel.org> wrote:
>
> Raju Rangoju (4):
>       spi: spi_amd: Add PCI-based driver for AMD HID2 SPI controller
>       spi: spi_amd: Remove read{q,b} usage on DMA buffer
>       spi: spi_amd: Add HIDDMA basic write support
>       spi: spi_amd: Update Kconfig dependencies

So the Kconfig changes made me look at this, and this is just *odd*.

The driver stops using read{q,b}, but why in the name of everything
holy did it then convert to this insanity:

        u64 *buf_64 = (u64 *)op->data.buf.in;
        [...]
        u64 *dma_buf64 = (u64 *)amd_spi->dma_virt_addr;
        [...]

        /* Copy data from DMA buffer */
        while (left_data >= 8) {
                *buf_64++ = *dma_buf64++;
                left_data -= 8;
        }

        buf = (u8 *)buf_64;
        dma_buf = (u8 *)dma_buf64;
        while (left_data--)
                *buf++ = *dma_buf++;

which simply seems to be a really stupid and over-complicated way to
write a regular memory copy:

        memcpy(op->data.buf.in,
                amd_spi->dma_virt_addr,
                nbytes);

because I'm not seeing what the point of writing it that way is.

              Linus
