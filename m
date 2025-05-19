Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1021B14A639
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620328; cv=none; b=XQmk9zt8Mu5PdJnhc463mU8gHy0pVKfZ4ZTSLpC/zKTOPUchCvX1PNlKGmIzMWwCwxcJYbT/gpl2bRBeVZOb2rg0Tsi9RmBRMDU7vUV8uVrC1KoPJshZOI7YMqMjmRIzw6gufn8E/JJcvbdzoqNot3jAFdUmlyTJBxhAxwi6H/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620328; c=relaxed/simple;
	bh=g9TCDvkL7vdglguYr9J2B8LFxxhkUXoRYKW+v+UkYHQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZS+Ohml/qPz6HgXmphhq5c6UTfZMGblgksIm+kUOPcTkBuOwCk3s4Kd6mIS1WZpBMNQdilGahr+fmkQGh11ITV6OuOMK1dwXppZiYPzi6gNM6QwF2uZqUuNmjBzVve3OkhG1fj0rm6bQmJmkSQjTzHtVIGwpA1EfM9hj+dJEjx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gn+fJmjK; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gn+fJmjK"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30eac9886ffso1025329a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620326; x=1748225126; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k4noPrc0+PmWjnqoGI34UlcvKKumIdg5SuK7l2WcSpc=;
        b=Gn+fJmjKuXq5ylnkSu6abgTlBwZcxUSpmMr3u9uXgJr7flyK+lb117MbwuZGPSPYrp
         tQKtWF2bU+qXecI56izsI8wh6jTGvOFoPLUgawLhp9MP5T3zSgZCVMX4g0wBVYEZpn+X
         ShrHK9y/GpD+nacwxm9lmvAfzxeE8F+En/ZDDIEDIuWTqQF9fGZVBGp9KyM/SkyotDEu
         LeqdTvGB4Fn0dg4xCFDGulYEqmrXiUusm37Zal4J+i0OHz3UYXImWsQ7jWPgpqpdp+xM
         wu8qH6vxT5dPtQudKcvjBOKeTMqOFCZ9v6fjy864NswZV61brPEbXh/gXCpz2j77PQb1
         qwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620326; x=1748225126;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4noPrc0+PmWjnqoGI34UlcvKKumIdg5SuK7l2WcSpc=;
        b=DrW80IV8HIz+w/RqQ7AK4dOT4PHrUSRPUjm/Ue9n3xVOlgDCz0Nw5nzt0bJLixfIC8
         BljPOgbhMhrSNBhNeL32qnycKysXwJGRduuMi6bJ8vtBk5Cro4WuJ2Vq7qEEw3PNX16y
         vk1puqv6Ph+GwpR8S775ajQtNUkcDh7qhDmpH80LbHS4U0yRGXOVhSdzG5BYqj/Dyhlv
         lAvZhLoEipLq0eQ8XkP+dyfbTRN43Of1FepaHViZ4JEmAzIhEP8T/IAmYK2NBeyQWTLS
         kaJfFcx7maOOKkjL0RQjCEUmmtFl023FHypKIii8aGEqefEN3G941NZ7v3XTl8BDCbNa
         uWCw==
X-Forwarded-Encrypted: i=1; AJvYcCVahaqYz3ly2DV9PPKWWMxXyH4u1ZQ03ZlAjEVmcMorCeTWoNQ4q2m4LH88mBJVDdIQ4GnsGo/H1Y9GrCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1GobFus6U6weYzE/v7+LZUCHQ2IPSKSL2V/d5RfUXjnlhwaOb
	hg7LIFCH3v4w1wv7E+sZvZPkPO2bgLpeiNoRJFg/c8SMJBvjJ/oQxcQjtZ+2uQ+bVevhvT+1WZw
	tpIuqCzIuuUnOin5u3SLVsA==
X-Google-Smtp-Source: AGHT+IGbCZYYy+GBc+rke7WozoS3ZvUtccE9nDq5UAt3ravq7+I3UfQ2ippF4HNUX0ce/AnnRjAOKvEGxBtdeP1q
X-Received: from pja16.prod.google.com ([2002:a17:90b:5490:b0:30a:3021:c1af])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d445:b0:30e:a1ec:68dd with SMTP id 98e67ed59e1d1-30ea1ec68e8mr12033666a91.8.1747620326231;
 Sun, 18 May 2025 19:05:26 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <cover.1747619816.git.ericflorin@google.com>
Subject: [PATCH 0/9] staging: sm750fb: Rename function headers in `sm750.h`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

This set of patches renames function headers declared in
`drivers/staging/sm750fb/sm750.h` to conform with kernel style
guidelines as reported by checkpatch.pl

PATCH #1: Rename `hw_sm750_initAccel` to `hw_sm750_init_accel`
PATCH #2: Rename `hw_sm750_deWait` to `hw_sm750_de_wait`
PATCH #3: Rename `hw_sm750le_deWait` to `hw_sm750le_de_wait`
PATCH #4: Rename `hw_sm750_output_setMode` to `hw_sm750_output_set_mode`
PATCH #5: Rename `hw_sm750_crtc_checkMode` to `hw_sm750_crtc_check_mode`
PATCH #6: Rename `hw_sm750_crtc_setMode` to `hw_sm750_crtc_set_mode`
PATCH #7: Rename `hw_sm750_setColReg` to `hw_sm750_set_col_reg`
PATCH #8: Rename `hw_sm750_setBLANK` to `hw_sm750_set_blank`
PATCH #9: Rename `hw_sm750le_setBLANK` to `hw_sm750le_set_blank`

Eric Florin (9):
  staging: sm750fb: rename `hw_sm750_initAccel`
  staging: sm750fb: rename `hw_sm750_deWait`
  staging: sm750fb: rename `hw_sm750le_deWait`
  staging: sm750fb: rename `hw_sm750_output_setMode`
  staging: sm750fb: rename `hw_sm750_crtc_checkMode`
  staging: sm750fb: rename `hw_sm750_crtc_setMode`
  staging: sm750fb: rename `hw_sm750_setColReg`
  staging: sm750fb: rename `hw_sm750_setBLANK`
  staging: sm750fb: rename `hw_sm750le_setBLANK`

 drivers/staging/sm750fb/sm750.c    | 12 +++++------
 drivers/staging/sm750fb/sm750.h    | 30 ++++++++++++++--------------
 drivers/staging/sm750fb/sm750_hw.c | 32 +++++++++++++++---------------
 3 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.49.0.1112.g889b7c5bd8-goog

