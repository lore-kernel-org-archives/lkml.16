Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F63221F0A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223087; cv=none; b=o34IykfSLKbQ5GNSuB3EFMf5s3fMpwfpt2cy71EfzJeQy9ps7yVIboWSL03kX3SuJal3W0q91cCPkeR3jFkZQ98WuffsMenxYX7KFB3F6+opLMbRLzQ89a2dNdfCJhMMUwNmkyE13Cbrs+sshnR7lniqqom51fuuUjGgkZT5sug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223087; c=relaxed/simple;
	bh=CtIPS/hKLdU/F6w3T5VT9pOXUurgZ+Di58tMkLUT3ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p0P2A9uWDbhwHMO5AZTrskXVttMiy2luz6SOGB7U2aT23ObWz0cpdvu55QUn6W7yATiSsOnFr/3mJKjZvUhjYSGgot0NZBsjlxAdAVjlIhzKSHLdkvbNkzA4paAZ9K/74cbaEkx5VaXedK5o8A8JVzOSOFv044sPt1FEoyhC45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hWBzoaGe; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hWBzoaGe"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3da82c6c5d4so43519615ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747223085; x=1747827885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NfGL5UGYpWD1+PtheuzgaQ9BfAKYj3Frz5hjYBHz0M=;
        b=hWBzoaGeM09NFZPa2Z9KE0y9noPgfLA1HHW5AObmqr8WndH3F6x4pV4KbS5CYSDAqX
         sVaEseYogGT7bzEodTlR3iOMveMQsaN/juxlmbwxylAz7jH+l9BUNwkCk0B9JFkm155s
         mA0G/CeubVJ6SY/6kXWt4maShj0lt0i1O2IH5PRgJOxPbkau71+W0mNJ/eEFyW2/zSlw
         sAaG9wjRukaIGja5hVrcED1s4Nby+m0ZF3p6vxVdwL396AFTsfdfF75rqEpsqo4WHKG6
         jg1d+ZfLZZn/c5sk7/7fJYGMdwEXE6VuSWY3ARk3hX3J7xlliJ/urpHDgbVJiMHHByuY
         LmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747223085; x=1747827885;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NfGL5UGYpWD1+PtheuzgaQ9BfAKYj3Frz5hjYBHz0M=;
        b=KNintu/qSgHcmRRaMhSTfQPakMWl/wuUvG0go2aWT/qnBEHqMmOge7taEB2P3ABb1H
         c7L43tyBO5cs4ZvJGF5oTPGE042JavOXJ2soEnT667QNduSIXxMzI3iLfg+sknN/aAyY
         1secyzozQ+ZUmxcjekhO7qUbnc1awjrdKcgtvpGmVQSTAlcXs77J5QPmXoTB/a2ffBmM
         gGBGoej7SuDWq9oH1HZmcRyrd1wS73dGRR87mHdZk3pzkz3AghS6GbJeAKMyvCscXk5M
         GR7WDzWRqWH5Bzc6qvASa+ySo6Mpbq/pz/qOA/LY5hWLxQFozlSsaIaF4bAgYTS+3ZmT
         nIMg==
X-Forwarded-Encrypted: i=1; AJvYcCUrKR+418B7bxfPMpTOZlAj8vucpMdQbyee+HS56eM/wBGsS4YcZk9UDozedt2lDRxSkNqX6v7LfdvHAtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF5iXFyWmPFdgGnIKtAwhX/MZRgGyVGhuK96QsTjGH51V2/ns7
	iFU8NgX9AIAJfQXX7j6Yjg0qxaMxthkp4B8lrDotVqNhBzrGUNnCd3RqBw0hqXYEdQBn9Ckqm5+
	2
X-Gm-Gg: ASbGnctfh/RH53YqFIm/c4dKOHu8+pgybsJf3EumaUIWey5mriuAS07rhUCzxdWZfVO
	9XJKyChOYpt4LfcNykjzDrwLxXFN0OaBDcra4Kg7Ya/9r/UpWZ72j+YeEAqE3HHb9K2ZJPMmLFv
	D+K2Fk3VoK41BdjXPpY9QmU6rsSlOfFmMvmIOHxqALyHCX3NhOLAt3UFzu8qn7N2OBGLccYuju+
	PfquhR40ebPO2yxKax+FbQQjPXj5h4m4bK6Y3joculJP3y0BGa7ChTwOXQQ6DfS5JAxdShB5CGG
	BhKFCpnSuS1lhtjP/owfLyyG1Jiwry030RljKLza92g=
X-Google-Smtp-Source: AGHT+IFj/J89/IEtP0qvOubE/HRqWUhe1V/jh3bBm19Nx9qKHrI0X4MPceNHXOrbKARdcImnJ+G7mQ==
X-Received: by 2002:a05:6e02:2606:b0:3d8:1cba:1854 with SMTP id e9e14a558f8ab-3db6f79a452mr34387775ab.1.1747223085022;
        Wed, 14 May 2025 04:44:45 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e161d47sm33988065ab.62.2025.05.14.04.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:44:44 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>, 
 John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org, 
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20250514065513.463941-1-lukas.bulwahn@redhat.com>
References: <20250514065513.463941-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] block: Remove obsolete configs BLK_MQ_{PCI,VIRTIO}
Message-Id: <174722308378.101960.14079135866679670041.b4-ty@kernel.dk>
Date: Wed, 14 May 2025 05:44:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Wed, 14 May 2025 08:55:13 +0200, Lukas Bulwahn wrote:
> Commit 9bc1e897a821 ("blk-mq: remove unused queue mapping helpers") makes
> the two config options, BLK_MQ_PCI and BLK_MQ_VIRTIO, have no remaining
> effect.
> 
> Remove the two obsolete config options.
> 
> 
> [...]

Applied, thanks!

[1/1] block: Remove obsolete configs BLK_MQ_{PCI,VIRTIO}
      commit: 1e332795d00655305cf0ae40be4e2eaa9a399d79

Best regards,
-- 
Jens Axboe



