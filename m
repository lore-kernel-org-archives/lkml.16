Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BFC17E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749616673; cv=none; b=G6+ARshmTqbkBtazZJDQeaFriedqyiTEfUuR8Gf9sghsL0zB/2mmKrquoyVrrpKEm09iBveXK1uNIVhLkkbOS0VQS7m0Rp74AJt+3Pvvjtt4O7OlnPqo5+Rl4sseVe34nlfiuVWQ4/tmNqjniIKfiSKnLvhc4VCSPFm3zwO/3Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749616673; c=relaxed/simple;
	bh=TfZ07W2uCkBNI9p2iHLuOlIUrxn9e1xYgknUoZFI+hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6XFTdXZu1EEQ68DlwOIOXaBc24aHHsjA8p0X/KKMkOkSMHsQpetwmyjstEQO3F2eiyIzHBs+xtwx3Wkhxjpj20IuyN71LNbBJRSu2vfy8Wb8TAmb15ZkMnNWpow1gc6pco5VEViiUYNmF8TYAyoC1/pWtmEOALke6e2fGK7+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j5Hx88Ko; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j5Hx88Ko"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234fcadde3eso72947615ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749616671; x=1750221471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FE1cAWbg11FBslkXTnrUJG3ETee3kwzfdEhvTNzCUjg=;
        b=j5Hx88KoSICauE7LHZgBDDf1nljkDh7ihDMZDxP/b+tVds4tZhxR3UO9kgiPc246lG
         xxeKvFlHn0ZCsMXEhJtAfaJBkgNY+3AHE89r+3J8Uy9pOXrm+EEimF73a9IcAtM+Vlm+
         y7FIKusQXLROG4bdc7J8ASrAYoaVs7T6ZsMo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749616671; x=1750221471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE1cAWbg11FBslkXTnrUJG3ETee3kwzfdEhvTNzCUjg=;
        b=N6Bbko+pNPKVu6zFIzHz5rTgWRKvP5PIp9zgM3tHUekDSM03NliSfhc/r/+Rxg7Nva
         g3+ogzCZi1rrsFwfdBKmvxC3Aobjf/pMh59YBeNfAsWDVvzjRQnj0IMXa1bM88DbcAPt
         Xk20Gsjtj4iP26ZtTjXtyvk5LwuT3D6y8n3tmXlzmylhXK+WaL0YBroWWshC3VTbevgZ
         hFQXxrsFBjN+5qCaPpCYB54cwks7ECnnubNWEmpu+1c7Pjs1b4lehh6Jc3yI3EmgjtPe
         N61GJDFo8n6KiVlldcDNNHtw+dMhkrVPWVSwXkJSd4M9XR5b7Bz/UOUtyfa5fO4EuB0s
         N7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxDWx5vjBBVaSyV6OoysPgi63tIc8zdXb27CsQvGBRfxs1BdmtXCtGD9SMwOSTkE7ggjX6uhKjJdFfVSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOQIdcnhCR5bJ2FYVAozOLv0GKIgFgyxCJrLhawVaV60HkLh8
	E2ZvVHkqu3rDFZY6xG/qsWyYRAtqFeeUHsnW4g0PbVHDDS8Hp5033ga6GocCFoMcRQ==
X-Gm-Gg: ASbGncvtmsNCL7cb8wHx7HSY0vHTkQyf4KF3wpecK8DeHsxSgMTA9jzCILLtZlKpVDP
	lMiFCIxZ4VIRSh+wGmLpYt2dwXiObtNxtquCeBOux7JnuRU+KY2d9BjkTj6Xv4v6czZcgDK1tqQ
	btIeRvLk4gvUa6a70fzSRHWSu7SamGeq2k+vcape8RrGV5nToA34NsVD8a+ftIHrzQVEXDLXa/w
	vZZiEPTktf5aDviP5O4Pzmzr4P9CfA4Ln9fcSAiYY8vXqay+ISVlGHlFn3BYgLVLQRas4RXfq6O
	8QqP3QnpYruo5w99976wiEH312IZYibk0AXVgJpzXzMYSkc2ege0qob1+mTLhAjCO1fjzG2UisC
	u
X-Google-Smtp-Source: AGHT+IFM8NgLpiLIoUkojJ3i2pht8cBR3G2XAm5m39HTWlGcYeBr0M+6D9ErnNi2+LitOkchPJZG1g==
X-Received: by 2002:a17:903:32c1:b0:235:a9b:21e7 with SMTP id d9443c01a7336-23641b2654bmr26834905ad.48.1749616671102;
        Tue, 10 Jun 2025 21:37:51 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:eac8:ff09:e566:df3a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077eb7sm78450355ad.39.2025.06.10.21.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 21:37:50 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:37:46 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Message-ID: <74caimlaibla7rge2eoiubeesp6pz7e6u7ifvbw57t4e6q4qso@iypz4pqd7kpr>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529035708.3136232-1-senozhatsky@chromium.org>

On (25/05/29 12:56), Sergey Senozhatsky wrote:
> ath11k_hal_srng_deinit() frees rdp and wrp which are used
> by srng lists.  Mark srng lists as not-initialized.  This
> makes sense, for instance, when device fails to resume
> and the driver calls ath11k_hal_srng_deinit() from
> ath11k_core_reconfigure_on_crash().
[..]

Gentle ping.
