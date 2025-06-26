Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894F2E4260
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944939; cv=none; b=JhHXcH6sMF/lfy8mQmFRWdMACnFmY0CrTuTA2D4Kf8KVD+T4AMYzqfoaT50aQfB2Ihok2OClt2zDGE2P/hxfSTz3TbKg+lBl9oIIRm7xxFeJDPIxjvfLt4fBf6IlqiAGVUIQ/keNcKRN2K+koQFKK1L5LLM7kw4iY2mOi2l+gKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944939; c=relaxed/simple;
	bh=1UbVy/RYpG9ong/Mdlmi033HkEmNEofwguj2VKz77OM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lgk2L9YEs/JPSaVIhNtmfRJ0qIPt/pT52eBti/YtGog2g6tzWiQr+bD3fCBY4xns44EoxRr1h0QyfYOatCuyUTDUTDPspBpLyR2iQxvcaZrRHkEr8r7V3XfajM48LWi+rQvOmme7wl5oqiIXWkktOFVrcg0eTP88HuFEB/xWFyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=1MdL3vaH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="1MdL3vaH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23636167afeso10729205ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750944937; x=1751549737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5FkoSkJCzwjOUrZnCicv7j2S+UOLKD4I0+5496OYCs=;
        b=1MdL3vaHDPhAfN4GjpaHewVIpYLE421w97vFJprC3fyv7CNSoqvc8y0nfOyz8y8too
         pHBNjTawQjW5vDycLRXcG56Ol3oR3dFl40tI31Y51hMGUR4Oo26BzcnV2CXUXKSgMjc8
         XSzxhDwjToxfNl7BmJvPlTcCfQQkjrRsRAH8d4FJnvTfJ6D9Z1k5XVwJh4bLl+i7tiL1
         k1jU8s7lV5aqedYf3cFruW+AGQyPq47NPQlWAJuWHa/prun8DXTjS3BT1V5rsOFNHkj1
         SmQI5M1fRaVxZc0/O4jUC+DhDC1aBvVoWjTjogjWnPtm7MyTQl1APT5DGKFpZYnns/zl
         KAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944937; x=1751549737;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5FkoSkJCzwjOUrZnCicv7j2S+UOLKD4I0+5496OYCs=;
        b=JrZDAkV9qmeaxuFkVS9eeUv0FE6viRslwL5WPWhHgs4Urv/ypP7WDTlRn/Hg4sCUnU
         zN3ESn8RR2AEj3O2O4mh/ioju5Myl1YTD6X7kBNiqEC0BG5521I3dX1o3et1HoGerW3H
         F6wTB/TpYM2xgNO9cx+EHIcv7x2XrF/73HhIwo7LQHGfTE2VzNGCdz+SNfcUNfACEdBq
         a9K4xGCk31mImkDMD9owAlMVWizj6sdrVejqJPl7GBkCWNpXcqupF0n7JR9NO9gk4nN+
         kLizGnwG0IbuL71kioLK8yTpMAzVGmxleeNoSI3U1aLWnbGoztc3CGrf4T/3FYBbp1sY
         eW2w==
X-Forwarded-Encrypted: i=1; AJvYcCXmW2Fo6jYbROTDV0rKxNFzBarUqzZNRFhIUJ6GZdLEwqBQW22LZXti2erf13ryH0sbRjY1Kb3hUUm/4Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJNP8c0bdxtL10EWFDZSBuH+qN0aiIlYPKZlmg0XJ0meynH5X
	enpI5/fe+De/eHGWKmz+hvJ2f2/FST9ZpCpMCYvrq5HEOWNtqeIQMDkptUhhN8F3x6wajQvkuIP
	0enKw
X-Gm-Gg: ASbGncsYNk6CqB+krBB0wtL6sdG3mKG9UxVAFdo4gCprsVPr4meNJYrBYtKf1jdfW9x
	DrhEcEb5L6EdRGoPFYhQPfrrDcikKH8PXZZJY62J1EiBABJ4P4KAZYRQU1JRjdchMA/ODv8vrNg
	nVaXjLiRD2Q8nCevnby/HvxVZkxmBJ4VcPxWcEycsGe97zJIqiS/Wlj4p+q6BTPfF2O+3x4VbgF
	pgslMvA3TyLNHcTULY7hP3qqwEJJgAcTPZjk8uVupFWtItv/nwNXIh0J3XC5mrC+zskJasvhAhM
	/bcUGZLMUpSyYHb1k4i/XjwEyPNfhUGyYUJtDz7AV+1kOSDYjebcPbp4uiomwjIy
X-Google-Smtp-Source: AGHT+IF5Uf5pf+UNggE64dI/LHtG8EE8QAxrgFSHws8yjCwdfNuacGWJPVN9G1vMDi39wJPuCdtcKw==
X-Received: by 2002:a17:903:350b:b0:237:d192:ac4a with SMTP id d9443c01a7336-238240984c3mr108548585ad.51.1750944937419;
        Thu, 26 Jun 2025 06:35:37 -0700 (PDT)
Received: from [127.0.0.1] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8651b47sm162695205ad.153.2025.06.26.06.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:35:36 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: hare@suse.de, hch@infradead.org, john.g.garry@oracle.com, 
 Yu Kuai <yukuai3@huawei.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 yi.zhang@redhat.com, calvin@wbinvd.org, david@fromorbit.com, 
 yukuai1@huaweicloud.com, yi.zhang@huawei.com, yangerkun@huawei.com, 
 johnny.chenyi@huawei.com
In-Reply-To: <20250626115743.1641443-1-yukuai3@huawei.com>
References: <20250626115743.1641443-1-yukuai3@huawei.com>
Subject: Re: [PATCH v2] block: fix false warning in
 bdev_count_inflight_rw()
Message-Id: <175094493620.208798.522979576401700817.b4-ty@kernel.dk>
Date: Thu, 26 Jun 2025 07:35:36 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Thu, 26 Jun 2025 19:57:43 +0800, Yu Kuai wrote:
> While bdev_count_inflight is interating all cpus, if some IOs are issued
> from traversed cpu and then completed from the cpu that is not traversed
> yet:
> 
> cpu0
> 		cpu1
> 		bdev_count_inflight
> 		 //for_each_possible_cpu
> 		 // cpu0 is 0
> 		 infliht += 0
> // issue a io
> blk_account_io_start
> // cpu0 inflight ++
> 
> [...]

Applied, thanks!

[1/1] block: fix false warning in bdev_count_inflight_rw()
      commit: c007062188d8e402c294117db53a24b2bed2b83f

Best regards,
-- 
Jens Axboe



