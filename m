Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3571C1A83E4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496939; cv=none; b=CLaxmVj+V3QoLAV3s+OBJ2wOiXEY1EFiUh+jafTOL7JSHvdfASwG7nkmbhDEZMhFW+tj+GALxGOj0ZI/RAlrC9cLDzx5xWrdWXIWvx6p0g5N2huzIcgUHKDwozWRxV2Mw3+jatsOkUz0eGN2CjAXtVZecgexFyf3xtatOL638CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496939; c=relaxed/simple;
	bh=YZaFGvCMIQsb9PiOlDNBsJxEnKn9JVZ42AOxSWiOBio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrRNqy9ak0ld5ZkTtsd4qntgs5YvgzSiZyKNnAWkLqofwM2Zi3N4thvHkeRZaGvOCm5PTcgNI46W+mj9osoSufoc2kxBZPEoOcAfBOAJjhvxVDSWbFsc6KFK/Om40l6LNPjZ2qrbQKRYoOt6OMiyCP3k6yx37akJIoY6p8IxnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cWjLRqC6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cWjLRqC6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so5759696a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743496934; x=1744101734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/o5XWa4l5gUPNjznvgYeaHUgYy/EIx7woUA0k2Kxd4=;
        b=cWjLRqC6ixAcOGJxfdXoRS/I/MNJGbf9o/JnezkRCs3AG96uJ82EBjOxUYA8+L/sGH
         mASoRU4SsCfzTcGB/uBGcvRRBgPdCIbp/IDmqaCQbLZLj5UgO/kkKm2vJF5jKE2pvBAE
         zvygyzQQQMOGsnhlEO8glXA/R9LYo0TTtaDR1T5o7l/5m4VtUknK3admVC7nAkbUu6DH
         rtKuJD2lDZ96P3v/6lLr0JHa9Uf0xmoXp3ckz3kiSAbZ+0isarp9Pn579pZHy80bNYce
         lI7sp6/czGmbzuJwCSV/GPrgPH6ny8DJU0p9uVgpD67GgRxWkY8UhkgiXpXiyyzl8F+Z
         TLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496934; x=1744101734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/o5XWa4l5gUPNjznvgYeaHUgYy/EIx7woUA0k2Kxd4=;
        b=n5H3AtDNcooa5clbQkmKqOJ041ahrPcxGM2+l6J0gfl/pg8tsgjAEes5+cOROHICx/
         50gJ/i3NXHsiJc9+EEf9LwCqhsR1O7wBN5hlRmRUeHb6wwN1I5Zu2IH/JwJONAHkB6aN
         SgEyhTxF2WZBeehV7S76Dng674YZ1yelXVUkuZirx4JBlfj27Gv0ABqFytfOq7U1CNNZ
         l0j5RPq4r5ZK13uuz45T4/+6AoqYvWYSXm4hjtM+Y2SzY4VOpCKKoznmfXXJ2dim4f4U
         QeFqFLKH+F9iTMLeSliNvpizDzMmYchx1lwYvD7C/ToNnVBEIVgxyPAZbiPtXMALzaya
         94pg==
X-Forwarded-Encrypted: i=1; AJvYcCUmqDsUUh7n/Ia1zJ70QimSmGNxDfbpEQsY1gdESMuTsZNuQ2NUdyxRp0IK8vYLu9CgpnaS5AIMZra+BWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVRDEbTRXWdpju5iU6XF/qv0AaBFxc5j8RJTPMoQS86po1zDaa
	EXkuybIvHPNi0KOZhhw2vfkTItNCDZtpIdsHJHtqvB5ShAvoOJ/wOJmEUErqadrkehTsXkYVJ6b
	T
X-Gm-Gg: ASbGncubK3HWGcjAKKgZ/vImcszaF4j00ccmVBS/1QEg9HU3lECCxzHBvdlwf7W1UNj
	87oCu9RFyK0FzhEkuHNN5E46fFu1blWK/vtkH8BAHgewxLy2LUWcjL1CZPr0z7RDHEH3K1+A7tx
	Zr1ocI9LGFh9prZMJcb1FLTF76IOm0lYQFMVqXHEtGJx1F2Va6uPVE0cVsb6F/YRyP2zws01CJV
	WESGc01yCbe1/w8TJZr0HQX3ZiJf9YxMUN5ODnNqUfF2TGF+6WVVNfKjDANzVdniLTe5SERS0Va
	ProSWmwAUeODNHHeVLLGSLKkEQ4rUEngItOl6/UbQESomg==
X-Google-Smtp-Source: AGHT+IE4hKhywGcQobvbzoNbXf8Bq4/ZS+8/xXWXD5AUQUwrxFzCZds5ecBjzn/9IMrH/IQA23YLQg==
X-Received: by 2002:a05:6402:84f:b0:5e7:87ea:b18c with SMTP id 4fb4d7f45d1cf-5edf6033e1amr9834137a12.15.1743496934489;
        Tue, 01 Apr 2025 01:42:14 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc16d5077sm6779970a12.32.2025.04.01.01.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:42:14 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:42:13 +0200
From: Michal Hocko <mhocko@suse.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, bpf@vger.kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org,
	akpm@linux-foundation.org, peterz@infradead.org, vbabka@suse.cz,
	bigeasy@linutronix.de, rostedt@goodmis.org, shakeel.butt@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: Fix try_alloc_pages
Message-ID: <Z-um5bWEjfmH5XHT@tiehlicka>
References: <20250401032336.39657-1-alexei.starovoitov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401032336.39657-1-alexei.starovoitov@gmail.com>

On Mon 31-03-25 20:23:36, Alexei Starovoitov wrote:
> From: Alexei Starovoitov <ast@kernel.org>
> 
> Fix an obvious bug. try_alloc_pages() should set_page_refcounted.
> 
> Fixes: 97769a53f117 ("mm, bpf: Introduce try_alloc_pages() for opportunistic page allocation")
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
> 
> As soon as I fast forwarded and rerun the tests the bug was
> seen immediately.
> I'm completely baffled how I managed to lose this hunk.
> I'm pretty sure I manually tested various code paths of
> trylock logic with CONFIG_DEBUG_VM=y.
> Pure incompetence :(

I believe Vlastimil is right. This seems to be an unfortunate mismatch
in the final tree when this got merged.
-- 
Michal Hocko
SUSE Labs
