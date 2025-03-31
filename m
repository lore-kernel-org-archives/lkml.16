Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0A61AF0D6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404505; cv=none; b=FjJ1S7+wpzYJpWw9TqWRwA7rdZ/ztcruxUDJVAWEJOUB6irEXtNUgjsGxwQlcMdRzodUlfxLv6PZ44l4vwwOr+YaQsQDTKsvgoPOaCfJ/DyHkJ6CHSTjrZwytoeWRonCMa5vuywrfRzVYKiScXksFf9ds7h0fci458HhqObCtuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404505; c=relaxed/simple;
	bh=7g7XpeFPKnrmIx1uYLTkdCXecsltwr9673DmFSVJvIs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QKZM9CHxsaSSG3W4OvJka+S1gcPfGT4+uCghIL2oVI5L1XDGntVFdKYSPbaHIQO0uYNOXDZix5VEwqCGcEw8oRF/MaojkN/B1TDvjseXN/yCfp+KXpiDnXe8mMYPDzKsISc7Sy4qTRyIUIfDiPD9C64hsSlzNEy7abyPY2Ph7GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X2c5YDhc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2c5YDhc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3694039f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743404502; x=1744009302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaZet+achYItbJKpiG/xx1boWkF1GMxAKa+bQtO4ts4=;
        b=X2c5YDhcf/C+PslJP16Ub+L55uyKfGXzy6mqpkYz06sFJnTcK2FZPosNsHl5+Qw/VQ
         job39QOZgIPNIiLaTfgEchphr7ZYN+AyIDnNHU7840hI545yCa3+Jf2oWoVqEOF2Z4z2
         1wZj5/BJDBNEtmPPMpcIiJNln6iq8BmvOPQCInbRs8ufkN++Z+234Nh8/zDrsMo+fS3V
         D+5Mk42YtKb2uaosXmV6bAD8CSkFvOU+Tey7sg1T/8HSiR/dSaa7mCoTLJWOXHVfx1AF
         dWmwe5dOjKRV/ysUOsufkD9BD4zWE9I/RPJY275Y6QVMOnbVtzRnwT0CgIjrA5Uo329A
         WVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743404502; x=1744009302;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaZet+achYItbJKpiG/xx1boWkF1GMxAKa+bQtO4ts4=;
        b=bVNyNkJruA/XWXJKU3c0Swab+JrUOYH2N08fJkgX3P2mJnCISfgWGnBCAdegozMMn/
         KipEHYTXYX9ZsOu69I0sp2SJy14eulDaSaRFSP5thRwsPWZvbFLIBRdO0wL6WoXI8u1t
         YhabHC3IUSfVHThfXwGep1O9UhsckWB6JJx4XgMcmk0XSugHRdWmWuZeo4GoCaTeOyID
         QiYe819T55WC9ggKwA3lGDVRMIITb8lwsDyJRu9sqVexseWyh/LiD9c312Z2bAYqm/p5
         tHUhKY9sFp4oQ69rmBD8OgJ7kii1cLNTOZDO0rcGUcReNGeBe0sZ7uX9ndcK8UDY5srW
         dFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBULIFJCkK6/icm6oxVklFu42uI8CYs4Q8wrf6rxCeA9LGt41gz14iJHLYqNBdJe7sPvF9qv2efJeTAvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4fKCOv7O+vWYppcl3bbB/1JC6H9Rji76Q/0YRQcsYv2QPlaBu
	zhxgykWl0Og6Q4EZMlOrD51LhzQqTajZpmsveqfJEjiqNpmVb2ZjMOJJU+6XxSQ=
X-Gm-Gg: ASbGncsUhbyXyjYCAgZZ5IYvH1HO088J2sHd/Gv4LSkETbkqqbhZdRu53Xl50cpjdAK
	iatHmIvykSY/pl6eGKjbQZi2hZtywrLJA9zcYmOB9Rh2bqUohZbhoZXGnnG6giaypRXnlYU24dH
	3ZFRqzTZcKyCpS6qltakI3AT2Woq8D/ac8uhrOC5j6z1cPIsQ1B+LQ34i8DY2dSHnH8yeES4mA0
	cNvXGOSZQ3XnsbnSrztLWQ32QiBeWIj/7Du5lhq64qHttlZQ6u9LPHUqE0h/GiK3+ocaIyv/i2/
	eAsv67/vEzumn/6H+eFlhqXm9BTw/avEBsNOMA3qu58fiUdowUgVNTLudTTAxX2mkA==
X-Google-Smtp-Source: AGHT+IHddxB5k0FnXCNZBeNjRDemX9kB1JsqOq32EQuLUtsmc+/DgPdv1Z5DHh144VpkY69PlzIWUQ==
X-Received: by 2002:a05:6000:420d:b0:391:2e31:c7e1 with SMTP id ffacd0b85a97d-39c120c8df3mr5450139f8f.4.1743404501733;
        Mon, 31 Mar 2025 00:01:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ab48sm158442325e9.10.2025.03.31.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:01:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250330143254.3159519-1-christianshewitt@gmail.com>
References: <20250330143254.3159519-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: add saradc
 compatible
Message-Id: <174340450091.221709.5889306683742068023.b4-ty@linaro.org>
Date: Mon, 31 Mar 2025 09:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Sun, 30 Mar 2025 14:32:54 +0000, Christian Hewitt wrote:
> Add the saradac node using the meson-gxlx-saradc compatible to ensure
> MPLL clocks are poked and audio output is enabled on the p271 (S905L)
> board.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/1] arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible
      https://git.kernel.org/amlogic/c/cb99bb034123ef8b8dd533fc4c42164b049515a2

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

