Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055123E35B;
	Tue, 17 Jun 2025 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750136932; cv=none; b=e5b6aDMC+AKLYudLjXHon0NIXP3LGVQYRC5Glpx+KkA76dnXoQ04ec6zZDu2rYWpOEhwIOPMTQz6/fDFJJ/ohNRXV2ehCw1PUVa1ywy+RV+Af23ftzFlJiBorZXqOI9l52BbE/AhoAakY0QmJJxSYb/Pn31wWqlEIJ+xnqGNnAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750136932; c=relaxed/simple;
	bh=jn+AZcoS+gknzUx30CvE3/KJcpJXhjiNQQiH43qHxgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7ZpdGgk1hxIMYGAmpSzv0gKnDuswlp8MS7gjaxslxxsBrzu3m3LAkcIuf8DCExOd6qRjLaiMKOc5Vw+LNESlAoLmGbKfxJ6wP0q9ip6YNe64vGL1zvIo1byzeylwH0nai2iopVKiiD7Ne2+//cUUL9junKOf8PtikBkkeBEZeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyX1Kb6H; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyX1Kb6H"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso4139233a12.2;
        Mon, 16 Jun 2025 22:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750136930; x=1750741730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORQSZScH5iwOR20pfQirho3FdyqdaURMxGfN/YBE6uA=;
        b=FyX1Kb6HkJkuRHbB38tyB5PgIrCJqM/PNGfcr9ShPhesgrxZY3AD1yomxIYTuL2Xlw
         Y3JqA7Rdtjcxtq9xTOYkqUlJUCiHoBe4u+3dvwBNhLEiM7IuGjDBYW3XLOzk8YeRnPF1
         8Iw3ppX6eDvf+b29rJepGNuAkrdESCIM5Y2CENtvAHfsN0P55LASwI7iksRAd7LC8KNU
         196t5O6cRnqN8hYURmoGNui9of5NmG2u4cw4ejzLM8E1OzknX23f0h5K4p+bXZ0u1jEJ
         BkvA5bMKTnZbJiFvsy2xlxZ+3ay0NAbWeSiwRTard9RF3QZpAvLNGHq8zIi6prKj6Opb
         bmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136930; x=1750741730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORQSZScH5iwOR20pfQirho3FdyqdaURMxGfN/YBE6uA=;
        b=OvBAm+0omD19sk5oQpXBgHtgdsZkFw8Dxo03cE8En21MJ7qZH6H/WI3/skWhHQUiDn
         KpNHbEv67OmjSiyyWQE/w7Em/5uPsHwEhVIgYKt6Op6rLI6ltf/T8fGoG9JpvcGKSCvj
         eU1GoLssKhL8nQFwWDjkyE5yciv4lbBSMOhESSV0Xy/lXltMJbUi7tu9zfqP6WKaemXC
         WZrUcDIGFXLVCxp39D61h4RnKNQ4pQgxT0Mp+MJAZgfjyIezGquokAtA4yqWtKg/Zv3J
         Q4+onoVERN4PiSzJ+SpALsgi/ZDIMKDTs4vv0wxEZPuOVUc3382hqb/KzOSXT65CArHK
         cwuw==
X-Forwarded-Encrypted: i=1; AJvYcCXURPp3y7EwLGZx+Z2clcXAqc6TZDvMSi5dzzZsc+Qcuk+ki2XjnQzGZDwuG5bWcVNwGLKi53FaNlx9jgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS8bRzMpb8stEIdg/hUWNw6M+Xoix7ssbTy7/diVUUMYpil4AT
	ki8pBGxBFOECKSk9O4FIM1QuGYvPQTu4pWOV2dsZK6mR9H1lVpobuIlr
X-Gm-Gg: ASbGncupAJ65qnS+pAqr80f6+lLq3K6Vuro+loMrvaO9rwqBP8rPEJ/lR+QVWf7Lqy4
	Ua10XwlUhbo6Dgn5NO9RKmk0XdovT9fuwlfLa3gMVgn1Zr2S2PYbSZ313S3j/jjv8HHJeStS3ee
	0/yDLi38LGnrJTQ1Q1YLgDntFXxUrvQzNpjAATDVUaLvNuhEm/C1i3/U7BMtW//kZkULaMHrXd2
	Tc7eL2WdxRijhj/xVJBWWaznEdMGR6ONuBvLoI82UHZpaN5kHeXnns0jKJfKvUnwn+ZHaTGxYhv
	zhWloY1hid/l0WTma9s6jHT7ZuWbG3b/oA4dlitkSOEU14BpBpDYZ6+eJ+1Nnw==
X-Google-Smtp-Source: AGHT+IEqDf/C089XDze8DuijQXHRfftyr4C1u9LoRguwB27oUwZ29eFwHxr18ltua7GFqGz7HGzG5Q==
X-Received: by 2002:a17:90a:e7c2:b0:312:639:a062 with SMTP id 98e67ed59e1d1-313f1daa971mr21369290a91.16.1750136930150;
        Mon, 16 Jun 2025 22:08:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c19d1eafsm9712177a91.18.2025.06.16.22.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:08:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size property
Date: Tue, 17 Jun 2025 13:07:22 +0800
Message-ID: <175013680588.1018298.10559632401541865399.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613074513.1683624-1-inochiama@gmail.com>
References: <20250613074513.1683624-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 13 Jun 2025 15:45:12 +0800, Inochi Amaoto wrote:
> The kernel complains no "riscv,cbop-block-size" and disables the Zicbop
> extension. Add the missing property to keep it functional.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size property
      https://github.com/sophgo/linux/commit/b8518378ffd3469b5ba871ee0210b3c16de45d66

Thanks,
Inochi

