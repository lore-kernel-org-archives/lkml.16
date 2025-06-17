Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4613F28DB48
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145917; cv=none; b=s7cOGPDfAaPDgrpl/1KqCKiE9dJu8NqtPOULKTTa/UOLIIQKE3FG/weaDlZnUAB3/78tT6RqtiCJBdFG1NtNBrDuzCqSeeqEF2WbD0tM6gEyFXNYDeZxi4EG98Ue5WqMQZTwenbhthlN8SBVRgGO8l1qSGcaXxXAJHwFtvDLSds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145917; c=relaxed/simple;
	bh=8hre+ioZSV1ApKk0mMHgtp6YNV3r2Lv8bwiGE/XHevY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l45EsYroaiA+xL0FSfJ37pOgHwztxp3hMOfLPuY3VRMu9OF4DD3ojQl0WJyaotxS3bF/6on3aK/MbLXMatzKaIhIObyNJ0Wq8GYlaDUNoE/M9A0/q1annXeQ0Aegh3yv+luzW/kk/XQhuG05tNCEbv4al6U/gTVe6U1W6U//VTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZAFvrA8H; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZAFvrA8H"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so3319553f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750145912; x=1750750712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06WdrqrgwMt+XD3JlxWH3rD2dWkzuQMHj217UXJd1mk=;
        b=ZAFvrA8HheWATGw+r3/dK2tdOyWQDuFedteaxpkni/rcBlxdgd++CPXH7Y6nZMf0wd
         wkD9L15kea2H0sxy9YfJmNw0IMpfhw9smRFsAGj1MNsvAXkuGyP6ty/wsRtJg/tlSKy+
         3Tk8kfRzFoiHNFaaYeh0YSQ7S5yNkgMH64aMYFs7qkVym4l1SWFhKN9Tq4c9SSnH8eqY
         U46FWVAw3ihWfZbSTVW6DJdBaSH2o0K5bVQggXvqBxYju2NiXi/x7x/3hZL1j/uUTk6A
         AvrvFlr5rtRiipI+138Afw9eu2izvgYuZUrADc3SEMaa4qZv0qIRpoy3ow7DFAVZkKTv
         OZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750145912; x=1750750712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06WdrqrgwMt+XD3JlxWH3rD2dWkzuQMHj217UXJd1mk=;
        b=R5hmymiBpyjLYm05j2VDzVNIGdH/vwdckH69wal8jP/lQCpko/0ph/32poSDOqOi9c
         ksmlJ25UfvzWX9B7/zPVuMPOPEt3fHmn6qPkK2HnCKMjKoudZSmKjSgv2tDD6SMD64ak
         R5o44bImNaRsWW7Vyo11vjV2uxGS44jNV2AaOHOFhvMeaPLiHgpT5Bs3yj7vreLGko9z
         AA79Yq5UKVSljoGcX/yeJ/9/L/BHyYaKa9Kck67fuLSWIa1Y0JTx26yOT2YKP+iz3fEZ
         IM00kpUqm+4Up2hj0MJvSRBU64fOC+W45FrnCk7qUZl5i1YwY5JIgLuQNQYGmuKn1QGz
         FO8A==
X-Forwarded-Encrypted: i=1; AJvYcCW0s2xtuVs7kMJJtlWuq2Zi01pkKhb5LF+ZPJYm94DBJ/kw0UMKBjE8EXoez52YdvKjIvlYzg/NDrUx0P4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+IYxPMUdCdWacoyUhD4ImTY7ETSIZ/zEGY4px5+32zrbTXr54
	wlG9SNdCx2qZydLHOm6eyhQ7Rd+0DW0w2yHRBH+WmUury8nHUPaCqrjn6W33Vp+ogKQ=
X-Gm-Gg: ASbGncvwADOjLx8WW/D5NT1zx66Zk+ne9VekYsU7VcNxIx0vxUA3H/yJJ4pIb9XGeBE
	xmzmGX8AKLjn4ih2ZCoVg6wIozdB1MvQ06a9qIxJLVmborwTX1y0n7K/kh1IukYfceqxKRULx9m
	ztN9V6eppelMeV2XLyftpRlWrKDARadw9aFWv6bGFwhvlALJYx3OnVUdREhsVkBN+N+Du0sud8J
	kSGWVQDchjlvkGVkjb07cbLkd/xQsIhhGvRUtq5uuFk9wsg++bNaZelqumjtvpPBamU8/WRoXIg
	ojTZ2qe3D6CjZ3HfVqmbr2wx2UOqe93UozFck5/LJWbotDgWHvt8TboZrR5UtjHEiJH/c3XV3eJ
	N
X-Google-Smtp-Source: AGHT+IEsDXzygzUiu5hDuvAS7nNYSt4nrUBrznqidImzQhFxIgxXYCsglRc9gafDTyPOPS+m5grryw==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2653:734d with SMTP id ffacd0b85a97d-3a572e7a1eemr9910886f8f.28.1750145912511;
        Tue, 17 Jun 2025 00:38:32 -0700 (PDT)
Received: from [10.100.51.209] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e1838fasm164856835e9.38.2025.06.17.00.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:38:32 -0700 (PDT)
Message-ID: <87e3de90-ffa8-40b7-a81b-70f5e5b8af20@suse.com>
Date: Tue, 17 Jun 2025 09:38:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] module: move 'struct module_use' to internal.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20250612-kunit-ifdef-modules-v1-0-fdccd42dcff8@linutronix.de>
 <20250612-kunit-ifdef-modules-v1-1-fdccd42dcff8@linutronix.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250612-kunit-ifdef-modules-v1-1-fdccd42dcff8@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/12/25 4:53 PM, Thomas Weißschuh wrote:
> The struct was moved to the public header file in
> commit c8e21ced08b3 ("module: fix kdb's illicit use of struct module_use.").
> Back then the structure was used outside of the module core.
> Nowadays this is not true anymore, so the structure can be made internal.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
