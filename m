Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3262D14884C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596645; cv=none; b=BApLU8CCPp/JCxSutYzvhZXuOzPq9ot9s0qtJCbHNsXgSjrI1/o97VjhdL3h2pjfYYXieHNfp20mZaAAepTJFamnVj2kaBI8/DZ1n1AqNFg8Kdue15/DbFfao5rMEBCGQ3eFRCLsmvHXAG3fFd5qd24Gtnw2NmwTi4t5Mx3g7LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596645; c=relaxed/simple;
	bh=NLq6IcrIA7bbejn7My2UmE29tSIURl/ZkjR0TBTpBvE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tFObgHHJ8oxqetHKTOicpZEIu4rTfq4d0YTBPv5gXi4CVhAMbVPN4gbcfTlOISNqAOY9bWowodSSUOSRMwt3ahlMjBq8BAmdi7/0Gh4ip1+yTo0/oDibKl3ADWb2jrv+sUtvfQt3VaThBXAi6Ja2C66aMX3Ixr3WWsTAT0T3t58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L8G8BJYY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8G8BJYY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0b0d8090dso127715f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 22:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746596642; x=1747201442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVlAmV+4PvVpRGlSzk2lDcvbBX7uD4IVAP1PZ8ZHerc=;
        b=L8G8BJYYuIZ4gWjl7Y852FqPpIMGBEDukZARriW6+yBkTgIIctHYD4caUeoyiEQpvD
         fC/KeXByuqo5YlYlB8I+EPy3PHK80cz8YoUKFh21ga8XfEWG6lw4O19nUQOq25tLQxep
         scTZ0hV1d6D2kPfWhQjDNjtFxUTQP3rEsMRmxDZAfpE4dkMywezUILtQUxKYAspBKqN5
         Qu0PfhSfzJYVnMbNU9xrDmLcx7VGzHI7aA2sPHTNx7K5sRhBiBwHS8uf6fcxMABWzy0w
         /du5EXiu40zG2xIwDV/tNm9oYJeQgPa7BELmcWb6nKeV/GqrNirquZnFZn9fcTgE5yVH
         3p+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746596642; x=1747201442;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVlAmV+4PvVpRGlSzk2lDcvbBX7uD4IVAP1PZ8ZHerc=;
        b=F5fEypk49mKfIr49oxLNlqkVJisS1Yhl/b/xEQsMdcTSqewAnmxyp+ToM/GgKSCGqF
         8rSMUcKcg94662HG0RdfxQ5RSlHODpiCV+6mcitLorJMVK0cSMHNJjDF9yex+pHy0L4b
         /ffb3MO3fZ9mkA6SyHNDaY//zM1zrw/bhlOCWC4YlKhyhG3XK0AziB4EnvdeUtNBh9U7
         NFrGqMlZAMHmYUS5oQvHmvGONtYgpeKVmh/4EtovcNdgGmyFBwo/L/1U9bDnDx700xFS
         FMcZH09MYhmjBx1pT8WrGxzC+IfKiQh+Ljw5Q3Xjv51iyWYfW6yr3g0giK34GFITjKpM
         lhiA==
X-Forwarded-Encrypted: i=1; AJvYcCXxnqH9a/MAREiggPL6hiztgILNamv9Gf05ZQWP5wKW5Fqzq82HpMMgj93x/KKFsd4ZEvFFynJv+/3ck7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YypA+AyVImeuClcxrcJmjd0Lhof0crl8wmDBwR4ts+ehPLaDEHX
	SiynMFow5oK65HG3zNQ+yhfvCwuzCLiF5P99LXCOoxtCySdiqrhIhzWGQKWWgmY=
X-Gm-Gg: ASbGnctsnSV6KVYW5mxHB7D16boOK2+X55mZNI5Q43cZObxe0E+8a6AgzuFkFdKyZTZ
	1rtghVPcVx5iPLgSa0Cnc57U874Sze6AcKj/QUgLIruFga5hZnHVkq5vDa1xBiPx1NUIaZ2kNtU
	5fvRvAFjYTe2VMSeVyTh84Q4AJM+ElkXCaPWs9+F2X3zNGIZFPoOgwL+dJr8yM4NDImaNK8otfU
	T2gdhM94r5erRIgTLCgf25RFf4Dmzi95L5eOGYTAvFyXXYJFtPGy00nGgUBwnpz2FxzAdkfExBv
	Ae4CAsTN+3bH/efVmET/s3/qDV3Q8jSKzSXb7rH7xZHdqIY19DQg/5AcxNk=
X-Google-Smtp-Source: AGHT+IE3z1oVZimr6AGK04ZWNVqN5SAAqWpH0frAglGMolegj67mq9irgEkkuxa9TtQIRihRK7YyTA==
X-Received: by 2002:a5d:4410:0:b0:39f:728:4324 with SMTP id ffacd0b85a97d-3a0b4a36d73mr410032f8f.9.1746596642400;
        Tue, 06 May 2025 22:44:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b6d0e1ebsm126353f8f.80.2025.05.06.22.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 22:44:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 Salah Triki <salah.triki@gmail.com>
In-Reply-To: <aBkw_p9GkH2fm2UJ@pc>
References: <aBkw_p9GkH2fm2UJ@pc>
Subject: Re: [PATCH] drivers: memory: bt1-l2-ctl: replace scnprintf() with
 sysfs_emit()
Message-Id: <174659664137.29039.12798572123642598206.b4-ty@linaro.org>
Date: Wed, 07 May 2025 07:44:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 05 May 2025 22:43:26 +0100, Salah Triki wrote:
> Documentation/filesystems/sysfs.rst mentions that show() should only
> use sysfs_emit() or sysfs_emit_at() when formating the value to be
> returned to user space. So replace scnprintf() with sysfs_emit().
> 
> 

Applied, thanks!

[1/1] drivers: memory: bt1-l2-ctl: replace scnprintf() with sysfs_emit()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/03d0d7f0ef05ddd791eb37d35dcc5ca2a53d8b93

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

