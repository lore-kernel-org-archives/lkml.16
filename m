Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BDE7E105
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168240; cv=none; b=eq1CinV2qUZG+5n4yjw65ysJsykDamTQZZxZ6BnhjjqfCjIo6Y11S4qzH5pXmI4jGSu+KL1+6AqwqVuidLgt04tMPQClexXlKm6W/xRMmVOGhO9XYNEg9ce6ps/1T8qFfcFYAQYLEmrGxjYibWwyvhBG46iTT7tAhXqevqCbWWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168240; c=relaxed/simple;
	bh=3XcdT4yNmVxPSBFex3qLZKmHw+6RMtBGS5kjr4I0Z4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PniubhRSQszwioYuzjU3udRvJZQg0bxDAToGrwD6+/1xhTyoLQu70J9sqBBPrkFdEgyInU7ox0GufrubwyKd8yb8eKy8DOV/uAo9VqnfT9zc0v/cLJ/5xAvo4ClEKZcprs8VbMrzvY0fEWfIX8kwIlu1+pFDQbYzwAQj+PSK76s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GJO8eqLg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GJO8eqLg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f48ab13d5so60090845ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 22:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739168238; x=1739773038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O9ZedeZs+kwtzzCP8AnQ+V+TUvOdrdlDaOp4e+32cns=;
        b=GJO8eqLg6jaMVElk59vhZtxBSOalfpz8g8KonU5l1BGkS21O+cWG8gZWcCq+E56kw4
         sxn714JrNK3auSq+BwtLoa8CQnMsH3L2WHz/PPtc0VF4IPrKAWlsDmA/fLOWPuQUgH6S
         M+x3MyqhsRlYnkp6LNIPEZGY73oZRHH/y6+Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739168238; x=1739773038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9ZedeZs+kwtzzCP8AnQ+V+TUvOdrdlDaOp4e+32cns=;
        b=V3DN8CGwRNS/ivRm9N6Y5BpKx40OamTmsLuXhW0rXJd9evK4TyIZxSdOLorY3In/Ww
         bNGJGKDRgk+wF/6kIOZ2BwtE5NmyHwUvi0Vrp0OwcMB0fbE0mNFRn206KYF0RHTS5WjR
         rL1mvyPOWfmdESryUlFzZ5iyhLBqPPGTptOyAaurOmhuOpY/01p2l4Tdhedw8o0l0NJw
         uibpfgXMB5wdjtjW/H13ujI0cMjuzWjNCiVYxUWc7ZbcecieuhPjkNjqBGZZRW6I38a0
         RpJhWhM3HEixz3VbWvYxddf3B3JFirffOVPiPLW9L59gjRcVfj2mf93DTRyodgydfRVU
         3AFA==
X-Forwarded-Encrypted: i=1; AJvYcCVWAEX/iFzjSjmy2l8DH/fiEvAqXMC5CcTEtlDDMc6I3jHUKgKY2GMUTRbkCvowa/xSSIT3IsqVFFtz6Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+VMAQc5nKAUgjeiDhnj26CuYBzCRfBwIRQdfO/cH+UsuMlsM
	mKBxNwPhiFtIQZ9rg/496Q/T2gxxGid6lfsPz+g3/yCb2KsXzWB8Ok4H96reQg==
X-Gm-Gg: ASbGncvbAMlDqQUV3vMVU/IfOWjim026MkChe0wAuhABlsdDzVG4KTPR57cuvDb9t4G
	CCS52O0mTeM4jcvntMHsqeGtClLhg8g/uPJ53DGmeZmhuX3oBm9Txs0dqa9kqM/9USgcsWcNS2m
	+/VTTbGfZmrFUc7TAb48oDMZ7fUM+VSn6u9pzKAekX9jPIHOJLsG4JSCCFFsHYZ6uza5p8f2zZW
	hdPNc3dsYFX/RxcaeZllU5qu0N9EZXUU9/bkMXfAMQT7wEgjVS/uN7qyanL67IREQPZD6zVRen/
	X3t2UAoJ
X-Google-Smtp-Source: AGHT+IGnJPubMDmDoWDP22CsmPT0IyrsPjh1dvSu4m2u3/giFYt+WpULUdAVdd7NEdncji8DjNQ2Ag==
X-Received: by 2002:a05:6a21:8dcc:b0:1ed:75f4:d289 with SMTP id adf61e73a8af0-1ee03a8f4ccmr20075221637.19.1739168238005;
        Sun, 09 Feb 2025 22:17:18 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8713:dbf8:d76f:46f0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad5453e2366sm2903661a12.47.2025.02.09.22.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 22:17:17 -0800 (PST)
Date: Mon, 10 Feb 2025 14:17:14 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Will McVicker <willmcvicker@google.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Nishanth Menon <nm@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: syscon: Restore device_node_to_regmap() for
 non-syscon nodes
Message-ID: <20250210061714.GA3153109@google.com>
References: <20250124191644.2309790-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124191644.2309790-1-robh@kernel.org>

On Fri, Jan 24, 2025 at 01:16:44PM -0600, Rob Herring (Arm) wrote:
> Commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") broke drivers which call device_node_to_regmap()
> on nodes without a "syscon" compatible. Restore the prior behavior for
> device_node_to_regmap().
> 
> This also makes using device_node_to_regmap() incompatible with
> of_syscon_register_regmap() again, so add kerneldoc for
> device_node_to_regmap() and syscon_node_to_regmap() to make it clear
> how and when each one should be used.
> 
> Fixes: ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
> Cc: Will McVicker <willmcvicker@google.com>
> Cc: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: Nishanth Menon <nm@ti.com>
> Reported-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

This restored the power controller and everything depending on it on the
MT8183 Chromebooks.
