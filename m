Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29E260564
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691501; cv=none; b=HzOFuz0KW4mEFp2KcyPQ4P7TATqzyC10EWiSbOpwtpS5gYPWXfUn4qOXV9MlYYUeMOkL+xe5npVKdeUkGYHEmKbv7MgM9ENeOaZqSpOwPpfgRGL4p/tAiLbCQHg5KASH0KSxRgXU5/gYYMGZgK3qBQ3Nb3HJOl+gGcqtXLZLFVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691501; c=relaxed/simple;
	bh=krRCsWrNfrKCxYOojzIZfOP3DZ0qa5HblAiRJBWE6Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCh99IE0xjI0F0RghSQ3gWOGLJyY9ROO89jxJ9PX7Q3ozsTXzUsDgxh/2aEIRRQTSkUQK7OwvKZz1ZIT/HVbPLHARqvb4g84Ik4Q/uXLkRFiz4uC3RXxQYFF89vMKSBhI/pr/UYoi9eRBeqV/fVTx61lxH6xQzJJFD4W6k63wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jx9eiCXX; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jx9eiCXX"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c47631b4cso2704553a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691498; x=1751296298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krRCsWrNfrKCxYOojzIZfOP3DZ0qa5HblAiRJBWE6Rk=;
        b=jx9eiCXX3Vslax2aXpv0mV5A0jU0Ad72jbfxR2Q5ytUgdRI0Ny/3ef9MktkV0RQmKs
         lSB5Qi5WwjZqRM1URaKDpcgfuKi8MAOt64/B7BAk35nw21stwYm/wE66/wr7EjA6Ey1V
         79x1d9ikIViA5E1KQQ6EFy+tYUkzb3FTPGCEae8Cg0sPQdKHVmfoxRsRGTkyE0rZg7vJ
         JQ45wD12/9gMpJh+jeYrqPC7LR6XQ5oQzpRuai6C4QjtGQ4c5JB57x2QxT5Mb72QgF2R
         0S8X+LVBPSamn0JAroZNKE28lH4MUrkNfP4OxNi+7mGwKCftfHQ4QC05rhjUZdfuVhvf
         23tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691498; x=1751296298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krRCsWrNfrKCxYOojzIZfOP3DZ0qa5HblAiRJBWE6Rk=;
        b=qOi1DIMYQKGCjI07v9cTfnVzRY2JPQDFii/UzXx7+DkNiVT1g5wpsoEgYafHUw1fhB
         eINXo0oW2OH8RkRr1MqSJ5YjlxdnaVXxrsjd2sg9w1R8qOV3eYMS7eVmTfIQQ3hDSxLx
         +HhpOcCMfDC7hwZZcodL4P1cjzVeqvIyaLsUHHRMZ1nQMjVSZioKInMuHg96VUSoBAYR
         8Q4WmYrm+1xs7yFlPauc/DMTLuYq77/xQNk0P7GADLDckBbw3czmgxG0Wp1tYzwPTbXW
         1HgICg8sGEMqVdQUnDHG8XW9eLKdYpoGMlaF8DuzNgYNBrP8vhkHAiwzW1cud/WlIAfk
         F8sw==
X-Forwarded-Encrypted: i=1; AJvYcCV2C3XfQ76h2gJpA9HBSVu5KY9Wlbf3r2fYoJ5RfAg/7ciohrJoWKumqw7AIJy2zO9mXTzWnoWsRTBE1No=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuzdX4NMqfzBlVgUVaYpdy18hMWKg3iw0+x9uVf2GnbhvEgcPe
	yz1Urhk5K8FAcvBIj7AZUcNzxc5CAd9/E9CNM3mmWa80Y+wqY4mla+0YWAh1uTC2J/k=
X-Gm-Gg: ASbGnctRpHaQ6DJlghY7/MZr31IsMuFQeoL6NbMdyDNCGqMl896hJO5m53pnedu6jEK
	u2vxtKtXnjbJ5OR6U5W0z0xrHdO2VkMpMryhZBu+1mJYVmFqNNoztIkMqMLIlzCLmz4P8M0h/DV
	LYM/u5bQqp6LJLhzP47WOebPja7quP3kfXIQf69P11voDzXUzeXAK4tIhLO6n+++ELLd4JUUDXv
	W1HY3h42ULK9QeSmEjkLWLWbvUS2ysCB09W0EhhDh6cbM/OmP75a81MGz7jnDwAppaiZhTxYsdq
	kHgwgWCj4yJrqzxFWmEsNsog0nKI480QmJtsyC7LyanIJ9Gm7f6OHM2UqMNc9MV70s5rpyl4rcs
	TCRe9
X-Google-Smtp-Source: AGHT+IELirG4o2TKMYqFSyVKOGaMUS/Yaj+K5xx64PHXSKKKnC1whBUE4ptLC6neLxCCL6RXUWk6hQ==
X-Received: by 2002:a05:6830:7010:b0:72c:3235:557d with SMTP id 46e09a7af769-73a92069c56mr9889012a34.13.1750691498690;
        Mon, 23 Jun 2025 08:11:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90cafee2sm1446021a34.55.2025.06.23.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:11:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:11:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com,
	james.morse@arm.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/resctrl: using guard to simplify lock/unlock code
Message-ID: <d07fe2d9-3548-43fc-b430-2947eee3145b@suswa.mountain>
References: <20250623112540.3581675-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623112540.3581675-1-suhui@nfschina.com>

This seems fine to me, but I don't think anyone is eager to start
reviewing hundreds of guard() conversions unless they're in new code
or part of a bug fix.

regards,
dan carpenter

