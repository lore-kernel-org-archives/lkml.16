Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AAE20F090
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819362; cv=none; b=QoX3DjQTvmQIaR4XiEPj4bANV/AkfJ3qHEvnZiTJipWN7nuxmrV3BDS2D3WrIz6aeX6u1zHyFG0w1kXYH/dStOPDZzgvsTNm1A5OtYRcrJgvxxs7QLJtSWMjXS7mmjjO64Al4MvPILhW02TJ6DyaG0yLnKjEkK2Xle2glNxxVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819362; c=relaxed/simple;
	bh=gCMKdFmbtFL4og8gAMPxz21Y+e1NPm0DC5q60WujdV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DhFPS0d6iBxh8ORzRFIJsrOPOHvy0wGzXr1YQ+z1sr8njGnb9skoXD0MKy1Ebl5CXciATIwyHIKBq1si2xJrmYNIDEwDKaLBki5yL85NZu2ffYn6bp33CD5n489FsR7qZaZvz0zZuW2VLHUJXFB4YHKwZzwhOe6RAAwbtt1DYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EmcesSxJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EmcesSxJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so72133415e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744819359; x=1745424159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rsl4CQivw42ufMV+wmde8cweSZMoL18GRDE0n83zCx0=;
        b=EmcesSxJ0qfeXoW3kqvdEHF2qfDBrPGdmgeZ07XZ0brWejiAQze3OYY7/Plj8KZXj/
         hvJM3NBQ1UYIO6DKbQtCf+YGwbZS7dlbVfATLwa18Wv4D2D0BvU2UkFGSF1VeRW3vV7H
         El0jUuGp1xChxNF1X1LlRPtViqxFpRJVhPG596uEx2HNAkgljtuMSp/0gNuMs3VZk7/F
         HTe8PRmmAlmsCf8YdecTBSKZFte6IL3QoDCkJDRW+P8tDhj3rIooY7kuHufhN6u8gfjD
         2mAcXJ4DTTHHeCx8WXRMU1wjcFqoBRXHEvTstqzem4L9ORI2kx19iOf9dNw8RoVnStKW
         dDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819359; x=1745424159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rsl4CQivw42ufMV+wmde8cweSZMoL18GRDE0n83zCx0=;
        b=g1K14QXzwb7e1dcB+tE7YRQ+z1O1AokLA5QfXsmjHBFm1H9R34+8ZJw4AeozU5h2ed
         EzeTNQt7jJj7by+qgYGFWYYG1+Bcke6jkDo2cnyO2EH0I0af6pT/P5zCkrXcqtYa2vrU
         aQzO7UE/37lSp6GF80NKoLT2XXwhzsqda887EmiypszduIcCcw9hqye/Y4lTAy5hwZFq
         yGpMOFwncAEz/+62zc94ASahAl/yNt4qmorh30onrD0kLw3bg1vkZOXmurPiDg+JFBVZ
         ibfE+SvO2R87/md+Ovr4yE0+kVzKShw3GU7HB69nEFDofVzpfKatwkzuKdboyZmui8AI
         Nlyw==
X-Forwarded-Encrypted: i=1; AJvYcCXxEztLAVr6INFtUAWFNEXgJqGQfPl0Nan5lzffHrxunSmcjWtmnb1BO+0q5hXyj2Uu/gV9GDMYz6LtPCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5OBZG5fOSbQ7rdfoBsrMJ535qK9tOrDoqhIyqMgzVWw+eYwp9
	qVadCRMO0ydRazaZ3WujsRUaU/eKo7x+WZtN1FY+Vhq4PioQY07Z/VfmY3kU/8M=
X-Gm-Gg: ASbGncvPuDIHW4KoD4kW872ZMlUXvh6VIQoofEMbPqsa+NlYdQQlEKuHhGZEbBTagu6
	e7DfkUh3CP0gZsjPWXWxANPNu2ipJCNwXU+Fpq8+bd91EhjiSbgk/Y3aGBi0WfEEVn+g/XPIpB5
	W8xe1/ra/4UhNGkAjflvaMbScwjE+y/ws/YWcUt8E4dxr7VAc1m4PhkOs/01W/LYJQWVSKdb1T2
	b83DEToUDCfrNF8dxnWIQs2yBQkTQL9vmFfWoD12CBEpsz3xiUlRv1D9FB7uinl7Mx0uO1Ggsoy
	7TtFqihK76rct5V2EKMmlU3uXhCUizgaetY19LhH
X-Google-Smtp-Source: AGHT+IERWikXw+24LHmvUQeLjVP0dfJ2V4PcYTWDy6gAecuT1JiOnCWraX4intzBqGRCRoec/PI5bQ==
X-Received: by 2002:a05:600c:458c:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-4405d5fd388mr24047595e9.4.1744819357154;
        Wed, 16 Apr 2025 09:02:37 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c82fesm25069995e9.3.2025.04.16.09.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:02:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Russell King <linux@armlinux.org.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Lechner <dlechner@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] ARM: davinci: remove support for da830
Date: Wed, 16 Apr 2025 18:02:33 +0200
Message-ID: <174481934991.14734.3926853082026589830.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
References: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Apr 2025 09:50:12 +0200, Bartosz Golaszewski wrote:
> We no longer support any boards with the da830 SoC in mainline linux.
> Let's remove all bits and pieces related to it.
> 
> 

Applied, thanks!

[1/1] ARM: davinci: remove support for da830
      https://git.kernel.org/brgl/linux/c/78e6b545e5587ed89b5768a2815861dcfa415101

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
