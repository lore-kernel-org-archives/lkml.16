Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C6D27C844
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047860; cv=none; b=e4iNl5Z+4zmB0ARSKkeZu+N4YU/gQK/cFtzhE+aD2r3+PEseO2WiwturUkXnoqHSXUX77aRcrM+wMaxI8hCnq1nAvxPeXt54txV35bYH8fw2SamMGSjhJEWvlzvMhLLVc1sOIPsPA64ENWzk9cGvYaB9gjO043vvVz86sbrulZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047860; c=relaxed/simple;
	bh=i+vwYiYS0pVOypAgoRmxtkSfZdGtVSsTRWBKtrFvEDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGMnMCqpjlt0fJRhraum5Ve30pCFhKRGklVjSy8jXIVFvMzaZIQVxYxueLZVb3swo4aHs4rFNSrnu9ZvYGZyLB7vMvHr5TCE6FSJEy+EVJ3Sh6OXPkIv2x1JrrXVDTiRwEBbeZ89/d8/swepZEneG6vJpF6NaK0IyQl1mkj9dV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=OvPCawOF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="OvPCawOF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf848528aso37348795e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1747047857; x=1747652657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=owXIYpMV48is7ez5i1gXva+BBfYXyghjaJTpHVBLlkk=;
        b=OvPCawOFhHG+a9M1lM4eEBD55Np3qYYEPEqPpSc8GiYS/1D7+EmssOrqqHtis0Kirb
         OZG4DYFBZX8esDV8Nqf2UONTbwDBcAJkPYrdyCD13/FOdzzX8ldrRDDif7HEpgMB/olu
         LF0QKmBpCZCgi4xKfIZDdlpuO6fcwqYPjcevyQTNdqPfCxFCXqERKwx7enccMPgUrv5c
         /uzgcTK/2AObTsuhE9/fB1YswlLfNTJ5SDd0FKMEQbE4jP34EcsAlMRJEhOMp6OT4/LU
         Ld0CNbtfhUQeE2Wktan2Llf7lYMSIQf8ykBac2RQw8MaXL3jKo2JUmSo93hTVzw6V2DA
         e/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747047857; x=1747652657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owXIYpMV48is7ez5i1gXva+BBfYXyghjaJTpHVBLlkk=;
        b=M9Lu8hd4CjI4F25yGI8DWrn0s1yDSWK6FPN9QjWyisqyqyV61b/zrGJ94AxWIl5mBO
         QO9RMWiqs6j+c/2wSQWBOEABtB2l71kXA1v4rEV6+GCrYIXsJ0kIatXjWg77aqGdsorR
         aY0NCD3lC+GgbZNYH6+Mx8vs7VtHGycHk+1L+9cFUbiGD4yYK0VXA1Rc+YPuvPodltVv
         8JWF2L2y8e0TRubteyCChY1IsUY1ifVEbu8d0w6MSKcwolNk8l3l1mRVCr5QckX1S1dJ
         J/5AbC+1/iwB60O9swUZcbYS5yMm7dBmHe58tDJKJldj0uoXlW7EkXZaG5kHeDzXWQkV
         4uxw==
X-Forwarded-Encrypted: i=1; AJvYcCWd5NSP+Y18r4c1cPZUEBomqyH4AhVDJf51afLpS2+V5BCiI2YYqdk1nodST4d/o6KuhZU70lkyiinS8x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfGHbXTxKXICYxJtWHWtTF3xkX9F8R+0srNhvbLHcrZxheGI2c
	1vKz0Rq47lNZDmdTiQFUA53DRD+p7iTsRVKk9OqEgosnEFhHgKyHlnl206dB1tA=
X-Gm-Gg: ASbGnctZkssqxNOkTfC37S41e5EpqIZhTUr8ywHwp/a9KlFFuZr6jnOXJLFjqUnxdUa
	3C9VJAjyc7x7ycUSdsIBn4C74/l7tMBwCTvXFjUNL6JSU/Peq8TvWpx8u+sliTBpNZv0FBCeiQC
	qwZlIFVRJ6zlxmwIH+Af5kK2tvVa6D03UNqTwntx7PMQIiifJw4U020ibA2uzU77/hnmBD1+Xmo
	LfdLLNN0hNZnksRTAzMYf/3pIqikpSI/Mls3V+FDH7mRmmo3syducpucFChCd9eF4M8QRaq4vTi
	TfbwkhyE8WUk1Zu19roTwSuI1sQ3Th2WrOexVVHg8lZbAg/oi0bn2FOkb9ScsvoHgCZUGgtnBKA
	uTjEjacPGvAu+Jvp9gnxgh1nyVpYwcLxV
X-Google-Smtp-Source: AGHT+IHt6KtmDpEcGKKweKh0TJcjcFp4HoRFHcwbArajIswm0eri9Tb2+Y1mCu2ksq4RGxW3FEMBSA==
X-Received: by 2002:a5d:5989:0:b0:3a1:fc5a:76ed with SMTP id ffacd0b85a97d-3a1fc5a77c5mr7258447f8f.26.1747047856657;
        Mon, 12 May 2025 04:04:16 -0700 (PDT)
Received: from jiri-mlt.client.nvidia.com (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm12321070f8f.60.2025.05.12.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 04:04:16 -0700 (PDT)
Date: Mon, 12 May 2025 13:04:13 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] documentation: networking: devlink: Fix a typo in
 devlink-trap.rst
Message-ID: <s73vdkwqfhzxtlqv5kqdkp3xxh72vgrkpz2l7y2755nzzyfqsi@wckiln42uwjj>
References: <20250512110028.9670-1-alperyasinak1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512110028.9670-1-alperyasinak1@gmail.com>

Mon, May 12, 2025 at 01:00:28PM +0200, alperyasinak1@gmail.com wrote:
>From: alperak <alperyasinak1@gmail.com>

This line actually screws-up the correct "from" taken from the email
headers. Avoid it.


>
>Fix a typo in the documentation: "errorrs" -> "errors".
>
>Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>---
> Documentation/networking/devlink/devlink-trap.rst | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Documentation/networking/devlink/devlink-trap.rst b/Documentation/networking/devlink/devlink-trap.rst
>index 2c14dfe69b3a..5885e21e2212 100644
>--- a/Documentation/networking/devlink/devlink-trap.rst
>+++ b/Documentation/networking/devlink/devlink-trap.rst
>@@ -451,7 +451,7 @@ be added to the following table:
>    * - ``udp_parsing``
>      - ``drop``
>      - Traps packets dropped due to an error in the UDP header parsing.
>-       This packet trap could include checksum errorrs, an improper UDP
>+       This packet trap could include checksum errors, an improper UDP
>        length detected (smaller than 8 bytes) or detection of header
>        truncation.
>    * - ``tcp_parsing``
>--
>2.43.0
>
