Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D819E7D1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670189; cv=none; b=bNgNTtC89hwgUy2+Ksy7ZgyFIYP6O+hYta7F/anmxnK+IjVK0Cxa14y74FWTecPXpkLctR/7zwl+gk14BNuspyN03jQwROLI8bWFnNIwouS0pgmFrvBwFdN6xBEWZRGYcYkGf2yQl2gIhq40xk+VX9Hh81lq1KKURH0dwI3PueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670189; c=relaxed/simple;
	bh=soxayd4c4IiDLMOfZJwndk9fJPj+0hKVhHlYZta+Z0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K1tCRGWx4JcudeRdvHExlyAXj18CLOeLkRQKWFqFxVycKlrO/JJX6DV6kkYq1WNL1xrwyPitGWKUneK+UYOXMjXGMFq81kDexIn3CH2yhUB/WHKhOGy1L8P+bNZayTpzOw0hkOMXUhmm6c1q+993nzPyRmgFyD5ly7uDn5kRTa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AkomH2ry; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AkomH2ry"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so3657475e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670186; x=1744274986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBu8J27ftlzEshktz7zCJQ/1Jp+jqvvKxGVjR8a7qWQ=;
        b=AkomH2ryrfE8NaImqKT6rj+SR2M0rg/pv4t/xEll6/xyBDSfbfNUyHAj/tSjWlHAfy
         m36HoUSiPMkl4DnD24Am6IfFAtYh3J0jM7FiX2rPE//GdPjuH04LdIXxKjxCe7yikbkg
         iE4xQIysBiy5Q6YtgWCuWCi4MiNeWnAmjWVVvJIEWWZVgJAuDHlyYAZPPGl+coOLZIid
         E+tyjj5CZFuwN2YOm00Om7WIsGkABCmR6wEbDTegKoPVkgXY4KNnwAw/FWWvfwmBxLKy
         qMiKHlB8Ja7RO65Y5T2u0du/NPPztfiL2R216kuQN0v3Eg1LZaViZ3IpfGh8wpwhA5YK
         1+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670186; x=1744274986;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBu8J27ftlzEshktz7zCJQ/1Jp+jqvvKxGVjR8a7qWQ=;
        b=pZEkERqcTF0W6DTk7LvitH+/uJe0NWfwWXdTqFdp2Cuoa1aB9mZpE5JSvGa6odYdvh
         dlQcqpLZ3mOhvnKVQLn7D314WjAjtQEksL72sxTqpF9eFkEUJm5ySKN2VkalcjpsDFYq
         9d/ofS0ec/PS6lwUSpRv9iECGNbtQJVK5GIvjIUp0/Qshgx7xcDt8zTSAqLRGF4xaHWA
         qW07rpXqDSn6qIAKL+ElMeQALXZYBvTMIEycE5+IV9K46xtionuexgKpgGSoyzN8ZTFu
         edKjLPXcmGXhyBjJZuvGqmZJVzG/GP9om/8CO7dF48vWcok4yJUJxrjMEtW8LB9DjQAr
         i5kg==
X-Forwarded-Encrypted: i=1; AJvYcCV3JOylJobBcHN30+YfYsBuZHb0/FoB4D7pNlS9yo2k5F8fF6B1eupB7AEK6YPKTQ5GEx1Yo19jVuR3rf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3LFU1ZjqijS9ewb+9Td4GkhS2UA6lsx7PcNsRfqBk/mVHceD
	KLfS19K2/8z0b75LEI3dUQ3KwlmcyeRHo9kTWoC7rxg/ceE5j21sI0GmDGR8OlI=
X-Gm-Gg: ASbGncu7ifphgqUWrwa4t4UcaPnLSgWWjSWsQ+vBs+zuU4wNfnU+tYLdYo7cSgRc5p8
	q6F39OYlMe3k56qwZjbrkV8mbUxPa2Ep8Zs2ghM4ibKOTyYHB2bRIVIR4nJ6bJ/Ko9JYamaVxZx
	0tQ/rOQny886HB2MCdpFW4eXUPGsqPdByB6/prcaW29l970xcTgmmsSDitVQVmaw8cnlaUFgYyC
	s2lxpXmTbHhrpFGP6okmeqayn6WwAwjmPw1jhtgKt92Infk0o4p4yRn5pSudI2lfkUn4OFGG+nz
	K5tGbPW9KXjmjJIT1HVM2umvDgz77f0XYP4dwF++0pSQ0njb7KW8ryaAmdzpeYU+NQ==
X-Google-Smtp-Source: AGHT+IHXc5iNcd+rK/nAzT2TA4Y/VmWE4yJGK6u8qDCUGXOzUoFZeO8r9utVgQgnH5ORrul8GFjY2w==
X-Received: by 2002:a05:600c:1c22:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43eb5bfc50cmr55015725e9.2.1743670185785;
        Thu, 03 Apr 2025 01:49:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364d07csm11578105e9.28.2025.04.03.01.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:49:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
References: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize the memory size
 of clk-measure
Message-Id: <174367018513.531300.4479678290582017713.b4-ty@linaro.org>
Date: Thu, 03 Apr 2025 10:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 05 Feb 2025 15:58:43 +0800, Chuan Liu wrote:
> Drop "CLK_MSR_MAX" and replace it with adding a member "msr_count" in
> the structure to specify the count of msr_id.
> 
> Mark the table of msr_id as const.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/drivers)

[1/1] soc: amlogic: clk-measure: Optimize the memory size of clk-measure
      https://git.kernel.org/amlogic/c/37021be47d02d2913d6767795a6f4c72b4e63a4f

These changes has been applied on the intermediate git tree [1].

The v6.16/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

