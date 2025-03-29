Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233A61C68B6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743249467; cv=none; b=Nn4oqfYUecNY19ZpZl9NLBI8mMHcp/m2JhzjN76Vpb+Ks7xO32VI1sW5pDLEMD/BpO/FJCGTDfrGyFgl+mTN2AJkK5xNXXqE3PVZattcBHBrpGmomjOnkHoQSAM2VwM/dP/1L1V2BaMpEfjUfawoWlK3HajrbrLJvRAYcI8/0B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743249467; c=relaxed/simple;
	bh=gAeX4mYSCbs5F65smwF8qHZGNb5IzGI1zY2vATp7M+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a1dLqvmj+e7thYf4gTTFBbfsiQkKzbGAI3277I5+FTp9v7aKfBo+ZYF4dZj0Woa9YJ/z1xbmoGRlYa2h8TBb5M/3D+mBE03BWXIKbI5zLxEjiJ6XQP0qzAEClnyomGWQkrf0PY0EX2yUN34UztM3CQYCoKPuXsDm1u9BlG6akKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=cqVKj5ul; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="cqVKj5ul"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85db7a3da71so285830539f.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743249465; x=1743854265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/g/89MFbZnpWepoRDZCsMQzXVPoAx1wXngDzMRDo6M=;
        b=cqVKj5ululBWNWrNL6eAXyAIEtcYk3w8/C4YQS+P7p2fCiZ+seD+AfEMZ/bPlq6Ggd
         j8IEk7g6TR8T5bfqGmKtWvI5hcSPCshMLEVEvP+CqBDaPFhmeOO2hkYcJaaEp6D21u9k
         gv2JyaLj0aa/fZbZqn1NtmHRQPedHaqcLAC76paCJ2l1ljcAlxNO3q6L4kLqkZCABaj2
         pvd00gXwGVzdCFtcZaGKtDRPYqo1qTvqFQpMlc+bVA7oNCaqH+954j1va74f01MzhS6i
         20QOYMOi+Uh+mrdhrBQfLqSVfVP5Mbcr3O71LzBgNR8l+SecIvYz4KuLsz51dQbyRTdT
         JnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743249465; x=1743854265;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/g/89MFbZnpWepoRDZCsMQzXVPoAx1wXngDzMRDo6M=;
        b=cKzMJ32Z5hHjxl7YlwbgrM+FyuRcRuOh6rVBBWDzfUvB/5BrRapkMCI+ARV61hHHRC
         qGzaTxlrRcQ4HQ8uAg0nFYmLyuKN+gGUZp7j1I1aWh/XH5o82suOWv5kWpOoQa9BCUko
         YutezMl8eWhsowxRG3aEPZg762Muqh4Z3AU+p8hLtFovTxhiyvdL4IAknl9ROqrkU763
         itScL3x5VU2j1b+NGUWWxwUgK2Bc9y8cTBZEaw/F1RDTsDIbFKuNW0BFq9ewU9yxkHCV
         lAIQleEtnrfy30IOw+OQIonCol006Ut4NwFv5KD9xyA7VBcXx6B2975fXfKKEG8MuwoF
         jR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUz5VKyK3gdtmPS5jKkB0PSDezRrsFgj9GLdWW1AnOz7rX1qZc+hSjMJPi24/Zicn5bGggYWGUX6QrA5S0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3eFQpLllmxCZDYaCmoou+eawGpYp+PLPlgKrOBu5blP+s6Fj
	8sT4R+AiBzLppV7+RWUXjn5xulr53CkDOwlbOae3eqPXgsc+149g1K15W4BOsuJYlgjZ1D0kSng
	t
X-Gm-Gg: ASbGncvss9o+GGFeHJCqqJk7N6IETmOWLinsT66nowkohiNZ8OiDixmH48u9qvJiA1e
	WyUdTNv9XP8AzzWvmJvaA968cK+g/pyiHpj9njCgpml9tzxmHt7vIDmSZ+m4h9udcmDNQs0vW72
	26VlQVUew3FKkylkRTtwfyzLyY+f3Q5b0aSxCbhVu9OJAY+oO8U9n1qGT+gD7wLJkcZvkMyhDsK
	OHR+tVP0FrGGLPX3XQ6meaNOLF08LLbfgEGW7j90aXGfUbqSW0Lp+JuW2iX3BtKI7KFOnApYNcs
	i0XlYzoI3gbeUr7Ym15BwTsniik9xihg3dZd
X-Google-Smtp-Source: AGHT+IG4lRvPyKFfryFcZpb4wMqvD6ztSnUsx1nVX25CHJ96sGhD3D2ZJtP9dRiKL1RUhV42vmjqpw==
X-Received: by 2002:a05:6e02:178f:b0:3d4:6ff4:2608 with SMTP id e9e14a558f8ab-3d5e092a622mr28591325ab.12.1743249465068;
        Sat, 29 Mar 2025 04:57:45 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a6345esm9616765ab.1.2025.03.29.04.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 04:57:44 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20250328194230.2726862-1-csander@purestorage.com>
References: <20250328194230.2726862-1-csander@purestorage.com>
Subject: Re: [PATCH 0/2] ublk: specify io_cmd_buf pointer type
Message-Id: <174324946362.1614213.12674397297873310075.b4-ty@kernel.dk>
Date: Sat, 29 Mar 2025 05:57:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Fri, 28 Mar 2025 13:42:28 -0600, Caleb Sander Mateos wrote:
> io_cmd_buf points to an array of ublksrv_io_desc structs but its type is
> char *. Indexing the array requires an explicit multiplication and cast.
> The compiler also can't check the pointer types.
> 
> Change io_cmd_buf's type to struct ublksrv_io_desc * so it can be
> indexed directly and the compiler can type-check the code.
> 
> [...]

Applied, thanks!

[1/2] ublk: specify io_cmd_buf pointer type
      commit: 9a45714fc51321ea8f5e5567f70e06753a848f62
[2/2] selftests: ublk: specify io_cmd_buf pointer type
      commit: 25aaa81371e7db34ddb42c69ed4f6c5bc8de2afa

Best regards,
-- 
Jens Axboe



