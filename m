Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1932BFC63;
	Tue, 13 May 2025 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165242; cv=none; b=PrESXY+thO/6mEkKmVXcSMkGSSLxfqTiSfb/35X7eVKI9/N71HzVznY0WJn04VqexOLet9E42qaa0+OG3XkAQN167lVIudiN/rlaGk/dyPLbStj4bP0FYAkdSoLKn5w0Snq7tElaR0r3cuCiWdKwvPUvRSk9YwrcpdgwrjJ+mM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165242; c=relaxed/simple;
	bh=iuaXUFkdXRZwH25Aaato396egM7lKXerTYhIHS5xkvA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKpJmhWV50RcPuyEoSVpojnan5bxCl0/4FKbWe5XToDUdwx3RXeHYgL58+dyxfW6Y70rB0RSzTmzzAIn7+TuLecRnOrGauV8yiAi1h+aelCfxwS6axpjBDWuma0SyJSdzeD+E6V8pqz2oZ3lOkqkNVy6X/9LUwZpC5268A0gSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2SeAb0a; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2SeAb0a"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso42310915e9.0;
        Tue, 13 May 2025 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747165239; x=1747770039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge/ru0EIxCZg8y7oNNgrAg2dL5AXcq2Pmu81/bUcIDU=;
        b=g2SeAb0aAmLathJ8EzPnTwp7IpP4yl9EqSM1K4MmKZBhkVyKeY/NB4AhrVZOtkqSmz
         Amm0JNnFvSg1nKp9DLOzAQ61XUwT9W9vZw+ykWKxfaqIZGIDY7SPxmM9bPEPsHipenMI
         45zwpBjG2LkBh3h2KbHpMD6xaZAu2Xt5KwLnRcLDxQ4Iv1HKwBHhBVblBkqty/WKXVAm
         5/X0DterGcgXCKhC9EkPYyStKhtA03i19lyQnqZ5jnwPiFxlK4UFuvvo/7KJwlxjtqtr
         Nnl3nGq1uYGkYxdgWeAleV51TJraK6KkVA0W+4xvA4+DNk5UX47upVzMzMC3g+BQ4/tC
         07aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747165239; x=1747770039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge/ru0EIxCZg8y7oNNgrAg2dL5AXcq2Pmu81/bUcIDU=;
        b=XspRKfcnsXQxii1MSur96tSHW8kEP5PuLeYrRCkh4uev2LD+pRZUkmnZ0inn+W67xe
         e3Ck3RxqJeTdVXlBCsQTnEFfvX5mmmiRwxyozWPeY40csZNh7HImw3czoN6SoYLNXN9u
         kV6ZZDumT03G2GaHweeK3y1O9PNabUZNSU0qoM6UCv3p9sXeyVXZm2ZQfj5l05WRZbMK
         CKaPLOsWNRYpvmo45EwuOOA6IitrQVjAvOzsFWod+lQ7Tl1RjKebm1cKvv5BTuRqWtN6
         SMZyaCSgFH+5/M3mjzlrfVdYyRHfGEuzVxeteKi2VBqw1CmZYd0xxXqknNWP/PHcwDEU
         j8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUT+ZmXxOrBCOfAeh/ecVPSKiZZp33nk3dzvBRoRIZ0rHEmmCRliuiND/tOe2x2Dm+j8FZ5rtAa0TSBwFQ=@vger.kernel.org, AJvYcCX2Mt3kYy30Ac9jaD+gn9D2ky8qF/GHZk2eD9mT5lmx2Fxgu6kBg0ymr/l1+HsZ2Wz2aqdEFPWC6bBx@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUAU/qIq4PpECTOylQ2QX8knYE9ihtaizmMhaybSjyUYir36o
	q6XovXd5h1TKymENX/ZevKh9YO88w2yXms/b6LywEXwBV7M0IJZ0
X-Gm-Gg: ASbGncsG1bwmHwDJnn9Mj29nikKBSB9qTVcwK+Jc89BBzJ8O5WerlXkF2DhoGXQpoNw
	qs00CJPDowrZb5NX2MDBjfqIsEopYqRUlPq0jOoZhBcm7HGgQQdvMbPpORsPbcLDUNySp+dw1yS
	/TtxC+lyYlvHJOg6WH+FrGWi45nA0u+wUTNlTaqR+PdVYHwCtNQikYbeex9PRIZXkIzm0Su205J
	eKoSjx9AGyrhIGbvAKvK2+rcgSHGUzxX26rVqqF3BB+fGM6q+PUGlf15W3wUKKKC8UGdhvOuYv6
	7+oJvDFu5TAwrinjsv12KQJJ9ePSLXMVSl89EM6OVwj1YqZpf6e+ZZAdT3OM+rdh8dMdD+a6jHN
	va263qrQ+fi2IoA==
X-Google-Smtp-Source: AGHT+IHpoKX2J3ZRgVCXEBwGRUBbn2eTk4NSfffmKZLSzChL9Pphfa0iLpwQENfg4auVKKfGgLscfw==
X-Received: by 2002:a05:600c:8507:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-442f20da0b5mr6159205e9.10.1747165238893;
        Tue, 13 May 2025 12:40:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d685c2d7sm177560815e9.30.2025.05.13.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:40:38 -0700 (PDT)
Date: Tue, 13 May 2025 20:40:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] CodingStyle: recommend static_assert/_Static_assert
Message-ID: <20250513204031.26f50209@pumpkin>
In-Reply-To: <20250509203430.3448-6-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
	<20250509203430.3448-6-adobriyan@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 May 2025 23:34:27 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> Linux's BUG_ON is done backwards (condition is inverted).
> But it is a long story.
> 
> However C11/C23 allow to partially transition to what all normal
> programmers are used to, namely assert().
> 
> Deprecate BUILD_BUG_ON, recommend static_assert/_Static_assert.
> And then some day BUG_ON will be flipped as well.

_Static_assert() is broken by design and only usable for trival tests.
clang also output the entire expansion of the conditional (even when
a message is specified) which can lead to very very very very long lines.

It isn't at all suitable for many of the checks in the kernel.

Look at the signedness test in min() as an example.

	David
