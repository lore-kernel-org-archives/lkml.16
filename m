Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8328E561
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454287; cv=none; b=tEpbwESMQpSqDYwYGHU/5gkulcYi3925TyQ2Kq6cuHC48yZrHvx5FJeA7uRYcxX/SxEo3lM9BnitY3lOvFWWe1SdAk8NmW7S46RSb+Ls6QcaaDtX+t7FMKn9f5lNNoRxZmwQGaqaAXDonF9mz3sHvrIXsNhaPpBh4A/Oyg3+i0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454287; c=relaxed/simple;
	bh=Ke7f+N8EYaPIsWFiQo9kTFagmjCL7kFrPiHzFoMk8Fc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JN6eaNrUB8NyRIia5utVSJmC0rmFulq3eWG3WeQk31QThYKKN9uB7Iu9bA71L/wIh+0IMDEXHAJOQ8BVmPgCQZJ3mNV36FnU+18YwM+gO5UDtDOM8PfDoDYDOqHQxdo3R3ZjeETaaXgGJFp/Or6na6Llz1+1olGK/77UEwz5LhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vRzg7njp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vRzg7njp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso29567a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748454285; x=1749059085; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M2KX3sikPH2APolbKPV8a8aBkNBnP9uCpHqlWdEr/f4=;
        b=vRzg7njpKSfafPzdMRU3DeWK7G1WAiY8lbSY74vgCNKugfv4M06diJYuba2sWse9A+
         Shv8L3LEJbEvCVnNiLqgA7z+Hv819gb5CoGHbVReaeLLZuZlHkAvdN0qgIWEmwUK+QuF
         dyksLOpqfZg+RcD691QR1X1IBNb+UeR7YSGQAiUvd025cWssJ6FtOkPn6F/dWyGLzuwV
         CjzhGUdG6NIWqdDEV8Ft87NZXOTIh+jbSxUSXTcd0tFhE2tm0fWXMyA4UNYguGCzfOiM
         ePRVfeCeACAU2n1MYkO2KhCzcmJOfzs3DRYD+kgI7NYU/p6uQtdV8Vf5hMlcTqOpqGKF
         SF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454285; x=1749059085;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2KX3sikPH2APolbKPV8a8aBkNBnP9uCpHqlWdEr/f4=;
        b=CGT3KSmQoTz8HLcUVRZIf+9rYjulwjawf+pYols3nlNKQuVUn76MZIJt4lKX5ABCQW
         Q3A3pP9GBAs62rmqRKERwmCBnjY7KtytSl75WkxpZ98apN70CAJHbw/daRjiS6PhVJTg
         1MUeYc0S5tyfxvaxK7v9tgIjZsyllLkwav7OuMlEvu3twGCQhnFdOmndgcqigTQo+tZ9
         Gj6X+WKMIV/Nm3tCcBtDUT0JVqxm5WUGAe8uvGbXCgQoS5w0HF0SLGkt0ALdQsHh63gr
         OUbfu3O6IOO9UTRmA7ATMrNlto9yCUldn/MdMALoRYwOeNq+9xLxUFR6q4G1ZOHiGmAB
         6Fwg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Mv8DlkfTkbsvPGI3k5B7efYhtDe6SpYshKGXooRxrYyzNBQw+mFwtUAUwb77NfHKWmKAdWADZ3OE4qU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWipgA3gTz9ep1k8Js48wBvK6b18OKz8X/3B6tHH/FIw27dZ3
	vBKz6nl+lLFrszlonRRmIM79Px81ivBU8o7SpzYSMIsWR+EhdKux4nTwOP8dM+2K0rvajMcWvnn
	LY7AYkU3uLirKwqt/ig==
X-Google-Smtp-Source: AGHT+IFozkIeePl3vm1HR9lJAMY1Y91Gb2WVvRQYMBVrwBfwa80dp5I92NQZM3Fp5BzYV95nDp1GgrPyGkeHI1w=
X-Received: from pjbdb11.prod.google.com ([2002:a17:90a:d64b:b0:2ff:84e6:b2bd])
 (user=dtokazaki job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a92:b0:311:fc8b:31b5 with SMTP id 98e67ed59e1d1-311fc8b38d4mr3468886a91.14.1748454285447;
 Wed, 28 May 2025 10:44:45 -0700 (PDT)
Date: Wed, 28 May 2025 17:44:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250528174426.3318110-1-dtokazaki@google.com>
Subject: [PATCH v1 0/2] userspace-consumer: adding is_shared flag
From: Daniel Okazaki <dtokazaki@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>
Cc: Daniel Okazaki <dtokazaki@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Currently this userspace regulator driver requires exclusive control
of the regulator to operate. This patch adds an optional flag to
remove that constraint, and allow the regulator to be shared by other
modules. This allows for userspace to share control over a regulator
with kernel space.

There is a boot time behavior change when this flag is set.
Before, if the gpio was enabled before this driver probes, it would
stay enabled. This change allows regulator_init_complete_work
to disable the regulator on completion.

The regulator state reported by this driver is changed from the
absolute state to the local state of the driver. This abstracts
away the regulator state of other consumers from this driver.

Daniel Okazaki (2):
  regulator: Add regulator-output is_shared property
  regulator: userspace-consumer add shared supply functionality

 .../bindings/regulator/regulator-output.yaml  |  5 +++
 drivers/regulator/userspace-consumer.c        | 39 ++++++++++++-------
 2 files changed, 29 insertions(+), 15 deletions(-)

-- 
2.49.0.1204.g71687c7c1d-goog

