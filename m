Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024FB242D98
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748415443; cv=none; b=MRNivQXDCnNyhPnthPtiWIleDwVe5XBrEa28FS5j1c0edTpgn1yfWOoyfmEEffePzYIZTVfyC7ypzbKFmRVMEtENUtCbVBIKPo55b+R65201X/RtR/9n7HlTYZOiGgKtmd+gjNq9vYTrj95g6Ip09/usyGfJQL+iTQnjzTjWNoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748415443; c=relaxed/simple;
	bh=rog1aO13HU5eKghFpRoK9e6lQ3YCvwqh+Wh4tYN8qHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMkNXb3preWIa5r2vlSPLTtPLqMvEP791yrM6Gh4qn77uVT656uSZAQ0P+e4tikrhdAQ9x+vc+zK4H9Te88ii8zruFyU8Sp+3UQkeWixMmXQkosmdzaID+Alsf7geFwCvI5Gn2eIsP0NpE1NgGh06JwDT2JLY0umQKFZYmIPgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NVOgWHQn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NVOgWHQn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22d95f0dda4so45717605ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748415441; x=1749020241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJf2emHEfq/X781Clwbr6MSwesl5vhnwmA7nNE86Ctg=;
        b=NVOgWHQn1hnmwgFNnK5wQ6eQSspQ7uxf4MLmQUagRJVIlgwGBETIKqlzn0xk6F8/MK
         Op6K6RogFzGYOukxEOkdoP7gOdZMGTy8IYEle6UEpVHVwyYbzJPx50xuYOnys83WwTa6
         nZyHPKoCo+WybZdnu3MvhXv3+lWqYlbguITDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748415441; x=1749020241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJf2emHEfq/X781Clwbr6MSwesl5vhnwmA7nNE86Ctg=;
        b=rdnYJTmLzg2dlow2u4Rbnii8OdlUYi0t5WAiF/G9NlIYcc9RfQ8Ujne4Sft/PnYAp5
         66uVoKLYgxYL1YaH6Vvrm/2GvLPFRdOHigY44xZe4/E42QxFhkXweylPgSbCBVoKp3Sl
         O0X1Lalr2CPH2JDov8i10rRV0sQ4Q688t+NKT2nmW+YgCwP/97UJ1IHEFpkxMu4B41nw
         bpbvUdFzqUgg8HyX68e5E8aLAh87aHZtdnCNdjL58abO9onq5F5Ecxgr7W4wyz8UFtAI
         4VGwACbQJKZQ30GmfdVhKcqGEUmJAdnUyKPZaXy7vsjXbBLVlOTfGBBee9yXTxQFWmV8
         Lm3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmiLp5n7Wc/vcrTmkZbbZ2/Bxt/uuF+pmACFnNZmxALJ3aup2gJBoxLc9E9bK26RWkH1XA86MQjA2drys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbuBB9HzssHchEVIPxjDI7bXavgCxVMs5/9JpxsjQaLop7IGth
	iMVUckNH4dLpGa+M5SOYeCvhGtWzUiCwG4eF4D4R/nu3kcli4ilWuHCVvA3/lMMZV6c1kQSUciY
	vqnA=
X-Gm-Gg: ASbGnctZIP/hHzHDNIV6tYUgQVQkvfzgNL3XlpIzEgf2STorzOPH64Ke+755HRqnqdg
	1+DrH6jarAm4NlvlGguF/ws9y+rdakAL0dvK31R2qseH+Vz+gdtlJijiX69u1xMqfJOgvyUc/ip
	qh0H010fbbpHJ05Fp6U2Rmi4GjOaG1ARgIgS9H1nEJcBuY+lwtWZ2ie5LfvNK/8+dxidvWV23Fr
	I2yh86V1rUoarzQrzPiAPmpcrIU8npuVuYnISDREALqsPkjKnWyr4IivypjRtaFEZ4LafbRn/a/
	i+AG30LbX4LzNpeEk787xyphaINpldVnSe9ZX3Rtn1pDZflqleE+
X-Google-Smtp-Source: AGHT+IErFYP5ybzDLBUxNWWiAUfzYAgptPpNppOu82TA1YA5H9SJxLXCw5ie4h2NIJ0vK76PvvWdCA==
X-Received: by 2002:a17:903:185:b0:21f:35fd:1b7b with SMTP id d9443c01a7336-2341500bbcemr205484905ad.50.1748415441191;
        Tue, 27 May 2025 23:57:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:88fd:67f2:b90d:8b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fe186asm5332355ad.59.2025.05.27.23.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 23:57:20 -0700 (PDT)
Date: Wed, 28 May 2025 15:57:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: mark reset srng lists as initialized
Message-ID: <utofrwmlblop7re2ak24ni3wmlc4i4xx4jwwtd4dpg2gsvrpxy@prbr3vjl4qsu>
References: <20250528065510.2790649-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528065510.2790649-1-senozhatsky@chromium.org>

On (25/05/28 15:54), Sergey Senozhatsky wrote:
> ath11k_hal_srng_deinit() frees rdp and wrp which are used
> by srng lists.  Mark srng lists as not-initialized.

The subject was supposed to spell "uninitialized" instead of "initialized".
