Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC71EBFE3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361422; cv=none; b=oLFkxkLnd2S4T55H3YmPYcmLKkiHvtRF/NSTfhKFKqAULA+IUlkDTXKVog8dK9dubfSoBUd/QRF+xgDZvNGYUhyff9fhby2QlCdmpT4IUklC2OYY3lSvuxkE278H1FCjMCuxxYmZzNSxOi+5qRFdO+yRTDPV6OlbTRJo8+z9xhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361422; c=relaxed/simple;
	bh=CYnsLlC0NFMYuF8GmCOmo6AutxjaiqbjJEuB9kEX76M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvZPdMmNZ1KxL92RuNmHYb1Yy1b3D1iRU9LmDV1SVsjvObuOqVRUz10S21GQ7O6HrpHmr9QRriZPfWZoaxLSj6XMy/TPV8cGXyYGw9MBcJC8aLrduXuWDMtFMXnSdKWUszvgdMYRhJQMt2/RS605IffhH5/07SE1x2fcLKejCmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tmjlLrnI; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tmjlLrnI"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so50343781fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745361419; x=1745966219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYnsLlC0NFMYuF8GmCOmo6AutxjaiqbjJEuB9kEX76M=;
        b=tmjlLrnIq4uoKAkzniiAutP3VY7kSpH6FYvuLQdz7LKnqNjDk6Seva+JawvD/Jh63t
         Pf09R8uaiZsFR/tcF9DnVOehag+2l28WTwZb13kIWz6Je0/BabTqE+wH7kHP0ZpQrGuM
         88GqGw3tA5DwOeERO9+e5K4sSVbjxSPYVJAXnV4ZGo1xk+uw0tWebCEfXZ7mpS2LWYz+
         0tMwU3t9h1GHg4QhIV+t3XOjFWn7QH31TrNIpbgVyOkVdo2SoeYdED1hEv8TcTYsEUAV
         fvw3YaYRG9K7YjNUOw6on2gclmo9Z1F71osZ6LnAbfXbXRLNhYhvk0zwdDrqCAjUnf83
         j7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361419; x=1745966219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYnsLlC0NFMYuF8GmCOmo6AutxjaiqbjJEuB9kEX76M=;
        b=wdDxWRyNfX/LSCCdGERNUnjpuEW0N85CSBme+dUIEMgsMFDJNyHfCQcOrTwyhCGLxr
         xnFwyUshO3YNFSFJhpj6aHY3E80thSqj9B3BVu8DouGE94ZtOcn0Czo//wu53tq0yQWF
         ueHQz9pYGCqtSTwpYBgD9gi1q99MJM7ii9RaDFdRNktV7mPK+8TTPmrQZfr8OybqFBjg
         B9l1IBdPL43EkZOGMhgvljljzXwYJCy+2mRRXX3koZgJnmp+Co5E6gjfFhL8xl/J78+j
         APQD9KGp1BjDgdnoxEIm1eabO7eKtdAedOVaa78jWtt6t3tMVfRstnzYlsWBiFv0dlY1
         O4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0SDvekSsfpL80YhJli1EQ6gdZ4ZgYjXzrjIo+SNUcCAnRDdtgrESCRe2Q+uU59SLTx276tIovytdDdAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrDrH+1Gak6TvuJijZNBCPtitTpc6f65Ez4WukmPelvjN4ZIY4
	dI/8rgKbyCTxEah7Wr0jZug3LnT4MC8zJshwR3eLzCdZBsIxks54VF0iWTA7gjNgAnMUdoOBFf/
	DvQoM9xif8QxBJqWtDsTkC8JuE/JCD2+lF5o=
X-Gm-Gg: ASbGncuFRN/OiHiCrgp0RPszFzxS0J7ewoW30xxmEhJnm5QWNRnUI9R+UJXqCsGhwUY
	H3vGnq7N5ygeWLoszdjQEDctZhPrAfW2BRQT+c84F/IHW8mp1Fr7T1CHm1ro5NNtJ2z4rCX7zFX
	Zrv6QcnlUMG/7WrD+nO4Fuq9eJwc1I3l3OGLSNFqDKh7Yyv10fPw==
X-Google-Smtp-Source: AGHT+IE3IEPCCgB0bt/uCVYonB/YsmX9MsBR2/QB63vrorCHbNSrdpM99e+NYH8FchPivlBNMzAKqKtWDNa/LnKLgF4=
X-Received: by 2002:a05:651c:2226:b0:30d:c534:692 with SMTP id
 38308e7fff4ca-31090554d22mr52580801fa.29.1745361418655; Tue, 22 Apr 2025
 15:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-3-jkangas@redhat.com>
In-Reply-To: <20250422191939.555963-3-jkangas@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Apr 2025 15:36:45 -0700
X-Gm-Features: ATxdqUHUf8NvYK-aLnI2B4TJfd1jaEQSDfLR3dMFnq6KQaAqiJ29RDdXxafUgSE
Message-ID: <CANDhNCpbX1718t2gH3LULL=RDxfxh+uCJNF4jJH0sbpLMK=oWA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
	mripard@kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 12:19=E2=80=AFPM Jared Kangas <jkangas@redhat.com> =
wrote:
>
> The CMA heap's name in devtmpfs can vary depending on how the heap is
> defined. Its name defaults to "reserved", but if a CMA area is defined
> in the devicetree, the heap takes on the devicetree node's name, such as
> "default-pool" or "linux,cma". To simplify naming, just name it
> "default_cma", and keep a legacy node in place backed by the same
> underlying structure for backwards compatibility.
>
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Once again, thanks for working out how to improve the standard naming
while keeping compatibility.

I do still hope we can get to the point where other cma regions can be
registered as heaps with unique/purpose-specific names, but I can see
having a standard name for the default region is a nice improvement.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
