Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9EF2040B3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583963; cv=none; b=DX7UwpX6+vVUST4b9D4A/wYXyz0EANyQxV5nzVdlUMcwHSyJ0NVunhppdeBHff+ujZh8QKtqwbauxux3mWvH00vu+U9E9ecX47+iE4oglTygVAUsSMOw1ySaU1za8BhHDNMkz8Uzj0a3SWw0o/zji3Q1DRIuJx+guSg9+13VCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583963; c=relaxed/simple;
	bh=dTiccqNMsBZ9GLf/rRlcXjyxCYlLa0GCTN2weEx/XUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZPRwOJk2/qx6E6a7ehTkHe4DYTUIMXzxyWJLcB3yAYFaR+HH85or8j8jKxC+U5opWLQ9niWNPuDCM8R1rdE864T5YYtLoCh4mqy7niBpX+6V3TjO6NOxYvYGM3uEClcdEjeUzewqFK3EM3TKGeqA6jCKm8e4v6Jpos5EayIvvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VR1bX8cV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VR1bX8cV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so6571535e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583959; x=1739188759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2a/aauBkaXi9NTmAe9snehCWmybkBs6Bj8pQwjYW9I=;
        b=VR1bX8cVD74WIr7I/G/j9v82tCGRqAK2biPjHVdO+81B79IUGH6MltymvI5MgjrJtC
         lvqpTxNKOsrNMWEEJJdrt9I90O0QTCFONN7F+a4EBcmXlDCi1BPsP2snQK/dfgoZhEAv
         063/tOtMpcgyJn3HkGUy0c3tiLTqw5Mgwk72IqzsydVMErF5RirGLVG/GtAepYlpZwbT
         Dj807TSSNvl8gKO2xzZ1x1RzqeXd24VKwPUsjtPIl7gDzbZ/IDVTHoGfKHGD2yFIxAek
         NuCLucWmb7CnmFMREMidWevTcW9AKaPY7Lm10AyYFXU2grUX0cIiFNYyH5vyRzceHE5Q
         pehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583959; x=1739188759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2a/aauBkaXi9NTmAe9snehCWmybkBs6Bj8pQwjYW9I=;
        b=SqlT3JyIyEIQeTVJ9KdpZklW83qLkQVZ48A9En65OW2pQTtXiDuEzanyMSpZ+BqTv/
         Qd2N/5Iu42VnSQ8hlb8/510Hgz9KTlGTje66caWkC4osrLCZli5oTcyP5OeXaUHQWwH8
         vWBwxe0FXESfliDHlvFlnZW0iVMgFS+u93D+AbjUL6ZwyaiFfmnXT79oiMW11W1oqvME
         zgeL3Dtd4JW1Iu4MClgjlYt7VT74KhF1t6GHuWOeSGE5Do/BU+EpM1+tbw/wT31io1um
         6MhfxRm/LK/gFEznclPyKxAhS7eIgrIvvlRJ4WlVxHZgjSxfLs1So3iP43YGrxncHNiH
         BTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYwv95Een5u+8R04Ir/hrEfSVWlsvDUiNXyRczucsI3ZspOVKhyoRERFL6dotjlzrQreurOvG6qCqEgeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXqLmt3RSjon47PWeINWZbAKghXK5ao0EMRD0t/pVLZyI2DmoW
	X0Y+WaSUiUGgvJZkdD6/M7ebCirGQKce8Ct5GArvjdXZZWr/lY/Oqm2uLTfoXFU=
X-Gm-Gg: ASbGncuFSSqpW74iW9DqKTl0lxwQn1dVl8hb84XKOXMN8RIDWBUkb5y7XL+pdGlO/0+
	Wyka/Y2GyqP7lZHlSqIJG1ep+STW2cNjqXOm/+YEHl6QbjMadHzfDQJFAMHs9nYE/7lR+iPVuaq
	m2UVT29vtqSLYQwUrfd9tvoatTPfRPC7iA89mLS6dLUIdkHmCVHVQ+xgJk7RxKe606JxaRmHADw
	DodWKwdX62wlapQbdEyXJjH+5O5GYijGxeQplhGVRE4rqcPFuZjRM71PdZY9+D5cOgtF1MtnZ7u
	3lU4vRYSghMAj9uhBh27YSvJZk8WAXM=
X-Google-Smtp-Source: AGHT+IHGpchhT7QUazlfxFFqFayeGo2FoLhy7xxU/4TbchPpF2cuysjOgifUoOGGAfvTdFlGmzeQPw==
X-Received: by 2002:a05:6000:4011:b0:385:dc3b:da71 with SMTP id ffacd0b85a97d-38c520934d3mr6843694f8f.8.1738583959600;
        Mon, 03 Feb 2025 03:59:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12247esm12921274f8f.53.2025.02.03.03.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:59:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
 linux@armlinux.org.uk, krzk@kernel.org, alim.akhtar@samsung.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250203102818.56747-3-tzimmermann@suse.de>
References: <20250203102818.56747-1-tzimmermann@suse.de>
 <20250203102818.56747-3-tzimmermann@suse.de>
Subject: Re: (subset) [PATCH 2/2] ARM: s3c: Do not include <linux/fb.h>
Message-Id: <173858395846.133675.14228724810206295943.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:59:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 03 Feb 2025 11:26:36 +0100, Thomas Zimmermann wrote:
> These ARM architecture's source files do not require <linux/fb.h>.
> Remove the include statements.
> 
> 

Applied, thanks!

[2/2] ARM: s3c: Do not include <linux/fb.h>
      https://git.kernel.org/krzk/linux/c/1fdadc8418bebba39899f341c3acdb189668e7f3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

