Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812642D322D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776703; cv=none; b=TFihmtKXZU+27TnV7JRCp6ATLCG5NvXlAyIRKs4CV4giZ0Rjfwt7OXb79sSj42tchswi0zScOhwtW8Ak8zMRnHye7+vOlN1f0gXCmqFIpqB8Kirmh0Q1MqliFaNuZjt9mgSW1O5UxbDrDJynmPz8pm6s1Lg+rilfFhdTMDDgfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776703; c=relaxed/simple;
	bh=9OKO6BDx2IMt/zmfSUV0ohxKy/gloikZpQsoqXzWc24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O0D79/K/ALFvijHi+HQp/sCLgoi8vDctEk2PVoTu/Kd+dbqtFyVXumm2F9yFrjuKcGVR7C+aMsM0s+4FoyJ1dn+r9CwwNp4Xzgnv1iqPCtK2cLM0znoh0KR+gIgpzVTe7pv2ClY8WFZrEQbbxk5BOqmlD79bytrbWY3NPbd8XYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=VxY9lexh; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="VxY9lexh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b31c84b8052so641242a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750776701; x=1751381501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKBpAEgjMRRMgJIPmMH9OybSrIc+zODRWtXV0gOOoM0=;
        b=VxY9lexhNOadkDCtR4VHh0SZ1aWbgugTdN7boPLzK4KlFtZTnCUf31ncWITMYv03Ph
         6dYM62jKhmZ+yATIVGKo401k2Cjp+JqMMEoSuJu8mWymd8n/BOInH9iCSpxnLKUaBPvg
         LJqriuDz/XLoT4f3Tp/jFkShoulcP7ky4PLPBRa5SGCchMmv6wjWx471dhSNMTv/Tipx
         26yEiTimkD1GEuqjaqyRVKfPbQC88Rrlp1bxfpmrkm8EK2mCbmev2ElGjEFQdwofjjH6
         IYHN86bFHjsUBAStt//22byarrkadUg8RxKlWkqmFdvobjORNNMBOD56k61rKHyPW1Wf
         2T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776701; x=1751381501;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKBpAEgjMRRMgJIPmMH9OybSrIc+zODRWtXV0gOOoM0=;
        b=aRutNHOB4PyshdWRQoGm60WN+kXPYTtATUbnqv2DZCNPF7t3tThPHR3fRbq/2T/mOv
         ZBCasO36xDJyJXwrq+fS/eAShJInomgEaHB91R+i7y4yMCOLM+84acaVT6J89Pr6yP3G
         PEOEpUKJbGUEg3rPFmd7L+Zma9nm1sw6dy4MhLAYM6JqsnSepRvcslAtjUYuDVSzxNak
         UhXiINuFovkYr2ZLB9h+xwW2P19KES8pcAtQBL0wWgZgXvPm9FpYmdBmvoZ8cqPGiKfc
         d8fqSnDE5k/OodrBnkC3iX5RQqKne4/N9+DY6RzXGhUNKa3lZsZWo6yl8IHncjYd6VDu
         hoEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW//+GO8P4efHbVFlWXqv1wZVkzZ6tFFKUOlDYIfRtzsF+TihDBpESLcyQV/K3oNFzQcrb2UWWScgDDMtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpTCYIi812bLLzdTDqbn8z35yZO7k4Ap5ud2hUBX/kPQdWP2yQ
	LfBlT+/MYlzF5UJYCjpuzKfnsK8NgyMz9QVDz7cclmBD8kTJj4TnVTAat8Id0K5t1mzOWlmPuPA
	sxG9U
X-Gm-Gg: ASbGncscW/AZjyHjlOuc21e4qk904zQEOR87TfeA1qFcGFkQNzI+P89I6HynoOXlFxv
	5OpYAyWV6MjcLY/i6KiuSbYYeZ/Zg5gmnyyAU46gxluvIPhYti8SJf+rFlBNyf8hQPLtpW2f3/d
	xMQDDKVwklvRML2+JBRK8evCQGBr68gQPGjmwtDZGmGDPXAmtuLmraW0bxRjvoZqYz5cWN1pYkL
	Wm5lgVxWdKs1NvC9dVllUpJBUUuhNk4Wo+YGn60SQcpGQZ1JLXb2AmjLCWjl4mw1Ngzi5BBkXHy
	4mLhuaowmjilrCKvOHKz/1itqP2GW9bXtj4xFGRSQcf8o/QKLlyY8Q==
X-Google-Smtp-Source: AGHT+IH9g7UwNzUmYqNzcBMkeoifKor3akGE6R+oyeKg6dqY1DgcLWxDTqF/fdwAjctOxQqHqKy3kw==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr22801763b3a.13.1750776700860;
        Tue, 24 Jun 2025 07:51:40 -0700 (PDT)
Received: from [127.0.0.1] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c887378csm2040731b3a.178.2025.06.24.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:51:40 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: Uday Shankar <ushankar@purestorage.com>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250621162842.337452-1-csander@purestorage.com>
References: <20250621162842.337452-1-csander@purestorage.com>
Subject: Re: [PATCH] ublk: fix narrowing warnings in UAPI header
Message-Id: <175077669906.72735.6561579879572890372.b4-ty@kernel.dk>
Date: Tue, 24 Jun 2025 08:51:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Sat, 21 Jun 2025 10:28:41 -0600, Caleb Sander Mateos wrote:
> When a C++ file compiled with -Wc++11-narrowing includes the UAPI header
> linux/ublk_cmd.h, ublk_sqe_addr_to_auto_buf_reg()'s assignments of u64
> values to u8, u16, and u32 fields result in compiler warnings. Add
> explicit casts to the intended types to avoid these warnings. Drop the
> unnecessary bitmasks.
> 
> 
> [...]

Applied, thanks!

[1/1] ublk: fix narrowing warnings in UAPI header
      commit: 03912ca894e4e5d6499bc57e9f10dda9f0965c1d

Best regards,
-- 
Jens Axboe



