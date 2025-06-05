Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F5A1A275
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133181; cv=none; b=JHh9TdWUY3Dk4eXgUiGHJgpCF+E0SBLvoVgXgchUTvjSOOjaXBq5BV0gnmN83Hm1TvUUKdkRa2P5OlQYEWU6wUHZBhAFOsqKzFBVcF7qUyJt8A0uxKM/Npiz8pL5KpQjJZIxrdWB0ImKsF5VGhPd6YWjivFboxr77c2cm7MKd7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133181; c=relaxed/simple;
	bh=AlOTMLZaQWJ4ha1tCQoVKSOXoNFetD1UKeoZrN+p8iw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ndgZIvpvHAWL3Pn+Jg1cCJCN8cOvYg/M8qeZfXN+YpT3sesLlrydVfZn2nNEeDSj4NbO3vxlwCmu5VZ3QFDrAJGBa9bXOfVlXPkNpErMvyf5YVmToGMXAqXcxJhKfch1+4p05FQToM/lyeS6Bj73co5pfKv8VMVzotJ+qnqg0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B/PwYXSn; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B/PwYXSn"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-60f368d2e33so140791eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749133179; x=1749737979; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hh+ggkmRB/oQBZ1yax/SQ5a/VbhcWFh+sgiAWREJgCQ=;
        b=B/PwYXSnje6CdDscSFZqM9fUJ5scPt6FNnt3R1JiB1C/QtQp15MZXEdiFAI60cXC4w
         g8QV9RZjKSlS5JePw6O2hKyCljhjHi2d2smsJLU0FqKyq9XHTtyZat58uib6w2V+sbOu
         bWA7fd6opkYRJavk3hyaLUqg4Cnz4sJsx1qHg79Hgz/SxIVfaoo4K0xVlNxWfMsdm5Q1
         e+PjecHT8s6pFB+XwTlq5Ra5J2YI5kulaEqkZgt4zmqMQUXchXhAGzkvY6rgHuCmIV+y
         mq3U4Z1WA5/x4KwKQIa38KwQQTHrTNMT1w8ZGVmL7C+ShgdWn585xW4liNSh46tzwEPv
         ceRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749133179; x=1749737979;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hh+ggkmRB/oQBZ1yax/SQ5a/VbhcWFh+sgiAWREJgCQ=;
        b=VzIJ1UDk3JDj1LqjVnts8adK9wSOg9bsB5dpM6LNjPfHJTPrPzSxh7H8jQrkzu8K5L
         b3/NMXAbPPdYw6B+Mg1nqxE3K1ypplRg0PvFCcbJ0SGi6h7dfwnW3SUZ4tEyXuR9wTWv
         XN2ItZQBB49YykdyU8nHQt21QAh/xtDMug218HiTNxVARFMip1xvf3/s8UE7wWQb0RP7
         744ufyOx3Ta40NdKQemJkB9YxXRsaylE7SBfADTgQNLkSkff8QfmGj7K29QsjXxtmNUC
         e11WhwCM18Eue0hlSWpVFs0v4aMoxIhPeol6/5oYM93r6LSNiIEKM2M8SUc1F/k1A2v+
         i6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwKGZ0UmqwuWI6nH6qFZtrjrgHZN1GTZd1j2CYAZz4KOovGskBNeIX3nROCHuSgiUvAyamotcSsP61+ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0o72yaRFJcREHLLv9Qz+RbrqjAl3gmuRlhb4e2f03HFaisL9c
	xsS6wTjg4JslVyI2HjMeubp2LVjIcBaRYYjbLpyc2bfvwy+Qz2qmH+yPaKtSKjfcHJ+HcW/f/aG
	A4gTMjqVjV0Kr5A==
X-Google-Smtp-Source: AGHT+IGebIBFWF3rrLp2cKy8BAJlJtIfK6Z6/LJsb2GymUZh1eGbPIjTfRbO6tr2Sk+CiRpAlOrQlI+v9AB9Cg==
X-Received: from oabmk6.prod.google.com ([2002:a05:6870:d06:b0:296:e8a8:44e])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:3d85:b0:2d5:ba2d:80da with SMTP id 586e51a60fabf-2e9bf48b7bcmr5036635fac.36.1749133178852;
 Thu, 05 Jun 2025 07:19:38 -0700 (PDT)
Date: Thu,  5 Jun 2025 14:19:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605141930.1069438-1-cmllamas@google.com>
Subject: [PATCH] binder: fix reversed pid/tid in log
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: kernel-team@android.com, Steven Moreland <smoreland@google.com>, 
	"open list:ANDROID DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The "pid:tid" format is used consistently throughout the driver's logs
with the exception of this one place where the arguments are reversed.
Let's fix that. Also, collapse a multi-line comment into a single line.

Cc: Steven Moreland <smoreland@google.com>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index c463ca4a8fff..2bd8ac943171 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3144,10 +3144,8 @@ static void binder_transaction(struct binder_proc *proc,
 		}
 		if (!target_node) {
 			binder_txn_error("%d:%d cannot find target node\n",
-				thread->pid, proc->pid);
-			/*
-			 * return_error is set above
-			 */
+					 proc->pid, thread->pid);
+			/* return_error is set above */
 			return_error_param = -EINVAL;
 			return_error_line = __LINE__;
 			goto err_dead_binder;
-- 
2.49.0.1266.g31b7d2e469-goog

