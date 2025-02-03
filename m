Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965E4414
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738554780; cv=none; b=Tw7i/+gE6tr1Bl8cxvF9QWjg+a5/QjyWQ5nWnmSPd6ylKQ0VyxsFaIjN3s5TH9MCufI71Ck/dY0O7i96Wuax85FHRhNhuVFppz/bTHMB2yShriaH+VcwXlw8ENcDgbZ2lPPTz2+f+Cf0+Q/02dKFOhtvIkJpxXFAxi74Kcrkzxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738554780; c=relaxed/simple;
	bh=N3ddbnR0hgXO5+ForEKGeBWL/8FTJ2kWPjZOzWx2f34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0l71W8riJ/9cNFCJUr+WZFsA1lLDoWAQi1x2z3pn/NyEMcWNrDDttel5/Wx0Vf35+M/lJQSTiLvr8YOHpay1RUydsDuA7SSCTHKdOSAHPGOWuIc536DX07xnJ7nYZxEq0JixGhPG7PG4yDN3u1M3gGWCmVegbyNoeglJntkZ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BJQVfdTS; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BJQVfdTS"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso5642771a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738554778; x=1739159578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+OB5IZsL+r1p/JnHLLVv1xLBZ2aGpwvqZk08Y+0Y7uw=;
        b=BJQVfdTSyodsV3dOKRVHtmHRPasLRIE+491LwNjbUv8q6b92pIb1MfSOEBIDpxSoAx
         J88G7wi12RA4QjTYHaFPQILK9xaDRfDq7ALyR+YnyKziWLZGJRPv1LRA8YJGmUJIAho9
         ku6U2jbpexx3g8MYqKR02438WAOQXRcIkHjz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738554778; x=1739159578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OB5IZsL+r1p/JnHLLVv1xLBZ2aGpwvqZk08Y+0Y7uw=;
        b=upJchAl4GczmxwW76Cq5pM8z0AUMIdT8UeetsiH2bP0Vv1SQoloySV9A2Qz1aww/dx
         C9ELMnfOn3d1iYZlB2QjwhB++3Rv9MpcDB7AGVlu3IfwVoJGAz3t39kXeUfbsq9EKr7g
         r3YWIdKSjKramp0+PQxuib+I2a8Zt56N+yZbsak811Ltd4OpxeHfDB279S8rISQ+fexp
         FRgnQSl+wP3+6s2wUAwbMg4D1gdnGQoYtBe6L/qAO6chuZBa0JbspeL7w46B1uty8APq
         KCSiQejPBrUouzXzouBIcuV6S6f4fyCrdG6Z0ZBZLrcU/rSFlGUObLCPBwVipCVeGhDR
         oZkw==
X-Forwarded-Encrypted: i=1; AJvYcCUZqG57/oHrtoH9gvGXtgHlDJOwy2rONwGzCwBdPcLtvonzfYnDxR6U9rvRGOg9OS5WYnadHaWG2Eiz3FM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr54l32ViH208TZ3LCHruuhp5Tpy1oiDO78eFRvhdAyN9AzRqB
	p7UU9sqkmvfNKYFlsBi01uaIwlwnQm1HCmd3U3Q/jgXIP4O6hpnneu0QYmuT5g==
X-Gm-Gg: ASbGncsfij7Toj+205WHQDV/DnF1K33/uHerbIFahO8cfF+DL0ckgm4rUrJfd8vM3jn
	uu7NJyGrDebs6SJqoEEkIjnA1VUCOHUhECXfb0P/D9Z8fM1T93hTFIBE8dfBgRxyA9qhxYG14UH
	C80WSftOxemi+3gX7i9jqn73wektFKbnQZ4uByEfFA1kpSUgrCDciUa1FmuXxffmDhATfDnVp1J
	MGL/8CT5YvRtzsnB04MpSRGtKXVwrtlIlkkzfLPw/DozRkueIeuIzU3FibfrTS7KVqO90kqiCm+
	a5JR7BGz9C2TEbkv
X-Google-Smtp-Source: AGHT+IGEfZtLAI/YDcndhJmmSb13eUNQM8JDvesVorMnc6e03Qtee4xn96NLKsXTtbwdrQ1r/dbEGQ==
X-Received: by 2002:a17:90b:2c8b:b0:2ef:e063:b3f8 with SMTP id 98e67ed59e1d1-2f994e50115mr19478739a91.7.1738554778687;
        Sun, 02 Feb 2025 19:52:58 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f3c0:b0:250f:9437])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd0d9csm11202345a91.14.2025.02.02.19.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:52:57 -0800 (PST)
Date: Mon, 3 Feb 2025 12:52:52 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hillf Danton <hdanton@sina.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <zbobl6aqfcqkxmo2bqxmne5qtfv4k57qyglaxi6tfdrj6lfpr2@jng7pdgr3byc>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131114141.1870-1-hdanton@sina.com>
 <ckfp5umjjqr3vmfxwfvih4whptp2b6my6bpmji22t3um6ah23p@6cmjt5ah5zbb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ckfp5umjjqr3vmfxwfvih4whptp2b6my6bpmji22t3um6ah23p@6cmjt5ah5zbb>

On (25/02/03 12:21), Sergey Senozhatsky wrote:
> So zram entry has been memory-saving driver, pretty much always, and not
> debug-ability driver, I'm afraid.

s/driver/driven/

> 
> Would lockdep additional keep the dentist away? (so to speak)

                addition

[..]
> diff --git a/scripts/selinux/genheaders/genheaders b/scripts/selinux/genheaders/genheaders
> deleted file mode 100755
> index 3fc32a664a7930b12a38d02449aec78d49690dfe..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001

Sorry, was not meant to be there, no idea what that is but I get
that file after every `make` now.
