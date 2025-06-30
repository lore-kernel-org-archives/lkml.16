Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8C433A4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306415; cv=none; b=l3NuZGlLaRVrfC3GLpwfLXA8n9r1jlEcI+HT+zIlVwaU5AM8ql50Rj5oyt3gcZSaPz+Ni+eGeNUL3vjpNfIZEATHLEV0wkXV/x3Wb0WqLF+rUqgHtoLJXBb8yr71fg/jILWhQ1McWaSRZdRtoMTfzPoW+t9/By/jqZXPlL4dqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306415; c=relaxed/simple;
	bh=aSCHYql6Y1v5C4+ckQvyy36V/kDIghboE3pXy8frVRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8s8xYU0YBg5BYmTiRP/9IZjpRVJoJ7MSpk+v/PPPVOXB0wWfUbjaO4AjxQHeOd53Jr29MjkkiJNZ4xoPN5rtPYK1+1L/y4e0SORtTBtyJQ9feaQpjboCVPU4K8Sr//NJbqbz2UkFbyBySasoUxCNLf3gzFb7We05r3HG5BlN94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9RBEbZ3; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9RBEbZ3"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4067b7d7e52so500063b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751306410; x=1751911210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nP34edbHBs8vVR39DOc2sWEr/hY8CPswI/lDfFfduJY=;
        b=d9RBEbZ3Z2HTOncxmVxO31hkLJFGbotpjo4SvXDXK/NyTQ+GN7Y8ynfOCP7v/itRAi
         ZrhmI9+6y0da1+cmY3UemPiRiomNgwLuobyDxXVTp+xu9A/vlk4Qf2YgXzlcGt5XIMPQ
         FW3E6WorhdcM+gyNvbOsoqC8Li7rCuFPJnHeK6tjgR1eSejUJAnHj9XsI6W7xshfyRAr
         lgbCy5oTicDixNFoJf4+uYRhzdMKTvSNg1TxNROGHBUdet5rbUhIGBEM7RmYhbsm378t
         1B8QKjvxsTbD42jCNuQ9hsWBp69erl8ZQdZNCT9ntFN1CePWc4/C5xmXRHLWhfid07sa
         /TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306410; x=1751911210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nP34edbHBs8vVR39DOc2sWEr/hY8CPswI/lDfFfduJY=;
        b=QQHKr1kqj0nS5Lfea64WjzeU+FGiBHW+FiBRReqeo5+5sIk7K09ZOadWO40/7cST/2
         gZn0ayr3kUgcsaSmTpWSdpMSbUxvt6rPA2aMkKQ23LcBveM0RPdYawD5rmePyb3Cr22u
         hToflODuw6Fbb7Ne0DbHVtn9IPVKTVNdTlyRlKALqtoV0K4gDTr/nLR9FXWIGDbgR3r1
         4ZTZwDhv30sGsQ+zggEVzMWSzkkVcfvMSdUMN93s2qCE3YuSSF8LfAIwd1684nJkbY86
         wRo4VLBzjmkBTjMyQPkjPA8cC35T2sehVaaNFGkmvdH2xeDKEezGNCbmkoLMD6OCFPmt
         ZUMw==
X-Forwarded-Encrypted: i=1; AJvYcCW3umitrD7Ihe0QRvZzOgA2DJqAE0Y1mArqW5o6jEnTmdbLOPL+7UcY5HgCM05Czg/e4qMcCHD9JfaNaaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr/jbQAtZlp567Y01czI5EhTHHtMAu5AISpcEhQGI8ZSFmel4f
	EK/Zj5QZY1OqIxv/hQsmessvVFMNXGAOl+u93ls28hE60yWPOcP6O2yt30jzl8DN5KU=
X-Gm-Gg: ASbGncuHQ+/3WPERP4trRWo4YxZPJMMFgFh3+9cZRKXMc8T37QHszAX1zANqnqUVzjP
	Y+BC7zJRKVHb8DoYrmS+L3tMZFRmmJB7BKOBCkBnQPSnrxinjEihQOKliY5yj2Ye/SbYgU6DwDE
	y8DGD7E6/Cq1j95acL60OxPG6Agrro9W+4lbGKBr13JaUdMkU8Fs0o941FlgKpI9LmEMO3rIKFO
	90tUXYAdThJwGwgFnbZmjUE/v4V0bH4KtlnUrG2vpp4mudXwgiu1olflNRJbX8+BtHJjg23VcAL
	Qy/bB1mvVo2r/uXlJAFj4hrEdRs28I6A0d/a3pFJWEA0H22M65Ckd9oPRATTu9ty42E5o9gCwxv
	pAys=
X-Google-Smtp-Source: AGHT+IHLNzdJg8amBLq7uFi/dLCM7igqScX5Y3+a3Y5i48QPaQrERmo4dRGF7JEEecfpyhBamvzphQ==
X-Received: by 2002:a05:6808:18a9:b0:3f9:4f55:a002 with SMTP id 5614622812f47-40b33c79017mr11035935b6e.12.1751306409807;
        Mon, 30 Jun 2025 11:00:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b364ab73fsm1657127b6e.1.2025.06.30.11.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:00:09 -0700 (PDT)
Date: Mon, 30 Jun 2025 21:00:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: khairul.anuar.romli@altera.com
Cc: Mark Brown <broonie@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH 1/1] spi: cadence-quadspi: fix cleanup of rx_chan on
 failure paths
Message-ID: <9f26f205-756e-4fcd-912e-bf73167be21d@suswa.mountain>
References: <cover.1751274389.git.khairul.anuar.romli@altera.com>
 <89765a2b94f047ded4f14babaefb7ef92ba07cb2.1751274389.git.khairul.anuar.romli@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89765a2b94f047ded4f14babaefb7ef92ba07cb2.1751274389.git.khairul.anuar.romli@altera.com>

On Mon, Jun 30, 2025 at 05:11:56PM +0800, khairul.anuar.romli@altera.com wrote:
> From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> 
> Remove incorrect checks on cqspi->rx_chan that cause driver breakage
> during failure cleanup. Ensure proper resource freeing on the success
> path when operating in cqspi->use_direct_mode, preventing leaks and
> improving stability.
> 
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Mark asked me to fix this and I wrote a fix but apparently I didn't
hit send because it's still in my outbox.  Sorry about that.  :(

regards,
dan carpenter

