Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADECA1B4132
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655606; cv=none; b=F0jJSMoXjJZdzDmCe5D6u0KiRlSBruvvxWbcmiQNGcAy+bR33QZRze0zm4Ka6ZvfmbmRxvR8pcXrphXyn47poX/OtuH09GQqxmi97PuqYKhlnYVKNFetA7ndzx82tTdY2QOik7KgXQkHo6jwSVGVy31hcwQrA6w8j0J6ndo6C6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655606; c=relaxed/simple;
	bh=Zclb6nP9tKkJil/hrncF8At7GwOesOJIVfldb1hH5Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FT/QUApoMcNus9KxDqyXCbpVRU15iJYCmuXTJ1nwWw28cHJTZiIeH2RRvQtaI+VCxlck1/VDwmXMQjW/cAKqO6DWaULqRq6yLRAqUjJwfH3eZJq0YEAKf/CPlzy4t5HnovKM950QZfGuCbFle3UtGJnb+PsbPeElwOMTAtqGpa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=E8VFAdOT; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="E8VFAdOT"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86a55400875so603880639f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749655604; x=1750260404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25gqdr8OB8B8YYkPUeyMN7WbLBqsy7NImg1t9TKxdME=;
        b=E8VFAdOTu+z7NAH3Y9NFWPox06EIuHK/dw3gj7rHm+qecwZF01BLOFMRbYXcDDNVDv
         YO9fn5kdmEku+d8ANek+tYGF3vb7h1wN/Hfy2Zj/vzHCCysf+WqoVGLz0miCgGaGOhQC
         tpoiFMhp4uiHzIZtrd6JtKxPBfaY50y+s53WotNLrwzkhY5+pg47NGs0bKnd3XWmuYZ3
         mesEXznMEeAGV8devH5qRRaH1M7DUDpEkhc4KjDXPmvOBbYEfTFyicgRFwtFyM1kw3tx
         kMhoJvPIAV1odxZKkslbZRSZgnOfMsQR3alnr5hM5/1yf7pvn2Ik1arzmoJEPOD3mW8C
         EziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655604; x=1750260404;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25gqdr8OB8B8YYkPUeyMN7WbLBqsy7NImg1t9TKxdME=;
        b=GcQUlPKcKvm9QwmlycZMuVNOlO36QB8FUaMC6dBy3I7szi1HY0Z+ffZL2ZHY6KalHA
         GqUrnqCTUjhJSC85jny6ueK+OMv31MJPKIN6NZkmcXuqz9deqb4SKf3ZIA9MyxyI1IpB
         70+fFVcaBgvBlado4w+84VxM9O4INCct3gnXIu7/gCPrb0rxM6wH+Kg8cPAejWdLoHoG
         znCPdfjEQIr6P5+txiZ0zhVNJtViNAq//odRYWIMDKPGrWFiTSQ42a5zUnQk1nl7OIBN
         6jmCbP98YMmaBoijDug1b6FZBE2DmbaF42fYOyUOvRBFOz6ZmhwG2JrDvarstkx08lxG
         J0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIhTLEsUIWgr/iV0/cl1fP3/hQsYRxK8kp8nZj2PU5M2+p2pBwhdN0uYuCEnftaGMm5l3G3lPY47esSCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZQu/JkVw8QfN5/kzMmmOE751BcC+gJb2OD2dz4akhDAFWL+6F
	Va4gLIY0OARipLK/Vz/f1SsuZXv0rxBADrFVsosiWsjzf9XuCZ5Pxim6SBetczusn4Q=
X-Gm-Gg: ASbGnctsex5g381WKBjoWArGCvLZ4gzN6ADcv7a1J3tJRElf6dLGD2CaLCby+R5SirQ
	SWR+C+c5aDz4gpc5mayqCrR0E/0bjTHvS3JE1A/StNCQZcOCiIwMJHT1iqg06DliHyCZISLoFj4
	+TGfXtcT2rOPr68UvnsFkBo8yHvmIGaBj5vkqRgs8pcrwTR5AaIE3SwFW5hRGZ3p4W8+1ZJpRlg
	0e3FLH7bi7TcVYXgRFCfL3KW2ayn8+4f3KZPTZw+Riu/VcRGSrDMF5C9uXpB9XanJj2e2y2HNfm
	N80iWKmtih0Bm3wSZp0iKVSaXSsg3MbG9xDckOaU0pIb12IcsnspTuIm9Q==
X-Google-Smtp-Source: AGHT+IHaxfT+O57Vn8979jdX84yGSFMet3prL9YRAAW17QgstqoINM/JBUR9h2E/1+qlZME9XacRsQ==
X-Received: by 2002:a05:6602:36ce:b0:85a:e279:1ed6 with SMTP id ca18e2360f4ac-875bc472084mr439890139f.11.1749655603849;
        Wed, 11 Jun 2025 08:26:43 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875bc5b4294sm44276539f.14.2025.06.11.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:26:43 -0700 (PDT)
Message-ID: <afb8792b-a78d-4886-bf9a-23121510dec5@kernel.dk>
Date: Wed, 11 Jun 2025 09:26:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "block: don't reorder requests in
 blk_add_rq_to_plug"
To: Ming Lei <ming.lei@redhat.com>,
 Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
Cc: stable@vger.kernel.org, kernel test robot <oliver.sang@intel.com>,
 Hagar Hemdan <hagarhem@amazon.com>, Shaoying Xu <shaoyi@amazon.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
References: <20250611121626.7252-1-abuehaze@amazon.com>
 <aEmcZLGtQFWMDDXZ@fedora>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <aEmcZLGtQFWMDDXZ@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/25 9:10 AM, Ming Lei wrote:
> On Wed, Jun 11, 2025 at 12:14:54PM +0000, Hazem Mohamed Abuelfotoh wrote:
>> This reverts commit e70c301faece15b618e54b613b1fd6ece3dd05b4.
>>
>> Commit <e70c301faece> ("block: don't reorder requests in
>> blk_add_rq_to_plug") reversed how requests are stored in the blk_plug
>> list, this had significant impact on bio merging with requests exist on
>> the plug list. This impact has been reported in [1] and could easily be
>> reproducible using 4k randwrite fio benchmark on an NVME based SSD without
>> having any filesystem on the disk.
>>
>> My benchmark is:
>>
>>     fio --time_based --name=benchmark --size=50G --rw=randwrite \
>> 	--runtime=60 --filename="/dev/nvme1n1" --ioengine=psync \
>> 	--randrepeat=0 --iodepth=1 --fsync=64 --invalidate=1 \
>> 	--verify=0 --verify_fatal=0 --blocksize=4k --numjobs=4 \
>> 	--group_reporting
>>
>> On 1.9TiB SSD(180K Max IOPS) attached to i3.16xlarge AWS EC2 instance.
>>
>> Kernel        |  fio (B.W MiB/sec)  | I/O size (iostat)
>> --------------+---------------------+--------------------
>> 6.15.1        |   362               |  2KiB
>> 6.15.1+revert |   660 (+82%)        |  4KiB
>> --------------+---------------------+--------------------
> 
> I just run one quick test in my test VM, but can't reproduce it.
> 
> Also be curious, why does writeback produce so many 2KiB bios?

I was pondering that too, sounds like a misconfiguration of sorts. But
even without that, in a quick synthetic test here locally, I do see a
lot of missed merges that is solved with the alternative patch I sent
out. I strongly suspect it'll fix this issue too.

-- 
Jens Axboe
