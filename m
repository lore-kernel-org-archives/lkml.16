Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796A1A23A6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747911697; cv=none; b=IB+/1AumIb3ZdaD1TIUYb5ZIc5nNuQNujzOrM3OreehG0vUzRBOcSgJhE4TU7gLsQ15Ju7QN/+S/IAKqP/K0xQp2qM/VWR3XaADG3vPLatlFPqYxv52PzlCW2wW9VeURNSeQ04QCan0UMLsXYklG0+gJfK4pw1c755i7QAYmARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747911697; c=relaxed/simple;
	bh=qXgQFiP9zdYe49wiGj7TaFAwHtShTEVf5cGGUuLFXKY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b36qAngVYSigG/+3d8WTT91qb6j4BhU+5qiEqPYZF3XXVOCNCIoplobRlhQFUYYGg+Ppb8THNSuw5dGvnvkU9X2XL1RD1ge8zpc6Q37uFoQlYzoAMG7RJ0tk4p3CMVB7hFpcKVaGEQy5UUP/2xPnz4QgifvHcVzW4s4LGohtwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=cbVWTJYR; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="cbVWTJYR"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85e73562577so834895639f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747911694; x=1748516494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er0jXo5oOmMu/rDbFaN+1MqVw9z+fLQBI6xqJSB9pUo=;
        b=cbVWTJYRoX3NK8V3Uy/lh3nIhfqbvyl/2UHvw9Pw/jVAn55QmeWBHOgG4uf3uAmNgb
         BG6vhNQxAJHIX3ufwPu4Mw4Mw0DslG3KBU80jQLZGXjq7WkJGim7Q0S7N+pXI8yvMQl0
         BpXNor4S/FnSBVZsgRjqXBTlIoyf+v0I29trqHkaPRA8cgAEFAMPvuHCpEXwGV6UJUm5
         4o6IIcaOdiQjIbnTjZN/wEsYYEydFIDeHhaciW7Lpbj4BCwfIhdFcFdNZpF1ww0SgkJm
         CBLkB9yXkrs4ULD6ZBfkDTt9KsXIL55KujYNEUkto7yFo3IHEeev/LC7MT3hB51oiGn8
         Bweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747911694; x=1748516494;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er0jXo5oOmMu/rDbFaN+1MqVw9z+fLQBI6xqJSB9pUo=;
        b=NoeKsbSxoKVyeaRFJ8HldpWvStFQD4EvSQnj28R3gPp0ycF4nyZpgMcrRcgaxn4pVE
         fyK8U3DDQ3g8+vZhPBWTVwJCdAtdWYjUs+HP0RWkZjoB78kaF/AQ2JVHzBlEwVFO1xdY
         KSvNyAg7GXyFTMaEsIgzYJMrxiVpzIQAfywW0fFHWm0iwUe+UTuNcRunjktLLQE6TuoH
         KHHbpspg5+VJbcsJMe5na93DrGg7fcq2+Hd1KSn4yKgX+Kyk7kmp0qwloRKUEoZAeRw/
         pno6potVUKbf1bqtZnQ8Dk/O4fYKAkffSU+fO6G+2yXFpalJTyDzZbKvOhy2fsgo4pP/
         6DCg==
X-Forwarded-Encrypted: i=1; AJvYcCW5jUeB4BhMDZ4+EGRxAunGb3ML+/YIdxfj/bYIrHOqShrdAbEjkEWpPDKYm3yP0OhVOuNyUEANfBpuTJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfIOjLhUfWADGAhz6Fwql21EX0v1v4Cvq49we7tLQKJtYojbZl
	WYb2gsQ9arP/bMMdbf0/dRBH5iEqZNiHdtRjIJsPUKrMFfZhycOI+axis7eXpmUfRic=
X-Gm-Gg: ASbGnctS6PidQIA8HZ2LYghPlUlWunMlho9m1xU/NwzwHqHElu/FopzKoymooKA5/da
	F2JYPi8WUfuew0g+n0ywLdBL2yER2eEWjBWKJ7qDj7kaHC8GolUWd2OKl56Zdu1jfOnsOcVhTrX
	htU/OQoi7PwaBC1va1vFBgQEqHn1Uznz1/Oox1knXC6lEPE7TPClBXN2Qvu8oQMrsfAu+zOLErT
	qwcJTsfqz2x6uIpKR2uq0U3n8995+yMDMxEO67zyRgIILVpQ/kbuqDQs6E5KwGQHqSGfXwUTjdQ
	KoUPn22+H5LnnS5vYNX1LwZmqzok7xWZ8gusF2AssGU=
X-Google-Smtp-Source: AGHT+IHx+VvVgq+ZqV1Ts6u6c0D0dY+PtcAR89odzCGYw+Tu+H75LmrDfffaf8Va81+MCQKJfbi+Dg==
X-Received: by 2002:a05:6602:6cce:b0:867:8ef:69e8 with SMTP id ca18e2360f4ac-86a23175f1emr3267453839f.3.1747911694032;
        Thu, 22 May 2025 04:01:34 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3ae126sm3092441173.37.2025.05.22.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:01:33 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250521160720.1893326-1-csander@purestorage.com>
References: <20250521160720.1893326-1-csander@purestorage.com>
Subject: Re: [PATCH] ublk: remove io argument from
 ublk_auto_buf_reg_fallback()
Message-Id: <174791169320.1065728.9443828880429452099.b4-ty@kernel.dk>
Date: Thu, 22 May 2025 05:01:33 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Wed, 21 May 2025 10:07:19 -0600, Caleb Sander Mateos wrote:
> The argument has been unused since the function was added, so remove it.
> 
> 

Applied, thanks!

[1/1] ublk: remove io argument from ublk_auto_buf_reg_fallback()
      commit: 5234f2c3e3010f1b9c90b617e92c4b38e3240914

Best regards,
-- 
Jens Axboe



