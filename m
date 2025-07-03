Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F79F2DBF7C;
	Thu,  3 Jul 2025 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538103; cv=none; b=H4lCDXji0650pEPAL/92Qkq0THHwA+IGs9xWtWRLLLZbCQ/VywRe8OCrLYA146LdzrIxX7leoqRBVz4U8cwYbGxzYa8GztLNE+XgOnET8QcfgpbrMDW7yO9NNMItIE9NFD814v4Huk+Egb9rvNNy37txE5GROLQuzXq9lxwlJqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538103; c=relaxed/simple;
	bh=FGoJPVfwutBWJwGj9qB2xybMR3b6ZeRVmlw88KOQWHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCzPEHhpO64DPkL1DApRJpoV7U8Zw3Qwtjhm9fmVhb31V5o2YCautfwUhkqxgsWYXw7PPlGFCewvV6LWgBY8y1CIAbhGxLKr6hAMKHPnJG68zGFUhttDOO5Tu4QR1gsrb9d5BYpD4y9DB+RPCMMUPxnhrU5PX57HV3QaAJx1AFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF8dXvJA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF8dXvJA"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748e81d37a7so5470869b3a.1;
        Thu, 03 Jul 2025 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538102; x=1752142902; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf3OnllIKy74CmmPzQiN5iB51QA0QlwijmOja/0ll0Q=;
        b=hF8dXvJAdXf1/elj6pTzh3Sm3vUjCA+N8gdROppp67prT++S71fjgtcYau3Xg/Mc7X
         JS1rHLR5P07ZvPf3kli+EIPbKgaFw1dHx+9WNyA7uIBr1bMiv5gpMklv4FppARaaO71B
         I76OO5Ay5AqcFhAh17EtOa7FNTHbxal8DKl9iwJHumzwq/O24fSf3tKYwJ4/DuvvhZFk
         yudvnbVuAbFrpHhvnFecS/0cqHC7VZ4u5csC8LaYjZRrKjZoRf390XvK67pQ33sLaj9p
         Up2TiKIuQnO6QuOd/rFgSWDvii2fkTUqqrUtZkgxauKi2LEPXQjzQKzJDZ5fdkUD8iUi
         1Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538102; x=1752142902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bf3OnllIKy74CmmPzQiN5iB51QA0QlwijmOja/0ll0Q=;
        b=ujvfNWG+iZUJhTOKWzIUTtdqun/gk7aGvV/4bQhhYzvfsSONYNFaA/S27efAAIlD20
         LYxYkLrssm9ygUJoOvK2fJlOqHEVOKCmaOBJcsdUb8mXS6wexChexJ2DJJ+Mcjmep75H
         wVgzcTgsv9Qfrv6p3PuKbgIOkbpab/ty0/WdaadkiO8nNiG40yKwEeitnMMHrd7TpZ2d
         wGunk1p1PFwvewR29p7Fy4u7IOsZgKMm94IzIhJAG0LGiBTb1kbxrb4DQnK9q3HINBqG
         O6wBt6SnYOmo3To+2EzBRJqx3P18eHJ6DLFblxWvs2+lXG6tUS4RQTLojqXGM25saFL3
         3Edw==
X-Forwarded-Encrypted: i=1; AJvYcCUhg+7iZM7c4GnrJvvYWNhCaph7tS/wwGf5n4tWFe/+Sw2wdU1KtDp9P62EHavzdOdz8DUD0xcKKmzM@vger.kernel.org
X-Gm-Message-State: AOJu0YwUXnFLeVBo0/DQiIiMaKqPbzz0eSojP6VFKYlMV2nP3KKiPvuL
	dejIhP2iFPaNy8oeQ2CmoK2W+zFHUO56JVsj5Rb0llEwI0Y8dO4OluOm
X-Gm-Gg: ASbGncvR6L0zAUF/4WByWpjuSSt5QPT7J7TIoAi6mTRRsNrjZ+UZM110MFp1FbJl+ku
	VfZ36POCWomjnRP2IOlMtFYPe0l+D12uJtaRritgWfEly1r51FJ8GchGbG2/U84fkSYHRXlR5Az
	LYTyBxpubvCxgw8JDC266oAv/uo6u00c9nt1qRjWpreRG7ZNp2RI94bWfE+wTpn0AO1bGnpn2T7
	OirpvOzHDos3nBWJoFnpJhQLZjiqv9cQy8Sww+k90yspHuAtQ18m6Oeco7S4OoU4n/7PcxMoUJD
	GnamRon6kSc99uAPWy2ArqJJiQdcUS/faALkxb9qWIYTp7vKH0k9evCsp31aYg==
X-Google-Smtp-Source: AGHT+IGq73HxNPtEVSnp5azdraH+JoXEP6E2e3ILYaUPK7FTlIC70puJ7IGvGTsd2cf9o9WMfsGxwA==
X-Received: by 2002:a05:6a00:3cd2:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-74c997fd590mr3720134b3a.1.1751538101662;
        Thu, 03 Jul 2025 03:21:41 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af541b6e5sm15788469b3a.43.2025.07.03.03.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:21:41 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:21:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yuntao Dai <d1581209858@live.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Question for CV1800 mailbox users series SoC
Message-ID: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As I have seen you take the mailbox driver for CV1800, I wonder
if you have developed the driver for the 8051 core on the CV1800
system? 

Regards,
Inochi
