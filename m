Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C51885B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384791; cv=none; b=LwtaIG42rk5sx9HvxY0urPFdS/dnJ7fAKglpuDsK6Gd2oH9UFBwzBMm6bQj2OwZ3zd17upGRGMll9b4rqzYmONbUSnRqmHz2wnL5JSZ9Ld6aWwt3N/X2NGoIhJllsbc9gdAjM370jw2tpY0PP+nNgv/c4InHfAZlCxvcmrDL+jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384791; c=relaxed/simple;
	bh=pAglDTOhrF8Zvgb1AFD+OxJd1JCWicRRyJSMm11OT0s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMTu74EwjhjO8K26fspAK42ED4Y8Zwm/9kPQUzgunZD+YfsMjzMXwHQZwl57eHdmNkr1fjqUhJBUZphyXixJbMpAPzEUC2N2zDs+6J0LvPeZk+trTJIvQvVuGV9XTvMrqD1R9viV+qeC7wLAoSKOvYyH5+l/G6lFXOByQq/lw4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H3deQlJL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H3deQlJL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so797569f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751384788; x=1751989588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOFZz6F2G83zxV/3z8yTT2gDImG/Fh4Mhj3FLnYmKOQ=;
        b=H3deQlJLRphrt4rWcA25M4YoONr5eYM9aw9yOf+DHWm3TuVRF8Bnr33zw+Zzs3/ko+
         ObIOOB2spCDHhUgYlZ4pSuB5gdND+8lFQQvGO2HOUXkzMJ5H1kwJDos5CejiQPfVlluK
         VKLrGHFaNJ/Py+tFwgywoCZGt1dy2K8RCwKxKPx8DqRwMsloskj0bf7Jch26xLPqdZKS
         9n5I97w0mqKIRoO7cyJjg2y6ZVUPI7T/EUE7KDn7fWXRfaHqz5IL2LvIao+g/eBRxeg+
         0lBFaW0NEEQRP+DhAtznrc7pu83p72ELNIK75mBqA6oqDZpXCMLtSjw4qTYHCGVpUu3V
         7BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384788; x=1751989588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOFZz6F2G83zxV/3z8yTT2gDImG/Fh4Mhj3FLnYmKOQ=;
        b=eVkAGPBVYVdajWsRnVj0IpziRxk/8c09t38Xf8LOKWBprSUdGXVskIiCgEPdik9Yog
         RAnhLqG9LBfndGmLTyZPprklFNPqS+j81STbSL2gaWspnkphzg8ImMmyDLxxeaWMIniV
         u+5RMKADE6dB7XMrdfedsW6cLWUxD+8+sxz4tQymSY+Ki9T2bmtGnfvfATBSGDuZ9QNZ
         Cn3dh84Sx5N9tegYtTlF70qIsGEDBGDj7spbUyqF7VAjj24237UktE1eS54LLE6IAOK7
         UOxbvEF0CcwrVmAW4/uNi8767hcJLNaGUMBDqtD6wiqUJURAxg4iGfI9Kk6uhuxf1s0J
         aR7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVam7CikpG6qwghZ/3GJ4H4KZXSf+aY3ReylSPLKCLandKoq4P575OUo+v3VsDje2wLyZo7VKWLDU5Fzxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXOvOJwv0VWxcj2HrnXZwneR/NlKzb3qTYzkQNpJu7YaBkLNxQ
	LvmpoFhWRunJRArmPvunmGP1ZC6Gg2D44TZfYuD5GbsjXidYImdCwTyBqal3SDd8l2c=
X-Gm-Gg: ASbGnctm22UT1dgPTI9nWpQBEezynKBRg2SEOc5kEzW1x0IJsZl7pe0DbVw/JuWaFmb
	Fx2oSW8MlvtquOgSTRpVdi+2zj9BvqSgwyw0VHbbgiKTTx9ZtyyJadzvZtmjkCjaSAS/8aezEop
	6FuO/Gpf9UblbEnCbLvyk9LcfSndfqP39LFrVaWW04LKldo3dd34u+MicFksiH26i1ZGUMxmZYo
	AL6jh5Jlr/UQSP/GjqAIX3WGoeyyjzhjjWG56Y34WqbSJ4J93hw2CFIz5vQ84ZZJTCwPl3mPikh
	oKFs/8Ft9c+MYFL8t+cV00aGYdzqdrY9GziO0wMQJpOwKAnm835Pek0=
X-Google-Smtp-Source: AGHT+IHoPM3nOnG6zXq1wPZop0nFfQhTrUhv7Mx3b1Sj2NYhuzTU7PMm4Jn+4jvjv+oZm9TEot6V1Q==
X-Received: by 2002:a05:6000:1885:b0:3a4:dc42:a0c2 with SMTP id ffacd0b85a97d-3af485b1fb4mr1179705f8f.1.1751384787986;
        Tue, 01 Jul 2025 08:46:27 -0700 (PDT)
Received: from mordecai.tesarici.cz ([213.235.133.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm170405635e9.11.2025.07.01.08.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:46:26 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:46:21 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrew
 Morton <akpm@linux-foundation.org>, Keith Busch <kbusch@kernel.org>, Jens
 Axboe <axboe@kernel.dk>, Bagas Sanjaya <bagasdotme@gmail.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>
Subject: Re: [PATCH v2 4/8] docs: dma-api: add a kernel-doc comment for
 dma_pool_zalloc()
Message-ID: <20250701174621.5e8812ce@mordecai.tesarici.cz>
In-Reply-To: <875xgct6js.fsf@trenco.lwn.net>
References: <20250627101015.1600042-1-ptesarik@suse.com>
	<20250627101015.1600042-5-ptesarik@suse.com>
	<5a997777-fd14-40e1-919b-2e61a6e8d570@infradead.org>
	<20250701133833.4060f406@mordecai.tesarici.cz>
	<875xgct6js.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 01 Jul 2025 06:54:47 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Petr Tesarik <ptesarik@suse.com> writes:
> 
> > Do I have to submit a v3 then?  
> 
> What path were you planning for this to go upstream?  If it goes through
> docs, I can apply that tweak on the way in.

There's a reason I put docs: in the Subject prefix. ;-)

This specific patch touches an include file outside Documentation/, but
since it merely adds a kernel-doc comment, I believe it's still good to
go through docs.

Thanks
Petr T
