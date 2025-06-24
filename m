Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9F5230996
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770536; cv=none; b=HxbNPP/+vzxGHhO6XIWD6T/YVD8iJ+cI+etKqyc4pAE1sX68IY2rQYl6Ns05yaYiNT0U3sRlC5hoK7d9fvN5VsaADOqx2xlwmW7dNp+x4UQkhY1Ceg7D0IhiVOK0XZBmk62q6hviPINatb+dU02S2FC9LiCxIPJ/t/Dz1yCE6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770536; c=relaxed/simple;
	bh=8Qf/7GWBdnNGnI+ZQHywxU5qSOhxOpe/ufYU3L2QFGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWjACDIaieN8V2tcyHahsGG//wgetBsqgMmop+fMo5Y32aaFbTFUjllg7G68H5pQyXUqtdbiUB7W/dn+cBiG0rkgt7XMljTOGnjzWaRhQ+nxhSLjTxBZ33kD4Frtme01FnQNeyvtTGg9LY5petfxNJA9p252hgWie/ZyX3DHWWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAb1ZdVx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAb1ZdVx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3622478f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750770532; x=1751375332; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zo9M8XqjQ6KnIQB3+obzQfNRXfbqLOkBgRzdDXmyMnU=;
        b=QAb1ZdVxlQkhl8uy4piV9p1u7FwXiN9S1rQXwyQXG5xJHMC3Y5WLoHDwER1GyidWU9
         zLpWYovMVKnQi87vvt5fheJxuk6xWEjPx6/BaxIQd8Ox3gGnEfiQmelWTDzicstKbP8e
         cprTBLpJqwL7LAqZgqu22i6NEVnF0Zpwbi+QFQDnPvy+D8drYg28fLuuZfKkbqSylK/2
         7C3hl7X80r9ONaDweDxZ87f/XX5KXip1HFd0OSx1gWCx/MrbBtyGfV09W1dJCd5n3V4l
         Z5HEEbbMj7v8YVYjj1SnSyK2KAgRCi9hpjmrkr84a3gm9eHnAumsPjaKhO3BeQd8/FPa
         0JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770532; x=1751375332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zo9M8XqjQ6KnIQB3+obzQfNRXfbqLOkBgRzdDXmyMnU=;
        b=Ws41Uzx7aDDvfHjSo2zY4j/s/aw+XMqmTS5FfUZZcRV8A3blfBvWWdZ6ZbO+XdjJt7
         C6IdxWFFQwpJE6TdW+oolYE4/STFloaxekAdaNnutlp7Cgc6Eh8P6VLTH57M/AQ5VFv6
         EEgUzhLcnvLl4FCYf+OHJ9DF3mPUSTqytIDm5WX3dqqNwoh2LQs0auwNU/ZOIW5WO7mN
         n3JjDk2z+oMilqTRVpg8R+R/G+RUy+b+ibc8wFn2ArUKoYc3VaMCOITNVMpOZpIyq0m+
         Uw+DwhCGrahbwTTjcwchuAPnBGwHojx87fh2mMz+NldbfkFtLxzCw6G+Jb/8jD15scsi
         RrpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTgVh3rq8l6zWq1x/69pAlgPAxFzkhRfa0TnPpHsxweJiu5VmOqr06KPfaz6c542iCh2Evp1HRGlNEULY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5//LbVHVfp4jyyirfgRVEz2RGwBDthB2oPM+b+Dwy++8gEeo5
	06y6mnpkgRavHAWuDHSt2WEPJtco4hfUXhICyrOIDsDGPg5Xt+RfzNeleTCnoD8DQEo=
X-Gm-Gg: ASbGncuWYT41qOg5TiZtz/sLPvaRhMAmEfV5uidT2F/q8dktRqrjtURHkXycOXaLDu1
	yHfp6qsEQrsTtLUSX2dxfLul0/oMqzRD27A3VABrTYlqzCQWn2Xsv4yOOj/b+k1E/GIHdsofJjp
	UgWqlZQRsSCsGJjfItOCQ7Kb7I3O/EOG4zvHoWiH3in5v9HbWtAttdflI+eHBm49ohrxZuKrFtU
	zLQK27abRtYEQQAuLv7a0kR7HPOkjRgr1x5/GtDGEO1eaAwBnqO89ASBY4bReGNyM5RTumqqPpw
	VfzCJT4wLDc+0v/0DzRzJ8Oq5JPAdcbP7GB8dTdGGtnmJzeSMGCjDUJA1SadNdnObeneB6P/ai3
	vqRUEbVmdgAmu1qEvTKFQyxCC
X-Google-Smtp-Source: AGHT+IHIm3JrCDd31HiTjclWsywggmSy/t0CgZsQJr6S4AQyvfPIj5FhuomHptxnZshPI5b1+Xfmjg==
X-Received: by 2002:a5d:584d:0:b0:3a5:2694:d75f with SMTP id ffacd0b85a97d-3a6d1331a3fmr13279333f8f.52.1750770526175;
        Tue, 24 Jun 2025 06:08:46 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8068d3fsm1916501f8f.37.2025.06.24.06.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:08:45 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:08:43 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: timer: Convert faraday,fttmr010 to DT
 schema
Message-ID: <aFqjW1mGIeAMmsV4@mai.linaro.org>
References: <20250611232621.1508116-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611232621.1508116-1-robh@kernel.org>

On Wed, Jun 11, 2025 at 06:26:20PM -0500, Rob Herring wrote:
> Convert the Faraday fttmr010 Timer binding to DT schema format. Adjust
> the compatible string values to match what's in use. The number of
> interrupts can also be anywhere from 1 to 8. The clock-names order was
> reversed compared to what's used.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks



 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
