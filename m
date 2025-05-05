Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6741E7648
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477105; cv=none; b=ZsrOqx8R5txxbOkZKp49V8SsPZ1YguQ/kCcRoUJbnAGiX6inwmmhqaHjtPCTUKE5AB68aFWdD/4KFXDPk3qhwF4otB9+FW8KhRCB8KSfwpVJxjx2lS81C7mRUDrQXq5h0J14h0dLoQPjoaw7bUPOFueQZorTP/d01y+isW+rkZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477105; c=relaxed/simple;
	bh=Jvo/YhqIjXOfgWKWVr/xOXRXys269a9eHbiCnC4yzcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njawG/8oxNUhUg5Mbfv6zV9u5i7uD/OLixlT4aNO3b8ckoYvvP7MMrGU6w/HEkhqTiT8IR8GjkImjL+oKSsks6evkziuBUan5a7RQzF0iXNymsnK+NWahYJsLPHFLGkyQHsO7Tx+XK9TYjHAtjKTaUdgbiX2F68PgWwSszQEGNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=LLMVf8lE; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="LLMVf8lE"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso82158076d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746477102; x=1747081902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jvo/YhqIjXOfgWKWVr/xOXRXys269a9eHbiCnC4yzcA=;
        b=LLMVf8lEuwOKx06CaTrkHHbHABoHe5K12CpvA0w4O1MZ5LRXsozswI1KKLdYxbCecC
         kQdcQ4iTbjcuBYZJZGMytnXH/DoHMLnb7a9c1bTSo96hMTbinO/8Jv1OVZERXWv+3jqP
         dAj31G3aP7HR34JcgKvQbQFjdQoPtE0YbiRPTAOnRxinHdrll+TccIZ2ws3UqCw6AAB/
         GB4zGOYwr2fdoLVZpVmkodMVq2yJZTCLNLj+us3henDckincdmqtoNW4YDIvn6O/yHZb
         +boiBz2gsdiZD093pfEsdI90k2TsOv42Mw/oIyR8TrO6G4ii3evWN7doi7zzX8Qa01i2
         4m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746477102; x=1747081902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jvo/YhqIjXOfgWKWVr/xOXRXys269a9eHbiCnC4yzcA=;
        b=VrHxp1NUW+OqL+oujnbbTYMQtPpvocbjSBbGlzP645e/sZ1L3r9zSt1sC9cJ7lemtg
         AedXJqv6IY3LwybSqr1uNlkK5llokGcXfQ8oXoHCWx2doSPK66KwqDYfJwr3S1LlufRa
         V/Ay+WgugpHtZgU6oMhyyB1JoMaFE5b13FCT8ib/MObv/r5vGP2F9BzkT4xNqBfWKjPV
         WpyN1fZA9p/Syg6CYb788AWqcweMaoNDjYw25mtsSEfKhkTtqVDPIjxQqGBT3gETTNUA
         hnFcB5DYcOFgRkyY56Eaj/YTt1yyu/lxkdtRQT+Yfcw2cJNiRh0PWxGVRf008EWu4gzk
         B/xw==
X-Forwarded-Encrypted: i=1; AJvYcCW4jJMp8cb8lHLSwllrAqdbXUk5n9colsVA46409EpT1e/zx734YXSdEqduiS4izOWbjRQblmmS/fXEcKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvgMotLRnJtilFD2S5zjYHCIdIoFznzJSFMHMQ6KEHNQzV1yP2
	8d/IVb6X4gQmEKWXupMtK/gTTYMB8d+0HqUXsUV0NOqT+s3pHaGDtCZ6PKGvJ/nikLV3eXbyYVd
	x67q7eNUFcZ4YaNTyseUv3DMnxdTSRG6G
X-Gm-Gg: ASbGnctbhRqWNkwHKQXtH3Ajpmc/87eqXjgnke6NCrQq5lafyA8jzcxbxWayGgBZ2X4
	kjVgYEvndZP8mkynSf8rWifvxEhhgok+lqZOTwLA0cmh4lyDwWD078hIN7BypQwXav8yQuo28bL
	viACsPXpBkpRZI14Aqv4SKd1LLLJuOjfgewhXG6Zo25+XUcNvFfmX50Addtir3ZKiOoYsK6S9Z+
	sX+cOblUE+gPHFfhbFb2TxZrGYDAtXYSOvCr/dsLrN7+LQXLs8O0X9OPeuc6s1tj+vmJObHVuQi
	mMwyL2fVWhSw3UneL42uVZVLSnveQJxlWIUHiwbkEshqjg==
X-Google-Smtp-Source: AGHT+IFjyj7LaxQN5e+7YK7FuGnLBthZu97bImvgrg9DXkMwiEuu/3ei/Y3A5hwO46/WZOpmK8fMARAjTlxM
X-Received: by 2002:a05:6214:124a:b0:6e8:f99c:7939 with SMTP id 6a1803df08f44-6f528d126c1mr126873906d6.44.1746477102056;
        Mon, 05 May 2025 13:31:42 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f50f3abcbesm23261896d6.3.2025.05.05.13.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 13:31:42 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 0C6B23401B7;
	Mon,  5 May 2025 14:31:41 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id F1B49E401BF; Mon,  5 May 2025 14:31:40 -0600 (MDT)
Date: Mon, 5 May 2025 14:31:40 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] selftests: ublk: more misc fixes
Message-ID: <aBkgLOxWLp74TShe@dev-ushankar.dev.purestorage.com>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>

Hi Jens,

Can you take a look at Ming's comment on the first patch and merge the
set if things look good? I can rebase/repost it as needed.

Thanks,
Uday

