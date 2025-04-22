Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8C91EBFF7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309060; cv=none; b=ks+yNxOxTwxI7f1MHfreSSRGwyRlIMO2F76aD8+1K+p/YH2rppx2SLiuzFV70HYlubBfv8mpAShD9jpGnB9KpnDpLDBHXnwe+iTvCnQA0A55gApq7LXoZFzCBIP5P6+J/s2Vj5ubMJQZhAGfv1IpLncoO5gYXnjvqKr8xupRJw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309060; c=relaxed/simple;
	bh=YJ5ust15cgiLPQ19Llb8Yxmg2OdhLgYoabERjHZpRUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAhfUUjRdllAQuzgcO1P9web6oTrDbrJBhxQe5qnVXdLpszKdQlGvYHajc4w39dhpoRObgkyCh3y6ZEMU0XicYqC9CV7V87DRg/CmjTmC/6u9YGosh9+gAUKf9EhRAkrQduj0vBhM3OnzyAQNvKrPjohBTEPEgQ4+P4cTXhKTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkC/CIuj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkC/CIuj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3350492f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745309057; x=1745913857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIQ4PP9wG4Vz2xc0LFXVcoklKGB+kLgAg0ewlEvxW4M=;
        b=RkC/CIujYW4393EfnO3k55cJA5rUvl4/+MzteaxfWSuioObBRrb9q4C0UNMcbFxGp4
         ysC+Bty3n8U84UxlhJCNGZgMuR/J4kynaB9wWcGqYO2SkjsqPVJw11DKVtYAAU/jMGZW
         hj+apzwbOHeTkOMH6koTYoh3IuiuGZWWOXCbZ+WYkqz0nf3VN8m+4lw9rzA7e0hzwJ94
         RqVAjYJDv2FUfYQmOsTTNPVT8OZNBuFMg+OMHtZsI8SRcUOwJ8N7A1sduzd+QS6kACr4
         9vPcsUUucwGsHW4CnF2+IzEpjM8aReyI4zkDRPi4LqR07jXTF6uTG3/vYqvegGuyB3tO
         VDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309057; x=1745913857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIQ4PP9wG4Vz2xc0LFXVcoklKGB+kLgAg0ewlEvxW4M=;
        b=MBXTwajZ7Ll09/SwwXGp74G6ZqTPd5vr/Fh8ns/vBuCZtvi2RE6styqdz01L+3xHQK
         Qj4QI58x3ol9niDKMzMV1a1zSuD5IpELkJWXYEJwuWKX624fSh7wlrW7qZsDlA7tu2Xh
         F6xeT8FzMBgUmiZE+kTgZ7a3MXJJGcfDQe2l+weAFGrMMfa7/GTgOXf+Uygrb0676ndP
         n4PtNmOLSbB4GwSJs0ic98rfjttJniL6Nyoi1S4hC0lWTweeK8FXMk0x7jUbtxvA28Gh
         HvqrGAYIv/EYa4VaG1ToGigtKeKtXQKqMbYe06RxhU6uQK6RJbZcGTtVgthp8XUdG3Ve
         GKdg==
X-Forwarded-Encrypted: i=1; AJvYcCVcD93TxmHYXk/PJqKCYY2AMCzoo7fGA9/ZkF53iBXwutkxk78XyRSh1WvKu0HYbWRwQCYAiBi/rprPcwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvWPCeqUW804ncU8poHgGVWWD/LOrm3fpcqx5VVBy3Dl1Y87/Y
	5wF0dO0D5YqmT5F10SSArdG8/ygi8ItLqu0p0dz2FXSu/jg/IToPoaxnSDJnYfo=
X-Gm-Gg: ASbGncs8OCsAvOpqSkE1kRLGfb+X10DoxFgJIOc6AOzQf0s+KB6bd17ad7m+TASUac4
	V+oEtFfMFBSv6PS/49H17oqTGUkGlqRiGy/pyqnYLv9gQARBoTP3n3qmihDGN6y9T7g9DKJeY7u
	y07EbFRA7w0pnpoAxErc7wGX5JJaw4WFpKapLNW5oD/3Yc863l/A4q6q39az1OFaxlQBiS/AkuR
	SN3VyFkCj5qTDl2xc+qrDepxCBHX1q/BSxnLuJXmP/h8m5BlWDkKFLeJn/IL+8yxBGFPuvZrcdg
	/6HtGMSMlw9TSmaWf1mWhLePk93A/0Q4FwTm/bJ2TwR6psZTppdhVv66
X-Google-Smtp-Source: AGHT+IHr33bB7haku99h9x2iuyH51ldW8W+dBOIW1fajfkUYidpN0vXAbVL+B51YDs7qeUHWyJNcQg==
X-Received: by 2002:a05:6000:188d:b0:390:ed04:a676 with SMTP id ffacd0b85a97d-39efba4b204mr10956448f8f.22.1745309057390;
        Tue, 22 Apr 2025 01:04:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43315esm14111416f8f.26.2025.04.22.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:04:16 -0700 (PDT)
Date: Tue, 22 Apr 2025 11:04:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: atomisp: Remove unused
 atomisp_compat_ioctl32() declaration
Message-ID: <260a005d-a1bb-48d7-89ec-ed1b6b151b4a@stanley.mountain>
References: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
 <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>

On Fri, Apr 18, 2025 at 12:48:18PM +0530, Hardevsinh Palaniya wrote:
> Since its definition was deleted in a previous patch[1]
> and there are no remaining users of this function in
> the codebase.
> 
> Link[1]:https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@kernel.org/

Instead of a link to lore it should be:

The atomisp_compat_ioctl32() function was deleted in commit b4c650f1af68
("media: atomisp: remove compat_ioctl32 code") so delete the declaration
from the header.

Please don't say "it's" to refer to something mentioned in the subject.
When people are writing commit messages they sometimes treat the subject
as the first sentence of the commit message but the subject and the body
of the commit message should make sense independently.  Look at the lore
link you posted above.  Can you even find the subject?  Most of the time
when people see a link to lore they'll just read the body of the email.

regards,
dan carpenter

