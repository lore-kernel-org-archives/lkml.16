Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB872605
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387460; cv=none; b=YqosN/rllr8oBZOkjk11k+Cm6yAhOP+y7eUBhiik+0tF6fwcIE9QPu62rnhBM+/Uf7JwXMVsOlE6X3cBaiCu9OYXgqkqgpAm7x6BFUkdseRM4mMfbait9chAHvQ31kc5Hpysc/ibidpDKnmhhVagOGj3LF1OzQf/Z3xbDh7Urd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387460; c=relaxed/simple;
	bh=ccu6doF606i3anOKp0WzDRUWJMLOrwaZM1RVrtVnpd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KtPZSik0wWhmUFVy2YwrzQNjT3s3dH3TzQ8lssEHtrS4Zbs1IlG6w+ZUtQ/qYvgqIgb2pza/nIML9r0L0ULyjVrHQYec7K+n51N+okfYqDIXxJbskjtWK1k+/WUgl89ZbEKArEYerO/dhHbxz0b696GSF0qXVKUblePbqJ1o418=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Zlcos8GL; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Zlcos8GL"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2e9071e3706so2257283fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751387458; x=1751992258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M+2FNWnu3aI1hBbZInqVaj9v9ytsHBTZW74r6v2b6BM=;
        b=Zlcos8GLVNTnx4j4NTQGjLQCCy25FLNv3qZ51Blkgf2mcPXDOqVEdCy+wk0iuv0jg4
         3+JyRIy9MicuitQ/0fJ9m0/i7K4yj4NHsEc2E5qWUMYBwF2DwV/Nm5SxDNVZQVPia/sU
         jtPOw6Qb37ugE5lNjCiHt+FsDTVuyYkjLFcePoB/Ycg8EwVFjIsqCZDdRncoDVLzw1M8
         osOM62dZYxtGKeDDX1Y7R9+sG54+3QT/GVGshP6IlR33e0payMLWIdahzFM3dxajGBYz
         0R95u7LH11hvTW/L2Jh254AUWABDKbim+yEX8zkskzO2MsjsJoXMWYvnyv2Qmyr8Q0HM
         KdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387458; x=1751992258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+2FNWnu3aI1hBbZInqVaj9v9ytsHBTZW74r6v2b6BM=;
        b=KCsR25a+WBrBbpj6Mfe82jYP7bwpML4YWJJouIU4kX5PrHC00SmsomoYzjTPzGELG1
         4tTlm0FaLp95GMhZaNXxeFJOn1znAJhd83CFCSKtTCnRsF5iDW02cJd0qc2F5ENPdgya
         zomy+60tTENhdM8PSUYsxkJkawpJwcAhu0TR3xbemUKOW/xO0Scux/cm0J8vNOZeTiFx
         X1P7ZOjYPDMqeO9wt//sdWB3Rqqo7BsdZ3VLxdqqB5Sjy4yDLTWi0HTCWnsbLKuYdPvx
         9quCYWdsOF9zajhWKc8Mn0Il9vh5v0GuAsbe0tlIWVXPsu/7yFgiMVS9h0BbdyXRWcR+
         ZHsw==
X-Forwarded-Encrypted: i=1; AJvYcCXo7sCPNB/dF7NnFrApoOik9fAVDBgwqV5CV22HGQUs+DCzcrp5UMO35vbrkLJnpvTLQPxCdit799JBHa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0p0iMTbKG2Lq70KV5pb9z0Zjjy1Ga9MV+/OX/LP1kIJgQe8EP
	3uGkkys9tpfUP1iO188wcmFNRsKouy7vJSXlU8tdT50xkzweMr7kgR7n7LS2sApz1wg=
X-Gm-Gg: ASbGncuWAJct31UWXLa/YzuRVm6aqVHQ607bAX7QWIpB2zQQ20SxDMxwUAl4LFHhgxZ
	YBlZ/iBfWzdplFgdrj2kUFPtrB4AZ/aK/SChCMye4I+QjUPRNpyLC1hzx7nka20H0jizOFSl0/G
	HCfRt60+tQS8FxPQLSo0I4IVtzRi2pSjGpybcUZCpZwrvvBrD4JdXt6Jg0TL/eVTrmJQWaNLId4
	Dla7bOtIfHnvP70sd1YjvE9V0k9ja+z4gMPN5AL5+WUAoKo+3FSNQr8t/VAL+M/J5LVwdh/0YjS
	+pt04TYl67ltyykcp//MV2XhBiqi30z7RaO3K27PbR04+12SfLMvBBDtyA==
X-Google-Smtp-Source: AGHT+IGpJPyYM9iqExtSNLl1uBdGovogEv7fqGqaODKiiDJ0yDkdIcICzEP0BIRa0y/5LYk6VTWJoA==
X-Received: by 2002:a05:6870:3116:b0:2c2:3ae9:5b9c with SMTP id 586e51a60fabf-2efed453acamr14111876fac.2.1751387457693;
        Tue, 01 Jul 2025 09:30:57 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a8b6aasm2515673173.92.2025.07.01.09.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:30:56 -0700 (PDT)
Message-ID: <20f07b3b-194a-4dfe-936e-0f159bf44485@kernel.dk>
Date: Tue, 1 Jul 2025 10:30:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird delay introduced in v6.16-rc only, possible regression
To: Qu Wenruo <quwenruo.btrfs@gmx.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <e597d8c6-ed77-47ae-b030-1016727d6abe@gmx.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <e597d8c6-ed77-47ae-b030-1016727d6abe@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/25 3:45 PM, Qu Wenruo wrote:
> Hi,
> 
> Recently I'm hitting a very weird delay when doing development inside a x86_64 VM.
> 
> The dmesg shows the delay (10+ sec) between virtio blk and device-mapper:
> 
> [    3.651377] virtio_blk virtio4: 10/0/0 default/read/poll queues
> [    3.653075] virtio_scsi virtio2: 10/0/0 default/read/poll queues
> [    3.670269] virtio_blk virtio4: [vda] 83886080 512-byte logical blocks (42.9 GB/40.0 GiB)
> [    3.672096] scsi host6: Virtio SCSI HBA
> [    3.708452]  vda: vda1 vda2
> [    3.711073] virtio_blk virtio5: 10/0/0 default/read/poll queues
> [    3.729879] virtio_blk virtio5: [vdb] 167772160 512-byte logical blocks (85.9 GB/80.0 GiB)
> [    3.737535] virtio_blk virtio8: 10/0/0 default/read/poll queues
> [    3.747045] virtio_blk virtio8: [vdc] 83886080 512-byte logical blocks (42.9 GB/40.0 GiB)
> [   17.453833] device-mapper: uevent: version 1.0.3
> [   17.455689] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
> :: performing fsck on '/dev/os/root'
> /dev/mapper/os-root: clean, 240299/1048576 files, 3372218/4194304 blocks
> :: mounting '/dev/os/root' on real root
> [   17.871671] EXT4-fs (dm-0): mounted filesystem 00a85626-d289-4817-8183-ee828e221f76 r/w with ordered data mode. Quota mode: none.
> 
> The VM is running kernel based on upstream commit 78f4e737a53e ("Merge tag 'for-6.16/dm-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm"), with a lot of extra btrfs patches.
> 
> 
> The v6.15 kernel from Archlinux is totally fine without any delay.
> 
> The v6.16-rc kernel may have some different configs, but the config is used for a long long time, way before v6.15, so it looks like it's something in the v6.16 cycle causing problems.
> 
> I can definitely do a bisection, but any clue would be appreciated.

Probably a good idea to go ahead with a bisect to help pin it down.

-- 
Jens Axboe
