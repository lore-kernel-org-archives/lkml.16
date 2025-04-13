Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8001F3FEB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574424; cv=none; b=P4vf03q4FU7HMMESR8+qZMwH+L6zZL4WaOi2pbrYhw9KBib5AkYZorfFn2CauVEebVaTMSgTiHlY5ufXQNJVvjDXImF2LRGdB86TCCKEnj1nWRj0TWX8TdlZUSiHU+1R+thHMhkimfXcIupZ38QciaCe0XvP6yjLcSr12AbA+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574424; c=relaxed/simple;
	bh=QJ2echnBKmP1Tc0MPNN5Qs/cA6RJIbwCOvfk2b6xdjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iBm/my9OvmjTo8uWynID2KQ56cRE53XoGMXSzjJDcQjnkpnBYbvGbAYNjZlEJtKhlpiy/XBksSU6k20Bxj7uc0cPqonb/5x5pCbtaT6Y3+b/lOpweFRbHroSbUrEaqHUTLK88LM6xrV6pIo+AvAP8t6xd/N2E4Eb5L7t76Mu2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rkTQcgXG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rkTQcgXG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c1389so2442072f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744574420; x=1745179220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRXcjlCuBBWXh12lLPtZTq+NKWPipRgLKhuCTXh5/1M=;
        b=rkTQcgXG8jjTiFwH+FSfUA0XIp5wl2xUDG7/bMz2DCsRDGEv6PQjD9nNOss4a4xwC1
         tVhi8tPQgu4QdpvtW8piDZkYtpR8GZO3l+EQ0FEx2h2Ygu3ieYtSF97vtw+d4f5ZQ1hw
         ZTSl+Sg/O+7xqz6FbvlLvH+Rpxk01WDg/jkWkg8OsqEz4EjTdxXB68hkk8f5WZWEXhl0
         KUO8nv/R/WloqdHK/6wDXPHzZ+Zo0+4Kl7g1FBPc+m8IEBeumI4Nq9l/Wkb6Do0WmMdX
         0GkjmojXWLCkMZLZ4wgTdlc9J6+xZwvV651WFX3U1qJ6o1XPSNgUmpv0CjwgR02jdwJU
         I7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744574420; x=1745179220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRXcjlCuBBWXh12lLPtZTq+NKWPipRgLKhuCTXh5/1M=;
        b=uyWGSj0pFEntBIcbQHCEOsez11UBRz2sd34TtbxgaLWo1VixpUwl4QYGUxEzTj/yTE
         0xZ+xKcKbrrslB8flYbV/Pc8icjYmJlY1S8afI2unUjwxm7KIq2/xmQnxvnLP4N4gBzA
         CoUewjRrPWcTmJs6z7yB7sjq6xUCUwqkzvXCD1JTemSb0aR4p/Iz5xda51k8AEO3S4wg
         B8nqqQBebVIhPyM5bTFQJumnS40PjEeL3Tz4Jf2gkZZsSNE51YVEgDhBm24hGcEoa1ki
         RkQOX7tv4LGFb6+h6l4I85EdiO+MSHo+sQKoG9RF7eE+3iVHx9UChgHer32sEdcNwLOQ
         LCOw==
X-Forwarded-Encrypted: i=1; AJvYcCUMoZJGp79tA9RcwyWxr4+Q0I7NqhlynwCFDEAndgf3DOiT+R3Tz2RqWMoNXoATaLXTMPjyYzwkEVGPX6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2F5paGwFPCz4QC9pWsQKh0wfaVTvvQqznJGQV/L7fAAttBhc
	e8fFH0VXfG8m5su5BOupj5APPhmYkQ0mEuevzYDU3c6kVVXp6IuQUDi08IgwDUI=
X-Gm-Gg: ASbGncsyIVXfD8LGRqFefKh7nKE/xf5x759vAbGKGHz46M0OTR0ZjCFRNwR2wxnBNao
	Z+qApHFXnQlQdfaZ6jpcNLH4iCIAVEwGbPMh3DKVpnGN+OleUxkvVbB/GVXEzXJ7FinbctRQndB
	lSdKKZKcHwnuJ42nfs6F6rccAEWGrtM5ITEbKiCmXveNY8KGuM5WUZd+r7NjfcahQykCcmW/woa
	9iFRibPaQt1+rC6jQwvqHxSgoSFq2UrnGmHr4cKZJgJdWes7F0MwfRq7qAWwV6vuvh9Krt/rrMc
	tmFMj8SethQSRnq4O8va2pbHXQ+7CiKBjarC
X-Google-Smtp-Source: AGHT+IG6aXB8MfFdxS06qXTQl7E0SZ9Bu9T+Rnn8pWyPvB1ogSH7Ry2LHZj1Y9t+Z1BdYzRzo+8lFw==
X-Received: by 2002:a5d:6da8:0:b0:39c:1424:3246 with SMTP id ffacd0b85a97d-39ea51d3527mr7164305f8f.2.1744574420199;
        Sun, 13 Apr 2025 13:00:20 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:e852:1f2c:a4b2:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce0asm8810540f8f.70.2025.04.13.13.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 13:00:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: Allow to use setters with return value for output-only gpios
Date: Sun, 13 Apr 2025 22:00:14 +0200
Message-ID: <174457440298.11196.9277089690698361995.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411-mdb-gpiolib-setters-fix-v2-1-9611280d8822@bootlin.com>
References: <20250411-mdb-gpiolib-setters-fix-v2-1-9611280d8822@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Apr 2025 16:52:09 +0200, Mathieu Dubois-Briand wrote:
> The gpiod_direction_output_raw_commit() function checks if any setter
> callback is present before doing anything. As the new GPIO setters with
> return values were introduced, make this check also succeed if one is
> present.
> 
> 

Applied, thanks!

[1/1] gpiolib: Allow to use setters with return value for output-only gpios
      https://git.kernel.org/brgl/linux/c/93eb2c1249eadce4bbc1914092f34f5988be13af

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
