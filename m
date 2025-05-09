Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ACF274FFE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778723; cv=none; b=WciHHT7uuSgz2Lq/deDOSVLyD95UMHcWetiPe2lD91G/syUVmKfX+TuzG8jgf4/UKhR29k8YrnJsu4OHaLSKqHj1BWS1ESn0naOBi7teNlOg65TQOaP23fMIIqDP3b5EVcRtEUhHJHp1tV9RzQEc7cUbGJkedxlI8vU4Cw1a9ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778723; c=relaxed/simple;
	bh=Y1RmzuKIGXEzqPbaIwvVs3VwBBfUNgoS1igqKWx8OQM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=C9N/XTxUH1C2U6HRPVtRTgSXjLyC/aCGmMHtrHTLFRvm4MMyq0xcHL2PSkXJ5OmUj/6y0t7dp/uuESJWo7WMNA93wcUzOW4VGxU0npBugE8IYm+tB1eO3KvFJt5MIurW7UVQVMwkjvfuhvwsUcMBEPZ2sEKEy79tIKOmhKHJt+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFAU+r1+; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFAU+r1+"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af908bb32fdso1641725a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746778721; x=1747383521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y1RmzuKIGXEzqPbaIwvVs3VwBBfUNgoS1igqKWx8OQM=;
        b=NFAU+r1+C27r6XE2RtX2r7JoTX5zZ2oG+KiOUNsxpyqSCThKx6nHGxCXUGzfYeDos3
         +5Q9d5LpmlavawHNPDMk/RJyVgJOQ2TPF7ANWSWgZ/by/4RFUIknRRlsZ7oc8hOrfyDW
         RG+JLAbYOtE2UIKnwVser8oKqu8oQgVbuXIYRg+lB4QyUamcNFt0Scs87Gf1OS0vjPf3
         DbT9ZXFU9fyeEt9cTW4v9ZTEAhBFrsyoZoNl/EKCnCmCT/4IUQI9LSoGIVGqTQ7aRLcm
         5NPEmIulToqBeO5ERXQPVyzMmtxWS0fdBV3mAw6JzhuYjPLZVZkKM63CPnQfaKEH/69d
         EoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778721; x=1747383521;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1RmzuKIGXEzqPbaIwvVs3VwBBfUNgoS1igqKWx8OQM=;
        b=CyyOEa7VWy0l9lzRYjv+Tf4yaHc1MVRlFENJqTz8cCOmETK6z/31hi3r+agQP8pBX6
         f6TCyArkHDCxGULQqm3KgBvLF+BRkq0vBD30imXqD0a8XzExXyszyLSfPNhmea3QMuhW
         NV9F7bvSoDD5dqh/5AeiDLETJ/eal0mQXeTuN8Z0tsC8Gz+uDBG+JJC2uI6wKRYVS0Oa
         wPaqoEsPOpcxrWYERlJovchWWeJfnZyCK8Jw2Ck9iQRlgT1zezCc/Aq6RQxqDXRbfLjX
         2FXyMUYZmDVGPazUQwV8v1BEz5y/f+BVLQIVXxSpCqAmKwrBpfHUjRYV1S1En/TsKmx1
         XMnA==
X-Gm-Message-State: AOJu0Yy0c6EafywzezjrTJWYO0+UMb67KYH7USAd/tFunKAvgeBzszlr
	+LHp3JkBN+3SdcUpoaKI5mTi8NnfCyTcJxGBRvKHJgrs96odxybd/RFlEYmuxlrVuHgaTsWc+lf
	7X/CRbTrKbkI8uuf0kY5/J7d4/JE=
X-Gm-Gg: ASbGncsfH0UVH5m5c4gEH+3Z2ZRV2VeBYIaZD71QeBvtfH2cZlzOO/EhrXpTkq6QglV
	ebXciloH2ZaC3MbWHfIM8/Tfzym3s5FhZ/mydhGcvW4a9ZsUHnUf0+ED8V9XrobItVlw4pJJ0vm
	51qgIhb1AJhvo1vjiZUUoIKw==
X-Google-Smtp-Source: AGHT+IHSwnhH6sQTzDkjEDYvSXoyVw63XJ3/nuyfapSdFb0/X/jRsbcPJ1obMKLV9Or2N5Ip/JsQjp6yYuxgkPXuSVg=
X-Received: by 2002:a17:903:2f8f:b0:21f:40de:ae4e with SMTP id
 d9443c01a7336-22fc931b7f5mr32776885ad.9.1746778721027; Fri, 09 May 2025
 01:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nathan Royce <nroycea+kernel@gmail.com>
Date: Fri, 9 May 2025 03:18:05 -0500
X-Gm-Features: ATxdqUEOmzqqGz2yQf3lqCNx70m1Yo3GWjlBzv7F5ZtfiNyX1HemQdd7hOLUgGQ
Message-ID: <CALaQ_hp+TAgH6TFOy_DB0YpRYiDKNYH7LSL4nf03c1XWbrHFxw@mail.gmail.com>
Subject: "scripts/get_maintainer.pl" - "Bad divisor in main::vcs_assign: 0"
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Commit: 0af2f6be1b4281385b618cb86ad946eded089ac8

The result from `./scripts/get_maintainer.pl -f scripts/config `.
