Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0036A211704
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818998; cv=none; b=DyXJINfjXQMz4/o/gWwxYynMLj9TIbdhqsJlK3eUtFsAUWQNa/7dvs9PiV5tVrsr8QUqLbl+hl8iHuIiUdoDUn4v2ClLEDnoUnRXAvCNyipUEw9ltnF2elMwtrT/hbmhR8NyUix65hzKyLLSTY8Q9tWR9BTHqMRf2Tgp6K+VH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818998; c=relaxed/simple;
	bh=kN9dNwFyctrG+SygPEzy1CiyJrpLugqsjEpUI395zpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shZbhOWmB5rXEOWTykZKAv1N5ohaQrK9xEzFnWkRGEOcDteEg+EQn6szVWkO6n9rZeRlxGvAxaZYhSS4GeEI8twoE4FWNVWVwMAwLr2zA+Tfh+rGs7g6zUX7tYMTyhYJPHTdj1EbqHxCL6sZmZLQvoxKdjBqRrfTnVtdWBj7WnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kTrCEUtS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kTrCEUtS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so72064495e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818995; x=1745423795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMBYANIH4HAaOQkINTO4YWTiE1ri6Oa799PROw9ojEg=;
        b=kTrCEUtS95z23gkj+VfyezV0pCMuOvAsQE/rWqwzBppV8VLvguh9fCiVynRUISk5Ea
         R3JF/ZEbKuSf1XSdoML65VTnlJWNYHssZ9GktvBVXyreJJon0dkjnJ+zqXOACY1ElLTp
         GeBDPd+70Ii1czjjtETj6x2Axl7Y195lL1VmOAYXMH2ISWw2MnPSfM8KWOPV+wJ7mvKU
         tmiyO1wywl0egDyTRSM5BWaIDABPt1qJdMA7Yd7LyCzpwLHzke/3ZpLHf1SOiJDI4Lck
         MpHo5WA0+DPSlU2DsTflxgVLefYPiOvCTk3aIBLtps6+K/VxW8AbMRs3DHsN6gVQ/PkM
         OGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818995; x=1745423795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMBYANIH4HAaOQkINTO4YWTiE1ri6Oa799PROw9ojEg=;
        b=BY+pQm1GpKkaA+NSJewsJQyDomRB740KBlnw+KvdAMWN0SEuZKgwZzx6MO+W9zpMa+
         heyONlJESGY/+AhtqasHqtNRkBgDDhnM4OuovBN+k7Ex8qEsvZYKhlYpSj9O0XIQIM9y
         gc94yYn1g3INFJCsvMxdbrv1QeMN8US9uNPDzEokoh98uSVzojWpAZzM2cymU262Bpiu
         8Nbz7ex0rwr2VrC/qYciHNARBvdYB1Gp0UJukHLltnynXDARxuxdiEfcT/eNyptyaavd
         wJeJp9u1UUFyeExkKn3KVIWnpn4ZVGEtr4zIJ8TtcGnBStfVZnGh1qgD3I+QHpm713Ki
         moww==
X-Forwarded-Encrypted: i=1; AJvYcCUaBPLatLO0cidX5vcbsESQl7WkefQuZHv4lCqaC6OF60v1vQWT1q/kQHfLivlNaZ77LKeihzrA1289ojI=@vger.kernel.org
X-Gm-Message-State: AOJu0YysXa+HD2Ii/CQqOPaaMuB4JM49zVyZooWI13LvIMGmpIkxL8KB
	kMvBYkg6PJjOb9D4MLi/6EVoAVI9KIBL4yzlWtFGkz8GwRoBIrHolZDISqCbuvM=
X-Gm-Gg: ASbGnctMVsaEquncOioUJt/nyFvNVNFbslNCc2e4rQ3K0e2bJUPdneV+onCY2yiTGe8
	tD93KyexSdl2DtGCfDFkPujimyTDDc9u8Nj100qMIphzyZNSXEf9ipkqVdjNlHkXXWI5Vb/BHYi
	TIfFoFF9tH2G9JhFSJW+XX4Onw1jZgEhgUpn4fw17sAMlfTAuVTiFZeVeIKdyILqJuADflvgA8M
	syduxuHYlQ55y65vXNCv7V89TXlOwpazHoMVPxEnVmhFVuEtkBpig2kVPoVyGMCLqDAmVDDjv3D
	LBHsHddxdIO+1YfhDf7Fsgl6vDROoZqyFNxDDLHQ
X-Google-Smtp-Source: AGHT+IEzIxlfH9pTJUHwivSjsywFDcUHME2sz9N3dkUWlFPtI3MHdU98OYXUtjaYYsLokpDPqmJi6A==
X-Received: by 2002:a05:600c:4fc9:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-4405d6aab0amr23312195e9.24.1744818995211;
        Wed, 16 Apr 2025 08:56:35 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm37224015e9.1.2025.04.16.08.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:56:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpio: ds4520: don't check the 'ngpios' property in the driver
Date: Wed, 16 Apr 2025 17:56:27 +0200
Message-ID: <174481898215.8191.5803083657000045328.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408-gpio-regmap-ngpios-v2-1-26f254014f57@linaro.org>
References: <20250408-gpio-regmap-ngpios-v2-1-26f254014f57@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 10:40:57 +0200, Bartosz Golaszewski wrote:
> This is already done by the gpio-regmap abstraction by calling
> gpiochip_get_ngpios(). We don't need to do this at the driver level.
> 
> 

Applied, thanks!

[1/1] gpio: ds4520: don't check the 'ngpios' property in the driver
      https://git.kernel.org/brgl/linux/c/c21c43c7b59f9f2e357c3f54072e3fdf89ddae22

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
