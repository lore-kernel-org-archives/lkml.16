Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A381DA634
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811979; cv=none; b=QUaRz6QVr7uhFh3p5p0/qxNGUG93MfiN7LCcsdIFIfoSfyplo/36YQX0MjtrKHo0P79hhtury6tXOPs5j46fL/BdzDAhiDERU47MMPEeHNKBOU3H/kBBeedFcb1f2K888AdF/stixnjsW1PEHxtDH4/mwNaeMNdeDL2JGqiB9A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811979; c=relaxed/simple;
	bh=PrXWueJELQClhsRoDZoa/OuljX1rJijZLuQXa9z6ewA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ef9EOKI/KpOx/sD7Fnc4ssKla7c/U5MkJKTADjdgvWjXXCmcrGgmGE6Z+hl6/NhJATFlHSejSbQ1Nh2/AAdbsb++Zs+YCoL+CD5jqQsenm+mCk0yMSfuNtbG7kjFU0XRC0wFooU+VSAjwa+m155CAsuLrle/0mQixnk55FJ720s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VQgfCytX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VQgfCytX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso53727925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744811975; x=1745416775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D58Ch4hi8djKlPVHC4ID+DAXWkOZ6h8jrefgNN0XtNg=;
        b=VQgfCytX2s1Rtn5PSnv/YDXAGdYzskOhaEv4pnJ6l9klesECs6JZnOdKPm8SF2p9MB
         uEiVPwqLy9zN2HOSf6P8E24p9FfeX2/j3fhLDjS60yLpCDfcV5hr9rrw+TRKBiuOzKfc
         /fF595J/1hsQ/XKGM8MdJhvmGPKxbRCkKwMmTg6XtELXemfJldMx5HGhx8JZ9sOmrh40
         7dgoO7B1/pvkb3vJr/7T1gG05WD/lbMNG7LPBJnK64WZbS5VQSacP9hWLWM3U9HVo5rn
         6J6wxQUur6JsE3/jAukmCNeHdHDzNCWJ9dIQj04LSNyhd2D7t+rioARz4WG9D/sEIERl
         xDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811975; x=1745416775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D58Ch4hi8djKlPVHC4ID+DAXWkOZ6h8jrefgNN0XtNg=;
        b=C724bCkRC1MvzJzegllVJfdq/f6Z52AGxJMJ78TkPt5yWpzH3mnahSBiBqCRdIvJ2J
         jw4mlnU2Tar08YyypgQlF7bcI97r63KEujftPcyyDtwJnJFt5CVKB2GG+JX0cH6KqcmU
         LFfZAAmscvH5omlrhUkiNxydmV5CWXaUxN0W7+vPiEDUMx7FNy6h9Pzbwx0fNtKq2eoN
         ZdSuOpZgP2+nP1cKksAO5T2igoMMB+pxNHalAn3azNuUIPAdXwQo1geGaLXzflQ9/kr6
         6AEs+DIB+4vhfnmGNesMh6kzFZoikgz9YYTxhu+sW0BoR6TYiQskyPA4ybtHNjrCxfr/
         dlDw==
X-Gm-Message-State: AOJu0YxGqxGm70aKU9UIzJrWPrF/IAHBn7Zc1xuyLrsT68mEu58nHwfv
	3s5pims/dT+ai41M0wdW9paqGF5U7A9C3B6fDFzoAkEgw0wSfTUiq1AnuQ94Eks=
X-Gm-Gg: ASbGncvn2R2IqnvvMOmZHqW+g07Sz4jL2pU/+qzGn1iQmCKL4zUzwuGF6IooxaOPvcI
	2+vcuhaieO7MsQXqO8yczJ7z6I22EhE/akJmRdI4QVvwkGMZ8g9dZi+JAK/6tet/dS5UgzCSEcq
	P08oNXXsDXpWiSpFPzCHEu3chtBuiG7KO5s9AgaoyzRwiPzlp+fhTdqzmqYfcIIrGvoeAGHwPb+
	S3JbF3zjhM43djOLdJQaqXGGBWNl1QTu3VmoLMFdrwA8IQaubN7v9qmK1v0bPokSVQhhAaokVN2
	SU6iFDvasc/jD2n20s3/6dwmfgPCwqxBHJSR683o0us=
X-Google-Smtp-Source: AGHT+IHTIaWFA3QfhyJicogJ8cBkQ/je47l8+mLeE8Qjo2zZQg1uZN/gNAJBrvAGrFgjsLsXF8IfqA==
X-Received: by 2002:a05:600c:1c04:b0:43c:fb36:d296 with SMTP id 5b1f17b1804b1-4405d6ab656mr15696095e9.25.1744811974863;
        Wed, 16 Apr 2025 06:59:34 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58cc4csm22365265e9.25.2025.04.16.06.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:59:34 -0700 (PDT)
Message-ID: <de64c91f-efd5-49c2-8e24-b41aafe800fb@suse.com>
Date: Wed, 16 Apr 2025 15:59:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Properly handle module_kobject creation
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 code@tyhicks.com, linux@rasmusvillemoes.dk, christophe.leroy@csgroup.eu,
 hch@infradead.org, mcgrof@kernel.org, frkaya@linux.microsoft.com,
 vijayb@linux.microsoft.com, linux@weissschuh.net, samitolvanen@google.com,
 da.gomez@samsung.com, gregkh@linuxfoundation.org, rafael@kernel.org,
 dakr@kernel.org
References: <20250227184930.34163-1-shyamsaini@linux.microsoft.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250227184930.34163-1-shyamsaini@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/27/25 19:49, Shyam Saini wrote:
> Hi Everyone,
> 
> This patch series fixes handling of module_kobject creation.
> A driver expect module_kset list populated with its corresponding
> module_kobject to create its /sys/module/<built-in-module>/drivers
> directory.
> 
> Since,
> [1] commit 96a1a2412acb ("kernel/params.c: defer most of param_sysfs_init() to late_initcall time")
> Call to populate module_kset list is deferred to save init time so that
> external watchdog doesn't fireup on some boards and Linux can take
> responsibility of feeding watchdog before it spuriously resets the
> system. However, [1] this fix caused another issue i.e, consumers
> of module_kset can't get related module_kobject during driver
> initialisation and hence can't create their
> /sys/module/<built-in-module>/drivers directory.
> 
> Consequently, [1] breaks user-space applications for eg: DPDK, which
> expects /sys/module/vfio_pci/drivers/pci:vfio-pci/new_id to be present.
> 
> The second issue was reported and the [2] revert of [1] was
> proposed. However, [2] the Revert doesn't address the original issue
> reported in [1].
> 
> This patch series addresses both issues reported in [1] and [2].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=96a1a2412acb
> [2] https://lore.kernel.org/lkml/20250130225803.321004-1-shyamsaini@linux.microsoft.com/

I've queued now the series on modules-fixes, with some minor cleanups to
the commit messages.

I changed the "Cc: stable@kernel.org" tag on the last patch to "Cc:
stable@vger.kernel.org". Documentation/process/stable-kernel-rules.rst
recommends using the latter address by default, unless the patch is
fixing unpublished vulnerabilities.

I've removed "Fixes: 96a1a2412acb" and "Cc: stable@kernel.org" from the
first three patches because only the final patch contains the actual
fix. I suspect the stable tooling should automatically determine the
dependencies in this case, but to be explicit, I added a note to
stable@vger.kernel.org on the last patch indicating that it requires all
other patches from the series.

-- 
Thanks,
Petr
