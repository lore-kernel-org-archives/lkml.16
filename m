Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647E1FFC55
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751319587; cv=none; b=JdF6wFTZ7sv/SrpiYX7J+SklCVLk31VTlqG6C3O7UIkXcvjQxaLptxnwGcF/U1iLgAI5zINkzwQrYjd8B4hx+C3yPg4Z6C3CURq7V1awULgrhq/LCOfepVl8vEXd9/sCSfWXCMcD9lpx4aZLLhWEW3baoRu+8gcA1N8AHtFRcX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751319587; c=relaxed/simple;
	bh=pwawUxuTJKMJ0eihvMj0l2HZinYV17lWiqOb1DIZatw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KT7Kh/JruWr3Ubf3uLuEWPH32TZWK93bEaIge2uHK34JAPBeuAGCFovBtqn5Deu3uaXrZe2A2p5Czuxa8KIe5NHNd+LVF4CtDGoq40tnLFSY8XdZkyNWL52h4vD2gnrBUDvX0TkSDmfflPIzSN2RLZqeIRe5hHsgD2X3WiV9hTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=fTpt2g1j; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="fTpt2g1j"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3dddc17e4e4so8358915ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751319583; x=1751924383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nx5J66R25s/M941oKLiPzdOIFt0QLiFvc7xJpi+QQqI=;
        b=fTpt2g1j1KaXEoiQlHeafM9hSlJkAR2Qsvs3jJN7+mxW9nzt2Ciw/wAYWnLlmUa6px
         oYoXhP7k3ZWKykhbQxfxJNIqOZ3ToS0eSxFXbNItFMTUVpbbs4nEjBFDV5e4cFt10EMi
         lzuHzV3VWvPcad5e2A3tahg/5luICcErhzUYTNMUbT55rtlBQitBzyXs1ZImdVg1egH7
         V8/p+38KVRsHLI0WtGhVdAj1OVxmLkMulbO3CkeR5VrX/SqxIQJCAIncp6+eq6Qd2VhH
         BhyC8kjNoXBOZHo0Qtk5WFJflS7Ut2v7G6p9uG8VozLxniZJfgsMjVepmnbTQNEYzlXO
         jHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751319583; x=1751924383;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nx5J66R25s/M941oKLiPzdOIFt0QLiFvc7xJpi+QQqI=;
        b=V2CT1M5v8esxlikE+xlHHQH3odE1+rU30sgDQl1hHoA5uyewKe4kyBK0pA5RUEMKI4
         ystiTX/2d5UOen1bR8uTaS1pig68yDaZ6G0RXZLKA+KeE9/1hMs/j9BVHeJ1yGKW/Xi7
         sWoOfNPwWsxe4dsJElLryv4vUlb5GMsmos4Rpn0+t88++5OgL4T0PK5psD35ajUyeIQw
         5ydNKJQ/kwRZVT2Eps13YL6fRonLJBINeOFhPEsV0qVGOBbIIs/qYE0NTFcsdXXrU1de
         IKyH4EAKJqHp4othXrpaNkKQgg/hTpBko2jh88dUFeG+0HXSqPfGXYT3oBQoz2eL9Gvi
         jMdA==
X-Forwarded-Encrypted: i=1; AJvYcCW0fEd7gbpzP4RpUhIivDzytHE5hYgqUAAQYl9J+zo3R+2jAGa8i1awGrOxioPmVYv/lYb7xAP5PoXMBPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37C0UdrwiAlbjNucBcj13lzpiCBJHJIcBBh0/zV+Qwijd1khQ
	HuBCMenne10s+vNQlt6aAkTmAdVp1GoqpmPM/Swhr3HKKIpWbPj23BTLOON3GcjlPKk=
X-Gm-Gg: ASbGncv8lq9I0yY0X4EKMudAPaNiFUmCiREbLbgaTRjk9u+1BzaO2bYamywvfrGMZF+
	Uc56wa80KpCi9sAjMcHOlqEORBfWg3f/oAP7Nws9YY0d3fVb5FBYb3GEqCHjY6XCNTk/VHHNOGH
	qd0rxYyjIpeknPSEVNUFi2/mOWVkedLSYiNn0hqqx0kQtn1Hg3FVQaYFP/+mjKrJo2jgcOyQFbq
	T6wAbo/bbGpnPVlWE/wQjI28emMFJLNN84ofy4XSaZSy1Nr3oBOWL/APRPi7L8kSsQB1wIAgAe+
	kHtXZk4SHfRBJZifm7cWhI0dNVMIunEwcLbVfaSLLrbToKdjKJe2rA==
X-Google-Smtp-Source: AGHT+IGFZ1UGeRClqiUXKlzMceHpj7brXENqsvG+bvfkY2FdCvIG9Gw0zeAAdhwMDcM3lkPL4MxhIA==
X-Received: by 2002:a05:6e02:4506:10b0:3df:4cf8:dd46 with SMTP id e9e14a558f8ab-3df4cf8e0bamr92283245ab.10.1751319583358;
        Mon, 30 Jun 2025 14:39:43 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3df4a09133esm25220145ab.41.2025.06.30.14.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:39:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: io-uring Mailing List <io-uring@vger.kernel.org>, 
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Christian Mazakas <christian.mazakas@gmail.com>, 
 Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
In-Reply-To: <20250630203641.1217131-1-ammarfaizi2@gnuweeb.org>
References: <20250630203641.1217131-1-ammarfaizi2@gnuweeb.org>
Subject: Re: [PATCH liburing] liburing.h: Only use `IOURINGINLINE` macro
 for FFI functions
Message-Id: <175131958214.269614.649326071375683625.b4-ty@kernel.dk>
Date: Mon, 30 Jun 2025 15:39:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Tue, 01 Jul 2025 03:36:40 +0700, Ammar Faizi wrote:
> These 3 inline functions are for liburing internal use, it does not
> make much sense to export them:
> 
>   uring_ptr_to_u64
>   io_uring_cqe_iter_init
>   io_uring_cqe_iter_next
> 
> [...]

Applied, thanks!

[1/1] liburing.h: Only use `IOURINGINLINE` macro for FFI functions
      commit: fe1fc8c0516954d345ee5f7613b8e4740b69b9c1

Best regards,
-- 
Jens Axboe



