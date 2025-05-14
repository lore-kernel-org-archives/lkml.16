Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151951DE4CC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235520; cv=none; b=jiS6Vml19VK0mxRzJnMxTjLl2X09gS/rsAdc0n6epAOBhhZRCBTPIy582KB3xfqkuvxfOmZBMtL7aBxAYGs9q2Yj2tnekzb20Z0W2o3VdzveK/GM4t8PrJJlQuoXMoukbU7GpMxm1y3URtiRD35nbpnJAqGvMOn6VUhYENxXFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235520; c=relaxed/simple;
	bh=awf475v5L8HDJn+JWb3kNXX4Vy1fIT4q517NqJ8iR48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KoEzURl0QwNvR39MPO4jXo/b6EZfS8NS/HwKEpEJZDy7FWfJYsJSK66eChIwZpgHSv7ZYIXTNCUkOPULDZ72SxiGuYKWFaA8X+oKkVy1F8enLR3s49J8NXZj6Y/K90Wc0MigfvRE5/Z33EGAAm271ox0lW37ai3CedF4ruiSYSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTRXw+6g; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTRXw+6g"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30a8cbddce3so6149609a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235517; x=1747840317; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=awf475v5L8HDJn+JWb3kNXX4Vy1fIT4q517NqJ8iR48=;
        b=lTRXw+6gte7jBswlCfPRgNoifOY3aelYkeX+D0W+eUSHEEUG3mMDUJzRN9h+l0WctY
         Op58L0iFZeHUTXYIiLamWGPuCAIEpp9YbWMF8S9vlBU7b2Y3vyrbFOJsn38Sb4/OdO+I
         N5N4O+CpFPoFht3Cbktutaxhjkan5MfSVhiyE/Kg/zBC6mFG4xOtPkLe60vB7fk2PDva
         34Vy9wJHUtag4TbvmW4fykGzdbwrdN0Zrx0YgS+Of+5CpOtJcqfCGwFGe2sd7bJ28jdN
         M7X7KNS/Beo7tDDY1swD4qicuY4uZ51odZJklhUkdTyTHCQkTWBby9MQHpyVQARrQe86
         61Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235517; x=1747840317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awf475v5L8HDJn+JWb3kNXX4Vy1fIT4q517NqJ8iR48=;
        b=mX+k+3O2bWNJfBSeXilZo0Q9OrkxRzjysQFocL92ihGrEyksPK1+lc2qXFYjoUSrcC
         wI0a2P3NrWbRM5Yy0N4IfumelpAkJGgf52quZ3kxhEGEhMo/lq3isHp+qa22Q/DlemSu
         Fy29mSyuc/lR62Y/ms74r7JVmqviUEu8qa3TM5C5klOeTXZgleZXbBXByI7cdNwg3Jle
         TgCLQZuIBuJnoUY+D6nI/U4y//ajr/5jmHgOB0G1eZahMJj19RCcvOfzI+Pd0eU8uCyZ
         Tbn4V7JgfPl73B/iX6CIr+qISZH1rZno61rGQJWg8tda6o56YMcB3/ZrrHy27wf6fkCz
         D7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjhmHBCcJIH+KXhv1e4rfJjThaKnet+xpbDmb//ED9fakIazpXSwRJVtdhbO0Rd1giTjXZJT9RbvbB0oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiXskjidm562h1qFpPINQc8EUqjtcZ2yUA8LsurXGmIQ5VdBTp
	/DdMxtlw2EB7tRgeA3AnAEHma65gknawS1EnZPch/fGxFwF7g1LJhQS58wq0L+bPay5A1gbOBfm
	C3ZnhtHsbMIcNt1HoTjFY3+eRp/0=
X-Gm-Gg: ASbGncuCWLwsPlBmnvYURp/6rWoW48GDawLk84vXjwO2OpGt6H7n+c/v9gBahmlQc8S
	kHhK/rRlu2F46canGaVcKekjN7Fypsd/9nwI0ejqbaSMHQILWNva3X2Ri6xbGhBuX13BQDg28mE
	iG0IEVuPGJioxWa64Tx/WrHb+BSBeqavQ=
X-Google-Smtp-Source: AGHT+IG09TEsTWXm1xnxST1ljuBFVosFHHQsrHWlF8haqR/5NQMLQklS/TRLbG5xiTpv0w8YGq39f69m/tRRiR/LxVY=
X-Received: by 2002:a17:90b:5305:b0:30e:3834:4be6 with SMTP id
 98e67ed59e1d1-30e38344ce3mr3376184a91.3.1747235517195; Wed, 14 May 2025
 08:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510102130.14710-1-amfernusus@gmail.com> <20250514053802.GA24939@lst.de>
 <CAMraO6-rQsf8T_ocOKbe3yMP+91W=AF6WtRUYVPtNuq43H8qXA@mail.gmail.com> <20250514140738.GA26520@lst.de>
In-Reply-To: <20250514140738.GA26520@lst.de>
From: Ilya Guterman <iliyagutermann@gmail.com>
Date: Thu, 15 May 2025 00:11:21 +0900
X-Gm-Features: AX0GCFuehCtDeRr6vYqnTbOU63IUI5mPaX291tiTRon8_twT5BtCmqjqyV97H2A
Message-ID: <CAMraO6-JdHa-LzNns3TJn7-bzM5LHjB9byovP1q4y9=yt-xigQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/nvme: Add quirks for device 025e:f1ac
To: Christoph Hellwig <hch@lst.de>
Cc: kbusch@kernel.org, axboe@kernel.dk, sagi@grimberg.me, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

my bad, I was sure I added the Signed-off-by tag.
I will submit a new version of the patch.
