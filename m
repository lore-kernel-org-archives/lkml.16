Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846DC2DFA2C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641755; cv=none; b=PvRJRT9oMAcA7gdpzfuvz500sjiNbZMKV1bCn6ouCLJfyLrAve81TMlsPBRz+TsQW+LZmBCqiDNBezfS1L8ics3QnNvFVVFgmYcbnzWWMAs0W+xWWx4GslCLpBRUYnBh8j7sEw7S1tsy4c1dxqAxYdAxPQM9Ghp3bY9bUD0IPC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641755; c=relaxed/simple;
	bh=djtPIricfHsVI23PycDI/GBe8v9Mj3BQR5+LxJFEu9w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Yy8Szjo28KoORXyfC4cpiwIluJy9vLuQ+/4d9gCFKugRkb8FJZaTBjxDQZj9/EAkJ27z0caSiiHurNPlnk3vRcN/owEBSkN/1oCqwaHzEvKf8CeMdPc5xQ9I16e4ttQSDfofzhm8ld+xgk7sDCavftahLcSnszYSbhMPpP9Eqa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0bPt/tu; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0bPt/tu"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso5695219a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744641751; x=1745246551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djtPIricfHsVI23PycDI/GBe8v9Mj3BQR5+LxJFEu9w=;
        b=c0bPt/tunPhJsfaqa/aUW3sL8+jcyay6fcQi4hWAyQtZ4s1e2iHcxJKN6EKWJE0d0Y
         Irp6rZx0BW9OkxxPssTL0npKH66bYCeCDPsBZpDYnIiQ9tFytGNO7htsg/bcxHC6GLLJ
         5wzjKYT6EIknhNa8EQl9erEel/iyj/hA2SGhUu1GCDZhOUAW+g/jXjQJj1adD376DFjV
         Z1m/zUkP1i/rcNbZuV0WT5ZMH0XmGhry7ZN7THr8FzMCNt5SyHPOGAAJfneeqp4t6Boh
         pP4nX4T9dPzLxQs00jsvF+uCMRLTRi9s8BZFX/Rq6ubeoyRIlPzexDvJFk7cf2pyuqJD
         vbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641751; x=1745246551;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djtPIricfHsVI23PycDI/GBe8v9Mj3BQR5+LxJFEu9w=;
        b=PB0QKc0T7lt/oSiyyUVV4KVIUhSYTU7P8SyA131PCo/ZEr/0NTl00gKOMTayVwzxa+
         GQSL9mW3JFK8M7IGz9q+ENW2uGdJes3xplsZ5G/wgsoLYzYeImfKfi3SvV4YlpT359/H
         as06ZWfKVx2vwn1Sp43IXMcDJSDHVXK3x/syhLP5p7jaWvSCn+FlTf+MiijvXPlRJ6Ob
         ZVujDsYV5l8R4Oj9mit8S/xCfNYZAAMzDFvRJut2uJXOrqo8i/Wi2XM7y6Mqmv1JwL4W
         +X518Elra6X+cHQL+MWTnXWamprtqq6IeRB1/3xeYMeq3hPQK8QO2/2tsae6aiY2iqu4
         s7Ig==
X-Gm-Message-State: AOJu0Ywum7TPkvw4zSIowYfnJzDejomKK20CSgt/70mti/p294OhLA6k
	G9bn+7qrHqeVoFExfAtpffggcRbOrryFI81yAreVqxl1rPZMBN4WQcDkeKGZNhPPVRb5lzHVeYf
	kyamUUAwCp6G5ENypVZkEYXIIrQ/XC9osS0adPA==
X-Gm-Gg: ASbGncsK66TZKct4u6PI9EGsQP74rzDBSpDEsaQkvO5l88hbZvU2qM6UWtWWfTAzC71
	QbcyLSrbzVV/SlwxCp4u/g8lCy2jmaTUv4U7klNUWs0sfqeE5GMS/MtoQkg7wEbK6PV1WnF9MXf
	uvc68Tm1g7nZLOWdwSVmFriQ==
X-Google-Smtp-Source: AGHT+IFsEcGGKysAt2vnofSURYifpIKNzH9MB3cjbD3WlRr9gBUyEtpSG8hJvd0FN0uCbpU39LWRCsSE6cXDMGEfYF0=
X-Received: by 2002:a05:6402:845:b0:5ee:486:9d4b with SMTP id
 4fb4d7f45d1cf-5f37014465fmr10040923a12.34.1744641751210; Mon, 14 Apr 2025
 07:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 14 Apr 2025 16:42:20 +0200
X-Gm-Features: ATxdqUFBVoO29GwOxxkKyUuhT2RpIRz1JcuDmC5FOD6Sg1krHAdXW8vFt8lFRwM
Message-ID: <CAKSQd8VKwk=d+ymSp8t3Y6n+pJP45FRXJXWRWmzc4-DTm=6f9Q@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Add two Intel CPU model numbers
To: linux-kernel@vger.kernel.org
Cc: patches@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [...] propose we do the below.
>
> +#define INTEL_DIAMONDRAPIDS_X IFM(19, 0x01) /* Panther Cove */

Make it so.

(In light of the fresh RPC = RPL,BTL mess.)

--
Christian
