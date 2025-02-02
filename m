Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF232746D
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738502834; cv=none; b=iGWt1L/c29Jo7n+hyadntXm7li71Cd3JKgVfV2HNb1xx5V4Qv4ZYhjP1qSk4Nr9NOApegGv5GOWSeLbW6a0BBbGpw2ZLqgmP2uy15qoeeHpJGVc8aviHCB3sN6rpvgeGg3rqY3d8zLRjFP+Ipkyv4vcHmy3eba94YGf7eZ8y0tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738502834; c=relaxed/simple;
	bh=z5s2uav/NGiEaaGaKYRPcOE+igtuixnP7LskyiHmyIU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=om3PV9SJJHsO0Hgdx8vkfgyD4PFNCG9wSoMnvxPiFmm9RgLX9RGIvoPImmppaZtrvHWAj7FrfDGvaqd8H7YQh1B3ptp4UOi/X6g8aSyYlcylNqKB1lUlmjWdL68KsutYubiDSUI0ZX/jeHDEgU+RLraYWLlWxVTGSCV72n4VHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6eJjiqf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6eJjiqf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso28359635e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738502831; x=1739107631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAvOQI1Wn4DH9Wv7uUKNmkcHNCqY1/iZtJSY08Wnp3U=;
        b=C6eJjiqf8kwhKUs5UDjEeRP5ahuk3wNH6NIq4emnwZTbCEQ3oTFSISDoyjqKrIgCj0
         VxjFc7Zd3To5j3fhNS/zPtaaQcXQLshdaSrOu3kkimCj9os48iOINRC+MaR3CBePiwkJ
         fMLJ8JFzr0iYQzJaZPn5ZlFS3Njlwezb7UD0cpSGoBSXAxP6ZFwRrhEb679GwN+406hp
         0TsUVf4uY0S2yTrygpsgu74Uv2fqjHHlLAwM1/Q4VR/ICdeY/LI5yTpeGXaS1UDu5pOn
         qgRo6ywK+cO9o05EwZQb9VtvAueXJIpAP3od3iOsMBm7tRPxGndFiGLGNUDTFV1GyBG6
         rhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738502831; x=1739107631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAvOQI1Wn4DH9Wv7uUKNmkcHNCqY1/iZtJSY08Wnp3U=;
        b=eGSmVRV47gkBcKP3WD5is8KzudAVUJeNk6W7etl/jPlfzOo9yfbec4tSaR8BKemYI0
         vfiLuDPlz/ylQUjK8zj2IAqCbF3egnbFH6JVD/OPdM3iXfwCiAlITaXCJQ+LvQwdCvWc
         Sh0q4ehfiYnZpW7/bTE1QmsKqqDnqY/xQVseKae+KVxYXDnmg0VC8QTNOXHTTrTSZrrJ
         ylj2O1SXQSWXOQ60/VVL9a7Ys7qwRJrBuPubO6EDj8mMr6M3M7Sjf9VXwTlvnOn9myau
         Cq9FtmRgGitLfwq23sInkUN5uHCAy4Rj1t0WPxrU7Uql4O/dBkc/qsY13JxEYbe/gEwB
         3uFw==
X-Forwarded-Encrypted: i=1; AJvYcCWzVQ246pUsG1kt9vRhlzgj4IBHV9JrsUJ/ACbW4GtLKy1mQ7PA1Ndzqc1BYwjRA86NP17yRGNu9zYu0GY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGBvAEqYZFm2SJSrAO4bmUmoYbYu3+AkLEjYBhK1EAFrryCO6
	hVTYUz6upaob0Em8omVG5zGs3RRr/UuKMHN/z7JSeIY9xibfkZAfuMffqg==
X-Gm-Gg: ASbGncvQfCRn9qGyqxm8fCP7TwsSwXOquCBvPrDUswqPE32UsGGV80zt9fUgMSqlTiU
	MdS6p1hb3B+UV15IkN7Sht6C282wPfVcOHSh/bw+CXK4Y2ytuGNnTeueol0boRpFYtD5vcXx9Bs
	NWQpKlhJRVl2yNQtA5HdGonrE5O1CWxrnbmGARBEqijSSNTLIGgFVIjmBjjJgeo+lnKMYvOdllQ
	P6d0FciaP3cq17SWkq2ruKe4lJGV3JlYAmO34OEcyxZ0hbrylwNK/r2zElBq/YLolC+O4EzYY03
	293szQm5Ui/u3G4PwCPXpE4NFnssezRA4cNAa3X+Htl4UQaLdamztA==
X-Google-Smtp-Source: AGHT+IFhxc419TFWlww4Aer27PrCQcXjY0iJFZ6vSCeovYji+JiCAIeiqg0F1EozClpYtrlYh0mnDw==
X-Received: by 2002:a05:600c:34c6:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-438e6ed5faamr75285655e9.8.1738502830692;
        Sun, 02 Feb 2025 05:27:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d444bsm122686965e9.8.2025.02.02.05.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 05:27:10 -0800 (PST)
Date: Sun, 2 Feb 2025 13:27:09 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck
 <linux@roeck-us.net>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
Message-ID: <20250202132709.3ab54376@pumpkin>
In-Reply-To: <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
References: <20250121145203.2851237-1-linux@roeck-us.net>
	<Z5AmlJ8stVQ4L5jS@intel.com>
	<CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jan 2025 15:15:09 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 21 Jan 2025 at 14:59, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > I'm pushing this soon to drm-intel-next, unless Linus want to take
> > this one directly to his tree  
> 
> Let's just go through the proper channels and go through the drm tree.
> 
> Unless I've issed something, I think this is only an active issue on
> parisc (and only with certain compiler versions at that), so it isn't
> some super-urgent thing that needs to be expedited.

It probably wants pushing into rc-2.
The build bot is complaining again.

	David
