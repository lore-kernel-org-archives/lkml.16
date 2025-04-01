Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34EE1EF080
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517791; cv=none; b=lQAONkUZon4nkzaamwjI+88FnczCxAdkfs6Xc+KYl2XRUV7ikuzs9txgXhjRD6jGGGwM88HGLV8Sa/EIzWKiMkxg1NGT3XkxLUxICQun3a3YeTm/mxopomoijJoOmuPWdvh7QnpQ8BvZHlqGQ4M19EsFHVtU8WIGM9ygJCu2cbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517791; c=relaxed/simple;
	bh=4+DXyGZpy3baMIIEpJypfdpYsotPYKsxA3mI/UuDijo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U64679HS++K1BPgMk2yht0qiJyTeeFB3+zMYgfGfwj7AU2NXurg8yktFSpPoPbDftibpo1czVqKqaToA1tzjnXYaXNA5NMwnhVqBz6QjJLUddNOVEKZBIoWoUoPU9zQHbRHsZ83mq1pWkTpDbXNZLFfCv+iYtcxVcDUP747v+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mGTjgFrW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mGTjgFrW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3996af42857so4453954f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743517788; x=1744122588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+DXyGZpy3baMIIEpJypfdpYsotPYKsxA3mI/UuDijo=;
        b=mGTjgFrWukuCgEL1V89KWiCBAZVaAwkfyWfauRCvEJmnXY5lHfl+spBQxEiMyKK6fe
         dkfqaWxw3weMe4lRZ0SyTzMNg2+nY4+ZD1YhiMH3lMXF9lFZ+WjvgJAWQbZKLK0wKZv1
         EfzkhPpIHr93ggh6ADw0H6f0usvjyhd6tNThiu8VdrJWJVYOzrwCRYW0PmYONL/okXlV
         otpSUU1h3Vz9Uffo0qLBoD85WV9FiQO8sAfyjCLv/X9mybzyJQShC0jtjElLthqPtO3r
         L6bMncHQR5tCaQ5daeBc6i2fsB9T5lRyjfGfxnhRr9gu2yEjTe3TaqXzUrDWXvYcVhuo
         sijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517788; x=1744122588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+DXyGZpy3baMIIEpJypfdpYsotPYKsxA3mI/UuDijo=;
        b=ZWMLTugqOZelhki1NOMfkmz6Z8oHwfk1v5Z4VxNVxr0O8DFVd+yudmue3sna8/hjGV
         OzBz64Xl96jl1oIrTNd+QmVHDef7obncz3KyRzyEACyJD94TrVCQ1VHJOPcGNaZPW9Ya
         d1uyItBmqV7nO42Xgu92qE9h3zcPQIlGOznzdSUN5HAMnUojeAiu1yvVyLAxQCotwVmZ
         1myurg5rHIzHeEj0S+8+4SSCLSr4+cznCBjo9TyfnDnzMqjk4refSxCyETrwNbHM//XJ
         ciSqLCCMj8ElWGUOUQJjh/iEKaOgFxEvhrO8vbKAbHzisHcSd5H220+eqFLBKipIjYJ8
         /BAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1VS7T8w/EttmWl2ih/DZRJT7KhmKdYNlymL+/Dga8p4Lp0351EdQK+ISdN4Ldi9dw5C4e250hkfkmIXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YweUO34zUu+hZebopEaeSQ+ChJ1vg2W61cytX5yvBWSVqFwra7S
	j7W1cRXhRggqYoje3qlJSxZJ8uWvygHo4fjGu4TiJrPLr/B5iub8oZM/To107cc=
X-Gm-Gg: ASbGncvf9mCCCzm1nJiZr/i2quDI1JSW3NPAI/z5Q4CivYrA8MDNTNofZsBMLuvpwh6
	ZivEaEpqyhWVz3IANowxLbH+8qLxgeNDAhFpLmC3ORGyixlS3VFKWhBBoIPgHay7sVymorwAiOG
	zHq++3nHHABovgJ1JXbyamBc+o+AdTPgiad/fUzjvsqwnzOp3Fv2lmGM2FGaysfc0VCqfRbXqh6
	bwYMzL245i2KglG2MAg431Wr3yjqquHs7uyhV3RHlvNaJZSteGgdKPAdq5ZES0lkRROrsKyhW87
	4i6wIZVVxauwFzNL4CykYVLSsMkjO6PbFXJCqUk4ZbkSmkaYIgBFEQ9NIBqYRH90P+ZLd4V9tbS
	8G8FCXZd0niPKoUYWDMfBx+LTchY=
X-Google-Smtp-Source: AGHT+IHNx4vQ9HZX3k4j4jTP+pXfpW+zl8Y4RdgON0AYVMnFWqF1w5VQnDHa4fobYb4eHhHiNIy/Pg==
X-Received: by 2002:a05:6000:18a2:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-39c27ee84f2mr205051f8f.8.1743517788210;
        Tue, 01 Apr 2025 07:29:48 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a9d2sm14254936f8f.43.2025.04.01.07.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:29:47 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:29:45 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Haoyu Li <lihaoyu499@gmail.com>
Cc: danielt@kernel.org, chenyuan0y@gmail.com, deller@gmx.de,
	dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
	jingoohan1@gmail.com, lee@kernel.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org,
	stable@vger.kernel.org, zichenxie0106@gmail.com
Subject: Re: [PATCH] drivers: video: backlight: Fix NULL Pointer Dereference
 in backlight_device_register()
Message-ID: <Z-v4WansLWJtv9CV@aspen.lan>
References: <Z65fFRKgqk-33HXI@aspen.lan>
 <20250219122950.7416-1-lihaoyu499@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219122950.7416-1-lihaoyu499@gmail.com>

Hi Haoyu

On Wed, Feb 19, 2025 at 08:29:50PM +0800, Haoyu Li wrote:
> As per Jani and Daniel's feedback, I have updated the patch so that
> the `wled->name` null check now occurs in the `wled_configure`
> function, right after the `devm_kasprintf` callsite. This should
> resolve the issue.

I'm afraid this patch got swamped in my mailbox and I missed it.

Worse, we've just been discussing and reviewing a patch for the same
issue from another developer:
https://lore.kernel.org/all/20250401091647.22784-1-bsdhenrymartin@gmail.com/

So, I just wanted to acknowlege the mistake. Sorry.


Daniel.
