Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12B2AE99
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738568033; cv=none; b=X/4lMcM+mmVnMAafHST1RU5J7ZE3ANTUJFf9hR2Qrghoha16w7bbNn0zJLKDmMqWf9PVePdRhh8H2uQJ+B9PeECzb9RMrx8BdbvrknzsymYihB/oyLMeRZMFhnOPBwX0Of7yxcS8Ri47z875sknK2TYW1DG97NP39JszsSAnlu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738568033; c=relaxed/simple;
	bh=Jj/hRMDmDXnXrhZS3NssGeD6wphlksWNKFrgYRQaXNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld36GZIAN2QHZjAiURQHbaNs+OrlND/5O1Y327G6YFBnRZd49VGdSQVW5/eTUjNGfGnJTPHrIn62BCp79DjB8ob7R49hBr/KtE6vQcBmxAbzfXKZDdNFaATNAC0VoTn9Gs1lOJBFrjhTTGG29rIUPQ92HSjIuWSyiRCXSAtvz4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bc6jQnZB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bc6jQnZB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21619108a6bso66015095ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 23:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738568031; x=1739172831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJfkA+01mQ6EVVESyvoLKvqknr3twqf0+1+MEvzJ+2M=;
        b=bc6jQnZBVZujO3KZSj70raHI4zxeALqrh72xihHCjp/C43uUj5geLgjyAIuO0RZxyg
         fDwBq4bMyylkyt9E7LLG/O4oMt/+EJLI1RQE30A0rn64ZspiWqhQsbO+r9voUYvbYKLS
         TLG+rUb1BOZdjhgNC9TqoVhA9I1ZF9/MlDyAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738568031; x=1739172831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJfkA+01mQ6EVVESyvoLKvqknr3twqf0+1+MEvzJ+2M=;
        b=LOZ0g6kIEv8hzWjm3LbrcYJbxVbKTDew+Y9KoY07I92Bjff1ATJ2127hvXTJIYCl4N
         64uCRMSjVD9i6NltpsFNDyrdikmJYxBrUvsjheAel2FNF4+4r5akakK2U3+EAmeJPB9g
         u135uGHz/Ju9csud+40jbMRw1azlZFmRvG1LsAA1pAcD9UAwYnhyTcvye/jK2yazWtnA
         6AjTw7TX6xWcYHZbKsoNNC/NxwnSujzJ687NlCoADsoaOvGBOhPLaydh53h73qnQorz8
         i0k8LuuQIjaIl9ocw0zjLku1LCBxGHAt5saxjilSZbY+IwtDSRfvX6++3sBbg2PoafXf
         DW9g==
X-Forwarded-Encrypted: i=1; AJvYcCUwOfJzlQqDETSWCLrMkuDAHe/OxqKq3NhzHyoOnjjGE5Rt3YSJNkDUL8NrTF5HFeU7YUkgLgItg0F7c8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwhHSQfIM8fMyJh2S7GevZMJtuGkm262fmzRiJ2P2fPkMnfaN
	T63P+rg8Yj3mkmK1KnB7bic7fHMlNK+qt26AZE34j3oZUHbXPiFSbZUU02nc+g5V2EDbpePPupQ
	=
X-Gm-Gg: ASbGnctglZ5Dt9/mSeRjhLnokIWdRc0cQimOP8vl4n8n/rdKP29B0GixYpZvPtCNGX7
	0NEABkkpHlWoIn29PHYCKVyDP7/VITvtqczHip/bhUdJgaEAaiKsHfl8bwQzzXjgYEnJeiUHLjE
	XO8LmqNeGZ8e/6bXfX+h48nLsUVMv9NrThmMtgx/umXRxkjFn+iJ5KCLDcmB/3exQn3eE3ZXMdE
	AgXD/tX6cnasdzVFM3f93YU49wUFwWFfWQy9qSiQUCGETReahsRW1mjMSOY6RdtmPGb4t3T5L9S
	bJh1YLwGj8YKrcbJKX8=
X-Google-Smtp-Source: AGHT+IF3ekMna+p43DL8JMvqxAKOopd+67L5PUwuL5LwL3lP27QGKT4BD1U9e/tlYlmGrzbURr1MsQ==
X-Received: by 2002:a17:902:f610:b0:216:4348:149d with SMTP id d9443c01a7336-21dd7dfb835mr371643895ad.53.1738568030902;
        Sun, 02 Feb 2025 23:33:50 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b77f:f2de:f99c:2d0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f832esm69006695ad.83.2025.02.02.23.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 23:33:50 -0800 (PST)
Date: Mon, 3 Feb 2025 16:33:45 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <aytjrf5gxj24aharhcseknz65sivyhzsjcbutqbmco4wqpu36v@htnkuyarkora>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <dj2k36obadhbxlvecsdhdyf7edkmtgocf55jkbiq5gbnpvkygt@mcwolkrhicvq>
 <cr3ekbanqyzmeqeohwwlfqyced2fvtqh6kzermiahm4blonhd2@fod2itisib5f>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cr3ekbanqyzmeqeohwwlfqyced2fvtqh6kzermiahm4blonhd2@fod2itisib5f>

On (25/02/03 16:11), Sergey Senozhatsky wrote:
> I guess where we actually need zram entry lock is writeback and
> recompression.  Writeback moves object from zsmalloc pool to actual
> physical storage, freeing zsmalloc memory after that and setting
> zram entry[index] handle to the backikng device's block idx, which
> needs synchronization.  Recompression does a similar thing, it frees
> the old zsmalloc handle and stores recompressed objects under new
> zsmalloc handle, it thus updates zram entry[index] handle to point
> to the new location, which needs to be synchronized.

... Luckily there is a trivial solution

---

diff --git a/drivers/block/zram/Kconfig b/drivers/block/zram/Kconfig
index 402b7b175863..dd7c5ae91cc0 100644
--- a/drivers/block/zram/Kconfig
+++ b/drivers/block/zram/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config ZRAM
        tristate "Compressed RAM block device support"
-       depends on BLOCK && SYSFS && MMU
+       depends on BLOCK && SYSFS && MMU && !PREEMPT
        select ZSMALLOC
        help
          Creates virtual block devices called /dev/zramX (X = 0, 1, ...).
