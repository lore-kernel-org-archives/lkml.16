Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA071FBC8E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300082; cv=none; b=K++w2TO8VE8SK7j9X5au4JHt43Ya9mje8Jidt5XJPTPkkSbVrysz1t3tl/1BqmfKEncsfGtolj3f66zwQ0yttfXHAZrBuA9QjedB7LQl4pqopozUiC1JDtilfe+OCv89djyhuTOGItMJ4AGoPyX+Ub3aV8cwxTJDKWJEgi73qW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300082; c=relaxed/simple;
	bh=0XOOewemFS9VXTcTHe5/CMElWD1zPCipCe8NA4Wxhuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIkgvcOuFrZa92SWj6E5KWCzhvGMLNhcJUD1HDdsIrNmJbAzXyYNEN74B4XnbwxHf09lL0ZpsPvLztLFYmSybW4l3O8nMgoPXkdrnHloKubApi4ZsbQ77yZX8HDa8s2hcyTGZgiDNS8mCYuUBlT60eQFK9uPYtW8S2yWYSK1+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U7BRF3SM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U7BRF3SM"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23508d30142so4706765ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750300081; x=1750904881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0XOOewemFS9VXTcTHe5/CMElWD1zPCipCe8NA4Wxhuo=;
        b=U7BRF3SM410K2AdRZCSdzpRg4QxiZkElYq9jnA10Di/PZtCsTlpVzdnhzBwxI5JzSR
         aPeAC7JBSEn3CRsZivD5YXLrDaFi8A1W2rV0X/j3u1K1SEewQ+nF/6jI2HnJjSUychjS
         clJnLYXstwlBxctOoyUYefNWE5y55WFSFVZQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300081; x=1750904881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XOOewemFS9VXTcTHe5/CMElWD1zPCipCe8NA4Wxhuo=;
        b=rMvirLqgQbLsg38AgOr09wdAbJmac4wm6qf4+d4ByWuJWAd5QAjsl7v/+ycqpgttUi
         PftZXSPWFPOe/oRmaiRI/pzew1/ijQ4iXTHQd0pqDz92MPF4m1vPiqeb4lOQ2MwJvCsZ
         +L8BjD0nhz3pcrgZMfffaAwn9e+furEwpqO1+9yYil4YWhFofQlUvH7a2mRqH+4b9qB/
         kxKN11MErEM09UeEpvSKlVYLEP/KPFiYQxbDYnopxvuwSz8Y0z4JHs8da2V+JNXIIX7J
         97kjpmz8i264dHOOn96j9AgEKILFhNNtj/Sm4cyn+5CqE3IPO4R0rAEuBkFJbTzW2nlp
         3HLg==
X-Forwarded-Encrypted: i=1; AJvYcCXa350HhcwmZEqEOjmYKSGyPo98z0KIprlm0NfGnlj7TJYfUehkF5ZGlxV85poMy1qlA29kN5uVpfrRsJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37Zc8C6nMISlrwfN00IewiBP13TW7+ecouUuQHYDpB40jI7Th
	X9XDDEe9Sdie9PKZffdpPPiNlzeJaKYIsY1YeoefK17EDvCRjOarde0e9u9P+wlzlY7xJJIHcr4
	bDfE=
X-Gm-Gg: ASbGncu3t2OmOKF66LY45sNoLSbp3OxxDM2B2PDKqK5ajosC4JswzibeCEHLk3YirBG
	hzt0Wo7vuursdlvnLm13WoaP/CFjdqoschaDib5YBWc4YnPw6hZC/if47nHzDQf77mXBQoFtPGo
	qcuyuwjcAJVi5UiwAsQ6+2qwquEEtolUssjd7yak3NuJla6L4HbkL784veTR0MwcdgNbF2SeVN0
	RKiubB98KeDaVzOfW1/0zyUlgtB1kZXhTkNqQtgrbMx5tMP0zNVCAWr4Vu/d1WGbegfSKdr4FPU
	TvGUIGhoSbIGtpPrnJLR8zE3m/it5FC8Jzc37EhX7yoGaviTe4DtPxTj16Ga/TOpZUQP3EmyiT3
	O
X-Google-Smtp-Source: AGHT+IHpEGqZGS9BG8qulg8tyMvVsra6tzb35SteIvB1BAFzpEhaq02ChtIgyrlqAUQXPx033jdj5A==
X-Received: by 2002:a17:902:da85:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2366affb250mr317976015ad.14.1750300080860;
        Wed, 18 Jun 2025 19:28:00 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2366e4e7842sm89401965ad.62.2025.06.18.19.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:28:00 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:27:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Richard Chang <richardycc@google.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, bgeffon@google.com, 
	liumartin@google.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] zram: support asynchronous writeback
Message-ID: <n6sls56srw265fmyuebz6ciqyxqshxyqb53th23kr5d64rwmub@ibdehcnedro6>
References: <20250618132622.3730219-1-richardycc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618132622.3730219-1-richardycc@google.com>

On (25/06/18 13:26), Richard Chang wrote:
> This commit introduces asynchronous writeback to zram, improving the
> idle writeback speed.

Can I please ask for significantly more details here?
Justification, rationale, testing data/results, etc.
