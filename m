Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9412CDDAB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745281050; cv=none; b=bowbivjNIb03mzeaDCwCV6o0ZCEMC613lPNBRFoBsdJzsvm2MM3SraPPiNzyz9NR4opwc20zRm8A0r7tRVRgKttUulbAUtxtOvWMkaBffSohQfaTkjIHu1QJIyk+guXIQ4BPmIu2rf+5XDuGAQMfqUDwqox1VL0QyTktcVwvyc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745281050; c=relaxed/simple;
	bh=HrgLJwttLL1sQEMe1Kl7T/hru2XImN4ykMYg2UEJwPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDm/tfYOndYVJl9xSvIkLDKoWK25UcDsiOXHaEdNnMV4NIls2kioh4zF7rsPeXyt9lXpuk0Lp6W/hNiNcfbpQWDcYmM93/buHnXHlcQOqE5m8QqT9oMB33MViuvUs/ODqcf9Q4Bgrn3MW2/1lNtbafvMM1bO0VCpQP/fCmzbcnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=El5h6H5O; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="El5h6H5O"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223f4c06e9fso38235355ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745281048; x=1745885848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrgLJwttLL1sQEMe1Kl7T/hru2XImN4ykMYg2UEJwPQ=;
        b=El5h6H5OppANaA3usiBJ1poh/2kRTJRPImA/dS702evVdR1RQgMlocsYtSdCamtxyy
         F/Vbx/Yg6R5daFVtRQsFfjCs12NzD9KFcBVJ59jynmeTAKzcLpJin/E2m5KVT/qUfpFS
         2pRXgqkghSrQxVqofN3zce0trG/S2aQPzqzQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745281048; x=1745885848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrgLJwttLL1sQEMe1Kl7T/hru2XImN4ykMYg2UEJwPQ=;
        b=kL5ZmgJcMfgmHHQpjM3MMh3BPzrk3LLTIDDmpmRrW+2dVeHk3nAPpLPGHZmbE9mts9
         QAKdFSfboj6aQLXiYrgE0mK8u/3Qv5z8mHE0zoYBQzrKhA7n3K31F1Fj2itUW0hXsGlk
         brBiYrpXsB/OFjzqSCimvo8u04eD93B0ojuGikMPs0xAIlCnHiUfp77AG+Wy81w9NAEH
         u47h4y/UqdIbXMoSUkrfaD5eov2cRQTM+mQcRb9fDi9YXM9cHBFt1FaA00YHb92Euesl
         kYtdHqNmBSGrW8GYvHIdlxt5Z41hv7S/10vyOABCEkGPF4Kg0GsjnxiwgsLjbGdVsqwM
         wiYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsqR1bgKCAIqeAFypXuQ1aygsTmyRFybBHn9zzGRMVY8mlWUUe2e9SJQ7zU4uSXNpqYBL00bqeQdZgsCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNt8cfwlJtTWo/elTA5+E5U9tsDN835TIAnS1mAbiqjhLhSb9Z
	MIxiHTtaqvbDiZ3pSdFhS1jS+qCrq99+j+mWYgIgEJEpN3qubNLUr1fqLIVxPg==
X-Gm-Gg: ASbGncuqDvwtqHavGkbV9zd/wYvIGQ0MiE2Jpl95MoLfQoqmEOHi8WFT4OBLxKyDCaC
	Js9B3+DMb23F6KTOHisxJbw5pnLLs/uQ28OSJfDC65ZGe8w/a4ZFqxnqTeubRXgDynoJ6h9r+HK
	IsnNBJ2svC916Uxqe2vuNKkBAqKjSZo6ew5uQo4jY7kl+uYad7AqpKclLCzL/Jsgf3Msxqepzdd
	mKmJ+C+32wB/XCIPDw/gL87o79G14wzed7cIwVjm1c/snnhjXk+i2m95RjLnJeo1fYIhMGCAw3e
	/LvQWqMZ8OOODjH5vUMy3ckU3CkV94uDXfLFfKBae5NsfJzzDmXb21hRRaQxikqH1lIoRvOHwHf
	BTrspFksPRkFerQ==
X-Google-Smtp-Source: AGHT+IEYFWReFAeCQ2q7RxoZidDwt2MsEQV2j+m9bpwLJfJPIe79c6ErF+J0K3gyQ4wc/dODZ9PncA==
X-Received: by 2002:a17:903:1aab:b0:223:607c:1d99 with SMTP id d9443c01a7336-22c53993b51mr221907275ad.0.1745281047858;
        Mon, 21 Apr 2025 17:17:27 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:a29d:cdf7:a2a6:e200])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c50fdba54sm71544675ad.233.2025.04.21.17.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 17:17:27 -0700 (PDT)
Date: Mon, 21 Apr 2025 17:17:25 -0700
From: Brian Norris <briannorris@chromium.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 0/4] wifi: mwifiex: drop asynchronous init waiting code
Message-ID: <aAbgFZqOF_HizS98@google.com>
References: <20250410-mwifiex-drop-asynchronous-init-v1-0-6a212fa9185e@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-mwifiex-drop-asynchronous-init-v1-0-6a212fa9185e@pengutronix.de>

On Thu, Apr 10, 2025 at 12:28:42PM +0200, Sascha Hauer wrote:
> This is a spin-off from my mwifiex cleanup series. I have split the
> original single patch into a series which hopefully makes the changes
> easier to follow and verify.

Thanks. The split series is indeed easier to process. (It doesn't help
that the original code you're cleaning up is such a spaghetti mess.)

With the squashed fixup you noted in patch 3, this series looks good to
me:

Acked-by: Brian Norris <briannorris@chromium.org>
