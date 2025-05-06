Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587C72634
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560833; cv=none; b=dJZqaU22jprEg05x9Kda1HXH0VFwdEOqbf07vSng1ciJp0O+ysap7+pCDUFjAzSctAtfQg5J79lChrFEpP+dvBLeXbmTBSSpYpRhE5DtEz9nBGvhSBCKtCZ3qmt7g7HfTs8JA8P9PtvYh+LiaGJkTJaczTRhB96XkQ4L2xL9qNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560833; c=relaxed/simple;
	bh=TDw9phRmXi3xVcDWD/Dodi/SegUbRaaI4gpyeqzoYfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CzE6ZAePA/UydnVArchGJtEVhuRKoAU57tg6RYVoeDbSto9Fc0wS5KRcqbdAwMan4b8ZVZyvgE4LSeERKznnf51tZ6XZ/BXienjxhAGN9GFBshRnFyNhy3/U/kavbK0T9ANqxa2+R0Io/oGjcuLT6WgO9CEQYabWGbip15pCFBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=zXp5RD0C; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zXp5RD0C"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d8e9f26b96so53672635ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746560831; x=1747165631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkX3c5/GMMV4oRJ74gAOyvqF/rDoibhnZNI5+zww/CI=;
        b=zXp5RD0CvoGRePRcOL4aPuGAm6rY6GtFDO2FmhYj6WtOV5LjhXAmYKnpic+M1JPxW3
         mAn8wCVtpEzcZoh9lFemqmhFU78ocZ6T0ERtJsUHH8SMQnBkRN54+x4RKRQuVW81Pw3S
         S9kQxidx68sp27ee4P1pB11fHrZItesXvZkjK2T9nXr9MnMc5+lQz9IqSEjivdAzBrV9
         TzjGO/imSf7+lCxIYgHnZOMgcrgeqidyE8/gSNj9WZJhXcl7QOZX4M6cgzYHmGSMnauH
         rwErfvjYhcOVVnISEmDUNDvKVvpnDjGUuINZLOU+UPlC9RKb+aP7rtIusNkQjIepwBZL
         tb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746560831; x=1747165631;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkX3c5/GMMV4oRJ74gAOyvqF/rDoibhnZNI5+zww/CI=;
        b=MzzC6nMeEZOP43nblzvQfEqTfjq0D/DOIhfWvFXVYqnxIrSu0nfC4EjQ7D3tfbHabL
         Ll3nSn4OkD4dvQl+2+dyibYJM33S+q42Awzg9J+rGIqm4lHO9fQ3axxpfDaBu2SLwlRb
         5BxMmet1kkOmEtQTolQZtBzcMiG8d61698PBKZU5uYlW6Pdk19DEUNiSc0oOmE/duU1W
         T9q6uAbW94hSLodBSGp/H5GryJa4mzrGIZYjk9e1C3vgnjirHB43ozgpIiNePXzA/vAR
         Z0jW6oj6LtX4NTMUUdZ5Pl7jSIGr2T/92qhb6T6Ljrud5LWou9SLq+uOxu+dbey6g5BH
         89Bg==
X-Forwarded-Encrypted: i=1; AJvYcCU1mDvBFFaGJSmbQ3rlJMB3817RQ/5DN3smpwPGC5zNb+BcHRiZ3h/qI+IK4mjaqt1qm4pila+MM8LTXZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6X3L1kmvCTAtQUkB74OlRLXOHTmVVVmcW97TaJENZrMoK8lI
	4Vugx+WabE9IbnL7JNyLnnqtjT5SdIo0IW2RA5C4B9AGlXXYx6Hazel3N9/V5ok=
X-Gm-Gg: ASbGncu2D+cFR99K3vtIqRAJRO7QTc8JqhHO+kmCTCst/wU+AJeeHR4DYOmmTp2hVqB
	JdkvGqMkk/v+p8DFz3N1Y6DfknLix/zYfxHm0J/bWb90pyXPWrhn2ryf8hvFULor3+OeUVxSKg1
	q2ub6xwjWIUwIPIA4VnFWZpGYgEYHEnajKT8v9XzkQujbkFgA/hAexZl9NsmF+KsRP3jjdM2hit
	6ECrSwsbv0BOaRM/Iv5FrDP3VjwdvYzFt1AoPBSUQdGf+ywtZavv713H58ugrP4Uj32I/SL5vbS
	Fn0X2fRKeSxCxt2ZtCiZa0t4UoEa1vE=
X-Google-Smtp-Source: AGHT+IEy+u0t14HIzWKrfb4cSWqt6yNDK8lOEUGmHQp0wvCPWclPXGAJTOLeWBXuCnkVFmOaq5G2Jw==
X-Received: by 2002:a05:6e02:398b:b0:3d9:3a09:415e with SMTP id e9e14a558f8ab-3da73933cdfmr4603155ab.19.1746560830842;
        Tue, 06 May 2025 12:47:10 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975f58f36sm25962075ab.51.2025.05.06.12.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 12:47:10 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Kanchan Joshi <joshi.k@samsung.com>, Keith Busch <kbusch@kernel.org>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250506175413.1936110-1-csander@purestorage.com>
References: <20250506175413.1936110-1-csander@purestorage.com>
Subject: Re: [PATCH] nvme: fix write_stream_granularity initialization
Message-Id: <174656083001.1636559.2161433067551641939.b4-ty@kernel.dk>
Date: Tue, 06 May 2025 13:47:10 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 06 May 2025 11:54:12 -0600, Caleb Sander Mateos wrote:
> write_stream_granularity is set to max(info->runs, U32_MAX), which means
> that any RUNS value less than 2 ** 32 becomes U32_MAX, and any larger
> value is silently truncated to an unsigned int.
> 
> Use min() instead to provide the correct semantics, capping RUNS values
> at U32_MAX.
> 
> [...]

Applied, thanks!

[1/1] nvme: fix write_stream_granularity initialization
      commit: 86b6e0bd1a69efd0ed408997e0adfb85df96a0c7

Best regards,
-- 
Jens Axboe



