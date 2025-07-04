Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881841D5CD4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751594035; cv=none; b=sYlyFHpkWRB/TS233aJTmxZBnbbdxtZtSwJktomyVS5l99amunu+0fMkL1T1DxfFHI2Qr5tLdsC2zpxhJUMZnZ3mjcQ6sWUxjEyDjoQJiCREv2WxA13Jj0Bl/foIBmNvEuU6PqIhIdhvXeLhH9BdgonA1jXimRe86RpiiX3Q+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751594035; c=relaxed/simple;
	bh=IUMF0hGdyx2upyKxeDRqselmMwuKI0v+FfCyIWW4URc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsS2/UohZSQ9HsC5VW91dRO3/EB9YA0iyZCbgJLxwwqVBOKPBrk0ZaiussmKMLSS1yxZwr7JQ8XbekmOWuH+vwajngoCOxz0ZIKaM4912rSBZidC1rnVjdX9WID8RTe08CTm68w0eW9+rYyviq/pcW9C+hYY+624L9EZBM678LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z28ygIIS; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z28ygIIS"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b34a71d9208so320858a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 18:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751594033; x=1752198833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAQ6TVq16tZQ6x8pz/0CtqrKxJ7X+TGiOhIJo9QOyHo=;
        b=Z28ygIISkRVr9FffNX90JwVXNbBkCGFKcB9XvfwCzeiRZ7JoZx/WrVY0hpszkKqEM+
         oYC4uDx6oZU9gIgincrQ0ctD3xabE9O1hNbCT6BW/fsCyyYgXt4NWXsMSNlXnsCOh5S6
         mJZTKvni3OfgDhdnU+0Q9jzR+1y/9dOoe3GnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751594033; x=1752198833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAQ6TVq16tZQ6x8pz/0CtqrKxJ7X+TGiOhIJo9QOyHo=;
        b=TQ08l0BI2sSHzU3eBRnlkOKqkdbGoMXStIMd3GhLaobmzT2dZKpb/e9StpIhb/42E7
         ov22kw31DgySnwM1aHg55p84bGMDzynC1TakYcn4wN0BuSvfkFskFZaNPGuQ2Wul+M4p
         GgYfaKf9/y8sDT1ZwYeR3lEASy/Tyow4uPPKXgK6e4jJWY4YluGI7klnjE6EXMyNYFln
         Rw/lJB40ZAatZXSh8P7GQwEAhsqdgiNh6TTrmYnB+9yZV6cZQwsQah/d5/EYLj7X2VFC
         j2YGbRQniZ743w8wmeGU9JAMESZY91QIapI63cScjvvmXktbBKsFGXp12HC12gfCR5dX
         SAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrYMYS0IecqX0zQ3j6KR3QkRozwaQxbCj6t0Wkru2Jtec51+OCntFg1UMEPUe8fNx6/bg94Woqsq7mapg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCrk840NfH9DqjSy5GKbChco7hczb0j0FwYfTlJglAyAiEgtp8
	qtYQhP476jAeECH3QxrjpxuRXMAFU2EQLqcT6mQDeMeuf5OATdlmdauDSrdntzCKyQ==
X-Gm-Gg: ASbGnctJuRiHMv/Gc4FetoW+Nnjh+uXC19+fZFhp9DKWRWxMRyxFOBYBAIsmetYFBib
	nZnrfWq303UqRKLHFe8DSd2duXnefRvHD12GuJxorN/Fcb7FkIqYHq/Gb6Z47iE5VW6wBHsEW7A
	mvN3P4/k/RaZR4vU44aShy9sAbo316hLHWn7jDIYXXzkLJDzlHw2I1aY1fc+AuQo3rvpnr0gbno
	Qngdv9RqWgFjLg7b7hpPzxgYWVvRN/0wT19VEYWpbzs/lptF8EtnWDSrDfrDN7fhq1IlsooeauU
	ljsmdvg3INPZPFOqOndE+4+5BIQQawkgGunxfuOeab3rL2iJToH0vn+YYcbYwXYSMw==
X-Google-Smtp-Source: AGHT+IFU4hNoU+sLjwVd0pcP0UOZs85uDhW3yq5YhMO4v88MqVeHKE4G9GMzITqjnfTVpsq+dB4Blw==
X-Received: by 2002:a17:90b:3890:b0:314:2bae:97d7 with SMTP id 98e67ed59e1d1-31aadd43c66mr426877a91.15.1751594032745;
        Thu, 03 Jul 2025 18:53:52 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:20ef:ef86:780b:d631])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457f308sm7578975ad.149.2025.07.03.18.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:53:51 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:53:47 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Minchan Kim <minchan@kernel.org>, Rahul Kumar <rk0006818@gmail.com>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] zram: pass buffer offset to zcomp_available_show()
Message-ID: <tgqiahkbc6u6w75rivbishixxq64wfzx6tucscaa3yyt5u55kc@ur62ahdhq4ew>
References: <20250627035256.1120740-1-rk0006818@gmail.com>
 <20250627071840.1394242-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627071840.1394242-1-senozhatsky@chromium.org>

On (25/06/27 16:18), Sergey Senozhatsky wrote:
> In most cases zcomp_available_show() is the only emitting
> function that is called from sysfs read() handler, so it
> assumes that there is a whole PAGE_SIZE buffer to work with.
> There is an exception, however: recomp_algorithm_show().
> 
> In recomp_algorithm_show() we prepend the buffer with
> priority number before we pass it to zcomp_available_show(),
> so it cannot assume PAGE_SIZE anymore and must take
> recomp_algorithm_show() modifications into consideration.
> Therefore we need to pass buffer offset to zcomp_available_show().
> 
> Also convert it to use sysfs_emit_at(), to stay aligned
> with the rest of zram's sysfs read() handlers.
> 
> On practice we are never even close to using the whole PAGE_SIZE
> buffer, so that's not a critical bug, but still.

Jens, do you feel like picking these 2 up or should I route
them to Andrew's tree?
