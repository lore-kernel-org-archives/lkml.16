Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8322E1E1E16
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751342339; cv=none; b=bus4Jt+n5l71SRzbhvqNrkSPzlCltEurDFLWrqVPBspnahkwEtFoDyWlQwhyoiCSVJaYpImDPLD5NOQ9aAiqCOoFksLV4lox8t2a257Wj0irXnrDjSsKQQ4w68EfKTlcgb7rXGu3B1Xd3BhAuq4BZzJogB7g0lK7DqqjLOURtek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751342339; c=relaxed/simple;
	bh=H7TfWuJuxniQYZUFW9bvII5Vr1rgNmizaa/XrNQwKLo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XLTyfR7MqGx27o+fpMu3SH9Axp1LsniieVl+ymgexv16/fIEKthnytaGJ3I2WZiCwFdfkESrgrJcJPQXiAF2qQ9ungzPHk0FQYoXOtQj53U99RUsDIT/RoCTfcAogDMFM2XB/FJ2QqXpz2sJ5hOpPBEeHrQj7g2uEE/G/aGX18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3tixPvi; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3tixPvi"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3b336e936so1680166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751342335; x=1751947135; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7TfWuJuxniQYZUFW9bvII5Vr1rgNmizaa/XrNQwKLo=;
        b=L3tixPvilrerctINF4FcNPGGsQ1uKFP8UwMzqEwXmSw0NhF1oXUBjVRa+XPMJBZZ+5
         FOqRgtGN4CEyXeNZI8yVTBbXl+yRhSsPYbsVepI+rz6ZpajeifJgoqdpyqcPQMlRajZk
         Ierh1Zp3pcq9/fI2FnzqOe0cjwKkxZHaxLSfO+JPHChiN+qkR4kI10hIJK6UftkCFwI5
         FYaZlP3mfWzdA2OsR3ILstShGESzE06JelNudopADjXBI0cBDMQpFGCfcjQncf4bao6S
         srRktCt8a3DXZnX9UbZbKHgiy+tx1zp9c+RzuJJ6yaRGVhpfCco/n2yAGvUkBYVGaZss
         bbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751342335; x=1751947135;
        h=to:subject:message-id:date:from:x-google-sender-delegation:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7TfWuJuxniQYZUFW9bvII5Vr1rgNmizaa/XrNQwKLo=;
        b=kX0v/mvKfgKfzLe5L3QscjYxPcuGB0ynJVDvqMe8GtaIiNcgyZxSYVn6F1u4yiBHRI
         ZvvjiP7VXWUVMLajOhUkqx6PQ0wS8/gmPCssNC9K89GOYm5SbF9B0ZCdyU5z8c1cx00i
         or75dS8zIuQuQuI/kf179shxgN0DiDRGMQ7jbBMa0ze/M6leZrGZrhNEshyVPzqTFxk3
         AoJSfmq0feCaw9H846N9yeKSafAMbF4iwtYzJ3MwI1GN31Qyks/A2Z4QjTxu0Jwj/V0c
         NHwzKLpK57T7R2JjM/G1fG812fC15mV3fxWbcGwwHJsQalzwiNgAk7JXUceEP5Aol4e5
         9Lzg==
X-Gm-Message-State: AOJu0YxRuTN8iwoZGKMQc2Yy6bAy8P+e4rFVN/gHINdJfqNCh+Sqr3KG
	I83tdYxDIqWu1Ohkt+SqdW+TKSYz3MTc52qKNzTFYrf27ysUfkcUDhkNEkrRtyzTt4K8l/SwUn4
	W87fsbmRVrAWeE72ITF322wSKbaa6B5yTMg==
X-Gm-Gg: ASbGncuOt8IfgeQCij9/Fmq1VjKow8EdHMUIrWCuh9qlDoyhg1jktg+5tBlu3cTuzFR
	vRG/b0sgVyCXQBixOqbucef1pDNV43ta6mvckPIgeWwjD2pW/ZKBPwfQpu0f+6zl7Iy0RsoeFar
	2nIjluUrf7NofT11G0TWxNSOfydpA+YbCmncvX1RBoUAsxPpuKHdbhALu/lQMjurwx88ffQrshP
	erJ
X-Google-Smtp-Source: AGHT+IHomfZ5BfF/nQjlTelLp3b73h+85vegq2WqX1WbcAOs471vNK8LhHL9wOrfMuuJmXSilD1EIfSRwRCKd54QKA4=
X-Received: by 2002:a17:907:97d1:b0:ad8:a41a:3cba with SMTP id
 a640c23a62f3a-ae350103a57mr1678240466b.43.1751342335222; Mon, 30 Jun 2025
 20:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: kd4ned@gmail.com
X-Google-Sender-Delegation: kd4ned@gmail.com
From: "R.F. Burns" <burnsrf@gmail.com>
Date: Mon, 30 Jun 2025 23:58:44 -0400
X-Google-Sender-Auth: j0b7StkWoSv8bRI6Oxtex6M0RO0
X-Gm-Features: Ac12FXxnWBhb0KNoKx-b-PKKq0t5PiIaC7vfOCf09SxD20t0tYtYLdhPP_x5YqM
Message-ID: <CABG1boPFyBg7+8h2MC5MH4RXtjVuw4wopFo7qRzTGOmOzG8bEg@mail.gmail.com>
Subject: PC speaker
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Is it possible to write a kernel module which, when loaded, will blow
the PC speaker?
