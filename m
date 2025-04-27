Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D92F1F462E;
	Sun, 27 Apr 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752228; cv=none; b=sk8Mz1X7aoY4BveNvZr0FmuqtXJrC1jMbd99xDVF5eRy0B+kAB2Kn2GhboEZdXEdpku7mQ+a37nvQ6uAfbf0SLBo8AMQZWZJQXTt7kFLcdyP0xULkmJLnlCKwpMN/DltmhCu6RjwCjvHL55cfNYofo0M6EF6gjWvsiyaMr2Ss/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752228; c=relaxed/simple;
	bh=kcYaWRW42OiIwBPtRUtbQoSo/+BH+rXcK3hwfw8l6T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEbmfA8esEojmu4//kLG/VtZroT9LJip5TNaX/1kg5KA3nU1qQu0PI38uH3/2JZiO8cW5uKpj+K/+I+UidLV39pKKiqukdpMAvB+iSG5ntyD6CrEinVbwvDIWgkfbEGqhCIDSKinU5jiuhhxP57lkq3+NHUt8zazTZoSss9PboE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoqjPwUW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoqjPwUW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so3407877f8f.2;
        Sun, 27 Apr 2025 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745752225; x=1746357025; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IZ6YYAg8Ss5u+Qu/mL9ZNCceDcajR2cHqi1V2GCUqag=;
        b=aoqjPwUWTKNmmwuqfoKbfTm1UInGA0OqL16i4GIhdPD1xxRab98MjhcXMUkc3paAn/
         qIl+j3f9W+hDxgbZMRL0V8+wYyRRviEMKtXo7h3gAQzHmXCKW70QCqUvAMwawC9q1Owp
         8EYaF0ID7mqbUj6R8yzjz2qJdgNNwtvUv41NZYHeiiQ3WGhKbcPHpFlcM4x1pfpSlWXi
         v6Be55uLEoIrSvudAWKCGnHYI+y+wxfvIYdWfkUAJicxX4qJmHOfaUEHSL07budYIplV
         mtwyTW2eyZ3vmzAr8/KV1hb7T08tiJ7zHJP+mSIz3ZL0R9ekndcGk2qeqBEREFp1vdSu
         NKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752225; x=1746357025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZ6YYAg8Ss5u+Qu/mL9ZNCceDcajR2cHqi1V2GCUqag=;
        b=Q6vuBT8KM93arSpUyLU+/CduJhEiq6Qcba9V3uWFGAGqUNpLoMS1oeApn/MG5i1cSh
         ycnC/7glMlsKcNKZj+kDF4O7MNdaxSPBU0mXDY9PlGhTFctSfaBraonaAeDyKxmE1zdt
         EGMPkjv0amyvEMALtw9M5i0YmVNDnrjgGiszVHnI+BTNxA9QeLsPzVRCggk7hvDCVdxM
         tjq9Kr+iUGqxC8YSEmrtn/0qWwbMmLIWVL/60fnZ0OQWiC2bkfPp0znU9uS8w2sjwiK8
         /jynZFrnWurwMstIPD9zSKCm26GE4X4LzHTlNhT8ojO6HK/9vd36qcUSIkjz6nPVWJcH
         s4GA==
X-Forwarded-Encrypted: i=1; AJvYcCW6urEDis0Z5Culy2DBmrku92JTqMJyoWEz6e+qftSFPw4vIuF9IViUt5HUPPMXD/VV7+AJ5mYlcFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnBicqHGFNnJ83Rk0+LrFzmFYsEODWCJcl4O9Zsj1SOBlrIYZP
	ggJMAwn+4XRYV8TrqWswm5wsAvbEMMz9myfMzwjyqajyJ8/NyUKhE4lSCA==
X-Gm-Gg: ASbGnctOogcNS59jlitg0ggFuP0ufVHY3E3Wh1g6CNAO08tVdQUraFljGxyxrrX/Fcc
	TaSDsuDpbyRE2ZXvPc7p3xZQyQV7nF75SKnRXhzEFRJbWWf8OABTCmqEvS11FOQhDRiwx66pzrD
	zQ6ACc5iuQ0FzJG2iPyi5WCUavBRgWMlO+ffmDtqLVvjpV56Y3tr0wMZgAfPq6SdEfyvmHW0153
	9kcej+yJUpZN57nzyGPIdKm51N+W3/xf67wsekIVUEZXQlN1Au8a5I1lF3qDki0lutOg7Ns7kaw
	byX61HAkWJFhquleKQkJ3hSa81Gte5ocqFUAgNKk9Q==
X-Google-Smtp-Source: AGHT+IEQ83us02W3E5+nauikCl5Tq1Km3IzPVAuRsxKICstvHbuw/VuRV/NinlqPrn0qrA06Fr+pCw==
X-Received: by 2002:a05:6000:40e1:b0:3a0:7a7c:366a with SMTP id ffacd0b85a97d-3a07a7c370amr3945974f8f.24.1745752225441;
        Sun, 27 Apr 2025 04:10:25 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e460b2sm8172727f8f.70.2025.04.27.04.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:10:24 -0700 (PDT)
Date: Sun, 27 Apr 2025 13:10:22 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss: do not use sg_dma_len before calling
 DMA functions
Message-ID: <aA4Qnhy5DKMrcwGa@Red>
References: <20250427110503.14775-1-clabbe.montjoie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250427110503.14775-1-clabbe.montjoie@gmail.com>

Le Sun, Apr 27, 2025 at 01:05:03PM +0200, Corentin Labbe a écrit :
> When testing sun8i-ss with multi_v7_defconfig, all CBC algorithm fail crypto
> selftests.
> This is strange since on sunxi_defconfig, everything was ok.
> The problem was in the IV setup loop which never run because sg_dma_len
> was 0.
> 
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
> 

Sorry my system didnt generate correct CC/TO, please ignore.
I resend on correct people.
