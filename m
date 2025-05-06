Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2281A08DB
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539309; cv=none; b=rrifo1aDyPCEdB6IeGvIgVv0GPJWiT8x8ZIymYAasSN9rIQwyYHkXqRRtXvG740cARyzF08ezVr/wZ41VooXHT4aZ3pOJb1kwNNBSd55+0tzBNEisK8Sn+NHhDDSXWAQQi3+lO8IOR2vvUqAPfmray8ANmvw0aywdcJf/mIvW4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539309; c=relaxed/simple;
	bh=0sCrJwF/p5zC9nd8ieON1sj24FAamlhRgGj2fKUgdAY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cxMUzmXQM5r1XiTJlBXB4u6yiIdLpZ7JZlLyWOK0OAG8OyB5pIBors5Zc/m3s7+I/eJiqVsF70BBEiZgUpFjDyDHc2GAolcLoE4+z9dQjjD5oqD9ONZr3UQSp2x3QO/P1hVJDJiO6X6Op4c9OJk0OAY9BvfygPWwZCMhOFATya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=BGlZjfpF; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="BGlZjfpF"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d4436ba324so50646725ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746539305; x=1747144105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVAA0vmooW4PrL8hTCHIASn3ke2wAXZ91chlrtSDfdM=;
        b=BGlZjfpFe0wn2Jmv38VWG2nyBBpuW91YZKllm2RCVANaIlgm6pCNOPJ5lcfLZaBFrL
         IBrr460AbgCyjPaZJ5O3Fk7IkSGSsqXqbF07mxz5Zl3udi5c4hbvHWwhpAo5T7oIr2jK
         dXsL6cWSV6QbWVZQlb7qe1Wyri8mVmzG8OCEAoxaL3kjP/CkeCtqpkFIWZ+r8FKNfeok
         adoJME4EmdBRwXud0D7PZSNsjyE63ZOEKs8Cysj5x6MabW/03ldgUO6paqrlhIBqBYdL
         tPd0frJuPPAZ7H4foM/LYAcShn6LYOXUIjJKbA/ZehTfi828YQKPUxhFSUps8yQp8UBe
         y/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539305; x=1747144105;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVAA0vmooW4PrL8hTCHIASn3ke2wAXZ91chlrtSDfdM=;
        b=rJmQl78vbLtZg1q6zV65RA6PRdzpCEQEg4+fAAk+ANWFbfa/Lap34kct4EzP0JhCoz
         2gwsV9sENSEFbamSO3rXAXUKgnlgp6FdDU8+cDWMAQIDyP7lls1Kvj1vKypK2+I3Fq7K
         3TIJFAjvVQPd5ag4RtGXEY4K/JGHkQFCZ/qCRhZN2j/6fPJ4rD92p7WFFteOEi4ULYO0
         frxb6M8rlFME/sV0sDkyOtwM3sun4Tv9eQ1sXaSt7Jc/Xxovb6NeWYHEWykOXHH84+43
         7HUuqODGBvqeHPM07/dFmfNa7tY5CYEKJ6XNmhV6iMbQGZfMQokDPFQ95YFmBmiqjg7L
         6qQg==
X-Forwarded-Encrypted: i=1; AJvYcCUl9C3glMcmZ9Z1YMOqEk4m2EyOzkn10z2hzvnLND0huMDucL1Kn5noTH5q2CHQO3pdjaodODET0zcODnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4NfirBb+ncQcDewpo6GW/lCn0y5RmXdjfQeYZy1+i3zwYzt4
	ZXv6ngQEXOJM8sr/9tioZ/zc/PAx+UW7ka+03IHaU50GaACt9SLu/Jo3lemYyFRabm3TgrqgQk6
	S
X-Gm-Gg: ASbGnct5pNqBe01Kg2o1RXZtO16LZTtRGRB+EE5cemum3eOL7O3ne3ZkcBzDDF/NRwP
	twKW1P0x/V/BDHPs4+QqJ0Yfunit13H7czTFMCxoX1DML66NIjIykYG5bW08K2IRZCRX9B3CUtV
	EMWx8xTV39atSchuCoh89CdScgvS7WCQRXFyQ5P4sq9QWgsXAyhk9jRH4g+8YXjaKEmlY6R7hPS
	yAWrLUKNjJWLHDK/JJTpZvijavO53i10oyL8NFDN+lyN9IxCUBACM6gZvq/q/gIrbdRkx3g+ENC
	yEut5RL0nUURbrmJaymibvOdA24hwKE=
X-Google-Smtp-Source: AGHT+IHlgZr9j7rIqGzn9fM256sGLzOt+AOLttsWJ6G2DH+U5erWdHnBA5zxuh+srnEZx8/jn/Qwlw==
X-Received: by 2002:a05:6e02:1685:b0:3d0:1fc4:edf0 with SMTP id e9e14a558f8ab-3da6ce07179mr39550715ab.15.1746539305697;
        Tue, 06 May 2025 06:48:25 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975f58be3sm25930915ab.58.2025.05.06.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:48:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250505172624.1121839-1-csander@purestorage.com>
References: <20250505172624.1121839-1-csander@purestorage.com>
Subject: Re: [PATCH v2] ublk: consolidate UBLK_IO_FLAG_OWNED_BY_SRV checks
Message-Id: <174653930494.1466231.13050848343304630692.b4-ty@kernel.dk>
Date: Tue, 06 May 2025 07:48:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Mon, 05 May 2025 11:26:23 -0600, Caleb Sander Mateos wrote:
> Every ublk I/O command except UBLK_IO_FETCH_REQ checks that the ublk_io
> has UBLK_IO_FLAG_OWNED_BY_SRV set. Consolidate the separate checks into
> a single one in __ublk_ch_uring_cmd(), analogous to those for
> UBLK_IO_FLAG_ACTIVE and UBLK_IO_FLAG_NEED_GET_DATA.
> 
> 

Applied, thanks!

[1/1] ublk: consolidate UBLK_IO_FLAG_OWNED_BY_SRV checks
      commit: e96ee7e1deaa74c5cc80ab03b51943ece5809984

Best regards,
-- 
Jens Axboe



