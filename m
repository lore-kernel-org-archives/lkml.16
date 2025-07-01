Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB312797BE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387404; cv=none; b=MRj25xfQ+IzCQXCLRSHzH1b+MnpB7Gb0XbZvyRACCDZyPApz44sSU96DfHhOlTu8vYg2cic/KT2o2mES6/pdrr8hHJOzsSnG02tXYPljcuXxM3OoCMpOSYAcGShG55WTPoIbWmo0uo/ca+VxCdaMrHbQR7VGxMZEMgn6UIelzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387404; c=relaxed/simple;
	bh=wFrxDDlw3PMnJ84pTpU3+oamjHqaLYc4WDE2gz4FccE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=en8ewC8ixdMvR7Kak1Rq4/VggANOYlthNsaEjQhRE8E3HLPbuttq0u6vQ69tpo2j+Cr9jy6/Laa+MrZ9AlZ7WD49FGJepCvVNADAGurk2pstCm2w3dbnYNYAsFU1nwqppTSMETpCvrsEZ3Bec5CEaw4ONHfB9MJ1oSg2NVFmL7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=09fs6eb5; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="09fs6eb5"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86cf3dd8c97so306195139f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751387401; x=1751992201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crWwaD/7GgCUUFcWT/Llkm7dN9wwCuiLb/qh9BwJGxc=;
        b=09fs6eb5exlgCRMXs4yv7qhEYiWG/hZ5FcH/x0fmWbkI8uuqVC0MbFRBqfJwLxpRh4
         hvhQUw9cMVFTY6ocKF5kXNp9HmbCp+f4MU4QRW1ql8X1ppZVntgtBpVZrlB4oWKkUdxp
         Ze4b/LURH6iRi/eXuK7FgsVm+Xja4ONJaLnontXBtmmRp1yn1coXOHmEU71tKLw5C/jU
         8TkGU4HWKoIbkrXBuVtEhZksV21wbDiw89Y0tfPK7cOc1D50aDnAyMkEVwVapzIvw7Ra
         vetnL5bDRNo8eCl2eP/Zs5AnTlWIn1hSsnWJbWnq8ZMdra1vyD7HsmIy12PTtO8LbPR/
         VOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387401; x=1751992201;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crWwaD/7GgCUUFcWT/Llkm7dN9wwCuiLb/qh9BwJGxc=;
        b=F0X8cCmAx2wvq4hCyMd/R8auOWhitit3ByMT6M1ZQV26qzQfNYniOly2tKbUdOMQOt
         +ExOKdbfxTK9dmNHembSilihfniP9spA1W2cx3UFiJ6zgQI/KdaZEeGGzKS7VZVYrJS4
         C5TErZHRWIAUfgOaPrLDe2yAWbzMenPE6Ll4aXhF65i+XKRFC5tfrNl99BA25ks+BNYM
         oqIAIqCZW9rG5NlVLsvGhPD6UtgyTRZ/aOAjWd7YO4q0J18D4D5Z6bAVGnCCeiwCCs3F
         YZBJq68YRgohHcXBsvVOtFtnn+0MIYsjvw6FBNmXwNLCLwcz44Fv+s/a7u1drqs/n3Qa
         GhcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxQ3PtZ/rVEacluTbN3v8DuDbkaSdFeOSOI+oZnmHQ7ez1qXQemVDNDKFw+/y11OGDb/uGZsNMdO3mMbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1KJZCq2XS2pC2ZkRY7yTUxb/fb6MZPcHEl3XQqPA9m+0LJrg
	6Go56uWtXqIVj5nwC9c3S1Wst30QtGdKemAHx7BF475vYAExk9CtM7MfkzEvHHwd94c=
X-Gm-Gg: ASbGncviaCZ9yJZ50vwgGTf8lq+gfNPvzrDv354C0Zi2SKGzrMSrlhbcMsleA2XU/PP
	bS+FnduPVa9GefAsLbM0btU20UdUCauKgsfTr3ri+W6hbvjwAi05HDB6LMrjYXMt5Tz1vJCj7d5
	AA1RuQqteGGQgbDMif2HNohK0ZIbimVdDiLdn5qh0AOf44NZcZXiXeehEJdmJAJEQmSdOcRUfeQ
	icc0ywQGUfMzq/OqCT8w4NW4dve5DhMNp4EXGsLHOaHAjPLQOtWR5Cvj54mpqxgb8XMCNTHObJc
	vm2/Z3qiqggL48wtO+JTtc2scbq436MBPr8e9GhoIX08bVsYCGQiG/+N9pbHGQM=
X-Google-Smtp-Source: AGHT+IGmszV/ckQKjI/KgjT/UrAo+IhSsGcXQNmla80uKgIibrMYCCf4LgGCWJe7gTvyQW/Kg7z8dQ==
X-Received: by 2002:a05:6602:2b8c:b0:864:4aa2:d796 with SMTP id ca18e2360f4ac-876882fbadcmr2169640839f.8.1751387401311;
        Tue, 01 Jul 2025 09:30:01 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87687b0d3fbsm236096439f.39.2025.07.01.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:30:00 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>, Daniel Wagner <wagi@kernel.org>
Cc: Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Costa Shulyupin <costa.shul@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <llong@redhat.com>, 
 Ming Lei <ming.lei@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, 
 Hannes Reinecke <hare@suse.de>, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org, 
 megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
 storagedev@microchip.com, virtualization@lists.linux.dev, 
 GR-QLogic-Storage-Upstream@marvell.com
In-Reply-To: <20250617-isolcpus-queue-counters-v1-0-13923686b54b@kernel.org>
References: <20250617-isolcpus-queue-counters-v1-0-13923686b54b@kernel.org>
Subject: Re: [PATCH 0/5] blk: introduce block layer helpers to calculate
 num of queues
Message-Id: <175138739958.350817.18365520328662376034.b4-ty@kernel.dk>
Date: Tue, 01 Jul 2025 10:29:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Tue, 17 Jun 2025 15:43:22 +0200, Daniel Wagner wrote:
> I am still working on the change request for the "blk: honor isolcpus
> configuration" series [1]. Teaching group_cpus_evenly to use the
> housekeeping mask depending on the context is not a trivial change.
> 
> The first part of the series has already been reviewed and doesn't
> contain any controversial changes, so let's get them processed
> independely.
> 
> [...]

Applied, thanks!

[1/5] lib/group_cpus: Let group_cpu_evenly() return the number of initialized masks
      commit: b6139a6abf673029008f80d42abd3848d80a9108
[2/5] blk-mq: add number of queue calc helper
      commit: 3f27c1de5df265f9d8edf0cc5d75dc92e328484a
[3/5] nvme-pci: use block layer helpers to calculate num of queues
      commit: 4082c98c1fefd276b34ba411ac59c50b336dfbb1
[4/5] scsi: use block layer helpers to calculate num of queues
      commit: 94970cfb5f10ea381df8c402d36c5023765599da
[5/5] virtio: blk/scsi: use block layer helpers to calculate num of queues
      commit: 0a50ed0574ffe853f15c3430794b5439b2e6150a

Best regards,
-- 
Jens Axboe



