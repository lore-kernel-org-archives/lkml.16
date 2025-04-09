Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA021018F;
	Wed,  9 Apr 2025 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231202; cv=none; b=k/wn4lfQTIyyYdczxaAujrh+wq0H0BQl73OKalQD+Bv7d8VqnGRVJhxyXdpZtD5PhWA3lWBiG0h6izzRvt7xdgD2iXtWmdoNym5sEYNLEIDLicsj4LQeLOc3efe6LxiDi7NxiC7zzlhFEnv70xsqIN0KxXcaO0AMht8voFlCv6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231202; c=relaxed/simple;
	bh=9BKAHqis+X5kWtEvZvUWZC8z/kchZX2ryYpVwrL7c9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMjZzINopr2N/+WXAPhiaoEnDALu5qs5qD+hhJCwTqGaGbyN57BolHTO4Y+SstW4ZkWMbB5qZWr+JStCRZCh9UDbuygcsPxr5UUJDTUq1i/B0NVmYC0x+CnneD3rUlxmpX0I96WZWEljEdFg9KVe7QUl5MPR6trKI9olvMN/qnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kb0TuXLJ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kb0TuXLJ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso132629a12.2;
        Wed, 09 Apr 2025 13:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744231199; x=1744835999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9BKAHqis+X5kWtEvZvUWZC8z/kchZX2ryYpVwrL7c9w=;
        b=kb0TuXLJ4QaoloIwncO5UwKkoH9SIHvCSX/4FCX94YccNwU/2EES4FxzEDoq44zES8
         jzOBt66BxO8eIUJw2wEe8nUVwfu7CBhpHYt5hMlR1vCIPlVEgqD37+fXGfxp4LFdskBk
         PYO7hbp7Hai776HHCg3bVzimVcyTLepM9tb392h7J3PsMZhABCbm43ycePjMxJysJpOU
         t9nCALEBrCoUNVh51ittX19vsA0ULHFudBvaLxINaa1kTyUCdRypCTKTaJTk0+uU8YMx
         3uPOvVaN6itSnrMNxcV3pFD8zDHopEcBr7YI8ztRXqPw1VMziRNpMZ8MjniJm4We4uC7
         HKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231199; x=1744835999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BKAHqis+X5kWtEvZvUWZC8z/kchZX2ryYpVwrL7c9w=;
        b=JdHrAyr8kvAq0Ddgk/cY51iwyta9JDJMX+oSwUdlYjTVnYhmBXLDCHcfmABegAfIiR
         fV25ZBkWg7Mndl0et96wwyB+Ffwr/ssa53BDq06Xif605JLKWHuzhZR9EB3OFBrD+sHx
         CnmUe+qUSg5BqlKiXqPP41NN+5OJQBDCyOEmikj1NsejZgqutKzfMBH2rduZGzG6GF5Z
         rabiatVGe2c1eb1Y6Lyo51I3VHJ3MwH61Sfjdou/WDxqrl7miog+E6HS5cQzelsikadx
         6UjGlj8xBLh4yM4KHc5dfh4mODFUH8spp8ZwORjV52zbSF5hIQBa1mrOSdQSM73Zm6a5
         41Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUvtkYYt/yWflPeicmJU7/950wXqOavq5FqpOvRLUdyYgaJ6LRvLwRJ37/sYlVSBixesaf/eV6HMluyF0w=@vger.kernel.org, AJvYcCXo7QNMlfR+m51qfUHWWavvAc19GZl0Riio2UYnC7TU6QPn0JCEgIbdZIChzYMxh0UAwuxT8cedLIFc8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTBSilcaeWq2S329aGRfLMOXKmeTwen3eFbLXnW1ZlGfoPG14
	Eo3TmgiIIgHcOHIgB7AB9ZNK5kjk0HGhLw8dpTN0XtslcaiG3UNr
X-Gm-Gg: ASbGnctHnjb7JpMRVDNIrpbF6naf80DM7pPh6qnIRVgApiglCopLBAf+7OGMSvIrmvM
	4I32hgEdNy0CZJ7/yYn6gTCeEiO3+dKHY30uQ2eAcgDR07wpz+AsLVa7xZg2vsSEd78BL/961fK
	zdQfEYwIAB0fC7+Xl9W4ymgzb6HQdGpK03QNeELGUz4jOu1iU2ypmt1P2v5Ij1rxSLWGjNHN/gQ
	Suo6g+RNtm3y9aucVNkLG3M4kuUBDF9LkttyggbAVQoIFpnGj9xX03vaaVcT/qJSIaFLA3m4WVl
	sw9ZCDXs5XSM9VEPKzTcTGgbmyeeGrZW/PbkJg==
X-Google-Smtp-Source: AGHT+IE7tTpDQvqjbIuxq7dP2LnTwsZbQB6Q0L/sFtb7HJ2jpYLO0kXHgS+k3I+2itIeJ8/rcJDfWw==
X-Received: by 2002:a17:906:1c51:b0:ac8:17a1:e42 with SMTP id a640c23a62f3a-acabd194d27mr9509066b.22.1744231198508;
        Wed, 09 Apr 2025 13:39:58 -0700 (PDT)
Received: from pampelmuse ([2a02:810d:a1:6000:959d:6b59:1561:d2b4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce70ebsm148831366b.178.2025.04.09.13.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:39:58 -0700 (PDT)
Date: Wed, 9 Apr 2025 22:39:56 +0200
From: Gon Solo <gonsolo@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-spdx@vger.kernel.org, linux-kernel@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v2] scripts/spdxcheck: Limit the scope of git.Repo
Message-ID: <Z_bbHP3JeRh2hLe2@pampelmuse>
References: <20250409-spx-v2-1-168115798db2@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-spx-v2-1-168115798db2@chromium.org>

Am Wed, Apr 09, 2025 at 08:04:19PM +0000 schrieb Ricardo Ribalda:
> Changes in v2:
> - Make repo a local variable
> - Link to v1: https://lore.kernel.org/r/20250225-spx-v1-1-e935b27eb80d@chromium.org

This is not necessary as it was Python's fault and is fixed by 3.13.3
which came out yesterday. I just checked.

